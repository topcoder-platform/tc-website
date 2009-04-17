package com.topcoder.web.truveo.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.truveo.Constants;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.model.Submission;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class DownloadSubmission extends BaseSubmissionDataProcessor {

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = TruveoDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        boolean isOwner = s.getSubmitter().getId().equals(getUser().getId());

/*
        boolean isWinner = false;
        for (Prize p : s.getPrizes()) {
            //we figure out the winner based on prizes because we'll consider that the "annoucing" of the winner, when the prize is set.
            if (p.getPlace()!=null && p.getPlace() == 1) {
                isWinner = true;
                break;
            }
        }
*/
        boolean isOver = new Date().after(s.getContest().getEndTime());

        if (!isOver && !isOwner) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        }

/*
   we used link to winners on the home page and let people downloa the winning submission...not anymore
        if (isWinner || "true".equals(s.getContest().getViewableSubmissions().getValue()) || isOwner) {
*/
        if ("true".equals(s.getContest().getViewableSubmissions().getValue()) || isOwner) {

            //create the file input stream first so that if there is a problem, we'll get the error and be able to go
            //to an error page.  if we work with the output stream, we won't be able to do that.
            FileInputStream fis = new FileInputStream(s.getPath().getPath() + s.getSystemFileName());

            log.debug("not done");
            if (isOwner) {
                getResponse().addHeader("content-disposition", "inline; filename=\"" + s.getOriginalFileName() + "\"");
            } else {
                getResponse().addHeader("content-disposition", "inline; filename=\"" + s.getId() + s.getOriginalFileName().substring(s.getOriginalFileName().lastIndexOf('.')) + "\"");
            }
            getResponse().setContentType(s.getMimeType().getDescription());
            ServletOutputStream sos = getResponse().getOutputStream();
            int b;
            int size = 0;
            while ((b = fis.read()) >= 0) {
                sos.write(b);
                size++;
            }
            getResponse().addHeader("Content-Length", String.valueOf(size));
            getResponse().setStatus(HttpServletResponse.SC_OK);
            getResponse().flushBuffer();


        } else {
            throw new NavigationException("Sorry, you can not download submissions for this contest.");
        }


    }

}