package com.topcoder.web.ejb.termsofuse;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TermsOfUseBean extends BaseEJB {
    private static Logger log = Logger.getLogger(TermsOfUseBean.class);

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";


    public long createTermsOfUse() throws EJBException {

        long terms_of_use_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), (DataSource) ctx.lookup(DATA_SOURCE), "sequence_object", "name",
                        "current_value", 9999999999L, 1, false);
            }

            terms_of_use_id = IdGenerator.nextId("TERMS_OF_USE_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO terms_of_use (terms_of_use_id) ");
            query.append("VALUES (?)");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'terms_of_use'. Inserted " + rc + ", should " +
                        "have inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return (terms_of_use_id);
    }

    public long getTermsOfUseTypeId(long _terms_of_use_id)
            throws EJBException {

        long terms_of_use_type_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;

        try {

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_of_use_type_id ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _terms_of_use_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                terms_of_use_type_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from " +
                        "'terms_of_use' with terms_of_use_id=" +
                        _terms_of_use_id + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (terms_of_use_type_id);
    }

    public void setTermsOfUseTypeId(long _terms_of_use_id,
                                    long _terms_of_use_type_id)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE terms_of_use ");
            query.append("SET terms_of_use_type_id=? ");
            query.append("WHERE terms_of_use_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _terms_of_use_type_id);
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'terms_of_use'. Updated " + rc + ", should " +
                        "have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public String getText(long _terms_of_use_id)
            throws EJBException {

        String text = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_text ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _terms_of_use_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                text = DBMS.getTextString(rs, 1);
            } else {
                throw(new EJBException("No rows found when selecting from " +
                        "'terms_of_use' with terms_of_use_id=" +
                        _terms_of_use_id + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } catch (Exception _e) {
            _e.printStackTrace();
            throw(new EJBException(_e.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (text);
    }

    public void setText(long _terms_of_use_id, String _text)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE terms_of_use ");
            query.append("SET terms_text=? ");
            query.append("WHERE terms_of_use_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setBytes(1, DBMS.serializeTextString(_text));
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'terms_of_use'. Updated " + rc + ", should " +
                        "have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } catch (Exception _e) {
            _e.printStackTrace();
            throw(new EJBException(_e.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
