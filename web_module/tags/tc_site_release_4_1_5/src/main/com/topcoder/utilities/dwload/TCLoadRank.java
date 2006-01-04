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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class TCLoadRank extends TCLoad {
    private int roundId = 0;
    private boolean FULL_LOAD = false;

    private static Logger log = Logger.getLogger(TCLoadRank.class);
    private static final int OVERALL_RATING_RANK_TYPE_ID = 1;
    private static final int ACTIVE_RATING_RANK_TYPE_ID = 2;
/*
    private static final int SRM_ROUND_TYPE = 1;
    private static final int TOURNAMENT_ROUND_TYPE = 2;
    private static final int AVERAGE_RATING_RANK_TYPE_ID = 1;
*/

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
    public void performLoad() throws Exception {
        log.debug("performLoad called...");
        try {

            long start = System.currentTimeMillis();
            List l = getCurrentRatings();
            log.info("got " + l.size() + " records in " + (System.currentTimeMillis()-start) + " milliseconds");
            loadRatingRank(OVERALL_RATING_RANK_TYPE_ID, l);

            loadOverallRatingRankHistory(l);

            loadRatingRank(ACTIVE_RATING_RANK_TYPE_ID, l);


            loadCountryRatingRank(OVERALL_RATING_RANK_TYPE_ID, l);
            loadStateRatingRank(OVERALL_RATING_RANK_TYPE_ID, l);
            loadSchoolRatingRank(OVERALL_RATING_RANK_TYPE_ID, l);

            loadCountryRatingRank(ACTIVE_RATING_RANK_TYPE_ID, l);
            loadStateRatingRank(ACTIVE_RATING_RANK_TYPE_ID, l);
            loadSchoolRatingRank(ACTIVE_RATING_RANK_TYPE_ID, l);
//            loadAgeGroupAvgRatingRank();


            log.info("SUCCESS: Rank load ran successfully for round " + roundId + ".");
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            throw ex;
        }
    }


    /**
     * Loads the coder_rank table with information about
     * overall rating rank.
     */
    private void loadRatingRank(int rankType, List list) throws Exception {
        log.debug("loadRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        int count = 0;
        int coderCount = 0;

        try {

            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM coder_rank");
            query.append(" WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO coder_rank (coder_id, percentile, rank, coder_rank_type_id)");
            query.append(" VALUES (?, ?, ?, " + rankType + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            /* coder_rank table should be kept "up-to-date" so get the most recent stuff
             * from the rating table
             */
            //ratings = getCurrentCoderRatings(rankType == ACTIVE_RATING_RANK_TYPE_ID);

            ArrayList ratings = new ArrayList(list.size());
            CoderRating cr = null;
            for (int i = 0; i < list.size(); i++) {
                cr = (CoderRating) list.get(i);
                    if ((rankType == ACTIVE_RATING_RANK_TYPE_ID && cr.isActive()) ||
                            rankType != ACTIVE_RATING_RANK_TYPE_ID) {
                        ratings.add(cr);
                    }
            }
            Collections.sort(ratings);
            coderCount = ratings.size();

            // delete all the records for the overall rating rank type
            psDel.executeUpdate();

            int i = 0;
            int rating = 0;
            int rank = 0;
            int size = ratings.size();
            int tempRating = 0;
            long tempCoderId = 0;
            for (int j = 0; j < size; j++) {
                i++;
                tempRating = ((CoderRating) ratings.get(j)).getRating();
                tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setLong(1, tempCoderId);
                psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
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
    private void loadOverallRatingRankHistory(List list) throws Exception {
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
            query.append(" DELETE");
            query.append(" FROM coder_rank_history");
            query.append(" WHERE coder_rank_type_id = " + OVERALL_RATING_RANK_TYPE_ID);
            query.append(" AND round_id = " + roundId);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO coder_rank_history (coder_id, round_id, percentile, rank, coder_rank_type_id)");
            query.append(" VALUES (?, ?, ?, ?, " + OVERALL_RATING_RANK_TYPE_ID + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);


            /* if it's the most recent round that we're loading
             * we can pull from the rating table, if not,
             * then we have to go and build up the ratings of
             * all the people who have competed up until the time
             * of the given round
             */
            if (roundId == getMostRecentRound()) {
                ratings = list;
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
            long tempCoderId = 0;
            for (int j = 0; j < size; j++) {
                i++;
                tempRating = ((CoderRating) ratings.get(j)).getRating();
                tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                if (tempRating != rating) {
                    rating = tempRating;
                    rank = i;
                }
                psIns.setLong(1, tempCoderId);
                psIns.setInt(2, roundId);
                psIns.setFloat(3, (float) 100 * ((float) (coderCount - rank) / coderCount));
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
    private void loadCountryRatingRank(int rankType, List list) throws Exception {
        log.debug("loadCountryRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        //PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        //ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;
        CoderRating curr = null;

        try {

            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM country_coder_rank");
            query.append(" WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO country_coder_rank (coder_id, percentile, rank, rank_no_tie, country_code, coder_rank_type_id)");
            query.append(" VALUES (?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);

            // delete all the records from the country ranking table
            psDel.executeUpdate();


            HashMap countries = new HashMap();
            String tempCode = null;
            List tempList = null;
            CoderRating temp = null;

            for (int i = 0; i < list.size(); i++) {
                temp = (CoderRating) list.get(i);
                    if ((rankType == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                            rankType != ACTIVE_RATING_RANK_TYPE_ID) {
                        tempCode = temp.getCountryCode();
                        if (countries.containsKey(tempCode)) {
                            tempList = (List) countries.get(tempCode);
                        } else {
                            tempList = new ArrayList(100);
                        }
                        tempList.add(list.get(i));
                        countries.put(tempCode, tempList);
                        tempList = null;
                    }
            }



            for (Iterator it = countries.entrySet().iterator(); it.hasNext();) {
                ratings = (List) ((Map.Entry) it.next()).getValue();
                Collections.sort(ratings);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                long tempCoderId = 0;
                for (int j = 0; j < size; j++) {
                    i++;
                    tempRating = ((CoderRating) ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                    curr = (CoderRating) ratings.get(j);
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setLong(1, tempCoderId);
                    psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j + 1);
                    psIns.setString(5, curr.getCountryCode());
                    psIns.setInt(6, rankType);
                    count += psIns.executeUpdate();
                    printLoadProgress(count, "country coder rating rank");
                }
            }
            log.info("Records loaded for country coder rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'country_coder_rank' table failed for " + curr.toString() + ".\n" +
                    sqle.getMessage());
        } finally {
            close(psIns);
            close(psDel);
        }

    }


    /**
     * Loads the state_coder_rank table with information about
     * rating rank within a state.
     */
    private void loadStateRatingRank(int rankType, List list) throws Exception {
        log.debug("loadStateRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        //PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        //ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;
        CoderRating curr = null;

        try {

            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM state_coder_rank");
            query.append(" WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO state_coder_rank (coder_id, percentile, rank, rank_no_tie, state_code, coder_rank_type_id)");
            query.append(" VALUES (?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);


            // delete all the records from the country ranking table
            psDel.executeUpdate();



            HashMap states = new HashMap();
            String tempCode = null;
            List tempList = null;
            CoderRating temp = null;

            for (int i = 0; i < list.size(); i++) {
                temp = (CoderRating) list.get(i);
                    if ((rankType == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                            rankType != ACTIVE_RATING_RANK_TYPE_ID) {
                        tempCode = temp.getStateCode();
                        if (tempCode!=null && !tempCode.trim().equals("")) {
                            if (states.containsKey(tempCode)) {
                                tempList = (List) states.get(tempCode);
                            } else {
                                tempList = new ArrayList(100);
                            }
                            tempList.add(list.get(i));
                            states.put(tempCode, tempList);
                            tempList = null;
                        }
                    }
            }



            for (Iterator it = states.entrySet().iterator(); it.hasNext();) {
                ratings = (List) ((Map.Entry) it.next()).getValue();
                Collections.sort(ratings);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                long tempCoderId = 0;
                for (int j = 0; j < size; j++) {
                    i++;
                    tempRating = ((CoderRating) ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                    curr = ((CoderRating) ratings.get(j));
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setLong(1, tempCoderId);
                    psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j + 1);
                    psIns.setString(5, curr.getStateCode());
                    psIns.setInt(6, rankType);
                    count += psIns.executeUpdate();
                    printLoadProgress(count, "state coder rating rank");
                }
            }
            log.info("Records loaded for state coder rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'state_coder_rank' table failed for state coder rating rank for " + curr.toString() + ".\n" +
                    sqle.getMessage());
        } finally {
/*
            close(rs);
            close(psSel);
*/
            close(psIns);
            close(psDel);
        }

    }


    /**
     * Loads the school_coder_rank table with information about
     * rating rank within a school.
     */
    private void loadSchoolRatingRank(int rankType, List list) throws Exception {
        log.debug("loadSchoolRatingRank called...");
        StringBuffer query = null;
        PreparedStatement psDel = null;
        //PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        //ResultSet rs = null;
        int count = 0;
        int coderCount = 0;
        List ratings = null;
        CoderRating curr = null;

        try {

            query = new StringBuffer(100);
            query.append(" DELETE");
            query.append(" FROM school_coder_rank");
            query.append(" WHERE coder_rank_type_id = " + rankType);
            psDel = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append(" INSERT");
            query.append(" INTO school_coder_rank (coder_id, percentile, rank, rank_no_tie, school_id, coder_rank_type_id)");
            query.append(" VALUES (?, ?, ?, ?, ?, ?)");
            psIns = prepareStatement(query.toString(), TARGET_DB);


            // delete all the records from the country ranking table
            psDel.executeUpdate();



            HashMap schools = new HashMap();
            Long tempId = null;
            List tempList = null;
            CoderRating temp = null;

            for (int i = 0; i < list.size(); i++) {
                temp = (CoderRating) list.get(i);
                    if ((rankType == ACTIVE_RATING_RANK_TYPE_ID && temp.isActive()) ||
                        rankType != ACTIVE_RATING_RANK_TYPE_ID) {
                        if (temp.getSchoolId()>0) {
                            tempId = new Long(temp.getSchoolId());
                            if (schools.containsKey(tempId)) {
                                tempList = (List) schools.get(tempId);
                            } else {
                                tempList = new ArrayList(10);
                            }
                            tempList.add(list.get(i));
                            schools.put(tempId, tempList);
                            tempList = null;
                        }
                    }
            }

            for (Iterator it = schools.entrySet().iterator(); it.hasNext();) {
                ratings = (List) ((Map.Entry) it.next()).getValue();
                Collections.sort(ratings);
                coderCount = ratings.size();

                int i = 0;
                int rating = 0;
                int rank = 0;
                int size = ratings.size();
                int tempRating = 0;
                long tempCoderId = 0;
                for (int j = 0; j < size; j++) {
                    i++;
                    tempRating = ((CoderRating) ratings.get(j)).getRating();
                    tempCoderId = ((CoderRating) ratings.get(j)).getCoderId();
                    curr = (CoderRating) ratings.get(j);
                    if (tempRating != rating) {
                        rating = tempRating;
                        rank = i;
                    }
                    psIns.setLong(1, tempCoderId);
                    psIns.setFloat(2, (float) 100 * ((float) (coderCount - rank) / coderCount));
                    psIns.setInt(3, rank);
                    psIns.setInt(4, j + 1);
                    psIns.setLong(5, curr.getSchoolId());
                    psIns.setInt(6, rankType);
                    count += psIns.executeUpdate();
                    printLoadProgress(count, "school coder rating rank");
                }
            }
            log.info("Records loaded for school coder rating rank load: " + count);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'school_coder_rank' table failed for " + curr.toString() + ".\n" +
                    sqle.getMessage());
        } finally {
/*
            close(rs);
            close(psSel);
*/
            close(psIns);
            close(psDel);
        }

    }



    private List getCurrentRatings() throws Exception {
        StringBuffer query = null;
        PreparedStatement psSel = null;
        ResultSet rs = null;
        List ret = null;

        try {

            query = new StringBuffer(200);
            query.append(" select r.coder_id");
            query.append(" , r.rating");
            query.append(" , cs.school_id");
            query.append(" , c.coder_type_id");
            query.append(" , c.comp_country_code as country_code");
            query.append(" , c.state_code");
            query.append(" , case when exists (select '1' from active_members a where a.coder_id = c.coder_id) then 1 else 0 end as active");
            query.append(" from rating r");
            query.append(" , outer current_school cs");
            query.append(" , coder c");
            query.append(" where r.coder_id = cs.coder_id");
            query.append(" and r.coder_id = c.coder_id");
            query.append(" and c.status = 'A'");
            query.append(" and r.num_ratings > 0");

            psSel = prepareStatement(query.toString(), TARGET_DB);

            rs = psSel.executeQuery();
            ret = new ArrayList();
            while (rs.next()) {
                //pros
                if (rs.getInt("coder_type_id") == 2) {
                    ret.add(new CoderRating(rs.getLong("coder_id"), rs.getInt("rating"),
                        0, rs.getInt("active")==1, rs.getString("country_code"), rs.getString("state_code")));
                } else {
                    ret.add(new CoderRating(rs.getLong("coder_id"), rs.getInt("rating"),
                        rs.getInt("school_id"), rs.getInt("active")==1, rs.getString("country_code"), rs.getString("state_code")));
                }
            }


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Get list of current ratings failed.\n" +
                    sqle.getMessage());
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

        try {
            query = new StringBuffer(100);
            query.append(" select rh.rating, rh.coder_id");
            query.append(" from rating_history rh");
            query.append(" where rh.round_id = ?");
            query.append(" order by rh.rating desc");
            ps = prepareStatement(query.toString(), SOURCE_DB);
            ps.setInt(1, roundId);
            rs = ps.executeQuery();
            ret = new ArrayList(15000);
            while (rs.next()) {
                ret.add(new CoderRating(rs.getLong("coder_id"), rs.getInt("rating"), 0, false, null, null));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Getting ratings for round failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }


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
            query.append(" FROM round");
            query.append(" WHERE calendar_id = (SELECT MAX(calendar_id)");
            query.append(" FROM round)");
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
        private long coderId = 0;
        private int rating = 0;
        private long schoolId = 0;
        private boolean active = false;
        private String countryCode = null;
        private String stateCode = null;

        CoderRating(long coderId, int rating, long schoolId, boolean active, String countryCode, String stateCode) {
            this.coderId = coderId;
            this.rating = rating;
            this.schoolId = schoolId;
            this.active = active;
            this.countryCode = countryCode;
            this.stateCode = stateCode;
        }

        public int compareTo(Object other) {
            if (((CoderRating) other).getRating() > rating)
                return 1;
            else if (((CoderRating) other).getRating() < rating)
                return -1;
            else
                return 0;
        }

        long getCoderId() {
            return coderId;
        }

        int getRating() {
            return rating;
        }

        void setCoderId(long coderId) {
            this.coderId = coderId;
        }

        void setRating(int rating) {
            this.rating = rating;
        }

        long getSchoolId() {
            return schoolId;
        }

        void setSchoolId(long schoolId) {
            this.schoolId = schoolId;
        }

        boolean isActive() {
            return active;
        }

        void setActive(boolean active) {
            this.active = active;
        }

        String getStateCode() {
            return stateCode;
        }

         void setStateCode(String stateCode) {
            this.stateCode = stateCode;
        }

        String getCountryCode() {
            return countryCode;
        }

        void setCountryCode(String countryCode) {
            this.countryCode = countryCode;
        }

        public String toString() {
            return new String(coderId + ":" + rating + ":" + schoolId + ":" + active + ":" + stateCode);
        }
    }


}

