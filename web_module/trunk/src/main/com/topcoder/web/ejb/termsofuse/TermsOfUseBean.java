/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
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

/**
 * <p>EJB to handle terms of use table.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added support for new columns in terms_of_use table.</li>
 *     <li>Refactored methods to allos usage of <code>TermsOfUseEntity</code>.</li>
 *     <li>Deprecated old methods.</li>
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.1
 */
public class TermsOfUseBean extends BaseEJB {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     * @since 1.1
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method will create/update terms of use entity.
     *
     * If the object contains an id, the method will attempt an update, otherwise it will calculate an id and attempt
     * an insertion.
     *
     * @param terms a <code>TermsOfUseEntity</code> containing required information for creation/update.
     * @param dataSource a <code>String</code> containing the datasource.
     *
     * @return a <code>TermsOfUseEntity</code> with updated id attribute.
     * @throws EJBException
     *
     * @since 1.1
     */
    public TermsOfUseEntity updateTermsOfUse(TermsOfUseEntity terms, String dataSource) throws EJBException {

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

    /**
     * This method will retrieve a terms of use entity from the database.
     *
     * @param termsOfUseId a <code>long</code> containing the terms of use id to retrieve.
     * @param dataSource a <code>String</code> containing the datasource.
     *
     * @return a <code>TermsOfUseEntity</code> with the requested terms of use or null if not found.
     * @throws EJBException if any error occurs.
     *
     * @since 1.1
     */
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


    /**
     * @deprecated since 1.1
     */
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

    /**
     * @deprecated since 1.1
     */
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

    /**
     * @deprecated since 1.1
     */
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

    /**
     * @deprecated since 1.1
     */
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
