package com.topcoder.web.ejb.termsofuse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.EJBException;
import javax.naming.InitialContext;

import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.web.common.IdGeneratorClient;
import com.topcoder.web.ejb.BaseEJB;

public class TermsOfUseBean extends BaseEJB {

    private static final long serialVersionUID = 1L;
    
    public TermsOfUseEntity updateTermsOfUse(String dataSource, TermsOfUseEntity terms) throws EJBException {
        
        // if the terms of use id is specified, it's an update
        boolean isUpdate = terms.getTermsOfUseId() != null;
        
        StringBuffer query = new StringBuffer(1024);

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection(dataSource);

            if (isUpdate) {
                query.append("UPDATE terms_of_use ");
                query.append("SET terms_text = ?, terms_of_use_type_id = ?, title = ?, ");
                query.append("electronically_signable = ?, url = ? ");
                query.append("WHERE terms_of_use_id = ?");

                ps = conn.prepareStatement(query.toString());
                ps.setBytes(1, DBMS.serializeTextString(terms.getTermsText()));
                ps.setInt(2, terms.getTermsOfUseTypeId());
                ps.setString(3, terms.getTitle());
                ps.setInt(4, terms.getElectronicallySignable());
                ps.setString(5, terms.getUrl());
                ps.setLong(6, terms.getTermsOfUseId());
            } else {
                long termsOfUseId = IdGeneratorClient.getSeqId("TERMS_OF_USE_SEQ");
                
                terms.setTermsOfUseId(termsOfUseId);
    
                query.append("INSERT ");
                query.append("INTO terms_of_use (terms_of_use_id, terms_text, terms_of_use_type_id, title, ");
                query.append("electronically_signable, url) ");
                query.append("VALUES (?, ?, ?, ?, ?, ?)");
    
                ps = conn.prepareStatement(query.toString());
                ps.setLong(1, termsOfUseId);
                ps.setBytes(2, DBMS.serializeTextString(terms.getTermsText()));
                ps.setInt(3, terms.getTermsOfUseTypeId());
                ps.setString(4, terms.getTitle());
                ps.setInt(5, terms.getElectronicallySignable());
                ps.setString(6, terms.getUrl());
            }
            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("TermsOfUse: Wrong number of rows updated/inserted. (" + rc + ")"));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (IDGenerationException idge) {
            throw new EJBException(idge);
        } catch (Exception e) {
            e.printStackTrace();
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }

        return (terms);
    }

    public TermsOfUseEntity getEntity(long termsOfUseId, String dataSource) throws EJBException {
        TermsOfUseEntity terms = null;
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_text, terms_of_use_type_id, title, electronically_signable, url ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");
        
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseId);
        
            rs = ps.executeQuery();
            if (rs.next()) {
                terms = new TermsOfUseEntity(termsOfUseId, DBMS.getTextString(rs, 1), 
                        rs.getInt("terms_of_use_type_id"), rs.getString("title"), rs.getInt("electronically_signable"),
                        rs.getString("url"));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (Exception e) {
            e.printStackTrace();
            throw(new EJBException(e.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
        return (terms);
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
