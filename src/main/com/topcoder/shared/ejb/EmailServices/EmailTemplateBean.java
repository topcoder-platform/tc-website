package com.topcoder.shared.ejb.EmailServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @see EmailTemplate
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 */
public class EmailTemplateBean extends BaseEJB {

    /**
     *
     */
    public void ejbCreate() {
    }

    private static Logger log = Logger.getLogger(EmailTemplateBean.class);


    /**
     *
     * @param group
     * @param name
     * @param data
     * @return
     * @throws RemoteException
     */
    public int createTemplate(int group, String name, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int id = 1;

        log.debug("Create template requested (group " + group + ", name " + name + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" EXECUTE PROCEDURE nextval(?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, EmailJobBean.EMAIL_TEMPLATE_SEQUENCE_ID);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
            rs.close();

            sqlStmt.setLength(0);
            sqlStmt.append(" INSERT INTO");
            sqlStmt.append(" email_template (");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_group_id");
            sqlStmt.append(",");
            sqlStmt.append(" data");
            sqlStmt.append(") VALUES (?,?,?,?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, group);
            ps.setBytes(4, data.getBytes());
            rows = ps.executeUpdate();
            if (rows != 1) {
                throw new Exception("insert command affected " + rows + " rows.");
            }
        } catch (Exception dberr) {
            String err = "Failed to create template";
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }

        return id;
    }

    /**
     *
     * @return
     * @throws RemoteException
     */
    public Map getTemplates() throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Map ret = new HashMap();

        log.debug("getTemplates requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            ps = conn.prepareStatement(sqlStmt.toString());
            rs = ps.executeQuery();
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get template names";
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }

        return ret;
    }

    /**
     *
     * @param groupId
     * @return
     * @throws RemoteException
     */
    public Map getTemplates(int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        Map ret = new HashMap();

        log.debug("getTemplates for group requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_id");
            sqlStmt.append(",");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_group_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, groupId);
            rs = ps.executeQuery();
            for (; rs.next();) {
                ret.put(new Integer(rs.getInt(1)), rs.getString(2));
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get template names for group " + groupId;
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }

        return ret;
    }

    /**
     *
     * @param templateId
     * @return
     * @throws RemoteException
     */
    public String getTemplateName(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = "";

        log.debug("getTemplateName requested for template " + templateId);

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_name");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            rs = ps.executeQuery();
            rs.next();
            ret = rs.getString(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for " + templateId;
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }

        return ret;
    }

    /**
     *
     * @param templateId
     * @return
     * @throws RemoteException
     */
    public int getTemplateGroupId(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int ret = 0;

        log.debug("getTemplateGroupId requested for template " + templateId);

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" email_template_group_id");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            rs = ps.executeQuery();
            rs.next();
            ret = rs.getInt(1);
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for " + templateId;
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }

        return ret;
    }

    /**
     *
     * @param templateId
     * @return
     * @throws RemoteException
     */
    public String getData(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        String ret = "";

        log.debug("getData for template requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" data");
            sqlStmt.append(" FROM");
            sqlStmt.append(" email_template");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            rs = ps.executeQuery();
            if (rs.next()) {
                byte[] bytes = rs.getBytes(1);
                if (bytes != null)
                    ret = new String(bytes);
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for template " + templateId;
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }

        return ret;
    }

    /**
     *
     * @param templateId
     * @return
     * @throws RemoteException
     */
    public boolean isInUse(int templateId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;
        int ret = 0;

        log.debug("isInUse for template requested");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" SELECT");
            sqlStmt.append(" COUNT(*)");
            sqlStmt.append(" FROM");
            sqlStmt.append(" sched_job s,");
            sqlStmt.append(" sched_email_job e");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" s.sched_job_id = e.sched_email_job_id");
            sqlStmt.append(" AND");
            sqlStmt.append(" e.email_template_id = ?");
            sqlStmt.append(" AND");
            sqlStmt.append(" (s.sched_job_status_id = ?");
            sqlStmt.append(" OR");
            sqlStmt.append("  s.sched_job_status_id = ?)");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, templateId);
            ps.setInt(2, EmailJobBean.JOB_STATUS_READY);
            ps.setInt(3, EmailJobBean.JOB_STATUS_ACTIVE);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getInt(1);
            }
            rs.close();
        } catch (Exception dberr) {
            String err = "Failed to get data for template " + templateId;
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }

        return (ret > 0);
    }

    /**
     *
     * @param templateId
     * @param groupId
     * @throws RemoteException
     */
    public void setGroupId(int templateId, int groupId) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("Update group id for template requested (template " + templateId + ", group " + groupId + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_template");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_template_group_id = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setInt(1, groupId);
            ps.setInt(2, templateId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("Update of template " + templateId
                        + " had no effect."
                        + " Most likely the template does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (id " + templateId + ", " + rows
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to update template";
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }
    }

    /**
     *
     * @param templateId
     * @param name
     * @throws RemoteException
     */
    public void setName(int templateId, String name) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("Update name for template requested (template " + templateId + ", name " + name + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_template");
            sqlStmt.append(" SET");
            sqlStmt.append(" email_template_name = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setString(1, name);
            ps.setInt(2, templateId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("Update of template " + templateId
                        + " had no effect."
                        + " Most likely the template does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (id " + templateId + ", " + rows
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to update template";
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ctxerr) {
                    log.error("Failed to close database context", ctxerr);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception connerr) {
                    log.error("Failed to close database connection", connerr);
                }
            }

        }
    }

    /**
     *
     * @param templateId
     * @param data
     * @throws RemoteException
     */
    public void setData(int templateId, String data) throws RemoteException {
        javax.naming.Context ctx = null;
        javax.sql.DataSource ds = null;
        java.sql.Connection conn = null;
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        StringBuffer sqlStmt = new StringBuffer(500);
        int rows;

        log.debug("Update data for template requested (template " + templateId + ")");

        try {
            ctx = new javax.naming.InitialContext();
            ds = (javax.sql.DataSource) ctx.lookup("TC_EMAIL");
            conn = ds.getConnection();

            sqlStmt.setLength(0);
            sqlStmt.append(" UPDATE");
            sqlStmt.append(" email_template");
            sqlStmt.append(" SET");
            sqlStmt.append(" data = ?");
            sqlStmt.append(" WHERE");
            sqlStmt.append(" email_template_id = ?");
            ps = conn.prepareStatement(sqlStmt.toString());
            ps.setBytes(1, data.getBytes());
            ps.setInt(2, templateId);
            rows = ps.executeUpdate();
            if (rows == 0) {
                log.debug("Update of template " + templateId
                        + " had no effect."
                        + " Most likely the template does not exist.");
                throw new Exception("update command affected " + rows + " rows.");
            } else {
                if (rows != 1) {
                    log.warn("Update request did not update just a single"
                            + " record (id " + templateId + ", " + rows
                            + " records updated).");
                }
            }
        } catch (Exception dberr) {
            String err = "Failed to update template";
            log.error(err, dberr);
        } finally {
            // Since the connections are pooled, make sure to close them in finally blocks
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("resultset close problem", ignore); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("prepared statement close problem", ignore); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("connection close problem", ignore); }
            try { if (ctx != null) ctx.close(); } catch (Exception ignore) { log.error("contet close problem", ignore); }
            rs = null;
            ps = null;
            conn = null;
            ctx = null;
        }
    }
}
