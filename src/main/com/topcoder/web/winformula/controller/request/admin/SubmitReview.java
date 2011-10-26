package com.topcoder.web.winformula.controller.request.admin;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.model.Contest;
import com.topcoder.web.winformula.model.ReviewStatus;
import com.topcoder.web.winformula.model.Submission;
import com.topcoder.web.winformula.model.SubmissionReview;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
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
        ReviewStatus rs = WinformulaDAOUtil.getFactory().getReviewStatusDAO().find(status);
        if (rs == null) {
            addError(Constants.REVIEW_STATUS_ID, "Invalid review status specified");
        }
        if (hasErrors()) {
            getRequest().setAttribute("submission", WinformulaDAOUtil.getFactory().getSubmissionDAO().find(submissionId));
            SubmissionReview submissionReview = WinformulaDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
            getRequest().setAttribute("reviewStatuses", WinformulaDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses());

            if (submissionReview != null) {
                getRequest().setAttribute("submissionReview", submissionReview);
                setDefault(Constants.SUBMISSION_REVIEW_TEXT, submissionReview.getText());
                setDefault(Constants.REVIEW_STATUS_ID, submissionReview.getStatus().getId());
            }
            setNextPage("/admin/submissionDetail.jsp");
            setIsNextPageInContext(true);

        } else {
            Submission s = WinformulaDAOUtil.getFactory().getSubmissionDAO().find(submissionId);
            SubmissionReview sr = WinformulaDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
            if (sr == null) {
                sr = new SubmissionReview();
                sr.setSubmission(s);
            }
            User reviewer = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
            sr.setReviewer(reviewer);
            sr.setStatus(rs);
            sr.setText(getRequest().getParameter(Constants.SUBMISSION_REVIEW_TEXT));
            WinformulaDAOUtil.getFactory().getSubmissionReviewDAO().saveOrUpdate(sr);

/*  don't change the rank. we're not going to let submissions ranked below the treshhold bump up anymore.  they just don't get scored.
            if (sr.getStatus().getId().equals(ReviewStatus.FAILED)) {
                OpenAIMDAOUtil.getFactory().getSubmissionDAO().changeRank(null, s);
            }
*/

            Long submitterId = s.getSubmitter().getId();


            closeConversation();
            //have to wrap up the last stuff, and get into new stuff.  we don't want
            //sending email to be in the transaction
            beginCommunication();

            User submitter = DAOUtil.getFactory().getUserDAO().find(submitterId);

            if (!"".equals(response) && submitter.getPrimaryEmailAddress().getStatusId().equals(Email.STATUS_ID_ACTIVE)) {
                sendEmail(submitter, response, s.getOriginalFileName(), rs, reviewer, s.getCreateDate());
            }

            sr = WinformulaDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
/*
            if (sr.getSubmission().getContest().getEndTime().before(new Timestamp(System.currentTimeMillis()))) {
*/
                refreshCache(s.getContest());
/*
            }
*/

            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=ViewSubmissions&");
            buf.append(Constants.CONTEST_ID + "=").append(s.getContest().getId());
            buf.append("&").append(Constants.REVIEW_STATUS_ID).append("=null");
            setNextPage(buf.toString());
            setIsNextPageInContext(false);

        }

    }

    private void sendEmail(User submitter, String text, String fileName, ReviewStatus status, User reviewer, Date submitDate) throws Exception {

        TCSEmailMessage mail = new TCSEmailMessage();
        if (ReviewStatus.PASSED.equals(status.getId())) {
            mail.setSubject("Your TopCoder(R) Winformula submission passed review");
        } else if (ReviewStatus.FAILED.equals(status.getId())) {
            mail.setSubject("Your TopCoder(R) Winformula submission failed review");
        } else if (ReviewStatus.CHEATED.equals(status.getId())) {
            //don't send email 
            return;
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
        cal.setTime(DateUtils.getConvertedDate(submitDate, submitter.getTimeZone().getDescription()));
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
        msgText.append("Winformula Developer Challenge");

        mail.setBody(msgText.toString());
        mail.addToAddress(submitter.getPrimaryEmailAddress().getAddress(), TCSEmailMessage.TO);

        mail.setFromAddress("service@topcoder.com", "TopCoder Winformula Admin");
        EmailEngine.send(mail);
    }


    private void refreshCache(Contest c) {
        try {
            //todo fix this to work with both caches
            log.debug("refreshing cache");
            String key = Constants.CONTEST_ID + "=" + c.getId();
            CacheClearer.removelike(key);
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }

}