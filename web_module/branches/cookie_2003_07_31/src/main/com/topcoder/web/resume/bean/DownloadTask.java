package com.topcoder.web.resume.bean;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.ejb.resume.ResumeServices;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        BasicAuthentication auth = new BasicAuthentication(
                new SessionPersistor(request.getSession()), request, response);
        if (navigation==null) navigation = new Navigation();
        if (!navigation.isIdentified() && auth.getActiveUser().isAnonymous()) {
            log.debug("User not logged in, can't download a file.");
            throw new Exception("User not logged in, can't download a file.");
        } else {
            if (navigation.isIdentified())
                userId = navigation.getUserId();
            else userId = (int)auth.getActiveUser().getId();
        }
        if (getRequestParameter(request, "compid")!=null) {
            companyId = Long.parseLong(getRequestParameter(request, "compid"));
            db = getCompanyDb(companyId);
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
            resume = resumeServices.getResume(userId, db);
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
