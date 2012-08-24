package com.topcoder.dde.submission;

import com.topcoder.util.idgenerator.bean.IdGenException;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 */
public class SubmittersBean extends BaseBean {

    /**
     * Retrieves the submitter id for the given user,
     * component (by version), and phase.
     *
     * @param login_id the login id of the user
     * @param comp_ver_id the version id of the component
     * @param phase_id the phase id of the submission
     * @param create indicates whether or not to create
     * the submitter if one does not already exist
     * @return the submitter id
     * @throws SubmitterDoesNotExistException if the submitter
     * does not exist and should not be created
     */
    public long getSubmitterId(long login_id, long comp_ver_id, long phase_id, boolean create)
            throws SubmitterDoesNotExistException, RemoteException, SQLException, NamingException, CreateException, IdGenException {

        Connection c = null;
        StringBuffer query = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = getConnection();

            query = new StringBuffer(500);
            query.append("SELECT submitter_id FROM submitters WHERE ");
            query.append("login_id=? AND comp_version_id=? AND phase_id=?");

            ps = getConnection().prepareStatement(query.toString());
            ps.setLong(1, login_id);
            ps.setLong(2, comp_ver_id);
            ps.setLong(3, phase_id);

            rs = ps.executeQuery();

            if (!rs.next()) {
                if (create) {
                    rs.close();
                    rs = null;
                    ps.close();
                    ps = null;
                    long id = getNewId();
                    try {
                        query = new StringBuffer(500);
                        query.append("INSERT INTO submitters ");
                        query.append("(submitter_id, login_id, comp_version_id, phase_id) ");
                        query.append("VALUES (?,?,?,?)");
                        ps = c.prepareStatement(query.toString());
                        ps.setLong(1, id);
                        ps.setLong(2, login_id);
                        ps.setLong(3, comp_ver_id);
                        ps.setLong(4, phase_id);
                        ps.executeUpdate();
                        if (!c.getAutoCommit()) c.commit();
                        return id;
                    } finally {
                        try {
                            if (ps != null) ps.close();
                        } catch (SQLException ignore) {
                        }
                    }
                } else
                    throw new SubmitterDoesNotExistException();
            }

            return rs.getLong(1);
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

    public Submitter getSubmitter(long submitter_id) throws RemoteException, SQLException, SubmitterDoesNotExistException, NamingException {

        Connection c = null;
        StringBuffer query = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = getConnection();

            query = new StringBuffer(500);
            query.append("SELECT login_id, comp_version_id, phase_id FROM submitters WHERE ");
            query.append("submitter_id=?");

            ps = getConnection().prepareStatement(query.toString());
            ps.setLong(1, submitter_id);

            rs = ps.executeQuery();

            if (!rs.next()) throw new SubmitterDoesNotExistException();

            return new Submitter(submitter_id, rs.getLong(1), rs.getLong(2), rs.getLong(3));
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

    public List getSubmitters(Submitter filter) throws RemoteException, SQLException, NamingException {

        Connection c = null;
        StringBuffer query = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = getConnection();

            query = new StringBuffer(500);
            query.append("SELECT submitter_id, login_id, comp_version_id, phase_id FROM submitters WHERE ");
            query.append("1=1 ");

            if (filter.getSubmitterId() >= 0) query.append("AND submitter_id=? ");
            if (filter.getLoginId() >= 0) query.append("AND login_id=? ");
            if (filter.getComponentVersionId() >= 0) query.append("AND comp_version_id=? ");
            if (filter.getPhaseId() >= 0) query.append("AND phase_id=? ");

            ps = c.prepareStatement(query.toString());

            int pos = 1;
            if (filter.getSubmitterId() >= 0) ps.setLong(pos++, filter.getSubmitterId());
            if (filter.getLoginId() >= 0) ps.setLong(pos++, filter.getLoginId());
            if (filter.getComponentVersionId() >= 0) ps.setLong(pos++, filter.getComponentVersionId());
            if (filter.getPhaseId() >= 0) ps.setLong(pos++, filter.getPhaseId());

            rs = ps.executeQuery();

            List rv = new ArrayList();
            while (rs.next()) rv.add(new Submitter(rs.getLong(1), rs.getLong(2), rs.getLong(3), rs.getLong(4)));
            return rv;
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
