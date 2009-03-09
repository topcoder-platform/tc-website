package com.topcoder.security;

import com.topcoder.shared.util.logging.Logger;

import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class BaseEJB implements SessionBean {
    private SessionContext sctx;
    private static Logger log = Logger.getLogger(BaseEJB.class);

    //required ejb methods
    public void ejbActivate() {
    }

    /**
     *
     */
    public void ejbPassivate() {
    }

    /**
     *
     */
    public void ejbCreate() {
        //InitContext = new InitialContext(); // from BaseEJB
    }

    /**
     *
     */
    public void ejbRemove() {
    }

    /**
     *
     *
     */
    public void setSessionContext(SessionContext ctx) {
        this.sctx = ctx;
    }

    public static void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                log.error("FAILED to close ResultSet.");
                ignore.printStackTrace();
            }
        }
    }

    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Connection.");
                ignore.printStackTrace();
            }
        }

    }

    public static void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Context.");
                ignore.printStackTrace();
            }
        }

    }

    public static void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                log.error("FAILED to close PreparedStatement.");
                ignore.printStackTrace();
            }
        }
    }

    /**
     * Use this to check the length of a parameter against a defined maximum.
     * For example, compare a submitted username to the length of the username
     * column in the db.  Throws GeneralSecurityException if param is too long.
     *
     * @param param
     * @param maxLength
     */
    protected void checkLength(String param, int maxLength)
            throws GeneralSecurityException {

        if (param.length() > maxLength) {
            throw new GeneralSecurityException("Parameter <" + param + "> is too long.  Should be <= " + maxLength);
        }
    }


}
