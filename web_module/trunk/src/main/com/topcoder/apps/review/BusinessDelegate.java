/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.TCPermission;
import org.apache.struts.util.MessageResources;

import java.util.Iterator;

/**
 * <p>
 * The Facade between the presentation layer and business logic layer.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class BusinessDelegate {

    // --------------------------------------------------- Instance Variables

    /**
     * Whether use the mockup data..
     */
    private static boolean useMockup = false;

    // ------------------------------------------------------------ Constructor

    /**
     * Create the instance.
     */
    public BusinessDelegate() {
        EJBHelper.setTestMode(false);
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Set whether to use mockup data.
     *
     * @param useMockup Whether to use mockup data.
     */
    public void setUseMockup(boolean useMockup) {
        this.useMockup = useMockup;
    }

    /**
     * Process the login and return the result.
     *
     * @param data The input action data.
     * @return the result of login.
     */
    public ResultData login(ActionData data) {
        if (useMockup) {
            return new FEMockupData().login(data);
        } else {
            return new Login().start(data);
        }
    }

    /**
     * Return the my open projects information.
     *
     * @param data The input action data.
     * @return the my open projects information.
     */
    public ResultData viewMyOpenProjects(ActionData data) {
        if (useMockup) {
            return new FEMockupData().viewMyOpenProjects(data);
        } else {
            return new ViewMyOpenProjects().start(data);
        }
    }

    /**
     * Return the all projects information.
     *
     * @param data The input action data.
     * @return the all projects information.
     */
    public ResultData viewAllOpenProjects(ActionData data) {
        if (useMockup) {
            return new FEMockupData().viewAllOpenProjects(data);
        } else {
            return new ViewAllProjects().start(data);
        }
    }

    /**
     * Return the project detail information.
     *
     * @param data The input action data.
     * @return the project detail information.
     */
    public ResultData projectDetail(ActionData data) {
        if (useMockup) {
            return new FEMockupData().projectDetail(data);
        } else {
            return new ProjectDetail().start(data);
        }
    }

    /**
     * Submit the solution.
     *
     * @param data The input action data.
     * @return the result of submission.
     */
    public ResultData submitSolution(ActionData data) {
        if (useMockup) {
            return new FEMockupData().submitSolution(data);
        } else {
            return new SubmitSolution().start(data);
        }
    }

    /**
     * Sent the message to project manager.
     *
     * @param data The input action data.
     * @return the result of sending.
     */
    public ResultData sendContactPM(ActionData data) {
        if (useMockup) {
            return new FEMockupData().sendContactPM(data);
        } else {
            return new ContactProductManager().start(data);
        }
    }

    /**
     * Return the screening scorecard list.
     *
     * @param data The input action data.
     * @return the screening scorecard list.
     */
    public ResultData getScreeningList(ActionData data) {
        if (useMockup) {
            return new FEMockupData().getScreeningList(data);
        } else {
            return new RetrieveScreeningScorecards().start(data);
        }
    }

    /**
     * Return the screening scorecard.
     *
     * @param data The input action data.
     * @return the screening scorecard.
     */
    public ResultData screeningScorecard(ActionData data) {
        if (useMockup) {
            return new FEMockupData().screeningScorecard(data);
        } else {
            return new ScreenProject().start(data);
        }
    }

    /**
     * Return the review scorecard list.
     *
     * @param data The input action data.
     * @return the review scorecard list.
     */
    public ResultData getReviewList(ActionData data) {
        if (useMockup) {
            return new FEMockupData().getReviewList(data);
        } else {
            return new RetrieveReviewScorecards().start(data);
        }
    }

    /**
     * Return the review scorecard.
     *
     * @param data The input action data.
     * @return the review scorecard.
     */
    public ResultData reviewScorecard(ActionData data) {
        if (useMockup) {
            return new FEMockupData().reviewScorecard(data);
        } else {
            return new ReviewProject().start(data);
        }
    }

    /**
     * Return the test case review list.
     *
     * @param data The input action data.
     * @return the test case review list.
     */
    public ResultData testCaseReviews(ActionData data) {
        if (useMockup) {
            return new FEMockupData().testCaseReviews(data);
        } else {
            return new com.topcoder.apps.review.TestCaseReview().start(data);
        }
    }

    /**
     * Return the aggregation worksheet.
     *
     * @param data The input action data.
     * @return the aggregation worksheet.
     */
    public ResultData aggregationWorksheet(ActionData data) {
        if (useMockup) {
            return new FEMockupData().aggregationWorksheet(data);
        } else {
            return new AggregateProject().start(data);
        }
    }

    /**
     * Return the aggregation reviews.
     *
     * @param data The input action data.
     * @return the aggregation reviews.
     */
    public ResultData aggregationReview(ActionData data) {
        if (useMockup) {
            return new FEMockupData().aggregationReview(data);
        } else {
            return new ReviewAggregate().start(data);
        }
    }

    /**
     * Submit the final fix.
     *
     * @param data The input action data.
     * @return the result of submission.
     */
    public ResultData submitFinalFix(ActionData data) {
        if (useMockup) {
            return new FEMockupData().submitFinalFix(data);
        } else {
            return new SubmitFinalFix().start(data);
        }
    }

    /**
     * Return the final review.
     *
     * @param data The input action data.
     * @return the final review.
     */
    public ResultData finalReview(ActionData data) {
        if (useMockup) {
            return new FEMockupData().finalReview(data);
        } else {
            return new com.topcoder.apps.review.FinalReview().start(data);
        }
    }

    /**
     * Save the project information.
     *
     * @param data The input action data.
     * @return the result of saving.
     */
    public ResultData projectAdmin(ActionData data) {
        if (useMockup) {
            return new FEMockupData().projectAdmin(data);
        } else {
            return new ProjectAdministration().start(data);
        }
    }

    /**
     * Download the submission file.
     *
     * @param data The input action data.
     * @return the result of submission file download.
     */
    public ResultData submissionDownload(ActionData data) {
        if (useMockup) {
            return new FEMockupData().submissionDownload(data);
        } else {
            return new SubmissionDownload().start(data);
        }
    }

    /**
     * Get/Save appeals.
     *
     * @param data The input action data.
     * @return the result of submission file download.
     */
    public ResultData appealProject(ActionData data) {
        if (useMockup) {
            return new FailureResult();
        } else {
            return new AppealProject().start(data);
        }
    }

    /**
     * Return whether the user is admin.
     *
     * @param user The user to be checked.
     * @return whether the user is admin.
     */
    public boolean getAdmin(SecurityEnabledUser user) {
        if (useMockup) {
            return new FEMockupData().getAdmin(user);
        } else {
            PermissionCollection permissions = user.getPermissions();
            if (permissions != null) {
                Iterator iter = permissions.getPermissions().iterator();

                while (iter.hasNext()) {
                    TCPermission permission = (TCPermission) iter.next();
                    if (permission.getName().equals((new AdminPermission()).getName())) {
                        return true;
                    }
                }
            }

            return false;
        }
    }

    /**
     * Return the deliverable name and action list.
     *
     * @param phase The current phase.
     * @param roleId The role id.
     * @param isWinner Whether the user is winner of this project.
     * @param isAdmin Whether the user is an admin.
     * @param isLink Whether the deliverable is a link.
     * @param isFinished Whether the documents for current phase are finished.
     * @param typeId The project type id.
     * @param isAggregator Whether the user is an aggregator.
     * @param isSubmitted Whether the user has submitted the solution.
     * @return the deliverable name and action list.
     */
    public String[] getDeliverable(Phase phase, long roleId, boolean isWinner, boolean isAdmin,
                                   boolean isLink, boolean isFinished, long typeId, boolean isAggregator,
                                   boolean isSubmitted) {
        MessageResources messages = MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);
        long phaseId = phase.getId();

        if (phaseId == Constants.PHASE_SUBMISSION) {
            // Submission
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                return new String[]{
                    messages.getMessage("deliverable.uploadSolution"),
                    "/submitSolution.do"
                };
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            }
        } else if (phaseId == Constants.PHASE_SCREENING) {
            // Screening
            if (roleId == Constants.ROLE_SCREENER) {
                // Screener
                return new String[]{
                    messages.getMessage("deliverable.submitScreening"),
                    "/screeningScorecardList.do"
                };
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            }
        } else if (phaseId == Constants.PHASE_REVIEW) {
            // Review
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecard.do?action=view",
                    };
                }
                // GT I gave this to all Reviewers!
                //} else if (roleId == Constants.ROLE_SCREENER) {
                //    // Screener
                //    if (isLink) {
                //        return new String[] {
                //            messages.getMessage("prompt.screeningScorecard"),
                //            "/screeningScorecardList.do"
                //       };
                //    }
            } else if (roleId == Constants.ROLE_REVIEWER) {
                // Reviewer
                if (typeId == ProjectType.ID_DESIGN) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("deliverable.submitReview"),
                        "/reviewScorecardList.do",
                    };
                } else {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("deliverable.submitReview"),
                        "/reviewScorecardList.do"
                    };
                }
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            }
/* by cucu
        } else if (phaseId == Constants.PHASE_APPEALS) {
*/
        } else if ((phaseId == Constants.PHASE_APPEALS) || (phaseId == Constants.PHASE_APPEALS_RESPONSE)) {
            // Appeals
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    if (typeId == ProjectType.ID_DESIGN) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view"
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.testcases"),
                            "/testCaseList.do"
                        };
                    }
                }
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_REVIEW,
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            } else if (roleId == Constants.ROLE_REVIEWER) {
                // Reviewer
                if (typeId == ProjectType.ID_DESIGN) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do"
                    };
                } else {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do"
                    };
                }
            }

        } else if (phaseId == Constants.PHASE_AGGREGATION) {
            // Aggregation
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    if (typeId == ProjectType.ID_DESIGN) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do"
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.testcases"),
                            "/testCaseList.do"
                        };
                    }
                }
            } else if (roleId == Constants.ROLE_AGGREGATOR) {
                // Aggregator
                if (isFinished) {
                    return new String[]{
                        messages.getMessage("prompt.aggregationWorksheet"),
                        "/aggregation.do?action=edit"
                    };
                } else {
                    return new String[]{
                        messages.getMessage("deliverable.submitAggregation"),
                        "/aggregation.do?action=edit"
                    };
                }
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.reviewScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_REVIEW,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("prompt.appeals"),
                        "/projectDetail.do?action=" + Constants.PHASE_APPEALS,
                        messages.getMessage("prompt.aggregationWorksheet"),
                        "/aggregation.do?action=admin",
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }

            } else if (roleId == Constants.ROLE_REVIEWER) {
                // Reviewer
                if (typeId == ProjectType.ID_DESIGN) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do"
                    };
                } else {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do"
                    };

                }
            }
        } else if (phaseId == Constants.PHASE_AGG_REVIEW) {
            // Agg. Review
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecard.do?action=view",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do?action=view",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do"
                    };
                }
            } else if (roleId == Constants.ROLE_REVIEWER && !isAggregator) {
                // Reviewer
                if (isFinished) {
                    return new String[]{
                        messages.getMessage("prompt.aggregationReview"),
                        "/aggregationReview.do?action=edit"
                    };
                } else {
                    return new String[]{
                        messages.getMessage("deliverable.submitAggReview"),
                        "/aggregationReview.do?action=edit"
                    };
                }
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.reviewScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_REVIEW,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("prompt.appeals"),
                        "/projectDetail.do?action=" + Constants.PHASE_APPEALS,
                        messages.getMessage("prompt.aggregationWorksheet"),
                        "/aggregation.do?action=admin",
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            } else if (roleId == Constants.ROLE_REVIEWER) {
                // Reviewer
                if (typeId == ProjectType.ID_DESIGN) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do"
                    };
                } else {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do"
                    };

                }
            }
        } else if (phaseId == Constants.PHASE_FINAL_FIX) {
            // Final Fixes
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    if (isWinner && typeId == ProjectType.ID_DESIGN) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.aggregationWorksheet"),
                            "/aggregation.do?action=view",
                            messages.getMessage("deliverable.uploadFinalFixes"),
                            "/submitSolution.do"
                        };
                    } else if (isWinner && typeId == ProjectType.ID_DEVELOPMENT) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.aggregationWorksheet"),
                            "/aggregation.do?action=view",
                            messages.getMessage("prompt.testcases"),
                            "/testCaseList.do",
                            messages.getMessage("deliverable.uploadFinalFixes"),
                            "/submitSolution.do"
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do"
                        };
                    }
                }
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.reviewScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_REVIEW,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("prompt.appeals"),
                        "/projectDetail.do?action=" + Constants.PHASE_APPEALS,
                        messages.getMessage("prompt.aggregationWorksheet"),
                        "/aggregation.do?action=admin",
                        messages.getMessage("prompt.finalFix"),
                        "/projectDetail.do?action=" + Constants.PHASE_FINAL_FIX,
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                }
            } else if (roleId == Constants.ROLE_REVIEWER) {
                // Reviewer
                if (typeId == ProjectType.ID_DESIGN) {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do"
                    };
                } else {
                    return new String[]{
                        messages.getMessage("prompt.screeningScorecard"),
                        "/screeningScorecardList.do",
                        messages.getMessage("prompt.reviewScorecard"),
                        "/reviewScorecardList.do",
                        messages.getMessage("prompt.appeals"),
                        "/appealScorecardList.do",
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do"
                    };
                }
            }
        } else if (phaseId == Constants.PHASE_FINAL_REVIEW) {
            // Final Review
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    if (isWinner && typeId == ProjectType.ID_DESIGN) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.aggregationWorksheet"),
                            "/aggregation.do?action=view",
                        };
                    } else if (isWinner && typeId == ProjectType.ID_DEVELOPMENT) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.aggregationWorksheet"),
                            "/aggregation.do?action=view",
                            messages.getMessage("prompt.testcases"),
                            "/testCaseList.do",
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do"
                        };
                    }
                }
            } else if (roleId == Constants.ROLE_FINAL_REVIEWER) {
                // FinalReviewer
                if (typeId == ProjectType.ID_DESIGN) {
                    if (isFinished) {
                        return new String[]{
                            messages.getMessage("prompt.finalReview"),
                            "/finalReview.do?action=edit",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do"
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("deliverable.submitFinalReview"),
                            "/finalReview.do?action=edit",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do"
                        };
                    }
                } else {
                    if (isFinished) {
                        return new String[]{
                            messages.getMessage("prompt.finalReview"),
                            "/finalReview.do?action=edit",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.testcases"),
                            "/testCaseList.do"
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("deliverable.submitFinalReview"),
                            "/finalReview.do?action=edit",
                            messages.getMessage("prompt.appeals"),
                            "/appealScorecardList.do",
                            messages.getMessage("prompt.testcases"),
                            "/testCaseList.do"
                        };
                    }
                }
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.reviewScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_REVIEW,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("prompt.appeals"),
                        "/projectDetail.do?action=" + Constants.PHASE_APPEALS,
                        messages.getMessage("prompt.aggregationWorksheet"),
                        "/aggregation.do?action=admin",
                        messages.getMessage("prompt.finalFix"),
                        "/projectDetail.do?action=" + Constants.PHASE_FINAL_FIX,
                        messages.getMessage("prompt.finalReview"),
                        "/finalReview.do?action=admin",
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            }
        } else if (phaseId == Constants.PHASE_COMP_PREPARE) {
            // Component preparation
            if (roleId == Constants.ROLE_DESINGER_DEVELOPER) {
                // Designer / Developer
                if (isLink && isSubmitted) {
                    if (isWinner) {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view",
                            messages.getMessage("prompt.aggregationWorksheet"),
                            "/aggregation.do?action=view",
                            messages.getMessage("prompt.finalReview"),
                            "/finalReview.do?action=view"
                        };
                    } else {
                        return new String[]{
                            messages.getMessage("prompt.screeningScorecard"),
                            "/screeningScorecard.do?action=view",
                            messages.getMessage("prompt.reviewScorecard"),
                            "/reviewScorecardList.do?action=view"
                        };
                    }
                }
            } else if (roleId == Constants.ROLE_SCREENER) {
                // Screener
                return new String[]{
                    messages.getMessage("prompt.view") + " " + messages.getMessage("prompt.screeningScorecards"),
                    "/screeningScorecardList.do"
                };
            } else if (roleId == Constants.ROLE_REVIEWER) {
                // Reviewer
                return new String[]{
                    messages.getMessage("prompt.view") + " " + messages.getMessage("prompt.reviewScorecards"),
                    "/reviewScorecardList.do",
                    messages.getMessage("prompt.view") + " " + messages.getMessage("prompt.aggregationWorksheet"),
                    "/aggregation.do?action=view"
                };
            } else if (roleId == Constants.ROLE_FINAL_REVIEWER) {
                // FinalReviewer
                return new String[]{
                    messages.getMessage("prompt.view") + " " + messages.getMessage("prompt.finalReview"),
                    "/finalReview.do?action=view"
                };
            } else if (roleId == Constants.ROLE_PROJECT_MANAGER || isAdmin) {
                if (isLink) {
                    return new String[]{
                        messages.getMessage("prompt.submission"),
                        "/projectDetail.do?action=" + Constants.PHASE_SUBMISSION,
                        messages.getMessage("prompt.screeningScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_SCREENING,
                        messages.getMessage("prompt.reviewScorecard"),
                        "/projectDetail.do?action=" + Constants.PHASE_REVIEW,
                        messages.getMessage("prompt.testcases"),
                        "/testCaseList.do",
                        messages.getMessage("prompt.appeals"),
                        "/projectDetail.do?action=" + Constants.PHASE_APPEALS,
                        messages.getMessage("prompt.aggregationWorksheet"),
                        "/aggregation.do?action=admin",
                        messages.getMessage("prompt.finalFix"),
                        "/projectDetail.do?action=" + Constants.PHASE_FINAL_FIX,
                        messages.getMessage("prompt.finalReview"),
                        "/finalReview.do?action=admin",
                        messages.getMessage("deliverable.terminateProject"),
                        "/editProject.do?action=terminate",
                        messages.getMessage("deliverable.editProject"),
                        "/editProject.do?action=edit"
                    };
                } else if (roleId == Constants.ROLE_PROJECT_MANAGER) {
                    return new String[]{"PM Review", ""};
                }
            }

        }

        if (isAdmin) {
            return new String[]{phase.getName(), ""};
        } else {
            return null;
        }
    }

    // --------------------------------------------------------- Utility Methods

    /**
     * Return the submission list.
     *
     * @return the submission list.
     */
    public ProjectType[] getProjectTypes() {
        if (useMockup) {
            return new FEMockupData().getProjectTypes();
        } else {
            ProjectType[] projectTypes = new PresentationUtility().getProjectTypes();

            for (int i = 0; i < projectTypes.length; i++) {
                for (int j = i + 1; j < projectTypes.length; j++) {
                    if (projectTypes[i].getId() > projectTypes[j].getId()) {
                        ProjectType tmp = projectTypes[i];
                        projectTypes[i] = projectTypes[j];
                        projectTypes[j] = tmp;
                    }
                }
            }
            return projectTypes;
        }
    }

    /**
     * Return the response types.
     *
     * @return the response types.
     */
    public ResponseType[] getResponseTypes() {
        if (useMockup) {
            return new FEMockupData().getResponseTypes();
        } else {
            return new PresentationUtility().getResponseTypes();
        }
    }

    /**
     * Return the objective evaluations.
     *
     * @return the objective evaluations.
     */
    public Evaluation[] getObjectiveEvaluations() {
        if (useMockup) {
            return new FEMockupData().getObjectiveEvaluations();
        } else {
            return new PresentationUtility().getObjectiveEvaluations();
        }
    }

    /**
     * Return the subjective evaluations.
     *
     * @return the subjective evaluations.
     */
    public Evaluation[] getSubjectiveEvaluations() {
        if (useMockup) {
            return new FEMockupData().getSubjectiveEvaluations();
        } else {
            return new PresentationUtility().getSubjectiveEvaluations(SubjectiveScorecardQuestion.ANSWER_1234);
        }
    }

    public Evaluation[] getSubjectiveEvaluations(int answerType) {
        if (useMockup) {
            return new FEMockupData().getSubjectiveEvaluations();
        } else {
            return new PresentationUtility().getSubjectiveEvaluations(answerType);
        }
    }

    /**
     * Return the review sections.
     *
     * @return the review sections.
     */
    public ScorecardSection[] getReviewSections() {
        if (useMockup) {
            return new FEMockupData().getReviewSections();
        } else {
            return new PresentationUtility().getScorecardSections();
        }
    }

    /**
     * Return the screening sections.
     *
     * @return the screening sections.
     */
    public ScorecardSection[] getScreeningSections() {
        if (useMockup) {
            return new FEMockupData().getScreeningSections();
        } else {
            return new PresentationUtility().getScorecardSections();
        }
    }

    /**
     * Return the reviewer responsibilities.
     *
     * @return the reviewer responsibilities.
     */
    public ReviewerResponsibility[] getReviewerResponsibilities() {
        if (useMockup) {
            return new FEMockupData().getReviewerResponsibilities();
        } else {
            return new PresentationUtility().getReviewerResponsibilities();
        }
    }

    /**
     * Return the test case approvals.
     *
     * @return the test case approvals.
     */
    public TestCaseApproval[] getTestCaseApprovals() {
        if (useMockup) {
            return new FEMockupData().getTestCaseApprovals();
        } else {
            return new PresentationUtility().getTestCaseApprovals();
        }
    }

    /**
     * Return the aggregation response statuses.
     *
     * @return the aggregation response statuses.
     */
    public AggregationResponseStatus[] getAggregationResponseStatuses() {
        if (useMockup) {
            return new FEMockupData().getAggregationResponseStatuses();
        } else {
            return new PresentationUtility().getAggregationResponseStatuses();
        }
    }

    /**
     * Return the aggregation approvals.
     *
     * @return the aggregation approvals.
     */
    public AggregationApproval[] getAggregationApprovals() {
        if (useMockup) {
            return new FEMockupData().getAggregationApprovals();
        } else {
            return new PresentationUtility().getAggregationApproval();
        }
    }

    /**
     * Return the final fix statuses.
     *
     * @return the final fix statuses.
     */
    public FinalFixStatus[] getFinalFixStatuses() {
        if (useMockup) {
            return new FEMockupData().getFinalFixStatuses();
        } else {
            return new PresentationUtility().getFinalFixStatuses();
        }
    }

    /**
     * Return the payment statuses.
     *
     * @return the payment statuses.
     */
    public PaymentStatus[] getPaymentStatuses() {
        if (useMockup) {
            return new FEMockupData().getPaymentStatuses();
        } else {
            return new PresentationUtility().getPaymentStatuses();
        }
    }

    /**
     * Return the project statuses.
     *
     * @return the project statuses.
     */
    public ProjectStatus[] getProjectStatuses() {
        if (useMockup) {
            return new FEMockupData().getProjectStatuses();
        } else {
            return new PresentationUtility().getProjectStatuses();
        }
    }

    /**
     * Return the user by handle.
     *
     * @return the user according to the handle.
     */
    public User getUserByHandle(String handle) {
        if (useMockup) {
            return new FEMockupData().getUserByHandle(handle);
        } else {
            return new PresentationUtility().getUser(handle);
        }
    }

    /**
     * Download the testcases file.
     *
     * @param data The input action data.
     * @return the result of testcases retrieval.
     */
    public ResultData getTestCases(ActionData data) {
        if (useMockup) {
            // TODO Fix mockup?
            return null;
        } else {
            return new RetrieveTestCases().start(data);
        }
    }

    /**
     * Download the testcases file.
     *
     * @param data The input action data.
     * @return the result of testcases file download.
     */
    public ResultData testCasesDownload(ActionData data) {
        if (useMockup) {
            // TODO Fix mockup?
            return null;
        } else {
            return new TestCasesDownload().start(data);
        }
    }

    /**
     * Submit the testcases.
     *
     * @param data The input action data.
     * @return the result of submission.
     */
    public ResultData submitTestCases(ActionData data) {
        if (useMockup) {
            // TODO Fix mockup?
            return null;
        } else {
            return new SubmitTestCases().start(data);
        }
    }

    public ScorecardTemplate[] getScorecardTemplates() {
        if (useMockup) {
            return null;
        } else {
            return new PresentationUtility().getScorecardTemplates();
        }
    }
    // ------------------------------------------------------- Methods for tests

    public User[] getUsers() {
        return new FEMockupData().getUsers();
    }

    public UserProjectInfo[] getUserProjectInfos() {
        return new FEMockupData().getUserProjectInfos();
    }

    public ScreeningScorecard[] getScreeningScorecards() {
        return new FEMockupData().getScreeningScorecards();
    }

    public ReviewScorecard[] getReviewScorecards() {
        return new FEMockupData().getReviewScorecards();
    }

    public TestCaseReview[] getTestCaseReviews() {
        return new FEMockupData().getTestCaseReviews();
    }

    public AggregationWorksheet getAggregationWorksheet() {
        return new FEMockupData().getAggregationWorksheet();
    }

    public AggregationReview[] getAggregationReviews() {
        return new FEMockupData().getAggregationReviews();
    }

    public FinalReview getFinalReview() {
        return new FEMockupData().getFinalReview();
    }

    public AbstractSubmission[] getSubmissions() {
        return new FEMockupData().getSubmissions();
    }

    public Project[] getProjects() {
        return new FEMockupData().getProjects();
    }

    public ScorecardQuestion[] getScreeningQuestions() {
        return new FEMockupData().getScreeningQuestions();
    }

    public ScorecardQuestion[] getReviewQuestions() {
        return new FEMockupData().getReviewQuestions();
    }
}
