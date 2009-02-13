package com.topcoder.web.project.ejb.ProjectServices;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.project.common.*;

import javax.ejb.CreateException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

public class ProjectServicesBean implements SessionBean {
    private static Logger log = Logger.getLogger(ProjectServicesBean.class);
    public static final int ROLE_EXECUTIVE = 1;
    public static final int ROLE_MANAGER = 2;
    public static final int ROLE_DEVELOPER = 3;

    private static final String TAG = "ProjectServicesBean";

    protected SessionContext ctx;

    /**
     * Returns the tag to append to the default debug statement.
     * This may be overridden for verbose debugging.
     */
    protected String getTag() {
        return TAG;
    }

    protected static java.sql.Date convertDate(java.util.Date date) {
        if (date == null) return null;
        return new java.sql.Date(date.getTime());
    }

    public int validateLogin(String handle, String password) throws Exception {
        StringBuffer query = new StringBuffer(250);
        /***********************Informix*******************************/
        query.append(" SELECT user_id, handle, password");
        query.append(" FROM user");
        query.append(" WHERE handle=?");
        /**************************************************************/
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, handle);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (handle.equals(rs.getString(2)) &&
                        password.equals(rs.getString(3)))
                    return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":isValidLogin():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return -1;
    }

    public String getGroups(int user_id) throws Exception {
        StringBuffer query = new StringBuffer(250);
        /***********************Informix*******************************/
        query.append(" SELECT group_id");
        query.append(" FROM group_user");
        query.append(" WHERE user_id=? AND group_id <= 3");
        /**************************************************************/
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String strGroups = "";
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                strGroups += "[" + rs.getInt(1) + "]";
            }
            return strGroups;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getGroups():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
    }

    public int[] getIds(StringBuffer query, String params) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList ids = new ArrayList();

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                ids.add(new Integer(rs.getInt(1)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getIds():" + query + "(params:" + params + "):failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        Object[] IntegerArray = ids.toArray();
        int[] results = new int[IntegerArray.length];
        for (int i = 0; i < results.length; i++) {
            results[i] = ((Integer) IntegerArray[i]).intValue();
        }
        return results;
    }

    public HashMap getLookup(StringBuffer query) throws Exception {
        HashMap hm = new HashMap();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                hm.put(new Integer(rs.getInt(1)),
                        rs.getString(2));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getProjectStatuses():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return hm;
    }

    public HashMap getReverseLookup(StringBuffer query) throws Exception {
        HashMap hm = new HashMap();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                hm.put(rs.getString(1),
                        new Integer(rs.getInt(2)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getProjectStatuses():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return hm;
    }

    //************************************************************************
    //******************** PROJECT *******************************************
    //************************************************************************
    public Project getProjectById(int projectId) throws RemoteException, Exception {
        Project project = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" project_id,");
        query.append(" name,");
        query.append(" project_desc,");
        query.append(" start_date,");
        query.append(" deadline_date,");
        query.append(" status_id,");
        query.append(" creation_date,");
        query.append(" modify_date,");
        query.append(" completion_date,");
        query.append(" tech_lead");
        query.append(" FROM project WHERE project_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            rs = ps.executeQuery();
            if (rs.next()) {
                project = new Project();
                project.setProject_id(rs.getInt(1));
                if (rs.wasNull()) {
                    project.setProject_id(0);
                }
                project.setName(rs.getString(2));
                if (rs.wasNull()) {
                    project.setName("");
                }
                project.setProject_desc(rs.getString(3));
                if (rs.wasNull()) {
                    project.setProject_desc("");
                }
                project.setStart_date(rs.getDate(4));
                if (rs.wasNull()) {
                    project.setStart_date(null);
                }
                project.setDeadline_date(rs.getDate(5));
                if (rs.wasNull()) {
                    project.setDeadline_date(null);
                }
                project.setStatus_id(rs.getInt(6));
                if (rs.wasNull()) {
                    project.setStatus_id(0);
                }
                project.setCreation_date(rs.getDate(7));
                if (rs.wasNull()) {
                    project.setCreation_date(null);
                }
                project.setModify_date(rs.getDate(8));
                if (rs.wasNull()) {
                    project.setModify_date(null);
                }
                project.setCompletion_date(rs.getDate(9));
                if (rs.wasNull()) {
                    project.setCompletion_date(null);
                }
                project.setTech_lead(rs.getInt(10));
                if (rs.wasNull()) {
                    project.setTech_lead(0);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProject():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return project;
    }

    public ArrayList getProjects(int role, int userId, int statusId) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project.project_id,");
        query.append(" project.name,");
        query.append(" project.project_desc,");
        query.append(" project.start_date,");
        query.append(" project.deadline_date,");
        query.append(" project.status_id,");
        query.append(" project.creation_date,");
        query.append(" project.modify_date,");
        query.append(" project.completion_date,");
        query.append(" project.tech_lead");
        if (role != ROLE_EXECUTIVE) {
            query.append(" FROM project, project_user WHERE ");
            query.append(" project.project_id = project_user.project_id");
            query.append(" AND project_user.role_id = ?");
            query.append(" AND project_user.user_id = ?");
            params = "" + role;
            params += "," + userId;
            if (statusId > 0) {
                query.append(" AND project.status_id=?");
                params += "," + statusId;
            }
        } else {
            query.append(" FROM project");
            if (statusId > 0) {
                query.append(" WHERE project.status_id=?");
                params += "" + statusId;
            }
        }
        return getProjects(query, params);
    }

    public ArrayList getProjects(int role, int userId, int statusId, String orderBy) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project.project_id,");
        query.append(" project.name,");
        query.append(" project.project_desc,");
        query.append(" project.start_date,");
        query.append(" project.deadline_date,");
        query.append(" project.status_id,");
        query.append(" project.creation_date,");
        query.append(" project.modify_date,");
        query.append(" project.completion_date,");
        query.append(" project.tech_lead,");
        query.append(" status_lu.status_desc");
        if (role != ROLE_EXECUTIVE) {
            query.append(" FROM project, project_user, status_lu WHERE ");
            query.append(" project.project_id = project_user.project_id");
            query.append(" AND project.status_id = status_lu.status_id");
            query.append(" AND project_user.role_id = ?");
            query.append(" AND project_user.user_id = ?");
            params = "" + role;
            params += "," + userId;
            if (statusId > 0) {
                query.append(" AND project.status_id=?");
                params += "," + statusId;
            }
        } else {
            query.append(" FROM project, status_lu");
            query.append(" WHERE project.status_id = status_lu.status_id");
            if (statusId > 0) {
                query.append(" AND project.status_id=?");
                params += "" + statusId;
            }
        }
        if (orderBy.endsWith("_Name")) {
            query.append(" ORDER BY project.name");
        }
        if (orderBy.endsWith("_StartDate")) {
            query.append(" ORDER BY project.start_date");
        }
        if (orderBy.endsWith("_DeadlineDate")) {
            query.append(" ORDER BY project.deadline_date");
        }
        if (orderBy.endsWith("_Status")) {
            query.append(" ORDER BY status_lu.status_desc");
        }
        if (orderBy.startsWith("A")) {
            query.append(" ASC");
        } else {
            query.append(" DESC");
        }
        return getProjects(query, params);
    }

    private ArrayList getProjects(StringBuffer query, String params) throws RemoteException, Exception {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setProject_id(rs.getInt(1));
                project.setName(rs.getString(2));
                project.setProject_desc(rs.getString(3));
                project.setStart_date(rs.getDate(4));
                project.setDeadline_date(rs.getDate(5));
                project.setStatus_id(rs.getInt(6));
                project.setCreation_date(rs.getDate(7));
                project.setModify_date(rs.getDate(8));
                project.setCompletion_date(rs.getDate(9));
                project.setTech_lead(rs.getInt(10));
                results.add(project);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjects():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return results;
    }

    public void setProject(Project project) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        try {
            conn = DBMS.getConnection();
            query.append(" UPDATE project SET ");
            //query.append(" project_id=?,");
            query.append(" name=?,");
            query.append(" project_desc=?,");
            query.append(" start_date=?,");
            query.append(" deadline_date=?,");
            query.append(" status_id=?,");
            //query.append(" creation_date=?,");
            query.append(" modify_date=current,");
            query.append(" completion_date=?,");
            query.append(" tech_lead=?");
            query.append(" WHERE project_id=?");
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, project.getName());
            //if (project.getName() != null) {
            //StringBufferInputStream is = new StringBufferInputStream(project.getName());
            //ps.setAsciiStream(2, is, project.getName().length() );
            //} else ps.setNull(2, java.sql.Types.LONGVARCHAR );
            ps.setString(2, project.getProject_desc());
            //if (project.getProject_desc() != null) {
            //StringBufferInputStream is = new StringBufferInputStream(project.getProject_desc());
            //ps.setAsciiStream(3, is, project.getProject_desc().length() );
            //} else ps.setNull(3, java.sql.Types.LONGVARCHAR );
            if (project.getStart_date() == null) {
                ps.setNull(3, java.sql.Types.DATE);
            } else {
                ps.setDate(3, convertDate(project.getStart_date()));
            }
            if (project.getDeadline_date() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, convertDate(project.getDeadline_date()));
            }
            ps.setInt(5, project.getStatus_id());
            /*
            if (project.getCreation_date() == null) {
                ps.setNull(7, java.sql.Types.DATE);
            } else {
                ps.setDate(7, convertDate(project.getCreation_date()));
            }
             */
            /*
            if (project.getModify_date() == null) {
                ps.setNull(8, java.sql.Types.DATE);
            } else {
                ps.setDate(8, convertDate(project.getModify_date()));
            }
             */
            if (project.getCompletion_date() == null) {
                ps.setNull(6, java.sql.Types.DATE);
            } else {
                ps.setDate(6, convertDate(project.getCompletion_date()));
            }
            ps.setInt(7, project.getTech_lead());
            ps.setInt(8, project.getProject_id());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setProject():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("setProject():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
    }

    public int addProject(Project project) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO project (");
        query.append(" project_id,");
        query.append(" name,");
        query.append(" project_desc,");
        query.append(" start_date,");
        query.append(" deadline_date,");
        query.append(" status_id,");
        query.append(" creation_date,");
        query.append(" modify_date,");
        query.append(" completion_date,");
        query.append(" tech_lead");
        query.append(") VALUES (");
        query.append("?,?,?,?,?,?,current,current,?,?)");
        int projectKey = 0;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            projectKey = DBMS.getSeqId(conn, DBMS.PT_PROJ_SEQ);
            ps.setInt(1, projectKey);
            ps.setString(2, project.getName());
            //if (project.getName() != null) {
            //StringBufferInputStream is = new StringBufferInputStream(project.getname());
            //ps.setAsciiStream(2, is, project.getName().length() );
            //} else ps.setNull(2, java.sql.Types.LONGVARCHAR );
            ps.setString(3, project.getProject_desc());
            //if (project.getProject_desc() != null) {
            //StringBufferInputStream is = new StringBufferInputStream(project.getproject_desc());
            //ps.setAsciiStream(3, is, project.getProject_desc().length() );
            //} else ps.setNull(3, java.sql.Types.LONGVARCHAR );
            if (project.getStart_date() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, convertDate(project.getStart_date()));
            }
            if (project.getDeadline_date() == null) {
                ps.setNull(5, java.sql.Types.DATE);
            } else {
                ps.setDate(5, convertDate(project.getDeadline_date()));
            }
            ps.setInt(6, project.getStatus_id());
            /*
            if (project.getCreation_date() == null) {
                ps.setNull(7, java.sql.Types.DATE);
            } else {
                ps.setDate(7, convertDate(project.getCreation_date()));
            }
            if (project.getModify_date() == null) {
                ps.setNull(8, java.sql.Types.DATE);
            } else {
                ps.setDate(8, convertDate(project.getModify_date()));
            }
             */
            if (project.getCompletion_date() == null) {
                ps.setNull(7, java.sql.Types.DATE);
            } else {
                ps.setDate(7, convertDate(project.getCompletion_date()));
            }
            ps.setInt(8, project.getTech_lead());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addProject():did not update record:\n");
            } else {
                return projectKey;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addProject():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
    }

    public void removeProject(int projectId) throws RemoteException, Exception {
    }

    //************************************************************************
    //******************** PROJECT TASK ************************************
    //************************************************************************

    public ProjectTask getProjectTaskById(int projectTaskId) throws RemoteException, Exception {
        ProjectTask project_task = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" project_task_id,");
        query.append(" project_id,");
        query.append(" name,");
        query.append(" project_task_desc,");
        query.append(" start_date,");
        query.append(" end_date,");
        query.append(" status_id,");
        query.append(" milestone,");
        query.append(" creation_date,");
        query.append(" modify_date,");
        query.append(" completion_date");
        query.append(" FROM project_task WHERE project_task_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectTaskId);
            rs = ps.executeQuery();
            if (rs.next()) {
                project_task = new ProjectTask();
                project_task.setProject_task_id(rs.getInt(1));
                if (rs.wasNull()) {
                    project_task.setProject_task_id(0);
                }
                project_task.setProject_id(rs.getInt(2));
                if (rs.wasNull()) {
                    project_task.setProject_id(0);
                }
                project_task.setName(rs.getString(3));
                if (rs.wasNull()) {
                    project_task.setName("");
                }
                project_task.setProject_task_desc(rs.getString(4));
                if (rs.wasNull()) {
                    project_task.setProject_task_desc("");
                }
                project_task.setStart_date(rs.getDate(5));
                if (rs.wasNull()) {
                    project_task.setStart_date(null);
                }
                project_task.setEnd_date(rs.getDate(6));
                if (rs.wasNull()) {
                    project_task.setEnd_date(null);
                }
                project_task.setStatus_id(rs.getInt(7));
                if (rs.wasNull()) {
                    project_task.setStatus_id(0);
                }
                project_task.setMilestone(rs.getInt(8));
                if (rs.wasNull()) {
                    project_task.setMilestone(0);
                }
                project_task.setCreation_date(rs.getDate(9));
                if (rs.wasNull()) {
                    project_task.setCreation_date(null);
                }
                project_task.setModify_date(rs.getDate(10));
                if (rs.wasNull()) {
                    project_task.setModify_date(null);
                }
                project_task.setCompletion_date(rs.getDate(11));
                if (rs.wasNull()) {
                    project_task.setCompletion_date(null);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProject_Task():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return project_task;
    }

    public ArrayList getProjectTasks(int projectId, int statusId) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project_task_id,");
        query.append(" project_id,");
        query.append(" name,");
        query.append(" project_task_desc,");
        query.append(" start_date,");
        query.append(" end_date,");
        query.append(" status_id,");
        query.append(" milestone,");
        query.append(" creation_date,");
        query.append(" modify_date,");
        query.append(" completion_date");
        query.append(" FROM project_task");
        query.append(" WHERE project_id=?");
        params += "" + projectId;
        if (statusId > 0) {
            query.append(" AND status_id=?");
            params += "," + statusId;
        }
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectTask projectTask = new ProjectTask();
                projectTask.setProject_task_id(rs.getInt(1));
                projectTask.setProject_id(rs.getInt(2));
                projectTask.setName(rs.getString(3));
                projectTask.setProject_task_desc(rs.getString(4));
                projectTask.setStart_date(rs.getDate(5));
                projectTask.setEnd_date(rs.getDate(6));
                projectTask.setStatus_id(rs.getInt(7));
                projectTask.setMilestone(rs.getInt(8));
                projectTask.setCreation_date(rs.getDate(9));
                projectTask.setModify_date(rs.getDate(10));
                projectTask.setCompletion_date(rs.getDate(11));
                results.add(projectTask);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjectTasks():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    public ArrayList getProjectTasks(int projectId, int statusId, String orderBy) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project_task_id,");
        query.append(" project_id,");
        query.append(" TRIM(name) name,");
        query.append(" project_task_desc,");
        query.append(" start_date,");
        query.append(" end_date,");
        query.append(" project_task.status_id,");
        query.append(" milestone,");
        query.append(" creation_date,");
        query.append(" modify_date,");
        query.append(" completion_date,");
        query.append(" status_lu.status_desc");
        query.append(" FROM project_task LEFT OUTER JOIN status_lu ON project_task.status_id = status_lu.status_id");
        query.append(" WHERE project_id=?");
        params += "" + projectId;
        if (statusId > 0) {
            query.append(" AND project_task.status_id=?");
            params += "," + statusId;
        }
        if (orderBy.endsWith("_Name")) {
            query.append(" ORDER BY name");
        }
        if (orderBy.endsWith("_StartDate")) {
            query.append(" ORDER BY project_task.start_date");
        }
        if (orderBy.endsWith("_EndDate")) {
            query.append(" ORDER BY project_task.end_date");
        }
        if (orderBy.endsWith("_ModifyDate")) {
            query.append(" ORDER BY project_task.modify_date");
        }
        if (orderBy.endsWith("_CompletionDate")) {
            query.append(" ORDER BY project_task.completion_date");
        }
        if (orderBy.endsWith("_Status")) {
            query.append(" ORDER BY status_lu.status_desc");
        }
        if (orderBy.startsWith("A")) {
            query.append(" ASC");
        } else {
            query.append(" DESC");
        }

        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectTask projectTask = new ProjectTask();
                projectTask.setProject_task_id(rs.getInt(1));
                projectTask.setProject_id(rs.getInt(2));
                projectTask.setName(rs.getString(3));
                projectTask.setProject_task_desc(rs.getString(4));
                projectTask.setStart_date(rs.getDate(5));
                projectTask.setEnd_date(rs.getDate(6));
                projectTask.setStatus_id(rs.getInt(7));
                projectTask.setMilestone(rs.getInt(8));
                projectTask.setCreation_date(rs.getDate(9));
                projectTask.setModify_date(rs.getDate(10));
                projectTask.setCompletion_date(rs.getDate(11));
                results.add(projectTask);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjectTasks():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    public void setProjectTask(ProjectTask projectTask) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        try {
            conn = DBMS.getConnection();
            query.append(" UPDATE project_task SET ");
            //query.append(" project_task_id=?,");
            //query.append(" project_id=?,");
            query.append(" name=?,");
            query.append(" project_task_desc=?,");
            query.append(" start_date=?,");
            query.append(" end_date=?,");
            query.append(" status_id=?,");
            query.append(" milestone=?,");
            //query.append(" creation_date=?,");
            query.append(" modify_date=current,");
            query.append(" completion_date=?");
            query.append(" WHERE project_task_id=?");
            ps = conn.prepareStatement(query.toString());
            //ps.setInt(1, projectTask.getProject_id());
            ps.setString(1, projectTask.getName());
            ps.setString(2, projectTask.getProject_task_desc());
            //if (projectTask.getProject_task_desc() != null) {
            //ps.setBytes(2, DBMS.serializeTextString(projectTask.getProject_task_desc()));
            //} else ps.setNull(2, java.sql.Types.LONGVARCHAR );
            if (projectTask.getStart_date() == null) {
                ps.setNull(3, java.sql.Types.DATE);
            } else {
                ps.setDate(3, convertDate(projectTask.getStart_date()));
            }
            if (projectTask.getEnd_date() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, convertDate(projectTask.getEnd_date()));
            }
            ps.setInt(5, projectTask.getStatus_id());
            ps.setInt(6, projectTask.getMilestone());
            if (projectTask.getCompletion_date() == null) {
                ps.setNull(7, java.sql.Types.DATE);
            } else {
                ps.setDate(7, convertDate(projectTask.getCompletion_date()));
            }
            ps.setInt(8, projectTask.getProject_task_id());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setProject_Task():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("setProject_Task():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    public void addProjectTask(ProjectTask projectTask) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO project_task (");
        query.append(" project_task_id,");
        query.append(" project_id,");
        query.append(" name,");
        query.append(" project_task_desc,");
        query.append(" start_date,");
        query.append(" end_date,");
        query.append(" status_id,");
        query.append(" milestone,");
        query.append(" creation_date,");
        query.append(" modify_date,");
        query.append(" completion_date");
        query.append(") VALUES (");
        query.append("?,?,?,?,?,?,?,?,current,current,?)");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.getSeqId(DBMS.PT_PROJ_TASK_SEQ));
            ps.setInt(2, projectTask.getProject_id());
            ps.setString(3, projectTask.getName());
            ps.setString(4, projectTask.getProject_task_desc());
/*
            if (projectTask.getProject_task_desc() != null) {
            ps.setBytes(4, DBMS.serializeTextString(projectTask.getProject_task_desc()));
            } else ps.setNull(4, java.sql.Types.LONGVARCHAR );
 */
            if (projectTask.getStart_date() == null) {
                ps.setNull(5, java.sql.Types.DATE);
            } else {
                ps.setDate(5, convertDate(projectTask.getStart_date()));
            }
            if (projectTask.getEnd_date() == null) {
                ps.setNull(6, java.sql.Types.DATE);
            } else {
                ps.setDate(6, convertDate(projectTask.getEnd_date()));
            }
            ps.setInt(7, projectTask.getStatus_id());
            ps.setInt(8, projectTask.getMilestone());
            if (projectTask.getCompletion_date() == null) {
                ps.setNull(9, java.sql.Types.DATE);
            } else {
                ps.setDate(9, convertDate(projectTask.getCompletion_date()));
            }
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addProject_Task():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addProject_Task():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    //************************************************************************
    //******************** PROJECT ISSUE *************************************
    //************************************************************************

    public ProjectIssue getProjectIssueById(int projectIssueId) throws RemoteException, Exception {
        ProjectIssue project_issue = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" project_issue_id,");
        query.append(" project_id,");
        query.append(" issue_text,");
        query.append(" open_date,");
        query.append(" close_date");
        query.append(" FROM project_issue WHERE project_issue_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectIssueId);
            rs = ps.executeQuery();
            if (rs.next()) {
                project_issue = new ProjectIssue();
                project_issue.setProject_issue_id(rs.getInt(1));
                if (rs.wasNull()) {
                    project_issue.setProject_issue_id(0);
                }
                project_issue.setProject_id(rs.getInt(2));
                if (rs.wasNull()) {
                    project_issue.setProject_id(0);
                }
                project_issue.setIssue_text(rs.getString(3));
                if (rs.wasNull()) {
                    project_issue.setIssue_text("");
                }
                project_issue.setOpen_date(rs.getDate(4));
                if (rs.wasNull()) {
                    project_issue.setOpen_date(null);
                }
                project_issue.setClose_date(rs.getDate(5));
                if (rs.wasNull()) {
                    project_issue.setClose_date(null);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProject_Issue():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return project_issue;
    }

    public ArrayList getProjectIssues(int projectId) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project_issue_id,");
        query.append(" project_id,");
        query.append(" issue_text,");
        query.append(" open_date,");
        query.append(" close_date");
        query.append(" FROM project_issue WHERE (close_date IS NULL OR close_date = '') AND project_id=?");
        params += "" + projectId;
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectIssue projectIssue = new ProjectIssue();
                projectIssue.setProject_issue_id(rs.getInt(1));
                projectIssue.setProject_id(rs.getInt(2));
                projectIssue.setIssue_text(rs.getString(3));
                projectIssue.setOpen_date(rs.getDate(4));
                projectIssue.setClose_date(rs.getDate(5));
                results.add(projectIssue);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjectIssues():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    public void setProjectIssue(ProjectIssue projectIssue) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        try {
            conn = DBMS.getConnection();
            query.append(" UPDATE project_issue SET ");
            query.append(" project_id=?,");
            query.append(" issue_text=?,");
            query.append(" close_date=?");
            query.append(" WHERE project_issue_id=?");
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectIssue.getProject_id());
            if (projectIssue.getIssue_text() != null) {
                ps.setBytes(2, DBMS.serializeTextString(projectIssue.getIssue_text()));
            } else
                ps.setNull(2, java.sql.Types.LONGVARCHAR);
            if (projectIssue.getClose_date() == null) {
                ps.setNull(3, java.sql.Types.DATE);
            } else {
                ps.setDate(3, convertDate(projectIssue.getClose_date()));
            }
            ps.setInt(4, projectIssue.getProject_issue_id());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setProject_Issue():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("setProject_Issue():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    public void addProjectIssue(ProjectIssue projectIssue) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO project_issue (");
        query.append(" project_issue_id,");
        query.append(" project_id,");
        query.append(" issue_text,");
        query.append(" open_date,");
        query.append(" close_date");
        query.append(") VALUES (");
        query.append("?,?,?,current,?)");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.getSeqId(DBMS.PT_PROJ_ISSUE_SEQ));
            ps.setInt(2, projectIssue.getProject_id());
            if (projectIssue.getIssue_text() != null) {
                ps.setBytes(3, DBMS.serializeTextString(projectIssue.getIssue_text()));
            } else
                ps.setNull(3, java.sql.Types.LONGVARCHAR);
/*
            if (projectIssue.getOpen_date() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, convertDate(projectIssue.getOpen_date()));
            }
 */
            if (projectIssue.getClose_date() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, convertDate(projectIssue.getClose_date()));
            }
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addProject_Issue():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addProject_Issue():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    public ProjectUserUpdate getProjectUserUpdateById(int projectUserUpdateId) throws RemoteException, Exception {
        ProjectUserUpdate project_user_update = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" project_user_update_id,");
        query.append(" project_user_id,");
        query.append(" project_task_id,");
        query.append(" update_notes,");
        query.append(" creation_date,");
        query.append(" modify_date");
        query.append(" FROM project_user_update WHERE project_user_update_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectUserUpdateId);
            rs = ps.executeQuery();
            if (rs.next()) {
                project_user_update = new ProjectUserUpdate();
                project_user_update.setProject_user_update_id(rs.getInt(1));
                if (rs.wasNull()) {
                    project_user_update.setProject_user_update_id(0);
                }
                project_user_update.setProject_user_id(rs.getInt(2));
                if (rs.wasNull()) {
                    project_user_update.setProject_user_id(0);
                }
                project_user_update.setProject_task_id(rs.getInt(3));
                if (rs.wasNull()) {
                    project_user_update.setProject_task_id(0);
                }
                project_user_update.setUpdate_notes(DBMS.getTextString(rs, 4));
                if (rs.wasNull()) {
                    project_user_update.setUpdate_notes("");
                }
                project_user_update.setCreation_date(rs.getDate(5));
                if (rs.wasNull()) {
                    project_user_update.setCreation_date(null);
                }
                project_user_update.setModify_date(rs.getDate(6));
                if (rs.wasNull()) {
                    project_user_update.setModify_date(null);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProject_User_Update():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return project_user_update;
    }

    public void setProjectUserUpdate(ProjectUserUpdate projectUserUpdate) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        try {
            conn = DBMS.getConnection();
            query.append(" UPDATE project_user_update SET ");
            query.append(" update_notes=?,");
            query.append(" modify_date=current");
            query.append(" WHERE project_user_update_id=?");
            ps = conn.prepareStatement(query.toString());
            if (projectUserUpdate.getUpdate_notes() != null) {
                ps.setBytes(1, DBMS.serializeTextString(projectUserUpdate.getUpdate_notes()));
            } else
                ps.setNull(1, java.sql.Types.LONGVARCHAR);
            ps.setInt(2, projectUserUpdate.getProject_user_update_id());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setProject_User_Update():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("setProject_User_Update():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    public void addProjectUserUpdate(ProjectUserUpdate projectUserUpdate) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO project_user_update (");
        query.append(" project_user_update_id,");
        query.append(" project_user_id,");
        query.append(" project_task_id,");
        query.append(" update_notes,");
        query.append(" creation_date,");
        query.append(" modify_date");
        query.append(") VALUES (");
        query.append("?,?,?,?,current,current)");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.getSeqId(conn, DBMS.PT_PROJ_USR_UPDATE_SEQ));
            ps.setInt(2, projectUserUpdate.getProject_user_id());
            if (projectUserUpdate.getProject_task_id() == 0) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, projectUserUpdate.getProject_task_id());
            }
            if (projectUserUpdate.getUpdate_notes() != null) {
                ps.setBytes(4, DBMS.serializeTextString(projectUserUpdate.getUpdate_notes()));
            } else
                ps.setNull(4, java.sql.Types.LONGVARCHAR);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addProject_User_Update():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addProject_User_Update():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    public ArrayList getProjectUserUpdates(int projectId) throws RemoteException, Exception {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project_user_update.project_user_update_id,");
        query.append(" project_user_update.project_user_id,");
        query.append(" project_user_update.project_task_id,");
        query.append(" project_user_update.update_notes,");
        query.append(" project_user_update.creation_date,");
        query.append(" project_user_update.modify_date");
        query.append(" FROM project_user_update, project_user");
        query.append(" WHERE project_user_update.project_user_id = project_user.project_user_id AND project_user_update.project_task_id IS NULL AND project_user.project_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectUserUpdate puu = new ProjectUserUpdate();
                puu.setProject_user_update_id(rs.getInt(1));
                puu.setProject_user_id(rs.getInt(2));
                puu.setProject_task_id(rs.getInt(3));
                puu.setUpdate_notes(rs.getString(4));
                puu.setCreation_date(rs.getDate(5));
                puu.setModify_date(rs.getDate(6));
                results.add(puu);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjects():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    public ArrayList getProjectUserUpdates(int projectId, int projectTaskId) throws RemoteException, Exception {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project_user_update.project_user_update_id,");
        query.append(" project_user_update.project_user_id,");
        query.append(" project_user_update.project_task_id,");
        query.append(" project_user_update.update_notes,");
        query.append(" project_user_update.creation_date,");
        query.append(" project_user_update.modify_date");
        query.append(" FROM project_user_update, project_user");
        query.append(" WHERE project_user_update.project_user_id = project_user.project_user_id AND project_user.project_id=? AND project_user_update.project_task_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            ps.setInt(2, projectTaskId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectUserUpdate puu = new ProjectUserUpdate();
                puu.setProject_user_update_id(rs.getInt(1));
                puu.setProject_user_id(rs.getInt(2));
                puu.setProject_task_id(rs.getInt(3));
                puu.setUpdate_notes(rs.getString(4));
                puu.setCreation_date(rs.getDate(5));
                puu.setModify_date(rs.getDate(6));
                results.add(puu);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjects():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    //************************************************************************
    //*************************** PROJECT USER *******************************
    //************************************************************************

    public ProjectUser getProjectUserById(int projectUserId) throws RemoteException, Exception {
        ProjectUser project_user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" project_user_id,");
        query.append(" project_id,");
        query.append(" user_id,");
        query.append(" role_id,");
        query.append(" status_id");
        query.append(" FROM project_user WHERE project_user_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectUserId);
            rs = ps.executeQuery();
            if (rs.next()) {
                project_user = new ProjectUser();
                project_user.setProject_user_id(rs.getInt(1));
                if (rs.wasNull()) {
                    project_user.setProject_user_id(0);
                }
                project_user.setProject_id(rs.getInt(2));
                if (rs.wasNull()) {
                    project_user.setProject_id(0);
                }
                project_user.setUser_id(rs.getInt(3));
                if (rs.wasNull()) {
                    project_user.setUser_id(0);
                }
                project_user.setRole_id(rs.getInt(4));
                if (rs.wasNull()) {
                    project_user.setRole_id(0);
                }
                project_user.setStatus_id(rs.getInt(5));
                if (rs.wasNull()) {
                    project_user.setStatus_id(0);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProject_User():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return project_user;
    }

    public void setProjectUser(ProjectUser projectUser) throws RemoteException, Exception {
        // Not used
    }

    public void addProjectUser(ProjectUser projectUser) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO project_user (");
        query.append(" project_user_id,");
        query.append(" project_id,");
        query.append(" user_id,");
        query.append(" role_id,");
        query.append(" status_id");
        query.append(") VALUES (");
        query.append("?,?,?,?,?)");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.getSeqId(DBMS.PT_PROJ_USR_SEQ));
            ps.setInt(2, projectUser.getProject_id());
            ps.setInt(3, projectUser.getUser_id());
            ps.setInt(4, projectUser.getRole_id());
            ps.setInt(5, projectUser.getStatus_id());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addProject_User():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addProject_User():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    //************************************************************************
    //*************************** PROJECT USER TASK **************************
    //************************************************************************

    public ProjectUserTask getProjectUserTaskById(int projectUserTaskId) throws RemoteException, Exception {
        ProjectUserTask project_userTask = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" project_user_task_id,");
        query.append(" project_user_id,");
        query.append(" project_task_id,");
        query.append(" assign_date,");
        query.append(" status_id,");
        query.append(" FROM project_user_task WHERE project_user_task_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectUserTaskId);
            rs = ps.executeQuery();
            if (rs.next()) {
                project_userTask = new ProjectUserTask();
                project_userTask.setProject_user_task_id(rs.getInt(1));
                if (rs.wasNull()) {
                    project_userTask.setProject_user_task_id(0);
                }
                project_userTask.setProject_user_id(rs.getInt(2));
                if (rs.wasNull()) {
                    project_userTask.setProject_user_id(0);
                }
                project_userTask.setProject_task_id(rs.getInt(3));
                if (rs.wasNull()) {
                    project_userTask.setProject_task_id(0);
                }
                project_userTask.setAssign_date(rs.getDate(4));
                if (rs.wasNull()) {
                    project_userTask.setAssign_date(null);
                }
                project_userTask.setStatus_id(rs.getInt(5));
                if (rs.wasNull()) {
                    project_userTask.setStatus_id(0);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProject_User_Task():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return project_userTask;
    }

    public ArrayList getProjectUserTasks(int projectTaskId) throws RemoteException, Exception {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" project_user_task_id,");
        query.append(" project_user_id,");
        query.append(" project_task_id,");
        query.append(" assign_date,");
        query.append(" status_id");
        query.append(" FROM project_user_task");
        query.append(" WHERE project_user_task.project_task_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectTaskId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectUserTask put = new ProjectUserTask();
                put.setProject_user_task_id(rs.getInt(1));
                put.setProject_user_id(rs.getInt(2));
                put.setProject_task_id(rs.getInt(3));
                put.setAssign_date(rs.getDate(4));
                put.setStatus_id(rs.getInt(5));
                results.add(put);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjectUserTasks():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }


    public void setProjectUserTask(ProjectUserTask projectUserTask) throws RemoteException, Exception {
        // Not used
    }

    public void addProjectUserTask(ProjectUserTask projectUserTask) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO project_user_task (");
        query.append(" project_user_task_id,");
        query.append(" project_user_id,");
        query.append(" project_task_id,");
        query.append(" assign_date,");
        query.append(" status_id");
        query.append(") VALUES (");
        query.append("?,?,?,?,?)");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.getSeqId(DBMS.PT_PROJ_USR_TASK_SEQ));
            ps.setInt(2, projectUserTask.getProject_user_id());
            ps.setInt(3, projectUserTask.getProject_task_id());
            if (projectUserTask.getAssign_date() == null) {
                //ps.setNull(4, java.sql.Types.DATE);
                ps.setDate(4, convertDate(new java.util.Date()));
            } else {
                ps.setDate(4, convertDate(projectUserTask.getAssign_date()));
            }
            ps.setInt(5, projectUserTask.getStatus_id());
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addProject_User_Task():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addProject_User_Task():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("updateCoder cx NOT closed...");
                }
            }
        }
    }

    //************************************************************************
    //*************************** USER MESSAGE********************************
    //************************************************************************

    public UserMessage getUserMessageById(int user_messageId) throws RemoteException, Exception {
        UserMessage user_message = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" SELECT");
        query.append(" user_message_id,");
        query.append(" sender_id,");
        query.append(" receiver_id,");
        query.append(" sender_folder,");
        query.append(" receiver_folder,");
        query.append(" subject,");
        query.append(" message,");
        query.append(" sent_date,");
        query.append(" read_date");
        query.append(" FROM user_message WHERE user_message_id=?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, user_messageId);
            rs = ps.executeQuery();
            if (rs.next()) {
                user_message = new UserMessage();
                user_message.setUser_message_id(rs.getInt(1));
                if (rs.wasNull()) {
                    user_message.setUser_message_id(0);
                }
                user_message.setSender_id(rs.getInt(2));
                if (rs.wasNull()) {
                    user_message.setSender_id(0);
                }
                user_message.setReceiver_id(rs.getInt(3));
                if (rs.wasNull()) {
                    user_message.setReceiver_id(0);
                }
                user_message.setSender_folder(rs.getInt(4));
                if (rs.wasNull()) {
                    user_message.setSender_folder(0);
                }
                user_message.setReceiver_folder(rs.getInt(5));
                if (rs.wasNull()) {
                    user_message.setReceiver_folder(0);
                }
                user_message.setSubject(rs.getString(6));
                if (rs.wasNull()) {
                    user_message.setSubject("");
                }
                user_message.setMessage(DBMS.getTextString(rs, 7));
                //if (rs.wasNull()) { user_message.setMessage(""); }
                user_message.setSent_date(rs.getDate(8));
                if (rs.wasNull()) {
                    user_message.setSent_date(null);
                }
                user_message.setRead_date(rs.getDate(9));
                if (rs.wasNull()) {
                    user_message.setRead_date(null);
                }
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getUser_Message():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return user_message;
    }

    public ArrayList getUserMessages(int senderId, int receiverId, int senderFolder, int receiverFolder) throws RemoteException, Exception {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" user_message_id,");
        query.append(" sender_id,");
        query.append(" receiver_id,");
        query.append(" sender_folder,");
        query.append(" receiver_folder,");
        query.append(" subject,");
        query.append(" message,");
        query.append(" sent_date,");
        query.append(" read_date");
        query.append(" FROM User_Message WHERE ");
        String strWhere = "";
        if (senderId != 0) {
            strWhere += "sender_id=? AND ";
            params += "" + senderId + ",";
        }
        if (receiverId != 0) {
            strWhere += "receiver_id=? AND ";
            params += "" + receiverId + ",";
        }
        if (senderFolder != 0) {
            strWhere += "sender_folder=? AND ";
            params += "" + senderFolder + ",";
        }
        if (receiverFolder != 0) {
            strWhere += "receiver_folder=? AND ";
            params += "" + receiverFolder + ",";
        }
        if (strWhere.endsWith(" AND ")) strWhere = strWhere.substring(0, strWhere.length() - 5);
        if (params.endsWith(",")) params = params.substring(0, params.length() - 1);
        System.out.println("getUserMessages(): query is '" + query.toString() + "' with strWhere '" + strWhere + "' and params '" + params + "'");
        query.append(strWhere);
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                UserMessage um = new UserMessage();
                um.setUser_message_id(rs.getInt(1));
                um.setSender_id(rs.getInt(2));
                um.setReceiver_id(rs.getInt(3));
                um.setSender_folder(rs.getInt(4));
                um.setReceiver_folder(rs.getInt(5));
                um.setSubject(rs.getString(6));
                um.setMessage(rs.getString(7));
                um.setSent_date(rs.getDate(8));
                um.setRead_date(rs.getDate(9));
                results.add(um);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjects():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    public ArrayList getUserMessages(int senderId, int receiverId, int senderFolder, int receiverFolder, String orderBy) throws RemoteException, Exception {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(250);
        String params = "";
        query.append(" SELECT");
        query.append(" user_message_id,");
        query.append(" sender_id,");
        query.append(" receiver_id,");
        query.append(" sender_folder,");
        query.append(" receiver_folder,");
        query.append(" subject,");
        query.append(" message,");
        query.append(" sent_date,");
        query.append(" read_date,");
        query.append(" user1.handle,");
        query.append(" user2.handle");
        query.append(" FROM User_Message, user user1, user user2 WHERE ");
        query.append(" user_message.sender_id = user1.user_id AND ");
        query.append(" user_message.receiver_id = user2.user_id AND ");
        String strWhere = "";
        if (senderId != 0) {
            strWhere += "sender_id=? AND ";
            params += "" + senderId + ",";
        }
        if (receiverId != 0) {
            strWhere += "receiver_id=? AND ";
            params += "" + receiverId + ",";
        }
        if (senderFolder != 0) {
            strWhere += "sender_folder=? AND ";
            params += "" + senderFolder + ",";
        }
        if (receiverFolder != 0) {
            strWhere += "receiver_folder=? AND ";
            params += "" + receiverFolder + ",";
        }
        if (strWhere.endsWith(" AND ")) strWhere = strWhere.substring(0, strWhere.length() - 5);
        if (params.endsWith(",")) params = params.substring(0, params.length() - 1);
        System.out.println("getUserMessages(): query is '" + query.toString() + "' with strWhere '" + strWhere + "' and params '" + params + "'");
        query.append(strWhere);
        if (orderBy.endsWith("_SenderHandle")) {
            query.append(" ORDER BY user1.handle");
        }
        if (orderBy.endsWith("_ReceiverHandle")) {
            query.append(" ORDER BY user2.handle");
        }
        if (orderBy.endsWith("_SentDate")) {
            query.append(" ORDER BY user_message.sent_date");
        }
        if (orderBy.endsWith("_ReadDate")) {
            query.append(" ORDER BY user_message.read_date");
        }
        if (orderBy.startsWith("A")) {
            query.append(" ASC");
        } else {
            query.append(" DESC");
        }
        System.out.println("getUserMessages(): query is '" + query.toString() + "'");

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (params.length() > 0) {
                StringTokenizer st = new StringTokenizer(params, ",");
                int numTokens = st.countTokens();
                for (int i = 0; i < numTokens; i++) {
                    int idx = i + 1;
                    ps.setInt(idx, Integer.parseInt(st.nextToken()));
                }
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                UserMessage um = new UserMessage();
                um.setUser_message_id(rs.getInt(1));
                um.setSender_id(rs.getInt(2));
                um.setReceiver_id(rs.getInt(3));
                um.setSender_folder(rs.getInt(4));
                um.setReceiver_folder(rs.getInt(5));
                um.setSubject(rs.getString(6));
                um.setMessage(rs.getString(7));
                um.setSent_date(rs.getDate(8));
                um.setRead_date(rs.getDate(9));
                results.add(um);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(getTag() + ":getProjects():failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("loadCoder cx NOT closed...");
                }
            }
        }
        return results;
    }

    public void setUserMessage(UserMessage user_message) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        try {
            conn = DBMS.getConnection();
            query.append(" UPDATE user_message SET ");
            query.append(" user_message_id=?,");
            query.append(" sender_id=?,");
            query.append(" receiver_id=?,");
            query.append(" sender_folder=?,");
            query.append(" receiver_folder=?,");
            query.append(" subject=?,");
            query.append(" message=?,");
            query.append(" sent_date=?,");
            query.append(" read_date=?,");
            query.append(" WHERE User_Message=?");
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, user_message.getUser_message_id());
            ps.setInt(2, user_message.getSender_id());
            ps.setInt(3, user_message.getReceiver_id());
            ps.setInt(4, user_message.getSender_folder());
            ps.setInt(5, user_message.getReceiver_folder());
            ps.setString(6, user_message.getSubject());
            //if (user_message.getSubject() != null) {
            //StringBufferInputStream is = new StringBufferInputStream(user_message.getSubject());
            //ps.setAsciiStream(6, is, user_message.getSubject().length() );
            //} else ps.setNull(6, java.sql.Types.LONGVARCHAR );
            //ps.setString(7, user_message.getMessage());
            if (user_message.getMessage() != null) {
                ps.setBytes(7, DBMS.serializeTextString(user_message.getMessage()));
            } else
                ps.setNull(7, java.sql.Types.LONGVARCHAR);
            if (user_message.getSent_date() == null) {
                ps.setNull(8, java.sql.Types.DATE);
            } else {
                ps.setDate(8, convertDate(user_message.getSent_date()));
            }
            if (user_message.getRead_date() == null) {
                ps.setNull(9, java.sql.Types.DATE);
            } else {
                ps.setDate(9, convertDate(user_message.getRead_date()));
            }
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setUser_Message():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("setUser_Message():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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

    public void addUserMessage(UserMessage user_message) throws RemoteException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT INTO user_message (");
        query.append(" user_message_id,");
        query.append(" sender_id,");
        query.append(" receiver_id,");
        query.append(" sender_folder,");
        query.append(" receiver_folder,");
        query.append(" subject,");
        query.append(" message,");
        query.append(" sent_date,");
        query.append(" read_date");
        query.append(") VALUES (");
        query.append("?,?,?,?,?,?,?,current,?)");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.getSeqId(conn, DBMS.PT_USR_MESSAGE_SEQ));
            ps.setInt(2, user_message.getSender_id());
            ps.setInt(3, user_message.getReceiver_id());
            ps.setInt(4, user_message.getSender_folder());
            ps.setInt(5, user_message.getReceiver_folder());
            ps.setString(6, user_message.getSubject());
            //if (user_message.getSubject() != null) {
            //StringBufferInputStream is = new StringBufferInputStream(user_message.getSubject());
            //ps.setAsciiStream(6, is, user_message.getSubject().length() );
            //} else ps.setNull(6, java.sql.Types.LONGVARCHAR );
            //ps.setString(7, user_message.getMessage());
            if (user_message.getMessage() != null) {
                ps.setBytes(7, DBMS.serializeTextString(user_message.getMessage()));
            } else
                ps.setNull(7, java.sql.Types.LONGVARCHAR);
/*
            if (user_message.getSent_date() == null) {
                ps.setNull(8, java.sql.Types.DATE);
            } else {
                ps.setDate(8, convertDate(user_message.getSent_date()));
            }
 */
            ps.setNull(8, java.sql.Types.DATE);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("addUser_Message():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("addUser_Message():failed:" + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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

    public void setReceiverUserMessageFolder(int messageId, int folderId) {
        StringBuffer query = new StringBuffer(250);

        query.append("UPDATE ");
        query.append(" user_message");
        query.append(" SET");
        query.append(" receiver_folder=?");
        query.append(" WHERE");
        query.append(" user_message_id=?");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, folderId);
            ps.setInt(2, messageId);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setReceiverUserMessageFolder():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

    public void setSenderUserMessageFolder(int messageId, int folderId) {
        StringBuffer query = new StringBuffer(250);
        query.append("UPDATE ");
        query.append(" user_message");
        query.append(" SET");
        query.append(" sender_folder=?");
        query.append(" WHERE");
        query.append(" user_message_id=?");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, folderId);
            ps.setInt(2, messageId);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setSenderUserMessageFolder():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

    public void setMessageReadDate(int messageId, java.util.Date dateIn) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);
        query.append("UPDATE ");
        query.append(" user_message");
        query.append(" SET");
        query.append(" read_date=?");
        query.append(" WHERE");
        query.append(" user_message_id=?");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (dateIn == null) {
                ps.setNull(1, java.sql.Types.DATE);
            } else {
                ps.setDate(1, convertDate(dateIn));
            }
            ps.setInt(2, messageId);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("setMessageReadDate():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

    public void loginMember(int loginId, int user_id, String messageIn) {
        StringBuffer query = new StringBuffer(250);

        query.append("INSERT INTO login");
        query.append(" (login_id, user_id, login_date, login_message)");
        query.append(" VALUES");
        query.append(" (?, ?, current, ?)");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, loginId);
            ps.setInt(2, user_id);
            ps.setString(3, messageIn);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("loginMember():did not insert record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

    public void logoutMember(int loginId, String messageIn) {
        StringBuffer query = new StringBuffer(250);

        query.append("UPDATE login");
        query.append(" SET logout_date=current, logout_message=?");
        query.append(" WHERE");
        query.append(" login_id=?");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, messageIn);
            ps.setInt(2, loginId);
            int regVal = ps.executeUpdate();
            if (regVal != 1) {
                throw new Exception("loginMember():did not update record:\n");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

    //************************************************************************
    //*************************** LOOKUPS ************************************
    //************************************************************************
    public int getUserId(int projectUserId) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        query.append("SELECT");
        query.append(" user_id");
        query.append(" FROM");
        query.append(" project_user");
        query.append(" WHERE");
        query.append(" project_user.project_user_id = ?");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectUserId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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
        return 0;
    }

    public int getProjectUserId(int userId, int projectId, int role) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        query.append("SELECT");
        query.append(" project_user_id");
        query.append(" FROM");
        query.append(" user, project_user");
        query.append(" WHERE");
        query.append(" user.user_id = project_user.user_id");
        query.append(" AND project_user.user_id = ?");
        query.append(" AND project_user.project_id = ?");
        query.append(" AND project_user.role_id = ?");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, userId);
            ps.setInt(2, projectId);
            ps.setInt(3, role);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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
        return 0;
    }

    public Integer[] getProjectUserIds(int projectId, int role) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        query.append("SELECT");
        query.append(" project_user_id");
        query.append(" FROM");
        query.append(" project_user");
        query.append(" WHERE");
        query.append(" project_id = ?");
        query.append(" AND role_id = ?");

        ArrayList al = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            ps.setInt(2, role);
            rs = ps.executeQuery();
            while (rs.next()) {
                al.add(new Integer(rs.getInt(1)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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
        return (Integer[]) al.toArray(new Integer[0]);
    }

    public Integer[] getProjectUserIds(int projectTaskId) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        query.append("SELECT");
        query.append(" project_user_id");
        query.append(" FROM");
        query.append(" project_user_task");
        query.append(" WHERE");
        query.append(" project_task_id = ?");

        ArrayList al = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectTaskId);
            rs = ps.executeQuery();
            while (rs.next()) {
                al.add(new Integer(rs.getInt(1)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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
        return (Integer[]) al.toArray(new Integer[0]);
    }

    public HashMap getProjectStatuses() throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        /***********************Informix*******************************/
        query.append(" SELECT");
        query.append(" status_id,");
        query.append(" status_desc");
        query.append(" FROM");
        query.append(" status_lu WHERE status_type_id=1 ORDER BY status_id");
        /**************************************************************/

        return getLookup(query);
    }

    public HashMap getProjectTaskStatuses() throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        /***********************Informix*******************************/
        query.append(" SELECT");
        query.append(" status_id,");
        query.append(" status_desc");
        query.append(" FROM");
        query.append(" status_lu WHERE status_type_id=2 ORDER BY status_id");
        /**************************************************************/

        return getLookup(query);
    }

    public HashMap getUsers() throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        /***********************Informix*******************************/
        query.append(" SELECT");
        query.append(" user_id");
        query.append(", handle");
        query.append(" FROM");
        query.append(" user");
        /**************************************************************/

        return getLookup(query);
    }

    public HashMap getUserIds() throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        /***********************Informix*******************************/
        query.append(" SELECT");
        query.append(" handle");
        query.append(", user_id");
        query.append(" FROM");
        query.append(" user");
        /**************************************************************/

        return getReverseLookup(query);
    }

    public HashMap getUsers(int group) throws RemoteException, Exception {
        StringBuffer query = new StringBuffer(250);

        /***********************Informix*******************************/
        query.append(" SELECT user.user_id,user.handle");
        query.append(" FROM user, group_user");
        query.append(" WHERE group_user.group_id=?");
        query.append(" AND user.user_id=group_user.user_id");
        /**************************************************************/

        HashMap hm = new HashMap();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, group);
            rs = ps.executeQuery();
            while (rs.next()) {
                hm.put(new Integer(rs.getInt(1)),
                        rs.getString(2));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new Exception(getTag()+":getUsers():failed:\n"+ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
        return hm;
    }

    //*************************************************************************
    //                                 EJB lifecycle
    //*************************************************************************

    public void ejbActivate() {
        System.out.println(getTag() + ":  ejbActivate called");
    }

    public void ejbPassivate() {
        System.out.println(getTag() + ":  ejbPassivate called");
    }

    public void ejbCreate() throws CreateException {
        System.out.println(getTag() + ":  ejbCreate called");
    }

    public void ejbRemove() throws RemoteException {
        System.out.println(getTag() + ":  ejbRemove called");
    }

    public void setSessionContext(SessionContext ctx) throws RemoteException {
        System.out.println(getTag() + ":  setSessionContext called");
        this.ctx = ctx;
    }

}
