package com.topcoder.web.ejb.termsofuse;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TermsOfUseBean extends BaseEJB {
    private static Logger log = Logger.getLogger(TermsOfUseBean.class);


    public long createTermsOfUse(String dataSource, String idDataSource) throws EJBException {

        long terms_of_use_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            terms_of_use_id = IdGeneratorClient.getSeqId("TERMS_OF_USE_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO terms_of_use (terms_of_use_id) ");
            query.append("VALUES (?)");

            conn = DBMS.getConnection(dataSource);
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
        } finally {
            close(ps);
            close(conn);
        }
        return (terms_of_use_id);
    }

    public long getTermsOfUseTypeId(long termsOfUseId, String dataSource)
            throws EJBException {

        long termsOfuseTypeId = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        InitialContext ctx = null;

        try {


            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_of_use_type_id ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseId);

            rs = ps.executeQuery();
            if (rs.next()) {
                termsOfuseTypeId = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from " +
                        "'terms_of_use' with terms_of_use_id=" +
                        termsOfUseId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (termsOfuseTypeId);
    }

    public void setTermsOfUseTypeId(long termsOfUseId,
                                    long termsOfUseTypeId, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE terms_of_use ");
            query.append("SET terms_of_use_type_id=? ");
            query.append("WHERE terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseTypeId);
            ps.setLong(2, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'terms_of_use'. Updated " + rc + ", should " +
                        "have updated 1."));
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

    public String getText(long termsOfUseId, String dataSource)
            throws EJBException {

        String text = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_text ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseId);

            rs = ps.executeQuery();
            if (rs.next()) {
                text = DBMS.getTextString(rs, 1);
            } else {
                throw(new EJBException("No rows found when selecting from " +
                        "'terms_of_use' with terms_of_use_id=" +
                        termsOfUseId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
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

    public void setText(long termsOfUseId, String _text, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE terms_of_use ");
            query.append("SET terms_text=? ");
            query.append("WHERE terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setBytes(1, DBMS.serializeTextString(_text));
            ps.setLong(2, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                        "'terms_of_use'. Updated " + rc + ", should " +
                        "have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
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
