package com.topcoder.web.tc.controller.legacy.resume.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

public class DownloadTask extends ResumeTask {
    private Resume resume = null;
    private static Logger log = Logger.getLogger(DownloadTask.class);
    private int userId = -1;


    protected void businessProcessing() throws TCWebException {
        try {
            if (!userLoggedIn()) {
                log.debug("User not logged in, can't download a file.");
                throw new TCWebException("User not logged in, can't download a file.");
            } else {
                userId = (int) getUser().getId();
            }
            if (getRequest().getParameter("compid") != null) {
                companyId = Long.parseLong(getRequest().getParameter("compid"));
                db = getCompanyDb(companyId);
            }
            getResponse().addHeader("content-disposition", "inline; filename=" + resume.getFileName());
            getResponse().setContentType(resume.getMimeType());
            ServletOutputStream sos = getResponse().getOutputStream();
            ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            resume = resumeServices.getResume(userId, db);
            sos.write(resume.getFile());
            getResponse().setStatus(HttpServletResponse.SC_OK);
            /* this is not really what i want to do, but i can't think of another
             * way to complete the download without having to forward to another page.
             */
            sos.flush();
            sos.close();

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
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
