/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.util.log.Level;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that saves the PM review message
 * for the project manager.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SavePMReviewAction extends ReviewAction {

    /**
     * <p>
     * Call the business logic layer and set session if possible.
     * </p>
     *
     * @return the result data.
     *
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     * @param errors The action errors in calling the logic layer.
     * @param forwards The action forwards from calling the logic layer.
     * @param orpd The OnlineReviewProjectData to create the action data.
     */
    public ResultData executeLogic(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response,
                                   ActionErrors errors,
                                   ActionForwards forwards,
                                   OnlineReviewProjectData orpd) {
        log(Level.INFO, "SavePMReviewAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Was this transaction cancelled?
        if (isCancelled(request)) {
            ActionForward forward = null;

            request.getSession().removeAttribute(mapping.getAttribute());
            forward = mapping.findForward(Constants.CANCEL_KEY);
            forward = new ActionForward(forward.getPath() + "?" +
                    Constants.ID_KEY + "=" +
                    orpd.getProject().getId(), true);
            forward.setName(Constants.CANCEL_KEY);
            forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
            forwards.addForward(forward);
            return null;
        } else {
            if (!isTokenValid(request)) {
                errors.add(ActionErrors.GLOBAL_ERROR,
                        new ActionError("error.transaction.token"));
                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(mapping.findForward(Constants.FAILURE_KEY));
                return null;
            } else {
                ProjectData data = ((SubmissionForm) form).toProjectData(orpd);
                BusinessDelegate businessDelegate = new BusinessDelegate();
                ResultData result = businessDelegate.projectAdmin(data);
                DocumentManagerLocal documentManager;

                log(Level.ERROR, "HERE");
//struts checkbox doesn't record unchecked state properly, need to reset if not in request
                if (request.getParameter("advanced") == null) {
                    ((SubmissionForm) form).setAdvanced(false);
                }

                try {
                    documentManager = EJBHelper.getDocumentManager();
                } catch (Exception e) {
                    return null;
                }

                if (result instanceof SuccessResult) {
                    long sid = ((SubmissionForm) form).getSubmission().getId();

                    request.getSession().removeAttribute(mapping.getAttribute());
                    resetToken(request);

// Set the PM Review flag
                    for (int i = 0; i < ((SubmissionForm) form).getScorecards().length; i++) {
                        AbstractScorecard scorecard = ((SubmissionForm) form).getScorecards()[i];
                        if (scorecard.getSubmission().getId() == sid) {
                            scorecard.setPMReviewed(true);
                            scorecard.setRawScore(scorecard.getScore());
                            scorecard.setPMReviewTimestamp(new java.sql.Timestamp(System.currentTimeMillis()));

                            if (scorecard instanceof ScreeningScorecard) {
                                log(Level.ERROR, "ADVANCED: " + ((SubmissionForm) form).getAdvanced());
                                if (((SubmissionForm) form).getIsScreening()) {
/*((InitialSubmission)((SubmissionForm) form).getSubmission()).setAdvancedToReview(((SubmissionForm) form).getAdvanced());

                                    try {
                                        documentManager.saveInitialSubmission((InitialSubmission)((SubmissionForm) form).getSubmission(), data.getUser().getTCSubject());
                                    } catch(Exception e) {
                                        log(Level.ERROR, e.getMessage());
                                        return null;
                                    }*/

                                    ScreeningData sData = new ScreeningData(orpd, sid, (ScreeningScorecard) scorecard);
                                    result = businessDelegate.screeningScorecard(sData);

                                }
                            } else {
                                ReviewData rData = new ReviewData(orpd, sid, scorecard.getAuthor().getId(),
                                        (ReviewScorecard) scorecard);
                                result = businessDelegate.reviewScorecard(rData);
                            }

                            if (!(result instanceof SuccessResult)) {
                                break;
                            }
                        }
                    }

//save
                    if (((SubmissionForm) form).getIsScreening()) {
                        InitialSubmission sub = documentManager.getInitialSubmission(data.getProject(), sid, orpd.getUser().getTCSubject());
                        sub.setAdvancedToReview(((SubmissionForm) form).getAdvanced());

                        try {
                            documentManager.saveInitialSubmission(sub, data.getUser().getTCSubject());
                        } catch (Exception e) {
                            return new FailureResult("ERROR SAVING SUBMISSION");
                        }

                        ResultData rs = AutoPilot.screeningPMReview(data);
                        if (!(rs instanceof SuccessResult))
                            return rs;
                    } else {
                        ResultData rs = AutoPilot.reviewPMReview(data);
                        if (!(rs instanceof SuccessResult))
                            return rs;
                    }
                }

                return result;
            }
        }
    }
}
