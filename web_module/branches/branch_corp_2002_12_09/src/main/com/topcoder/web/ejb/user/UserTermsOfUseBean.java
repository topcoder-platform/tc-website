package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.ejb.EJBException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;


/**
 * Bean which modifies User/Terms Of Use table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class UserTermsOfUseBean implements SessionBean {
    private static Logger log = Logger.getLogger(UserTermsOfUseBean.class);
    private SessionContext ctx;

    //required ejb methods
    public void ejbActivate() {}

    /**
     *
     */
    public void ejbPassivate() {}

    /**
     *
     */
    public void ejbCreate() {
        //InitContext = new InitialContext(); // from BaseEJB
    }

    /**
     *
     */
    public void ejbRemove() {}

    /**
     *
     *
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    //business methods

    /**
     *
     *
     * @param userId user ID to insert into table
     * @param termsOfUseId Terms Of Use ID to insert into table
     */
    public void createUserTermsOfUse(long userId, long termsOfUseId) {
        log.debug("createUserTermsOfUse called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO user_terms_of_use_xref " +
                                       "(user_id, terms_of_use_id) " +
                                       "VALUES (?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, termsOfUseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                                       rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException creating user terms of use " +
                                   "xref");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating user terms of " +
                                   "use xref");
        } catch (Exception e) {
            throw new EJBException("Exception creating user terms of use " +
                                   "xref:\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "createUserTermsOfUse");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                              "createUserTermsOfUse");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in " +
                              "createUserTermsOfUse");
                }
            }
        }
    }

    /**
     *
     *
     * @param userId user ID of entry to remove
     * @param termsOfUseId Terms Of Use ID of entry to remove
     */
    public void removeUserTermsOfUse(long userId, long termsOfUseId) {
        log.debug("removeUserTermsOfUse called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("DELETE FROM user_terms_of_use_xref " +
                                       "WHERE user_id = ? AND " +
                                       "terms_of_use_id = ?");

            ps.setLong(1, userId);
            ps.setLong(2, termsOfUseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in remove: " +
                                       rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException removing user terms of use " +
                                   "xref");
        } catch (NamingException e) {
            throw new EJBException("NamingException removing user terms of " +
                                   "use xref");
        } catch (Exception e) {
            throw new EJBException("Exception removing user terms of use " +
                                   "xref:\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "removeUserTermsOfUse");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                              "removeUserTermsOfUse");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in " +
                              "removeUserTermsOfUse");
                }
            }
        }
    }
}
