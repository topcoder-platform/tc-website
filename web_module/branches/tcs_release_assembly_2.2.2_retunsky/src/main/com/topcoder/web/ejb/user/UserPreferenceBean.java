package com.topcoder.web.ejb.user;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 *         Date: Jan 20, 2004
 */
public class UserPreferenceBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(UserPreferenceBean.class);

    public void createUserPreference(long userId, int preferenceId, String dataSource) {
        int ret = insert("user_preference",
                new String[]{"user_id", "preference_id"},
                new String[]{String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
        if (ret != 1) {
            throw (new EJBException("Wrong number of rows inserted into " +
                    "'user_preference'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }

/*

        log.debug("createUserPreference called. user_id=" + userId + " " +
                "preference_id=" + preferenceId);

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user_preference (user_id,preference_id) ");
            query.append("VALUES (?,?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, preferenceId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'user_preference'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
*/
    }

    public void removeUserPreference(long userId, int preferenceId, String dataSource) {
        int ret = delete("user_preference",
                new String[]{"user_id", "preference_id"},
                new String[]{String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
        if (ret != 1) {
            throw (new EJBException("Wrong number of rows deleted from " +
                    "'user_preference'. Deleted " + ret + ", " +
                    "should have deleted 1."));
        }
    }

    public void setValue(long userId, int preferenceId, String value, String dataSource) {
        int ret = update("user_preference",
                new String[]{"value"},
                new String[]{value},
                new String[]{"user_id", "preference_id"},
                new String[]{String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
        if (ret != 1) {
            throw (new EJBException("Wrong number of rows updated in " +
                    "'user_preference'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public String getValue(long userId, int preferenceId, String dataSource) throws RowNotFoundException {
        return selectString("user_preference",
                "value",
                new String[]{"user_id", "preference_id"},
                new String[]{String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
    }

    public void setPreferenceValueID(long userId, int preferenceId, int valueId, String dataSource) {
        int ret = update("user_preference",
                new String[]{"preference_value_id"},
                new String[]{String.valueOf(valueId)},
                new String[]{"user_id", "preference_id"},
                new String[]{String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
        if (ret != 1) {
            throw (new EJBException("Wrong number of rows updated in " +
                    "'user_preference'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public int getPreferenceValueID(long userId, int preferenceId, String dataSource) throws RowNotFoundException {
        return selectInt("user_preference",
                "preference_value_id",
                new String[]{"user_id", "preference_id"},
                new String[]{String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
    }

    private static final String GET_PREFERENCES_BY_GROUP_SQL =
            "SELECT up.user_id" +
                    " , up.preference_id" +
                    " , up.value" +
                    " , up.preference_value_id" +
                    " , p.preference_name" +
                    " , p.preference_desc" +
                    " , p.preference_type_id " +
                    " FROM  " +
                    "user_preference up, preference_lu p, preference_group_lu pg " +
                    "where p.preference_id = up.preference_id and " +
                    "pg.preference_group_id = p.preference_group_id and " +
                    "pg.preference_group_id = ? and " +
                    "up.user_id = ? ";

    public ResultSetContainer getPreferencesByGroup(long userId, int groupId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        try {

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_PREFERENCES_BY_GROUP_SQL);
            ps.setInt(1, groupId);
            ps.setLong(2, userId);

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
            close(ctx);
        }
    }
}
