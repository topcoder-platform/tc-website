/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.apps.review.rboard.RBoardApplicationHome;
import com.topcoder.apps.review.rboard.RBoardRegistrationException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;

/**
 * Process the user request to review a component.
 * <p/>
 * <p/>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * RBoard related tasks were moved to a tcs bean.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.0.1
 */
public class ProjectReviewApply extends Base {
    protected long projectId = 0;
    protected int phaseId = 0;
    RBoardApplication rBoardApplication = null;

    protected void developmentProcessing() throws TCWebException {
        try {
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            phaseId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));
            int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));

            if (userIdentified()) {
                //we'll use the existing command, it's overkill, but we're probably not
                //talking high volume here
                Request r = new Request();
                r.setContentHandle("review_project_detail");
                r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
                r.setProperty(Constants.PHASE_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
                Map results = getDataAccess().getData(r);
                ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
                int catalog = detail.getIntItem(0, "category_id");

                rBoardApplication = createRBoardApplication();
                nonTransactionalValidation(catalog, reviewTypeId);
                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                try {
                    if (log.isDebugEnabled()) {
                        log.debug("Begin transaction");
                    }
                    tm.begin();
                    //we're doing this so that we can have something to sync on.  if we don't lock
                    //project, then people get register while we're still doing the selects to determine
                    //if one should be able to register.  both people end up coming up ok to register and we
                    //end up with more than one person in the same slot.
                    //ProjectLocal project = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
                    //project.updateForLock(projectId, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);

                    // The project lock is taken out from the EJB and executed locally, since the JTA transaction wasn't
                    // working right with jdbc within the ejb and the lock of the row was unsuccessfull.

                    updateForLock(projectId, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);

                    applicationProcessing((Timestamp) detail.getItem(0, "opens_on").getResultData(), reviewTypeId);
                    log.debug("going to sleep... 1... ");
                    Thread.sleep(20000);
                    log.debug("going to sleep... 2... ");
                    Thread.sleep(20000);
                    log.debug("going to sleep... 3... ");
                    Thread.sleep(20000);
                    log.debug("going to sleep... 4... ");
                    Thread.sleep(20000);
                    log.debug("going to sleep... 5... ");
                    Thread.sleep(20000);
                    tm.commit();
                    if (log.isDebugEnabled()) {
                        log.debug("Commit transaction");
                    }
                    // Put the terms text in the request.
                    TermsOfUse terms = ((TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class));
                    setDefault(Constants.TERMS, terms.getText(Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        log.debug("Error transaction");
                    }
                    if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                        if (log.isDebugEnabled()) {
                            log.debug("Rollback Transaction");
                        }
                        tm.rollback();
                    }
                    throw e;
                }
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (PermissionException pe) {
            throw pe;
        } catch (RBoardRegistrationException rbre) {
            throw new NavigationException(rbre.getMessage());
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected RBoardApplication createRBoardApplication() throws CreateException {
        InitialContext ctx = null;
        RBoardApplication rBoardApplication = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objRBoardApplication = ctx.lookup(RBoardApplicationHome.class.getName());
            RBoardApplicationHome rBoardApplicationHome =
                    (RBoardApplicationHome) PortableRemoteObject.narrow(objRBoardApplication, RBoardApplicationHome.class);

            rBoardApplication = rBoardApplicationHome.create();
        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        } finally {
            close(ctx);
        }
        return rBoardApplication;
    }

    protected void applicationProcessing(Timestamp opensOn, int reviewTypeId) throws Exception {
        boolean primary = new Boolean(StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG))).booleanValue();
        rBoardApplication.validateUserTrans(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId, getUser().getId(), opensOn, reviewTypeId, primary);

        UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));

        boolean agreed = userTerms.hasTermsOfUse(getUser().getId(),
                Constants.REVIEWER_TERMS_ID, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);

        int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
        getRequest().setAttribute("phase_id", new Integer(phase_id));

        setDefault(Constants.TERMS_AGREE, String.valueOf(agreed));

        setNextPage(Constants.REVIEWER_TERMS);
        setIsNextPageInContext(true);
    }

    protected void nonTransactionalValidation(int catalog, int reviewTypeId) throws Exception {
        rBoardApplication.validateUser(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, catalog, reviewTypeId, getUser().getId(), phaseId);
    }

    private void updateForLock(long projectId, String dataSource) {
        log.debug("lock called on project " + projectId);
        String query = "update project set project_id = project_id where project_id = ? and cur_version = 1";

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query);
            ps.setLong(1, projectId);
            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
        } finally {
            DBMS.close(ps);
            DBMS.close(conn);
            close(ctx);
        }

    }

}