package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.rboard.RBoardApplication;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;

import java.util.Map;

/**
 * @author dok
 * Date: Mar 24, 2004
 */
public class ProjectReviewTermsAgree extends ProjectReviewApply {

    private static Logger log = Logger.getLogger(ProjectReviewTermsAgree.class);

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

        rba.createRBoardApplication(DBMS.TCS_OLTP_DATASOURCE_NAME, userId, projectId, phaseId);
        String primary = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG));
        rba.setPrimary(DBMS.TCS_OLTP_DATASOURCE_NAME, userId,
                projectId, phaseId, new Boolean(primary).booleanValue());
        if (phaseId == SoftwareComponent.DEV_PHASE) {
            int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));
            rba.setReviewRespId(DBMS.TCS_OLTP_DATASOURCE_NAME, userId, projectId, phaseId, reviewTypeId);
        }

        //send email
        Request r = new Request();
        r.setContentHandle("review_project_detail");
        String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));
        String phaseId = StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID));
        r.setProperty(Constants.PROJECT_ID, projectId);
        r.setProperty(Constants.PHASE_ID, phaseId);
        Map results = getDataAccess().getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");

        String component_name = detail.getStringItem(0, "component_name");
        String phase = detail.getStringItem(0, "phase_desc");
        String version = detail.getStringItem(0, "version_text");
        String lang = detail.getStringItem(0, "catalog");

        String handle = getUser().getUserName();

        //lookup pm email
        r = new Request();
        r.setContentHandle("pm_details");
        r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
        results = getDataAccess().getData(r);
        detail = (ResultSetContainer) results.get("pm_details");

        String address = detail.getStringItem(0, "address");
        log.debug("ORIGINAL ADDRESS IS: " + address);

        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("New Review Application");
        StringBuffer sb = new StringBuffer();
        sb.append(handle + " has applied to review:\n\n");
        sb.append("Component: " + component_name + "\n");
        sb.append("Version: " + version + "\n");
        sb.append("Language: " + lang + "\n");
        sb.append("Phase: " + phase + "\n");
        sb.append("http://");
        sb.append(ApplicationServer.SERVER_NAME);
        sb.append("/tc?module=ReviewProjectDetail&");
        sb.append(Constants.PROJECT_ID);
        sb.append("=");
        sb.append(projectId);
        sb.append("&");
        sb.append(Constants.PHASE_ID);
        sb.append("=");
        sb.append(phaseId);
        sb.append("\n");

        mail.setBody(sb.toString());
        mail.setFromAddress("review@topcoder.com");
        //mail.setToAddress("rfairfax@topcoder.com", TCSEmailMessage.TO);
        mail.setToAddress(address, TCSEmailMessage.TO);

        EmailEngine.send(mail);
    }
}