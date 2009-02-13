package com.topcoder.web.ejb.messagehistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;

/**
 * @author mtong
 * 
 * Handles interaction with the database regarding revision history of forum messages.
 */

public class MessageHistoryBean extends BaseEJB {

    private static Logger log = Logger.getLogger(MessageHistoryBean.class);

    public void addEdit(long messageId, String subject, String body, long modificationDate, String dataSource) {
        int ret = insert("message_history",
                new String[]{"messageid", "subject", "body", "modificationdate"},
                new String[]{String.valueOf(messageId), subject, body, String.valueOf(modificationDate)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'message_history'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }
    
    private static final String GET_EDITS_SQL = 
        "select historyid, messageid, subject, body, modificationdate " +
        "from message_history where messageid = ? order by modificationdate desc";

    public ResultSetContainer getEdits(long messageId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_EDITS_SQL);
            ps.setLong(1, messageId);
        
            rs = ps.executeQuery();
            return new ResultSetContainer(rs);
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
    
    private static final String GET_EDIT_COUNT_SQL = 
        "select count(*) " +
        "from message_history where messageid = ?";

    public int getEditCount(long messageId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_EDIT_COUNT_SQL);
            ps.setLong(1, messageId);
        
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
        }
    }
    
    private static final String GET_MESSAGE_EDIT_COUNTS_SQL = 
        "select h.messageid, count(*) as cnt " +
        "from message_history h, jivemessage m " +
        "where h.messageid = m.messageid " +
        "and m.threadid = ? " +
        "group by h.messageid ";

    public Hashtable getMessageEditCounts(long threadId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_MESSAGE_EDIT_COUNTS_SQL);
            ps.setLong(1, threadId);
        
            rs = ps.executeQuery();
            
            Hashtable h = new Hashtable();
            while (rs.next()) {
                h.put(rs.getString("messageid"), rs.getString("cnt"));
            }
            return h;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
}
