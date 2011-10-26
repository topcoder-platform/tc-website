package com.topcoder.web.ejb.forumpoll;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;

/**
 * This class handles interaction with the database regarding forum polls.
 *
 * @author mtong
 */

public class ForumPollBean extends BaseEJB {

    private static Logger log = Logger.getLogger(ForumPollBean.class);

    private static final String GET_VOTER_COUNT_BY_POLL_SQL = 
    	"select count(distinct v.userid) as votercnt " +
    	"from jivepollvote v " +
    	"where v.pollid = ?";
    
    public int getVoterCountByPoll(long pollID, String dataSource) {
    	Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_VOTER_COUNT_BY_POLL_SQL);
            ps.setLong(1, pollID);
        
            rs = ps.executeQuery();
            
            int ret = -1;
            if (rs.next()) {
                ret = rs.getInt(1);
            } else {
                throw new RowNotFoundException("no row found for " + ps.toString());
            }
            return ret;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }
    
    private static final String GET_VOTER_COUNT_BY_THREAD_SQL =
    	"select v.pollid, count(distinct v.userid) as votercnt " +
		"from jivepollvote v, jivepoll p, jivemessage m " +
		"where v.pollid = p.pollid " +
		"and p.objecttype = 2 " +
		"and p.objectid = m.messageid " +
		"and m.threadid = ? " + 
		"group by v.pollid " +
		"order by v.pollid";
    
    public Hashtable getVoterCountByThread(long threadID, String dataSource) throws EJBException, RemoteException {
    	Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_VOTER_COUNT_BY_THREAD_SQL);
            ps.setLong(1, threadID);
        
            rs = ps.executeQuery();
            
            Hashtable retTable = new Hashtable();
            while (rs.next()) {
            	retTable.put(new Long(rs.getLong("pollid")), new Long(rs.getLong("votercnt")));
            }
            return retTable;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }
    
    private static final String GET_VOTER_COUNTS_SQL = 
    	"select v.pollid, count(distinct v.userid) as votercnt " +
    	"from jivepollvote v " +
    	"group by v.pollid " +
    	"order by v.pollid";
    
    public Hashtable getVoterCounts(String dataSource) throws EJBException, RemoteException {
    	Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_VOTER_COUNTS_SQL);
        
            rs = ps.executeQuery();
            
            Hashtable retTable = new Hashtable();
            while (rs.next()) {
            	retTable.put(new Long(rs.getLong("pollid")), new Long(rs.getLong("votercnt")));
            }
            return retTable;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }
}
