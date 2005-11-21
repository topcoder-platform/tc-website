/*
 * DownloadResume.java
 *
 * Created on July 27, 2004, 1:23 PM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.model.Resume;

import javax.servlet.ServletOutputStream;

/**
 *
 * @author  rfairfax
 */
public class DownloadResume extends BaseScreeningProcessor {

    /** Creates a new instance of DownloadResume */

    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {

        try {
            long uid = Long.parseLong(getRequest().getParameter(Constants.USER_ID));

            ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            Resume resume = resumeServices.getResume(uid, Constants.DATA_SOURCE);

            getResponse().addHeader("content-disposition", "inline; filename=" + resume.getFileName());
            getResponse().setContentType(resume.getMimeType());
            ServletOutputStream sos = getResponse().getOutputStream();
            sos.write(resume.getFile());
            /* this is not really what i want to do, but i can't think of another
             * way to complete the download without having to forward to another page.
             */
            sos.flush();
            sos.close();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
