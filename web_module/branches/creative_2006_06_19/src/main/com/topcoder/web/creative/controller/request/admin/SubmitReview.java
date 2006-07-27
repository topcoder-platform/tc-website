package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.ReviewStatus;
import com.topcoder.web.creative.model.Submission;
import com.topcoder.web.creative.model.SubmissionReview;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class SubmitReview extends ShortHibernateProcessor {
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
        ReviewStatus rs = CreativeDAOUtil.getFactory().getReviewStatusDAO().find(status);
        if (rs == null) {
            addError(Constants.REVIEW_STATUS_ID, "Invalid review status specified");
        }
        if (hasErrors()) {
            getRequest().setAttribute("submission", CreativeDAOUtil.getFactory().getSubmissionDAO().find(submissionId));
            SubmissionReview submissionReview = CreativeDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
            getRequest().setAttribute("reviewStatuses", CreativeDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses());

            if (submissionReview != null) {
                getRequest().setAttribute("submissionReview", submissionReview);
                setDefault(Constants.SUBMISSION_REVIEW_TEXT, submissionReview.getText());
                setDefault(Constants.REVIEW_STATUS_ID, submissionReview.getStatus().getId());
            }
            setNextPage("/admin/submissionDetail.jsp");
            setIsNextPageInContext(true);

        } else {
            Submission s = CreativeDAOUtil.getFactory().getSubmissionDAO().find(submissionId);
            SubmissionReview sr = CreativeDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
            if (sr == null) {
                sr = new SubmissionReview();
                sr.setSubmission(s);
            }
            sr.setReviewer(DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId())));
            sr.setStatus(rs);
            sr.setText(getRequest().getParameter(Constants.SUBMISSION_REVIEW_TEXT));
            CreativeDAOUtil.getFactory().getSubmissionReviewDAO().saveOrUpdate(sr);
            markForCommit();

            closeConversation();
            //have to wrap up the last stuff, and get into new stuff.  we don't want
            //sending email to be in the transaction
            beginCommunication();

            User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

            if (!"".equals(response) && u.getPrimaryEmailAddress().getStatusId().equals(Email.STATUS_ID_ACTIVE)) {
                sendEmail(u.getPrimaryEmailAddress().getAddress(), response, s.getOriginalFileName(), u.getHandle());
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

    private void sendEmail(String address, String text, String fileName, String handle) throws Exception {

        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("Your submission " + fileName + " has been reviewed");
        StringBuffer msgText = new StringBuffer(3000);

        msgText.append("Hello ");
        msgText.append(handle);
        msgText.append(",\n\n");
        msgText.append(text);
        msgText.append("\n\n");


        msgText.append("Regards,\n\nTopCoder Studio");

        mail.setBody(msgText.toString());
        mail.addToAddress(address, TCSEmailMessage.TO);

        mail.setFromAddress("studioreview@topcoder.com");
        EmailEngine.send(mail);
    }

}
