package com.topcoder.web.forums.model;

import com.jivesoftware.base.Log;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserManagerAdapter;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.base.database.ConnectionManager;
import com.jivesoftware.base.database.UserIterator;
import com.jivesoftware.util.LongList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

/**
 * User: dok
 * Date: Nov 23, 2004
 * Time: 12:04:25 PM
 */
public class TCUserManager extends UserManagerAdapter {

    protected DataSource dataSource = null;

    private static final String ALL_USERS =
                            "select user_id " +
                             " from user " +
                            " where status = 'A'";
    private static final String USER_COUNT =
                            "select count(*) as member_count" +
                             " from user " +
                            " where status = 'A'";

    public TCUserManager() {
        Context context = null;
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup(Common.DATASOURCE);
        } catch (Exception e) {
            Log.error(e);
        } finally {
            Common.close(context);
        }
    }

    public int getUserCount() {

        int count = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = ConnectionManager.getConnection();
            pstmt = con.prepareStatement(USER_COUNT);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("member_count");
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            Common.close(rs);
            Common.close(pstmt);
            Common.close(con);
        }
        return count;
    }

    public Iterator users() {

        LongList users = new LongList(500);
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ConnectionManager.getConnection();
            pstmt = con.prepareStatement(ALL_USERS);
            rs = pstmt.executeQuery();
            ConnectionManager.setFetchSize(rs, 500);
            while (rs.next()) {
                users.add(rs.getLong(1));
            }
        } catch (SQLException e) {
            Log.error(e);
        } finally {
            Common.close(rs);
            Common.close(pstmt);
            Common.close(con);
        }
        return new UserIterator(users.toArray());
    }

    public Iterator users(int startIndex, int numResults) {
        LongList users = new LongList();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ConnectionManager.getConnection();
            pstmt = con.prepareStatement(ALL_USERS);
            rs = pstmt.executeQuery();
            ConnectionManager.setFetchSize(rs, startIndex + numResults);
            // Move to start of index
            for (int i = 0; i < startIndex; i++) {
                rs.next();
            }
            // Now read in desired number of results (or stop if we run out of results).
            for (int i = 0; i < numResults; i++) {
                if (rs.next()) {
                    users.add(rs.getLong(1));
                } else {
                    break;
                }
            }
        } catch (SQLException e) {
            Log.error(e);
        } finally {
            Common.close(rs);
            Common.close(pstmt);
            Common.close(con);
        }
        return new UserIterator(users.toArray());
    }

    protected User lookupUser(long userID) throws UserNotFoundException {
    	return new TCUser(userID, dataSource);
    }

    protected User lookupUser(String username) throws UserNotFoundException {
    	return new TCUser(username, dataSource);
    }

    public boolean isGetUserCountSupported() {
        return true;
    }

    public boolean isUsersSupported() {
        return true;
    }
}