package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Resume;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.ServletOutputStream;

/**
 * User: dok
 * Date: Oct 27, 2004
 */
public class DownloadResume extends Base {

    protected void businessProcessing() throws com.topcoder.web.common.TCWebException {

        try {
            if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
                long uid = Long.parseLong(getRequest().getParameter(Constants.USER_ID));

                ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
                Resume resume = resumeServices.getResume(uid, DBMS.OLTP_DATASOURCE_NAME);

                getResponse().addHeader("content-disposition", "inline; filename=" + resume.getFileName());
                getResponse().setContentType(resume.getMimeType());
                ServletOutputStream sos = getResponse().getOutputStream();
                sos.write(resume.getFile());
                /* this is not really what i want to do, but i can't think of another
                 * way to complete the download without having to forward to another page.
                 */
                sos.flush();
                sos.close();
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
