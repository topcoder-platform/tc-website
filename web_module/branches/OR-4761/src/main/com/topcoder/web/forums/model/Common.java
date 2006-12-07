package com.topcoder.web.forums.model;

import com.jivesoftware.base.Log;

import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.topcoder.shared.util.DBMS;

/**
 * User: dok
 * Date: Nov 23, 2004
 * Time: 3:26:35 PM
 */
class Common {
    public static String DATASOURCE = DBMS.FORUMS_DATASOURCE_NAME;


    public static final void close(Context ctx) {
        if (ctx!=null) {
            try {
                ctx.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }
    }


    public static final void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }
    }

    public static final void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }

    }

    public static final void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }

    }


}
