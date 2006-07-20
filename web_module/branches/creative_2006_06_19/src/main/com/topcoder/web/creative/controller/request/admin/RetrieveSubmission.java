package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Submission;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class RetrieveSubmission extends HibernateProcessor {

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = CreativeDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=" + s.getOriginalFileName());
        getResponse().setContentType(s.getFileType().getMimeType());
        ServletOutputStream sos = getResponse().getOutputStream();

        FileInputStream fis = new FileInputStream(s.getPath().getPath() + s.getSystemFileName());

        int b;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
        }
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();


    }
}
