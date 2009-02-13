package com.topcoder.web.resume.bean;

import com.topcoder.web.resume.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.web.resume.common.Constants;

import javax.servlet.http.*;
import javax.naming.Context;
import java.util.Iterator;

public class UploadTask extends ResumeTask{
    private byte file[] = null;
    private int fileType = -1;
    private String fileName = null;
    private int userId = -1;
    private static Logger log = Logger.getLogger(UploadTask.class);

    public void process() throws ResumeTaskException{
        Context context = null;
        try{
            context = super.getInitialContext();
            ResumeServicesHome resumeServicesHome = (ResumeServicesHome)
                    context.lookup(ApplicationServer.RESUME_SERVICES);
            ResumeServices resumeServices = resumeServicesHome.create();
            resumeServices.putResume(userId,fileType, fileName, file);
        }catch(Exception e){
            throw new ResumeTaskException(e);
        }
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        Navigation navigation = (Navigation) session.getAttribute("navigation");
        if (navigation == null || !navigation.getLoggedIn()) {
            log.debug("User not logged in, can't upload a file.");
            throw new Exception("User not logged in, can't upload a file.");
        } else {
             userId = navigation.getUserId();
        }

        UploadedFile uf = null;
        byte[] fileBytes = null;
        try {
            Iterator it = super.getFileUpload().getAllUploadedFiles();
            //only need to worry about a single resume
            if (it.hasNext()) {
                uf = (UploadedFile)it.next();
                log.debug(uf.getContentType());
                if (uf == null) {
                    throw new ResumeTaskException("Empty file uploaded");
                } else {
                    fileBytes = new byte[(int)uf.getSize()];
                    uf.getInputStream().read(fileBytes);
                    fileType = Integer.parseInt(super.getFileUpload().getParameter("fileType"));
                    fileName = uf.getRemoteFileName();
                    file = fileBytes;
                }
            }else{
                throw new ResumeTaskException("No files uploaded");
            }
        } catch(Exception e){
            e.printStackTrace();
            throw new ResumeTaskException(e);
        }
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

    public void processStep(String step) throws Exception {
        Context context = null;
        try{
            context = super.getInitialContext();
            ResumeServicesHome resumeServicesHome = (ResumeServicesHome) context.lookup(ApplicationServer.RESUME_SERVICES);
            ResumeServices resumeServices = resumeServicesHome.create();
            resumeServices.putResume(userId,fileType, fileName, file);
            super.setNextPage(Constants.SUCCESS_PAGE);
        }catch(Exception e){
            throw new ResumeTaskException(e);
        }
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
