package com.topcoder.web.ejb.user;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.EJBException;

/**
 * @author dok
 * Date: Jan 20, 2004
 */
public class UserPreferenceBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(UserPreferenceBean.class);

    public void createUserPreference(long userId, int preferenceId, String dataSource)
            throws EJBException {
        int ret = insert("user_preference",
                new String[] {"user_id", "preference_id"},
                new String[] {String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
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

    public void removeUserPreference(long userId, int preferenceId, String dataSource) throws EJBException {
        int ret = delete("user_preference",
                new String[] {"user_id", "preference_id"},
                new String[] {String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
        log.debug("removed " + ret + " rows");
    }

    public void setValue(long userId, int preferenceId, String value, String dataSource) throws EJBException {
        int ret = update("user_preference",
                new String[] {"value"},
                new String[] {value},
                dataSource);
        log.debug("updated " + ret + " rows");
    }

    public String getValue(long userId, int preferenceId, String dataSource) throws EJBException {
        return selectString("user_preference",
                "value",
                new String[] {"user_id", "preference_id"},
                new String[] {String.valueOf(userId), String.valueOf(preferenceId)},
                dataSource);
    }

}
