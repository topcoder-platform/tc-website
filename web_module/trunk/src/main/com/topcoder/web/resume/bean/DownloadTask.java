package com.topcoder.web.resume.bean;

import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.web.common.BaseProcessor;

import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;

public class DownloadTask extends ResumeTask{
    private Resume resume = null;
    private static Logger log = Logger.getLogger(DownloadTask.class);
    private int userId = -1;

    public DownloadTask() throws ResumeTaskException{
        super();
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        Navigation navigation = (Navigation) session.getAttribute("navigation");
        if (navigation == null || !navigation.getLoggedIn()) {
            log.debug("User not logged in, can't download a file.");
            throw new Exception("User not logged in, can't download a file.");
        } else {
             userId = navigation.getUserId();
        }
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
//        response.setHeader("content-disposition","attachment; filename="+resume.getFileName());
        response.setHeader("content-disposition","inline; filename="+resume.getFileName());
        response.setContentType(resume.getMimeType());
        ServletOutputStream sos = response.getOutputStream();
        sos.write(resume.getFile());
        response.setStatus(HttpServletResponse.SC_OK);
        /* this is not really what i want to do, but i can't think of another
         * way to complete the download without having to forward to another page.
         */
        sos.flush();
        sos.close();
    }

    public void processStep(String step) throws Exception {
        try{
            ResumeServices resumeServices = (ResumeServices)BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            resume = resumeServices.getResume(userId);
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

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

}
