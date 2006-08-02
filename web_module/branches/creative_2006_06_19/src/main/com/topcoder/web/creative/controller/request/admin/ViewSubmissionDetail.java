package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.SubmissionReview;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class ViewSubmissionDetail extends Base {
    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        getRequest().setAttribute("submission", CreativeDAOUtil.getFactory().getSubmissionDAO().find(submissionId));
        SubmissionReview submissionReview = CreativeDAOUtil.getFactory().getSubmissionReviewDAO().find(submissionId);
        getRequest().setAttribute("reviewStatuses", CreativeDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses());
        getRequest().setAttribute("currentUser", DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId())));

        if (submissionReview != null) {
            getRequest().setAttribute("submissionReview", submissionReview);
            setDefault(Constants.SUBMISSION_REVIEW_TEXT, submissionReview.getText());
            setDefault(Constants.REVIEW_STATUS_ID, submissionReview.getStatus().getId());
        }

        setNextPage("/admin/submissionDetail.jsp");
        setIsNextPageInContext(true);


    }
}
