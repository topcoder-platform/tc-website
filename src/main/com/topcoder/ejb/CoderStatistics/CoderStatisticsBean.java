package com.topcoder.ejb.CoderStatistics;

import javax.naming.*;
import javax.ejb.*;
import java.io.Serializable;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.rmi.RemoteException;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.data.stat.*;
import com.topcoder.common.web.data.stat.coder.*;
import com.topcoder.common.web.data.stat.problem.*;
import com.topcoder.common.web.data.stat.contest.*;

/*************************************************************************************************
 *
 * Creation Date: 11-13-00
 * Author: Steve Post
 *
 * The StatisticalBean is a Stateless Session Bean that will be used for the following purposes:
 * 1. Selecting statistical data from the database.
 *
 *************************************************************************************************
 */

public class CoderStatisticsBean extends BaseEJB{
  private static Logger log = Logger.getLogger(CoderStatisticsBean.class);

  public ArrayList getLastCoderComps(int coderId, int num) throws RemoteException {
    log.debug("ejb:coderStatistics:getLast3CoderComps called...");
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection conn = null;
    StringBuffer query = null;
    ArrayList result = null;

    try {
      query = new StringBuffer();
      query.append( " SELECT ro.contest_id");
      query.append( " ,rr.round_id");
      query.append( " ,rr.room_id");
      query.append( " ,rr.coder_id");
      query.append( " ,c.handle");
      query.append( " ,rr.submission_points");
      query.append( " ,rr.challenge_points+rr.defense_points");
      query.append( " ,rr.system_test_points");
      query.append( " ,rr.final_points");
      query.append( " ,rr.advanced");
      query.append( " ,rr.old_rating");
      query.append( " ,(rr.new_rating - rr.old_rating) AS rating_change");
      query.append( " ,rr.new_rating");
      query.append( " ,cal.calendar_id");
      query.append( " FROM contest con, round ro, room r, coder c, room_result rr, calendar cal");
      query.append( " WHERE c.coder_id = ?");
      query.append( " AND c.coder_id = rr.coder_id");
      query.append( " AND con.contest_id = ro.contest_id");
      query.append( " AND ro.calendar_id = cal.calendar_id");
      query.append( " AND r.round_id = ro.round_id");
      query.append( " AND rr.round_id = ro.round_id");
      query.append( " AND rr.room_id = r.room_id");
      query.append( " ORDER BY cal.calendar_id DESC");

      log.debug("\nquery: **********\n " + query.toString());
      conn = DBMS.getDWConnection();
      ps = conn.prepareStatement(query.toString());
      result = new ArrayList();
      ps.setInt(1, coderId); 
      rs = ps.executeQuery();
      for (int i=0; i<num; i++) { 
        if (rs.next()) {
          RoomResult statRoomResult = new RoomResult();
          statRoomResult.setContestId(       rs.getInt      (1) );
          statRoomResult.setRoundId(         rs.getInt      (2) );
          statRoomResult.setRoomId(          rs.getInt      (3) );
          statRoomResult.setCoderId(         rs.getInt      (4) );
          statRoomResult.setHandle(          rs.getString   (5) );
          statRoomResult.setCodingPoints(    rs.getFloat    (6) );
          statRoomResult.setChallengePoints( rs.getFloat    (7) );
          statRoomResult.setTestPoints(      rs.getFloat    (8) );
          statRoomResult.setFinalPoints(     rs.getFloat    (9) );
          statRoomResult.setAdvanced(        rs.getString  (10) );
          statRoomResult.setPreRoundRating(  rs.getInt     (11) );
          statRoomResult.setRatingDifference(rs.getInt     (12) );
          statRoomResult.setPostRoundRating( rs.getInt     (13) );
          result.add(statRoomResult);
        }
      } 
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException ("ejb:CoderStatistics:getLast3CoderComps(" + coderId + ")\n" + sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException ("ejb:CoderStatistics:getLast3CoderComps:(" + coderId + ")\n" + e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.error("rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.error("ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {log.error("conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result;
  }



  /**
  *********************************************************************************************
  * getTopRankedCoders()
  * Gets an ArrayList of Rank containing a group of ranked coders.
  * @author Greg Paul
  * @param first - the highest ranked coder we want
  * @param last - the lowest ranked coder we want
  * @return ArrayList - the top ranked coders. 
  * @throws RemoteException
  *********************************************************************************************
  */
  public ArrayList getTopRankedCoders(int first, int last) throws RemoteException {
    log.debug("ejb:coderStatistics:getTopRankedCoders called...");
    PreparedStatement ps = null; 
    ArrayList result = new ArrayList(last-first+1);
    Rank coderRank = null; 
    Rank prevRank = null; 
    ResultSet rs = null; 
    Connection conn = null; 
    StringBuffer query = null;   

    try {   
      query = new StringBuffer(300);
      query.append(" SELECT c.handle, r.rating, c.coder_id");
      query.append(  " FROM rating r,");
      query.append(       " coder c");
      query.append( " WHERE r.coder_id = c.coder_id");
      query.append(   " AND r.num_ratings > 0");
      query.append(   " AND c.status = 'A'");
      query.append( " ORDER by r.rating DESC");
      conn = DBMS.getDWConnection();
      log.debug("\nquery: **********\n " + query.toString());
      ps = conn.prepareStatement(query.toString());
      rs = ps.executeQuery();
      int i=0;
      prevRank = new Rank();
      while (rs.next()) {
        i++;
        if (i>=first) {
          if (i<=last) {
            coderRank = new Rank();
            coderRank.setHandle(rs.getString(1));
            coderRank.setRating(rs.getInt(2));
            coderRank.setCoderId(rs.getInt(3));
            result.add(coderRank);
            if (prevRank.getRating() == coderRank.getRating())
              coderRank.setRank(prevRank.getRank());
            else coderRank.setRank(i);
            prevRank = coderRank;
          }
          else break;
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException (sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException (e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.error("rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.error("ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {log.error("conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result; 
  }    


  public Coder getCoderEarnings(int coderId) throws RemoteException {
    log.debug("ejb:coderStatistics:getCoderEarnings called...");
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection conn = null;
    StringBuffer query = null;
    Coder result = null;
    
    try {
      query = new StringBuffer();
      query.append(  " SELECT SUM(rr.paid) as total_paid");
      query.append(         " ,count(*)");
      query.append(         " ,c.coder_id");
      query.append(    " FROM coder c");
      query.append(         " ,rating r");
      query.append(         " ,room_result rr");
      query.append(   " WHERE c.coder_id = ?");
      query.append(     " AND r.coder_id = c.coder_id");
      query.append(     " AND c.coder_id = rr.coder_id");
      query.append(     " AND rr.attended='Y'");
      query.append(   " GROUP BY c.coder_id");
      log.debug("\nquery: ********\n " + query.toString());

      conn = DBMS.getDWConnection();
      ps = conn.prepareStatement(query.toString());
      ps.setInt(1, coderId);
      rs = ps.executeQuery();
      if (rs.next()) {
        result = new Coder();
        result.setTotalEarnings(rs.getFloat(1));
        result.setNumCompetitions(rs.getInt(2));
        result.setCoderId(rs.getInt(3));
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException ("ejb:CoderStatistics:getCoderEarnings(" + coderId + ")\n" + sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException ("ejb:CoderStatistics:getCoderEarnings:(" + coderId + ")\n" + e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.error("rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.error("ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {log.error("conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result;
  }


  /**
  *********************************************************************************************
  * getEarningsHistory()
  * Gets an ArrayList of Earning objects containing the earnings history of the
  * given coder.
  * @author Greg Paul
  * @param coderId - the id of the coder whose history we're retrieving
  * @return ArrayList - the top ranked coders. 
  * @throws RemoteException
  *********************************************************************************************
  */
  public ArrayList getEarningsHistory(int coderId) throws RemoteException {
    log.debug("ejb:coderStatistics:getEarningsHistory called...");
    PreparedStatement ps = null; 
    ArrayList result = null;
    Earning coderEarning = null; 
    ResultSet rs = null; 
    Connection conn = null; 
    StringBuffer query = null;   

    try {   
      query = new StringBuffer(300);
      query.append(   " SELECT c.name");
      query.append(          " ,c.contest_id");
      query.append(          " ,r.name");
      query.append(          " ,r.round_id");
      query.append(          " ,rr.room_placed");
      query.append(          " ,rr.paid");
      query.append(          " ,cal.date");
      query.append(     " FROM room_result rr");
      query.append(          " ,contest c");
      query.append(          " ,round r");
      query.append(          " ,coder co");
      query.append(          " ,calendar cal");
      query.append(    " WHERE rr.coder_id = ?");
      query.append(      " AND rr.coder_id = co.coder_id");
      query.append(      " AND rr.round_id = r.round_id");
      query.append(      " AND r.calendar_id = cal.calendar_id");
      query.append(      " AND r.contest_id = c.contest_id");
      query.append(    " ORDER BY cal.date");
      conn = DBMS.getDWConnection();
      result = new ArrayList();
      log.debug("\nquery: **********\n " + query.toString());
      ps = conn.prepareStatement(query.toString());
      ps.setInt(1, coderId);
      rs = ps.executeQuery();
      while (rs.next()) {
        coderEarning = new Earning();
        coderEarning.setContestName(rs.getString(1));
        coderEarning.setContestId(rs.getInt(2));
        coderEarning.setRoundName(rs.getString(3));
        coderEarning.setRoundId(rs.getInt(4));
        coderEarning.setFinishPosition(rs.getInt(5));
        coderEarning.setAmount(rs.getFloat(6));
        coderEarning.setEventDate(rs.getDate(7)); 
        result.add(coderEarning);
      }
    } catch (SQLException sqe) {
      log.debug("coder_id: " + coderId);
      DBMS.printSqlException(true, sqe);
      throw new RemoteException (sqe.getMessage());
    } catch (Exception e) {
      log.debug("coder_id: " + coderId);
      e.printStackTrace();
      throw new RemoteException (e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.error("rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.error("ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {log.error("conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result; 
  }    


  /**
  *********************************************************************************************
  * getAdvanced ( int coderId, int roundId )
  * Returns true of the coder advanced for the specified round.
  * @author Steve Burrows
  * @param coderId - the coder's unique id.
  * @param roundId - the contest round's unique id.
  * @return boolean true if the coder advanced for that rounnd.
  * @throws RemoteException
  *********************************************************************************************
  */
  ///////////////////////////////////////////////////////////////////////
  public boolean getAdvanced ( int coderId, int roundId ) throws RemoteException {
  ///////////////////////////////////////////////////////////////////////
    log.debug("ejb:CoderStatistics:getAdvanced called..." );
    boolean result       = false;
    PreparedStatement ps = null;
    ResultSet rs         = null;
    Connection conn      = null;
    StringBuffer query   = null;
    try {
      query = new StringBuffer ( 200 );
      /*************************************************************************************/
      query.append (  " SELECT"); 
      query.append (         " advanced");
      query.append (    " FROM");
      query.append (         " room_result");
      query.append (   " WHERE");
      query.append (         " coder_id = ?");
      query.append (         " AND round_id = ?");
      /*************************************************************************************/
      conn = DBMS.getDWConnection();
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt ( 1, coderId );
      ps.setInt ( 2, roundId );
      rs = ps.executeQuery();
      if ( rs.next() ) {
        if ( rs.getString(1).equals("Y") ) result = true;
      }
    } catch ( SQLException sqe ) {
      log.debug ( "Coder id: " + coderId );
      log.debug ( "Round id: " + roundId );
      DBMS.printSqlException ( true, sqe );
      throw new RemoteException ( sqe.getMessage() );
    } catch ( Exception e ) {
      log.debug ("Coder id: " + coderId );
      e.printStackTrace();
      throw new RemoteException ( e.getMessage() );
    } finally {
      if (rs   != null) { try { rs.close();   } catch (Exception ignore) {} }
      if (ps   != null) { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


 /**
  *********************************************************************************************
  * getCoderStatistics()
  * Gets an  Coder object containing all of a coder's statistical info.
  * @author Greg Paul
  * @param coderId - the coder's id 
  * @return Coder - the coder's information 
  * @throws RemoteException
  *********************************************************************************************
  */
  public Coder getCoderStatistics(int coderId) throws RemoteException {
    log.debug("ejb:coderStatistics:getCoderStatistics called...");
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection conn = null;
    StringBuffer query = null;
    Coder result = null;
    
    try {
      query = new StringBuffer();
      query.append( " SELECT c.handle");
      query.append(        " ,c.quote");
      query.append(        " ,c.member_since");
      query.append(        " ,r.rating");
      query.append(        " ,MAX(rr.new_rating) as max_rating");
      query.append(        " ,AVG(rr.final_points) as avg_points");
      query.append(        " ,AVG(rr.room_seed) as avg_room_seed");
      query.append(        " ,AVG(rr.room_placed) as avg_room_placed");
      query.append(        " ,AVG(rr.paid) as avg_paid");
      query.append(        " ,SUM(rr.paid) as total_paid");
      query.append(        " ,count(*)");
      query.append(        " ,r.vol");
      query.append(        " ,c.coder_id");
      query.append(        " ,p.path || i.file_name as image");
      query.append(   " FROM coder c");
      query.append(   " JOIN rating r ON c.coder_id = r.coder_id");
      query.append(    " AND c.coder_id = ?");
      query.append(   " JOIN room_result rr ON rr.coder_id = c.coder_id");
      query.append(    " AND rr.attended='Y'");
      query.append(   " LEFT OUTER JOIN coder_image_xref cix ON c.coder_id = cix.coder_id");
      query.append(   " LEFT OUTER JOIN image i ON i.image_id = cix.image_id");
      query.append(   " LEFT OUTER JOIN path p ON p.path_id = i.path_id");
      query.append(  " GROUP BY c.handle, c.quote, c.member_since, r.rating, r.vol, c.coder_id, 14");
      log.debug("\nquery: ********\n " + query.toString());
      conn = DBMS.getDWConnection();
      ps = conn.prepareStatement(query.toString());
      ps.setInt(1, coderId);
      rs = ps.executeQuery();
      if (rs.next()) {
        result = new Coder();
        result.setHandle(rs.getString(1));
        result.setQuote(rs.getString(2));
        result.setMemberSince(rs.getDate(3));
        result.setRating(rs.getInt(4));
        result.setMaxRating(rs.getInt(5));
        result.setAvgPoints(rs.getFloat(6));
        result.setAvgRoomSeed(rs.getFloat(7));
        result.setAvgRoomFinish(rs.getFloat(8));
        result.setAvgEarnings(rs.getFloat(9));
        result.setTotalEarnings(rs.getFloat(10));
        result.setNumCompetitions(rs.getInt(11));
        result.setVolatility(rs.getInt(12));
        result.setCoderId(rs.getInt(13));
        result.setImage(rs.getString(14));
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException ("ejb:CoderStatistics:getCoderStatistics(" + coderId + ")\n" + sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException ("ejb:CoderStatistics:getCoderStatistics:(" + coderId + ")\n" + e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.error("rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.error("ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {log.error("conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result;
  }



}
