package com.topcoder.web.ejb.note;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
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

    private static Logger log = Logger.getLogger(NoteBean.class);
    private static final String dsName = "java:comp/env/datasource";
    private static final String transDsName = "java:comp/env/jts_datasource";

    /**
     *
     * @param text
     * @param submittedBy
     * @param noteTypeId
     * @return note id
     * @throws RemoteException
     */
    public long createNote(String text,
                           long submittedBy,
                           int noteTypeId)
            throws RemoteException {
        log.debug("createNote called. text: " + text
            + " submittedBy: " + submittedBy + "noteTypeId: " + noteTypeId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        long noteId = 0;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO note (note_id, text, submitted_by, ");
            query.append("note_type_id) ");
            query.append("VALUES(?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            noteId = IdGeneratorClient.getSeqId("NOTE_SEQ");

            pstmt.setLong(1,noteId);
            pstmt.setBytes(2,text.getBytes());
            pstmt.setLong(3,submittedBy);
            pstmt.setInt(4,noteTypeId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in createNote noteId: " + noteId + " text: " + text);
        } catch (NamingException e) {
            throw new EJBException("NamingException in createNote noteId: " + noteId + " text: " + text);
        } catch (Exception e) {
            throw new EJBException("Exception in createNote noteId: " + noteId + " text: " + text);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createNote");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createNote");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createNote");}}
        }
        return noteId;
    }

    /**
     *
     * @param noteId
     * @param text
     * @throws RemoteException
     */
    public void setText(long noteId, String text)
            throws RemoteException {
        log.debug("setText called. noteId: "
                 + noteId + " text: " + text);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE note set text = ? where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setBytes(1, text.getBytes());
            pstmt.setLong(2, noteId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in setText noteId: " + noteId + " text: " + text);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setText noteId: " + noteId + " text: " + text);
        } catch (Exception e) {
            throw new EJBException("Exception in setText noteId: " + noteId + " text: " + text);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setText");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setText");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setText");}}
        }
    }

    /**
     *
     * @param noteId
     * @param submittedBy
     * @throws RemoteException
     */
    public void setSubmittedBy(long noteId, long submittedBy)
            throws RemoteException {
        log.debug("setSubmittedBy called. noteId: "
                 + noteId + " submittedBy: " + submittedBy);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE note set submitted_by = ? where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, submittedBy);
            pstmt.setLong(2, noteId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in setSubmittedBy noteId: " + noteId + " submittedBy: " + submittedBy);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setSubmittedBy noteId: " + noteId + " submittedBy: " + submittedBy);
        } catch (Exception e) {
            throw new EJBException("Exception in setSubmittedBy noteId: " + noteId + " submittedBy: " + submittedBy);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSubmittedBy");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSubmittedBy");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSubmittedBy");}}
        }
    }

    /**
     *
     * @param noteId
     * @param noteTypeId
     * @throws RemoteException
     */
    public void setNoteTypeId(long noteId, int noteTypeId)
            throws RemoteException {
        log.debug("setNoteTypeId called. noteId: "
                 + noteId + " noteTypeId: " + noteTypeId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE note set note_type_id = ? where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, noteTypeId);
            pstmt.setLong(2, noteId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in setNoteTypeId noteId: " + noteId + " noteTypeId: " + noteTypeId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setNoteTypeId noteId: " + noteId + " noteTypeId: " + noteTypeId);
        } catch (Exception e) {
            throw new EJBException("Exception in setNoteTypeId noteId: " + noteId + " noteTypeId: " + noteTypeId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setNoteTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setNoteTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setNoteTypeId");}}
        }
    }

    /**
     *
     * @param noteId
     * @return note text
     * @throws RemoteException
     */
    public String getText(long noteId)
            throws RemoteException {
        log.debug("getText called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String text = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT text from note where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, noteId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                text = rs.getString(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in getText noteId: " + noteId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getText noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getText noteId: " + noteId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getText");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getText");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getText");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getText");}}
        }

        return text;
    }

    /**
     *
     * @param noteId
     * @return submitter user id
     * @throws RemoteException
     */
    public long getSubmittedBy(long noteId)
            throws RemoteException {
        log.debug("getSubmittedBy called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long submittedBy = -1;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT submitted_by from note where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, noteId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                submittedBy = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in getSubmittedBy noteId: " + noteId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSubmittedBy noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSubmittedBy noteId: " + noteId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSubmittedBy");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSubmittedBy");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSubmittedBy");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSubmittedBy");}}
        }

        return submittedBy;
    }

    /**
     *
     * @param noteId
     * @return note type id
     * @throws RemoteException
     */
    public int getNoteTypeId(long noteId)
            throws RemoteException {
        log.debug("getNoteTypeId called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int noteTypeId = -1;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT note_type_id from note where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, noteId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                noteTypeId = rs.getInt(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in getNoteTypeId noteId: " + noteId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getNoteTypeId noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getNoteTypeId noteId: " + noteId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getNoteTypeId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getNoteTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getNoteTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getNoteTypeId");}}
        }

        return noteTypeId;
    }

    /**
     *
     * @param noteId
     * @return Note Type Description
     * @throws RemoteException
     */
    public String getNoteTypeDesc(long noteId)
            throws RemoteException {
        log.debug("getNoteTypeDesc called. noteId: " + noteId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String noteTypeDesc = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT note_type_desc from note where note_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, noteId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                noteTypeDesc = rs.getString(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException in getNoteTypeDesc noteId: " + noteId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getNoteTypeDesc noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in getNoteTypeDesc noteId: " + noteId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getNoteTypeDesc");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getNoteTypeDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getNoteTypeDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getNoteTypeDesc");}}
        }

        return noteTypeDesc;
    }
}