package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Submission;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class DownloadSubmission extends Base {

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        //create the file input stream first so that if there is a problem, we'll get the error and be able to go
        //to an error page.  if we work with the output stream, we won't be able to do that.
        FileInputStream fis = new FileInputStream(s.getPath().getPath() + s.getSystemFileName());

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=\"" + s.getOriginalFileName() + "\"");
        getResponse().setContentType(s.getMimeType().getDescription());
        ServletOutputStream sos = getResponse().getOutputStream();


        int b;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
        }
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();


    }
}
