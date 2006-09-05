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
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
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
 * <p/>
 * Version 1.0.2 Change notes:
 * <ol>
 * <li>
 * Transaction management moved into RBoardApplication EJB.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.0.2
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

                applicationProcessing((Timestamp) detail.getItem(0, "opens_on").getResultData(), reviewTypeId);

                // Put the terms text in the request.
                TermsOfUse terms = ((TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class));
                setDefault(Constants.TERMS, terms.getText(Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME));
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
}