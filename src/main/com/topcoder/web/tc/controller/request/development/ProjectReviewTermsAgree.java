package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.web.ejb.rboard.RBoardApplication;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.util.DBMS;

/**
 * @author dok
 * Date: Mar 24, 2004
 */
public class ProjectReviewTermsAgree extends ProjectReviewApply {

    protected void applicationProcessing() throws TCWebException {
        try {
            if ("on".equalsIgnoreCase(getRequest().getParameter(Constants.TERMS_AGREE))) {
                UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));
                if (!userTerms.hasTermsOfUse(getUser().getId(),
                        Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                    userTerms.createUserTermsOfUse(getUser().getId(),
                            Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                }

                apply();
                setNextPage("/tc?" + Constants.MODULE_KEY + "=ReviewProjectDetail&" +
                        Constants.PROJECT_ID + "=" + projectId + "&" + Constants.PHASE_ID + "=" + phaseId);
                setIsNextPageInContext(false);
            } else {
                //back to terms page with error message
                addError(Constants.TERMS_AGREE, "You must agree to the terms in order to review a component.");
                setNextPage(Constants.REVIEWER_TERMS);
                setIsNextPageInContext(true);

            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void apply() throws Exception {
        long userId = getUser().getId();
        RBoardApplication rba = (RBoardApplication) createEJB(getInitialContext(), RBoardApplication.class);

        //todo wrap in a transaction
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
