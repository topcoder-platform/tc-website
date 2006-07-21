package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
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
public class SubmitReview extends HibernateProcessor {
    protected void dbProcessing() throws Exception {
        //get submission id
        //get review text
        //todo get flag regarding sending email


        Long submissionId;
        Integer status = null;

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
            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=AdminViewSubmissions&");
            buf.append(Constants.CONTEST_ID + "=").append(s.getContest().getId());
            setNextPage(buf.toString());
            setIsNextPageInContext(false);

        }


    }
}
