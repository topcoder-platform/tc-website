package com.topcoder.utilities.dwload;

/**
 * TCLoadRank loads the rank and rank history tables.  There are many
 * different type of potential ranks, so this load has been separated
 * from the rest of the aggregate load.
 *
 * This load populated the rank and rank history tables for the following
 * types of ranks
 *
 * <ul>
 * <li>coder_rank - overall by rating</li>
 * <li>coder_rank_history - overall by rating</li>
 * </ul>
 *
 * @author Greg Paul
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 */

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.*;

public class TCLoadRank extends TCLoad {
    private int roundId = 0;
    private boolean FULL_LOAD = false;

    private static Logger log = Logger.getLogger(TCLoadRank.class);
    private static final int OVERALL_RATING_RANK_TYPE_ID = 1;
    private static final int ACTIVE_RATING_RANK_TYPE_ID = 2;
    private static final int SRM_ROUND_TYPE = 1;
    private static final int TOURNAMENT_ROUND_TYPE = 2;
    private static final int AVERAGE_RATING_RANK_TYPE_ID = 1;

    /**
     * Constructor. Set our usage message here.
     */
    public TCLoadRank() {
        log.debug("TCLoadRank constructor called...");
        USAGE_MESSAGE = new String(
                "TCLoadRank parameters - defaults in ():\n" +
                "  -roundid number       : Round ID to load\n" +
                "  [-fullload boolean] : true-clean rank load, false-selective  (false)\n");
    }


    /**
     * This method is passed any parameters passed to this load
     */
    public boolean setParameters(Hashtable params) {
        log.debug("setParameters called...");
        try {
            Boolean tmpBool;
            roundId = retrieveIntParam("roundid", params, false, true).intValue();

            //TODO get the rank type constants from xml
            tmpBool = retrieveBooleanParam("fullload", params, true);
            if (tmpBool != null) {
                FULL_LOAD = tmpBool.booleanValue();
                log.info("New fullload flag is " + FULL_LOAD);
            }

        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }

        return true;
    }

   /**
     * This method performs the load for the round information tables
     */
    public boolean performLoad() {
        log.debug("performLoad called...");
        try {

            loadRatingRank(OVERALL_RATING_RANK_TYPE_ID);

            loadOverallRatingRankHistory();

            loadRatingRank(ACTIVE_RATING_RANK_TYPE_ID);


            loadCountryRatingRank(OVERALL_RATING_RANK_TYPE_ID);
            loadStateRatingRank(OVERALL_RATING_RANK_TYPE_ID);
            loadSchoolRatingRank(OVERALL_RATING_RANK_TYPE_ID);

            loadCountryRatingRank(ACTIVE_RATING_RANK_TYPE_ID);
            loadStateRatingRank(ACTIVE_RATING_RANK_TYPE_ID);
            loadSchoolRatingRank(ACTIVE_RATING_RANK_TYPE_ID);
//            loadAgeGroupAvgRatingRank();


            log.info("SUCCESS: Rank load ran successfully for round " + roundId + ".");
            return true;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }
    }


    /**
     * Loads the coder_rank table with information about
     * overall rating rank.
     */
    private void loadRatingRank(int rankType) throws Exception {
        log.debug("loadRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {

            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM coder_rank");
            query.append(  " WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO coder_rank (coder_id, percentile, rank, coder_rank_type_id)");
            query.append( " VALUES (?, ?, ?, " + rankType + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            /* coder_rank table should be kept "up-to-date" so get the most recent stuff
             * from the rating table
             */
            ratings = getCurrentCoderRatings(rankType==ACTIVE_RATING_RANK_TYPE_ID);
            coderCount = ratings.size();

            // delete all the records for the overall rating rank type
            psDel.executeUpdate();

            int i = 0;
            int rating = 0;
            int rank = 0;
            int size = ratings.size();
            int tempRating = 0;
            int tempCoderId = 0;
            for (int j=0; j<size; j++) {
                i++;
                tempRating = ((CoderRating)ratings.get(j)).getRating();
                tempCoderId = ((CoderRating)ratings.get(j)).getCoderId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setInt(1, tempCoderId);
                psIns.setFloat(2, (float)100*((float)(coderCount-rank)/coderCount));
                psIns.setInt(3, rank);
                count += psIns.executeUpdate();
                printLoadProgress(count, "overall rating rank");
            }
            log.info("Records loaded for overall rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_rank' table failed for overall rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }

    /**
     * Loads the coder_rank_history table with information about
     * overall rating rank.
     */
    private void loadOverallRatingRankHistory() throws Exception {
        log.debug("loadOverallRatingRankHistory called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {

            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM coder_rank_history");
            query.append(  " WHERE coder_rank_type_id = " + OVERALL_RATING_RANK_TYPE_ID);
            query.append(    " AND round_id = " + roundId);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO coder_rank_history (coder_id, round_id, percentile, rank, coder_rank_type_id)");
            query.append( " VALUES (?, ?, ?, ?, " + OVERALL_RATING_RANK_TYPE_ID + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);


            /* if it's the most recent round that we're loading
             * we can pull from the rating table, if not,
             * then we have to go and build up the ratings of
             * all the people who have competed up until the time
             * of the given round
             */
            if (roundId==getMostRecentRound()) {
                ratings = getCurrentCoderRatings(false);
            } else {
                ratings = getCoderRatingsForRound();
            }
            coderCount = ratings.size();

            // delete all the records for the overall rating rank type
            psDel.executeUpdate();

            int i = 0;
            int rating = 0;
            int rank = 0;
            int size = ratings.size();
            int tempRating = 0;
            int tempCoderId = 0;
            for (int j=0; j<size; j++) {
                i++;
                tempRating = ((CoderRating)ratings.get(j)).getRating();
                tempCoderId = ((CoderRating)ratings.get(j)).getCoderId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setInt(1, tempCoderId);
                psIns.setInt(2, roundId);
                psIns.setFloat(3, (float)100*((float)(coderCount-rank)/coderCount));
                psIns.setInt(4, rank);
                count += psIns.executeUpdate();
                printLoadProgress(count, "overall rating rank history");
            }
            log.info("Records loaded for overall rating rank history load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_rank_history' table failed for overall rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }


    /**
     * Loads the country_coder_rank table with information about
     * rating rank within a country.
     */
    private void loadCountryRatingRank(int rankType) throws Exception {
        log.debug("loadCountryRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {

            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM country_coder_rank");
            query.append(  " WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO country_coder_rank (coder_id, percentile, rank, rank_no_tie, country_code, coder_rank_type_id)");
            query.append( " VALUES (?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " SELECT distinct c.country_code");
            query.append(   " FROM coder c");
            query.append(      " , rating r");
            if (rankType==ACTIVE_RATING_RANK_TYPE_ID)
                query.append(      " , active_members a");
            query.append(  " WHERE c.status = 'A'");
            query.append(    " AND r.rating > 0");
            query.append(    " AND c.coder_id = r.coder_id");
            if (rankType==ACTIVE_RATING_RANK_TYPE_ID)
                query.append(    " AND a.coder_id = c.coder_id") ;
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            // delete all the records from the country ranking table
            psDel.executeUpdate();

            rs = psSel.executeQuery();
            String countryCode = null;
            while (rs.next()) {
                countryCode =rs.getString("country_code");
                ratings = getCurrentCoderCountryRatings(countryCode, rankType==ACTIVE_RATING_RANK_TYPE_ID);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                int tempCoderId = 0;
                for (int j=0; j<size; j++) {
                    i++;
                    tempRating = ((CoderRating)ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating)ratings.get(j)).getCoderId();
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setInt(1, tempCoderId);
                    psIns.setFloat(2, (float)100*((float)(coderCount-rank)/coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j+1);
                    psIns.setString(5, countryCode);
                    psIns.setInt(6, rankType);
                    count += psIns.executeUpdate();
                    printLoadProgress(count, "country coder rating rank");
                }
            }
            log.info("Records loaded for country coder rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'country_coder_rank' table failed for country coder rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }


    /**
     * Loads the state_coder_rank table with information about
     * rating rank within a state.
     */
    private void loadStateRatingRank(int rankType) throws Exception {
        log.debug("loadStateRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {

            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM state_coder_rank");
            query.append(  " WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO state_coder_rank (coder_id, percentile, rank, rank_no_tie, state_code, coder_rank_type_id)");
            query.append( " VALUES (?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " SELECT distinct c.state_code");
            query.append(   " FROM coder c");
            query.append(      " , rating r");
            if (rankType==ACTIVE_RATING_RANK_TYPE_ID)
                query.append(      " , active_members a");
            query.append(  " WHERE c.status = 'A'");
            query.append(    " AND r.rating > 0");
            query.append(    " AND c.coder_id = r.coder_id");
            if (rankType==ACTIVE_RATING_RANK_TYPE_ID)
                query.append(    " AND a.coder_id = c.coder_id") ;
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            // delete all the records from the country ranking table
            psDel.executeUpdate();

            rs = psSel.executeQuery();
            String stateCode = null;
            while (rs.next()) {
                stateCode =rs.getString("state_code");
                ratings = getCurrentCoderStateRatings(stateCode, rankType==ACTIVE_RATING_RANK_TYPE_ID);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                int tempCoderId = 0;
                for (int j=0; j<size; j++) {
                    i++;
                    tempRating = ((CoderRating)ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating)ratings.get(j)).getCoderId();
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setInt(1, tempCoderId);
                    psIns.setFloat(2, (float)100*((float)(coderCount-rank)/coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j+1);
                    psIns.setString(5, stateCode);
                    psIns.setInt(6, rankType);
                    count += psIns.executeUpdate();
                    printLoadProgress(count, "state coder rating rank");
                }
            }
            log.info("Records loaded for state coder rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'state_coder_rank' table failed for state coder rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }


    /**
     * Loads the school_coder_rank table with information about
     * rating rank within a school.
     */
    private void loadSchoolRatingRank(int rankType) throws Exception {
        log.debug("loadSchoolRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;

        try {

            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM school_coder_rank");
            query.append(  " WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO school_coder_rank (coder_id, percentile, rank, rank_no_tie, school_id, coder_rank_type_id)");
            query.append( " VALUES (?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " SELECT distinct s.school_id");
            query.append( " FROM coder c");
            query.append( " , rating r");
            if (rankType==ACTIVE_RATING_RANK_TYPE_ID)
                query.append( " , active_members a");
            query.append( " , current_school cs");
            query.append( " , school s");
            query.append( " WHERE c.status = 'A'");
            query.append( " AND r.rating > 0");
            query.append( " and cs.coder_id = c.coder_id");
            query.append( " and cs.school_id = s.school_id");
            query.append( " AND c.coder_id = r.coder_id");
            if (rankType==ACTIVE_RATING_RANK_TYPE_ID)
                query.append( " AND a.coder_id = c.coder_id");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            // delete all the records from the country ranking table
            psDel.executeUpdate();

            rs = psSel.executeQuery();
            long schoolId= 0;
            while (rs.next()) {
                schoolId =rs.getLong("school_id");
                ratings = getCurrentCoderSchoolRatings(schoolId, rankType==ACTIVE_RATING_RANK_TYPE_ID);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                int tempCoderId = 0;
                for (int j=0; j<size; j++) {
                    i++;
                    tempRating = ((CoderRating)ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating)ratings.get(j)).getCoderId();
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setInt(1, tempCoderId);
                    psIns.setFloat(2, (float)100*((float)(coderCount-rank)/coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j+1);
                    psIns.setLong(5, schoolId);
                    psIns.setInt(6, rankType);
                    count += psIns.executeUpdate();
                    printLoadProgress(count, "school coder rating rank");
                }
            }
            log.info("Records loaded for school coder rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'school_coder_rank' table failed for school coder rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

    }



    /**
     * Loads the school_rank table with information about
     * average rating
     */
/*
    private void loadSchoolAvgRatingRank() throws Exception {
        log.debug("loadSchoolAvgRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int schoolCount = 0;
        List ratings = null;
        try {
            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM school_rank");
            query.append(  " WHERE schook_rank_type_id = " + AVERAGE_RATING_RANK_TYPE_ID);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO school_rank (school_id, percentile, rank, school_rank_type_id)");
            query.append( " VALUES (?, ?, ?, " + AVERAGE_RATING_RANK_TYPE_ID);
            psIns = prepareStatement(query.toString(), TARGET_DB);

            psDel.executeUpdate();

            ratings = getCurrentSchoolAvgRatings();

            int i=0;
            float rating = 0;
            int rank = 0;
            int size = ratings.size();
            float tempRating = 0;
            int tempSchoolId = 0;
            for (int j=0; j<size; j++) {
                i++;
                tempRating = ((SchoolAvgRating)ratings.get(j)).getRating();
                tempSchoolId = ((SchoolAvgRating)ratings.get(j)).getSchoolId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setInt(1, tempSchoolId);
                psIns.setFloat(2, (float)100*((float)(schoolCount-rank)/schoolCount));
                psIns.setInt(3, rank);
                count += psIns.executeUpdate();
                printLoadProgress(count, "school average rating rank");
            }
            log.info("Records loaded for school average rating rank: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of school_rank table failed for average rating rank.\n" +
                sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }
*/


/******* utility methods ********/


    /**
     * Get a sorted list (by avg. rating desc) of all the schools
     * with rated members.
     * @return List containing SchoolAvgRating objects
     * @throws Exception if something goes wrong when querying
     */
/*
    private List getCurrentSchoolAvgRatings() throws Exception {
        log.debug("getCurrentSchoolAvgRatings called...");
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {
            query.append( " SELECT school_id ");
            query.append(        " ,CASE WHEN rated_count=0 THEN 0 ELSE sum_rating/rated_count END AS avg_rating ");
            query.append(   " FROM TABLE(MULTISET(");
            query.append(          " SELECT sc.school_id");
            query.append(                 " ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count");
            query.append(                 " ,SUM(CASE WHEN cr.rating > 0 THEN cr.rating ELSE 0 END) as sum_rating");
            query.append(            " FROM user u");
            query.append(                 " ,coder c");
            query.append(                 " ,current_school cs");
            query.append(                 " ,rating cr");
            query.append(                 " ,state s");
            query.append(                 " ,school sc");
            query.append(                 " ,region_state rs");
            query.append(                 " ,region r");
            query.append(           " WHERE u.user_id = c.coder_id");
            query.append(           " AND cr.coder_id = c.coder_id");
            query.append(           " AND cs.coder_id = c.coder_id");
            query.append(           " AND cs.school_id = sc.school_id");
            query.append(           " AND sc.state_code = s.state_code");
            query.append(           " AND s.state_code = rs.state_code");
            query.append(           " AND rs.region_code = r.region_code");
            query.append(           " AND rs.user_type_id = 1");
            query.append(           " AND u.status = 'A'");
            query.append(           " AND email NOT LIKE '%topcoder.com%'");
            query.append(           " AND u.user_id NOT IN (SELECT user_id");
            query.append(                                   " FROM group_user");
            query.append(                                  " WHERE group_id = 13)");
            query.append(                                  " GROUP BY sc.school_id))");
            query.append(  " WHERE rated_count > 0");
            query.append(  " ORDER BY 2 DESC");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                ret.add(new SchoolAvgRating(rs.getInt("school_id"), rs.getFloat("avg_rating")));
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of school_rank table failed for average rating rank.\n" +
                sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
        }
        return ret;
    }
*/


    /**
     * Get a sorted list (by rating desc) of all the active coders
     * and their ratings.
     * @return List containing CoderRating objects
     * @throws Exception if something goes wrong when querying
     */
    private List getCurrentCoderRatings(boolean activeOnly) throws Exception {
        log.debug("getCurrentCoderRatings called...");
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(100);
            query.append(" SELECT c.coder_id");
            query.append(       " ,r.rating");
            query.append(  " FROM coder c");
            query.append(       " ,rating r");
            if (activeOnly)
                query.append(   " ,  active_members a");
            query.append( " WHERE c.status = 'A'");
            query.append(   " AND r.rating > 0");
            query.append(   " AND c.coder_id = r.coder_id");
            if (activeOnly)
                query.append(" AND a.coder_id = c.coder_id");
            query.append( " ORDER BY r.rating DESC");
            psSel = prepareStatement(query.toString(), SOURCE_DB);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                ret.add(new CoderRating(rs.getInt("coder_id"), rs.getInt("rating")));
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'coder_rank' table failed for overall rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
        }
        return ret;

    }


    /**
     * Get a sorted list (by rating desc) of all the active coders
     * and their ratings from a particular country
     * @return List containing CoderRating objects
     * @throws Exception if something goes wrong when querying
     */
    private List getCurrentCoderCountryRatings(String countryCode, boolean activeOnly) throws Exception {
        log.debug("getCurrentCoderCountryRatings called...");
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(100);
            query.append(" SELECT c.coder_id");
            query.append(       " ,r.rating");
            query.append(  " FROM coder c");
            query.append(       " ,rating r");
            if (activeOnly)
                query.append(       " ,active_members a");
            query.append( " WHERE c.status = 'A'");
            query.append(   " AND r.rating > 0");
            query.append(   " AND c.coder_id = r.coder_id");
            if (activeOnly)
                query.append(   " AND a.coder_id = c.coder_id");
            query.append(   " AND c.country_code = ?");
            query.append( " ORDER BY r.rating DESC");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setString(1, countryCode);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                ret.add(new CoderRating(rs.getInt("coder_id"), rs.getInt("rating")));
            }

        } finally {
            close(rs);
            close(psSel);
        }
        return ret;

    }


    /**
     * Get a sorted list (by rating desc) of all the active coders
     * and their ratings from a particular state
     * @return List containing CoderRating objects
     * @throws Exception if something goes wrong when querying
     */
    private List getCurrentCoderStateRatings(String stateCode, boolean activeOnly) throws Exception {
        log.debug("getCurrentCoderStateRatings called...");
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(100);
            query.append(" SELECT c.coder_id");
            query.append(       " ,r.rating");
            query.append(  " FROM coder c");
            query.append(       " ,rating r");
            if (activeOnly)
                query.append(       " ,active_members a");
            query.append( " WHERE c.status = 'A'");
            query.append(   " AND r.rating > 0");
            query.append(   " AND c.coder_id = r.coder_id");
            if (activeOnly)
                query.append(   " AND a.coder_id = c.coder_id");
            query.append(   " AND c.state_code = ?");
            query.append( " ORDER BY r.rating DESC");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setString(1, stateCode);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                ret.add(new CoderRating(rs.getInt("coder_id"), rs.getInt("rating")));
            }

        } finally {
            close(rs);
            close(psSel);
        }
        return ret;

    }


    private List getCurrentCoderSchoolRatings(long schoolId, boolean activeOnly) throws Exception {
        log.debug("getCurrentCoderSchoolRatings called...");
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(100);
            query.append(" SELECT c.coder_id");
            query.append(       " ,r.rating");
            query.append( " FROM coder c");
            query.append( " , rating r");
            if (activeOnly)
                query.append( " , active_members a");
            query.append( " , current_school cs");
            query.append( " , school s");
            query.append( " WHERE c.status = 'A'");
            query.append( " AND r.rating > 0");
            query.append( " and cs.coder_id = c.coder_id");
            query.append( " and cs.school_id = s.school_id");
            query.append( " AND c.coder_id = r.coder_id");
            query.append( " AND cs.school_id = ?");
            if (activeOnly)
                query.append( " AND a.coder_id = c.coder_id");
            query.append( " ORDER BY r.rating DESC");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            psSel.setLong(1, schoolId);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                ret.add(new CoderRating(rs.getInt("coder_id"), rs.getInt("rating")));
            }

        } finally {
            close(rs);
            close(psSel);
        }
        return ret;

    }



    /**
     * Gets the of ratings for all the active coders that have
     * taken part in a match prior to and including the given round.
     * @return List containing CoderRating objects in descending rating order
     * @throws Exception if something goes wrong when querying
     */
    private List getCoderRatingsForRound() throws Exception {
        log.debug("getCoderRatingsForRound called...");
        PreparedStatement ps = null;
        StringBuffer query = null;
        ResultSet rs = null;
        List ret = null;
        List rounds = null;
        long startTime = System.currentTimeMillis();

        try {
            query = new StringBuffer(100);
            query.append( " SELECT round_id");
            query.append(        " ,calendar_id");
            query.append(   " FROM round");
            query.append(  " WHERE calendar_id <= (SELECT calendar_id");
            query.append(                          " FROM round");
            query.append(                         " WHERE round_id = ?)");
            query.append(    " AND round_type_id in (?,?)");
            query.append(  " ORDER BY calendar_id");
            ps = prepareStatement(query.toString(), SOURCE_DB);
            ps.setInt(1, roundId);
            ps.setInt(2, SRM_ROUND_TYPE);
            ps.setInt(3, TOURNAMENT_ROUND_TYPE);
            rs = ps.executeQuery();
            rounds = new ArrayList();
            while (rs.next()) {
                rounds.add(new Integer(rs.getInt("round_id")));
            }

            close(rs);

            query = new StringBuffer(100);
            query.append( " SELECT rr.coder_id");
            query.append(       "  ,rr.new_rating");
            query.append(   " FROM room_result rr");
            query.append(        " ,coder c");
            query.append(  " WHERE rr.round_id = ?");
            query.append(    " AND rr.attended = 'Y'");
            query.append(    " AND rr.coder_id = c.coder_id");
            query.append(    " AND c.status = 'A'");
            ps = prepareStatement(query.toString(), SOURCE_DB);

            HashMap tempHash = new HashMap();
            for (int i=0; i<rounds.size(); i++) {
                ps.setInt(1, ((Integer)rounds.get(i)).intValue());
                rs = ps.executeQuery();
                while (rs.next()) {
                    tempHash.put(new Integer(rs.getInt("coder_id")), new Integer(rs.getInt("new_rating")));
                }
                close(rs);
            }
            ret = new ArrayList(tempHash.size());
            Iterator it = tempHash.entrySet().iterator();
            Map.Entry entry = null;
            while (it.hasNext()) {
                entry = (Map.Entry)it.next();
                int coderId = ((Integer)entry.getKey()).intValue();
                int rating = ((Integer)entry.getValue()).intValue();
                ret.add(new CoderRating(coderId, rating));
            }

            Collections.sort(ret);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Getting most recent round failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(ps);
        }
        long endTime = System.currentTimeMillis();
        log.info("TIME IN METHOD: " + (endTime-startTime) + " milliseconds");
        return ret;
    }


    /**
     * Gets the number of active coders that have a rating.
     * @return the number of active rated coders.
     * @throws Exception
     */
/*
    private int getActiveRatedCoderCount() throws Exception {
        log.debug("getActiveRatedCoderCount called...");
        PreparedStatement ps = null;
        StringBuffer query = null;
        ResultSet rs = null;
        int ret = 0;

        try {
            query = new StringBuffer();
            query.append(" SELECT count(*) AS count");
            query.append(  " FROM coder c");
            query.append(       " ,rating r");
            query.append( " WHERE c.status = 'A'");
            query.append(   " AND r.rating > 0");
            query.append(   " AND c.coder_id = r.coder_id");
            ps = prepareStatement(query.toString(), SOURCE_DB);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getInt("count");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Getting most recent round failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }
*/
    /**
     * Gets the most recent round in the source
     * db.  If there are no rounds in the source
     * db, then it returns -1.
     * @return the most recent round's id, or -1
     * if there are not rounds.
     * @throws Exception if there were a problem
     * executing a query
     */
    private int getMostRecentRound() throws Exception {
        log.debug("getMostRecentRound called...");
        PreparedStatement ps = null;
        StringBuffer query = null;
        ResultSet rs = null;
        int ret = -1;

        try {
            query = new StringBuffer();
            query.append(" SELECT round_id");
            query.append(  " FROM round");
            query.append( " WHERE calendar_id = (SELECT MAX(calendar_id)");
            query.append(                        " FROM round)");
            ps = prepareStatement(query.toString(), SOURCE_DB);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getInt("round_id");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Getting most recent round failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }

    private class CoderRating implements Comparable {
        private int _coderId = 0;
        private int _rating = 0;
        CoderRating(int coderId, int rating) {
            _coderId = coderId;
            _rating = rating;
        }
        public int compareTo(Object other) {
            if (((CoderRating)other).getRating()>_rating) return 1;
            else if (((CoderRating)other).getRating()<_rating) return -1;
            else return 0;
        }
        int getCoderId() {return _coderId;}
        int getRating() {return _rating;}
        void setCoderId(int coderId) {_coderId = coderId;}
        void setRating(int rating) {_rating = rating;}

        public String toString() { return new String(_coderId+":"+_rating); }
    }


/*
    private class SchoolAvgRating {
        private int _schoolId = 0;
        private float _rating = 0;
        SchoolAvgRating(int schoolId, float rating) {
            _schoolId = schoolId;
            _rating = rating;
        }
        int getSchoolId() {return _schoolId;}
        float getRating() {return _rating;}
        void setSchoolId(int schoolId) {_schoolId = schoolId;}
        void setRating(float rating) {_rating = rating;}
        public String toString() { return new String(_schoolId+":"+_rating); }
    }
*/


}

