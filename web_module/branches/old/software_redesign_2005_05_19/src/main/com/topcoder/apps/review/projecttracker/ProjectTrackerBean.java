/*
 * ProjectTrackerBean.java
 *
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

/*
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.Forum;
*/

import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.review.StartDateCalculator;
import com.topcoder.apps.review.ConfigHelper;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.util.TCException;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;
import com.topcoder.project.phases.TCPhase;
import com.topcoder.apps.review.TCWorkdays;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;


/**
 * This is the concrete implementation of the ProjectTracker interface.
 *
 * @author TCSDeveloper
 */
public class ProjectTrackerBean implements SessionBean {
    private Log log;
    private SessionContext ejbContext;
    private DataSource dataSource;
    private DocumentManagerLocal documentManager;
    private IdGen idGen;
    //private ComponentManagerHome componentManagerHome;

    private void info(String msg) {
        try {
            log.log(Level.INFO, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void debug(String msg) {
        try {
            log.log(Level.DEBUG, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void error(String msg) {
        try {
            log.log(Level.ERROR, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    /**
     * Get a Project from the database, given a specific UserProjectInfo.
     *
     * @param projectInfo
     * @param requestor
     *
     * @return Project
     */
    public Project getProject(UserProjectInfo projectInfo, TCSubject requestor) {
        return getProjectById(projectInfo.getId(), requestor);
    }

    /**
     * Get a Project from the datbase, given a specific projectId.
     *
     * @param projectId
     * @param requestor
     *
     * @return Project
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public Project getProjectById(long projectId, TCSubject requestor) {
        info("PT.getProjectById(), projectId: " + projectId + ", requestId: " + requestor.getUserId());

        Project project = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement psForum = null;
        ResultSet rsForum = null;

        try {
            conn = dataSource.getConnection();

            // Find project with projectId
            ps = conn.prepareStatement(
                    "SELECT p.phase_instance_id, p.winner_id, " +
                    "p.overview, p.notes, " +
                    "p.project_type_id, p.project_stat_id, p.notification_sent, " +
                    "cc.component_name, cv.version_text, " +
                    "cv.component_id, " +
                    "p.project_v_id, " +
                    "cv.comp_vers_id, " +
                    "pcat.category_name catalog_name," +
                    "p.level_id, " +
                    "p.autopilot_ind  " +
                    "FROM project p, comp_versions cv, " +
                    "comp_catalog cc, " +
                    "comp_categories ccat, categories cat, categories pcat " +
                    "WHERE p.cur_version = 1 AND " +
                    "p.project_id = ? AND " +
                    "p.comp_vers_id = cv.comp_vers_id AND " +
                    "cv.component_id = cc.component_id AND " +
                    "ccat.component_id = cc.component_id AND " +
                    "cat.category_id = ccat.category_id AND " +
                    "pcat.category_id = cat.parent_category_id");

            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            if (rs.next()) {
                long phaseInstanceId = rs.getLong(1);
                long winnerId = rs.getLong(2);
                String overview = rs.getString(3);
                String notes = rs.getString(4);
                long projectTypeId = rs.getLong(5);
                long projectStatusId = rs.getLong(6);
                boolean notificationSent = rs.getBoolean(7);
                String name = rs.getString(8);
                String version = rs.getString(9).trim();
                long componentId = rs.getLong(10);
                long projectVersionId = rs.getLong(11);
                long compVersId = rs.getLong(12);
                String catalogName = rs.getString(13);
                long levelId = rs.getLong(14);
                boolean autopilot = rs.getBoolean(15);

                ProjectTypeManager projectTypeManager = (ProjectTypeManager) Common.getFromCache("ProjectTypeManager");
                ProjectType projectType = projectTypeManager.getProjectType(projectTypeId);

                ProjectStatusManager projectStatusManager = (ProjectStatusManager) Common.getFromCache("ProjectStatusManager");
                ProjectStatus projectStatus = projectStatusManager.getProjectStatus(projectStatusId);

                User winner = null;
                if (winnerId != 0) {
                    winner = Common.getUser(dataSource, winnerId);
                }
                PhaseInstance[] timeline = getPhaseInstances(projectId);

                PhaseInstance currentPhaseInstance = null;

                for (int i = 0; i < timeline.length; i++) {
                    if (timeline[i].getId() == phaseInstanceId) {
                        currentPhaseInstance = timeline[i];
                    }
                }

                if (currentPhaseInstance == null) {
                    throw new RuntimeException("Could not find valid currentPhaseInstance for project!");
                }

                UserRole[] userRole = getUserRoles(projectId);
                User projectmanager = null;
                for (int i = 0; i < userRole.length; i++) {
                    if (userRole[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                        projectmanager = userRole[i].getUser();
                        break;
                    }
                }


                long forumId = -1;
/*
                // Get forum id from ComponentManagerBean
                Context context = new InitialContext();
                ComponentManager componentManager = null;
                componentManager = componentManagerHome.create(componentId, compVersId);

                Forum forum = null;
                if (projectTypeId == ProjectType.ID_DESIGN) {
                    forum = componentManager.getActiveForum(Forum.COLLABORATION);
                } else {
                    forum = componentManager.getActiveForum(Forum.SPECIFICATION);
                }
                forumId = forum.getId();
*/

                // Get forum id with custom sql
                psForum = conn.prepareStatement(
                        "SELECT fm.forum_id " +
                        "FROM forum_master fm, comp_forum_xref cfx " +
                        "WHERE fm.forum_id = cfx.forum_id AND " +
                        "cfx.comp_vers_id = ? AND " +
                        "cfx.forum_type = 2 AND " + // TODO Hardcoded specification type
                        "fm.status_id = 1");

                psForum.setLong(1, compVersId);
                rsForum = psForum.executeQuery();
                if (rsForum.next()) {
                    forumId = rsForum.getLong(1);
                }
                info("PT.getProjectById(): forumId: " + forumId);

                info("PT.getProjectById(): forumId: " + forumId);

                long[] templateId = getProjectTemplates(projectId);

                project = new Project(projectId, componentId, forumId,
                        compVersId, name, version,
                        projectmanager, winner, timeline,
                        currentPhaseInstance, userRole, notes, overview, projectType,
                        projectStatus, notificationSent,
                        templateId[0], templateId[1],
                        requestor.getUserId(), projectVersionId, levelId, autopilot);
                project.setCatalog(catalogName);
/*
// Old project ( no forumId )
                   project = new Project(projectId, componentId,
                        compVersId, name, version,
                        projectmanager, winner, timeline,
                        currentPhaseInstance, userRole, notes, overview, projectType,
                        projectStatus, notificationSent, requestor.getUserId(),
                        projectVersionId);
*/
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
                /*
                 catch (NamingException e) {
                    throw new RuntimeException(e);
                } catch (RemoteException e) {
                    throw new RuntimeException(e);
                } catch (CreateException e) {
                    throw new RuntimeException(e);
                } catch (CatalogException e) {
                    throw new RuntimeException(e);
                }*/
        finally {
            Common.close(rsForum);
            Common.close(psForum);
            Common.close(conn, ps, rs);
        }

        return project;
    }

    /**
     * Retrieves the id of a project based on the component version id of a component and the project type
     * @param compVersId the component's component version id
     * @param projectType the project type (design or development)
     * @return the project id, -1 if no project exists
     */
    public long getProjectIdByComponentVersionId(long compVersId, long projectType) {

        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long projectId = -1;

        try {
            c = dataSource.getConnection();

            // Find projectId with compVersId and projectType
            ps = c.prepareStatement("SELECT project_id FROM project WHERE cur_version = 1 "
                    + "AND comp_vers_id = ? and project_type_id = ?");
            ps.setLong(1, compVersId);
            ps.setLong(2, projectType);
            rs = ps.executeQuery();

            if (rs.next())
                projectId = rs.getLong(1);
            else
                projectId = -1;

            rs.close();
            rs = null;
            ps.close();
            ps = null;
            c.close();
            c = null;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(c, ps, rs);
        }

        return projectId;
    }

    /**
     * Get an array of UserProjectInfo describing the different projects that the given user is involved in.
     *
     * @param user
     *
     * @return UserProjectInfo[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public UserProjectInfo[] getProjectInfo(TCSubject user) {
        info("PT.getProjectInfo( " + user.getUserId() + " )");

        LinkedList projectInfoList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            // TODO Extract isAdmin-method
            boolean isAdmin = false;
            try {
                Context ctx = new InitialContext();
                PolicyRemoteHome pHome = (PolicyRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
                        "java:comp/env/security/Policy"), PolicyRemoteHome.class);
                PolicyRemote policy = pHome.create();
                isAdmin = policy.checkPermission(user, new AdminPermission());
            } catch (Exception e1) {
                error("Exception when using policy manager: " + e1.toString());
                throw new RuntimeException(e1);
            }
            User plUser = Common.getUser(dataSource, user.getUserId());

            if (isAdmin) {
                // Find all open projects
                ps = conn.prepareStatement(
                        "SELECT p.project_id, p.project_type_id, " +
                        "cc.component_name, cv.version_text, p.winner_id, " +
                        "p.project_stat_id, " +
                        "pi.phase_instance_id, pi.phase_id, " +
                        "pi.start_date, pi.end_date, pi.phase_inst_v_id, " +
                        "pcat.category_name catalog_name, " +
                        "rur.r_user_role_id, rur.r_role_id, " +
                        "rur.payment_info_id, " +
                        "rur.r_resp_id, rur.login_id, " +
                        "rur.r_user_role_v_id, " +
                        "pinf.payment, pinf.payment_stat_id, " +
                        "pinf.payment_info_v_id " +
                        "FROM project p, phase_instance pi, " +
                        "comp_catalog cc, comp_versions cv, " +
                        "comp_categories ccat, categories cat, categories pcat, " +
                        "OUTER (r_user_role rur, OUTER payment_info pinf) " +
                        "WHERE p.cur_version = 1 AND " +
                        "pi.cur_version = 1 AND " +
                        "rur.cur_version = 1 AND " +
                        "p.phase_instance_id = pi.phase_instance_id AND " +
                        "rur.login_id = ? AND " +
                        "p.project_id = rur.project_id AND " +
                        "p.comp_vers_id = cv.comp_vers_id AND " +
                        "cv.component_id = cc.component_id AND " +
                        "p.project_stat_id in (1,3) AND " + // do not get terminated projects - BB
                        "ccat.component_id = cc.component_id AND " +
                        "cat.category_id = ccat.category_id AND " +
                        "pcat.category_id = cat.parent_category_id AND " +
                        "pinf.cur_version = 1 AND " +
                        "pinf.payment_info_id = rur.payment_info_id " +
                        "ORDER BY p.project_type_id, cc.component_name, rur.r_user_role_v_id");
                ps.setLong(1, user.getUserId());
            } else {
                // Find the projects that the user is involved in
                ps = conn.prepareStatement(
                        "SELECT p.project_id, p.project_type_id, " +
                        "cc.component_name, cv.version_text, p.winner_id, " +
                        "p.project_stat_id, " +
                        "pi.phase_instance_id, pi.phase_id, " +
                        "pi.start_date, pi.end_date, pi.phase_inst_v_id, " +
                        "pcat.category_name catalog_name, " +
                        "rur.r_user_role_id, rur.r_role_id, " +
                        "rur.payment_info_id, " +
                        "rur.r_resp_id, rur.login_id, " +
                        "rur.r_user_role_v_id, " +
                        "pinf.payment, pinf.payment_stat_id, " +
                        "pinf.payment_info_v_id " +
                        "FROM project p, phase_instance pi, " +
                        "r_user_role rur, " +
                        "comp_catalog cc, comp_versions cv, " +
                        "comp_categories ccat, categories cat, categories pcat, " +
                        "OUTER payment_info pinf " +
                        "WHERE p.cur_version = 1 AND " +
                        "pi.cur_version = 1 AND " +
                        "rur.cur_version = 1 AND " +
                        "p.phase_instance_id = pi.phase_instance_id AND " +
                        "rur.login_id = ? AND " +
                        "p.project_id = rur.project_id AND " +
                        "p.comp_vers_id = cv.comp_vers_id AND " +
                        "cv.component_id = cc.component_id AND " +
                        "p.project_stat_id in (1,3) AND " + // do not get terminated projects - BB
                        "ccat.component_id = cc.component_id AND " +
                        "cat.category_id = ccat.category_id AND " +
                        "pcat.category_id = cat.parent_category_id AND " +
                        "pinf.cur_version = 1 AND " +
                        "pinf.payment_info_id = rur.payment_info_id " +
                        "ORDER BY p.project_type_id, cc.component_name, rur.r_user_role_v_id");
                ps.setLong(1, user.getUserId());
            }
            rs = ps.executeQuery();
            long prevProjectId = -1;
            LinkedList userRoleList = new LinkedList();
            PhaseManager phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
            while (rs.next()) {
                long projectId = rs.getLong(1);
                if (prevProjectId != projectId) {
                    //info("New project found: " + projectId);
                    if (prevProjectId != -1) {
                        ((UserProjectInfo) projectInfoList.getLast()).setUserRoles(
                                (UserRole[]) userRoleList.toArray(new UserRole[0]));
                    }
                    prevProjectId = projectId;
                    userRoleList.clear();

                    long projectTypeId = rs.getLong(2);
                    String name = rs.getString(3);
                    String version = rs.getString(4).trim();
                    long winnerId = rs.getLong(5);
                    long projectStatId = rs.getLong(6);

                    long phaseInstanceId = rs.getLong(7);
                    long phaseId = rs.getLong(8);
                    Date startDate = rs.getDate(9);
                    Date endDate = rs.getDate(10);
                    long piVersionId = rs.getLong(11);
                    String catalogName = rs.getString(12);


                    Phase phase = phaseManager.getPhase(phaseId);

                    PhaseInstance phaseInstance = new PhaseInstance(phaseInstanceId, phase, startDate, endDate, piVersionId);

                    User winner = null;
                    if (winnerId != 0) {
                        winner = Common.getUser(dataSource, winnerId);
                    }

                    //userRole = getUserRoles(projectId, plUser);

                    ProjectTypeManager projectTypeManager = (ProjectTypeManager) Common.getFromCache("ProjectTypeManager");
                    ProjectType projectType = projectTypeManager.getProjectType(projectTypeId);

                    ProjectStatusManager projectStatusManager = (ProjectStatusManager) Common.getFromCache("ProjectStatusManager");
                    ProjectStatus projectStatus = projectStatusManager.getProjectStatus(projectStatId);

                    UserProjectInfo userProjectInfo = new UserProjectInfo(projectId, name, version, null,
                            phaseInstance, projectType, winner, projectStatus);
                    userProjectInfo.setCatalog(catalogName);

                    projectInfoList.add(userProjectInfo);
                }
                // Get UserRole
                long userRoleId = rs.getLong(13);
                if (userRoleId != 0) {
                    //info("New userrole found: " + userRoleId);
                    long rRoleId = rs.getLong(14);
                    long paymentInfoId = rs.getLong(15);
                    long rRespId = rs.getLong(16);
//                    long thisUserId = rs.getLong(17);
                    long rVersionId = rs.getLong(18);
                    float amount = rs.getFloat(19);
                    long paymentStatusId = rs.getLong(20);
                    long paymentVersionId = rs.getLong(21);

                    PaymentStatusManager paymentStatusManager = (PaymentStatusManager) Common.getFromCache(
                            "PaymentStatusManager");
                    PaymentStatus paymentStatus = paymentStatusManager.getPaymentStatus(paymentStatusId);

                    PaymentInfo paymentInfo = null;
                    if (paymentVersionId != 0) {
                        paymentInfo = new PaymentInfo(paymentInfoId, amount, paymentStatus, paymentVersionId);
                    }

                    RoleManager roleManager = (RoleManager) Common.getFromCache("RoleManager");
                    Role role = roleManager.getRole(rRoleId);

                    ReviewerResponsibilityManager respManager = (ReviewerResponsibilityManager) Common.getFromCache(
                            "ReviewerResponsibilityManager");
                    ReviewerResponsibility rResp = respManager.getResponsibility(rRespId);

                    UserRole userRole = new UserRole(userRoleId, role, plUser, paymentInfo, rResp, rVersionId);
                    userRoleList.add(userRole);
                }
            }
            if (!projectInfoList.isEmpty()) {
                ((UserProjectInfo) projectInfoList.getLast()).setUserRoles(
                        (UserRole[]) userRoleList.toArray(new UserRole[0]));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return (UserProjectInfo[]) projectInfoList.toArray(new UserProjectInfo[projectInfoList.size()]);
    }

    /**
     * Save a Project to the database.
     *
     * @param project
     * @param reason
     *
     * @throws InvalidEditException
     * @throws GeneralSecurityException
     */
    public void saveProject(Project project, String reason,
                            TCSubject requestor)
            throws InvalidEditException,
            GeneralSecurityException,
            ConcurrentModificationException {
        info("PT.saveProject( " + project.getId() + " )");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (project.getDirty() == true) {
                long oldPhaseId = 0;
                long oldStatusId = 0;

                try {
                    ps = conn.prepareStatement(
                            "SELECT p.project_v_id, pi.phase_id, p.project_stat_id " +
                            "FROM project p, phase_instance pi " +
                            "WHERE p.project_id = ? AND " +
                            "p.phase_instance_id = pi.phase_instance_id AND " +
                            "p.cur_version = 1 AND " +
                            "pi.cur_version = 1");
                    ps.setLong(1, project.getId());
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        if (rs.getLong(1) != project.getVersionId()) {
                            String errorMsg = "PT.saveProject(): Concurrent error, projectId: " + project.getId() +
                                    ", projectVersionId: " + project.getVersionId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new ConcurrentModificationException(errorMsg);
                        }
                    } else {
                        String errorMsg = "PT.saveProject(): Trying to save non-existing project, projectId: " + project.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    oldPhaseId = rs.getLong(2);
                    oldStatusId = rs.getLong(3);
                } finally {
                    Common.close(rs);
                    Common.close(ps);
                }

                try {
                    ps = conn.prepareStatement(
                            "UPDATE project " +
                            "SET cur_version = 0 " +
                            "WHERE project_id = ?");
                    ps.setLong(1, project.getId());

                    int nr = ps.executeUpdate();
                    info("PT.saveProject(): cur_version set to 0");

                    if (nr == 0) {
                        String errorMsg = "PT.saveProject(): Trying to save non-existing project, projectId: " + project.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                } finally {
                    Common.close(ps);
                }


                Phase currentPhase = null;

                try {
                    ps = conn.prepareStatement(
                            "INSERT INTO project " +
                            "(project_v_id, project_id, comp_vers_id, phase_instance_id, " +
                            "winner_id, overview, " +
                            "notes, project_type_id, project_stat_id, notification_sent, " +
                            "modify_user, modify_reason, level_id, autopilot_ind, " +
                            "cur_version) VALUES " +
                            "(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)");

                    PhaseInstance[] piArr = project.getTimeline();
                    currentPhase = project.getCurrentPhase();
                    long currentPhaseInstanceId = 0;

                    for (int i = 0; i < piArr.length; i++) {
                        if (currentPhase.getId() == piArr[i].getPhase().getId()) {
                            currentPhaseInstanceId = piArr[i].getId();
                        }
                    }

                    if (currentPhaseInstanceId == 0) {
                        String errorMsg = "PT.saveProject(): currentphase not valid!";
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }

                    info("PT.saveProject(): about to set parameters for insert");
                    if (Common.tooBig(project.getOverview()) ||
                            Common.tooBig(project.getNotes()) ||
                            Common.tooBig(reason)) {
                        String errorMsg = "PT.saveProject(), text-field too long!";
                        error(errorMsg);
                        throw new RuntimeException(errorMsg);
                    }
                    ps.setLong(1, project.getId());
                    ps.setLong(2, project.getCompVersId());
                    ps.setLong(3, currentPhaseInstanceId);
                    if (project.getWinner() == null) {
                        ps.setNull(4, Types.DECIMAL);
                    } else {
                        ps.setLong(4, project.getWinner().getId());
                    }
                    ps.setString(5, project.getOverview());
                    ps.setString(6, project.getNotes());
                    if (project.getProjectType() == null) {
                        String errorMsg = "PT.saveProject(),id: " + project.getId() +
                                "ProjectType is null";
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                    ps.setLong(7, project.getProjectType().getId());
                    if (project.getProjectStatus() == null) {
                        String errorMsg = "PT.saveProject(),id: " + project.getId() +
                                "ProjectStatus is null";
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                    ps.setLong(8, project.getProjectStatus().getId());
                    ps.setBoolean(9, project.isNotificationSent());
                    ps.setLong(10, project.getRequestorId());
                    ps.setString(11, reason);
                    ps.setLong(12, project.getLevelId());
                    ps.setBoolean(13, project.getAutoPilot());
                    int nr = ps.executeUpdate();

                    Common.close(ps);
                    ps = null;

                    if (nr != 1) {
                        String errorMsg = "PT.saveProject(): Could not insert project! , projectId: " + project.getId();
                        error(errorMsg);
                        ejbContext.setRollbackOnly();
                        throw new InvalidEditException(errorMsg);
                    }
                    info("PT.saveProject(): inserted new project version!");
                } finally {
                    Common.close(ps);
                }


                if (oldPhaseId != currentPhase.getId()) {
                    if (currentPhase.getId() == Phase.ID_AGGREGATION) {
                        info("PT.saveProject(), Creating Aggregation Worksheet");
                        documentManager.createAggregation(project);
                    } else if (currentPhase.getId() == Phase.ID_SCREENING ||
                            currentPhase.getId() == Phase.ID_REVIEW) {
                        info("PT.saveProject(), Selecting scorecard template for project");
                        int scorecardType;
                        long scorecardTemplateId;
                        if (currentPhase.getId() == Phase.ID_SCREENING) {
                            scorecardType = ScreeningScorecard.SCORECARD_TYPE;
                            scorecardTemplateId = project.getScreeningTemplateId();
                        } else {
                            scorecardType = ReviewScorecard.SCORECARD_TYPE;

                            scorecardTemplateId = project.getReviewTemplateId();
                        }

                        try {
                            ps = conn.prepareStatement(
                                    "SELECT pt.template_id " +
                                    "FROM project_template pt " +
                                    "WHERE pt.project_id = ? AND " +
                                    "pt.scorecard_type = ? ");
                            ps.setLong(1, project.getId());
                            ps.setInt(2, scorecardType);
                            rs = ps.executeQuery();
                            if (!rs.next()) {
/*
// The following code automatically selects
// a scorecard_template for the project
                            ps = conn.prepareStatement(
                                    "SELECT ct.template_id " +
                                    "FROM current_template ct " +
                                    "WHERE ct.project_type_id = ? AND " +
                                    "ct.scorecard_type = ?");
                            ps.setLong(1, project.getProjectType().getId());
                            ps.setInt(2, scorecardType);
                            rs = ps.executeQuery();
                            long templateId = 0;
                            if (rs.next()) {
                                templateId = rs.getLong(1);
                            } else {
                                String errorMsg = "PT.saveProject(): Could not find current template! , projectId: " + project.getId();
                                error(errorMsg);
                                throw new RuntimeException(errorMsg);
                            }
                            Common.close(ps);
*/
                                PreparedStatement ps1 = null;
                                try {
                                    if (scorecardTemplateId == -1) {
                                        String errorMsg = "PT.saveProject(): missing scorecard template id! projectId: " + project.getId();
                                        error(errorMsg);
                                        throw new RuntimeException(errorMsg);
                                    }
                                    ps1 = conn.prepareStatement(
                                            "INSERT INTO project_template " +
                                            "(project_id, scorecard_type, template_id) " +
                                            "VALUES (?,?,?)");
                                    ps1.setLong(1, project.getId());
                                    ps1.setInt(2, scorecardType);
                                    ps1.setLong(3, scorecardTemplateId);
                                    int nr = ps1.executeUpdate();
                                    if (nr != 1) {
                                        String errorMsg = "PT.saveProject(): Could not insert new project_template! , projectId: " + project.getId();
                                        error(errorMsg);
                                        throw new RuntimeException(errorMsg);
                                    }
                                } finally {
                                    Common.close(ps1);
                                }
                            }
                        } finally {
                            Common.close(rs);
                            Common.close(ps);
                        }
                    }

                }

                if (oldPhaseId == Phase.ID_SUBMISSION && currentPhase.getId() == Phase.ID_SCREENING) {
                    //update project result records for people who submitted
                    try {
                        ps = conn.prepareStatement(
                                "update project_result " +
                                "set valid_submission_ind = 0, reliability_ind = 1 " +
                                "where not exists(select * from submission where project_id = project_result.project_id and submitter_id = project_result.user_id and is_removed = 0 and cur_version = 1) " +
                                "and project_id = ?");

                        ps.setLong(1, project.getId());
                        ps.execute();
                    } finally {
                        Common.close(ps);
                    }
                } else if (oldPhaseId == Phase.ID_SCREENING && currentPhase.getId() == Phase.ID_REVIEW) {
                    try {
                        ps = conn.prepareStatement(
                                "update project_result " +
                                "set valid_submission_ind = 0, reliability_ind = 1 " +
                                "where exists(select * from submission where project_id = project_result.project_id and submitter_id = project_result.user_id and is_removed = 0 and cur_version = 1 and passed_screening = 0) " +
                                "and project_id = ?");

                        ps.setLong(1, project.getId());
                        ps.execute();
                    } finally {
                        Common.close(ps);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "update project_result " +
                                "set valid_submission_ind = 1, reliability_ind = 1 " +
                                "where exists(select * from submission where project_id = project_result.project_id and submitter_id = project_result.user_id and is_removed = 0 and cur_version = 1 and passed_screening = 1) " +
                                "and project_id = ?");

                        ps.setLong(1, project.getId());
                        ps.execute();
                    } finally {
                        Common.close(ps);
                    }
                } else if (oldPhaseId == Phase.ID_REVIEW && currentPhase.getId() == Phase.ID_APPEALS) {
                    try {
                        ps = conn.prepareStatement(
                                "update project_result " +
                                "set raw_score = (select ROUND(sum(s.raw_score)/3,2) from scorecard s where s.project_id = project_id and s.scorecard_type = 2" +
                                "   AND s.cur_version = 1 and" +
                                " s.submission_id = (select submission_id from submission where project_id = project_result.project_id and " +
                                " submitter_id = project_result.user_id and is_removed = 0 and cur_version = 1) )" +
                                "where project_id = ?");

                        ps.setLong(1, project.getId());
                        ps.execute();
                    } finally {
                        Common.close(ps);
                    }

                } else if (oldPhaseId == Phase.ID_FINAL_FIXES && currentPhase.getId() == Phase.ID_FINAL_REVIEW) {
                    //set it to not complete so that the final reviewer can make changes...this is just incase this
                    //isn't the first final review.
                    try {
                        ps = conn.prepareStatement(
                                "UPDATE final_review " +
                                "SET is_completed = 0 " +
                                "WHERE cur_version = 1 " +
                                "AND agg_worksheet_id = (SELECT agg_worksheet_id " +
                                "FROM agg_worksheet " +
                                "WHERE cur_version = 1 " +
                                "AND project_id = ?)");
                        ps.setLong(1, project.getId());
                        ps.execute();
                    } finally {
                        Common.close(ps);
                    }
                }

                //aggregate scores for stats
                if (currentPhase.getId() == Phase.ID_FINAL_FIXES || currentPhase.getId() == Phase.ID_FINAL_REVIEW || currentPhase.getId() == Phase.ID_COMPONENT_PREPARATION) {
                    try {
                        finalizeScores(project.getId());
                    } catch (Exception e) {
                        throw new InvalidEditException("Finalize Score Exception: " + e.getMessage());
                    }
                }


                if (oldStatusId != project.getProjectStatus().getId() && (
                        project.getProjectStatus().getId() == ProjectStatus.ID_TERMINATED ||
                        project.getProjectStatus().getId() == ProjectStatus.ID_COMPLETED ||
                        project.getProjectStatus().getId() == ProjectStatus.ID_ALL_FAILED_REVIEW)) {
                    //save score
                    try {
                        finalizeScores(project.getId());
                        setComplete(project.getId());
                    } catch (Exception e) {
                        throw new InvalidEditException("Finalize Score Exception: " + e.getMessage());
                    }
                }

                // Clean up this variable for reuse - bblais
                Common.close(ps);
                ps = null;
            }

            // save timeline
            PhaseInstance[] phaseInstance = project.getTimeline();

            for (int i = 0; i < phaseInstance.length; i++) {
                if (phaseInstance[i].getDirty() == true) {
                    try {
                        ps = conn.prepareStatement(
                                "SELECT phase_inst_v_id " +
                                "FROM phase_instance " +
                                "WHERE phase_instance_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, phaseInstance[i].getId());
                        rs = ps.executeQuery();

                        if (rs.next()) {
                            if (rs.getLong(1) != phaseInstance[i].getVersionId()) {
                                String errorMsg = "PT.saveProject(): Concurrent error saving phaseInstance, projectId: " + project.getId() +
                                        ", phaseInstanceId: " + phaseInstance[i] + ", phaseInstanceVersionId: " +
                                        phaseInstance[i].getVersionId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new ConcurrentModificationException(errorMsg);
                            }
                        } else {
                            String errorMsg = "PT.saveProject(): Trying to save non-existing phaseInstance, phaseInstanceId: " +
                                    phaseInstance[i].getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(rs);
                        Common.close(ps);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE phase_instance " +
                                "SET cur_version = 0 " +
                                "WHERE phase_instance_id = ?");
                        ps.setLong(1, phaseInstance[i].getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "PT.saveProject(): Trying to save non-existing phaseInstance, phaseInstanceId: " +
                                    phaseInstance[i].getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                        debug("PT.saveProject(): phase_instance.cur_version set to 0!");
                    } finally {
                        Common.close(ps);
                    }


                    try {
                        ps = conn.prepareStatement(
                                "INSERT INTO phase_instance " +
                                "(phase_inst_v_id, phase_instance_id, " +
                                "start_date, end_date, " +
                                "phase_id, project_id, " +
                                "modify_user, cur_version) VALUES " +
                                "(0, ?, ?, ?, ?, ?, ?, 1)");
                        ps.setLong(1, phaseInstance[i].getId());
                        if (phaseInstance[i].getStartDate() == null) {
                            ps.setDate(2, null);
                        } else {
                            ps.setDate(2, new java.sql.Date(phaseInstance[i].getStartDate().getTime()));
                        }
                        if (phaseInstance[i].getEndDate() == null) {
                            ps.setDate(3, null);
                        } else {
                            ps.setDate(3, new java.sql.Date(phaseInstance[i].getEndDate().getTime()));
                        }
                        ps.setLong(4, phaseInstance[i].getPhase().getId());
                        ps.setLong(5, project.getId());
                        ps.setLong(6, project.getRequestorId());

                        int nr = ps.executeUpdate();

                        if (nr != 1) {
                            String errorMsg = "PT.saveProject(): Could not insert phaseInstance! , phaseInstanceId: " +
                                    phaseInstance[i].getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }

                        debug("PT.saveProject(): phase_instance inserted!");
                    } finally {
                        Common.close(ps);
                    }

                }
                // end of save PhaseInstance
            }
            // end of for-loop saving PhaseInstance[]

            // save userRoles
            UserRole[] userRole = project.getParticipants();
//            long[] userRoleIdArr = new long[userRole.length];

            for (int i = 0; i < userRole.length; i++) {
                /*
                   ps =
                       conn.prepareStatement(
                           "SELECT rur.payment_info_id "
                               + "FROM r_user_role rur "
                               + "WHERE rur.cur_version = 1 AND "
                               + "rur.r_user_role_id = ?");
                   ps.setLong(1, userRole[i].getId());
                   rs = ps.executeQuery();
                   long paymentInfoId = 0;
                   if (rs.next()) {
                       paymentInfoId = rs.getLong(1);
                   } else {
                       //TODO Use IDGenerator to create new paymentInfoId!
                       throw new InvalidEditException("Error: A UserRole doesn't have a pyamentInfo!");
                   }
                 */
                if (userRole[i].getDirty() == true) {
                    if (userRole[i].getId() > 0) {
                        try {
                            ps = conn.prepareStatement(
                                    "SELECT r_user_role_v_id " +
                                    "FROM r_user_role " +
                                    "WHERE r_user_role_id = ? AND " +
                                    "cur_version = 1");
                            ps.setLong(1, userRole[i].getId());
                            rs = ps.executeQuery();

                            if (rs.next()) {
                                if (rs.getLong(1) != userRole[i].getVersionId()) {
                                    String errorMsg = "PT.saveProject(): Concurrent error saving userRole, projectId: " + project.getId() +
                                            ", userRoleId: " + userRole[i].getId() + ", userRoleVersionId: " +
                                            userRole[i].getVersionId();
                                    error(errorMsg);
                                    ejbContext.setRollbackOnly();
                                    throw new ConcurrentModificationException(errorMsg);
                                }
                            } else {
                                String errorMsg = "PT.saveProject(): Trying to save non-existing userRole, userRoleId: " +
                                        userRole[i].getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new InvalidEditException(errorMsg);
                            }
                        } finally {
                            Common.close(rs);
                            Common.close(ps);
                        }

                        try {
                            ps = conn.prepareStatement(
                                    "UPDATE r_user_role " +
                                    "SET cur_version = 0 " +
                                    "WHERE r_user_role_id = ?");
                            ps.setLong(1, userRole[i].getId());

                            int nr = ps.executeUpdate();

                            if (nr == 0) {
                                String errorMsg = "PT.saveProject(): Trying to save non-existing userRole, userRoleId: " +
                                        userRole[i].getId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new InvalidEditException(errorMsg);
                            }
                        } finally {
                            Common.close(ps);
                        }

                    } else {
                        try {
                            // New UserRole
                            userRole[i].setId(idGen.nextId());
                        } catch (RemoteException e1) {
                            // TODO Auto-generated catch block
                            e1.printStackTrace();
                            throw new RuntimeException(e1);
                        }
                    }
                    try {
                        ps = conn.prepareStatement(
                                "INSERT INTO r_user_role " +
                                "(r_user_role_v_id, r_user_role_id, r_role_id, project_id, " +
                                "login_id, payment_info_id, r_resp_id, " +
                                "modify_user, cur_version) VALUES " +
                                "(0, ?, ?, ?, ?, ?, ?, ?, 1)");
                        ps.setLong(1, userRole[i].getId());
                        ps.setLong(2, userRole[i].getRole().getId());
                        ps.setLong(3, project.getId());
                        if (userRole[i].getUser() == null) {
                            ps.setNull(4, Types.DECIMAL);
                        } else {
                            ps.setLong(4, userRole[i].getUser().getId());
                        }

                        PaymentInfo pi = userRole[i].getPaymentInfo();

                        if (pi == null) {
                            // TODO check
                            ps.setNull(5, Types.DECIMAL);
                        } else {
                            ps.setLong(5, pi.getId());
                        }

                        if (userRole[i].getReviewerResponsibility() == null) {
                            ps.setNull(6, Types.DECIMAL);
                        } else {
                            ps.setLong(6, userRole[i].getReviewerResponsibility().getId());
                        }
                        ps.setLong(7, project.getRequestorId());

                        int nr = ps.executeUpdate();

                        if (nr != 1) {
                            String errorMsg = "PT.saveProject(): Could not insert userRole! , userRoleId: " + userRole[i].getId();
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(ps);
                    }
                }
                // end of save UserRole

                // save PaymentInfo
                PaymentInfo paymentInfo = userRole[i].getPaymentInfo();

                if ((paymentInfo != null) && (paymentInfo.getDirty() == true)) {
                    try {
                        ps = conn.prepareStatement(
                                "SELECT payment_info_v_id " +
                                "FROM payment_info " +
                                "WHERE payment_info_id = ? AND " +
                                "cur_version = 1");
                        ps.setLong(1, paymentInfo.getId());
                        rs = ps.executeQuery();

                        if (rs.next()) {
                            if (rs.getLong(1) != paymentInfo.getVersionId()) {
                                String errorMsg = "PT.saveProject(): Concurrent error saving paymentInfo, projectId: " + project.getId() +
                                        ", paymentInfoId: " + paymentInfo + ", paymentInfoVersionId: " +
                                        paymentInfo.getVersionId();
                                error(errorMsg);
                                ejbContext.setRollbackOnly();
                                throw new ConcurrentModificationException(errorMsg);
                            }
                        } else {
                            String errorMsg = "PT.saveProject(): saving non-existing paymentInfo!";
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(rs);
                        Common.close(ps);
                    }

                    try {
                        ps = conn.prepareStatement(
                                "UPDATE payment_info " +
                                "SET cur_version = 0 " +
                                "WHERE payment_info_id = ?");
                        ps.setLong(1, paymentInfo.getId());

                        int nr = ps.executeUpdate();

                        if (nr == 0) {
                            String errorMsg = "PT.saveProject():saving non-existing paymentInfo!";
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(ps);
                    }


                    try {
                        ps = conn.prepareStatement(
                                "INSERT INTO payment_info " +
                                "(payment_info_v_id, payment_info_id, payment, payment_stat_id, " +
                                "modify_user, cur_version) VALUES " +
                                "(0, ?, ?, ?, ?, 1)");
                        ps.setLong(1, paymentInfo.getId());
                        ps.setFloat(2, paymentInfo.getPayment());
                        if (paymentInfo.getPaymentStatus() == null) {
                            error("ProjectTrackerBean.saveProject, project_id: " + project.getId() +
                                    "PaymentInfo has PaymentStatus=null, paymentinfo_id: " + paymentInfo.getId());
                            throw new InvalidEditException("ProjectTrackerBean.saveProject, project_id: " + project.getId() +
                                    "PaymentInfo has PaymentStatus=null, paymentinfo_id: " + paymentInfo.getId());
                        }
                        ps.setLong(3, paymentInfo.getPaymentStatus().getId());
                        ps.setLong(4, project.getRequestorId());

                        int nr = ps.executeUpdate();

                        if (nr != 1) {
                            String errorMsg = "PT.saveProject(): Could not save PaymentInfo to database.";
                            error(errorMsg);
                            ejbContext.setRollbackOnly();
                            throw new InvalidEditException(errorMsg);
                        }
                    } finally {
                        Common.close(ps);
                    }
                }
                // end of save PaymentInfo
            }
            // end of for-loop for saving UserRole[]
            // remove(set cur_version to 0) deleted participants
            StringBuffer sqlString;

            if (userRole.length != 0) {
                sqlString = new StringBuffer(
                        "UPDATE r_user_role " +
                        "SET cur_version = 0 " +
                        "WHERE cur_version = 1 AND " +
                        "project_id = ? AND " +
                        "r_user_role_id NOT IN (");

                for (int i = 0; i < userRole.length; i++) {
                    if (i != 0) {
                        sqlString.append(",");
                    }
                    sqlString.append("?");
                }
                sqlString.append(")");
            } else {
                sqlString = new StringBuffer(
                        "UPDATE r_user_role " +
                        "SET cur_version = 0 " +
                        "WHERE cur_version = 1 AND " +
                        "project_id = ?");
            }

            try {
                ps = conn.prepareStatement(sqlString.toString());
                ps.setLong(1, project.getId());

                for (int i = 0; i < userRole.length; i++) {
                    ps.setLong(i + 2, userRole[i].getId());
                }
                ps.executeUpdate();
            } finally {
                Common.close(ps);
            }

        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            throw new InvalidEditException("SQL Exception: " + e.getMessage());

        } finally {
            Common.close(conn, ps, rs);
        }
    } //saveProject done

    private PhaseInstance[] getPhaseInstances(long projectId) {
        debug("PT.getPhaseInstances( " + projectId + " )");

        List phaseInstanceList = new ArrayList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT pi.phase_instance_id, pi.start_date, " +
                    "pi.end_date, pi.phase_id, pi.phase_inst_v_id, " +
                    "rp.phase_order " +
                    "FROM phase_instance pi, review_phase rp " +
                    "WHERE pi.cur_version = 1 AND " +
                    "pi.phase_id = rp.review_phase_id AND " +
                    "pi.project_id = ? " +
                    "ORDER BY rp.phase_order");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            while (rs.next()) {
                long phaseInstanceId = rs.getLong(1);
                java.sql.Date startDate = rs.getDate(2);
                java.sql.Date endDate = rs.getDate(3);
                long phaseId = rs.getLong(4);
                long piVersionId = rs.getLong(5);

                debug("PT.getPhaseInstances(), " +
                        "start: " + startDate + ", end: " + endDate +
                        ", phaseId: " + phaseId);

                PhaseManager phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
                debug("pm: " + phaseManager);

                Phase phase = phaseManager.getPhase(phaseId);
                debug("phase: " + phase);
                debug("phase.id: " + phase.getId());

                PhaseInstance phaseInstance = new PhaseInstance(phaseInstanceId, phase, startDate, endDate,
                        piVersionId);
                phaseInstanceList.add(phaseInstance);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return (PhaseInstance[]) phaseInstanceList.toArray(new PhaseInstance[0]);
    }

    /**
     * Gets all the userroles for a project.
     *
     * @param projectId
     *
     * @return UserRole[]
     */
    private UserRole[] getUserRoles(long projectId) {
        return getUserRoles(projectId, null);
    }

    /**
     * Gets the userroles for a project for a specific user. If user == null then all userroles for the project are
     * returned.
     *
     * @param projectId
     * @param user
     *
     * @return UserRole[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    private UserRole[] getUserRoles(long projectId, User user) {
        info("PT.getUserRoles(), project: " + projectId + ", user: " + (user == null ? -1 : user.getId()));

        List userRoleList = new LinkedList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            if (user == null) {
                ps = conn.prepareStatement(
                        "SELECT rur.r_user_role_id, rur.r_role_id, " +
                        "rur.payment_info_id, " +
                        "rur.r_resp_id, rur.login_id, " +
                        "rur.r_user_role_v_id, " +
                        "pi.payment, pi.payment_stat_id, " +
                        "pi.payment_info_v_id, " +
                        "su.user_id, " +
                        "u.first_name, u.last_name, e.address " +
                        "FROM r_user_role rur, " +
                        "OUTER (security_user su, user u, email e), " +
                        "OUTER payment_info pi " +
                        "WHERE rur.cur_version = 1 AND " +
                        "pi.cur_version = 1 AND " +
                        "pi.payment_info_id = rur.payment_info_id AND " +
                        "rur.project_id = ? AND " +
                        "su.login_id = rur.login_id AND " +
                        "su.login_id = u.user_id AND " +
                        "su.login_id = e.user_id AND " +
                        "e.primary_ind = 1 " +
                        "ORDER BY rur.r_role_id, rur.r_resp_id");
            } else {
                ps = conn.prepareStatement(
                        "SELECT rur.r_user_role_id, rur.r_role_id, " +
                        "rur.payment_info_id, " +
                        "rur.r_resp_id, rur.login_id, " +
                        "rur.r_user_role_v_id, " +
                        "pi.payment, pi.payment_stat_id, " +
                        "pi.payment_info_v_id " +
                        "FROM r_user_role rur, OUTER payment_info pi " +
                        "WHERE rur.cur_version = 1 AND " +
                        "pi.cur_version = 1 AND " +
                        "pi.payment_info_id = rur.payment_info_id AND " +
                        "rur.project_id = ? AND " +
                        "rur.login_id = ? " +
                        "ORDER BY rur.r_role_id, rur.r_resp_id");
            }

            ps.setLong(1, projectId);

            if (user != null) {
                ps.setLong(2, user.getId());
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                long userRoleId = rs.getLong(1);
                //info("PT.getUserRoles(): Found userRole, id: " + userRoleId);

                long rRoleId = rs.getLong(2);
                long paymentInfoId = rs.getLong(3);
                long rRespId = rs.getLong(4);
                long thisUserId = rs.getLong(5);
                long rVersionId = rs.getLong(6);

                float amount = rs.getFloat(7);
                long paymentStatusId = rs.getLong(8);
                long paymentVersionId = rs.getLong(9);

                User thisUser = user;
                if (user == null && thisUserId != 0) {
                    String handle = rs.getString(10);
                    String firstName = rs.getString(11);
                    String lastName = rs.getString(12);
                    String email = rs.getString(13);

                    thisUser = new User(thisUserId, handle, firstName, lastName, email);
                    // Retrieve user in sql instead of using the UserManagerBean
                    //thisUser = Common.getUser(dataSource, thisUserId);
                }

                PaymentStatusManager paymentStatusManager = (PaymentStatusManager) Common.getFromCache(
                        "PaymentStatusManager");
                PaymentStatus paymentStatus = paymentStatusManager.getPaymentStatus(paymentStatusId);

                PaymentInfo paymentInfo = null;
                if (paymentVersionId != 0) {
                    paymentInfo = new PaymentInfo(paymentInfoId, amount, paymentStatus, paymentVersionId);
                }
                //PaymentInfo paymentInfo = getPaymentInfo(paymentInfoId);

                RoleManager roleManager = (RoleManager) Common.getFromCache("RoleManager");
                Role role = roleManager.getRole(rRoleId);

                ReviewerResponsibilityManager respManager = (ReviewerResponsibilityManager) Common.getFromCache(
                        "ReviewerResponsibilityManager");
                ReviewerResponsibility rResp = respManager.getResponsibility(rRespId);

                UserRole userRole = new UserRole(userRoleId, role, thisUser, paymentInfo, rResp, rVersionId);
                userRoleList.add(userRole);
                //info("PT.getUserRoles(): Found userRole END");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }
        //info("PT.getUserRoles() end");

        return (UserRole[]) userRoleList.toArray(new UserRole[0]);
    }

    /**
     * Gets the PM for the project, or returns null if no PM is found.
     *
     * @param projectId the id of the project whose PM will be retrieved.
     *
     * @return the User for the PM
     */
    public User getPM(long projectId) {
        UserRole[] userRole = getUserRoles(projectId);
        for (int i = 0; i < userRole.length; i++) {
            if (userRole[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                return userRole[i].getUser();
            }
        }
        return null;
    }

    /**
     * Gets current phaseInstance for a project.
     *
     * @param projectId
     *
     * @return PhaseInstance
     *
     * @throws RuntimeException DOCUMENT ME!
     */
/*
    private PhaseInstance getCurrentPhaseInstance(long projectId) {
        info("PT.getCurrentPhaseInstance, project: " + projectId);

        PhaseInstance phaseInstance = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT pi.phase_instance_id, pi.phase_id, " +
                    "pi.start_date, pi.end_date, pi.phase_inst_v_id " +
                    "FROM project p, phase_instance pi " +
                    "WHERE p.cur_version = 1 AND " +
                    "pi.cur_version = 1 AND " +
                    "p.project_id = pi.project_id AND " +
                    "p.phase_instance_id = pi.phase_instance_id AND " +
                    "p.project_id = ?");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            if (rs.next()) {
                long phaseInstanceId = rs.getLong(1);
                long phaseId = rs.getLong(2);
                Date startDate = rs.getDate(3);
                Date endDate = rs.getDate(4);
                long piVersionId = rs.getLong(5);

                PhaseManager phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
                Phase phase = phaseManager.getPhase(phaseId);

                phaseInstance = new PhaseInstance(phaseInstanceId, phase, startDate, endDate, piVersionId);
            } else {
                String errorMsg = "PT.getCurrentPhaseInstance(): Could not retrieve current phaseInstance for projectId: " + projectId;
                error(errorMsg);
                throw new RuntimeException(errorMsg);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        info("PT.getCurrentPhaseInstance(): end");
        return phaseInstance;
    }
*/

    /**
     * Retrieves a PaymentInfo object from the database.
     *
     * @param paymentInfoId
     *
     * @return PaymentInfo
     *
     * @throws RuntimeException DOCUMENT ME!
     */
/*
    private PaymentInfo getPaymentInfo(long paymentInfoId) {
        debug("PT.getPaymentInfo( " + paymentInfoId + " )");

        PaymentInfo paymentInfo = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
                    "SELECT pi.payment, pi.payment_stat_id, " +
                    "pi.payment_info_v_id " +
                    "FROM payment_info pi " +
                    "WHERE pi.cur_version = 1 AND " +
                    "pi.payment_info_id = ?");
            ps.setLong(1, paymentInfoId);
            rs = ps.executeQuery();

            if (rs.next()) {
                float amount = rs.getFloat(1);
                long paymentStatusId = rs.getLong(2);
                long paymentVersionId = rs.getLong(3);

                PaymentStatusManager paymentStatusManager = (PaymentStatusManager) Common.getFromCache(
                        "PaymentStatusManager");
                PaymentStatus paymentStatus = paymentStatusManager.getPaymentStatus(paymentStatusId);

                paymentInfo = new PaymentInfo(paymentInfoId, amount, paymentStatus, paymentVersionId);
            }
// UserRoles don't need paymentinfo(pm does not have one)
//             else {
//                String errorMsg = "Could not retrieve paymentInfo, id: " + paymentInfoId;
//                error(errorMsg);
//                throw new RuntimeException(errorMsg);
//            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return paymentInfo;
    }
*/

    /**
     * Creates a new Online Review Project.
     *
     * @param projectName - the name of the project.
     * @param projectVersion - the version(text) for the project.
     * @param compVersId - the component version id for the project(from comp_versions.comp_vers_id).
     * @param projectTypeId - 1 for design-project, 2 for development-project
     * @param overview
     * @param requestor
     * @return long - the projectId for the newly created project.
     */
    public long createProject(
            String projectName,
            String projectVersion,
            long compVersId,
            long projectTypeId,
            String overview,
            Date[] dates,
            TCSubject requestor,
            long levelId) throws TCException {
        info("PT.createProject: compVersId: " + compVersId);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        long projectId = -1;
        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(
                    "SELECT p.project_id " +
                    "FROM comp_versions cv, project p " +
                    "WHERE p.cur_version = 1 AND " +
                    "p.comp_vers_id = cv.comp_vers_id AND " +
                    "p.comp_vers_id = ? AND " +
                    "cv.version_text = ? AND " +
                    "p.project_type_id = ? AND " +
                    "p.project_stat_id IN (1,3,4)");
            ps.setLong(1, compVersId);
            ps.setString(2, projectVersion);
            ps.setLong(3, projectTypeId);
            rs = ps.executeQuery();

            if (rs.next()) {
                throw new TCException("Online Review: A project already exists! Terminate it before changing phase!");
            }
            Common.close(rs);
            Common.close(ps);

            info("About to create new projectId!");
            projectId = idGen.nextId();
            long modUserId = requestor.getUserId();
            long firstPhaseInstanceId = idGen.nextId();
            info("projectId: " + firstPhaseInstanceId);

            // Create project
            ps = conn.prepareStatement(
                    "INSERT INTO project "
                    + "(project_v_id, project_id, "
                    + "comp_vers_id, phase_instance_id, "
                    + "winner_id, overview, "
                    + "notes, project_type_id, "
                    + "project_stat_id, notification_sent, "
                    + "modify_user, modify_reason, level_id, autopilot_ind,  "
                    + "cur_version) VALUES "
                    + "(0, ?, ?, ?, null, ?, ?, ?, ?, 0, ?, 'Created', ?, 1, 1)");

            String notes = "";
            long projectStatId = ProjectStatus.ID_PENDING_START;

            ps.setLong(1, projectId);
            ps.setLong(2, compVersId);
            ps.setLong(3, firstPhaseInstanceId);
            if (Common.tooBig(overview) ||
                    Common.tooBig(notes)) {
                String errorMsg = "PT.createProject(), text-field too long!";
                error(errorMsg);
                throw new RuntimeException(errorMsg);
            }
            ps.setString(4, overview);
            ps.setString(5, notes);
            ps.setLong(6, projectTypeId);
            ps.setLong(7, projectStatId);
            ps.setLong(8, modUserId);
            ps.setLong(9, levelId);

            ps.executeUpdate();

            // Create phase instances for project
            info("Creating phase instances");
            PhaseManager phaseManager = (PhaseManager) Common.getFromCache("PhaseManager");
            Phase[] phaseArr = phaseManager.getPhases();

            // Clean up this variable for reuse - bblais
            Common.close(ps);
            ps = null;

            if (dates == null) {
                dates = calcDates(projectTypeId, phaseArr);
            }

            for (int i = 0; i < phaseArr.length; i++) {
                Date startDate;
                Date endDate;
                if (dates != null) {
                    startDate = dates[i];
                    endDate = dates[i + 1];
                } else {
                    //long curTime = (new java.util.Date()).getTime();
                    //startDate = new java.sql.Date(curTime);
                    //endDate = new java.sql.Date(curTime);
                    startDate = null;
                    endDate = null;
                }
                ps = conn.prepareStatement(
                        "INSERT INTO phase_instance "
                        + "(phase_inst_v_id, phase_instance_id, "
                        + "start_date, end_date, "
                        + "phase_id, project_id, "
                        + "modify_user, cur_version) VALUES "
                        + "(0, ?, ?, ?, ?, ?, ?, 1)");
                long phaseInstanceId;
                if (phaseArr[i].getId() == Phase.ID_SUBMISSION) {
                    phaseInstanceId = firstPhaseInstanceId;
                } else {
                    phaseInstanceId = idGen.nextId();
                }
                ps.setLong(1, phaseInstanceId);
                ps.setDate(2, startDate);
                ps.setDate(3, endDate);
                ps.setLong(4, phaseArr[i].getId());
                ps.setLong(5, projectId);
                ps.setLong(6, modUserId);

                ps.executeUpdate();

                // Clean up this variable for reuse - bblais
                Common.close(ps);
                ps = null;
            }


            long[] roleIdArr = new long[]{2, 3, 3, 3, 4, 5, 6};
            long[] paymentInfoIdArr = new long[roleIdArr.length];


            // Create payment infos?
            info("Creating payment infos");
            ps = conn.prepareStatement(
                    "INSERT INTO payment_info "
                    + "(payment_info_v_id, payment_info_id, "
                    + "payment, payment_stat_id, "
                    + "modify_user, cur_version) VALUES "
                    + "(0, ?, ?, ?, ?, 1)");
            for (int i = 0; i < paymentInfoIdArr.length; i++) {
                if (roleIdArr[i] != Role.ID_PRODUCT_MANAGER) {
                    paymentInfoIdArr[i] = idGen.nextId();
                    ps.setLong(1, paymentInfoIdArr[i]);
                    ps.setFloat(2, 0);
                    // TODO Change to reference
                    ps.setLong(3, 1);
                    ps.setLong(4, modUserId);

                    ps.executeUpdate();
                }
            }

            // Clean up this variable for reuse - bblais
            Common.close(ps);
            ps = null;

            // Create user roles for project
            info("Creating user roles");
            long revRespId = 1;
            // TODO Change to references
            ps = conn.prepareStatement(
                    "INSERT INTO r_user_role "
                    + "(r_user_role_v_id, r_user_role_id, "
                    + "r_role_id, project_id, "
                    + "login_id, payment_info_id, "
                    + "r_resp_id, modify_user, "
                    + "cur_version) VALUES "
                    + "(0, ?, ?, ?, ?, ?, ?, ?, 1)");
            for (int i = 0; i < roleIdArr.length; i++) {
                long userRoleId = idGen.nextId();
                ps.setLong(1, userRoleId);
                ps.setLong(2, roleIdArr[i]);
                ps.setLong(3, projectId);
                if (roleIdArr[i] == Role.ID_PRODUCT_MANAGER) {
                    ps.setLong(4, requestor.getUserId());
                    ps.setNull(5, Types.DECIMAL);
                } else {
                    ps.setNull(4, Types.DECIMAL);
                    ps.setLong(5, paymentInfoIdArr[i]);
                }
                if (roleIdArr[i] == Role.ID_REVIEWER &&
                        projectTypeId == ProjectType.ID_DEVELOPMENT) {
                    ps.setLong(6, revRespId++);
                } else {
                    ps.setNull(6, Types.DECIMAL);
                }
                ps.setLong(7, modUserId);
                ps.executeUpdate();
            }

            // Clean up this variable for reuse - bblais
            Common.close(ps);
            ps = null;

            //insert default scorecards
            long templateId = documentManager.getDefaultScorecardTemplate(projectTypeId, ScreeningScorecard.SCORECARD_TYPE).getId();
            ps = conn.prepareStatement(
                    "INSERT INTO project_template " +
                    "(project_id, scorecard_type, template_id) " +
                    "VALUES (?,?,?)");
            ps.setLong(1, projectId);
            ps.setInt(2, ScreeningScorecard.SCORECARD_TYPE);
            ps.setLong(3, templateId);

            ps.executeUpdate();
            ps.close();

            templateId = documentManager.getDefaultScorecardTemplate(projectTypeId, ReviewScorecard.SCORECARD_TYPE).getId();
            ps = conn.prepareStatement(
                    "INSERT INTO project_template " +
                    "(project_id, scorecard_type, template_id) " +
                    "VALUES (?,?,?)");
            ps.setLong(1, projectId);
            ps.setInt(2, ReviewScorecard.SCORECARD_TYPE);
            ps.setLong(3, templateId);

            ps.executeUpdate();
            ps.close();

            ps = null;

            // Create security manager roles for project
            info("Creating security manager roles");
            PrincipalMgrRemote principalMgr;
            PolicyMgrRemote policyMgr;
            try {
                Context initial = new InitialContext();
                Object objref = initial.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemoteHome home =
                        (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objref, PrincipalMgrRemoteHome.class);
                principalMgr = home.create();

                objref = initial.lookup(PolicyMgrRemoteHome.EJB_REF_NAME);
                PolicyMgrRemoteHome home2 =
                        (PolicyMgrRemoteHome) PortableRemoteObject.narrow(objref, PolicyMgrRemoteHome.class);
                policyMgr = home2.create();
            } catch (ClassCastException e1) {
                throw new RuntimeException(e1);
            } catch (EJBException e1) {
                throw new RuntimeException(e1);
            } catch (NamingException e1) {
                throw new RuntimeException(e1);
            } catch (CreateException e1) {
                throw new RuntimeException(e1);
            }

            ProjectTypeManager projectTypeManager = (ProjectTypeManager) Common.getFromCache("ProjectTypeManager");
//            ProjectType projectType = projectTypeManager.getProjectType(projectTypeId);

            String prefix = projectName + " " +
                    projectVersion + " " +
                    projectTypeManager.getProjectType(projectTypeId).getName() + " ";

            // TODO Check that roles don't exist!
            //Collection roles = principalMgr.getRoles(requestor);
            try {
                UserPrincipal userPrincipal = principalMgr.getUser(requestor.getUserId());
                RolePrincipal rp;
                long roleId;

                String roleName = prefix + "View Project " + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                PermissionCollection pc = new PermissionCollection();
                pc.addPermission(new ViewProjectPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);

                // Assign View Project to pm
                principalMgr.assignRole(userPrincipal, rp, requestor);

                roleName = prefix + "Submit "  + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                pc = new PermissionCollection();
                pc.addPermission(new SubmitPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);

                roleName = prefix + "Screen "  + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                pc = new PermissionCollection();
                pc.addPermission(new ScreenPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);

                roleName = prefix + "Review " + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                pc = new PermissionCollection();
                pc.addPermission(new ReviewPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);

                roleName = prefix + "Aggregation " + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                pc = new PermissionCollection();
                pc.addPermission(new AggregationPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);

                roleName = prefix + "Submit Final Fix " + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                pc = new PermissionCollection();
                pc.addPermission(new SubmitFinalFixPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);

                roleName = prefix + "Final Review " + projectId;
                roleId = getRoleId(roleName);
                if (roleId != -1) {
                    rp = principalMgr.getRole(roleId);
                    principalMgr.removeRole(rp, requestor);
                }
                rp = principalMgr.createRole(roleName, requestor);
                pc = new PermissionCollection();
                pc.addPermission(new FinalReviewPermission(projectId));
                policyMgr.addPermissions(rp, pc, requestor);
            } catch (com.topcoder.security.GeneralSecurityException e) {
                ejbContext.setRollbackOnly();

                SQLException sqle = (SQLException) e.getCause();
                int i = 1;
                System.err.println("*******************************");
                while (sqle != null) {
                    System.err.println("  Error #" + i + ":");
                    System.err.println("    SQLState = " + sqle.getSQLState());
                    System.err.println("    Message = " + sqle.getMessage());
                    System.err.println("    SQLCODE = " + sqle.getErrorCode());
                    sqle.printStackTrace();
                    sqle = sqle.getNextException();
                    i++;
                }

                throw new RuntimeException("GeneralSecurityException: " + e.getMessage());
            }

        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("SQLException: " + e.getMessage());
        } catch (RemoteException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("RemoteException: " + e.getMessage());
        } finally {
            Common.close(conn, ps, rs);
        }
        return projectId;
    }


    /**
     * Calculate the dates for the phases of a project.
     * If any error occurs, it is logged and null is returned, so empty dates will be used.
     *
     *
     * @return the start dates of each phase and the end date of the last phase.
     */
    private Date[] calcDates(long projectTypeId, Phase[] phaseArr ) {

        try {
            int n = phaseArr.length;

            // try to instantiate a start date calculator, that will give the start date for the project.
            StartDateCalculator sdc = null;
            sdc = (StartDateCalculator) Class.forName(ConfigHelper.getStartDateCalculatorClassname()).newInstance();
            java.util.Date startDate = sdc.calculateNextStart(projectTypeId);

            // create a project to handle the phases
            com.topcoder.project.phases.Project project = new com.topcoder.project.phases.Project(startDate,
                        new TCWorkdays(ConfigHelper.getString(ConfigHelper.WORKDAYS_CONF_FILE), TCWorkdays.XML_FILE_FORMAT));


            // create the phases so that each one depends on the previous phase.
            TCPhase[] phases = new TCPhase[n];
            for (int i=0; i < n; i++) {
                phases[i] = new TCPhase(project, startDate, phaseArr[i].getDefaultDuration());
                if (i > 0) {
                    phases [i].addDependency(phases[i - 1]);
                }
            }


            // get the start dates and the end date.
            Date[] result = new Date [n + 1];

            for (int i=0; i < n; i++) {
                result [i] = new Date(phases[i].getStartDate().getTime());
            }
            result[n] = new Date (phases [n - 1].calcEndDate().getTime());

            return result;
        } catch (Exception e) {
            info("Couldn't calculate the project dates due to: " + e);
            return null;
        }


    }

    /**
     * @param userId
     * @param componentId
     * @param version
     * @param projectTypeId
     */
/*
    public void userInquiry(long userId, long componentId, long version, long projectTypeId)
            throws TCException {
        info("PT.userInquiry; userId: " + userId +
                " ,componentId: " + componentId +
                " ,version: " + version +
                " ,projectTypeId: " + projectTypeId);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            // Check that user exists!
            ps = conn.prepareStatement(
                    "SELECT su.user_id " +
                    "FROM security_user su, user_customer uc " +
                    "WHERE su.login_id = uc.login_id AND " +
                    "su.login_id = ?");
            ps.setLong(1, userId);
            rs = ps.executeQuery();
            if (!rs.next()) {
                throw new TCException("Missing user!");
            }
            Common.close(rs);
            Common.close(ps);
            rs = null;
            ps = null;

            ps = conn.prepareStatement(
                    "SELECT p.project_id " +
                    "FROM comp_catalog cc, comp_versions cv, project p " +
                    "WHERE p.cur_version = 1 AND " +
                    "p.comp_vers_id = cv.comp_vers_id AND " +
                    "cc.component_id = cv.component_id AND " +
                    "cv.component_id = ? AND " +
                    "cv.version = ? AND " +
                    "p.project_type_id = ? AND " +
                    "p.project_stat_id IN (1,3)");
            ps.setLong(1, componentId);
            ps.setLong(2, version);
            ps.setLong(3, projectTypeId);
            rs = ps.executeQuery();

            long projectId = 0;
            if (rs.next()) {
                projectId = rs.getLong(1);
            } else {
                throw new TCException("Missing component");
            }
            Common.close(rs);
            Common.close(ps);
            rs = null;
            ps = null;

            userInquiry(userId, projectId);
        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("SQLException: " + e.getMessage());
        } catch (RemoteException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("RemoteException: " + e.getMessage());
        } finally {
            Common.close(conn, ps, rs);
        }
    }
*/


    public void userInquiry(long userId, long projectId)
            throws TCException {
        info("PT.userInquiry; userId: " + userId +
                " ,projectId: " + projectId);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            // Create payment info
            ps = conn.prepareStatement(
                    "INSERT INTO payment_info "
                    + "(payment_info_v_id, payment_info_id, "
                    + "payment, payment_stat_id, "
                    + "modify_user, cur_version) VALUES "
                    + "(0, ?, ?, ?, ?, 1)");
            long paymentInfoId = idGen.nextId();
            ps.setLong(1, paymentInfoId);
            ps.setFloat(2, 0);
            // TODO Change to reference
            ps.setLong(3, 1);
            ps.setLong(4, userId);
            int nr = ps.executeUpdate();
            if (nr != 1) {
                throw new RuntimeException("Could not create Payment Info!");
            }

            Common.close(rs);
            Common.close(ps);
            rs = null;
            ps = null;

            ps = conn.prepareStatement(
                    "SELECT rating from user_reliability where user_id = ?");
            ps.setLong(1, userId);
            rs = ps.executeQuery();

            double old_reliability;
            if (rs.next()) {
                old_reliability = rs.getDouble(1);
            } else {
                old_reliability = 1;
            }
            Common.close(rs);
            Common.close(ps);
            rs = null;
            ps = null;

            ps = conn.prepareStatement(
                    "SELECT rating from user_rating where user_id = ? and phase_id = " +
                    "(select 111+project_type_id from project where project_id = ? and cur_version = 1)");
            ps.setLong(1, userId);
            ps.setLong(2, projectId);
            rs = ps.executeQuery();

            double old_rating;
            if (rs.next()) {
                old_rating = rs.getDouble(1);
            } else {
                old_rating = 1200;
            }
            Common.close(rs);
            Common.close(ps);
            rs = null;
            ps = null;


            ps = conn.prepareStatement(
                    "INSERT INTO project_result " +
                    "(project_id, user_id, rating_ind, valid_submission_ind, reliability_ind, old_reliability, old_rating) " +
                    "values (?, ?, ?, ?, ?, ?, ?)"
            );

            ps.setLong(1, projectId);
            ps.setLong(2, userId);
            ps.setLong(3, 0);
            ps.setLong(4, 0);
            ps.setLong(5, 0);
            ps.setDouble(6, old_reliability);
            ps.setDouble(7, old_rating);

            ps.execute();

            Common.close(ps);
            ps = null;

            ps = conn.prepareStatement(
                    "INSERT INTO r_user_role " +
                    "(r_user_role_v_id, r_user_role_id, " +
                    "r_role_id, project_id, " +
                    "login_id, payment_info_id, " +
                    "r_resp_id, modify_user, " +
                    "cur_version) VALUES " +
                    "(0, ?, ?, ?, ?, ?, null, ?, 1)");
            long userRoleId = idGen.nextId();
            ps.setLong(1, userRoleId);
            ps.setLong(2, Role.ID_DESIGNER_DEVELOPER);
            ps.setLong(3, projectId);
            ps.setLong(4, userId);
            ps.setLong(5, paymentInfoId);
            ps.setLong(6, userId);
            nr = ps.executeUpdate();
            if (nr != 1) {
                throw new RuntimeException("Could not create User Role!");
            }

            PrincipalMgrRemote principalMgr;
            try {
                Context initial = new InitialContext();
                Object objref = initial.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemoteHome home =
                        (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objref, PrincipalMgrRemoteHome.class);
                principalMgr = home.create();
            } catch (ClassCastException e1) {
                throw new RuntimeException(e1);
            } catch (EJBException e1) {
                throw new RuntimeException(e1);
            } catch (NamingException e1) {
                throw new RuntimeException(e1);
            } catch (CreateException e1) {
                throw new RuntimeException(e1);
            }


            Common.close(ps);
            ps = null;

            ps = conn.prepareStatement(
                    "SELECT cc.component_name, cv.version_text, p.project_type_id " +
                    "FROM comp_catalog cc, comp_versions cv, project p " +
                    "WHERE p.cur_version = 1 AND " +
                    "p.comp_vers_id = cv.comp_vers_id AND " +
                    "cc.component_id = cv.component_id AND " +
                    "p.project_id = ? AND " +
                    "p.project_stat_id IN (1,3)");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            String projectName = null;
            String projectVersion = null;
            long projectTypeId = 0;
            if (rs.next()) {
                projectName = rs.getString("component_name");
                projectVersion = rs.getString("version_text").trim();
                projectTypeId = rs.getLong("project_type_id");

            } else {
                throw new TCException("Missing component");
            }

            ProjectTypeManager projectTypeManager = (ProjectTypeManager) Common.getFromCache("ProjectTypeManager");

            String prefix = projectName + " " +
                    projectVersion + " " +
                    projectTypeManager.getProjectType(projectTypeId).getName() + " ";

            // TODO What user to assign roles?
            TCSubject requestor = new TCSubject(userId);
            try {
                UserPrincipal userPrincipal = principalMgr.getUser(userId);

                String roleName = prefix + "View Project " + projectId;
                long roleId = getRoleId(roleName);
                if (roleId == -1) {
                    throw new RuntimeException("Can't find roleName: " + roleName);
                }
                RolePrincipal rolePrincipal = principalMgr.getRole(roleId);
                principalMgr.unAssignRole(userPrincipal, rolePrincipal, requestor);
                principalMgr.assignRole(userPrincipal, rolePrincipal, requestor);

                roleName = prefix + "Submit " + projectId;
                roleId = getRoleId(roleName);
                if (roleId == -1) {
                    throw new RuntimeException("Can't find roleName: " + roleName);
                }
                rolePrincipal = principalMgr.getRole(roleId);
                principalMgr.unAssignRole(userPrincipal, rolePrincipal, requestor);
                principalMgr.assignRole(userPrincipal, rolePrincipal, requestor);
            } catch (NoSuchUserException e2) {
                throw new RuntimeException(e2);
            } catch (com.topcoder.security.GeneralSecurityException e2) {
                throw new RuntimeException(e2);
            }

        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("SQLException: " + e.getMessage());
        } catch (RemoteException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("RemoteException: " + e.getMessage());
        } finally {
            Common.close(conn, ps, rs);
        }
    }


    /**
     * @param roleName
     * @return
     */
    private long getRoleId(String roleName) {
        info("PT.getRoleId(), roleName: " + roleName);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        long id = -1;
        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
                    "SELECT role_id " +
                    "FROM security_roles " +
                    "WHERE description = ?");
            ps.setString(1, roleName);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getLong(1);
            } else {
                id = -1;
            }
        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("SQLException: " + e.getMessage());
        } finally {
            Common.close(conn, ps, rs);
        }
        return id;
    }

    /**
     * Return scorecardtemplate id:s for project.
     *
     * @param projectId
     * @return array with screening and review template id:s
     */
    public long[] getProjectTemplates(long projectId) {
        info("PT.getProjectTemplates(), projectId: " + projectId);

        long[] ret = new long[2];
        ret[0] = -1;
        ret[1] = -1;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
                    "SELECT pt.template_id, pt.scorecard_type " +
                    "FROM project_template pt " +
                    "WHERE pt.project_id = ?");
            ps.setLong(1, projectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                long id = rs.getLong(1);
                int type = rs.getInt(2);
                if (type == 1 || type == 2) {
                    ret[type - 1] = id;
                }
            }
        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
            throw new RuntimeException("SQLException: " + e.getMessage());
        } finally {
            Common.close(conn, ps, rs);
        }
        return ret;


    }

    /**
     * Converts a project from the dde-system to Online Review.
     *
     * @param projectName
     * @param version
     * @param versionId
     * @param componentId
     * @param compVersId
     * @param phaseId
     * @param projectTypeId
     * @param overview
     * @param dates
     * @param requestor
     * @return long - the projectId for the create Online Review project.
     * @throws TCException
     */
/*
    public long convertProject(
            String projectName, String version, long versionId,
            long componentId,
            long compVersId, long phaseId, long projectTypeId,
            String overview, Date[] dates, TCSubject requestor, long levelId)
            throws TCException {
        info("PT.convertProject()");

        long projectId = -1;
        Connection conn = null;
        PreparedStatement psProject = null;
        PreparedStatement psGetInq = null;
        PreparedStatement psGetSub = null;
        PreparedStatement psSub = null;

        ResultSet rsProject = null;
        ResultSet rsGetInq = null;
        ResultSet rsGetSub = null;

        try {
            conn = dataSource.getConnection();

            // SQL Query to see if project already exists
            psProject = conn.prepareStatement(
                    "SELECT project_id " +
                    "FROM project " +
                    "WHERE comp_vers_id = ? AND " +
                    "project_type_id = ?");
            psProject.setLong(1, compVersId);
            psProject.setLong(2, projectTypeId);
            rsProject = psProject.executeQuery();
            if (!rsProject.next()) {
                // Project didn't exist
                projectId = createProject(projectName, version,
                        compVersId, projectTypeId, overview, dates, requestor, levelId);

                info("Created project, projectId: " + projectId +
                        " ,componentId: " + componentId +
                        " ,compVersId: " + compVersId);

                // SQL Query to get inquiries for a project
                psGetInq = conn.prepareStatement(
                        "SELECT DISTINCT ci.user_id " +
                        "FROM component_inquiry ci " +
                        "WHERE " +
                        "ci.agreed_to_terms = 1 AND " +
                        "ci.component_id = ? AND " +
                        "ci.version = ? AND " +
                        "ci.phase = ?");
                psGetInq.setLong(1, componentId);
                psGetInq.setLong(2, versionId);
                psGetInq.setLong(3, phaseId);
                rsGetInq = psGetInq.executeQuery();

                while (rsGetInq.next()) {
                    long userId = rsGetInq.getLong(1);
                    info("Found inquiry, userId: " + userId);

                    // Use PT.userInquiry() to insert entry in
                    // table r_user_role
                    // and set up permissions with security manager
                    try {
                        userInquiry(userId, componentId, versionId, projectTypeId);
                    } catch (TCException e) {
                        info("Problem with pt.userInquiry: " + e.getMessage());
                        continue;
                    }
                    info("Created submitter, userId: " + userId);

                    // SQL Query to retrieve submissions
                    // for a specific project and user
                    psGetSub = conn.prepareStatement(
                            "SELECT sub.submission, sub.comment, sub.date " +
                            "FROM submissions sub, submitters ss " +
                            "WHERE " +
                            "sub.submitter_id = ss.submitter_id AND " +
                            "ss.login_id = ? AND " +
                            "ss.comp_version_id = ? AND " +
                            "ss.phase_id = ? " +
                            "ORDER BY sub.date DESC");
                    psGetSub.setLong(1, userId);
                    psGetSub.setLong(2, compVersId);
                    psGetSub.setLong(3, phaseId);
                    rsGetSub = psGetSub.executeQuery();
                    boolean curVersionFlag = true;

                    while (rsGetSub.next()) {
                        byte[] sub = rsGetSub.getBytes(1);
                        String subComment = rsGetSub.getString(2);
                        Date subDate = rsGetSub.getDate(3);

                        info("Found submission, subDate: " + subDate);
                        long subId;
                        try {
                            subId = idGen.nextId();
                        } catch (RemoteException e2) {
                            error(e2.toString());
                            throw new RuntimeException();
                        }
                        // save submission to file
                        String destFilename = "test/Submitter_" + subId + "_"
                                + FormatMethodFactory.getDefaultDateFormatMethod("yyyy-MM-dd-HH-mm-ss-SSS").format(subDate)
                                + ".jar";
                        try {
                            FileOutputStream subOut = new FileOutputStream(
                                    "/export/home/ddedev/app_online_review/" +
                                    destFilename);
                            subOut.write(sub);
                            subOut.close();
                        } catch (FileNotFoundException e1) {
                            error(e1.toString());
                            throw new RuntimeException(e1);
                        } catch (IOException e1) {
                            error(e1.toString());
                            throw new RuntimeException(e1);
                        }

                        // SQL Query to insert a submission
                        psSub = conn.prepareStatement(
                                "INSERT INTO submission " +
                                "(submission_v_id, submission_id, " +
                                "submission_type, submission_url, " +
                                "sub_pm_review_msg, sub_pm_screen_msg, " +
                                "submitter_id, project_id, is_removed, " +
                                "modify_date, modify_user, cur_version) " + "VALUES " +
                                "(0, ?, 1, ?, null, null, ?, ?, 0, ?, ?, ?)");
                        String subURL = "http://65.112.118.206:9000/submissions/" + destFilename;

                        psSub.setLong(1, subId);
                        psSub.setString(2, subURL);
                        psSub.setLong(3, userId);
                        psSub.setLong(4, projectId);
                        psSub.setDate(5, subDate);
                        psSub.setLong(6, requestor.getUserId());
                        psSub.setBoolean(7, curVersionFlag);
                        psSub.executeUpdate();

                        Common.close(psSub);
                        psSub = null;

                        info("Created submission, submissionId: " + subId +
                                " ,subURL: " + subURL);
                        curVersionFlag = false;
                    }
                    Common.close(rsGetSub);
                    Common.close(psGetSub);
                    rsGetSub = null;
                    psGetSub = null;

                } // end while get inquiries
                Common.close(rsGetInq);
                Common.close(psGetInq);
                rsGetInq = null;
                psGetInq = null;

            } else { // end if project already exists
                info("Project already exists, compVersId: " + compVersId + ", phaseId: " + phaseId);
                throw new TCException("Project already exists, compVersId: " + compVersId + ", phaseId: " + phaseId);
            }
            Common.close(rsProject);
            Common.close(psProject);
            rsProject = null;
            psProject = null;

        } catch (SQLException e) {
            error(e.toString());
            throw new RuntimeException(e);
        } finally {
            Common.close(psSub);
            Common.close(rsGetSub);
            Common.close(psGetSub);
            Common.close(rsGetInq);
            Common.close(psGetInq);
            Common.close(rsProject);
            Common.close(psProject);
            Common.close(conn);
        }
        return projectId;
    }
*/

    public void versionRename(long compVersId, String oldVersion, String newVersion) {
        ddeRename(-1, compVersId, null, null, oldVersion, newVersion);
    }

    public void componentRename(long componentId, String oldName, String newName) {
        ddeRename(componentId, -1, oldName, newName, null, null);
    }

    private void ddeRename(long componentId, long compVersId,
                           String oldName, String newName,
                           String oldVersion, String newVersion) {
        info("PT.ddeRename(), componentId: " + componentId +
                "compVersId: " + compVersId);
        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement psRoles = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            List compVersList = new LinkedList();
            List projectTypeList = new LinkedList();
            List oldVersionList = new LinkedList();
            List newVersionList = new LinkedList();
            if (compVersId == -1) {
                // given componentId
                ps = conn.prepareStatement(
                        "SELECT p.comp_vers_id, cv.version_text, p.project_type_id " +
                        "FROM project p, comp_versions cv " +
                        "WHERE p.cur_version = 1 AND " +
                        "p.comp_vers_id = cv.comp_vers_id AND " +
                        "cv.component_id = ?");
                ps.setLong(1, componentId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    long cvId = rs.getLong(1);
                    String vText = rs.getString(2).trim();
                    long projectTypeId = rs.getLong(3);

                    compVersList.add(new Long(cvId));
                    projectTypeList.add(new Long(projectTypeId));
                    oldVersionList.add(vText);
                    newVersionList.add(vText);
                }
                Common.close(rs);
                Common.close(ps);
                rs = null;
                ps = null;

            } else {
                // given compVersId
                ps = conn.prepareStatement(
                        //"SELECT p.project_type_id, cc.component_name " +
                        //"FROM project p, comp_catalog cc, comp_versions cv " +
                        //"WHERE p.cur_version = 1 AND " +
                        //"cc.component_id = cv.component_id AND " +
                        //"cv.comp_vers_id = p.comp_vers_id AND " +
                        //"p.comp_vers_id = ?");

                        "SELECT p.project_type_id, cc.component_name, p.comp_vers_id " +
                        "FROM project p, comp_catalog cc, comp_versions cv " +
                        "WHERE p.cur_version = 1 " +
                        "AND cc.component_id = cv.component_id " +
                        "AND cv.comp_vers_id = p.comp_vers_id " +
                        "AND cv.component_id in ( " +
                        "   select component_id " +
                        "   from comp_versions cv " +
                        "   where cv.comp_vers_id = ? " +
                        "   ) ");

                ps.setLong(1, compVersId);
                rs = ps.executeQuery();
                long projectTypeId;
                if (rs.next()) {
                    projectTypeId = rs.getLong(1);
                    oldName = rs.getString(2);
                    newName = oldName;
                } else {
                    ps = conn.prepareStatement(
                            "SELECT 1, cc.component_name " +
                            "FROM comp_catalog cc, comp_versions cv " +
                            "WHERE cc.component_id = cv.component_id " +
                            "AND cv.component_id in ( " +
                            "    select component_id " +
                            "    from comp_versions cv " +
                            "    where cv.comp_vers_id = ? " +
                            "    ) ");

                    ps.setLong(1, compVersId);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        projectTypeId = rs.getLong(1);
                        oldName = rs.getString(2);
                        newName = oldName;
                    } else {
                        throw new RuntimeException();
                    }
                }
                Common.close(rs);
                Common.close(ps);
                rs = null;
                ps = null;

                compVersList.add(new Long(compVersId));
                projectTypeList.add(new Long(projectTypeId));
                oldVersionList.add(oldVersion);
                newVersionList.add(newVersion);
            }

            Iterator iterProjectType = projectTypeList.iterator();
            Iterator iterOldVersion = oldVersionList.iterator();
            Iterator iterNewVersion = newVersionList.iterator();
            for (Iterator iter = compVersList.iterator(); iter.hasNext();) {
                long cvId = ((Long) iter.next()).longValue();
                long ptId = ((Long) iterProjectType.next()).longValue();
                String oldV = (String) iterOldVersion.next();
                String newV = (String) iterNewVersion.next();
                info("PT.ddeRename(), renaming roles for project, compVersId: " + cvId);

                ProjectTypeManager projectTypeManager = (ProjectTypeManager) Common.getFromCache("ProjectTypeManager");
                ProjectType projectType = projectTypeManager.getProjectType(ptId);

                String prefixOld = oldName + " " +
                        oldV + " " +
                        projectType.getName() + " ";
                String prefixNew = newName + " " +
                        newV + " " +
                        projectType.getName() + " ";

                // TODO Add method to security manager instead of using custom sql
                psRoles = conn.prepareStatement(
                        "UPDATE security_roles " +
                        "SET description = ? " +
                        "WHERE description = ?");

                String newRoleName = prefixNew + "View Project";
                String oldRoleName = prefixOld + "View Project";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                int nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                newRoleName = prefixNew + "Submit";
                oldRoleName = prefixOld + "Submit";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                newRoleName = prefixNew + "Screen";
                oldRoleName = prefixOld + "Screen";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                newRoleName = prefixNew + "Review";
                oldRoleName = prefixOld + "Review";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                newRoleName = prefixNew + "Aggregation";
                oldRoleName = prefixOld + "Aggregation";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                newRoleName = prefixNew + "Submit Final Fix";
                oldRoleName = prefixOld + "Submit Final Fix";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                newRoleName = prefixNew + "Final Review";
                oldRoleName = prefixOld + "Final Review";
                psRoles.setString(1, newRoleName);
                psRoles.setString(2, oldRoleName);
                nr = psRoles.executeUpdate();
                if (nr != 1) {
                    info("Could not change rolename: " + oldRoleName);
                    //throw new RuntimeException("Could not change rolename: " + oldRoleName);
                }
                Common.close(psRoles);
                psRoles = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            Common.close(psRoles);
            Common.close(conn, ps, rs);
        }
    }

    /**
     * This method is required by the EJB Specification. Used to get the context ... for dynamic connection pools.
     *
     * @throws CreateException DOCUMENT ME!
     */
    public void ejbCreate() throws CreateException {
        dataSource = Common.getDataSource();

        try {
            InitialContext context = new InitialContext();

            DocumentManagerLocalHome dmHome = (DocumentManagerLocalHome) javax.rmi.PortableRemoteObject.narrow(context.lookup(
                    "com.topcoder.apps.review.document.DocumentManagerLocalHome"),
                    DocumentManagerLocalHome.class);
            documentManager = dmHome.create();

            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o, IdGenHome.class);
            idGen = idGenHome.create();

            /*
            ComponentManagerHome componentManagerHome = (ComponentManagerHome) javax.rmi.PortableRemoteObject.narrow(context.lookup(
                    ComponentManagerHome.EJB_REF_NAME),
                    ComponentManagerHome.class);
            */
        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        }

        try {
            log = LogFactory.getInstance().getLog("com.topcoder.apps.review.projecttracker.ProjectTrackerBean");
        } catch (LogException e) {
            e.printStackTrace();
        }

        debug("ProjectTrackerBean created");
    }

    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext ctx) throws EJBException {
        this.ejbContext = ctx;
    }

    public void setComplete(long projectId) throws Exception, RemoteException {

        final String setCompleteDate = "update project set complete_date = CURRENT where project_id = ? and cur_version = 1";
        final String setRatingInd = "update project_result set rating_ind = 1 where project_id = ? and valid_submission_ind = 1";

        PreparedStatement psCompleteDate = null;
        PreparedStatement psRatingInd = null;
        Connection conn = null;
        try {
            conn = dataSource.getConnection();

            psCompleteDate = conn.prepareStatement(setCompleteDate);
            psCompleteDate.setLong(1, projectId);
            psCompleteDate.execute();

            psRatingInd = conn.prepareStatement(setRatingInd);
            psRatingInd.setLong(1, projectId);
            psRatingInd.execute();


        } catch (SQLException sqe) {
            throw new Exception(sqe);
        } finally {
            Common.close(conn, psCompleteDate, null);
            Common.close(psRatingInd);
        }
    }

    public void finalizeScores(long projectId) throws EJBException {
        final String retrieveScores =
                " SELECT cvd.phase_id ," +
                "        cvd.level_id," +
                "        p.comp_vers_id," +
                "        DECODE(p.project_type_id, 1, 112, 2, 113) phase," +
                "        price, " +
                "        sb.submitter_id," +
                "        pi.end_date," +
                "        p.project_id, " +
                "       ROUND(sum(s.score)/3,2) score," +
                "   case when sb.submitter_id =  (" +
                "   select sub.submitter_id" +
                "   from submission sub " +
                "   where sub.project_id = p.project_id" +
                "   and sub.cur_version = 1" +
                "   and sub.is_removed = 0" +
                "   and sub.submission_type = 1" +
                "   and not exists (select submitter_id from submission" +
                "   where project_id = sub.project_id and" +
                "   submitter_id <> sub.submitter_id and " +
                "   submission_date < sub.submission_date " +
                "   and is_removed = 0" +
                "   and submission_type = 1 " +
                "   and cur_version = 1)" +
                "   ) then 1 else 0 end multiplier, " +
                "(select count(*) from scorecard sc, submission sb1 where sc.scorecard_type = 2 " +
                "and sc.cur_version = 1 and sc.submission_id = sb1.submission_id " +
                "and sb1.submission_type = 1 " +
                "and sb1.cur_version = 1 " +
                "and sb1.project_id = p.project_id " +
                "and sb1.submitter_id = sb.submitter_id " +
                "and not exists (select * from scorecard sc2, submission sb2 where sc2.scorecard_type = 2 " +
                "and sc2.cur_version = 1 and sc2.submission_id = sb2.submission_id " +
                "and sb2.submission_type = 1 " +
                "and sb2.cur_version = 1 " +
                "and sb2.project_id = p.project_id " +
                "and sb2.submitter_id <> sb.submitter_id " +
                "and sc2.author_id = sc.author_id " +
                "and sc2.score > sc.score " +
                ")) as wincount " +
                "  FROM scorecard s , project p, comp_version_dates cvd," +
                "       submission sb, phase_instance pi" +
                " WHERE s.scorecard_type = 2" +
                "   AND s.cur_version = 1" +
                "   AND p.cur_version = 1" +
                "   AND sb.cur_version = 1" +
                "   AND sb.submission_type = 1" +
                "   AND pi.cur_version = 1" +
                "   AND sb.project_id = p.project_id" +
                "   AND sb.submission_id = s.submission_id" +
                "   AND p.project_id = s.project_id" +
                "   AND ((p.project_type_id = 1 AND cvd.phase_id = 112) " +
                "       OR (p.project_type_id = 2 AND cvd.phase_id = 113))" +
                "   AND cvd.comp_vers_id = p.comp_vers_id" +
                "   AND is_completed = 1" +
                "   AND p.project_id = pi.project_id" +
                "   AND p.project_id = ?" +
                "   AND pi.phase_id = 1" +
                " GROUP BY cvd.phase_id, " +
                "          cvd.level_id, " +
                "          p.comp_vers_id," +
                "          4," +
                "          price," +
                "          sb.submitter_id, " +
                "          pi.end_date," +
                "          p.project_id," +
                "          11 " +
                " ORDER BY score desc, 11 desc";
        final String insertScores = "update project_result set " +
                "            final_score = ?," +
                "            placed = ?," +
                "            payment = ?" +
                "      where user_id = ?" +
                "             and project_id = ?";

        PreparedStatement psRetrieveScores = null;
        PreparedStatement psInsertScores = null;
        ResultSet rsScores = null;
        Connection conn = null;
        try {
            conn = dataSource.getConnection();

            psRetrieveScores = conn.prepareStatement(retrieveScores);
            psRetrieveScores.setLong(1, projectId);
            rsScores = psRetrieveScores.executeQuery();
            psInsertScores = conn.prepareStatement(insertScores);
            int place = 0;
            while (rsScores.next()) {
                double money = rsScores.getLong("price");
                double score = rsScores.getDouble("score");

                //increment place
                place = place + 1;
                if (place == 2) {
                    money = Math.round((money * .5));
                }
                //GT Removed this bc we don't pay 3rd anymore!
                //else if(place == 3)
                //{
                //    money = Math.round((money *.25));
                //}
                else if (place != 1 || score < 70) {
                    money = 0;
                }

                //score
                psInsertScores.setDouble(1, score);

                //NEED  TO ADD TO CONFIG
                //place
                if (score < 70) {
                    psInsertScores.setNull(2, Types.INTEGER);
                    money = 0;
                } else {
                    psInsertScores.setInt(2, place);
                }

                //money
                psInsertScores.setDouble(3, money);
                psInsertScores.setLong(4, rsScores.getLong("submitter_id"));
                psInsertScores.setLong(5, projectId);

                psInsertScores.executeUpdate();
            }
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
        } finally {
            Common.close(rsScores);
            Common.close(psRetrieveScores);
            Common.close(psInsertScores);
            Common.close(conn);
        }

    }


}
