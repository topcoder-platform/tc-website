package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.rboardapplication.RBoardApplication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;

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

                RBoardApplication rba = (RBoardApplication)createEJB(getInitialContext(), RBoardApplication.class);
                if (rba.exists(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), projectId, phaseId)) {
                    throw new NavigationException("You have already applied to review this project.");
                } else {
                    rba.createRBoardApplication(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), projectId, phaseId);
                    String primary = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG));
                    rba.setPrimary(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(),
                            projectId, phaseId, new Boolean(primary).booleanValue());
                    if (phaseId==SoftwareComponent.DEV_PHASE) {
                        int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));
                        rba.setReviewRespId(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(),projectId, phaseId, reviewTypeId);
                    }
                }
            }

            setNextPage("/tc?"+Constants.MODULE_KEY+"=ReviewProjectDetail&"+
                    Constants.PROJECT_ID+"="+projectId+"&"+Constants.PHASE_ID+"="+phaseId);
            setIsNextPageInContext(false);


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
