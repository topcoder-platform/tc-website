package com.topcoder.web.resume.bean;

import com.topcoder.web.resume.common.Constants;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.common.web.data.Navigation;

import javax.servlet.http.*;
import java.util.ArrayList;

public class ViewUploadTask extends ResumeTask{
    private static Logger log = Logger.getLogger(UploadTask.class);

    private int userId;
    private boolean hasResume;
    private ArrayList fileTypes;

    public ViewUploadTask() throws ResumeTaskException{
        super();
        setUserId(-1);
        setHasResume(false);
        setFileTypes(null);
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

    public void processStep(String step) throws Exception {
        Resume resume = null;
        ResumeServicesHome resumeServicesHome =
                    (ResumeServicesHome) super.getInitialContext().lookup(ApplicationServer.RESUME_SERVICES);
        ResumeServices resumeServices = resumeServicesHome.create();
        resume = resumeServices.getResume(userId);
        if (resume != null) {
            setHasResume(true);
        } else {
            setHasResume(false);
        }
        fileTypes = resumeServices.getFileTypes();
        super.setNextPage(Constants.UPLOAD_PAGE);
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean isHasResume() {
        return hasResume;
    }

    public void setHasResume(boolean hasResume) {
        this.hasResume = hasResume;
    }

    public ArrayList getFileTypes() {
        return fileTypes;
    }

    public void setFileTypes(ArrayList fileTypes) {
        this.fileTypes = fileTypes;
    }



}
