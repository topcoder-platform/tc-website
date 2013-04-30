/*
 * Copyright (c) 2013 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.tcs;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <strong>Purpose</strong>:
 * Utility to compute and update reviewer ratings for all software tracks.
 *
 * This utility analyzes the review feedback data for past contests and computed the reviewer rating using a variation
 * of the Elo ratings algorithm.
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class ReviewerRatings extends DBUtility {
    
    private static final String SQL_QUERY_REVIEW_FEEDBACK_DATA = "SELECT p.project_id, rf.reviewer_user_id AS user_id," +
            "rf.score AS rating, pp.actual_start_time as review_date " +
            "FROM review_feedback rf " +
            "INNER JOIN project p ON p.project_id = rf.project_id and p.project_category_id=? " +
            "INNER JOIN project_phase pp ON pp.project_id=p.project_id and pp.phase_type_id=4 " +
            "ORDER BY pp.actual_start_time";

    private static final String SQL_QUERY_PROJECT_CATEGORIES = "SELECT project_category_id " +
            "FROM project_category_lu WHERE project_type_id in (1,2)";

    private static final String SQL_DELETE_RATING = "DELETE FROM reviewer_rating where project_id = ?";
    
    private static final String SQL_INSERT_RATING = "INSERT INTO reviewer_rating values (?,?,?,?)";
    /**
     * This variable tells if only an analysis is wanted.
     */
    private boolean onlyAnalyze;

    /**
     * This variable holds the number such that coefficient K1 is used when the number of review events is
     * less or equal than this number, otherwise coefficient K2 is used.
     */
    private long minEvents = 4;

    /**
     * Elo rating K coefficient for small number of review events.
     */
    private long k1 = 6;

    /**
     * Elo rating K coefficient for large number of review events.
     */
    private long k2 = 1;

    /**
     * <p>
     * Represents the default Elo rating value used for new reviewers.
     * </p>
     */
    private double defaultRating = 100;

    /**
     * <p>
     * Contains ratings per each user.
     * </p>
     * <p>
     * Key - user ID, value - rating of that user.
     * </p>
     */
    private Map<Long, Double> ratingPerUser;

    /**
     * <p>
     * Contains number of "review events" per each user.
     * </p>
     * <p>
     * Key - user ID, value - number of "review events" for that user.
     * </p>
     */
    private Map<Long, Long> eventsPerUser;

    public ReviewerRatings() {
        super();
    }

    /**
     * Runs the ReviewerRatings utility.
     * <p/>
     * This utility updates reviewer ratings for all rated tracks.
     */
    public void runUtility() throws Exception {
        log.info("");
        log.info("-----------------------------------------------");

        long projectCount = 0, userCount = 0;
        List<Long> projectCategoryIDs = getProjectCategoryIDs();
        
        for (Long projectCategoryId : projectCategoryIDs) {
            log.info("Analyzing project category " + projectCategoryId);
            ratingPerUser = new HashMap<Long, Double>();
            eventsPerUser = new HashMap<Long, Long>();

            List<Project> projects = getReviewFeedbackData(projectCategoryId);

            for(Project project : projects) {
                List<Double> oldRatings = new ArrayList<Double>();
                List<Double> oldK = new ArrayList<Double>();

                for(Long userID : project.reviewers) {
                    oldRatings.add(getRating(userID));
                    oldK.add(getK(userID));
                }

                for(int i=0; i<project.reviewers.size(); i++) {
                    for(int j=i+1; j<project.reviewers.size(); j++) {
                        long user1ID = project.reviewers.get(i);
                        long user2ID = project.reviewers.get(j);

                        double actualScore1, actualScore2;
                        if (project.scores.get(i) > project.scores.get(j)) {
                            actualScore1 = 1.0;
                            actualScore2 = 0.0;
                        } else if (project.scores.get(i) < project.scores.get(j)) {
                            actualScore1 = 0.0;
                            actualScore2 = 1.0;
                        } else {
                            continue;
                        }

                        double q1 = Math.pow(10.0, oldRatings.get(i)/25.0), q2 = Math.pow(10.0, oldRatings.get(j)/25.0);
                        double expectedScore1 = q1/(q1+q2), expectedScore2 = q2/(q1+q2);

                        ratingPerUser.put(user1ID, getRating(user1ID) + (actualScore1 - expectedScore1) * oldK.get(i));
                        ratingPerUser.put(user2ID, getRating(user2ID) + (actualScore2 - expectedScore2) * oldK.get(j));

                        eventsPerUser.put(user1ID, getEvents(user1ID) + 1);
                        eventsPerUser.put(user2ID, getEvents(user2ID) + 1);
                    }
                }

                if (!onlyAnalyze) {
                    updateReviewerRating(project);
                }
                projectCount++;
            }
            
            for (Long userID : ratingPerUser.keySet()) {
                log.info("User: " + userID + ", rating: " + getRating(userID));
                userCount++;
            }
        }

        log.info("-----------------------------------------------");
        log.info("Successfully analyzed " + projectCount + " projects and " + userCount + " reviewers in all tracks.\n");
    }

    /**
     * Private method that returns reviewer rating. For users who haven't been rated yet,
     * it returns defaultRating.
     *
     * @param id
     *            User ID.
     * @return Reviewer rating.
     */
    private double getRating(Long id) {
        return ratingPerUser.containsKey(id) ? ratingPerUser.get(id) : defaultRating;
    }

    /**
     * Private method that returns the number of "review events" for the user.
     *
     * @param id
     *            User ID.
     * @return Number of "review events".
     */
    private long getEvents(Long id) {
        return eventsPerUser.containsKey(id) ? eventsPerUser.get(id) : 0;
    }

    /**
     * Private method that returns the K-coefficient used for calculating Elo rating.
     *
     * @param id
     *            User ID.
     * @return The K-coefficient of the Elo rating.
     */
    private double getK(Long id) {
        if (getEvents(id) <= minEvents) {
            return k1;
        } else {
            return k2;
        }
    }

    /**
     * This method returns all project category IDs for software tracks.
     *
     * @return List of all project category IDs for software tracks.
     *
     * @throws Exception
     *             If any error occurs.
     *
     */
    private List<Long> getProjectCategoryIDs() throws Exception {
        List<Long> projectCategoryIDs = new ArrayList<Long>();
        
        PreparedStatement preparedStatement = prepareStatement("tcs_catalog", SQL_QUERY_PROJECT_CATEGORIES);
        ResultSet resultSet = null;
        try {
            // Execute the statement
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                long projectCategoryID = resultSet.getLong("project_category_id");

                projectCategoryIDs.add(projectCategoryID);
            }
        } catch (SQLException sqle) {
            throw new Exception("Failed to fetch project category IDs due to SQLException.", sqle);
        } finally {
            // Release the resource.
            DBMS.close(resultSet);
            DBMS.close(preparedStatement);
        }

        return projectCategoryIDs;
    }
    
    /**
     * This method fetches all review feedback records for the past projects in the track.
     *
     * @param projectCategoryId
     *            Project category ID.
     * @return List of project feedback scores. Each project is represented by a map from user ID to feedback score.
     *
     * @throws Exception
     *             If any error occurs.
     *
     */
    private List<Project> getReviewFeedbackData(long projectCategoryId) throws Exception {
        List<Project> projects = new ArrayList<Project>();

        PreparedStatement preparedStatement = prepareStatement("tcs_catalog", SQL_QUERY_REVIEW_FEEDBACK_DATA);
        ResultSet resultSet = null;
        try {
            // Create a prepared statement
            preparedStatement.setLong(1, projectCategoryId);

            // Execute the statement
            resultSet = preparedStatement.executeQuery();
            Project project = null;
            long lastProjectId = -1;
            while (resultSet.next()) {
                long projectID = resultSet.getLong("project_id");
                long userID = resultSet.getLong("user_id");
                long score = resultSet.getLong("rating");
                Date reviewDate = resultSet.getDate("review_date");

                if (project == null || projectID != lastProjectId) {
                    project = new Project();
                    project.id = projectID;
                    project.reviewDate = reviewDate;
                    
                    projects.add(project);
                    lastProjectId = projectID;
                }

                project.reviewers.add(userID);
                project.scores.add(score);
            }
        } catch (SQLException sqle) {
            throw new Exception("Failed to fetch the review feedback scores due to SQLException.", sqle);
        } finally {
            // Release the resource.
            DBMS.close(resultSet);
            DBMS.close(preparedStatement);
        }

        return projects;
    }

    private void updateReviewerRating(Project project) throws Exception {
        PreparedStatement psDelete = null;
        PreparedStatement psInsert = null;
        try {
            psDelete = prepareStatement("tcs_catalog", SQL_DELETE_RATING);
            psDelete.clearParameters();
            psDelete.setLong(1, project.id);
            psDelete.executeUpdate();
            
            psInsert = prepareStatement("tcs_catalog", SQL_INSERT_RATING);

            for (Long userID : project.reviewers) {
                psInsert.clearParameters();
                psInsert.setLong(1, project.id);
                psInsert.setLong(2, userID);
                psInsert.setDate(3, project.reviewDate);
                psInsert.setDouble(4, getRating(userID));

                psInsert.executeUpdate();
            }
        } catch (SQLException sqle) {
            throw new Exception("Failed to update reviewer rating due to SQLException.", sqle);
        } finally {
            DBMS.close(psDelete);
            DBMS.close(psInsert);
        }
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        String tmp = (String) params.get("onlyAnalyze");
        if (tmp == null) {
            setUsageError("Please specify onlyAnalyze.\n");
        } else {
            onlyAnalyze = tmp.equalsIgnoreCase("true");
        }
        params.remove("onlyAnalyze");

        tmp = (String) params.get("minEvents");
        if (tmp == null) {
            setUsageError("Please specify minEvents.\n");
        } else {
            minEvents = Long.parseLong(tmp);
        }
        params.remove("minEvents");

        tmp = (String) params.get("K1");
        if (tmp == null) {
            setUsageError("Please specify K1.\n");
        } else {
            k1 = Long.parseLong(tmp);
        }
        params.remove("K1");

        tmp = (String) params.get("K2");
        if (tmp == null) {
            setUsageError("Please specify K2.\n");
        } else {
            k2 = Long.parseLong(tmp);
        }
        params.remove("K2");

        tmp = (String) params.get("defaultRating");
        if (tmp == null) {
            setUsageError("Please specify defaultRating.\n");
        } else {
            defaultRating = Double.parseDouble(tmp);
        }
        params.remove("defaultRating");


        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the ReviewerRatings.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ReviewerRatings:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        sErrorMsg.append("   -minEvents : the number such that coefficient K1 is used when the actual number of " +
                "review events is less or equal than this number, otherwise coefficient K2 is used.\n");
        sErrorMsg.append("   -K1 : Elo rating K coefficient for small number of review events.\n");
        sErrorMsg.append("   -K2 : Elo rating K coefficient for large number of review events.\n");
        sErrorMsg.append("   -defaultRating : Represents the default Elo rating value used for new reviewers.\n");

        fatal_error();
    }


    private class Project {
        public long id;
        public Date reviewDate;
        public List<Long> reviewers = new ArrayList<Long>();
        public List<Long> scores = new ArrayList<Long>();
    }

}