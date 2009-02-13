package com.topcoder.web.jobposting.ejb.JobPostingServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.sql.*;

/**
 * This class handles interaction with the database regarding Job Postings
 *
 * @author Greg Paul
 * @version  $Revision$
 */

public class JobPostingServicesBean extends BaseEJB {

    private static Logger log = Logger.getLogger(JobPostingServicesBean.class);

    /**
     * Given a user id, job id, and hit type, first checks if this user has already
     * "hit" this job, if so do nothing, else insert a row.
     * @param userId the user who clicked
     * @param jobId the particular job
     * @param hitTypeId the type of hit
     * @throws RemoteException if the wrong number of rows were inserted (most likely 0).
     * or if there was an issue with query execution.
     */
    public void addJobHit(int userId, int jobId, int hitTypeId) throws RemoteException {
        log.debug("addJobHit called...");
        StringBuffer query = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        query = new StringBuffer();
        query.append(" SELECT *");
        query.append(" FROM job_hit");
        query.append(" WHERE job_id = ?");
        query.append(" AND user_id = ?");
        query.append(" AND hit_type_id = ?");

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, jobId);
            ps.setInt(2, userId);
            ps.setInt(3, hitTypeId);
            rs = ps.executeQuery();
            /*
               check if this user has already "hit" this job
               if not, add their hit.
             */
            if (rs.next()) {
                log.debug("user_id: " + userId + " job_id: " + jobId + " hit_type_id: " + hitTypeId + " already exists.");
            } else {
                query = new StringBuffer();
                query.append(" INSERT");
                query.append(" INTO job_hit (job_id, user_id, hit_type_id, timestamp)");
                query.append(" VALUES (?, ?, ?, CURRENT)");
                ps = conn.prepareStatement(query.toString());
                ps.setInt(1, jobId);
                ps.setInt(2, userId);
                ps.setInt(3, hitTypeId);
                int rowCount = ps.executeUpdate();
                if (rowCount != 1) {
                    throw new Exception("Wrong number of rows inserted into job_hit: " + rowCount);
                }
            }
        } catch (SQLException se) {
            log.error("user_id: " + userId + " job_id: " + jobId + " hit_type_id: " + hitTypeId);
            DBMS.printSqlException(true, se);
            throw new RemoteException("JobPostingServicesBean.addJobHit(int, int, int):ERROR: " + se);
        } catch (Exception e) {
            throw new RemoteException(e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }

    }

    /**
     *
     * @param jobId
     * @return
     * @throws RemoteException
     */
    public String getLink(int jobId) throws RemoteException {
        log.debug("getLink called...");
        StringBuffer query = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String ret = null;

        query = new StringBuffer();
        query.append(" SELECT link");
        query.append(" FROM job");
        query.append(" WHERE job_id = ?");

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, jobId);
            rs = ps.executeQuery();

            if (rs.next()) {
                ret = rs.getString("link");
            } else {
                ret = "";
            }
        } catch (SQLException se) {
            DBMS.printSqlException(true, se);
            throw new RemoteException("JobPostingServicesBean.getLink(int):ERROR: " + se);
        } catch (Exception e) {
            throw new RemoteException(e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return ret;
    }
}
