package com.topcoder.ejb.Graph;

import javax.naming.*;
import javax.ejb.*;
import java.io.Serializable;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.rmi.RemoteException;
import com.topcoder.ejb.BaseEJB;
import com.topcoder.common.*;
import com.topcoder.common.web.data.stat.coder.*;

/*************************************************************************************************
 *
 * Creation Date: 08/14/2001
 * Author: Greg Paul
 *
 * The Graph Bean is used to select information from the database that will be used to 
 * dynamically create a graph image.
 *************************************************************************************************
 */

public class GraphBean extends BaseEJB{

  static final boolean VERBOSE = false;


  /**
  *********************************************************************************************
  * getRatingDistribution()
  * Gets an ArrayList of Doubles that determine the coder rating distribution
  * @author Greg Paul
  * @return ArrayList - the rating distribution 
  * @throws RemoteException
  *********************************************************************************************
  */
  public ArrayList getRatingDistribution() throws RemoteException {
    Log.msg(VERBOSE, "ejb:Graph:getRatingDistribution called...");
    PreparedStatement ps = null; 
    ArrayList result = null;
    ResultSet rs = null; 
    Connection conn = null; 
    StringBuffer query = null;   

    try {   
      query = new StringBuffer();
      query.append( "SELECT sum(case when rating between 0000 and 0099 then 1 else 0 end) as group01");
      query.append(       " ,sum(case when rating between 0100 and 0199 then 1 else 0 end) as group02");
      query.append(       " ,sum(case when rating between 0200 and 0299 then 1 else 0 end) as group03");
      query.append(       " ,sum(case when rating between 0300 and 0399 then 1 else 0 end) as group04");
      query.append(       " ,sum(case when rating between 0400 and 0499 then 1 else 0 end) as group05");
      query.append(       " ,sum(case when rating between 0500 and 0599 then 1 else 0 end) as group06");
      query.append(       " ,sum(case when rating between 0600 and 0699 then 1 else 0 end) as group07");
      query.append(       " ,sum(case when rating between 0700 and 0799 then 1 else 0 end) as group08");
      query.append(       " ,sum(case when rating between 0800 and 0899 then 1 else 0 end) as group09");
      query.append(       " ,sum(case when rating between 0900 and 0999 then 1 else 0 end) as group10");
      query.append(       " ,sum(case when rating between 1000 and 1099 then 1 else 0 end) as group11");
      query.append(       " ,sum(case when rating between 1100 and 1199 then 1 else 0 end) as group12");
      query.append(       " ,sum(case when rating between 1200 and 1299 then 1 else 0 end) as group13");
      query.append(       " ,sum(case when rating between 1300 and 1399 then 1 else 0 end) as group14");
      query.append(       " ,sum(case when rating between 1400 and 1499 then 1 else 0 end) as group15");
      query.append(       " ,sum(case when rating between 1500 and 1599 then 1 else 0 end) as group16");
      query.append(       " ,sum(case when rating between 1600 and 1699 then 1 else 0 end) as group17");
      query.append(       " ,sum(case when rating between 1700 and 1799 then 1 else 0 end) as group18");
      query.append(       " ,sum(case when rating between 1800 and 1899 then 1 else 0 end) as group19");
      query.append(       " ,sum(case when rating between 1900 and 1999 then 1 else 0 end) as group20");
      query.append(       " ,sum(case when rating between 2000 and 2099 then 1 else 0 end) as group21");
      query.append(       " ,sum(case when rating between 2100 and 2199 then 1 else 0 end) as group22");
      query.append(       " ,sum(case when rating between 2200 and 2299 then 1 else 0 end) as group23");
      query.append(       " ,sum(case when rating between 2300 and 2399 then 1 else 0 end) as group24");
      query.append(       " ,sum(case when rating between 2400 and 2499 then 1 else 0 end) as group25");
      query.append(       " ,sum(case when rating between 2500 and 2599 then 1 else 0 end) as group26");
      query.append(       " ,sum(case when rating between 2600 and 2699 then 1 else 0 end) as group27");
      query.append(       " ,sum(case when rating between 2700 and 2799 then 1 else 0 end) as group28");
      query.append(       " ,sum(case when rating between 2800 and 2899 then 1 else 0 end) as group29");
      query.append(       " ,sum(case when rating >2899 then 1 else 0 end) as group30");
      query.append(  " FROM coder c");
      query.append(       " ,coder_rating cr");
      query.append( " WHERE c.coder_id = cr.coder_id");
      query.append(   " AND status = 'A'");
      query.append(   " AND num_ratings > 0");
      query.append(   " AND rating > 0");

      conn = DBMS.getDWConnection();
      result = new ArrayList();
      Log.msg(VERBOSE, "\nquery: **********\n " + query.toString());
      ps = conn.prepareStatement(query.toString());
      rs = ps.executeQuery();
      if (rs.next()) {
        result.add(new Double(rs.getInt(1)));
        result.add(new Double(rs.getInt(2)));
        result.add(new Double(rs.getInt(3)));
        result.add(new Double(rs.getInt(4)));
        result.add(new Double(rs.getInt(5)));
        result.add(new Double(rs.getInt(6)));
        result.add(new Double(rs.getInt(7)));
        result.add(new Double(rs.getInt(8)));
        result.add(new Double(rs.getInt(9)));
        result.add(new Double(rs.getInt(10)));
        result.add(new Double(rs.getInt(11)));
        result.add(new Double(rs.getInt(12)));
        result.add(new Double(rs.getInt(13)));
        result.add(new Double(rs.getInt(14)));
        result.add(new Double(rs.getInt(15)));
        result.add(new Double(rs.getInt(16)));
        result.add(new Double(rs.getInt(17)));
        result.add(new Double(rs.getInt(18)));
        result.add(new Double(rs.getInt(19)));
        result.add(new Double(rs.getInt(20)));
        result.add(new Double(rs.getInt(21)));
        result.add(new Double(rs.getInt(22)));
        result.add(new Double(rs.getInt(23)));
        result.add(new Double(rs.getInt(24)));
        result.add(new Double(rs.getInt(25)));
        result.add(new Double(rs.getInt(26)));
        result.add(new Double(rs.getInt(27)));
        result.add(new Double(rs.getInt(28)));
        result.add(new Double(rs.getInt(29)));
        result.add(new Double(rs.getInt(30)));
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException (sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException (e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {Log.msg(VERBOSE, "conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result; 
  }    

  /**
  *********************************************************************************************
  * getAvgRatingsHistory()
  * Gets an ArrayList of Rating objects holding the avg rating history
  * of all coders.
  * @author Greg Paul
  * @return ArrayList - the rating history 
  * @throws RemoteException
  *********************************************************************************************
  */
  public ArrayList getAvgRatingsHistory() throws RemoteException {
    Log.msg(VERBOSE, "ejb:Graph:getAvgRatingsHistory called...");
    PreparedStatement ps = null; 
    ArrayList result = null;
    Rating rating = null;
    ResultSet rs = null; 
    Connection conn = null; 
    StringBuffer query = null;   

    try {   
      query = new StringBuffer();
      /**********************************************************************************************/
      /*************************************** Postgres *********************************************/
      /**********************************************************************************************/
      if (DBMS.DB == DBMS.POSTGRES) {
        query.append( "SELECT c.contest_name");
        query.append(       " ,r.round_desc");
        query.append(       " ,AVG(rs.new_rating)");
        query.append(       " ,r.round_date");
        query.append(  " FROM room_status rs");
        query.append(       " ,contest c");
        query.append(       " ,round r");
        query.append( " WHERE rs.round_id = r.round_id");
        query.append(   " AND rs.contest_id = c.contest_id");
        query.append( " GROUP BY c.contest_name, r.round_desc, r.round_date");
        query.append( " ORDER BY r.round_date");
      }
      /**********************************************************************************************/
      /*************************************** Informix *********************************************/
      /**********************************************************************************************/

      conn = DBMS.getDWConnection();
      result = new ArrayList();
      Log.msg(VERBOSE, "\nquery: **********\n " + query.toString());
      ps = conn.prepareStatement(query.toString());
      rs = ps.executeQuery();
      while (rs.next()) {
        rating = new Rating();
        rating.setContestName(rs.getString(1));
        rating.setRoundName(rs.getString(2));
        rating.setRating((int)rs.getFloat(3));
        rating.setEventDate(rs.getDate(4)); 
        result.add(rating);
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException (sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException (e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {Log.msg(VERBOSE, "conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result; 
  }    


  /**
  *********************************************************************************************
  * getPointsHistory()
  * Gets an ArrayList of PointTotal objects.  If the coderId is null, 
  * then get the average points for each contest.  Otherwise get the points for each 
  * competition that the coder has taken part in.
  * @author Greg Paul
  * @param coderId - a coder's id
  * @return ArrayList - the avg points history 
  * @throws RemoteException
  *********************************************************************************************
  */
  public ArrayList getPointsHistory(Integer coderId) throws RemoteException {
    Log.msg(VERBOSE, "ejb:Graph:getPointsHistory called...");
    PreparedStatement ps = null; 
    ArrayList result = null;
    PointTotal pointTotal = null;
    ResultSet rs = null; 
    Connection conn = null; 
    StringBuffer query = null;   

    try {   
      query = new StringBuffer();
      if (coderId==null)
        query.append(" SELECT AVG(rs.points)");
      else
        query.append(" SELECT rs.points");
      query.append(         " ,c.contest_id");
      query.append(         " ,c.contest_name");
      query.append(         " ,r.round_id");
      query.append(         " ,r.round_desc");
      query.append(         " ,r.round_date");
      query.append(    " FROM room_status rs");
//      **** *HERE
//      query.append9 
      query.append(         " ,contest c");
      query.append(         " ,round r");
      query.append(   " WHERE rs.contest_id = r.contest_id");
      query.append(     " AND rs.round_id = r.round_id");
      query.append(     " AND r.round_id = c.round_id");
      if (coderId==null)
        query.append( " GROUP BY c.contest_id, c.contest_name, r.round_id, r.round_desc, r.round_date");
      else 
        query.append(   " AND ef.coder_id = ?");
      query.append(   " ORDER BY r.round_date ASC");

      conn = DBMS.getDWConnection();
      result = new ArrayList();
      Log.msg(VERBOSE, "\nquery: **********\n " + query.toString());
      ps = conn.prepareStatement(query.toString());
      if (coderId!=null)
        ps.setInt(1, coderId.intValue());
      rs = ps.executeQuery();
      while (rs.next()) {
        pointTotal = new PointTotal();
        pointTotal.setPoints(rs.getFloat(1));
        pointTotal.setContestId(rs.getInt(2));
        pointTotal.setContestName(rs.getString(3));
        pointTotal.setRoundId(rs.getInt(4));
        pointTotal.setRoundName(rs.getString(5));
        pointTotal.setEventDate(rs.getDate(6)); 
        result.add(pointTotal);
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new RemoteException (sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException (e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "ps   close problem");}
      try { if (conn != null) conn.close();} catch (Exception ignore) {Log.msg(VERBOSE, "conn close problem");}
      rs = null;
      ps = null;
      conn = null;
    }
    return result; 
  }
}
