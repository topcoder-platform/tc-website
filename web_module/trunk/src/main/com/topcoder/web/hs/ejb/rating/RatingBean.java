package com.topcoder.web.hs.ejb.rating;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class RatingBean implements SessionBean {

    private transient InitialContext ctx = null;

    private SessionContext sessCtx;
    private DataSource ds;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/datasource");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext sessCtx) {
        sessCtx = sessCtx;
    }

    public void createRating(long coderId) throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append(  "INTO rating (coder_id, num_ratings) ");
            query.append("VALUES (?, ?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, coderId);
            ps.setInt(2, 0);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'rating'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
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


};
