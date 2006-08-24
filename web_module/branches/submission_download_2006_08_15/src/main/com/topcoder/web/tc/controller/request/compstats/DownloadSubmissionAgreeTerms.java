/*
 * CompContestDetails.java
 *
 * Created on July 27, 2005
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocal;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class DownloadSubmissionAgreeTerms extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            String projId = getRequest().getParameter(Constants.PROJECT_ID);
            String coderId = getRequest().getParameter(Constants.CODER_ID);

            log.debug("will create terms of use: " +  Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID);
            
            UserTermsOfUseLocal userTerms = (UserTermsOfUseLocal) createLocalEJB(getInitialContext(), UserTermsOfUse.class);
            userTerms.createUserTermsOfUse(getUser().getId(), Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);

            /*
            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=DownloadSubmission&" + 
            		Constants.PROJECT_ID + "=" + projId + "&" +
            		Constants.CODER_ID + "=" + coderId);
            		
            setIsNextPageInContext(false);*/
            
            setNextPage("compstats/download_submission");
            getRequest().setAttribute(Constants.PROJECT_ID, projId);
            getRequest().setAttribute(Constants.CODER_ID, coderId);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    

}
