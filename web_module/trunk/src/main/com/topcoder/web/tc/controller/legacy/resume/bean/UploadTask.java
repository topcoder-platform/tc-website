package com.topcoder.web.tc.controller.legacy.resume.bean;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.controller.legacy.resume.common.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadTask extends ResumeTask {
    private byte file[] = null;
    private int fileType = -1;
    private String fileName = null;
    private int userId = -1;
    private static Logger log = Logger.getLogger(UploadTask.class);

    public void process() throws ResumeTaskException {
        try {
            ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            resumeServices.putResume(userId, fileType, fileName, file, db);
        } catch (Exception e) {
            throw new ResumeTaskException(e);
        }
    }

    public void servletPreAction(TCRequest request, TCResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        Navigation navigation = (Navigation) session.getAttribute("navigation");
        BasicAuthentication auth = new BasicAuthentication(
                new SessionPersistor(request.getSession()),
                request,
                response, BasicAuthentication.MAIN_SITE);
        if (navigation == null) navigation = new Navigation();
        if (!navigation.isIdentified() && auth.getActiveUser().isAnonymous()) {
            log.debug("User not logged in, can't upload a file.");
            throw new Exception("User not logged in, can't upload a file.");
        } else {
            if (navigation.isIdentified())
                userId = navigation.getUserId();
            else
                userId = (int) auth.getActiveUser().getId();
        }
        if (request.getParameter("compid") != null) {
            companyId = Long.parseLong(request.getParameter("compid"));
            db = getCompanyDb(companyId);
        }
        UploadedFile uf = null;
        byte[] fileBytes = null;
        try {
            uf = ((MultipartRequest)request).getUploadedFile("file1");
                if (uf == null) {
                    throw new ResumeTaskException("Empty file uploaded");
                } else {
                    fileBytes = new byte[(int) uf.getSize()];
                    uf.getInputStream().read(fileBytes);
                    fileType = Integer.parseInt(request.getParameter("fileType"));
                    fileName = uf.getRemoteFileName();
                    file = fileBytes;
                }
        } catch (Exception e) {
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
        try {
            ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            resumeServices.putResume(userId, fileType, fileName, file, db);
            super.setNextPage(Constants.SUCCESS_PAGE);
        } catch (Exception e) {
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
