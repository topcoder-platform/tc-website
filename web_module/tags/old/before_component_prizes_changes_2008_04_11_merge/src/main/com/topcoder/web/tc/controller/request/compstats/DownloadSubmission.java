package com.topcoder.web.tc.controller.request.compstats;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocal;
import com.topcoder.web.tc.Constants;

/**
 * Download a submission.
 * If the user hasn't agreed to terms, it redirects to download submission terms page, where we'll need to agree to terms.
 *
 * @author cucu
 */
public class DownloadSubmission extends Base {

    protected void businessProcessing() throws TCWebException {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            String projId = getRequest().getParameter(Constants.PROJECT_ID);
            String coderId = getRequest().getParameter(Constants.CODER_ID);

            if (hasAgreedTerms(getUser().getId())) {
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
                    throw new TCWebException("Not exactly one sumbission url found.  Instead, found " + rsc.getRowCount());
                }

                if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
                        if (!canDownload(projId, coderId, rsc.getIntItem(0, "status_id"))) {
                            throw new TCWebException("You don't have permission to download the submission.");                        
                        }
                }
                
                String url = rsc.getStringItem(0, "submission_url");
                String fname = createFileName(url, rsc.getStringItem(0, "handle"),
                        rsc.getStringItem(0, "component_name"), rsc.getStringItem(0, "version_text"));

                downloadFile(url, fname);
            } else {
                getRequest().setAttribute(Constants.PROJECT_ID, projId);
                getRequest().setAttribute(Constants.CODER_ID, coderId);
                getRequest().setAttribute(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
                setNextPage(Constants.DOWNLOAD_SUBMISSION_TERMS);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    
    private ResultSetContainer findProjects(String compId, String versId, String phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("find_projects");

        // Find all the projects that match with the component id, version and phase
        r.setProperty("compid", compId);
        r.setProperty("vr", versId);
        r.setProperty(Constants.PHASE_ID, phaseId);

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        return (ResultSetContainer) result.get("find_projects");
    }

    private boolean canDownload(String projId, String coderId, int statusId) throws Exception {
        
        long userId = getUser().getId();
        
        // you can always download your own submission
        if (coderId.equals("" + userId)) {
            return true;
        }
            
        Request r = new Request();
        r.setContentHandle("comp_contest_details");

        r.setProperty("pj", projId);

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);

        ResultSetContainer projectInfo = (ResultSetContainer) result.get("project_info");
        
        if (projectInfo.getIntItem(0, "category_id") == WebConstants.JAVA_CUSTOM_CATALOG ||
                projectInfo.getIntItem(0, "category_id") == WebConstants.NET_CUSTOM_CATALOG) {
            return false;
        }

        // completed project, can download if it's not custom
        if (statusId == 7) {
            return true;
        }
        
        ResultSetContainer dates = findProjects(projectInfo.getStringItem(0, "component_id"),
                                                projectInfo.getStringItem(0, "version_id"),
                                                projectInfo.getStringItem(0, "phase_id"));
        
        // check if there is a completed or suspended version of the component, if there is it can be downloaded
        for (int i=0; i < dates.size(); i++) {
            if (dates.getIntItem(i,"status_id") == 7 || dates.getIntItem(i,"suspended_ind") == 1) {
                return true;
            }
        }
        
        // if it is a reviewer for the project, he can download any submission
        ResultSetContainer reviewers = (ResultSetContainer) result.get("reviewers_for_project");
        for (int i = 0; i < reviewers.size(); i++) {
            if (reviewers.getLongItem(i, "reviewer_id") == userId) {
                return true;
            }
        }
        

        return false;
    }
    

    private String getContentType(String filename) {
        String ext = "";
        int idxExtension = filename.lastIndexOf(".");
        if (idxExtension != -1) {
            ext = filename.substring(idxExtension, filename.length()).toLowerCase();
        }
        if (ext.equals("jar")) return "application/x-java-archive";
        if (ext.equals("zip")) return "application/x-zip-compressed";
        return "application";
    }

    /**
     * Downloads the specified file.
     *
     * @param systemName The actual file name stored in the server.
     * @param name       the name of the file to retrieve.
     * @throws Exception
     */
    private void downloadFile(String systemName, String name) throws Exception {
        getResponse().addHeader("content-disposition", "inline; filename=\"" + name + "\"");
        getResponse().setContentType(getContentType(name));

        BufferedInputStream is = null;
        try {
            if (systemName.startsWith("file:/")) {
                is = new BufferedInputStream(new FileInputStream(systemName.substring(5)));
            } else {
                throw new TCWebException("Don't know how to handle download for protocol for file " + systemName);
            }

            ServletOutputStream sos = getResponse().getOutputStream();

            int b;
            while ((b = is.read()) >= 0) {
                sos.write(b);
            }
            getResponse().setStatus(HttpServletResponse.SC_OK);
            getResponse().flushBuffer();
        } finally {
            if (is != null) is.close();
        }

    }

    /**
     * Create an appropiate filename.
     *
     * @param url    used to get the extension
     * @param handle coder that submitted
     * @param comp   name of the component
     * @param vers   version of the component
     * @return a file name
     */
    private String createFileName(String url, String handle, String comp, String vers) {
        int p = url.lastIndexOf(".");
        String ext = "";
        if (p >= 0) {
            ext = url.substring(p);
        }

        String name = "submission_" + comp.trim() + "_v" + vers.trim() + "_" + handle.trim() + ext;
        return name.replaceAll("[^\\w\\.]", "_");
    }

    /**
     * Returns whether the user has agreed to terms for downloading submissions.
     *
     * @param id the coder to check
     * @return whether the user has agreed to terms for downloading submissions.
     * @throws Exception
     */
    private boolean hasAgreedTerms(long id) throws Exception {
        UserTermsOfUseLocal userTerms = (UserTermsOfUseLocal) createLocalEJB(getInitialContext(), UserTermsOfUse.class);
        return userTerms.hasTermsOfUse(id, Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
    }


}
