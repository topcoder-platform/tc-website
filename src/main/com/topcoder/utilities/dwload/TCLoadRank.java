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
 * <li>overall by rating</li>
 * </ul>
 *
 * @author Greg Paul
 * @author Christopher Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * @version $Revision$
 */

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.Hashtable;

public class TCLoadRank extends TCLoad {
    private int roundId = 0;

    private static Logger log = Logger.getLogger(TCLoadAggregate.class);
    private static final int OVERALL_RATING_RANK_TYPE_ID = 1;

    /**
     * Constructor. Set our usage message here.
     */
    public TCLoadRank() {
        USAGE_MESSAGE = new String(
                "TCLoadRank parameters - defaults in ():\n" +
                "  -roundid number       : Round ID to load\n");
    }


    /**
     * This method is passed any parameters passed to this load
     */
    public boolean setParameters(Hashtable params) {
        try {

            roundId = retrieveIntParam("roundid", params, false, true).intValue();

            //TODO get the rank type constants from xml

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
        try {
            
            loadOverallRatingRank();

            log.info("SUCCESS: Rank load ran successfully.");
            return true;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            return false;
        }
    }


    /**
     * Loads the rank table with information about
     * overall rating rank.  The only people excluded are
     * those that are inactive.  We use the rating table
     * so the data in the rank table with be up to date
     * with what ever is in the rating table.
     */
    private void loadOverallRatingRank() throws Exception {
        StringBuffer query = null;
        PreparedStatement psDel = null; 
        PreparedStatement psSel = null; 
        PreparedStatement psIns = null; 
        ResultSet rs = null;
        int count = 0; 

        try {
   
            query = new StringBuffer(100);
            query.append(" SELECT c.coder_id");
            query.append(       " ,r.rating");
            query.append(  " FROM coder c");
            query.append(       " ,rating r");
            query.append( " WHERE c.status = 'A'");
            query.append(   " AND r.rating > 0");
            query.append( " ORDER BY r.rating DESC");
            psSel = prepareStatement(query.toString(), SOURCE_DB);
            
            query = new StringBuffer(100);
            query.append( " DELETE");
            query.append(   " FROM rank");
            query.append(  " WHERE rank_type_id = " + OVERALL_RATING_RANK_TYPE_ID);
            query.append(    " AND coder_id = ?");
            psDel = prepareStatement(query.toString(), TARGET_DB);
 
            query = new StringBuffer(100);
            query.append( " INSERT");
            query.append(   " INTO rank (coder_id, percentile, rank, rank_type_id)");
            query.append( " VALUES (?, ?, ?, " + OVERALL_RATING_RANK_TYPE_ID + ")");
            psIns = prepareStatement(query.toString(), TARGET_DB);
         
            rs = psSel.executeQuery();
            int i = 0;
            int rating = 0;
            int rank = 0;
            int coderCount = getActiveRatedCoderCount();
            while (rs.next()) {
                i++;
                psDel.setInt(1, rs.getInt("coder_id"));
                psDel.executeUpdate();
                if (rs.getInt("rating") != rating) {
                    rating = rs.getInt("rating");
                    rank = i;
                }
                psIns.setInt(1, rs.getInt("coder_id"));
                psIns.setFloat(2, (float)(coderCount-rank)/coderCount);
                psIns.setInt(3, rank);
                count += psIns.executeUpdate();
                printLoadProgress(count, "overall rating rank");
            }
            log.info("Records loaded for overall rating rank load: " + count);
                    
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'rank' table failed for overall rating rank.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }

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


    /**
     * Gets the number of active coders that have a rating.
     * @return the number of active rated coders.
     * @throws Exception 
     */
    private int getActiveRatedCoderCount() throws Exception { 

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
    
}

