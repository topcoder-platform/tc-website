package com.topcoder.web.resume.bean;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.resume.common.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewUploadTask extends ResumeTask{
    private static Logger log = Logger.getLogger(UploadTask.class);

    private int userId;
    private boolean hasResume;
    private ResultSetContainer fileTypes;

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
        if (getRequestParameter(request, "compid")!=null) {
            companyId = Long.parseLong(super.getFileUpload().getParameter("compid"));
            db = getCompanyDb(companyId);
        }
    }

    public void processStep(String step) throws Exception {
        Resume resume = null;
        ResumeServices resumeServices = (ResumeServices)BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
        resume = resumeServices.getResume(userId, db);
        if (resume != null) {
            setHasResume(true);
        } else {
            setHasResume(false);
        }
        fileTypes = resumeServices.getFileTypes(db);
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

    public ResultSetContainer getFileTypes() {
        return fileTypes;
    }

    public void setFileTypes(ResultSetContainer fileTypes) {
        this.fileTypes = fileTypes;
    }



}
