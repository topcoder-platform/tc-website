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

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.MemberContact;

import java.util.Map;

/**
 *
 * @author cucu
 */
public class DownloadSubmission extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            String projId = getRequest().getParameter(Constants.PROJECT_ID);
            String coderId = getRequest().getParameter(Constants.CODER_ID);
            String submissionTypeId  = getRequest().getParameter("st");

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            if (hasAgreedTerms(coderId)) {
            	//doDownload
            	setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=CompContestDetails&" +
            			Constants.PROJECT_ID + "=" + projId + "&");
            } else {
                setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=ViewTerms&" + 
                		Constants.PROJECT_ID + "=" + projId + "&" +
                		Constants.CODER_ID + "=" + coderId + "&" +
                		"st=" + submissionTypeId  + "&" +
                		"tu=" + Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID + "&" + 
                		"rm=DownloadSubmission"
                );
            }

            setIsNextPageInContext(false);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    private boolean hasAgreedTerms(String coderId) throws Exception {
	    Request r = new Request();
	    r.setContentHandle("has_agreed_terms");
	
	    // Find all the projects that match with the component id, version and phase
	    r.setProperty(Constants.CODER_ID, coderId);
	    r.setProperty("tu", Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID + "");
	
	    DataAccessInt dai = getDataAccess(true);
	    Map result = dai.getData(r);
	    return ((ResultSetContainer) result.get("has_agreed_terms")).size() > 0;
    }
    



}
