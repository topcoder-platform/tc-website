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

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocal;
import com.topcoder.web.tc.Constants;

/**
 * Downloads a submission.
 * If the user hasn't agreed to terms, it redirects to download submission terms page, where we'll need to agree to terms.
 *  
 * @author cucu
 */
public class DownloadSubmission extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            String projId = getRequest().getParameter(Constants.PROJECT_ID);
            String coderId = getRequest().getParameter(Constants.CODER_ID);

            if (hasAgreedTerms(coderId)) {
            	// get the filename
                Request r = new Request();
                r.setContentHandle("get_submission_url");

                r.setProperty(Constants.PROJECT_ID, projId);
                r.setProperty(Constants.CODER_ID, coderId);
                r.setProperty(Constants.SUBMISSION_TYPE, "1"); // just initiall submissions

                DataAccessInt dai = getDataAccess(true);
                Map result = dai.getData(r);
                ResultSetContainer rsc = (ResultSetContainer) result.get("get_submission_url");
                if (rsc.getRowCount() != 1) {
                	throw new TCWebException("Not exaclty one sumbission url found.  Instead, found " + rsc.getRowCount());
                }
                
                String url = rsc.getStringItem(0, "submission_url");
                String fname = createFileName(url, rsc.getStringItem(0, "handle"), 
                		rsc.getStringItem(0, "component_name"), rsc.getStringItem(0, "version_text"));

            	downloadFile("/export/home/branch2/web/lib/jars/upload.jar", fname);
            } else {
            	getRequest().setAttribute(Constants.PROJECT_ID, projId);
            	getRequest().setAttribute(Constants.CODER_ID, coderId);            	
            	setNextPage(Constants.DOWNLOAD_SUBMISSION_TERMS);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    /**
     * Downloads the specified file.
     * 
     * @param systemName The actual file name stored in the server. 
     * @param name the name of the file to retrieve.
     * @throws Exception
     */
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
    
    /**
     * Create an appropiate filename.
     * 
     * @param url used to get the extension
     * @param handle coder that submitted
     * @param comp name of the component
     * @param vers version of the component
     * @return a file name
     */
    private String createFileName(String url, String handle, String comp, String vers) {
    	int p = url.lastIndexOf(".");
    	String ext = "";
    	if (p >= 0) {
    		ext = url.substring(p);
    	}
    	
    	String name = "submission_" + comp + "_v" + vers + "_" + handle + ext;
    	return name.replaceAll("[^\\w\\.]", "_");
    }

    /**
     * Returns whether the user has agreed to terms for downloading submissions.
     * 
     * @param coderId the coder to check
     * @return whether the user has agreed to terms for downloading submissions.
     * @throws Exception
     */
    private boolean hasAgreedTerms(String coderId) throws Exception {
        UserTermsOfUseLocal userTerms = (UserTermsOfUseLocal) createLocalEJB(getInitialContext(), UserTermsOfUse.class);
        return userTerms.hasTermsOfUse(getUser().getId(), Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
    }
    



}
