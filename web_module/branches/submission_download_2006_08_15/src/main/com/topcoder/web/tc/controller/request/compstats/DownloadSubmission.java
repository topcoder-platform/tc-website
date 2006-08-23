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

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;

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
            	String url = getSubmissionURL(projId, coderId);
            	log.info("will download: " + url);
            	downloadFile("/export/home/branch2/web/lib/jars/upload.jar", "test.jar");
            	
            	setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=CompContestDetails&" +
            			Constants.PROJECT_ID + "=" + projId + "&");
            	setIsNextPageInContext(false);
            } else {
            	getRequest().setAttribute(Constants.PROJECT_ID, projId);
            	getRequest().setAttribute(Constants.CODER_ID, coderId);            	
            	setNextPage("/compstats/download_submission_terms.jsp");
                setIsNextPageInContext(true);
            }

            

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    private void downloadFile(String systemName, String name) throws Exception {
        getResponse().addHeader("content-disposition", "inline; filename=" + name);
        getResponse().setContentType("application/x-java-archive");
        ServletOutputStream sos = getResponse().getOutputStream();

        FileInputStream fis = new FileInputStream(systemName);

        int b;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
        }
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();    	
    }
    
    private String getSubmissionURL(String projId, String coderId) throws Exception {
        Request r = new Request();
        r.setContentHandle("get_submission_url");

        r.setProperty("pj", projId);
        r.setProperty("cr", coderId);
        r.setProperty("st", "1"); // just initiall submissions

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) result.get("get_submission_url");
        if (rsc.getRowCount() != 1) {
        	throw new TCWebException("Not exaclty one sumbission url found.  Instead, found " + rsc.getRowCount());
        }
        
        return rsc.getStringItem(0, "submission_url");
    }

    private boolean hasAgreedTerms(String coderId) throws Exception {
        UserTermsOfUse userTerms = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
        return userTerms.hasTermsOfUse(getUser().getId(), Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
    }
    



}
