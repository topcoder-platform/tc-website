package com.topcoder.web.ejb.note;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.naming.Context;
import javax.ejb.EJBException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 1, 2003 12:59:41 AM
 */
public class NoteBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(NoteBean.class);
/*
    private static final String DATA_SOURCE = "java:comp/env/datasource_name";
    private static final String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";
*/

    /**
     *
     * @param text
     * @param submittedBy
     * @param noteTypeId
     * @return note id
     * @throws EJBException
     */
    public long createNote(String text,
                           long submittedBy,
                           int noteTypeId, String dataSource, String idDataSource)
            throws EJBException {
        log.debug("createNote called. text: " + text
                + " submittedBy: " + submittedBy + "noteTypeId: " + noteTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        long noteId = 0;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO note (note_id, text, submitted_by, ");
            query.append("note_type_id) ");
            query.append("VALUES(?,?,?,?) ");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            noteId = IdGeneratorClient.getSeqId("NOTE_SEQ");

            ps.setLong(1, noteId);
            ps.setBytes(2, text.getBytes());
            ps.setLong(3, submittedBy);
            ps.setInt(4, noteTypeId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in createNote noteId: " + noteId + " text: " + text);
        } catch (Exception e) {
            throw new EJBException("Exception in createNote noteId: " + noteId + " text: " + text);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return noteId;
    }

    /**
     *
     * @param noteId
     * @param text
     * @throws EJBException
     */
    public void setText(long noteId, String text, String dataSource)
            throws EJBException {
        log.debug("setText called. noteId: "
                + noteId + " text: " + text);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE note set text = ? where note_id = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setBytes(1, text.getBytes());
            ps.setLong(2, noteId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setText noteId: " + noteId + " text: " + text);
        } catch (Exception e) {
            throw new EJBException("Exception in setText noteId: " + noteId + " text: " + text);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param noteId
     * @param submittedBy
     * @throws EJBException
     */
    public void setSubmittedBy(long noteId, long submittedBy, String dataSource)
            throws EJBException {
        log.debug("setSubmittedBy called. noteId: "
                + noteId + " submittedBy: " + submittedBy);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE note set submitted_by = ? where note_id = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, submittedBy);
            ps.setLong(2, noteId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setSubmittedBy noteId: " + noteId + " submittedBy: " + submittedBy);
        } catch (Exception e) {
            throw new EJBException("Exception in setSubmittedBy noteId: " + noteId + " submittedBy: " + submittedBy);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param noteId
     * @param noteTypeId
     * @throws EJBException
     */
    public void setNoteTypeId(long noteId, int noteTypeId, String dataSource)
            throws EJBException {
        log.debug("setNoteTypeId called. noteId: "
                + noteId + " noteTypeId: " + noteTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE note set note_type_id = ? where note_id = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, noteTypeId);
            ps.setLong(2, noteId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setNoteTypeId noteId: " + noteId + " noteTypeId: " + noteTypeId);
        } catch (Exception e) {
            throw new EJBException("Exception in setNoteTypeId noteId: " + noteId + " noteTypeId: " + noteTypeId);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param noteId
     * @return note text
     * @throws EJBException
     */
    public String getText(long noteId, String dataSource)
            throws EJBException {
        log.debug("getText called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        String text = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT text from note where note_id = ?");

            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, noteId);

            rs = ps.executeQuery();
            if (rs.next()) {
                text = rs.getString(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getText noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getText noteId: " + noteId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return text;
    }

    /**
     *
     * @param noteId
     * @return submitter user id
     * @throws EJBException
     */
    public long getSubmittedBy(long noteId, String dataSource)
            throws EJBException {
        log.debug("getSubmittedBy called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        long submittedBy = -1;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT submitted_by from note where note_id = ?");

            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, noteId);

            rs = ps.executeQuery();
            if (rs.next()) {
                submittedBy = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getSubmittedBy noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSubmittedBy noteId: " + noteId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return submittedBy;
    }

    /**
     *
     * @param noteId
     * @return note type id
     * @throws EJBException
     */
    public int getNoteTypeId(long noteId, String dataSource)
            throws EJBException {
        log.debug("getNoteTypeId called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        int noteTypeId = -1;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT note_type_id from note where note_id = ?");

            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, noteId);

            rs = ps.executeQuery();
            if (rs.next()) {
                noteTypeId = rs.getInt(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getNoteTypeId noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getNoteTypeId noteId: " + noteId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return noteTypeId;
    }

    /**
     *
     * @param noteId
     * @return Note Type Description
     * @throws EJBException
     */
    public String getNoteTypeDesc(long noteId, String dataSource)
            throws EJBException {
        log.debug("getNoteTypeDesc called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        String noteTypeDesc = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT note_type_desc from note where note_id = ?");

            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, noteId);

            rs = ps.executeQuery();
            if (rs.next()) {
                noteTypeDesc = rs.getString(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getNoteTypeDesc noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getNoteTypeDesc noteId: " + noteId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return noteTypeDesc;
    }


    public void removeNote(long noteId,  String dataSource)
            throws EJBException {
        log.debug("removeNote called. note id: " + noteId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("delete from note where note_id = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, noteId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in removeNote noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in removeNote noteId: " + noteId);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }



}

