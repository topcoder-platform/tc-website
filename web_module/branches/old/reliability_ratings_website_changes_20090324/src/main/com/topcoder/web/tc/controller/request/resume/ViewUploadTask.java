package com.topcoder.web.tc.controller.request.resume;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.controller.request.Base;

public class ViewUploadTask extends Base {
    private static Logger log = Logger.getLogger(UploadTask.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                log.debug("User not logged in, can't download a file.");
                throw new TCWebException("User not logged in, can't download a file.");
            }
            ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            getRequest().setAttribute("hasResume", String.valueOf(resumeServices.hasResume(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME)));
            setNextPage("/resume/resume_upload.jsp");
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
