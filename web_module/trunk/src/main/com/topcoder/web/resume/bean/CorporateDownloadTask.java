package com.topcoder.web.resume.bean;

import com.topcoder.web.resume.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.web.resume.common.Constants;
import com.topcoder.web.tces.bean.Authentication;

import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import javax.naming.Context;

public class CorporateDownloadTask extends ResumeTask{
    private Resume resume = null;
    private static Logger log = Logger.getLogger(CorporateDownloadTask.class);
    private int userId = -1;

    public CorporateDownloadTask() throws ResumeTaskException{
        super();
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);

        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not logged in, can't download a file.");
            throw new Exception("User not logged in, can't download a file.");
        } else {
            userId = Authentication.userLoggedIn(session);
        }
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
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
        Context context = null;
        try{
            context = super.getInitialContext();
            ResumeServicesHome resumeServicesHome =
                    (ResumeServicesHome) context.lookup(ApplicationServer.RESUME_SERVICES);
            ResumeServices resumeServices = resumeServicesHome.create();
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
