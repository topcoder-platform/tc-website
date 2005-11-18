package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserTermsOfUseBean extends BaseEJB {

    private static Logger log = Logger.getLogger(UserTermsOfUseBean.class);


    public void createUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO user_terms_of_use_xref (user_id,terms_of_use_id) ");
            query.append("VALUES (?,?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'user_terms_of_use_xref'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void removeUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM user_terms_of_use_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'user_terms_of_use_xref'. Deleted " + rc + ", " +
                        "should have deleted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public boolean hasTermsOfUse(long userId, long termsOfUseId, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        InitialContext ctx = null;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append("FROM user_terms_of_use_xref ");
            query.append("WHERE user_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, termsOfUseId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }


}

