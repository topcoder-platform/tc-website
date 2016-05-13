/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.FinalFixComment;
import com.topcoder.web.studio.dto.FinalFixDetail;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.ProjectPhase;
import com.topcoder.web.studio.dto.Review;
import com.topcoder.web.studio.dto.ReviewItem;
import com.topcoder.web.studio.dto.ReviewItemComment;
import com.topcoder.web.studio.dto.Upload;
import com.topcoder.web.studio.util.Util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * <p>A controller to be used for servicing the requests for viewing the details for requested final fix round for
 * requested <code>Studio</code> contest.</p>
 * 
 * @author isv
 * @version 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
 */
public class ViewFinalFix extends ShortHibernateProcessor {

    /**
     * <p>Constructs new <code>ViewFinalFix</code> instance. This implementation does nothing.</p>
     */
    public ViewFinalFix() {
    }

    /**
     * <p>Handles the incoming request.</p>
     * 
     * <p>Get the details for the requested final fix round and binds them to request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        // get contest data
        String contestIdValue = getRequest().getParameter(Constants.CONTEST_ID);
        int contestId = Integer.parseInt(contestIdValue);
        Project contest = DAOUtil.getFactory().getProjectDAO().find(contestId);

        // check user's permission on the final-fix
        boolean showFinalFixTab = Util.showFinalFixTab(getRequest(), contest, getUser().getId());
        if (!showFinalFixTab) {
            throw new NavigationException("User doesn't have permission to view the final fix");
        }
        getRequest().setAttribute("showFinalFixTab", showFinalFixTab);
        getRequest().setAttribute("contest", contest);

        // get final-fix round number
        String roundNoValue = getRequest().getParameter(Constants.FINAL_FIX_ROUND_NO);
        int roundNo;
        if ((roundNoValue == null) || (roundNoValue.trim().length() == 0)) {
            roundNo = contest.getNoOfFinalFixRounds();
        } else {
            roundNo = Integer.parseInt(roundNoValue);
        }

        // get the final fix phase and final review phase
        ProjectPhase finalFixPhase = contest.getFinalFixPhases().get(roundNo - 1);
        List<ProjectPhase> finalReviewPhases = contest.getFinalReviewPhases();
        ProjectPhase finalReviewPhase = finalReviewPhases.get(roundNo - 1);

        getRequest().setAttribute("finalFixPhase", finalFixPhase);
        getRequest().setAttribute("FinalFixRoundNo", roundNo);

        // check if submission is ready for the final-fix phase
        Upload upload = DAOUtil.getFactory().getUploadDAO().getUploadForPhase(finalFixPhase.getId());
        getRequest().setAttribute("finalFixUploaded", upload != null);

        // Check if user has a permission to upload a final fix for contest
        Long winnerUserId = Util.getWinnerUserId(contest.getId());
        if (winnerUserId != null) {
            getRequest().setAttribute("canUploadFinalFix", getUser().getId() == winnerUserId);
        } else {
            getRequest().setAttribute("canUploadFinalFix", false);
        }


        // Build the text like "24 hours left" in case the final fix is not uploaded yet
        if (upload == null) {
            getRequest().setAttribute("hoursLeftText", Utils.getTextualDiff(finalFixPhase.getScheduledEndTime()));
        }

        // get the associated review comments
        boolean reviewCommitted;
        Review previousReview = null;
        Review review = DAOUtil.getFactory().getReviewDAO().getReviewByPhase(finalReviewPhase.getId());
        if ((review == null) || !review.getCommitted()) {
            reviewCommitted = false;
            if (roundNo == 1) {
                ProjectPhase approvalPhase = contest.getPhase(ProjectPhase.APPROVAL);
                review = DAOUtil.getFactory().getReviewDAO().getReviewByPhase(approvalPhase.getId());
            } else {
                review = DAOUtil.getFactory().getReviewDAO().getReviewByPhase(finalReviewPhases.get(roundNo - 2).getId());
                previousReview = review;
            }
        } else {
            reviewCommitted = true;
        }

        // Build the DTO for Final Fix tab
        boolean allItemsFixed = true;
        List<FinalFixComment> finalFixComments = new ArrayList<FinalFixComment>();
        FinalFixDetail finalFixDetail = new FinalFixDetail();
        ReviewItem reviewItem = review.getItems().iterator().next();
        Set<ReviewItemComment> reviewItemComments = reviewItem.getComments();
        for (ReviewItemComment reviewItemComment : reviewItemComments) {
            Long reviewItemCommentTypeId = reviewItemComment.getType().getId();
            if (reviewItemCommentTypeId == 3) { // Required comment
                FinalFixComment finalFixComment = new FinalFixComment();
                finalFixComment.setComment(reviewItemComment.getContent());
                boolean fixed = false;
                if (reviewItemComment.getExtraInfo() != null) {
                    fixed = "Fixed".equalsIgnoreCase(reviewItemComment.getExtraInfo());
                } else {
                    if (roundNo > 1 && previousReview != null) {
                        Set<ReviewItemComment> previousReviewComments 
                                = previousReview.getItems().iterator().next().getComments();
                        for (ReviewItemComment previousReviewItemComment : previousReviewComments) {
                            if (previousReviewItemComment.getType().getId() == 3) {
                                if (previousReviewItemComment.getSort().equals(reviewItemComment.getSort())) {
                                    fixed = "Fixed".equalsIgnoreCase(previousReviewItemComment.getExtraInfo());
                                }
                            }
                        }
                    }
                }
                finalFixComment.setFixed(fixed);
                finalFixComments.add(finalFixComment);
                allItemsFixed = allItemsFixed && fixed;
            } else if (reviewItemCommentTypeId == 10) { // Final Review comment
                finalFixDetail.setAdditionalComment(reviewItemComment.getContent());
            }
        }
        finalFixDetail.setComments(finalFixComments);

        getRequest().setAttribute("finalFixDetail", finalFixDetail);
        getRequest().setAttribute("allItemsFixed", allItemsFixed);
        getRequest().setAttribute("reviewCommitted", reviewCommitted);
        setNextPage("/finalFix.jsp");
        setIsNextPageInContext(true);
    }
}
