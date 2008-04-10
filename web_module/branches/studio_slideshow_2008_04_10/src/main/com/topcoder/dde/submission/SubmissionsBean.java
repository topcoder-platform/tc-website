package com.topcoder.dde.submission;

import com.topcoder.util.idgenerator.bean.IdGenException;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.io.IOException;
import java.io.InputStream;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;

/**
 */
public class SubmissionsBean extends BaseBean {

    /**
     * Submits a new submission for the given submitter.
     * If a submission already exists, an additional
     * submission is created without overwriting the original.
     *
     * @param submitter_id the id of the submitter
     * @param submission the submission as it should be written to a file
     * @param comment comments by the submitter
     * @return the primary key id of the submission
     */
    public long submit(long submitter_id, InputStream submission, String comment) throws IOException, SQLException, NamingException, CreateException, IdGenException, RemoteException {

        Connection c = null;
        StringBuffer query = null;
        PreparedStatement ps = null;

        byte[] data = new byte[submission.available()];
        int read = submission.read(data);
        if (read != data.length) throw new IOException("Could not read submission fully.");

        try {
            c = getConnection();

            long id = getNewId();

            query = new StringBuffer(500);
            query.append("INSERT INTO submissions ");
            query.append("(submission_id, submitter_id, submission, comment, date) ");
            query.append("VALUES (?,?,?,?,?)");
            ps = c.prepareStatement(query.toString());
            ps.setLong(1, id);
            ps.setLong(2, submitter_id);
            ps.setBytes(3, data);
            if (comment == null)
                ps.setNull(4, Types.BLOB);
            else
                ps.setBytes(4, comment.getBytes());
            ps.setDate(5, new Date(System.currentTimeMillis()));
            ps.executeUpdate();

            if (!c.getAutoCommit()) c.commit();

            return id;
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (c != null) c.close();
            } catch (SQLException ignore) {
            }
        }
    }

    public Submission getSubmission(long submission_id) throws RemoteException, SQLException, SubmissionDoesNotExistException, NamingException {

        Connection c = null;
        StringBuffer query = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = getConnection();

            query = new StringBuffer(500);
            query.append("SELECT submitter_id, comment, submission, date FROM submissions WHERE ");
            query.append("submission_id=?");

            ps = getConnection().prepareStatement(query.toString());
            ps.setLong(1, submission_id);

            rs = ps.executeQuery();

            if (!rs.next()) throw new SubmissionDoesNotExistException();

            return new Submission(submission_id, rs.getLong(1), new String(rs.getBytes(2)), rs.getBytes(3), rs.getDate(4).getTime());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException ignore) {
            }
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (c != null) c.close();
            } catch (SQLException ignore) {
            }
        }
    }

    public Submission[] getSubmissions(long submitter_id) throws RemoteException, SQLException, NamingException {

        Connection c = null;
        StringBuffer query = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = getConnection();

            query = new StringBuffer(500);
            query.append("SELECT submission_id, comment, date FROM submissions WHERE ");
            query.append("submitter_id=? ORDER BY 3");

            ps = getConnection().prepareStatement(query.toString());
            ps.setLong(1, submitter_id);

            rs = ps.executeQuery();

            ArrayList list = new ArrayList();
            while (rs.next()) {
                list.add(new Submission(rs.getLong(1), submitter_id, new String(rs.getBytes(2)), null, rs.getDate(3).getTime()));
            }

            return (Submission[]) list.toArray(new Submission[0]);
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException ignore) {
            }
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (c != null) c.close();
            } catch (SQLException ignore) {
            }
        }
    }
}
