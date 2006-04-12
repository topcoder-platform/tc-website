package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.rboard.RBoardApplication;
import com.topcoder.web.ejb.rboard.RBoardUser;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.common.web.util.DateTime;

import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.sql.Timestamp;

/**
 * @author dok
 *         Date: Feb 12, 2004
 */
public class ProjectReviewApply extends Base {
    // Minimum time that must elapse between applications by the same
    // reviewer (in milliseconds).
    protected static final long APPLICATION_DELAY = 6 * 60 * 60 * 1000;

    protected long projectId = 0;
    protected int phaseId = 0;

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

                nonTransactionalValidation(catalog, reviewTypeId);

                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);

                try {
                    tm.begin();
                    //we're doing this so that we can have something to sync on.  if we don't lock
                    //project, then people get register while we're still doing the selects to determine
                    //if one should be able to register.  both people end up coming up ok to register and we
                    //end up with more than one person in the same slot.
                    ProjectLocal project = (ProjectLocal)createLocalEJB(getInitialContext(), Project.class);
                    project.updateForLock(projectId, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);
                    transactionalValidation((Timestamp) detail.getItem(0, "opens_on").getResultData(), reviewTypeId);
                    applicationProcessing();
                    tm.commit();

                    // Put the terms text in the request.
                    TermsOfUse terms = ((TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class));
                    setDefault(Constants.TERMS, terms.getText(Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                } catch (Exception e) {
                    if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                        tm.rollback();
                    }
                    throw e;
                }
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void applicationProcessing() throws TCWebException {
        try {
            UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));

            boolean agreed = userTerms.hasTermsOfUse(getUser().getId(),
                    Constants.REVIEWER_TERMS_ID, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);

            int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
            getRequest().setAttribute("phase_id", new Integer(phase_id));

            setDefault(Constants.TERMS_AGREE, String.valueOf(agreed));

            setNextPage(Constants.REVIEWER_TERMS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void nonTransactionalValidation(int catalog, int reviewTypeId) throws Exception {
        RBoardUser rbu = (RBoardUser) createEJB(getInitialContext(), RBoardUser.class);
        HashMap reviewRespMap = new HashMap();
        Request rr = new Request();
        rr.setContentHandle("review_resp_info");
        ResultSetContainer rrRsc = (ResultSetContainer) getDataAccess().getData(rr).get("review_resp_info");
        ResultSetContainer.ResultSetRow rsr = null;
        for (Iterator it = rrRsc.iterator(); it.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) it.next();
            reviewRespMap.put(new Integer(rsr.getIntItem("review_resp_id")), new Integer(rsr.getIntItem("phase_id")));
        }


        int status = 0;
        try {
            status = rbu.getStatus(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId);
        } catch (RemoteException e) {
            if (e.detail instanceof RowNotFoundException) {
                throw new NavigationException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
            } else {
                throw e;
            }
        }

        if (status != Constants.ACTIVE_REVIEWER) {
            throw new NavigationException("Sorry, you are not authorized to perform reviews at this time.");
        }

        if (!reviewRespMap.containsKey(new Integer(reviewTypeId)) ||
                !reviewRespMap.get(new Integer(reviewTypeId)).equals(new Integer(phaseId))) {
            throw new NavigationException("Invalid request, incorrect review position specified.");
        }

        try {
            if (catalog == Constants.JAVA_CATALOG_ID || catalog == Constants.CUSTOM_JAVA_CATALOG_ID) {
                if (!rbu.canReviewJava(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                    throw new NavigationException("Sorry, you can not review this project because " +
                            "you are not a Java reviewer");
                }
            } else if (catalog == Constants.DOT_NET_CATALOG_ID || catalog == Constants.CUSTOM_DOT_NET_CATALOG_ID) {
                if (!rbu.canReviewDotNet(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                    throw new NavigationException("Sorry, you can not review this project because " +
                            "you are not a .Net reviewer");
                }
            } else if (catalog == Constants.FLASH_CATALOG_ID) {
                if (!rbu.canReviewFlash(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                    throw new NavigationException("Sorry, you can not review this project because " +
                            "you are not a Flash reviewer");
                }
            } else if (catalog == Constants.APPLICATIONS_CATALOG_ID) {
                if (!rbu.canReviewApplication(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                    throw new NavigationException("Sorry, you can not review this project because " +
                            "you are not a Application reviewer");
                }
            } else {
                throw new TCWebException("unknown catalog found " + catalog);
            }
        } catch (RemoteException e) {
            if (e.detail instanceof RowNotFoundException) {
                throw new NavigationException("Sorry, you are not a reviewer.  Please contact TopCoder if you would like to become one.");
            } else {
                throw e;
            }
        }
    }

    protected void transactionalValidation(Timestamp opensOn, int reviewTypeId) throws Exception {
        RBoardApplication rba = (RBoardApplication) createEJB(getInitialContext(), RBoardApplication.class);

        if (rba.exists(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), projectId, phaseId)) {
            throw new NavigationException("You have already applied to review this project.");
        }

        if (opensOn.getTime() > System.currentTimeMillis()) {
            throw new NavigationException("Sorry, this project is not open for review yet.  "
                    + "You will need to wait until "
                    + DateTime.timeStampToString(opensOn));
        }

        Timestamp lastReviewApp = rba.getLatestReviewApplicationTimestamp(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME,
                getUser().getId());
        if (lastReviewApp != null && System.currentTimeMillis() < lastReviewApp.getTime() + APPLICATION_DELAY)
        {
            throw new NavigationException("Sorry, you can not apply for a new review yet.  "
                    + "You will need to wait until "
                    + DateTime.timeStampToString(new Timestamp(lastReviewApp.getTime() + APPLICATION_DELAY)));
        }

        ResultSetContainer reviewers = rba.getReviewers(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId);

        if (reviewers.size() == 3) {
            throw new NavigationException("Sorry, the project's review positions are already full.");
        }

        boolean primary = new Boolean(StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG))).booleanValue();
        if (primary) {
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("primary_ind") == 1) {
                    throw new NavigationException("Sorry, this review position is already taken.");
                }
            }
        }

        if (phaseId == SoftwareComponent.DEV_PHASE) {
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new NavigationException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 2)) {
                throw new NavigationException("Sorry, there was an error in the application"
                        + " (primary reviewers must be failure reviewers, and vice versa).");
            }
        } else {
            // Design.
            for (Iterator it = reviewers.iterator(); it.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("review_resp_id") == reviewTypeId) {
                    throw new NavigationException("Sorry, this review position is already taken.");
                }
            }
            // If somebody came in by constructing the URL, make sure this is consistent too.
            if (primary != (reviewTypeId == 4)) {
                throw new NavigationException("Sorry, there was an error in the application");
            }
        }
        // If somebody came in by constructing the URL, make sure that there is at least one
        // primary before we run out of spots.
        if (!primary && reviewers.size() == 2) {
            boolean alreadyHasPrimary = false;
            for (Iterator it = reviewers.iterator(); it.hasNext() && !alreadyHasPrimary;) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getIntItem("primary_ind") == 1) {
                    alreadyHasPrimary = true;
                }
            }
            if (!alreadyHasPrimary) {
                throw new NavigationException("Sorry, at least one reviewer must be the primary.");
            }
        }
    }
}