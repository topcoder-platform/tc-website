package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.csf.model.Submission;
import com.topcoder.web.csf.model.SubmissionReview;
import com.topcoder.web.csf.model.ReviewStatus;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.Constants;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class SubmitReview extends Base {
    protected void dbProcessing() throws Exception {

        Long submissionId;
        Integer status = null;
        String response = StringUtils.checkNull(getRequest().getParameter(Constants.SUBMISSION_REVIEW_TEXT));

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }
        try {
            status = new Integer(getRequest().getParameter(Constants.REVIEW_STATUS_ID));
        } catch (NumberFormatException e) {
            addError(Constants.REVIEW_STATUS_ID, "Invalid review status specified");
        }
        ReviewStatus rs = CSFDAOUtil.getFactory().getReviewStatusDAO().find(status);
        if (rs == null) {
            addError(Constants.REVIEW_STATUS_ID, "Invalid review status specified");
        }
        if (hasErrors()) {
            getRequest().setAttribute("submission", CSFDAOUtil.getFactory().getSubmissionDAO().find(submissionId));
            SubmissionReview submissionReview = CSFDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
            getRequest().setAttribute("reviewStatuses", CSFDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses());

            if (submissionReview != null) {
                getRequest().setAttribute("submissionReview", submissionReview);
                setDefault(Constants.SUBMISSION_REVIEW_TEXT, submissionReview.getText());
                setDefault(Constants.REVIEW_STATUS_ID, submissionReview.getStatus().getId());
            }
            setNextPage("/admin/submissionDetail.jsp");
            setIsNextPageInContext(true);

        } else {
            Submission s = CSFDAOUtil.getFactory().getSubmissionDAO().find(submissionId);
            SubmissionReview sr = CSFDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
            if (sr == null) {
                sr = new SubmissionReview();
                sr.setSubmission(s);
            }
            User reviewer = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
            sr.setReviewer(reviewer);
            sr.setStatus(rs);
            sr.setText(getRequest().getParameter(Constants.SUBMISSION_REVIEW_TEXT));
            CSFDAOUtil.getFactory().getSubmissionReviewDAO().saveOrUpdate(sr);

            if (sr.getStatus().getId().equals(ReviewStatus.FAILED)) {
                CSFDAOUtil.getFactory().getSubmissionDAO().changeRank(null, s);
            }

            Long submitterId = s.getSubmitter().getId();

            markForCommit();

            closeConversation();
            //have to wrap up the last stuff, and get into new stuff.  we don't want
            //sending email to be in the transaction
            beginCommunication();

            User submitter = DAOUtil.getFactory().getUserDAO().find(submitterId);

            if (!"".equals(response) && submitter.getPrimaryEmailAddress().getStatusId().equals(Email.STATUS_ID_ACTIVE)) {
                sendEmail(submitter, response, s.getOriginalFileName(), rs, reviewer);
            }

            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=AdminViewSubmissions&");
            buf.append(Constants.CONTEST_ID + "=").append(s.getContest().getId());
            buf.append("&").append(Constants.REVIEW_STATUS_ID).append("=null");
            setNextPage(buf.toString());
            setIsNextPageInContext(false);

        }

    }

    private void sendEmail(User submitter, String text, String fileName, ReviewStatus status, User reviewer) throws Exception {

        TCSEmailMessage mail = new TCSEmailMessage();
        if (ReviewStatus.PASSED.equals(status.getId())) {
            mail.setSubject("Your CSF series submission passed review");
        } else if (ReviewStatus.FAILED.equals(status.getId())) {
            mail.setSubject("Your CSF series submission failed review");
        } else {
            throw new Exception("Invalid review status: " + status.getId());
        }

        StringBuffer msgText = new StringBuffer(3000);

        msgText.append("Dear ");
        msgText.append(submitter.getHandle());
        msgText.append(",\n\n");
        msgText.append("This email is in regard to ");
        msgText.append(fileName);
        msgText.append(" submitted on ");

        ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
        formatter.setFormatMethodForClass(Calendar.class,
                new CalendarDateFormatMethod("EEEE, MMMM d, yyyy 'at' HH:mm z"), true);

        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date(System.currentTimeMillis()));
        cal.setTimeZone(TimeZone.getTimeZone(submitter.getTimeZone().getDescription()));

        msgText.append(formatter.format(cal));
        msgText.append("\n\n");
        msgText.append(text);
        msgText.append("\n\n");


        msgText.append("Sincerely,\n");
        msgText.append(reviewer.getFirstName());
        msgText.append(" ");
        msgText.append(reviewer.getLastName());
        msgText.append("\n");

        mail.setBody(msgText.toString());
        mail.addToAddress(submitter.getPrimaryEmailAddress().getAddress(), TCSEmailMessage.TO);

        mail.setFromAddress("studioadmin@topcoder.com", "TopCoder Studio Admin");
        EmailEngine.send(mail);
    }

}
