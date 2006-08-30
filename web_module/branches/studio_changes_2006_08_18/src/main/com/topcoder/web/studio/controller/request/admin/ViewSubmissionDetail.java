package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionReview;

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

        StudioDAOFactory f = StudioDAOUtil.getFactory();
        Submission s = f.getSubmissionDAO().find(submissionId);
        getRequest().setAttribute("submission", s);
        SubmissionReview submissionReview = f.getSubmissionReviewDAO().find(submissionId);
        getRequest().setAttribute("reviewStatuses", f.getReviewStatusDAO().getReviewStatuses());
        getRequest().setAttribute("currentUser", DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId())));
        if (s.getResult() != null) {
            setDefault(Constants.PRIZE_ID, s.getResult().getPrize().getId());
        }

        if (submissionReview != null) {
            getRequest().setAttribute("submissionReview", submissionReview);
            setDefault(Constants.SUBMISSION_REVIEW_TEXT, submissionReview.getText());
            setDefault(Constants.REVIEW_STATUS_ID, submissionReview.getStatus().getId());
        }

        setNextPage("/admin/submissionDetail.jsp");
        setIsNextPageInContext(true);


    }
}
