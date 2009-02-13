/*
 * DocumentManagerBean.java
 *
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.IncorrectProjectStateException;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

import javax.ejb.CreateException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;


/**
 * The DocumentManagerBean handles all the documents for the
 * Online Review project.
 *
 * @author FatClimber
 */
public class DocumentManagerBean implements SessionBean {
    private Log log;
    private SessionContext ejbContext;
    private DataSource dataSource;
    //private ProjectTrackerLocal projectTracker;
    private IdGen idGen;

    private static final double EPS = 1e-10;


    private HashMap userMap;

    private void info(String msg) {
        try {
            log.log(Level.INFO, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void debug(String msg) {
        try {
            log.log(Level.DEBUG, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void error(String msg) {
        try {
            log.log(Level.ERROR, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    /**
     * Get an array of ScreeningScorecards for the given project.
     * If requestor is screener, return all ScreeningScorecards currently saved
     * and new ScreeningScorecard-objects for the rest of the submitters with
     * the id set to -1.
     * If requestor is submitter, return his ScreeningScorecard if it is
     * completed.
     * Else, return all ScreeningScorecards for the project.
     *
     * @param project - the project to get the ScreeningScorecards for.
     * @param requestor
     *
     * @return ScreeningScorecard[]
     */
    public ScreeningScorecard[] getScreeningScorecard(Project project, TCSubject requestor) {
        info("DM.getScreeningScorecard(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AbstractScorecard[] absScore = getScorecards(project, requestor, ScreeningScorecard.SCORECARD_TYPE, -1, -1, false);

        info("DM.getScreeningScorecard(), nrScorecards: " + absScore.length);
        return (ScreeningScorecard[]) absScore;
    }

    /**
     * Get an array of ScreeningScorecards for the given project.
     * If requestor is screener, return all ScreeningScorecards currently saved
     * and new ScreeningScorecard-objects for the rest of the submitters with
     * the id set to -1.
     * If requestor is submitter, return his ScreeningScorecard if it is
     * completed.
     * Else, return all ScreeningScorecards for the project.
     *
     * @param project - the project to get the ScreeningScorecards for.
     * @param requestor
     *
     * @return ScreeningScorecard[]
     */
    public ScreeningScorecard[] getScreeningScorecardFull(Project project, TCSubject requestor) {
        info("DM.getScreeningScorecardFull(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AbstractScorecard[] absScore = getScorecards(project, requestor, ScreeningScorecard.SCORECARD_TYPE, -1, -1, true);

        info("DM.getScreeningScorecard(), nrScorecards: " + absScore.length);
        return (ScreeningScorecard[]) absScore;
    }

    /**
     * Get an array of ReviewScorecards for the given project.
     *
     * @param project
     * @param requestor
     *
     * @return ReviewScorecard[]
     */
    public ReviewScorecard[] getReviewScorecardFull(Project project, TCSubject requestor) {
        info("DM.getReviewScorecardFull(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AbstractScorecard[] absScore = getScorecards(project, requestor, ReviewScorecard.SCORECARD_TYPE, -1, -1, true);

        return (ReviewScorecard[]) absScore;
    }

    /**
     * Get an array of ReviewScorecards for the given project.
     *
     * @param project
     * @param requestor
     *
     * @return ReviewScorecard[]
     */
    public ReviewScorecard[] getReviewScorecard(Project project, TCSubject requestor) {
        info("DM.getReviewScorecard(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AbstractScorecard[] absScore = getScorecards(project, requestor, ReviewScorecard.SCORECARD_TYPE, -1, -1, false);

        return (ReviewScorecard[]) absScore;
    }

    /**
     * DOCUMENT ME!
     *
     * @param submitterId
     * @param reviewerId
     * @param requestor
     *
     * @return ReviewScorecard
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public ReviewScorecard getReviewScorecard(Project project, long reviewerId, long submitterId, TCSubject requestor) {
        info("DM.getReviewScorecard(), projectId: " + project.getId() +
                ", reviewerId: " + reviewerId +
                ", submitterId: " + submitterId +
                ", requestorId: " + requestor.getUserId());

        AbstractScorecard[] absScore = getScorecards(project, requestor, ReviewScorecard.SCORECARD_TYPE, submitterId, reviewerId, true);
        if (absScore.length != 1) {
            error("DM.getReviewScorecard(), can't find scorecard!");
            return null;
        }
        return (ReviewScorecard) absScore[0];
    }

    /**
     * Retrieve an array of scorecards. Helper-method for getScreeningScorecard() and getReviewScorecard().
     *
     * @param project
     * @param requestor
     * @param scorecardType
     * @param submitterId
     * @param reviewerId
     * @param retrieveQuestions
     *
     * @return AbstractScorecard[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    private AbstractScorecard[] getScorecards(Project project,
                                              TCSubject requestor, int scorecardType, long submitterId, long reviewerId,
                                              boolean retrieveQuestions) {

        List scorecardList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (submitterId > 0 && scorecardType == ReviewScorecard.SCORECARD_TYPE) {
                // Only get ReviewScorecards with submitter: submitterId
                // reviewer: reviewerId
                ps = conn.prepareStatement(
                        "SELECT s.scorecard_id, " +
                        "s.is_completed, s.is_pm_reviewed, " +
                        "s.author_id, s.submission_id, s.score, " +
                        "s.scorecard_v_id, sub.is_removed, s.raw_score, s.pm_review_timestamp " +
                        "FROM scorecard s, submission sub " +
                        "WHERE s.cur_version = 1 AND " +
                        "sub.cur_version = 1 AND " +
                        "s.submission_id = sub.submission_id AND " +
                        "s.project_id = ? AND " +
                        "s.scorecard_type = ? AND " +
                        "s.author_id = ? AND " +
                        "sub.submitter_id = ? " +
                        "ORDER BY s.scorecard_id");
                ps.setLong(1, project.getId());
                ps.setInt(2, scorecardType);
                ps.setLong(3, reviewerId);
                ps.setLong(4, submitterId);

            } else if (project.getCurrentPhase().getId() == Phase.ID_REVIEW &&
                    Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER) &&
                    scorecardType == ReviewScorecard.SCORECARD_TYPE) {
                // Only get ReviewScorecards where author = requestor
                ps = conn.prepareStatement(
                        "SELECT s.scorecard_id, " +
                        "s.is_completed, s.is_pm_reviewed, " +
                        "s.author_id, s.submission_id, s.score, " +
                        "s.scorecard_v_id, sub.is_removed, s.raw_score, s.pm_review_timestamp, rur.r_user_role_id " +
                        "FROM scorecard s, submission sub, r_user_role rur " +
                        "WHERE s.cur_version = 1 AND " +
                        "sub.cur_version = 1 AND " +
                        "s.submission_id = sub.submission_id AND " +
                        "rur.project_id = s.project_id AND " +
                        "rur.login_id = sub.submitter_id AND " +
                        "rur.cur_version = 1 AND " +
                        "rur.r_role_id = 1 AND " +
                        "s.project_id = ? AND " +
                        "s.scorecard_type = ? AND " +
                        "s.author_id = ? " +
                        "ORDER BY rur.r_user_role_id");
                ps.setLong(1, project.getId());
                ps.setInt(2, scorecardType);
                ps.setLong(3, requestor.getUserId());

            } else if (Common.isRole(project, requestor.getUserId(), Role.ID_DESIGNER_DEVELOPER)) {
                // Only get completed Scorecards where submitter = requestor
                if (scorecardType == ScreeningScorecard.SCORECARD_TYPE) {
                    // Don't return anything if we're still in submission phase.
                    if (project.getCurrentPhase().getId() == Phase.ID_SUBMISSION) {
                        return new ScreeningScorecard[0];
                    }
                }
                ps = conn.prepareStatement(
                        "SELECT s.scorecard_id, " +
                        "s.is_completed, s.is_pm_reviewed, " +
                        "s.author_id, s.submission_id, s.score, " +
                        "s.scorecard_v_id, sub.is_removed, s.raw_score, s.pm_review_timestamp " +
                        "FROM scorecard s, submission sub " +
                        "WHERE s.cur_version = 1 AND " +
                        "sub.cur_version = 1 AND " +
                        "s.submission_id = sub.submission_id AND " +
                        "s.project_id = ? AND " +
                        "s.scorecard_type = ? AND " +
                        "sub.submitter_id = ? AND " +
                        "s.is_completed = 1 " +
                        "ORDER BY s.scorecard_id");
                ps.setLong(1, project.getId());
                ps.setInt(2, scorecardType);
                ps.setLong(3, requestor.getUserId());

            } else {
                // Find (all) the scorecards for the project
                ps = conn.prepareStatement(
                        "SELECT s.scorecard_id, " +
                        "s.is_completed, s.is_pm_reviewed, " +
                        "s.author_id, s.submission_id, s.score, " +
                        "s.scorecard_v_id, sub.is_removed, s.raw_score, s.pm_review_timestamp, rur.r_user_role_id " +
                        "FROM scorecard s, submission sub, r_user_role rur " +
                        "WHERE s.cur_version = 1 AND " +
                        "sub.cur_version = 1 AND " +
                        "rur.project_id = s.project_id AND " +
                        "rur.login_id = sub.submitter_id AND " +
                        "rur.cur_version = 1 AND " +
                        "rur.r_role_id = 1 AND " +
                        "s.submission_id = sub.submission_id AND " +
                        "s.project_id = ? AND " +
                        "s.scorecard_type = ? " +
                        "ORDER BY rur.r_user_role_id");
                ps.setLong(1, project.getId());
                ps.setInt(2, scorecardType);

            }

            rs = ps.executeQuery();

            // For every scorecard
            while (rs.next()) {
                long scorecardId = rs.getLong(1);
                boolean isCompleted = rs.getBoolean(2);
                boolean isPMReviewed = rs.getBoolean(3);
                long authorId = rs.getLong(4);
                long submissionId = rs.getLong(5);
                double score = rs.getDouble(6);
                long scorecardVersionId = rs.getLong(7);
                boolean subIsRemoved = rs.getBoolean(8);
                double raw_score = rs.getDouble("raw_score");
                java.sql.Timestamp pm_review_timestamp = rs.getTimestamp("pm_review_timestamp");

                // TODO Retrieve a new Project???
                User author = Common.getUser(dataSource, authorId);

                InitialSubmission submission = null;

                AbstractSubmission[] submissionArr = getSubmissions(project, requestor,
                        InitialSubmission.SUBMISSION_TYPE, submissionId, subIsRemoved, false);

                if (submissionArr.length != 1) {
                    throw new RuntimeException("Could not find matching submission for scorecard!");
                }
                submission = (InitialSubmission) submissionArr[0];

                ScorecardQuestion[] scorecardQuestion = null;
                if (retrieveQuestions) {
                    scorecardQuestion = getScorecardQuestions(scorecardId);
                }


                AbstractScorecard scorecard = null;

                if (scorecardType == ScreeningScorecard.SCORECARD_TYPE) {
                    boolean passed = getPassedScreening(scorecardId);
                    scorecard = new ScreeningScorecard(scorecardId, isCompleted, isPMReviewed, scorecardQuestion,
                            author, project, submission, score, requestor.getUserId(), scorecardVersionId, raw_score, pm_review_timestamp);
                    ((ScreeningScorecard) scorecard).setPassed(passed);
                } else {
                    scorecard = new ReviewScorecard(scorecardId, isCompleted, isPMReviewed, scorecardQuestion,
                            author, project, submission, score, requestor.getUserId(), scorecardVersionId, raw_score, pm_review_timestamp);
                }

                scorecardList.add(scorecard);

            } // end while for retrieving scorecards

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        if ((project.getCurrentPhase().getId() == Phase.ID_REVIEW &&
                Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER) &&
                scorecardType == ReviewScorecard.SCORECARD_TYPE) ||
                (project.getCurrentPhase().getId() == Phase.ID_SCREENING &&
                Common.isRole(project, requestor.getUserId(), Role.ID_PRIMARY_SCREENER) &&
                scorecardType == ScreeningScorecard.SCORECARD_TYPE)) {
            List createdScorecardList;
            try {
                if (submitterId > 0) {
                    createdScorecardList = createScorecards(project, reviewerId, submitterId, scorecardList, retrieveQuestions);
                } else {
                    createdScorecardList = createScorecards(project, requestor.getUserId(), -1, scorecardList, retrieveQuestions);
                }
            } catch (InvalidEditException e1) {
                throw new RuntimeException(e1);
            } catch (IncorrectProjectStateException e1) {
                throw new RuntimeException(e1);
            } catch (DocumentAlreadySubmittedException e1) {
                throw new RuntimeException(e1);
            } catch (GeneralSecurityException e1) {
                throw new RuntimeException(e1);
            } catch (ConcurrentModificationException e1) {
                throw new RuntimeException(e1);
            }
            if (createdScorecardList != null) {
                scorecardList.addAll(createdScorecardList);
            }
        }

        if (scorecardType == ScreeningScorecard.SCORECARD_TYPE) {
            return (ScreeningScorecard[]) scorecardList.toArray(new ScreeningScorecard[0]);
        } else {
            return (ReviewScorecard[]) scorecardList.toArray(new ReviewScorecard[0]);
        }
    }

    private boolean getPassedScreening(long scorecardId) {
        boolean passed = true;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT sq.evaluation_id, " +
                    "qt.question_type " +
                    "FROM scorecard_question sq, question_template qt " +
                    "WHERE sq.cur_version = 1 AND " +
                    //"qt.cur_version = 1 AND " +
                    "qt.q_template_v_id = sq.q_template_v_id AND " +
                    "qt.question_type = " + ScorecardQuestion.SCORECARD_TYPE + " AND " +
                    "sq.evaluation_id = " + Evaluation.ID_NO + " AND " +
                    "sq.scorecard_id = ? ");
            ps.setLong(1, scorecardId);
            rs = ps.executeQuery();

            if (rs.next()) {
                passed = false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return passed;
    }

    /**
     * Get all scorecardQuestions for a given scorecard.
     *
     * @param scorecardId id for the scorecard.
     *
     * @return ScorecardQuestion[] array of quesitons for scorecard.
     */
    private ScorecardQuestion[] getScorecardQuestions(long scorecardId) {
        return getScorecardQuestions(scorecardId, -1);
    }

    /**
     * Get a scorecardQuestion given a questionId.
     *
     * @param questionId id for the quesiton to be retrieved.
     *
     * @return ScorecardQuestion the retrieved question.
     */
    private ScorecardQuestion getScorecardQuestion(long questionId) {
        return getScorecardQuestions(-1, questionId)[0];
    }

    /**
     * Helper-function. Gets one or several scorecardQuestions. Takes either a scorecardId or a questionId. The
     * parameter not used should be set to -1.
     *
     * @param scorecardId
     * @param reqQuestionId
     *
     * @return ScorecardQuestion[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    private ScorecardQuestion[] getScorecardQuestions(long scorecardId, long reqQuestionId) {
        List scorecardQuestionList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (reqQuestionId == -1) {
                ps = conn.prepareStatement(
                        "SELECT sq.question_id, qt.question_text, qt.question_weight, " +
                        "qt.question_seq_loc, sq.evaluation_id, qt.section_id, " +
                        "qt.question_type, sq.q_template_v_id, sq.question_v_id, " +
                        "ss.section_seq_loc, ssg.group_seq_loc, " +
                        "tq.total_tests, tq.total_pass, " +
                        "ss.section_name, ss.section_weight, " +
                        "ssg.group_id, ssg.group_name " +
                        "FROM scorecard_question sq, question_template qt, " +
                        "scorecard_section ss, sc_section_group ssg, " +
                        "OUTER testcase_question tq " +
                        "WHERE sq.cur_version = 1 AND " +
                        //"qt.cur_version = 1 AND " +
                        "tq.cur_version = 1 AND " +
                        "sq.question_id = tq.question_id AND " +
                        "qt.q_template_v_id = sq.q_template_v_id AND " +
                        "qt.section_id = ss.section_id AND " +
                        "ss.group_id = ssg.group_id AND " +
                        "sq.scorecard_id = ? " +
                        "ORDER BY ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc");
                ps.setLong(1, scorecardId);
            } else {
                ps = conn.prepareStatement(
                        "SELECT sq.question_id, qt.question_text, qt.question_weight, " +
                        "qt.question_seq_loc, sq.evaluation_id, qt.section_id, " +
                        "qt.question_type, sq.q_template_v_id, sq.question_v_id, " +
                        "ss.section_seq_loc, ssg.group_seq_loc, " +
                        "tq.total_tests, tq.total_pass, " +
                        "ss.section_name, ss.section_weight, " +
                        "ssg.group_id, ssg.group_name " +
                        "FROM scorecard_question sq, question_template qt, " +
                        "scorecard_section ss, sc_section_group ssg, " +
                        "OUTER testcase_question tq " +
                        "WHERE sq.cur_version = 1 AND " +
                        //"qt.cur_version = 1 AND " +
                        "tq.cur_version = 1 AND " +
                        "sq.question_id = tq.question_id AND " +
                        "qt.q_template_v_id = sq.q_template_v_id AND " +
                        "qt.section_id = ss.section_id AND " +
                        "ss.group_id = ssg.group_id AND " +
                        "sq.question_id = ? " +
                        "ORDER BY ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc");
                ps.setLong(1, reqQuestionId);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                long questionId = rs.getLong(1);
                String questionText = rs.getString(2);
                int questionWeight = rs.getInt(3);
                int questionSeqLoc = rs.getInt(4);
                long evaluationId = rs.getLong(5);
                long sectionId = rs.getLong(6);
                int questionType = rs.getInt(7);
                long questionTemplateId = rs.getLong(8);
                long questionVersionId = rs.getLong(9);
                int sectionSeqLoc = rs.getInt(10);
                int groupSeqLoc = rs.getInt(11);
                int totalTests = rs.getInt(12);
                int totalPass = rs.getInt(13);

                String sectionName = rs.getString(14);
                int sectionWeight = rs.getInt(15);
                long groupId = rs.getLong(16);
                String groupName = rs.getString(17);

                EvaluationManager evaluationManager = (EvaluationManager) Common.getFromCache("EvaluationManager");
                Evaluation evaluation = evaluationManager.getEvaluation(evaluationId);
                //ScorecardSectionManager scorecardSectionManager = (ScorecardSectionManager) Common.getFromCache(
                //"ScorecardSectionManager");
                //ScorecardSection scorecardSection = scorecardSectionManager.getScorecardSection(sectionId);

                ScorecardSectionGroup sectionGroup = new ScorecardSectionGroup(groupId, groupName, groupSeqLoc);
                ScorecardSection scorecardSection = new ScorecardSection(sectionId, sectionName, sectionWeight,
                        sectionSeqLoc, sectionGroup);

                ScorecardQuestion scorecardQuestion = null;

                if (questionType == ScorecardQuestion.SCORECARD_TYPE) {
                    scorecardQuestion = new ScorecardQuestion(questionId, evaluation, questionText, questionWeight,
                            scorecardSection, questionSeqLoc, questionTemplateId, questionVersionId);
                } else if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE ||
                        questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE_YESNO) {
                    SubjectiveResponse[] subjResp = getSubjectiveResp(questionId);
                    int answerType = SubjectiveScorecardQuestion.ANSWER_1234;
                    if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE)
                        answerType = SubjectiveScorecardQuestion.ANSWER_1234;
                    else if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE_YESNO)
                        answerType = SubjectiveScorecardQuestion.ANSWER_YESNO;
                    scorecardQuestion = new SubjectiveScorecardQuestion(questionId, evaluation, questionText,
                            questionWeight, scorecardSection, questionSeqLoc, subjResp,
                            answerType, questionTemplateId, questionVersionId);
                } else if (questionType == TestCaseScorecardQuestion.SCORECARD_TYPE) {
                    SubjectiveResponse[] subjResp = getSubjectiveResp(questionId);
                    scorecardQuestion = new TestCaseScorecardQuestion(questionId, evaluation, questionText,
                            questionWeight, scorecardSection, questionSeqLoc, subjResp, totalPass, totalTests,
                            questionTemplateId, questionVersionId);
                } else {
                    throw new RuntimeException("getScorecardQuestions(), unknown question type: " + questionType);
                }

                scorecardQuestionList.add(scorecardQuestion);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return (ScorecardQuestion[]) scorecardQuestionList.toArray(new ScorecardQuestion[0]);
    }

    /**
     * Get an array of SubjectiveResponses belonging to a ScorecardQuestion with the requested questionId.
     *
     * @param questionId
     *
     * @return SubjectiveResponse[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    private SubjectiveResponse[] getSubjectiveResp(long questionId) {

        List subjRespList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT sr.subjective_resp_id, sr.response_text, " +
                    "sr.response_type_id, sr.subjective_r_v_id " +
                    "FROM subjective_resp sr " +
                    "WHERE sr.cur_version = 1 AND " +
                    "sr.question_id = ?");
            ps.setLong(1, questionId);
            rs = ps.executeQuery();

            while (rs.next()) {
                long respId = rs.getLong(1);
                String respText = rs.getString(2);
                long respTypeId = rs.getLong(3);
                long subjVersionId = rs.getLong(4);

                ResponseTypeManager responseTypeManager = (ResponseTypeManager) Common.getFromCache(
                        "ResponseTypeManager");
                ResponseType respType = responseTypeManager.getResponseType(respTypeId);

                SubjectiveResponse subjResp = new SubjectiveResponse(respId, respText, respType, subjVersionId);
                subjRespList.add(subjResp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return (SubjectiveResponse[]) subjRespList.toArray(new SubjectiveResponse[0]);
    }

    /**
     * Save a ReviewScorecard to the database.
     *
     * @param scorecard the scorecard to save.
     * @param requestor the TCSubject for the requestor
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws GeneralSecurityException
     * @throws ConcurrentModificationException
     */
    public void saveReviewScorecard(ReviewScorecard scorecard, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            GeneralSecurityException,
            ConcurrentModificationException {
        info("DM.saveReviewScorecard(), scorecardId: " + scorecard.getId());
        saveScorecard(scorecard, requestor);
    }

    /**
     * Save a ScreeningScorecard to the database.
     *
     * @param scorecard the scorecard to save.
     * @param requestor the TCSubject for the requestor
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws GeneralSecurityException
     * @throws ConcurrentModificationException
     */
    public void saveScreeningScorecard(ScreeningScorecard scorecard, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            GeneralSecurityException,
            ConcurrentModificationException {
        info("DM.saveScreeningScorecard(), scorecardId: " + scorecard.getId());
        saveScorecard(scorecard, requestor);
    }

    /**
     * Helper-function for saveReviewScorecard() and saveScreeningScorecard(). Saves a scorecard to the database.
     *
     * @param scorecard the scorecard to save.
     * @param requestor the TCSubject for the requestor
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws GeneralSecurityException
     * @throws ConcurrentModificationException
     */
    private void saveScorecard(AbstractScorecard scorecard, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            GeneralSecurityException,
            ConcurrentModificationException {
        long requestorId = requestor.getUserId();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            long scorecardVID = -1;
            boolean scorecardIsCompleted = false;

            ps = conn.prepareStatement(
                    "SELECT scorecard_v_id, is_completed " +
                    "FROM scorecard " +
                    "WHERE scorecard_id = ? AND " +
                    "cur_version = 1");
            ps.setLong(1, scorecard.getId());
            rs = ps.executeQuery();
            if (rs.next()) {
                scorecardVID = rs.getLong(1);
                scorecardIsCompleted = rs.getBoolean(2);
            }

            //close the result set and PreparedStatement so they can be reused later - bblais
            Common.close(rs);
            Common.close(ps);
            rs = null;
            ps = null;

            boolean perm = false;
            if (scorecard instanceof ScreeningScorecard) {
                if ((Common.isRole(scorecard.getProject(), requestor.getUserId(), Role.ID_PRIMARY_SCREENER) &&
                        scorecard.getProject().getCurrentPhase().getId() == Phase.ID_SCREENING) ||
                        (Common.isAdmin(requestor))) {
                    perm = true;
                }
            } else {
/*  by cucu
                if ((Common.isRole(scorecard.getProject(), requestor.getUserId(), Role.ID_REVIEWER) &&
                     scorecard.getProject().getCurrentPhase().getId() == Phase.ID_REVIEW ||
                     scorecard.getProject().getCurrentPhase().getId() == Phase.ID_APPEALS) ||
                    (Common.isAdmin(requestor))) {
                    perm = true;
                }*/
                if ((Common.isRole(scorecard.getProject(), requestor.getUserId(), Role.ID_REVIEWER) &&
                        scorecard.getProject().getCurrentPhase().getId() == Phase.ID_REVIEW ||
                        scorecard.getProject().getCurrentPhase().getId() == Phase.ID_APPEALS ||
                        scorecard.getProject().getCurrentPhase().getId() == Phase.ID_APPEALS_RESPONSE) ||
                        (Common.isAdmin(requestor))) {
                    perm = true;
                }
            }
            if (!perm) {
                String errorMsg = "DM.saveScorecard(), no permission to save scorecard!";
                error(errorMsg);
                ejbContext.setRollbackOnly();
                throw new GeneralSecurityException(errorMsg);
            }

            // If scorecard is completed and the user isn't admin/pm,
            // or reviewer in appeals-phase
            // then don't allow save!
            if (scorecardIsCompleted &&
                    !(Common.isAdmin(requestor) ||
                    Common.isRole(scorecard.getProject(), requestorId, Role.ID_PRODUCT_MANAGER))) {
/* by cucu
            if (!(Common.isRole(scorecard.getProject(), requestorId, Role.ID_REVIEWER) &&
                        scorecard.getProject().getCurrentPhase().getId() == Phase.ID_APPEALS)) {
*/
                if (!(Common.isRole(scorecard.getProject(), requestorId, Role.ID_REVIEWER) &&
                        scorecard.getProject().getCurrentPhase().getId() == Phase.ID_APPEALS_RESPONSE)) {

                    String infoMsg = "DM.saveScorecard():\n" +
                            "scorecard_id: " + scorecard.getId() + "\n" +
                            "Scorecard is already completed!";
                    info(infoMsg);
                    ejbContext.setRollbackOnly();
                    throw new DocumentAlreadySubmittedException(infoMsg);
                }
            }

            if (scorecard.getDirty() == true) {
                if (scorecard.getId() != -1) {
                    // This is an existing scorecard

                    // Check if scorecard has been modified after calling
                    // the get-method.
                    if (scorecardVID != -1) {
                        if (scorecardVID != scorecard.getVersionId()) {
                            String errorMsg = "DM.saveScorecard(), Concurrent error, scorecardId: " + scorecard.getId() +
                                    ", scorecardVersionId: " + scorecard.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveScorecard(): Trying to save non-existing scorecard, scorecardId: " + scorecard.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    ps = conn.prepareStatement("UPDATE scorecard " +
                            "SET cur_version = 0 " +
                            "WHERE scorecard_id = ? AND " +
                            "cur_version = 1");
                    ps.setLong(1, scorecard.getId());

                    int nr = ps.executeUpdate();

                    if (nr == 0) {
                        error("DM.saveScorecard(): Trying to save non-existing scorecard, scorecardId: " + scorecard.getId());
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException("Trying to save non-existing scorecard!");
                    }

                    //close the PreparedStatement so it can be reused later - bblais
                    Common.close(ps);
                    ps = null;

                } else {
                    try {
                        // New Scorecard, check that it doesn't exist in db

                        ps = conn.prepareStatement(
                                "SELECT scorecard_v_id " +
                                "FROM scorecard " +
                                "WHERE cur_version = 1 AND " +
                                "scorecard_type = ? AND " +
                                "author_id = ? AND " +
                                "submission_id = ?");
                        if (scorecard instanceof ScreeningScorecard) {
                            ps.setInt(1, ScreeningScorecard.SCORECARD_TYPE);
                        } else {
                            ps.setInt(1, ReviewScorecard.SCORECARD_TYPE);
                        }
                        ps.setLong(2, scorecard.author.getId());
                        ps.setLong(3, scorecard.submission.getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveScorecard(), Concurrent error(saving new scorecard), scorecardId: " + scorecard.getId() +
                                    ", scorecardVersionId: " + scorecard.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        scorecard.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        error("DM.saveScorecard(), RemoteException trying to use id-generator:\n" + e1.toString());
                        throw new RuntimeException("DM.saveScorecard(), RemoteException trying to use id-generator:\n" + e1.toString());
                    } finally {
                        //close the PreparedStatement so it can be reused later - bblais
                        Common.close(rs);
                        Common.close(ps);
                        rs = null;
                        ps = null;
                    }
                    info("DM.saveScorecard(), Saving a new scorecard, id: " + scorecard.getId());
                }

                ps = conn.prepareStatement(
                        "INSERT INTO scorecard (scorecard_v_id, scorecard_id, scorecard_type, " +
                        "is_completed, " +
                        "is_pm_reviewed, author_id, project_id, " +
                        "submission_id, score, modify_user, cur_version," +
                        "raw_score, pm_review_timestamp) VALUES (" +
                        "0, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?, ?)");
                ps.setLong(1, scorecard.getId());

                if (scorecard instanceof ScreeningScorecard) {
                    ps.setInt(2, ScreeningScorecard.SCORECARD_TYPE);
                } else {
                    ps.setInt(2, ReviewScorecard.SCORECARD_TYPE);
                }

                ps.setBoolean(3, scorecard.isCompleted());
                ps.setBoolean(4, scorecard.isPMReviewed());
                ps.setLong(5, scorecard.getAuthor().getId());
                ps.setLong(6, scorecard.getProject().getId());
                ps.setLong(7, scorecard.getSubmission().getId());
                ps.setDouble(8, scorecard.getScore());
                ps.setLong(9, requestorId);
                ps.setDouble(10, scorecard.getRawScore());
                ps.setTimestamp(11, scorecard.getPMReviewTimestamp());

                int nr = ps.executeUpdate();

                if (nr != 1) {
                    String errorMsg = "DM.saveScorecard(): Could not insert scorecard!\n" +
                            ", scorecardId: " + scorecard.getId();
                    error(errorMsg);
                    ejbContext.setRollbackOnly();
                    throw new InvalidEditException(errorMsg);
                }

                //close the PreparedStatement so it can be reused later - bblais
                Common.close(ps);
                ps = null;

                info("DM.saveScorecard(): Scorecard inserted");
            }
            // end of save scorecard

            ScorecardQuestion[] scorecardQuestion = scorecard.getQuestions();
            info("DM.saveScorecard(): questionSaving()");
            int nrOfQuestions = scorecardQuestion == null ? 0 : scorecardQuestion.length;
            for (int i = 0; i < nrOfQuestions; i++) {
                //info("Question: " + i + "/" + scorecardQuestion.length);
                saveQuestion(conn, scorecardQuestion[i], scorecard.getId(), requestorId);
            }
            // end of question for-loop (questions)
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    private void saveQuestion(Connection conn, ScorecardQuestion question,
                              long scorecardId, long requestorId) throws ConcurrentModificationException {
        PreparedStatement psGetScorecardQuestion = null;
        PreparedStatement psUpdateScorecardQuestion = null;
        PreparedStatement psInsertScorecardQuestion = null;
        PreparedStatement psInsertTestCaseQuestion = null;
        PreparedStatement psUpdateTestCaseQuestion = null;
        ResultSet rsGetScorecardQuestion = null;
        try {
            if (question.getDirty() == true) {
                if (question.getId() > 0) {

                    // This is an existing ScorecardQuestion
                    psGetScorecardQuestion = conn.prepareStatement(
                            "SELECT question_v_id " +
                            "FROM scorecard_question " +
                            "WHERE question_id = ? AND " +
                            "cur_version = 1");
                    psGetScorecardQuestion.setLong(1, question.getId());
                    rsGetScorecardQuestion = psGetScorecardQuestion.executeQuery();

                    if (rsGetScorecardQuestion.next()) {
                        if (rsGetScorecardQuestion.getLong(1) != question.getVersionId()) {
                            String errorMsg = "DM.saveScorecard(): Concurrent error, scorecardQuestionId: " +
                                    question.getId() + ", scorecardQuestionVersionId: " +
                                    question.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveScorecard(): Trying to save non-existing scorecardQuestion, " +
                                "scorecardQuestionId: " + question.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    psUpdateScorecardQuestion = conn.prepareStatement(
                            "UPDATE scorecard_question " +
                            "SET cur_version = 0 " +
                            "WHERE question_id = ? AND " +
                            "cur_version = 1");
                    psUpdateScorecardQuestion.setLong(1, question.getId());

                    int nr = psUpdateScorecardQuestion.executeUpdate();

                    if (nr == 0) {
                        String errorMsg = "DM.saveScorecard(): Trying to save non-existing scorecardQuestion, " +
                                "scorecardQuestionId: " + question.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    Common.close(rsGetScorecardQuestion);
                    Common.close(psGetScorecardQuestion);
                    Common.close(psUpdateScorecardQuestion);

                } else {
                    // New ScorecardQuestion
                    try {
                        question.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        // TODO Auto-generated catch block
                        e1.printStackTrace();
                        throw new RuntimeException(e1);
                    }
                    info("New ScorecardQuestion, id: " + question.getId());
                }

                psInsertScorecardQuestion = conn.prepareStatement(
                        "INSERT INTO scorecard_question " +
                        "(question_v_id, question_id, " +
                        "evaluation_id, scorecard_id, " +
                        "modify_user, q_template_v_id, cur_version) " +
                        "VALUES (0, ?, ?, ?, ?, ?, 1)");

                psInsertScorecardQuestion.setLong(1, question.getId());

                Evaluation eval = question.getEvaluation();
                if (eval != null) {
                    psInsertScorecardQuestion.setLong(2, eval.getId());
                } else {
                    psInsertScorecardQuestion.setNull(2, Types.DECIMAL);
                }
                psInsertScorecardQuestion.setLong(3, scorecardId);
                psInsertScorecardQuestion.setLong(4, requestorId);
                psInsertScorecardQuestion.setLong(5, question.getVersion());

                int nr = psInsertScorecardQuestion.executeUpdate();

                Common.close(psInsertScorecardQuestion);

                if (nr != 1) {
                    String errorMsg = "DM.saveScorecard(): Could not insert scorecardQuestion, " +
                            "scorecardQuestionId: " + question.getId();
                    error(errorMsg);
                    ejbContext.setRollbackOnly();
                    throw new InvalidEditException(errorMsg);
                }
            }
            // end of isDirtyQuestion

            if (question instanceof SubjectiveScorecardQuestion) {
                boolean subjDirty = ((SubjectiveScorecardQuestion) question).getSubjDirty();
                SubjectiveResponse[] subjResp = ((SubjectiveScorecardQuestion) question).getResponses();
                saveSubjectiveResponses(conn, subjResp, question.getId(), subjDirty, requestorId);
                ((SubjectiveScorecardQuestion) question).setSubjDirty(false);
            }
            if (question instanceof TestCaseScorecardQuestion) {
                SubjectiveResponse[] subjResp = ((TestCaseScorecardQuestion) question).getResponses();
                boolean testDirty = ((TestCaseScorecardQuestion) question).getTestCaseDirty();
                saveSubjectiveResponses(conn, subjResp, question.getId(), testDirty, requestorId);
                if (testDirty == true) {

                    psUpdateTestCaseQuestion = conn.prepareStatement(
                            "UPDATE testcase_question " +
                            "SET cur_version = 0 " +
                            "WHERE question_id = ? AND " +
                            "cur_version = 1");
                    psUpdateTestCaseQuestion.setLong(1, question.getId());

                    int nr = psUpdateTestCaseQuestion.executeUpdate();

                    Common.close(psUpdateTestCaseQuestion);

                    psInsertTestCaseQuestion = conn.prepareStatement(
                            "INSERT INTO testcase_question " +
                            "(tc_question_v_id, question_id, " +
                            "total_tests, total_pass, " +
                            "modify_user, cur_version) " +
                            "VALUES (0, ?, ?, ?, ?, 1)");
                    psInsertTestCaseQuestion.setLong(1, question.getId());
                    psInsertTestCaseQuestion.setInt(2, ((TestCaseScorecardQuestion) question).getTotalTests());
                    psInsertTestCaseQuestion.setInt(3, ((TestCaseScorecardQuestion) question).getTotalPass());
                    psInsertTestCaseQuestion.setLong(4, requestorId);

                    nr = psInsertTestCaseQuestion.executeUpdate();

                    Common.close(psInsertTestCaseQuestion);

                    if (nr != 1) {
                        String errorMsg = "DM.saveScorecard(): Could not insert testCaseScorecardQuestion, " +
                                "scorecardQuestionId: " + question.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(rsGetScorecardQuestion);
            Common.close(psGetScorecardQuestion);
            Common.close(psUpdateScorecardQuestion);
            Common.close(psInsertScorecardQuestion);
            Common.close(psInsertTestCaseQuestion);
            Common.close(psUpdateTestCaseQuestion);
        }
    }

    /**
     * Save a subjectiveResponse.
     *
     * @param conn
     * @param subjResp
     * @param questionId
     * @param requestorId
     *
     * @throws RuntimeException DOCUMENT ME!
     * @throws ConcurrentModificationException
     */
    private void saveSubjectiveResponses(Connection conn,
                                         SubjectiveResponse[] subjResp,
                                         long questionId,
                                         boolean questionDirty,
                                         long requestorId)
            throws ConcurrentModificationException {
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            for (int j = 0; j < subjResp.length; j++) {
                if (subjResp[j].getDirty() == true) {
                    if (subjResp[j].getId() > 0) {
                        ps = conn.prepareStatement(
                                "SELECT subjective_r_v_id " +
                                "FROM subjective_resp " +
                                "WHERE subjective_resp_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, subjResp[j].getId());
                        rs = ps.executeQuery();

                        if (rs.next()) {
                            if (rs.getLong(1) != (subjResp[j]).getVersionId()) {
                                String errorMsg = "DM.saveSubjectiveResponses(): Concurrent error, subjResponseId: " +
                                        (subjResp[j]).getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new ConcurrentModificationException(errorMsg);
                            }
                        } else {
                            String errorMsg = "DM.saveSubjectiveResponses(): Trying to save non-existing SubjectiveResponse, " +
                                    "subjectiveResponseId: " + (subjResp[j]).getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }

                        //close the PreparedStatement so it can be reused later - bblais
                        Common.close(rs);
                        Common.close(ps);
                        rs = null;
                        ps = null;

                        ps = conn.prepareStatement(
                                "UPDATE subjective_resp " +
                                "SET cur_version = 0 " +
                                "WHERE subjective_resp_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, subjResp[j].getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveSubjectiveResponses(): Trying to save non-existing SubjectiveResponse, " +
                                    "subjectiveResponseId: " + (subjResp[j]).getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }

                        //close the PreparedStatement so it can be reused later - bblais
                        Common.close(ps);
                        ps = null;

                        info("DM.saveSubjectiveResponses(): subjectiveResponse cur_version set to 0");
                    } else {
                        // New SubjectiveResponse
                        try {
                            subjResp[j].setId(idGen.nextId());
                        } catch (RemoteException e1) {
                            // TODO Auto-generated catch block
                            e1.printStackTrace();
                            throw new RuntimeException(e1);
                        }
                    }
                    // end of remove old version

                    ps = conn.prepareStatement(
                            "INSERT INTO subjective_resp " +
                            "(subjective_r_v_id, subjective_resp_id, " +
                            "response_text, response_type_id, " +
                            "question_id, modify_user, " +
                            "cur_version) " +
                            "VALUES (0, ?, ?, ?, ?, ?, 1)");
                    ps.setLong(1, subjResp[j].getId());
                    ps.setString(2, subjResp[j].getResponseText());
                    ps.setLong(3, subjResp[j].getResponseType().getId());
                    ps.setLong(4, questionId);
                    ps.setLong(5, requestorId);

                    int nr = ps.executeUpdate();

                    if (nr == 0) {
                        String errorMsg = "DM.saveSubjectiveResponses(): Could not insert SubjectiveResponse, " +
                                "subjectiveResponseId: " + subjResp[j].getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    //close the PreparedStatement so it can be reused later - bblais
                    Common.close(ps);
                    ps = null;

                }
                // end of insert new version
            }
            // end of for-loop

            if (questionDirty) {
                // remove(set cur_version to 0) deleted responses
                StringBuffer sqlString;

                if (subjResp.length != 0) {
                    sqlString = new StringBuffer(
                            "UPDATE subjective_resp " +
                            "SET cur_version = 0 " +
                            "WHERE cur_version = 1 AND " +
                            "question_id = ? AND " +
                            "subjective_resp_id NOT IN (");

                    for (int i = 0; i < subjResp.length; i++) {
                        if (i != 0) {
                            sqlString.append(",");
                        }

                        sqlString.append("?");
                    }

                    sqlString.append(")");
                } else {
                    sqlString = new StringBuffer(
                            "UPDATE subjective_resp " +
                            "SET cur_version = 0 " +
                            "WHERE cur_version = 1 AND " +
                            "question_id = ?");
                }

                ps = conn.prepareStatement(sqlString.toString());
                ps.setLong(1, questionId);

                for (int i = 0; i < subjResp.length; i++) {
                    ps.setLong(i + 2, subjResp[i].getId());
                }

                ps.executeUpdate();

                //close the PreparedStatement so it can be reused later - bblais
                Common.close(ps);
                ps = null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(rs);
            Common.close(ps);
        }
    }

    /**
     * Get an array of InitialSubmission for the given project from the database.
     * If the requestor is an admin or a reviewer for the project, then get
     * all initial submissions.
     * If the requestor is a submitter(designer/developer) for the project, then
     * get his submission.
     *
     * @param project
     * @param requestor
     *
     * @return InitialSubmission[]
     */
    public InitialSubmission[] getInitialSubmissions(Project project, boolean retrieveRemoved, TCSubject requestor) {
        info("DM.getInitialSubmission(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AbstractSubmission[] submissions = getSubmissions(project, requestor, InitialSubmission.SUBMISSION_TYPE, -1, retrieveRemoved, true);

        if (submissions == null || submissions.length == 0) {
            // No initial submission has been submitted for this project
            // (given permissions of the requestor)
            if (project.getCurrentPhase().getId() == Phase.ID_SUBMISSION) {
                if (Common.isRole(project, requestor.getUserId(), Role.ID_DESIGNER_DEVELOPER)) {
                    // If requestor is submitter, create a new InitialSubmission object
                    User reqUser = Common.getUser(dataSource, requestor.getUserId());
                    InitialSubmission initialSubmission = new InitialSubmission(-1, null, null, null,
                            reqUser, project, false, -1, -1, false, false, requestor.getUserId(), -1);
                    submissions = new InitialSubmission[]{initialSubmission};
                }
            }
        }
        return (InitialSubmission[]) submissions;
    }

    /**
     * Get an InitialSubmission with given submissionId.
     *
     * @param project
     * @param subId
     * @param requestor
     *
     * @return InitialSubmission
     */
    public InitialSubmission getInitialSubmission(Project project, long subId, TCSubject requestor) {
        AbstractSubmission sub[] = getSubmissions(project, requestor, InitialSubmission.SUBMISSION_TYPE, subId, false, true);
        if (sub.length == 1) {
            return (InitialSubmission) sub[0];
        } else
            return null;
    }

    /**
     * Get a FinalFixSubmission for the given project from the database.
     *
     * @param project
     * @param requestor
     *
     * @return FinalFixSubmission
     */
    public FinalFixSubmission getFinalFixSubmission(Project project, TCSubject requestor) {
        info("DM.getFinalFixes(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());
        FinalFixSubmission ffSubmission = null;

        AbstractSubmission[] submissions = getSubmissions(project, requestor, FinalFixSubmission.SUBMISSION_TYPE, -1, false, false);
        if (submissions == null || submissions.length == 0) {
            // No final fix submission has been submitted for this project
            if (project.getCurrentPhase().getId() == Phase.ID_FINAL_FIXES) {
                if (project.getWinner() == null) {
                    String errorMsg = "DocumentManagerBean.getFinalFixSubmission(), " +
                            "No winner in project_id: " + project.getId();
                    error(errorMsg);
                    throw new RuntimeException(errorMsg);
                }
                if (requestor.getUserId() == project.getWinner().getId()) {
                    // If requestor is winner, create a new FinalFixSubmission object
                    User reqUser = Common.getUser(dataSource, requestor.getUserId());
                    ffSubmission = new FinalFixSubmission(-1, null, null, null,
                            reqUser, project, false, requestor.getUserId(), -1);
                }
            }
        } else {
            ffSubmission = (FinalFixSubmission) submissions[0];
        }
        return ffSubmission;
    }

    static final String SQLStart = "SELECT s.submission_id, s.submission_url, " +
            "s.sub_pm_review_msg, s.sub_pm_screen_msg, " +
            "s.submitter_id, s.is_removed, " +
            "s.final_score, s.placement, s.passed_screening, " +
            "s.submission_v_id, " +
            "su.login_id, su.user_id, " +
            "uc.first_name, uc.last_name, e.address email_address, rur.r_user_role_id, s.advanced_to_review " +
            "FROM submission s, security_user su, common_oltp:user uc, " +
            "    common_oltp:email e, r_user_role rur  " +
            "WHERE s.cur_version = 1 AND " +
            "s.project_id = ? AND " +
            "s.submission_type = ? AND " +
            "e.primary_ind = 1 AND " +
            "e.user_id = uc.user_id AND " +
            "su.login_id = uc.user_id AND " +
            "su.login_id = rur.login_id AND " +
            "rur.project_id = s.project_id AND " +
            "rur.cur_version = 1 AND " +
            "su.login_id = s.submitter_id ";
    static final String SQLEnd = "ORDER BY rur.r_user_role_id";
    static final String SQLSub = "AND s.submitter_id = ? ";
    static final String SQLNotRemoved = "AND s.is_removed = 0 ";
    static final String SQLAdmin = SQLStart + SQLNotRemoved + SQLEnd;
    static final String SQLAdminRemoved = SQLStart + SQLEnd;
    static final String SQLDev = SQLStart + SQLSub + SQLNotRemoved + SQLEnd;
    static final String SQLDevRemoved = SQLStart + SQLSub + SQLEnd;

    /**
     * Helper-function to get a submission from the database.
     *
     * @param project
     * @param requestor
     * @param submissionType
     * @param givenSubmissionId
     *
     * @return AbstractSubmission[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    private AbstractSubmission[] getSubmissions(Project project, TCSubject requestor, int submissionType,
                                                long givenSubmissionId, boolean retrieveRemoved, boolean fixScoring) {

        List submissionList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            UserRole[] userRole = project.getParticipants();
            boolean isDesDev = false;
            boolean allSubs = false;
            for (int i = 0; i < userRole.length; i++) {
                if (userRole[i].getUser() != null &&
                        userRole[i].getUser().getId() == requestor.getUserId() &&
                        userRole[i].getRole().getId() == Role.ID_DESIGNER_DEVELOPER) {
                    isDesDev = true;
                }
                if (userRole[i].getUser() != null &&
                        userRole[i].getUser().getId() == requestor.getUserId() &&
                        userRole[i].getRole().getId() != Role.ID_DESIGNER_DEVELOPER &&
                        userRole[i].getRole().getId() != Role.ID_REMOVED) {
                    allSubs = true;
                }
            }
            boolean isAdmin = Common.isAdmin(requestor);

            if (givenSubmissionId > 0) {
                ps = conn.prepareStatement(
                        "SELECT s.submission_id, s.submission_url, " +
                        "s.sub_pm_review_msg, s.sub_pm_screen_msg, " +
                        "s.submitter_id, s.is_removed, " +
                        "s.final_score, s.placement, s.passed_screening, " +
                        "s.submission_v_id, " +
                        "su.login_id, su.user_id, " +
                        "uc.first_name, uc.last_name, e.address email_address, rur.r_user_role_id, s.advanced_to_review " +
                        "FROM submission s, security_user su, user uc, r_user_role rur, " +
                        "email e  " +
                        "WHERE s.cur_version = 1 AND " +
                        "s.submission_id = ? AND " +
                        "s.submission_type = ? AND " +
                        "s.is_removed = ? AND " +
                        "e.primary_ind = 1 AND " +
                        "e.user_id = uc.user_id AND " +
                        "su.login_id = uc.user_id AND " +
                        "su.login_id = s.submitter_id AND " +
                        "rur.login_id = su.login_id AND " +
                        "rur.cur_version = 1 AND " +
                        "rur.project_id = s.project_id " +
                        "ORDER BY rur.r_user_role_id");
                ps.setLong(1, givenSubmissionId);
                ps.setInt(2, submissionType);
                ps.setBoolean(3, retrieveRemoved);
            } else {
                if (isAdmin || allSubs) {
                    info("DM.getSubmissions(): all submission for project: " + project.getId() + ", submissionType: " + submissionType);
                    if (retrieveRemoved) {
                        ps = conn.prepareStatement(SQLAdminRemoved);
                    } else {
                        ps = conn.prepareStatement(SQLAdmin);
                    }
                    ps.setLong(1, project.getId());
                    ps.setInt(2, submissionType);
                } else if (isDesDev) {
                    if (retrieveRemoved) {
                        ps = conn.prepareStatement(SQLDevRemoved);
                    } else {
                        ps = conn.prepareStatement(SQLDev);
                    }
                    ps.setLong(1, project.getId());
                    ps.setInt(2, submissionType);
                    ps.setLong(3, requestor.getUserId());
                }
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                long submissionId = rs.getLong(1);
                //info("DM.getSubmissions(): found submission, id: " + submissionId);
                String submissionURLstring = rs.getString(2);
                String pmReviewMsg = rs.getString(3);
                String pmScreeningMsg = rs.getString(4);
//                long submitterId = rs.getLong(5);
                boolean isRemoved = rs.getBoolean(6);

                float finalScore = rs.getFloat(7);
                int placement = rs.getInt(8);
                boolean passedScreening = rs.getBoolean(9);
                boolean advancedToReview = rs.getBoolean("advanced_to_review");

                long subVersionId = rs.getLong(10);

                URL submissionURL;
                try {
                    submissionURL = new URL(submissionURLstring);
                } catch (MalformedURLException e) {
                    throw new RuntimeException(e);
                }

                long loginId = rs.getLong(11);
                String handle = rs.getString(12);
                String firstName = rs.getString(13);
                String lastName = rs.getString(14);
                String email = rs.getString(15);

                //User submitter = Common.getUser(dataSource, submitterId);
                User submitter = new User(loginId, handle, firstName, lastName, email);

                // TODO Retrieve a new project??
                //Project proj = null;
                //proj = projectTracker.getProjectById(projectId, requestor);
                AbstractSubmission submission;

                if (submissionType == InitialSubmission.SUBMISSION_TYPE) {
                    PhaseManager phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
                    if (fixScoring == true && placement == 0 &&
                            project.getCurrentPhase().getOrder() >= phaseManager.getPhase(Phase.ID_AGGREGATION).getOrder()) {
                        // get Product Manager as a "fake" TCSubject
                        // without permissions(for use as requestor to getSubmissions() and getReviewScorecard())
                        UserRole[] userRoleArr = project.getParticipants();
                        TCSubject fakeSubject = null;
                        for (int i = 0; i < userRoleArr.length; i++) {
                            if (userRoleArr[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                                fakeSubject = new TCSubject(userRoleArr[i].getUser().getId());
                                break;
                            }
                        }
                        if (fakeSubject == null) {
                            String errorMsg = "DM.getSubmissions() Could not find product manager for project!";
                            error(errorMsg);
                            throw new RuntimeException(errorMsg);
                        }

                        //InitialSubmission[] submissions = getInitialSubmissions(project, false, fakeSubject);
                        InitialSubmission[] submissions = (InitialSubmission[]) getSubmissions(project, fakeSubject, InitialSubmission.SUBMISSION_TYPE, -1, false, false);
                        final ReviewScorecard[] scorecards = getReviewScorecard(project, fakeSubject);
                        //Item[] items = new Item[submissions.length];
                        for (int i = 0; i < submissions.length; i++) {
                            if (!submissions[i].isRemoved()) {
                                // compute the average of the scorecards for the current submission
                                double sum = 0.0;
                                int count = 0;
                                for (int j = 0; j < scorecards.length; j++) {
                                    if (scorecards[j].getSubmission().equals(submissions[i]) && scorecards[j].isCompleted()) {
                                        count++;
                                        sum += scorecards[j].getScore();
                                    }
                                }
                                if (count == 0) {
                                    submissions[i].setFinalScore(-1);
                                } else {
                                    submissions[i].setFinalScore((float) sum / count);
                                    // items[i] = new Item(sum / count, submissions[i]);
                                }
                            }
                        }
                        //Arrays.sort(items);
                        Arrays.sort(submissions, new Comparator() {
                            public int compare(Object obj1, Object obj2) {
                                if (Double.compare(((InitialSubmission) obj2).getFinalScore(),
                                        ((InitialSubmission) obj1).getFinalScore()) == 0) {
                                    //break ties
                                    int[] vals = new int[2];
                                    for (int y = 0; y < scorecards.length; y++) {
                                        if (scorecards[y].getSubmission().equals(obj1) && scorecards[y].isCompleted()) {
                                            double scr = scorecards[y].getScore();
                                            boolean good = true;
                                            for (int z = 0; z < scorecards.length; z++) {
                                                if ((!scorecards[z].getSubmission().equals(obj1)) && scorecards[z].isCompleted()
                                                        && scorecards[z].getAuthor().getId() == scorecards[y].getAuthor().getId() && (scr - scorecards[z].getScore()) < EPS
                                                        && scorecards[z].getSubmission().getSubmitter().getId() == ((InitialSubmission) obj2).getSubmitter().getId()) {
                                                    good = false;
                                                }
                                            }
                                            if (good)
                                                vals[0]++;
                                        }

                                        if (scorecards[y].getSubmission().equals(obj2) && scorecards[y].isCompleted()) {
                                            double scr = scorecards[y].getScore();
                                            boolean good = true;
                                            for (int z = 0; z < scorecards.length; z++) {
                                                if ((!scorecards[z].getSubmission().equals(obj2)) && scorecards[z].isCompleted()
                                                        && scorecards[z].getAuthor().getId() == scorecards[y].getAuthor().getId() && (scr - scorecards[z].getScore()) < EPS
                                                        && scorecards[z].getSubmission().getSubmitter().getId() == ((InitialSubmission) obj1).getSubmitter().getId()) {
                                                    good = false;
                                                }
                                            }
                                            if (good)
                                                vals[1]++;
                                        }
                                    }
                                    System.out.println(((InitialSubmission) obj1).getSubmitter().getHandle() + "=" + vals[0]);
                                    System.out.println(((InitialSubmission) obj2).getSubmitter().getHandle() + "=" + vals[1]);
                                    return vals[1] - vals[0];
                                }
                                return Double.compare(((InitialSubmission) obj2).getFinalScore(),
                                        ((InitialSubmission) obj1).getFinalScore());
                            }
                        });
                        boolean fixedScoring = false;
                        for (int i = 0; i < submissions.length; i++) {
                            //InitialSubmission sub = items[i].getSubmission();
                            if (submissions[i].getFinalScore() == -1) {
                                submissions[i].setPlacement(-1);
                            } else {
                                submissions[i].setPlacement(i + 1);
                            }
                            //sub.setFinalScore((float)items[i].getScore());
                            saveSub(submissions[i], fakeSubject);
                            if (submissions[i].getId() == submissionId) {
                                fixedScoring = true;
                            }
                        }
                        if (fixedScoring) {
                            submission = getSubmissions(project, requestor, InitialSubmission.SUBMISSION_TYPE,
                                    submissionId, false, false)[0];
                        } else {
                            submission = new InitialSubmission(submissionId, submissionURL, pmReviewMsg, pmScreeningMsg,
                                    submitter, project, isRemoved, finalScore, placement, passedScreening, advancedToReview, requestor.getUserId(), subVersionId);
                        }
                    } else {
                        submission = new InitialSubmission(submissionId, submissionURL, pmReviewMsg, pmScreeningMsg,
                                submitter, project, isRemoved, finalScore, placement, passedScreening, advancedToReview, requestor.getUserId(), subVersionId);
                    }
                } else {
                    submission = new FinalFixSubmission(submissionId, submissionURL, pmReviewMsg, pmScreeningMsg,
                            submitter, project, isRemoved, requestor.getUserId(), subVersionId);
                }
                // Do not allow designer/developer access to other submissions
                if (!(givenSubmissionId > 0 &&
                        isDesDev &&
                        requestor.getUserId() != submission.getSubmitter().getId())) {
                    submissionList.add(submission);
                }
            }
        } catch (SQLException e) {
            error("DM.getSubmissions(), SQL Exception: " + e.toString());
            throw new RuntimeException(e);
        } catch (InvalidEditException e) {
            throw new RuntimeException(e);
        } catch (IncorrectProjectStateException e) {
            throw new RuntimeException(e);
        } catch (ConcurrentModificationException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        if (submissionType == InitialSubmission.SUBMISSION_TYPE) {
            return (InitialSubmission[]) submissionList.toArray(new InitialSubmission[submissionList.size()]);
        } else {
            return (FinalFixSubmission[]) submissionList.toArray(new FinalFixSubmission[submissionList.size()]);
        }
    }

    /**
     * Save an InitialSubmission to the database.
     *
     * @param submission the InitialSubmission to save.
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException
     */
    public void saveInitialSubmission(InitialSubmission submission, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException {
        info("DM.saveInitialSubmission(), submissionId: " + submission.getId());
        saveSub(submission, requestor);
    }

    /**
     * Save a FinalFixSubmission to the database.
     *
     * @param submission the FinalFixSubmission to save.
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException
     */
    public void saveFinalFixSubmission(FinalFixSubmission submission, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException {
        info("DM.saveFinalFixSubmission(), submissionId: " + submission.getId());
        saveSub(submission, requestor);
    }

    /**
     * Helper-function for saving a submission to the database.
     *
     * @param submission
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException
     */
    private void saveSub(AbstractSubmission submission, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

//        long submissionSerial = -1;

        try {
            conn = dataSource.getConnection();

            // TODO retrieve new project?
/*
            boolean perm = false;
            if (submission instanceof InitialSubmission) {
                if ((Common.isRole(submission.getProject(), requestor.getUserId(), Role.ID_DESIGNER_DEVELOPER) &&
                        submission.getProject().getCurrentPhase().getId() == Phase.ID_SUBMISSION) ||
                        (Common.isAdmin(requestor))) {
                    perm = true;
                }
            } else {
                if ((Common.isRole(submission.getProject(), requestor.getUserId(), Role.ID_DESIGNER_DEVELOPER) &&
                        submission.getProject().getWinner().getId() == requestor.getUserId() &&
                        submission.getProject().getCurrentPhase().getId() == Phase.ID_FINAL_FIXES) ||
                        (Common.isAdmin(requestor))) {
                    perm = true;
                }
            }
*/
            if (submission.getDirty() == true) {
                Timestamp timestamp = null;
                if (submission.getId() != -1) {
                    // This is an existing submission
                    try {
                        ps = conn.prepareStatement(
                                "SELECT submission_v_id, submission_date, submission_url " +
                                "FROM submission " +
                                "WHERE submission_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, submission.getId());
                        rs = ps.executeQuery();
                        // Check if submission has been modified after calling
                        // the get-method.
                        if (rs.next()) {
                            if (rs.getLong(1) != submission.getVersionId()) {
                                String errorMsg = "DM.saveSub(): Concurrent error, submissionId: " + submission.getId() +
                                        ", submissionVersionId: " + submission.getVersionId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new ConcurrentModificationException(errorMsg);
                            }
                            timestamp = rs.getTimestamp(2);
                            String submissionURLstring = rs.getString(3);
                            try {
                                URL submissionURL = new URL(submissionURLstring);
                                if (!submissionURL.equals(submission.getURL())) {
                                    timestamp = null;
                                }
                            } catch (MalformedURLException e) {
                                throw new RuntimeException(e);
                            }
                        } else {
                            String errorMsg = "DM.saveSub(): Trying to save non-existing submission, submissionId: " + submission.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, rs);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE submission " +
                                "SET cur_version = 0 " +
                                "WHERE submission_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, submission.getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveSub(): Trying to save non-existing submission, scorecardId: " + submission.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, null);
                    }

                } else {
                    try {
                        // New submission, check that it doesn't exist in db
                        ps = conn.prepareStatement(
                                "SELECT submission_v_id " +
                                "FROM submission " +
                                "WHERE cur_version = 1 AND " +
                                "submission_type = ? AND " +
                                "submitter_id = ? AND " +
                                "project_id = ?");
                        if (submission instanceof InitialSubmission) {
                            ps.setInt(1, InitialSubmission.SUBMISSION_TYPE);
                        } else {
                            ps.setInt(1, FinalFixSubmission.SUBMISSION_TYPE);
                        }
                        ps.setLong(2, submission.getSubmitter().getId());
                        ps.setLong(3, submission.getProject().getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveSub(): Concurrent error(saving new submission)" +
                                    ", projectId: " + submission.getProject().getId() +
                                    ", submitterId: " + submission.getSubmitter().getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        submission.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveSub(), RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    } finally {
                        Common.close(null, ps, rs);
                    }
                    info("DM.saveSub(): Saving a new submission, id: " + submission.getId());
                }

                try {
                    if (timestamp != null) {
                        ps = conn.prepareStatement(
                                "INSERT INTO submission " +
                                "(submission_v_id, submission_id, " +
                                "submission_type, submission_url, " +
                                "sub_pm_review_msg, sub_pm_screen_msg, " +
                                "submitter_id, project_id, is_removed, " +
                                "final_score, placement, passed_screening, advanced_to_review, " +
                                "modify_user, " +
                                "submission_date, cur_version) " + "VALUES " +
                                "(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)");
                    } else {
                        ps = conn.prepareStatement(
                                "INSERT INTO submission " +
                                "(submission_v_id, submission_id, " +
                                "submission_type, submission_url, " +
                                "sub_pm_review_msg, sub_pm_screen_msg, " +
                                "submitter_id, project_id, is_removed, " +
                                "final_score, placement, passed_screening, advanced_to_review, " +
                                "modify_user, cur_version) " + "VALUES " +
                                "(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)");
                    }

                    ps.setLong(1, submission.getId());
                    if (submission instanceof InitialSubmission) {
                        ps.setInt(2, InitialSubmission.SUBMISSION_TYPE);
                    } else {
                        ps.setInt(2, FinalFixSubmission.SUBMISSION_TYPE);
                    }

                    if (Common.tooBig(submission.getURL().toString()) ||
                            Common.tooBig(submission.getPMReviewMessage()) ||
                            Common.tooBig(submission.getPMScreeningMessage())) {
                        String errorMsg = "DM.saveSub(), text-field too long!";
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    }
                    ps.setString(3, submission.getURL().toString());
                    ps.setString(4, submission.getPMReviewMessage());
                    ps.setString(5, submission.getPMScreeningMessage());
                    ps.setLong(6, submission.getSubmitter().getId());
                    ps.setLong(7, submission.getProject().getId());
                    ps.setBoolean(8, submission.isRemoved());

                    if (submission instanceof InitialSubmission) {
                        InitialSubmission initSub = (InitialSubmission) submission;
                        ps.setDouble(9, initSub.getFinalScore());
                        ps.setInt(10, initSub.getPlacement());
                        ps.setBoolean(11, initSub.isPassedScreening());
                        ps.setBoolean(12, initSub.isAdvancedToReview());
                    } else {
                        ps.setNull(9, Types.DOUBLE);
                        ps.setNull(10, Types.DECIMAL);
                        ps.setNull(11, Types.BOOLEAN);
                        ps.setNull(12, Types.BOOLEAN);
                    }

                    ps.setLong(13, submission.getRequestorId());
                    if (timestamp != null) {
                        ps.setTimestamp(14, timestamp);
                    }
                    int nr = ps.executeUpdate();

                    if (nr != 1) {
                        String errorMsg = "DM.saveSub(): Could not insert submission! , submissionId: " + submission.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(null, ps, null);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * Get the TestCaseReviews for a project.
     * If requestor is admin or product manager, then return
     * all saved TestCaseReviews.
     * If requestor is reviewer, then return his reviews (where he
     * is reviewer). If the project phase is review-phase, then create
     * new TestCaseReview-objects(with id=-1) for reviews with test
     * case roles if these reviews don't exist.
     *
     * @param project
     * @param requestor
     *
     * @return TestCaseReview[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public TestCaseReview[] getTestCaseReview(Project project, TCSubject requestor) {

        info("DM.getTestCaseReview(), projectId: " + project.getId() +
                ", requestorId: " + requestor.getUserId());

        List reviewList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (Common.isAdmin(requestor) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_PRODUCT_MANAGER) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER)) {
                ps = conn.prepareStatement(
                        "SELECT tr.review_id, tr.testcase_app_id, " +
                        "tr.review_text, tr.reviewee_id, tr.reviewer_id, " +
                        "tr.is_completed, tr.review_v_id " +
                        "FROM testcase_review tr " +
                        "WHERE tr.cur_version = 1 AND " +
                        "tr.project_id = ?");
                ps.setLong(1, project.getId());
            }/* else if (Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER)) {
                ps = conn.prepareStatement(
                        "SELECT tr.review_id, tr.testcase_app_id, " +
                        "tr.review_text, tr.reviewee_id, tr.reviewer_id, " +
                        "tr.is_completed, tr.review_v_id " +
                        "FROM testcase_review tr " +
                        "WHERE tr.cur_version = 1 AND " +
                        "tr.project_id = ? AND " +
                        "tr.reviewer_id = ?");
                ps.setLong(1, project.getId());
                ps.setLong(2, requestor.getUserId());
            }*/
            else {
                String errorMsg = "DM.getTestCaseReview() no permissions to get testcasereview, " +
                        " project: " + project.getId() + ", requestorId: " + requestor.getUserId();
                error(errorMsg);
                throw new RuntimeException(errorMsg);
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                long reviewId = rs.getLong(1);
                long testcaseAppId = rs.getLong(2);
                String reviewText = rs.getString(3);
                long revieweeId = rs.getLong(4);
                long reviewerId = rs.getLong(5);
                boolean isCompleted = rs.getBoolean(6);
                long reviewVersionId = rs.getLong(7);

                if (Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER)) {
                    // Only retrieve where requestor is reviewer or reviewee
                    if (!(reviewerId == requestor.getUserId() ||
                            revieweeId == requestor.getUserId())) {
                        continue;
                    }
                }

                TestCaseApprovalManager testCaseApprovalManager = (TestCaseApprovalManager) Common.getFromCache(
                        "TestCaseApprovalManager");

                TestCaseApproval testCaseApproval = testCaseApprovalManager.getTestCaseApproval(testcaseAppId);

                User reviewee = Common.getUser(dataSource, revieweeId);
                User reviewer = Common.getUser(dataSource, reviewerId);

                TestCaseReview testCaseReview = new TestCaseReview(reviewId, testCaseApproval, project, reviewText,
                        reviewer, reviewee, isCompleted, requestor.getUserId(), reviewVersionId);

                reviewList.add(testCaseReview);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        if (Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER) &&
                project.getCurrentPhase().getId() == Phase.ID_REVIEW) {
            // Create new TestCaseReview-objects if needed
            User reviewer = Common.getUser(dataSource, requestor.getUserId());
            UserRole[] roleArr = project.getParticipants();
            for (int i = 0; i < roleArr.length; i++) {
                // Loop through all reviewers
                requestor.getUserId();
                roleArr[i].getRole();
                roleArr[i].getRole().getId();
                if (null != roleArr[i].getUser() &&
                        roleArr[i].getUser().getId() != requestor.getUserId() &&
                        roleArr[i].getRole().getId() == Role.ID_REVIEWER) {
                    boolean isCreated = false;
                    for (Iterator iter = reviewList.iterator(); iter.hasNext();) {
                        TestCaseReview review = (TestCaseReview) iter.next();
                        if (review.getReviewee().getId() == roleArr[i].getUser().getId()) {
                            isCreated = true;
                            break;
                        }
                    }
                    if (isCreated == false) {
                        info("DM.getTestCaseReview(): Creating review, reviewerId: " + reviewer.getId() +
                                " ,revieweeId: " + roleArr[i].getUser().getId());
                        TestCaseReview testCaseReview = new TestCaseReview(-1, null, project, null,
                                reviewer, roleArr[i].getUser(), false, requestor.getUserId(), -1);
                        reviewList.add(testCaseReview);
                    }
                }
            }
        }

        return (TestCaseReview[]) reviewList.toArray(new TestCaseReview[0]);
    }

    /**
     * Save a TestCaseReview to the database.
     *
     * @param tcReview the TestCaseReview to save.
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws RuntimeException DOCUMENT ME!
     */
    public void saveTestCaseReview(TestCaseReview tcReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException {

        long requestorId = tcReview.getRequestorId();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            long reviewVID = -1;
            boolean reviewIsCompleted = false;
            try {
                ps = conn.prepareStatement(
                        "SELECT review_v_id, is_completed " +
                        "FROM testcase_review " +
                        "WHERE review_id = ? AND " +
                        "cur_version = 1");
                ps.setLong(1, tcReview.getId());
                rs = ps.executeQuery();

                if (rs.next()) {
                    reviewVID = rs.getLong(1);
                    reviewIsCompleted = rs.getBoolean(2);
                }
            } finally {
                Common.close(null, ps, rs);
            }

            // If review is completed and the user isn't admin/pm,
            // then don't allow save!
            if (reviewIsCompleted &&
                    !(Common.isAdmin(requestor) ||
                    Common.isRole(tcReview.getProject(), requestor.getUserId(), Role.ID_PRODUCT_MANAGER))) {
                String errorMsg = "DM.saveTestCaseReview():\n" +
                        "review_id: " + tcReview.getId() + "\n" +
                        "TestCaseReview is already completed!";
                error(errorMsg);
                ejbContext.setRollbackOnly();
                throw new DocumentAlreadySubmittedException(errorMsg);
            }

            if (tcReview.getDirty() == true) {
                if (tcReview.getId() != -1) {
                    // This is an existing TestCaseReview

                    // Check if review has been modified after calling
                    // the get-method.
                    if (reviewVID != -1) {
                        if (reviewVID != tcReview.getVersionId()) {
                            String errorMsg = "DM.saveTestCaseReview(): Concurrent error, testCaseReviewId: " + tcReview.getId() +
                                    ", testCaseReviewVersionId: " + tcReview.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveTestCaseReview(): Trying to save non-existing TestCaseReview, testCaseReviewId: " +
                                tcReview.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE testcase_review " +
                                "SET cur_version = 0 " +
                                "WHERE review_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, tcReview.getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveTestCaseReview(): Trying to save non-existing TestCaseReview, testCaseReviewId: " +
                                    tcReview.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, null);
                    }

                } else {
                    try {
                        // New TestCaseReview, check that it doesn't exist in db
                        ps = conn.prepareStatement(
                                "SELECT review_v_id " +
                                "FROM testcase_review " +
                                "WHERE cur_version = 1 AND " +
                                "project_id = ? AND " +
                                "reviewer_id = ? AND " +
                                "reviewee_id = ?");
                        ps.setLong(1, tcReview.getProject().getId());
                        ps.setLong(2, tcReview.getReviewer().getId());
                        ps.setLong(3, tcReview.getReviewee().getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveTestCaseReview(): Concurrent error(saving new TestCaseReview)" +
                                    ", projectId: " + tcReview.getProject().getId() +
                                    ", reviewerId: " + tcReview.getReviewer().getId() +
                                    ", revieweeId: " + tcReview.getReviewee().getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        tcReview.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveTestCaseReview(): RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new RuntimeException(errorMsg);
                    } finally {
                        Common.close(null, ps, rs);
                    }
                    info("DM.saveTestCaseReview(): Saving a new TestCaseReview, id: " + tcReview.getId());
                }
                try {
                    ps = conn.prepareStatement(
                            "INSERT INTO testcase_review " +
                            "(review_v_id, review_id, " +
                            "testcase_app_id, review_text, " +
                            "project_id, reviewer_id, " +
                            "reviewee_id, is_completed, modify_user, " +
                            "cur_version) " + "VALUES " + "(0, ?, ?, ?, ?, ?, ?, ?, ?, 1)");
                    ps.setLong(1, tcReview.getId());
                    ps.setLong(2, tcReview.getTestCaseApproval().getId());
                    if (Common.tooBig(tcReview.getReviewText())) {
                        String errorMsg = "DM.saveTestCaseReview(), text-field too long!";
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    }
                    ps.setString(3, tcReview.getReviewText());
                    ps.setLong(4, tcReview.getProject().getId());
                    ps.setLong(5, tcReview.getReviewer().getId());
                    ps.setLong(6, tcReview.getReviewee().getId());
                    ps.setBoolean(7, tcReview.isCompleted());
                    ps.setLong(8, requestorId);

                    int nr = ps.executeUpdate();

                    if (nr != 1) {
                        String errorMsg = "DM.saveTestCaseReview(): Could not insert TestCaseReview!\n" +
                                ", testCaseReviewId: " + tcReview.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(null, ps, null);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * Get an AggregationWorksheet from the database for the given project.
     *
     * @param project
     * @param requestor
     *
     * @return AggregationWorksheet
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public AggregationWorksheet getAggregation(Project project, TCSubject requestor) {
        return getAggregation(project, requestor, true);
    }

    private AggregationWorksheet getAggregation(Project project, TCSubject requestor, boolean retrieveResponses) {
        info("DM.getAggregation(): projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AggregationWorksheet aggWorksheet = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        userMap = new HashMap();

        boolean isWinner = false;
        if (requestor != null && requestor.getUserId() == -2) {
            isWinner = true;
            requestor = new TCSubject(155846);
        } else {
            User winner = project.getWinner();
            if (winner != null && requestor != null && winner.getId() == requestor.getUserId()) {
                isWinner = true;
            }
        }
        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT aw.agg_worksheet_id, aw.is_completed, " +
                    "aw.is_pm_reviewed, aw.aggregator_id, " +
                    "aw.agg_worksheet_v_id " +
                    "FROM agg_worksheet aw " +
                    "WHERE aw.cur_version = 1 AND " +
                    "aw.project_id = ?");
            ps.setLong(1, project.getId());
            rs = ps.executeQuery();

            if (rs.next()) {
                long aggWorksheetId = rs.getLong(1);
                boolean isCompleted = rs.getBoolean(2);
                boolean isPMReviewed = rs.getBoolean(3);
                long aggregatorId = rs.getLong(4);
                long aggVersionId = rs.getLong(5);

                User aggregator = Common.getUser(dataSource, aggregatorId);

                AggregationResponse[] aggRespArr = null;
                if (retrieveResponses) {
                    aggRespArr = getAggregationResponses(aggWorksheetId, isWinner);
                    info("DM.getAggregation(): nr # aggResp: " + aggRespArr.length);
                }

                aggWorksheet = new AggregationWorksheet(aggWorksheetId, isCompleted, isPMReviewed, aggregator,
                        aggRespArr, project, requestor.getUserId(), aggVersionId);
            }

            // TODO Throw exception?
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return aggWorksheet;
    }

    /**
     * Save an AggregationWorksheet to the database.
     *
     * @param worksheet the AggregationWorksheet to save.
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws ConcurrentModificationException
     */
    public void saveAggregation(AggregationWorksheet worksheet, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException {
        info("DM.saveAggregation(): worksheetId: " + worksheet.getId());

        long requestorId = worksheet.getRequestorId();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            long worksheetVID = -1;
            boolean worksheetIsCompleted = false;
            try {
                ps = conn.prepareStatement(
                        "SELECT agg_worksheet_v_id, is_completed " +
                        "FROM agg_worksheet " +
                        "WHERE agg_worksheet_id = ? AND " +
                        "cur_version = 1");
                ps.setLong(1, worksheet.getId());
                rs = ps.executeQuery();

                if (rs.next()) {
                    worksheetVID = rs.getLong(1);
                    worksheetIsCompleted = rs.getBoolean(2);
                }
            } finally {
                Common.close(rs);
                Common.close(ps);
            }

            // If worksheet is completed and the user isn't admin/pm,
            // then don't allow save!
            // But if the user is aggregator and there is an Aggregation Review
            // with status = rejected, then allow save.
            // See if there is at least one Aggregation Review with status = rejected
            boolean allowSaveFlag = false;
            if (worksheetIsCompleted) {
                try {
                    ps = conn.prepareStatement(
                            "SELECT ar.agg_review_id " +
                            "FROM agg_review ar " +
                            "WHERE ar.cur_version = 1 AND " +
                            "ar.agg_approval_id = " + AggregationApproval.ID_REJECTED + " AND " +
                            "ar.agg_worksheet_id = ?");
                    ps.setLong(1, worksheet.getId());
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        allowSaveFlag = true;
                    }
                } finally {
                    Common.close(rs);
                    Common.close(ps);
                }
                if (!(Common.isAdmin(requestor) ||
                        Common.isRole(worksheet.getProject(), requestor.getUserId(), Role.ID_PRODUCT_MANAGER)) &&
                        !allowSaveFlag) {
                    String errorMsg = "DM.saveAggregation():\n" +
                            "aggregation_id: " + worksheet.getId() + "\n" +
                            "AggregationWorksheet is already completed!";
                    error(errorMsg);
                    ejbContext.setRollbackOnly();
                    throw new DocumentAlreadySubmittedException(errorMsg);
                }
                if (allowSaveFlag) {
                    // Set Aggregation reviews to isCompleted=false
                    try {
                        ps = conn.prepareStatement(
                                "UPDATE agg_review " +
                                "SET is_completed = 0, " +
                                "agg_approval_id = NULL, " +
                                "is_pm_reviewed = 0 " +
                                "WHERE " +
                                "cur_version = 1 AND " +
                                "agg_worksheet_id = ? ");
                        ps.setLong(1, worksheet.getId());
                        ps.executeUpdate();
                    } finally {
                        Common.close(rs);
                        Common.close(ps);
                    }
                }
            }

            if (worksheet.getDirty() == true) {
                if (worksheet.getId() != -1) {
                    // This is an existing AggregationWorksheet

                    // Check if worksheet has been modified after calling
                    // the get-method.
                    if (worksheetVID != -1) {
                        if (worksheetVID != worksheet.getVersionId()) {
                            String errorMsg = "DM.saveAggregation(): Concurrent error\n" +
                                    ", aggWorksheetId: " + worksheet.getId() +
                                    ", aggWorksheetVersionId: " + worksheet.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveAggregation(): Trying to save non-existing AggregationWorksheet" +
                                ", aggWorksheetId: " + worksheet.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE agg_worksheet " +
                                "SET cur_version = 0 " +
                                "WHERE agg_worksheet_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, worksheet.getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveAggregation(): Trying to save non-existing AggregationWorksheet" +
                                    ", aggWorksheetId: " + worksheet.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(ps);
                    }

                } else {
                    try {
                        // New AggregationWorksheet, check that it doesn't exist in db
                        try {
                            ps = conn.prepareStatement(
                                    "SELECT agg_worksheet_v_id " +
                                    "FROM agg_worksheet " +
                                    "WHERE cur_version = 1 AND " +
                                    "project_id = ? ");
                            ps.setLong(1, worksheet.getProject().getId());
                            rs = ps.executeQuery();
                            if (rs.next()) {
                                String errorMsg = "DM.saveAggregation(): Concurrent error(saving new AggregationWorksheet)" +
                                        ", projectId: " + worksheet.getProject().getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new ConcurrentModificationException(errorMsg);
                            }
                            worksheet.setId(idGen.nextId());
                        } finally {
                            Common.close(ps);
                        }
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveAggregation(): RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    }
                    info("DM.saveAggregation(): Saving a new worksheet, id: " + worksheet.getId());
                }

                try {
                    ps = conn.prepareStatement(
                            "INSERT INTO agg_worksheet " +
                            "(agg_worksheet_v_id, agg_worksheet_id, " +
                            "is_completed, is_pm_reviewed, " +
                            "aggregator_id, project_id, " +
                            "modify_user, cur_version) " +
                            "VALUES (0, ?, ?, ?, ?, ?, ?, 1)");
                    ps.setLong(1, worksheet.getId());
                    ps.setBoolean(2, worksheet.isCompleted());
                    ps.setBoolean(3, worksheet.isPMReviewed());
                    ps.setLong(4, worksheet.getAggregator().getId());
                    ps.setLong(5, worksheet.getProject().getId());
                    ps.setLong(6, requestorId);

                    int nr = ps.executeUpdate();

                    if (nr != 1) {
                        String errorMsg = "DM.saveAggregation(): Could not insert AggregationWorksheet!" +
                                ", aggWorksheetId: " + worksheet.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(ps);
                }

                info("DM.saveAggregation(): AggregationWorksheet inserted");
            }

            // Save aggregationResponses
            AggregationResponse[] aggRespArr = worksheet.getAggregationResponses();

            PreparedStatement psSel = null;
            PreparedStatement psUpd = null;
            PreparedStatement psIns = null;
            try {
                psSel = conn.prepareStatement(
                        "SELECT agg_response_v_id " +
                        "FROM agg_response " +
                        "WHERE agg_response_id = ? AND " +
                        "cur_version = 1");
                psUpd = conn.prepareStatement(
                        "UPDATE agg_response " +
                        "SET cur_version = 0 " +
                        "WHERE agg_response_id = ? AND " +
                        "cur_version = 1");
                psIns = conn.prepareStatement(
                        "INSERT INTO agg_response " +
                        "(agg_response_v_id, agg_response_id, " +
                        "subjective_resp_id, agg_resp_stat_id, " +
                        "agg_worksheet_id, " +
                        "response_text, response_type_id, " +
                        "modify_user, cur_version) " +
                        "VALUES (0, ?, ?, ?, ?, ?, ?, ?, 1)");


                for (int i = 0; i < aggRespArr.length; i++) {
                    info("DM.saveAggregation(), saving aggResp nr: " + i);
                    if (aggRespArr[i].getDirty() == true ||
                            aggRespArr[i].getSubjectiveResponse().getDirty() == true) {
                        info("DM.saveAggregation(), saving aggResp = dirty");
                        if (aggRespArr[i].getId() != -1) {
                            psSel.clearParameters();
                            psSel.setLong(1, aggRespArr[i].getId());
                            rs = psSel.executeQuery();

                            if (rs.next()) {
                                if (rs.getLong(1) != aggRespArr[i].getVersionId()) {
                                    String errorMsg = "DM.saveAggregation(): Concurrent error saving aggResponse, aggWorksheetId: " +
                                            worksheet.getId() + ", aggRespId: " + aggRespArr[i] + ", aggRespVersionId: " +
                                            aggRespArr[i].getVersionId();
                                    error(errorMsg);
                                    ejbContext.setRollbackOnly();
                                    throw new ConcurrentModificationException(errorMsg);
                                }
                            } else {
                                String errorMsg = "DM.saveAggregation(): Trying to save non-existing AggregationResponse, aggResponseId: " +
                                        aggRespArr[i].getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new InvalidEditException(errorMsg);
                            }

                            psUpd.clearParameters();
                            psUpd.setLong(1, aggRespArr[i].getId());

                            int nr = psUpd.executeUpdate();

                            if (nr == 0) {
                                String errorMsg = "DM.saveAggregation(): Trying to save non-existing AggregationResponse, aggResponseId: " +
                                        aggRespArr[i].getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new InvalidEditException(errorMsg);
                            }

                        } else {
                            try {
                                // New AggregationResponse
                                aggRespArr[i].setId(idGen.nextId());
                            } catch (RemoteException e1) {
                                // TODO Auto-generated catch block
                                e1.printStackTrace();
                                throw new RuntimeException(e1);
                            }
                            info("DM.saveAggregation(): Saving a new AggregationResponse, id: " + aggRespArr[i].getId());
                        }

                        psIns.clearParameters();
                        psIns.setLong(1, aggRespArr[i].getId());
                        psIns.setLong(2, aggRespArr[i].getSubjectiveResponse().getId());
                        if (aggRespArr[i].getAggregationResponseStatus() == null) {
                            psIns.setNull(3, Types.DECIMAL);
                        } else {
                            psIns.setLong(3, aggRespArr[i].getAggregationResponseStatus().getId());
                        }
                        psIns.setLong(4, worksheet.getId());
                        psIns.setString(5, aggRespArr[i].getSubjectiveResponse().getResponseText());
                        psIns.setLong(6, aggRespArr[i].getSubjectiveResponse().getResponseType().getId());
                        psIns.setLong(7, requestorId);

                        int nr = psIns.executeUpdate();

                        if (nr != 1) {
                            String errorMsg = "DM.saveAggregation(): Could not insert AggregationResponse! , aggResponseId: " +
                                    aggRespArr[i].getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                        info("DM.saveAggregation(): aggResponse inserted");

                    }
                }

            } finally {
                Common.close(rs);
                Common.close(psSel);
                Common.close(psUpd);
                Common.close(psIns);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * Get an AggregationReview for a given project from the database.
     *
     * @param project
     * @param requestor
     *
     * @return AggregationReview[]
     */
    public AggregationReview[] getAggregationReview(Project project, TCSubject requestor) {
        info("DM.getAggregationReview(), projectId: " + project.getId() + ", requestorId: " +
                requestor.getUserId());

        AggregationReview aggReview = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List aggReviewList = new LinkedList();

        try {
            conn = dataSource.getConnection();

            if (Common.isRole(project, requestor.getUserId(), Role.ID_AGGREGATOR) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_PRODUCT_MANAGER) ||
                    Common.isAdmin(requestor)) {
                ps = conn.prepareStatement(
                        "SELECT ar.agg_review_id, ar.agg_approval_id, " +
                        "ar.agg_review_text, " +
                        "ar.is_pm_reviewed, ar.agg_worksheet_id, " +
                        "ar.is_completed, ar.reviewer_id, " +
                        "ar.agg_review_v_id " +
                        "FROM agg_review ar, agg_worksheet aw " +
                        "WHERE ar.cur_version = 1 AND " +
                        "aw.cur_version = 1 AND " +
                        "ar.agg_worksheet_id = aw.agg_worksheet_id AND " +
                        "aw.project_id = ?");
                ps.setLong(1, project.getId());
            } else if (Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER)) {
                ps = conn.prepareStatement(
                        "SELECT ar.agg_review_id, ar.agg_approval_id, " +
                        "ar.agg_review_text, " +
                        "ar.is_pm_reviewed, ar.agg_worksheet_id, " +
                        "ar.is_completed, ar.reviewer_id, " +
                        "ar.agg_review_v_id " +
                        "FROM agg_review ar, agg_worksheet aw " +
                        "WHERE ar.cur_version = 1 AND " +
                        "aw.cur_version = 1 AND " +
                        "ar.agg_worksheet_id = aw.agg_worksheet_id AND " +
                        "aw.project_id = ? AND " +
                        "ar.reviewer_id = ?");
                ps.setLong(1, project.getId());
                ps.setLong(2, requestor.getUserId());
            } else {
                String errorMsg = "DocumentManagerBean.getAggregationReview(), requestorId: " + requestor.getUserId() +
                        "does not have permission to get aggregation review";
                error(errorMsg);
                // TODO Change to GeneralSecurityException
                throw new RuntimeException(errorMsg);
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                long aggReviewId = rs.getLong(1);
                long aggApprovalId = rs.getLong(2);
                String aggReviewText = rs.getString(3);
                boolean isPMReviewed = rs.getBoolean(4);
                //long aggWorksheetId = rs.getLong(5);
                boolean isCompleted = rs.getBoolean(6);
                long reviewerId = rs.getLong(7);
                long aggReviewVersionId = rs.getLong(8);

                AggregationApprovalManager aggregationApprovalManager = (AggregationApprovalManager) Common.getFromCache(
                        "AggregationApprovalManager");
                AggregationApproval aggApproval = aggregationApprovalManager.getAggregationApproval(aggApprovalId);

                AggregationWorksheet aggWorksheet = getAggregation(project, requestor);

                User reviewer = Common.getUser(dataSource, reviewerId);

                aggReview = new AggregationReview(aggReviewId, aggApproval, aggReviewText, isPMReviewed,
                        aggWorksheet, isCompleted, reviewer, requestor.getUserId(), aggReviewVersionId);
                aggReviewList.add(aggReview);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        // If requestor is reviewer and phase is aggregation review
        // then create a new AggregationReview if none exists
        // in the database.
        if (Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER) &&
                project.getCurrentPhase().getId() == Phase.ID_AGGREGATION_REVIEW) {
            if (aggReviewList.size() == 0) {
                info("DocumentManagerBean.getAggregationReview(), creating new AggregationReview, " +
                        "projectId: " + project.getId() + ", requestorId: " + requestor.getUserId());

                AggregationWorksheet aggWorksheet = getAggregation(project, requestor);
                User reviewer = Common.getUser(dataSource, requestor.getUserId());

                aggReview = new AggregationReview(-1, null, null, false,
                        aggWorksheet, false, reviewer, requestor.getUserId(), -1);
                aggReviewList.add(aggReview);
            }
        }

        return (AggregationReview[]) aggReviewList.toArray(new AggregationReview[aggReviewList.size()]);
    }

    /**
     * Save an AggregationReview to the database.
     *
     * @param aggReview the AggregationReview to save.
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws RuntimeException DOCUMENT ME!
     */
    public void saveAggregationReview(AggregationReview aggReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            long reviewVID = -1;
            boolean reviewIsCompleted = false;
            try {
                ps = conn.prepareStatement(
                        "SELECT agg_review_v_id, is_completed " +
                        "FROM agg_review " +
                        "WHERE agg_review_id = ? AND " +
                        "cur_version = 1");
                ps.setLong(1, aggReview.getId());
                rs = ps.executeQuery();

                if (rs.next()) {
                    reviewVID = rs.getLong(1);
                    reviewIsCompleted = rs.getBoolean(2);
                }
            } finally {
                Common.close(rs);
                Common.close(ps);
            }

            // If review is completed and the user isn't admin/pm,
            // then don't allow save!
            if (reviewIsCompleted &&
                    !(Common.isAdmin(requestor) ||
                    Common.isRole(aggReview.getAggregationWorksheet().getProject(),
                            requestor.getUserId(), Role.ID_PRODUCT_MANAGER))) {
                String errorMsg = "DM.saveAggregationReview():\n" +
                        "aggReview_id: " + aggReview.getId() + "\n" +
                        "AggregationReview is already completed!";
                error(errorMsg);
                ejbContext.setRollbackOnly();
                throw new DocumentAlreadySubmittedException(errorMsg);
            }

            if (aggReview.getDirty() == true) {
                if (aggReview.getId() != -1) {
                    // This is an existing AggregationReview

                    // Check if review has been modified after calling
                    // the get-method.
                    if (reviewVID != -1) {
                        if (reviewVID != aggReview.getVersionId()) {
                            String errorMsg = "DM.saveAggregationReview(): Concurrent error, aggReviewId: " +
                                    aggReview.getId() + ", aggReviewVersionId: " + aggReview.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveAggregationReview(): Trying to save non-existing AggregationReview, aggReviewId: " +
                                aggReview.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE agg_review " +
                                "SET cur_version = 0 " +
                                "WHERE agg_review_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, aggReview.getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveAggregationReview(): Trying to save non-existing AggregationReview, aggReviewId: " +
                                    aggReview.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(ps);
                    }

                } else {
                    try {
                        // New AggregationReview, check that it doesn't exist in db
                        ps = conn.prepareStatement(
                                "SELECT agg_review_v_id " +
                                "FROM agg_review " +
                                "WHERE cur_version = 1 AND " +
                                "agg_worksheet_id = ? AND " +
                                "reviewer_id = ?");
                        ps.setLong(1, aggReview.getAggregationWorksheet().getId());
                        ps.setLong(2, aggReview.getReviewer().getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveAggregationReview(): Concurrent error(saving new AggregationReview)" +
                                    ", worksheetId: " + aggReview.getAggregationWorksheet().getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        aggReview.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveAggregationReview(): RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    } finally {
                        Common.close(rs);
                        Common.close(ps);
                    }

                    info("DM.saveAggregationReview(): Saving a new AggregationReview, id: " + aggReview.getId());
                }

                try {
                    ps = conn.prepareStatement(
                            "INSERT INTO agg_review " +
                            "(agg_review_v_id, agg_review_id, " +
                            "agg_approval_id, agg_review_text, " +
                            "is_pm_reviewed, agg_worksheet_id, " +
                            "is_completed, reviewer_id, " +
                            "modify_user, cur_version) " + "VALUES " + "(0, ?, ?, ?, ?, ?, ?, ?, ?, 1)");
                    ps.setLong(1, aggReview.getId());
                    if (aggReview.getStatus() == null) {
                        ps.setNull(2, Types.DECIMAL);
                    } else {
                        ps.setLong(2, aggReview.getStatus().getId());
                    }
                    if (Common.tooBig(aggReview.getText())) {
                        String errorMsg = "DM.saveAggregationReview(), text-field too long!";
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    }
                    ps.setString(3, aggReview.getText());
                    ps.setBoolean(4, aggReview.isPMReviewed());
                    ps.setLong(5, aggReview.getAggregationWorksheet().getId());
                    ps.setBoolean(6, aggReview.isCompleted());
                    ps.setLong(7, aggReview.getReviewer().getId());
                    ps.setLong(8, aggReview.getRequestorId());

                    int nr = ps.executeUpdate();

                    if (nr != 1) {
                        String errorMsg = "DM.saveAggregationReview(): Could not insert AggregationReview! , aggReviewId: " +
                                aggReview.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(ps);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * Get a FinalReview for the given project from the database.
     *
     * @param project
     * @param retrieveFull
     * @param requestor
     *
     * @return FinalReview
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public FinalReview getFinalReview(Project project, boolean retrieveFull, TCSubject requestor) {
        info("DM.getFinalReview(), projectId: " + project.getId() +
                ", requestorId: " + requestor.getUserId());

        FinalReview finalReview = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        userMap = new HashMap();

        try {
            conn = dataSource.getConnection();

            // Do not retrieve aggregation responses.
            AggregationWorksheet aggWorksheet = getAggregation(project, requestor, false);

            if (!retrieveFull) {
                ps = conn.prepareStatement(
                        "SELECT fr.final_review_id, " +
                        "fr.is_completed, fr.final_review_v_id, fr.is_approved, fr.comments " +
                        "FROM final_review fr, agg_worksheet aw " +
                        "WHERE fr.cur_version = 1 AND " +
                        "aw.cur_version = 1 AND " +
                        "fr.agg_worksheet_id = aw.agg_worksheet_id AND " +
                        "aw.project_id = ?");
                ps.setLong(1, project.getId());
                rs = ps.executeQuery();

                if (rs.next()) {
                    //info("Found fixItem");
                    long finalReviewId = rs.getLong(1);
                    boolean isCompleted = rs.getBoolean(2);
                    long reviewVersionId = rs.getLong(3);
                    boolean isApproved = rs.getBoolean(4);
                    String comments = rs.getString(5);

                    finalReview = new FinalReview(finalReviewId, null, aggWorksheet, isCompleted, requestor.getUserId(),
                            reviewVersionId, isApproved, comments);
                } else {
                    finalReview = new FinalReview(-1, null, aggWorksheet,
                            false, requestor.getUserId(), -1, false, null);
                }
            } else {
                ps = conn.prepareStatement(
                        "SELECT fr.final_review_id, fi.fix_item_id, " +
                        "fi.final_fix_s_id, fi.agg_response_id, " +
                        "fr.is_completed, fr.final_review_v_id, " +
                        "fi.fix_item_v_id, fr.is_approved, fr.comments " +
                        "FROM final_review fr, agg_worksheet aw, fix_item fi " +
                        "WHERE fr.cur_version = 1 AND " +
                        "aw.cur_version = 1 AND " +
                        "fi.cur_version = 1 AND " +
                        "fr.agg_worksheet_id = aw.agg_worksheet_id AND " +
                        "fr.final_review_id = fi.final_review_id AND " +
                        "aw.project_id = ?");
                ps.setLong(1, project.getId());
                rs = ps.executeQuery();

                List fixItemList = new LinkedList();

                long finalReviewId = 0;
                long reviewVersionId = 0;
                boolean isCompleted = false;
                boolean isApproved = false;
                String comments = null;

                while (rs.next()) {
                    //info("Found fixItem");
                    finalReviewId = rs.getLong(1);
                    long fixItemId = rs.getLong(2);
                    long finalFixStatusId = rs.getLong(3);
                    long aggResponseId = rs.getLong(4);
                    isCompleted = rs.getBoolean(5);
                    reviewVersionId = rs.getLong(6);
                    long fixItemVid = rs.getLong(7);
                    isApproved = rs.getBoolean(8);
                    comments = rs.getString(9);

                    FinalFixStatusManager finalFixStatusManager = (FinalFixStatusManager) Common.getFromCache(
                            "FinalFixStatusManager");
                    FinalFixStatus finalFixStatus = finalFixStatusManager.getFinalFixStatus(finalFixStatusId);

                    AggregationResponse aggResp = getAggregationResponse(aggResponseId);

                    FixItem fixItem = new FixItem(fixItemId, finalFixStatus, aggResp, fixItemVid);
                    fixItemList.add(fixItem);
                }
                if (fixItemList.size() > 0) {
                    FixItem[] fixItemArr = (FixItem[]) fixItemList.toArray(new FixItem[fixItemList.size()]);
                    finalReview = new FinalReview(finalReviewId, fixItemArr, aggWorksheet, isCompleted, requestor.getUserId(),
                            reviewVersionId, isApproved, comments);
                } else {
                    if (Common.isRole(project, requestor.getUserId(), Role.ID_FINAL_REVIEWER) &&
                            project.getCurrentPhase().getId() == Phase.ID_FINAL_REVIEW) {
                        // Create new FinalReview

                        // Retrieve aggregation responses.
                        aggWorksheet = getAggregation(project, requestor, true);
                        AggregationResponse[] aggRespArr = aggWorksheet.getAggregationResponses();

                        for (int i = 0; i < aggRespArr.length; i++) {
                            if (aggRespArr[i].getAggregationResponseStatus().getId() ==
                                    AggregationResponseStatus.ID_ACCEPTED) {
                                // Only include accepted aggregation responses
                                FixItem fixItem = new FixItem(-1, null, aggRespArr[i], -1);
                                fixItemList.add(fixItem);
                            }
                        }
                        FixItem[] fixItemArr = (FixItem[]) fixItemList.toArray(new FixItem[fixItemList.size()]);
                        finalReview = new FinalReview(-1, fixItemArr, aggWorksheet,
                                isCompleted, requestor.getUserId(), -1, isApproved, comments);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return finalReview;
    }

    /**
     * Get all aggregation responses for one project.
     *
     * @param aggWorksheetId
     * @param isWinner
     *
     * @return AggregationResponse[]
     */
    private AggregationResponse[] getAggregationResponses(long aggWorksheetId, boolean isWinner) {
        info("DM.getAggregationResponses(), isWinner " + isWinner);
        return getAggregationResponses(aggWorksheetId, -1, isWinner);
    }

    /**
     * Get one aggregation response.
     *
     * @param aggResponseId
     *
     * @return AggregationResponse
     */
    private AggregationResponse getAggregationResponse(long aggResponseId) {
        //info("DM.getAggregationResponse()");
        // TODO Add check for array-length?
        return getAggregationResponses(-1, aggResponseId, false)[0];
    }

    /**
     * Get aggregationresponses.
     *
     * @param aggWorksheetId
     * @param reqAggResponseId
     * @param isWinner
     *
     * @return AggregationResponse[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    private AggregationResponse[] getAggregationResponses(long aggWorksheetId, long reqAggResponseId, boolean isWinner) {

        List aggRespList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (reqAggResponseId == -1 && !isWinner) {
                ps = conn.prepareStatement(
                        "SELECT ar.agg_response_id, ar.subjective_resp_id, " +
                        "ar.agg_resp_stat_id, ar.agg_worksheet_id, " +
                        "sr.question_id, s.author_id, ar.agg_response_v_id, " +
                        "qt.question_seq_loc, ss.section_seq_loc, ssg.group_seq_loc, " +
                        "ar.response_text, ar.response_type_id, s.scorecard_type, " +
                        "qt.question_text, qt.question_weight, " +
                        "sq.evaluation_id, qt.section_id, " +
                        "qt.question_type, sq.q_template_v_id, sq.question_v_id, " +
                        "tq.total_tests, tq.total_pass, " +
                        "ss.section_name, ss.section_weight, " +
                        "ssg.group_id, ssg.group_name " +
                        "FROM agg_response ar, subjective_resp sr, " +
                        "scorecard_question sq, scorecard s, " +
                        "question_template qt, scorecard_section ss, sc_section_group ssg, " +
                        "OUTER testcase_question tq " +
                        "WHERE ar.cur_version = 1 AND " +
                        "sr.cur_version = 1 AND " +
                        "sq.cur_version = 1 AND " +
                        "s.cur_version = 1 AND " +
                        //"qt.cur_version = 1 AND " +
                        "ar.subjective_resp_id = sr.subjective_resp_id AND " +
                        "sr.question_id = sq.question_id AND " +
                        "sq.scorecard_id = s.scorecard_id AND " +
                        "qt.q_template_v_id = sq.q_template_v_id AND " +
                        "qt.section_id = ss.section_id AND " +
                        "ss.group_id = ssg.group_id AND " +
                        "tq.cur_version = 1 AND " +
                        "sq.question_id = tq.question_id AND " +
                        "ar.agg_worksheet_id = ? " +
                        "ORDER BY s.scorecard_type, ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc, s.author_id");
//                ps = conn.prepareStatement(
//                        "SELECT ar.agg_response_id, ar.subjective_resp_id, " +
//                        "ar.agg_resp_stat_id, ar.agg_worksheet_id, " +
//                        "sr.question_id, s.author_id, ar.agg_response_v_id, " +
//                        "qt.question_seq_loc, ss.section_seq_loc, ssg.group_seq_loc, " +
//                        "ar.response_text, ar.response_type_id, s.scorecard_type " +
//                        "FROM agg_response ar, subjective_resp sr, " +
//                        "scorecard_question sq, scorecard s, " +
//                        "question_template qt, scorecard_section ss, sc_section_group ssg " +
//                        "WHERE ar.cur_version = 1 AND " +
//                        "sr.cur_version = 1 AND " +
//                        "sq.cur_version = 1 AND " +
//                        "s.cur_version = 1 AND " +
//                        //"qt.cur_version = 1 AND " +
//                        "ar.subjective_resp_id = sr.subjective_resp_id AND " +
//                        "sr.question_id = sq.question_id AND " +
//                        "sq.scorecard_id = s.scorecard_id AND " +
//                        "qt.q_template_v_id = sq.q_template_v_id AND " +
//                        "qt.section_id = ss.section_id AND " +
//                        "ss.group_id = ssg.group_id AND " +
//                        "ar.agg_worksheet_id = ? " +
//                        "ORDER BY s.scorecard_type, ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc, s.author_id");
                ps.setLong(1, aggWorksheetId);
            } else if (reqAggResponseId == -1 && isWinner) {
                ps = conn.prepareStatement(
                        "SELECT ar.agg_response_id, ar.subjective_resp_id, " +
                        "ar.agg_resp_stat_id, ar.agg_worksheet_id, " +
                        "sr.question_id, s.author_id, ar.agg_response_v_id, " +
                        "qt.question_seq_loc, ss.section_seq_loc, ssg.group_seq_loc, " +
                        "ar.response_text, ar.response_type_id, s.scorecard_type, " +
                        "qt.question_text, qt.question_weight, " +
                        "sq.evaluation_id, qt.section_id, " +
                        "qt.question_type, sq.q_template_v_id, sq.question_v_id, " +
                        "tq.total_tests, tq.total_pass, " +
                        "ss.section_name, ss.section_weight, " +
                        "ssg.group_id, ssg.group_name " +
                        "FROM agg_response ar, subjective_resp sr, " +
                        "scorecard_question sq, scorecard s, " +
                        "question_template qt, scorecard_section ss, sc_section_group ssg, " +
                        "OUTER testcase_question tq " +
                        "WHERE ar.cur_version = 1 AND " +
                        "sr.cur_version = 1 AND " +
                        "sq.cur_version = 1 AND " +
                        "s.cur_version = 1 AND " +
                        //"qt.cur_version = 1 AND " +
                        "ar.subjective_resp_id = sr.subjective_resp_id AND " +
                        "sr.question_id = sq.question_id AND " +
                        "sq.scorecard_id = s.scorecard_id AND " +
                        "qt.q_template_v_id = sq.q_template_v_id AND " +
                        "qt.section_id = ss.section_id AND " +
                        "ss.group_id = ssg.group_id AND " +
                        "tq.cur_version = 1 AND " +
                        "sq.question_id = tq.question_id AND " +
                        "ar.agg_worksheet_id = ? AND " +
                        "ar.agg_resp_stat_id = " + AggregationResponseStatus.ID_ACCEPTED + " " +
                        "ORDER BY s.scorecard_type, ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc, s.author_id");
                ps.setLong(1, aggWorksheetId);
            } else {
                ps = conn.prepareStatement(
                        "SELECT ar.agg_response_id, ar.subjective_resp_id, " +
                        "ar.agg_resp_stat_id, ar.agg_worksheet_id, " +
                        "sr.question_id, s.author_id, ar.agg_response_v_id, " +
                        "qt.question_seq_loc, ss.section_seq_loc, ssg.group_seq_loc, " +
                        "ar.response_text, ar.response_type_id, s.scorecard_type, " +
                        "qt.question_text, qt.question_weight, " +
                        "sq.evaluation_id, qt.section_id, " +
                        "qt.question_type, sq.q_template_v_id, sq.question_v_id, " +
                        "tq.total_tests, tq.total_pass, " +
                        "ss.section_name, ss.section_weight, " +
                        "ssg.group_id, ssg.group_name " +
                        "FROM agg_response ar, subjective_resp sr, " +
                        "scorecard_question sq, scorecard s, " +
                        "question_template qt, scorecard_section ss, sc_section_group ssg, " +
                        "OUTER testcase_question tq " +
                        "WHERE ar.cur_version = 1 AND " +
                        "sr.cur_version = 1 AND " +
                        "sq.cur_version = 1 AND " +
                        "s.cur_version = 1 AND " +
                        //"qt.cur_version = 1 AND " +
                        "ar.subjective_resp_id = sr.subjective_resp_id AND " +
                        "sr.question_id = sq.question_id AND " +
                        "sq.scorecard_id = s.scorecard_id AND " +
                        "qt.q_template_v_id = sq.q_template_v_id AND " +
                        "qt.section_id = ss.section_id AND " +
                        "ss.group_id = ssg.group_id AND " +
                        "tq.cur_version = 1 AND " +
                        "sq.question_id = tq.question_id AND " +
                        "ar.agg_response_id = ? " +
                        "ORDER BY s.scorecard_type, ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc, s.author_id");
                ps.setLong(1, reqAggResponseId);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                //info("Found aggResp!");
                long aggResponseId = rs.getLong(1);
                long subjRespId = rs.getLong(2);
                long aggRespStatId = rs.getLong(3);
//                long worksheetId = rs.getLong(4);
                long questionId = rs.getLong(5);
                long reviewerId = rs.getLong(6);
                long respVersionId = rs.getLong(7);
                int questionSeqLoc = rs.getInt(8); // for SCQ

                int sectionSeqLoc = rs.getInt(9);
                int groupSeqLoc = rs.getInt(10);

                String respText = rs.getString(11);
                long respTypeId = rs.getLong(12);

                ScorecardQuestion scorecardQuestion = null;
                //if (reqAggResponseId == -1) {
                String questionText = rs.getString(14);
                int questionWeight = rs.getInt(15);
                long evaluationId = rs.getLong(16);
                long sectionId = rs.getLong(17);
                int questionType = rs.getInt(18);
                long questionTemplateId = rs.getLong(19);
                long questionVersionId = rs.getLong(20);
                int totalTests = rs.getInt(21);
                int totalPass = rs.getInt(22);

                String sectionName = rs.getString(23);
                int sectionWeight = rs.getInt(24);
                long groupId = rs.getLong(25);
                String groupName = rs.getString(26);

                EvaluationManager evaluationManager = (EvaluationManager) Common.getFromCache("EvaluationManager");
                Evaluation evaluation = evaluationManager.getEvaluation(evaluationId);

                //ScorecardSectionManager scorecardSectionManager = (ScorecardSectionManager) Common.getFromCache(
                //"ScorecardSectionManager");
                //ScorecardSection scorecardSection = scorecardSectionManager.getScorecardSection(sectionId);
                ScorecardSectionGroup sectionGroup = new ScorecardSectionGroup(groupId, groupName, groupSeqLoc);
                ScorecardSection scorecardSection = new ScorecardSection(sectionId, sectionName, sectionWeight,
                        sectionSeqLoc, sectionGroup);

                if (questionType == ScorecardQuestion.SCORECARD_TYPE) {
                    scorecardQuestion = new ScorecardQuestion(questionId, evaluation, questionText, questionWeight,
                            scorecardSection, questionSeqLoc, questionTemplateId, questionVersionId);
                } else {
                    SubjectiveResponse[] subjResp = null; //getSubjectiveResp(questionId);
                    if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE ||
                            questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE_YESNO) {
                        int answerType = SubjectiveScorecardQuestion.ANSWER_1234;
                        if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE)
                            answerType = SubjectiveScorecardQuestion.ANSWER_1234;
                        else if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE_YESNO)
                            answerType = SubjectiveScorecardQuestion.ANSWER_YESNO;
                        scorecardQuestion = new SubjectiveScorecardQuestion(questionId, evaluation, questionText,
                                questionWeight, scorecardSection, questionSeqLoc, subjResp,
                                answerType, questionTemplateId, questionVersionId);
                    } else if (questionType == TestCaseScorecardQuestion.SCORECARD_TYPE) {
                        scorecardQuestion = new TestCaseScorecardQuestion(questionId, evaluation, questionText,
                                questionWeight, scorecardSection, questionSeqLoc, subjResp, totalPass, totalTests,
                                questionTemplateId, questionVersionId);
                    }
                }
                //}
                User reviewer = null;
                if (userMap != null) {
                    reviewer = (User) userMap.get(new Long(reviewerId));
                }
                if (reviewer == null) {
                    reviewer = Common.getUser(dataSource, reviewerId);
                    userMap.put(new Long(reviewerId), reviewer);
                }

                AggregationResponseStatusManager aggregationResponseStatusManager = (AggregationResponseStatusManager) Common.getFromCache(
                        "AggregationResponseStatusManager");
                AggregationResponseStatus aggRespStat = aggregationResponseStatusManager.getAggregationResponseStatus(aggRespStatId);

                ResponseTypeManager responseTypeManager = (ResponseTypeManager) Common.getFromCache(
                        "ResponseTypeManager");
                ResponseType respType = responseTypeManager.getResponseType(respTypeId);

                if (scorecardQuestion == null) {
                    scorecardQuestion = getScorecardQuestion(questionId);
                }

/*
                SubjectiveResponse[] subjRespArr = null;
                if (scorecardQuestion instanceof SubjectiveScorecardQuestion) {
                    subjRespArr = ((SubjectiveScorecardQuestion)scorecardQuestion).getResponses();
                } else if (scorecardQuestion instanceof TestCaseScorecardQuestion) {
                    subjRespArr = ((TestCaseScorecardQuestion)scorecardQuestion).getResponses();
                } else {
                    String errorMsg = "DM.getAggregationResponses(),\n" +
                            "links to a ScorecardQuestion without subjective answers!";
                    error(errorMsg);
                    throw new RuntimeException(errorMsg);
                }
                SubjectiveResponse subjResp = null;
                for (int i = 0; i < subjRespArr.length; i++) {
                    if (subjRespArr[i].getId() == subjRespId) {
                        subjResp = subjRespArr[i];
                        break;
                    }
                }
*/
                SubjectiveResponse subjResp = new SubjectiveResponse(
                        subjRespId, respText, respType, -1);

                AggregationResponse aggResp = new AggregationResponse(aggResponseId, subjResp, aggRespStat,
                        scorecardQuestion, reviewer, respVersionId);
                aggRespList.add(aggResp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return (AggregationResponse[]) aggRespList.toArray(new AggregationResponse[0]);
    }

    /**
     * Save a FinalReview to the database.
     *
     * @param finalReview
     *
     * @throws InvalidEditException
     * @throws DocumentAlreadySubmittedException
     * @throws IncorrectProjectStateException
     * @throws RuntimeException DOCUMENT ME!
     */
    public void saveFinalReview(FinalReview finalReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException {

        long requestorId = finalReview.getRequestorId();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            long reviewVID = -1;
            boolean reviewIsCompleted = false;

            try {
                ps = conn.prepareStatement(
                        "SELECT fr.final_review_v_id, fr.is_completed " +
                        "FROM final_review fr " +
                        "WHERE fr.final_review_id = ? AND " +
                        "cur_version = 1");
                ps.setLong(1, finalReview.getId());
                rs = ps.executeQuery();

                if (rs.next()) {
                    reviewVID = rs.getLong(1);
                    reviewIsCompleted = rs.getBoolean(2);
                }
            } finally {
                Common.close(null, ps, rs);
            }

            // If review is completed and the user isn't admin/pm,
            // then don't allow save!
            if (reviewIsCompleted &&
                    !(Common.isAdmin(requestor) ||
                    Common.isRole(finalReview.getAggregationWorkSheet().getProject(), requestor.getUserId(), Role.ID_PRODUCT_MANAGER))) {
                String errorMsg = "DM.saveAggregationReview():\n" +
                        "finalReview_id: " + finalReview.getId() + "\n" +
                        "FinalReview is already completed!";
                error(errorMsg);
                ejbContext.setRollbackOnly();
                throw new DocumentAlreadySubmittedException(errorMsg);
            }

            if (finalReview.getDirty() == true) {
                if (finalReview.getId() != -1) {
                    // This is an existing FinalReview

                    if (reviewVID != -1) {
                        if (reviewVID != finalReview.getVersionId()) {
                            String errorMsg = "DM.saveFinalReview(): Concurrent error, finalReviewId: " +
                                    finalReview.getId() + ", finalReviewVersionId: " +
                                    finalReview.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveFinalReview(): Trying to save non-existing FinalReview, finalReviewId: " +
                                finalReview.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    try {
                        ps =
                                conn.prepareStatement(
                                        "UPDATE final_review "
                                + "SET cur_version = 0 "
                                + "WHERE final_review_id = ? AND "
                                + "cur_version = 1");
                        ps.setLong(1, finalReview.getId());
                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveFinalReview(): Trying to save non-existing FinalReview, finalReviewId: " +
                                    finalReview.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, null);
                    }

                } else {
                    try {
                        // New FinalReview, check that it doesn't exist in db
                        ps = conn.prepareStatement(
                                "SELECT final_review_v_id " +
                                "FROM final_review " +
                                "WHERE cur_version = 1 AND " +
                                "agg_worksheet_id = ?");
                        ps.setLong(1, finalReview.getAggregationWorkSheet().getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveFinalReview(): Concurrent error(saving new FinalReview)" +
                                    ", worksheetId: " + finalReview.getAggregationWorkSheet().getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        finalReview.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveFinalReview(): RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    } finally {
                        Common.close(null, ps, rs);
                    }
                    info("DM.saveFinalReview(): Saving a new FinalReview, id: " + finalReview.getId());
                }
                try {
                    ps =
                            conn.prepareStatement(
                                    "INSERT INTO final_review "
                            + "(final_review_v_id, final_review_id, "
                            + "agg_worksheet_id, is_completed, "
                            + "modify_user, cur_version, is_approved, comments) "
                            + "VALUES "
                            + "(0, ?, ?, ?, ?, 1, ?, ?)");

                    ps.setLong(1, finalReview.getId());
                    ps.setLong(2, finalReview.getAggregationWorkSheet().getId());
                    ps.setBoolean(3, finalReview.isCompleted());
                    ps.setLong(4, requestorId);
                    ps.setBoolean(5, finalReview.isApproved());
                    ps.setString(6, finalReview.getComments());

                    int nr = ps.executeUpdate();
                    if (nr != 1) {
                        // TODO Fix error messages
                        String errorMsg = "could not insert finalReview!";
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(null, ps, null);
                }

            }

            // save array of FixItem
            FixItem[] fixItemArr = finalReview.getFixCheckList();

            PreparedStatement psSel = null;
            PreparedStatement psUpd = null;
            PreparedStatement psIns = null;
            try {
                psSel = conn.prepareStatement(
                        "SELECT fix_item_v_id " +
                        "FROM fix_item " +
                        "WHERE fix_item_id = ? AND " +
                        "cur_version = 1");
                psUpd = conn.prepareStatement(
                        "UPDATE fix_item " +
                        "SET cur_version = 0 " +
                        "WHERE fix_item_id = ? AND " +
                        "cur_version = 1");
                psIns = conn.prepareStatement(
                        "INSERT INTO fix_item " +
                        "(fix_item_v_id, fix_item_id, " +
                        "final_fix_s_id, agg_response_id, " +
                        "final_review_id, " +
                        "modify_user, cur_version) " +
                        "VALUES " + "(0, ?, ?, ?, ?, ?, 1)");
                for (int i = 0; i < fixItemArr.length; i++) {
                    if (fixItemArr[i].getDirty() == true) {
                        if (fixItemArr[i].getId() != -1) {
                            psSel.setLong(1, fixItemArr[i].getId());
                            rs = psSel.executeQuery();

                            if (rs.next()) {
                                if (rs.getLong(1) != fixItemArr[i].getVersionId()) {
                                    String errorMsg = "DM.saveFinalReview(): Concurrent error saving fixitem, finalReviewId: " +
                                            finalReview.getId() + ", fixItemId" + fixItemArr[i] + ", fixItemVersionId: " +
                                            fixItemArr[i].getVersionId();
                                    error(errorMsg);
                                    ejbContext.setRollbackOnly();
                                    throw new ConcurrentModificationException(errorMsg);
                                }
                            } else {
                                String errorMsg = "DM.saveAggregationReview(): Trying to save non-existing FixItem, fixItemId: " +
                                        fixItemArr[i].getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new InvalidEditException(errorMsg);
                            }

                            psUpd.setLong(1, fixItemArr[i].getId());

                            int nr = psUpd.executeUpdate();

                            if (nr == 0) {
                                String errorMsg = "DM.saveAggregationReview(): Trying to save non-existing FixItem, fixItemId: " +
                                        fixItemArr[i].getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new InvalidEditException(errorMsg);
                            }


                        } else {
                            try {
                                // New FixItem
                                // TODO IMPORTANT! Check that item doesn't exist!
                                fixItemArr[i].setId(idGen.nextId());
                            } catch (RemoteException e1) {
                                // TODO Auto-generated catch block
                                e1.printStackTrace();
                                throw new RuntimeException(e1);
                            }
                            info("DM.saveAggregationReview(): Saving a new FinalReview, id: " + finalReview.getId());
                        }

                        // If the final fix status is null, we don't need to save it yet.
                        //if (fixItemArr[i].getFinalFixStatus() != null) {
                        psIns.setLong(1, fixItemArr[i].getId());
                        psIns.setLong(2, fixItemArr[i].getFinalFixStatus().getId());
                        psIns.setLong(3, fixItemArr[i].getAggregationResponse().getId());
                        psIns.setLong(4, finalReview.getId());
                        psIns.setLong(5, requestorId);

                        int nr = psIns.executeUpdate();

                        if (nr != 1) {
                            String errorMsg =
                                    "DM.saveFinalReview(): Could not insert FixItem! , fixItemId: "
                                    + fixItemArr[i].getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                        //}
                    }
                }
            } finally {
                Common.close(null, psSel, rs);
                Common.close(null, psUpd, null);
                Common.close(null, psIns, null);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * @param project
     */
    private List createScorecards(Project project, long authorId, long submitterId,
                                  List scorecardList, boolean retrieveQuestions)
            throws InvalidEditException,
            IncorrectProjectStateException,
            DocumentAlreadySubmittedException,
            GeneralSecurityException,
            ConcurrentModificationException {
        int scorecardType = (int) project.getCurrentPhase().getId() - 1;
        long projectTypeId = project.getProjectType().getId();

        info("DM.createScorecards(), project: " + project.getId());
        info("Type: " + scorecardType + "  ,projectType: " + projectTypeId);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List createdScorecardList = new LinkedList();

        try {
            UserRole[] userRoleArr = project.getParticipants();

            // get Product Manager as a "fake" TCSubject
            // without permissions(for use as requestor to getSubmissions()
            TCSubject fakeSubject = null;
            for (int i = 0; i < userRoleArr.length; i++) {
                if (userRoleArr[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                    fakeSubject = new TCSubject(userRoleArr[i].getUser().getId());
                    break;
                }
            }
            if (fakeSubject == null) {
                String errorMsg = "DM.createScorecards() Could not find product manager for project!";
                error(errorMsg);
                throw new RuntimeException(errorMsg);
            }

            InitialSubmission[] subArr = (InitialSubmission[]) getSubmissions(project, fakeSubject, InitialSubmission.SUBMISSION_TYPE, -1, false, false);

            info("DM.createScorecards(): subArr.length: " + subArr.length);
            if (subArr.length > 0) {
                info("DM.createScorecards(): subArr[0]." + subArr[0].getId());
            }

//            if (project.getCurrentPhase().getId() == Phase.ID_REVIEW &&
//                    Common.isRole(project, authorId, Role.ID_REVIEWER)) {

            // Find what scorecards need to be created
            // Remove submissions that already have scorecards

            List subList = new LinkedList();
            for (int i = 0; i < subArr.length; i++) {
                boolean dontCreate = false;
                for (Iterator iter = scorecardList.iterator(); iter.hasNext();) {
                    AbstractScorecard scorecard = (AbstractScorecard) iter.next();
                    if (scorecard.getSubmission().getId() == subArr[i].getId()) {
                        dontCreate = true;
                        break;
                    }
                }
                if (submitterId > 0 && subArr[i].getSubmitter().getId() != submitterId) {
                    dontCreate = true;
                }
                if (scorecardType == ReviewScorecard.SCORECARD_TYPE &&
                        (subArr[i].isAdvancedToReview() == false)) {
                    dontCreate = true;
                }
                if (dontCreate == false) {
                    subList.add(subArr[i]);
                }
            }
            subArr = (InitialSubmission[]) subList.toArray(new InitialSubmission[subList.size()]);

            User[] authorArr = null;
            if (authorId > 0) {
                authorArr = new User[]{Common.getUser(dataSource, authorId)};
            } else {
                // This should never happen at the moment
                // since authorId is always given.
                authorArr = getReviewers(project, scorecardType);
            }
            info("DM.createScorecards(): authorArr.length: " + authorArr.length);
            if (authorArr.length > 0) {
                info("DM.createScorecards(): authorArr[0]." + authorArr[0].getId());
            }
            ScorecardQuestion[] questionArr = null;
            if (retrieveQuestions && subArr.length > 0 && authorArr.length > 0) {
                conn = dataSource.getConnection();

                // Added ordering if question_template records so new records don't go to the bottom - bblais
                ps = conn.prepareStatement(
                        "SELECT qt.q_template_v_id, " +
                        "qt.question_text, qt.question_weight, " +
                        "qt.question_seq_loc, qt.section_id, " +
                        "qt.question_type, " +
                        "ssg.group_seq_loc, ss.section_seq_loc, " +
                        "ss.section_name, ss.section_weight, " +
                        "ssg.group_id, ssg.group_name " +
                        "FROM question_template qt, scorecard_section ss, sc_section_group ssg, " +
                        "project_template pt " +
                        "WHERE qt.cur_version = 1 AND " +
                        "qt.section_id = ss.section_id AND " +
                        "ss.group_id = ssg.group_id AND " +
                        "qt.project_type = ? AND " +
                        "qt.scorecard_type = ? AND " +
                        "qt.template_id = pt.template_id AND " +
                        "qt.scorecard_type = pt.scorecard_type AND " +
                        "pt.project_id = ? " +
                        "ORDER BY ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc");
                ps.setLong(1, projectTypeId);
                ps.setInt(2, scorecardType);
                ps.setLong(3, project.getId());
                rs = ps.executeQuery();

                List questionList = new LinkedList();
                while (rs.next()) {
                    long templateVID = rs.getLong(1);
                    info("DM.createScorecards(): templateVID: " + templateVID);
                    String questionText = rs.getString(2);
                    int questionWeight = rs.getInt(3);
                    int questionSeqLoc = rs.getInt(4);
                    long sectionId = rs.getLong(5);
                    int questionType = rs.getInt(6);

                    int groupSeqLoc = rs.getInt(7);
                    int sectionSeqLoc = rs.getInt(8);

                    String sectionName = rs.getString(9);
                    int sectionWeight = rs.getInt(10);
                    long groupId = rs.getLong(11);
                    String groupName = rs.getString(12);

                    //ScorecardSectionManager scorecardSectionManager = (ScorecardSectionManager) Common.getFromCache(
                    //"ScorecardSectionManager");
                    //ScorecardSection section = scorecardSectionManager.getScorecardSection(sectionId);
                    ScorecardSectionGroup sectionGroup = new ScorecardSectionGroup(groupId, groupName, groupSeqLoc);
                    ScorecardSection section = new ScorecardSection(sectionId, sectionName, sectionWeight,
                            sectionSeqLoc, sectionGroup);

                    ScorecardQuestion question;

                    if (questionType == ScorecardQuestion.SCORECARD_TYPE) {
                        question = new ScorecardQuestion(-1, null, questionText,
                                questionWeight, section, questionSeqLoc, templateVID, -1);
                    } else if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE ||
                            questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE_YESNO) {
                        int answerType = SubjectiveScorecardQuestion.ANSWER_1234;
                        if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE)
                            answerType = SubjectiveScorecardQuestion.ANSWER_1234;
                        else if (questionType == SubjectiveScorecardQuestion.SCORECARD_TYPE_YESNO)
                            answerType = SubjectiveScorecardQuestion.ANSWER_YESNO;
                        question = new SubjectiveScorecardQuestion(-1, null, questionText,
                                questionWeight, section, questionSeqLoc, new SubjectiveResponse[0],
                                answerType, templateVID, -1);
                    } else if (questionType == TestCaseScorecardQuestion.SCORECARD_TYPE) {
                        question = new TestCaseScorecardQuestion(-1, null, questionText,
                                questionWeight, section, questionSeqLoc, new SubjectiveResponse[0], 0, 0, templateVID, -1);
                    } else {
                        throw new RuntimeException("DM.createScorecards(): " +
                                "unknown question type: " + questionType);
                    }
                    questionList.add(question);
                }
                questionArr = (ScorecardQuestion[]) questionList.toArray(new ScorecardQuestion[questionList.size()]);
            }

            for (int subInd = 0; subInd < subArr.length; subInd++) {
                for (int authInd = 0; authInd < authorArr.length; authInd++) {
                    AbstractScorecard scorecard;

                    ScorecardQuestion[] newQuestionArr = null;
                    if (questionArr != null) {
                        newQuestionArr = new ScorecardQuestion[questionArr.length];
                        for (int i = 0; i < questionArr.length; i++) {
                            if (questionArr[i] instanceof SubjectiveScorecardQuestion) {
                                newQuestionArr[i] = new SubjectiveScorecardQuestion(questionArr[i].getId(),
                                        null, questionArr[i].getQuestionText(), questionArr[i].getWeight(),
                                        questionArr[i].getScorecardSection(), questionArr[i].getSequenceLocation(),
                                        ((SubjectiveScorecardQuestion) questionArr[i]).getResponses(),
                                        ((SubjectiveScorecardQuestion) questionArr[i]).getAnswerType(),
                                        questionArr[i].getVersion(), questionArr[i].getVersionId());
                            } else if (questionArr[i] instanceof TestCaseScorecardQuestion) {
                                newQuestionArr[i] = new TestCaseScorecardQuestion(questionArr[i].getId(),
                                        null, questionArr[i].getQuestionText(), questionArr[i].getWeight(),
                                        questionArr[i].getScorecardSection(), questionArr[i].getSequenceLocation(),
                                        ((TestCaseScorecardQuestion) questionArr[i]).getResponses(),
                                        ((TestCaseScorecardQuestion) questionArr[i]).getTotalPass(),
                                        ((TestCaseScorecardQuestion) questionArr[i]).getTotalTests(),
                                        questionArr[i].getVersion(), questionArr[i].getVersionId());
                            } else if (questionArr[i] instanceof ScorecardQuestion) {
                                newQuestionArr[i] = new ScorecardQuestion(questionArr[i].getId(),
                                        null, questionArr[i].getQuestionText(), questionArr[i].getWeight(),
                                        questionArr[i].getScorecardSection(), questionArr[i].getSequenceLocation(),
                                        questionArr[i].getVersion(), questionArr[i].getVersionId());
                            } else {
                                throw new RuntimeException("DM.createScorecards(), " +
                                        "unknown question type for question: " + questionArr[i].getId());
                            }
                        }
                    }
                    if (scorecardType == ScreeningScorecard.SCORECARD_TYPE) {
                        scorecard = new ScreeningScorecard(-1, false, false, newQuestionArr,
                                authorArr[authInd], project, subArr[subInd], 0, fakeSubject.getUserId(), -1, 0.0, null);
                    } else if (scorecardType == ReviewScorecard.SCORECARD_TYPE) {
                        scorecard = new ReviewScorecard(-1, false, false, newQuestionArr,
                                authorArr[authInd], project, subArr[subInd], 0, fakeSubject.getUserId(), -1, 0.0, null);
                    } else {
                        error("DM.createScorecards(): No scorecards to be created for type: " + scorecardType);
                        return null;
                    }
                    if (authorId <= 0) {
                        saveScorecard(scorecard, fakeSubject);
                    }
                    createdScorecardList.add(scorecard);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        return createdScorecardList;
    }

    /**
     * @param project
     * @param scorecardType
     * @return
     */
    private User[] getReviewers(Project project, long scorecardType) {

        UserRole[] roleArr = project.getParticipants();
        List userList = new LinkedList();
        for (int roleInd = 0; roleInd < roleArr.length; roleInd++) {
            if (roleArr[roleInd].getId() == scorecardType + 1) {
                userList.add(roleArr[roleInd].getUser());
            }
        }
        return (User[]) userList.toArray(new User[userList.size()]);
    }

    /**
     * @param project
     */
    public void createAggregation(Project project) {
        info("DM.createAggregation(), project: " + project.getId());
        // for every reviewscorecard and subjectiveresponse,
        // and for the screeningscorecard and subjectiveresponse,
        // create AggregationResponse

        // get Product Manager as a "fake" TCSubject
        // without permissions(for use as requestor to getSubmissions()
        TCSubject fakeSubject = null;
        User aggregator = null;
        UserRole[] userRoleArr = project.getParticipants();
        for (int i = 0; i < userRoleArr.length; i++) {
            if (userRoleArr[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                fakeSubject = new TCSubject(userRoleArr[i].getUser().getId());
            }
            if (userRoleArr[i].getRole().getId() == Role.ID_AGGREGATOR) {
                aggregator = userRoleArr[i].getUser();
            }
        }

        if (fakeSubject == null) {
            String errorMsg = "Could not find product manager for project!";
            error(errorMsg);
            throw new RuntimeException(errorMsg);
        }

        // Check if aggregation worksheet already exists
        AggregationWorksheet agg = getAggregation(project, fakeSubject);
        if (agg != null) {
            info("DM.createAggregation(), aggregation worksheet already exists " +
                    ", projectId: " + project.getId());
            //return;
            info("DM.createAggregation(), removing existing worksheet!");
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = dataSource.getConnection();
                ps = conn.prepareStatement(
                        "UPDATE agg_worksheet " +
                        "SET cur_version = 0 " +
                        "WHERE project_id = ? AND " +
                        "cur_version = 1");
                ps.setLong(1, project.getId());
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                Common.close(conn, ps, rs);
            }
        }

        if (aggregator == null) {
            String errorMsg = "Could not find aggregator for project!";
            error(errorMsg);
            throw new RuntimeException(errorMsg);
        }
        ReviewScorecard[] scorecards = getReviewScorecardFull(project, fakeSubject);
        List aggRespList = new LinkedList();

/*
        ScreeningScorecard[] sc2 = getScreeningScorecard(project, fakeSubject);
        AbstractScorecard[] scorecards = new AbstractScorecard[sc1.length + sc2.length];
        System.arraycopy(sc1, 0, scorecards, 0, sc1.length);
        System.arraycopy(sc2, 0, scorecards, sc1.length, sc2.length);
*/
        // Assume same questions in different scorecards!
        int questionArrLen = 0;
        if (scorecards.length != 0 && scorecards[0].getQuestions() != null) {
            questionArrLen = scorecards[0].getQuestions().length;
        }

        for (int j = 0; j < questionArrLen; j++) {
            for (int i = 0; i < scorecards.length; i++) {
                // Only use scorecards where submitter is winner.
                if (scorecards[i].getSubmission().getSubmitter().getId() == project.getWinner().getId()) {
                    createAggResp(fakeSubject, scorecards[i], aggRespList, j);
                }
            }
        }

        ScreeningScorecard[] scScreen = getScreeningScorecardFull(project, fakeSubject);
        questionArrLen = 0;
        if (scScreen.length != 0 && scScreen[0].getQuestions() != null) {
            questionArrLen = scScreen[0].getQuestions().length;
        }
        for (int j = 0; j < questionArrLen; j++) {
            for (int i = 0; i < scScreen.length; i++) {
                // Only use scorecards where submitter is winner.
                if (scScreen[i].getSubmission().getSubmitter().getId() == project.getWinner().getId()) {
                    createAggResp(fakeSubject, scScreen[i], aggRespList, j);
                }
            }
        }


        AggregationResponse[] aggRespArr = (AggregationResponse[]) aggRespList.toArray(
                new AggregationResponse[aggRespList.size()]);
        info("DM.createAggregation(): nr # aggResp: " + aggRespArr.length);

        AggregationWorksheet worksheet = new AggregationWorksheet(-1, false, false,
                aggregator, aggRespArr, project, fakeSubject.getUserId(), -1);
        try {
            saveAggregation(worksheet, fakeSubject);
        } catch (DocumentAlreadySubmittedException e1) {
            String errorMsg = "DM.createAggregation(): Problem saving new worksheet\n" +
                    "Exception: " + e1;
            error(errorMsg);
            ejbContext.setRollbackOnly();
            throw new InvalidEditException(errorMsg);
        } catch (InvalidEditException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IncorrectProjectStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ConcurrentModificationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void createAggResp(TCSubject fakeSubject, AbstractScorecard scorecard, List aggRespList, int j) {
        ScorecardQuestion[] questionArr = scorecard.getQuestions();
        SubjectiveResponse[] subjRespArr = null;
        boolean hasSubj = false;
        if (questionArr[j] instanceof SubjectiveScorecardQuestion) {
            subjRespArr = ((SubjectiveScorecardQuestion) questionArr[j]).getResponses();
            hasSubj = true;
        } else if (questionArr[j] instanceof TestCaseScorecardQuestion) {
            subjRespArr = ((TestCaseScorecardQuestion) questionArr[j]).getResponses();
            hasSubj = true;
        }
        if (hasSubj) {
            info("DM.createAggregation(): (not)saving subjective responses, " +
                    "subjRespArr.length: " + subjRespArr.length);
            for (int k = 0; k < subjRespArr.length; k++) {
                AggregationResponse aggResp = new AggregationResponse(-1, subjRespArr[k],
                        null, questionArr[j], scorecard.getAuthor(), -1);
                aggRespList.add(aggResp);
            }
        }
    }

    /**
     * Check if the project is aggregated, with the
     * aggregation completed and pm-reviewed.
     *
     * @param projectId The ProjectId
     * @return true if project is aggregated
     */
    public boolean isProjectAggregated(long projectId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT aw.agg_worksheet_id " +
                    "FROM agg_worksheet aw " +
                    "WHERE aw.cur_version = 1 AND " +
                    "aw.is_completed = 1 AND " +
                    "aw.project_id = ?");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        return false;
    }

    /**
     * Get testcases-object from the database.
     *
     * @param project
     * @param reqReviewerId
     * @param requestor
     *
     * @return TestCase[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public TestCase[] getTestCases(Project project, long reqReviewerId, TCSubject requestor) {
        info("DM.getTestCases(), projectId: " + project.getId() +
                ", reviewerId: " + reqReviewerId +
                ", requestorId: " + requestor.getUserId());

        List testcaseList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (reqReviewerId > 0) {
                ps = conn.prepareStatement(
                        "SELECT t.testcases_id, t.testcases_url, " +
                        "t.reviewer_id, t.testcases_v_id, " +
                        "t.testcase_type " +
                        "FROM testcases t " +
                        "WHERE t.cur_version = 1 AND " +
                        "t.project_id = ? AND " +
                        "t.reviewer_id = ? " +
                        "ORDER BY t.testcases_id");
                ps.setLong(1, project.getId());
                ps.setLong(2, reqReviewerId);
            } else {
                ps = conn.prepareStatement(
                        "SELECT t.testcases_id, t.testcases_url, " +
                        "t.reviewer_id, t.testcases_v_id, " +
                        "t.testcase_type " +
                        "FROM testcases t " +
                        "WHERE t.cur_version = 1 AND " +
                        "t.project_id = ? " +
                        "ORDER BY t.testcases_id");
                ps.setLong(1, project.getId());
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                long testcasesId = rs.getLong(1);
                info("DM.getTestCases(): found testcases, id: " + testcasesId);
                String testcasesURLstring = rs.getString(2);
                long reviewerId = rs.getLong(3);
                long tcVersionId = rs.getLong(4);
                int testCaseTypeId = rs.getInt(5);

                ReviewerResponsibility testCaseType = null;
                if (testCaseTypeId > 0) {
                    ReviewerResponsibilityManager revRespManager = (ReviewerResponsibilityManager) Common.getFromCache(
                            "ReviewerResponsibilityManager");
                    testCaseType = revRespManager.getResponsibility(testCaseTypeId);
                } else {
                    testCaseType = new ReviewerResponsibility(0, "");
                }

                URL testcasesURL;
                try {
                    testcasesURL = new URL(testcasesURLstring);
                } catch (MalformedURLException e) {
                    throw new RuntimeException(e);
                }

                User reviewer = Common.getUser(dataSource, reviewerId);

                // TODO Retrieve a new project??
                //Project proj = null;
                //proj = projectTracker.getProjectById(projectId, requestor);
                TestCase testCase = new TestCase(testcasesId, testcasesURL, reviewer, project, testCaseType, tcVersionId);

                testcaseList.add(testCase);
            }
        } catch (SQLException e) {
            error("DM.getTestCases(), SQL Exception: " + e.toString());
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        if (testcaseList.size() == 0) {
            // No testcase has been submitted for this project
            // (given permissions of the requestor)
            if (project.getCurrentPhase().getId() == Phase.ID_REVIEW) {
                if (Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER)) {
                    // If requestor is reviewer, create a new TestCase object
                    User reqUser = Common.getUser(dataSource, requestor.getUserId());
                    UserRole[] part = project.getParticipants();
                    ReviewerResponsibility revResp = new ReviewerResponsibility(0, "");
                    for (int i = 0; i < part.length; i++) {
                        if (part[i].getUser().getId() == reqUser.getId() &&
                                part[i].getRole().getId() == Role.ID_REVIEWER) {
                            revResp = part[i].getReviewerResponsibility();
                        }
                    }
                    if (revResp == null)
                        revResp = new ReviewerResponsibility(0, "");
                    TestCase testCase = new TestCase(-1, null, reqUser, project, revResp, -1);
                    testcaseList.add(testCase);
                }
            }
        }
        return (TestCase[]) testcaseList.toArray(new TestCase[0]);
    }

    /**
     * Save a testcases object to the database.
     *
     * @param testCase
     * @param requestor
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException
     */
    public void saveTestCase(TestCase testCase, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (testCase.getDirty() == true) {
                if (testCase.getId() != -1) {
                    try {
                        // This is an existing testcase
                        ps = conn.prepareStatement(
                                "SELECT testcases_v_id " +
                                "FROM testcases " +
                                "WHERE testcases_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, testCase.getId());
                        rs = ps.executeQuery();
                        // Check if testcase has been modified after calling
                        // the get-method.
                        if (rs.next()) {
                            if (rs.getLong(1) != testCase.getVersionId()) {
                                String errorMsg = "DM.saveTestCase(): Concurrent error, testcaseId: " + testCase.getId() +
                                        ", testcaseVersionId: " + testCase.getVersionId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new ConcurrentModificationException(errorMsg);
                            }
                        } else {
                            String errorMsg = "DM.saveTestCase(): Trying to save non-existing testcase, testcaseId: " + testCase.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, rs);
                    }
                    try {
                        ps = conn.prepareStatement(
                                "UPDATE testcases " +
                                "SET cur_version = 0 " +
                                "WHERE testcases_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, testCase.getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "DM.saveTestCase(): Trying to save non-existing testcase, testcaseId: " + testCase.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, null);
                    }

                } else {
                    try {
                        // New testcase, check that it doesn't exist in db
                        ps = conn.prepareStatement(
                                "SELECT testcases_v_id " +
                                "FROM testcases " +
                                "WHERE cur_version = 1 AND " +
                                "reviewer_id = ? AND " +
                                "project_id = ?");
                        ps.setLong(1, testCase.getReviewer().getId());
                        ps.setLong(2, testCase.getProject().getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveTestCase(): Concurrent error(saving new testcase)" +
                                    ", projectId: " + testCase.getProject().getId() +
                                    ", reviewerId: " + testCase.getReviewer().getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        testCase.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveSub(), RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    } finally {
                        Common.close(null, ps, rs);
                    }
                    info("DM.saveTestCase(): Saving a new testcase, id: " + testCase.getId());
                }

                try {
                    ps = conn.prepareStatement(
                            "INSERT INTO testcases " +
                            "(testcases_v_id, testcases_id, " +
                            "testcases_url, project_id, " +
                            "reviewer_id, testcase_type, " +
                            "modify_user, cur_version) " + "VALUES " +
                            "(0, ?, ?, ?, ?, ?, ?, 1)");
                    ps.setLong(1, testCase.getId());
                    ps.setString(2, testCase.getURL().toString());
                    ps.setLong(3, testCase.getProject().getId());
                    ps.setLong(4, testCase.getReviewer().getId());
                    ps.setLong(5, testCase.getType().getId());
                    ps.setLong(6, requestor.getUserId());

                    int nr = ps.executeUpdate();

                    if (nr != 1) {
                        String errorMsg = "DM.saveTestCase(): Could not insert testcase! , testcaseId: " + testCase.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(null, ps, rs);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    private final static String SQLGetAppeals =
            "SELECT a.appeal_id" +
            ", a.appealer_id" +
            ", a.question_id" +
            ", a.is_resolved" +
            ", a.appeal_text" +
            ", a.appeal_response" +
            ", a.appeal_v_id" +
            ", s.author_id" +
            ", sub.submitter_id" +
            ", rur.r_user_role_id " +
            "FROM appeal a " +
            ", scorecard_question sq " +
            ", scorecard s " +
            ", submission sub " +
            ", r_user_role rur " +
            "WHERE a.cur_version = 1 " +
            "AND sq.cur_version = 1 " +
            "AND s.cur_version = 1 " +
            "AND sub.cur_version = 1 " +
            "AND a.question_id = sq.question_id " +
            "AND sq.scorecard_id = s.scorecard_id " +
            "AND s.submission_id = sub.submission_id " +
            "AND rur.r_role_id = 1 " +
            "AND rur.login_id = sub.submitter_id " +
            "AND rur.cur_version = 1 " +
            "AND rur.project_id = s.project_id ";
    private final static String SQLGetAppealsAll = SQLGetAppeals +
            "AND s.project_id = ? ";
    private final static String SQLGetAppealsQA = SQLGetAppeals +
            "AND a.appealer_id = ? " +
            "AND a.question_id = ? ";
    private final static String SQLGetAppealsId = SQLGetAppeals +
            "AND a.appeal_id = ? ";

    /**
     * Get the Appeals for a project.
     * If requestor is admin or product manager, then return
     * all appeals.
     * If requestor is reviewer, then return appeals against his reviews.
     * If requestor is submitter, then return appeals he made.
     *
     * @param project
     * @param requestor
     *
     * @return Appeal[]
     */
    public Appeal[] getAppeals(Project project, long aid, long qid, TCSubject requestor) {
        info("DM.getAppeals(), projectId: " + project.getId() +
                ", appealerId: " + aid +
                ", questionId: " + qid +
                ", requestorId: " + requestor.getUserId());

        List appealList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (Common.isAdmin(requestor) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_PRODUCT_MANAGER) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_DESIGNER_DEVELOPER)) {
                if (aid == -1) {
                    ps = conn.prepareStatement(SQLGetAppealsAll);
                    ps.setLong(1, project.getId());
                } else if (qid != -1) {
                    ps = conn.prepareStatement(SQLGetAppealsQA);
                    ps.setLong(1, aid);
                    ps.setLong(2, qid);
                } else {
                    ps = conn.prepareStatement(SQLGetAppealsId);
                    ps.setLong(1, aid);
                }
            } else {
                String errorMsg = "DM.getAppeals() no permissions to get appeals, " +
                        " project: " + project.getId() + ", requestorId: " + requestor.getUserId();
                error(errorMsg);
                throw new RuntimeException(errorMsg);
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                long appealId = rs.getLong(1);
                long appealerId = rs.getLong(2);
                long questionId = rs.getLong(3);
                boolean isResolved = rs.getBoolean(4);
                String appealText = rs.getString(5);
                String appealResponse = rs.getString(6);
                long appealVersionId = rs.getLong(7);
                long reviewerId = rs.getLong(8);
                long submitterId = rs.getLong(9);
                long submissionId = rs.getLong(10);
                long appealerSubmissionId = rs.getLong(10);


                if (!(Common.isAdmin(requestor) ||
                        Common.isRole(project, requestor.getUserId(), Role.ID_PRODUCT_MANAGER))) {
                    // Only retrieve where requestor is reviewer or appealer
                    if (!(reviewerId == requestor.getUserId() ||
                            appealerId == requestor.getUserId())) {
                        continue;
                    }
                }

                ScorecardQuestion question = getScorecardQuestion(questionId);
                User appealer = Common.getUser(dataSource, appealerId);
                User submitter = Common.getUser(dataSource, submitterId);
                User reviewer = Common.getUser(dataSource, reviewerId);

                Appeal appeal = new Appeal(appealId, appealText, appealResponse,
                        isResolved, question, appealer, submitter, reviewer, submissionId,
                        appealerSubmissionId, appealVersionId);

                appealList.add(appeal);
            }

            if (appealList.isEmpty() &&
                    qid != -1 &&
                    Common.isRole(project, requestor.getUserId(), Role.ID_DESIGNER_DEVELOPER)) {
                // Create new appeal-object
                info("DM.getAppeals(), creating new appeal-object.");

                Common.close(ps);
                ps = conn.prepareStatement(
                        "SELECT s.author_id, sub.submitter_id," +
                        "sub.submission_id, sub2.submission_id " +
                        "FROM scorecard_question sq, " +
                        "scorecard s, submission sub, " +
                        "submission sub2 " +
                        "WHERE sq.cur_version = 1 AND " +
                        "s.cur_version = 1 AND " +
                        "sub.cur_version = 1 AND " +
                        "sub2.cur_version = 1 AND " +
                        "sq.scorecard_id = s.scorecard_id AND " +
                        "s.submission_id = sub.submission_id AND " +
                        "sub2.submitter_id = ? AND " +
                        "sq.question_id = ?");
                ps.setLong(1, requestor.getUserId());
                ps.setLong(2, qid);

                rs = ps.executeQuery();

                if (rs.next()) {
                    long reviewerId = rs.getLong(1);
                    long submitterId = rs.getLong(2);
                    long submissionId = rs.getLong(3);
                    long appealerSubmissionId = rs.getLong(4);

                    ScorecardQuestion question = getScorecardQuestion(qid);
                    User appealer = Common.getUser(dataSource, requestor.getUserId());
                    User submitter = Common.getUser(dataSource, submitterId);
                    User reviewer = Common.getUser(dataSource, reviewerId);

                    Appeal appeal = new Appeal(-1, null, null,
                            false, question, appealer, submitter, reviewer,
                            submissionId, appealerSubmissionId,
                            -1);
                    appealList.add(appeal);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        return (Appeal[]) appealList.toArray(new Appeal[appealList.size()]);
    }

    /**
     * Save Appeal to DB.
     *
     * @param appeal
     * @param project
     * @param requestor
     * @throws DocumentAlreadySubmittedException
     * @throws ConcurrentModificationException
     */
    public void saveAppeal(Appeal appeal, Project project, TCSubject requestor) throws DocumentAlreadySubmittedException, ConcurrentModificationException {
        info("DM.saveAppeal(), appealId: " + appeal.getId() +
                ", questionId: " + appeal.getQuestion().getId() +
                ", requestorId: " + requestor.getUserId());

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            long appealVID = -1;
            boolean appealIsResolved = false;

            try {
                if (appeal.getId() != -1) {
                    ps = conn.prepareStatement(
                            "SELECT appeal_v_id, is_resolved " +
                            "FROM appeal " +
                            "WHERE appeal_id = ? AND " +
                            "cur_version = 1");
                    ps.setLong(1, appeal.getId());
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        appealVID = rs.getLong(1);
                        appealIsResolved = rs.getBoolean(2);
                    }
                }
            } finally {
                Common.close(null, ps, rs);
            }

            // If appeal is resolved and the user isn't admin/pm,
            // then don't allow save!
            // If appeal exists and the user isn't the reviewer
            // then don't allow save!
            // If appeal doesn't exist and the user isn't the appealer
            // then don't allow save!
            if ((appealIsResolved &&
                    !(Common.isAdmin(requestor) ||
                    Common.isRole(project, requestor.getUserId(), Role.ID_PRODUCT_MANAGER))) ||
                    (appeal.getId() != -1 &&
                    !(Common.isRole(project, requestor.getUserId(), Role.ID_REVIEWER) &&
                    appeal.getReviewer().getId() == requestor.getUserId())) ||
                    (appeal.getId() == -1 &&
                    !(appeal.getAppealer().getId() == requestor.getUserId()))) {
                String errorMsg = "DM.saveAppeal():\n" +
                        "appealId: " + appeal.getId() + "\n" +
                        "Appeal is already completed!";
                error(errorMsg);
                ejbContext.setRollbackOnly();
                throw new DocumentAlreadySubmittedException(errorMsg);
            }

            if (appeal.getDirty() == true) {
                if (appeal.getId() != -1) {
                    // This is an existing Appeal

                    // Check if review has been modified after calling
                    // the get-method.
                    if (appealVID != -1) {
                        if (appealVID != appeal.getVersionId()) {
                            String errorMsg = "DM.saveAppeal(): Concurrent error, appealId: " + appeal.getId() +
                                    ", appealVersionId: " + appeal.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "DM.saveAppeal(): Trying to save non-existing Appeal, appealId: " +
                                appeal.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE appeal " +
                                "SET cur_version = 0 " +
                                "WHERE appeal_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, appeal.getId());

                        int nr = ps.executeUpdate();
                        //Common.close(ps);

                        if (nr == 0) {
                            String errorMsg = "DM.saveAppeal(): Trying to save non-existing Appeal, appealId: " +
                                    appeal.getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(null, ps, null);
                    }
                } else {
                    try {
                        // New Appeal, check that it doesn't exist in db
                        ps = conn.prepareStatement(
                                "SELECT appeal_v_id " +
                                "FROM appeal " +
                                "WHERE cur_version = 1 AND " +
                                "appealer_id = ? AND " +
                                "question_id = ?");

                        ps.setLong(1, appeal.getAppealer().getId());
                        ps.setLong(2, appeal.getQuestion().getId());
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            String errorMsg = "DM.saveAppeal(): Concurrent error(saving new Appeal)" +
                                    ", appealerId: " + appeal.getAppealer().getId() +
                                    ", questionId: " + appeal.getQuestion().getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                        Common.close(ps);
                        appeal.setId(idGen.nextId());
                    } catch (RemoteException e1) {
                        String errorMsg = "DM.saveAppeal(): RemoteException trying to use id-generator:\n" +
                                e1.toString();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new RuntimeException(errorMsg);
                    } finally {
                        Common.close(null, ps, rs);
                    }
                    info("DM.saveAppeal(): Saving a new Appeal, id: " + appeal.getId());
                }

                try {
                    ps = conn.prepareStatement(
                            "INSERT INTO appeal " +
                            "(appeal_v_id, appeal_id, " +
                            "appealer_id, question_id, " +
                            "is_resolved, appeal_text, " +
                            "appeal_response, modify_user, " +
                            "cur_version) " +
                            "VALUES " +
                            "(0, ?, ?, ?, ?, ?, ?, ?, 1)");

                    if (Common.tooBig(appeal.getAppealText()) ||
                            Common.tooBig(appeal.getAppealResponse())) {
                        String errorMsg = "DM.saveAppeal(), text-field too long!";
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    }
                    ps.setLong(1, appeal.getId());
                    ps.setLong(2, appeal.getAppealer().getId());
                    ps.setLong(3, appeal.getQuestion().getId());
                    ps.setBoolean(4, appeal.isResolved());
                    info("text: " + appeal.getAppealText());
                    info("response: " + appeal.getAppealResponse());
                    ps.setString(5, appeal.getAppealText());
                    if (appeal.getAppealResponse() == null) {
                        ps.setNull(6, Types.CLOB);
                    } else {
                        ps.setString(6, appeal.getAppealResponse());
                    }
                    ps.setLong(7, requestor.getUserId());

                    int nr = ps.executeUpdate();

                    if (nr != 1) {
                        String errorMsg = "DM.saveAppeal(): Could not insert Appeal!\n" +
                                ", appealId: " + appeal.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(null, ps, rs);
                }
            }
            try {
                ps = conn.prepareStatement(
                        "SELECT scorecard_id " +
                        "FROM scorecard_question " +
                        "WHERE cur_version = 1 AND " +
                        "question_id = ?");
                ps.setLong(1, appeal.getQuestion().getId());
                rs = ps.executeQuery();
                long scorecardId = -1;
                if (rs.next()) {
                    scorecardId = rs.getLong(1);
                }
                saveQuestion(conn, appeal.getQuestion(), scorecardId, requestor.getUserId());
            } finally {
                Common.close(null, ps, rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    public ScorecardTemplate[] getScorecardTemplates() {
        info("DM.getScorecardTemplates()");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT st.template_id, st.template_name, " +
                    "st.status_id, " +
                    "st.project_type, st.scorecard_type, st.default_ind " +
                    "FROM scorecard_template st " +
                    "ORDER BY st.status_id, " +
                    "st.project_type, st.scorecard_type, " +
                    "st.template_name");
            rs = ps.executeQuery();

            List templateList = new LinkedList();
            while (rs.next()) {
                long templateId = rs.getLong(1);
                String templateName = rs.getString(2);
                int statusId = rs.getInt(3);
                int projectType = rs.getInt(4);
                int scorecardType = rs.getInt(5);
                boolean default_ind = rs.getBoolean(6);

                ScorecardTemplate st = new ScorecardTemplate(templateId,
                        templateName, statusId, projectType, scorecardType, null, default_ind);
                templateList.add(st);
            }
            return (ScorecardTemplate[]) templateList.toArray(new ScorecardTemplate[0]);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    public ScorecardTemplate getDefaultScorecardTemplate(long projectTypeId, long scorecardTypeId) {
        ScorecardTemplate st = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT st.template_id " +
                    "FROM scorecard_template st " +
                    "WHERE st.default_ind = 1 AND " +
                    "st.scorecard_type = ? AND " +
                    "st.project_type = ? ");
            ps.setLong(1, scorecardTypeId);
            ps.setLong(2, projectTypeId);
            rs = ps.executeQuery();

            if (rs.next()) {
                long templateId = rs.getLong(1);

                st = getScorecardTemplate(templateId);
            } else {
                throw new RuntimeException("No default found");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        return st;
    }

    public ScorecardTemplate getScorecardTemplate(long reqTemplateId) {
        ScorecardTemplate st = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT st.template_id, st.template_name, " +
                    "st.status_id, " +
                    "st.project_type, st.scorecard_type, st.default_ind " +
                    "FROM scorecard_template st " +
                    "WHERE st.template_id = ? " +
                    "ORDER BY st.status_id, " +
                    "st.project_type, st.scorecard_type");
            ps.setLong(1, reqTemplateId);
            rs = ps.executeQuery();

            if (rs.next()) {
                long templateId = rs.getLong(1);
                String templateName = rs.getString(2);
                int statusId = rs.getInt(3);
                int projectType = rs.getInt(4);
                int scorecardType = rs.getInt(5);
                boolean default_ind = rs.getBoolean(6);

                st = new ScorecardTemplate(templateId,
                        templateName, statusId, projectType, scorecardType, null, default_ind);
            } else {
                throw new RuntimeException("No scorecardtemplate found with id: " + reqTemplateId);
            }
            Common.close(ps);

            ps = conn.prepareStatement(
                    "SELECT qt.q_template_v_id, qt.q_template_id, " +
                    "qt.project_type, qt.scorecard_type, " +
                    "qt.question_text, qt.question_weight, " +
                    "qt.question_seq_loc, qt.section_id, " +
                    "qt.question_type, qt.template_id, " +
                    "ssg.group_seq_loc, ss.section_seq_loc, qt.question_seq_loc, " +
                    "ss.section_name, ss.section_weight, " +
                    "ssg.group_id, ssg.group_name " +
                    "FROM question_template qt, scorecard_section ss, sc_section_group ssg " +
                    "WHERE qt.cur_version = 1 AND " +
                    "qt.section_id = ss.section_id AND " +
                    "ss.group_id = ssg.group_id AND " +
                    "qt.template_id = ? " +
                    "ORDER BY ssg.group_seq_loc, " +
                    "ss.section_seq_loc, " +
                    "qt.question_seq_loc");
            ps.setLong(1, reqTemplateId);
            rs = ps.executeQuery();

            List groupList = new LinkedList();
            List sectionList = new LinkedList();
            List questionList = new LinkedList();
            TGroup tGroup = null;
            TSection tSection = null;
            long lastSectionId = -1;
            long lastGroupId = -1;
            while (rs.next()) {
                long qTemplateVID = rs.getLong(1);
                //info("DM.getScorecardTemplate(): qTemplateVID: " + qTemplateVID);
                long qTemplateId = rs.getLong(2);
                long projectType = rs.getLong(3);
                int scorecardType = rs.getInt(4);
                String questionText = rs.getString(5);
                int questionWeight = rs.getInt(6);
                int questionSeqLoc = rs.getInt(7);
                long sectionId = rs.getLong(8);
                int questionType = rs.getInt(9);
                long templateId = rs.getLong(10);

                int groupSeqLoc = rs.getInt(11);
                int sectionSeqLoc = rs.getInt(12);
                // questionSeqLoc
                String sectionName = rs.getString(14);
                int sectionWeight = rs.getInt(15);
                long groupId = rs.getLong(16);
                String groupName = rs.getString(17);

                if (sectionId != lastSectionId) {
                    // new section
                    //ScorecardSectionManager scorecardSectionManager = (ScorecardSectionManager) Common.getFromCache(
                    //"ScorecardSectionManager");
                    //ScorecardSection section = scorecardSectionManager.getScorecardSection(sectionId);
                    ScorecardSectionGroup sectionGroup = new ScorecardSectionGroup(groupId, groupName, groupSeqLoc);
                    ScorecardSection section = new ScorecardSection(sectionId, sectionName, sectionWeight,
                            sectionSeqLoc, sectionGroup);


                    if (tSection != null) {
                        tSection.setQuestions((TQuestion[]) questionList.toArray(new TQuestion[0]));
                        sectionList.add(tSection);
                        questionList.clear();
                    }
                    tSection = new TSection(null, sectionId, section.getName(),
                            section.getWeight(), section.getWeight(), section.getSectionGroup().getId());
                    lastSectionId = sectionId;

                    if (section.getSectionGroup().getId() != lastGroupId) {
                        // new group
                        if (tGroup != null) {
                            tGroup.setSections((TSection[]) sectionList.toArray(new TSection[0]));
                            groupList.add(tGroup);
                            sectionList.clear();
                        }
                        tGroup = new TGroup(null, section.getSectionGroup().getId(),
                                section.getSectionGroup().getName(),
                                section.getSectionGroup().getSequenceLocation());
                        lastGroupId = section.getSectionGroup().getId();
                    }
                } // end new section

                //ScorecardQuestion question;
                TQuestion tQuestion = new TQuestion(
                        qTemplateVID, qTemplateId, projectType,
                        scorecardType, questionText, questionWeight,
                        questionSeqLoc, sectionId, questionType,
                        templateId);
                questionList.add(tQuestion);
            }
            if (tSection != null) {
                tSection.setQuestions((TQuestion[]) questionList.toArray(new TQuestion[0]));
                sectionList.add(tSection);
                questionList.clear();
            }
            if (tGroup != null) {
                tGroup.setSections((TSection[]) sectionList.toArray(new TSection[0]));
                groupList.add(tGroup);
                sectionList.clear();
            }
            st.setGroups((TGroup[]) groupList.toArray(new TGroup[0]));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        return st;
    }

    public void saveScorecardTemplate(ScorecardTemplate template,
                                      boolean saveNew, boolean saveQuestions) {
        info("DMB.saveScorecardTemplate(), tId: " + template.getId() +
                " , saveNew: " + saveNew + " ,saveQuestions: " + saveQuestions);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        TGroup[] groups = template.getGroups();
        if (groups == null) groups = new TGroup[0];
        try {
            conn = dataSource.getConnection();

            if (template.getId() < -1) {
                // Remove old questions/sections/groups
                ps = conn.prepareStatement(
                        "DELETE FROM question_template " +
                        "WHERE template_id = ?");
                ps.setLong(1, template.getId());
                ps.executeUpdate();
                Common.close(ps);
                ps = conn.prepareStatement(
                        "DELETE FROM scorecard_section " +
                        "WHERE template_id = ?");
                ps.setLong(1, template.getId());
                ps.executeUpdate();
                Common.close(ps);
                ps = conn.prepareStatement(
                        "DELETE FROM sc_section_group " +
                        "WHERE template_id = ?");
                ps.setLong(1, template.getId());
                ps.executeUpdate();
                Common.close(ps);
                // Delete template
                ps = conn.prepareStatement(
                        "DELETE FROM scorecard_template " +
                        "WHERE template_id = ?");
                ps.setLong(1, -template.getId());
                ps.executeUpdate();
                Common.close(ps);
                return;
            }

            if (saveNew) {
                template.setId(idGen.nextId());
            }
            if (saveQuestions) {
                if (!saveNew) {
                    // Check that existing template has status_id=0
                    if (template.getStatus() != 0) {
                        throw new RuntimeException("Cannot replace template with status != 0");
                    }
                    // Remove old questions/sections/groups
                    ps = conn.prepareStatement(
                            "DELETE FROM question_template " +
                            "WHERE template_id = ?");
                    ps.setLong(1, template.getId());
                    ps.executeUpdate();
                    Common.close(ps);
                    ps = conn.prepareStatement(
                            "DELETE FROM scorecard_section " +
                            "WHERE template_id = ?");
                    ps.setLong(1, template.getId());
                    ps.executeUpdate();
                    Common.close(ps);
                    ps = conn.prepareStatement(
                            "DELETE FROM sc_section_group " +
                            "WHERE template_id = ?");
                    ps.setLong(1, template.getId());
                    ps.executeUpdate();
                    Common.close(ps);
                }
                // Insert new questions/sections/groups
                for (int i = 0; i < groups.length; i++) {
                    ps = conn.prepareStatement(
                            "INSERT INTO sc_section_group " +
                            "(GROUP_ID, GROUP_NAME, " +
                            "GROUP_SEQ_LOC, TEMPLATE_ID) VALUES " +
                            "(?,?,?,?)");
                    groups[i].setGroupId(idGen.nextId());
                    groups[i].setGroupSeqLoc(i + 1);
                    info("1: " + groups[i].getGroupId());
                    info("2: " + groups[i].getGroupName());
                    info("3: " + groups[i].getGroupSeqLoc());
                    info("4: " + template.getId());
                    ps.setLong(1, groups[i].getGroupId());
                    ps.setString(2, groups[i].getGroupName());
                    ps.setInt(3, groups[i].getGroupSeqLoc());
                    ps.setLong(4, template.getId());
                    ps.executeUpdate();
                    Common.close(ps);
                }
                for (int i = 0; i < groups.length; i++) {
                    TSection[] sections = groups[i].getSections();
                    if (sections == null) sections = new TSection[0];
                    for (int j = 0; j < sections.length; j++) {
                        ps = conn.prepareStatement(
                                "INSERT INTO scorecard_section " +
                                "(SECTION_ID, SECTION_NAME, SECTION_WEIGHT, " +
                                "SECTION_SEQ_LOC, GROUP_ID, TEMPLATE_ID) VALUES " +
                                "(?,?,?,?,?,?)");
                        sections[j].setSectionId(idGen.nextId());
                        sections[j].setSectionSeqLoc(j + 1);
                        sections[j].setGroupId(groups[i].getGroupId());
                        ps.setLong(1, sections[j].getSectionId());
                        ps.setString(2, sections[j].getSectionName());
                        ps.setInt(3, sections[j].getSectionWeight());
                        ps.setInt(4, sections[j].getSectionSeqLoc());
                        ps.setLong(5, sections[j].getGroupId());
                        ps.setLong(6, template.getId());
                        ps.executeUpdate();
                        Common.close(ps);
                    }
                }
                for (int i = 0; i < groups.length; i++) {
                    TSection[] sections = groups[i].getSections();
                    if (sections == null) sections = new TSection[0];
                    for (int j = 0; j < sections.length; j++) {
                        TQuestion[] questions = sections[j].getQuestions();
                        if (questions == null) questions = new TQuestion[0];
                        for (int k = 0; k < questions.length; k++) {
                            ps = conn.prepareStatement(
                                    "INSERT INTO question_template " +
                                    "(Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE, " +
                                    "SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, " +
                                    "QUESTION_SEQ_LOC, SECTION_ID, QUESTION_TYPE, " +
                                    "TEMPLATE_ID, MODIFY_USER, CUR_VERSION) VALUES " +
                                    "(0,?,?,?,?,?,?,?,?,?,296466,1)");
                            questions[k].setQTemplateId(idGen.nextId());
                            questions[k].setQuestionSeqLoc(k + 1);
                            questions[k].setSectionId(sections[j].getSectionId());
                            ps.setLong(1, questions[k].getQTemplateId());
                            ps.setLong(2, questions[k].getProjectType());
                            ps.setInt(3, questions[k].getScorecardType());
                            ps.setString(4, questions[k].getQuestionText());
                            ps.setInt(5, questions[k].getQuestionWeight());
                            ps.setInt(6, questions[k].getQuestionSeqLoc());
                            ps.setLong(7, questions[k].getSectionId());
                            ps.setInt(8, questions[k].getQuestionType());
                            ps.setLong(9, template.getId());
                            ps.executeUpdate();
                            Common.close(ps);
                        }
                    }
                }
            } // end save questions

            if (template.isDefault()) {
                //update default_ind = 0 for all other scorecards with same type
                ps = conn.prepareStatement(
                        "UPDATE scorecard_template " +
                        "SET default_ind = 0 " +
                        "WHERE project_type = ? " +
                        "AND scorecard_type = ? ");
                ps.setInt(1, template.getProjectType());
                ps.setInt(2, template.getScorecardType());

                ps.executeUpdate();
                Common.close(ps);
            }

            // save scorecard_template
            if (saveNew) {
                info("Saving new scorecard_template");
                template.setStatus(0);
                ps = conn.prepareStatement(
                        "INSERT INTO scorecard_template " +
                        "(TEMPLATE_ID, TEMPLATE_NAME, STATUS_ID, " +
                        "PROJECT_TYPE, SCORECARD_TYPE) VALUES " +
                        "(?,?,?,?,?) ");
                ps.setLong(1, template.getId());
                ps.setString(2, template.getName());
                ps.setInt(3, template.getStatus());
                ps.setInt(4, template.getProjectType());
                ps.setInt(5, template.getScorecardType());
                ps.executeUpdate();
                Common.close(ps);
            } else {
                ps = conn.prepareStatement(
                        "UPDATE scorecard_template " +
                        "SET template_name = ?, " +
                        "status_id = ?, " +
                        "project_type = ?, " +
                        "scorecard_type = ?, " +
                        "default_ind = ? " +
                        "WHERE template_id = ?");
                ps.setString(1, template.getName());
                ps.setInt(2, template.getStatus());
                ps.setInt(3, template.getProjectType());
                ps.setInt(4, template.getScorecardType());
                ps.setBoolean(5, template.isDefault());
                ps.setLong(6, template.getId());
                ps.executeUpdate();
                Common.close(ps);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
    }


    public ComponentScores getComponentScores(int type, long projectId) {
        return new ComponentScores(type, projectId,
                                                                    "Job Scheduler",
                                                                    new int[] {10022398, 11781622,  10650643 },
                                                                    new String[] { "slion", "tuenm","quickx0161" },
                                                                    new String [] { "a","b","c" },
                                                                    new SubmissionScores[]  {

        new SubmissionScores("arylio", 7489235, 15072115,1, 99.0, new double[] { 90, 93, 96}, 93.1),
        new SubmissionScores("PE", 9998760, 15072376,2, 93.0, new double[] { 80, 83, 86}, 83.1)  }  );
    }


    /**
     * This method is required by the EJB Specification. Used to get the context ... for dynamic connection pools.
     *
     * @throws CreateException DOCUMENT ME!
     */
    public void ejbCreate() throws CreateException {
        dataSource = Common.getDataSource();

        try {
            InitialContext context = new InitialContext();
            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o, IdGenHome.class);
            idGen = idGenHome.create();

//            PolicyMgrRemoteHome home2 = (PolicyMgrRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
//                    "java:comp/env/security/PolicyMgr"), PolicyMgrRemoteHome.class);
//            PolicyMgrRemote policyMgr = home2.create();

        } catch (Exception e) {
            throw new CreateException("Could not find IdGen!" + e);
        }

        try {
            log = LogFactory.getInstance().getLog("com.topcoder.apps.review.document.DocumentManagerBean");
        } catch (LogException e) {
            e.printStackTrace();
        }


    }

    /**
     * This method is required by the EJB Specification
     */
    public void ejbRemove() {
    }

    /**
     * This method is required by the EJB Specification
     */
    public void ejbActivate() {
    }

    /**
     * This method is required by the EJB Specification
     */
    public void ejbPassivate() {
    }

    /**
     * This method is required by the EJB Specification
     *
     * @param ctx DOCUMENT ME!
     */
    public void setSessionContext(SessionContext ctx) {
        this.ejbContext = ctx;
    }
}
