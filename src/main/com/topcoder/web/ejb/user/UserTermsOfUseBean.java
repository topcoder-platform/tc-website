package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class UserTermsOfUseBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private transient InitialContext init_ctx = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            init_ctx = new InitialContext();
        } catch (NamingException _ne) {
            _ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext _ctx) {
        ctx = _ctx;
    }

    public void createUserTermsOfUse(long _user_id, long _terms_of_use_id)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user_terms_of_use_xref (user_id,terms_of_use_id) ");
            query.append("VALUES (?,?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_id);
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'user_terms_of_use_xref'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
    }

    public void removeUserTermsOfUse(long _user_id, long _terms_of_use_id)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM user_terms_of_use_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _user_id);
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'user_terms_of_use_xref'. Deleted " + rc + ", " +
                        "should have deleted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
    }


    public boolean hasTermsOfUse(long userId, long termsOfUseId)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append("FROM user_terms_of_use_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, termsOfUseId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true,_sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
        return ret;
    }



}

;
