package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.*;
import com.topcoder.web.ejb.rboard.RBoardApplication;
import com.topcoder.web.ejb.rboard.RBoardUser;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.rmi.RemoteException;
import java.util.Map;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public class ProjectReviewApply extends Base {

    protected void developmentProcessing() throws TCWebException {
        try {


            long projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            int phaseId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));

            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {

                //todo wrap in a transaction

                RBoardUser rbu = (RBoardUser) createEJB(getInitialContext(), RBoardUser.class);

                boolean hasContract = false;
                try {
                    hasContract = rbu.hasContract(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId);
                } catch (RemoteException e) {
                    //if they don't have a row, then they're not a reviewer
                    if (e.detail instanceof RowNotFoundException) {
                        throw new NavigationException("Sorry, you can not review this " +
                                "project because you are not a reviewer.");
                        //todo it might be nice to tell them which type of review they are not
                    } else {
                        throw e;
                    }
                }

                if (hasContract) {
                    //we'll use the existing command, it's overkill, but we're probably not
                    //talking high volume here
                    Request r = new Request();
                    r.setContentHandle("review_project_detail");
                    r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("pj")));
                    r.setProperty("ph", StringUtils.checkNull(getRequest().getParameter("ph")));
                    Map results = getDataAccess().getData(r);
                    ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
                    int catalog = detail.getIntItem(0, "category_id");

                    if (catalog == Constants.JAVA_CATALOG_ID &&
                            rbu.canReviewJava(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                        apply(getUser().getId(), projectId, phaseId);
                    } else if (catalog == Constants.DOT_NET_CATALOG_ID &&
                            rbu.canReviewDotNet(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                        apply(getUser().getId(), projectId, phaseId);
                    } else {
                        throw new TCWebException("unknown catalog found " + catalog);
                    }
                } else {
                    throw new NavigationException("Sorry, you can not review this " +
                            "project because you do not have a contract.");
                }

            }

            setNextPage("/tc?" + Constants.MODULE_KEY + "=ReviewProjectDetail&" +
                    Constants.PROJECT_ID + "=" + projectId + "&" + Constants.PHASE_ID + "=" + phaseId);
            setIsNextPageInContext(false);


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void apply(long userId, long projectId, int phaseId) throws Exception {
        RBoardApplication rba = (RBoardApplication) createEJB(getInitialContext(), RBoardApplication.class);

        if (rba.exists(DBMS.TCS_OLTP_DATASOURCE_NAME, userId, projectId, phaseId)) {
            throw new NavigationException("You have already applied to review this project.");
        } else {
            rba.createRBoardApplication(DBMS.TCS_OLTP_DATASOURCE_NAME, userId, projectId, phaseId);
            String primary = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG));
            rba.setPrimary(DBMS.TCS_OLTP_DATASOURCE_NAME, userId,
                    projectId, phaseId, new Boolean(primary).booleanValue());
            if (phaseId == SoftwareComponent.DEV_PHASE) {
                int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));
                rba.setReviewRespId(DBMS.TCS_OLTP_DATASOURCE_NAME, userId, projectId, phaseId, reviewTypeId);
            }
        }

    }

}
