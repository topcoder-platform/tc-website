package com.topcoder.web.tc.controller.legacy.resume.bean;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.controller.legacy.resume.common.Constants;

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
        BasicAuthentication auth = new BasicAuthentication(
                new SessionPersistor(request.getSession()), request, response, BasicAuthentication.MAIN_SITE);
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
