/*
 * TCS Online Review Application
 *
 * Sub2PTProxy.java
 *
 * Copyright (c) 2003 TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.PaymentInfo;
import com.topcoder.apps.review.projecttracker.PaymentStatus;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.Role;

import com.topcoder.security.TCSubject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Time;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;

/**
 * An implementation of the PTProxy interface that encapsulates the
 * implementation details of Submitter2's Online Review submission.  Provides
 * implementations of some of the ProjectTracker interfaces as anonymous inner
 * classes.
 *
 * @author ThinMan
 * @version 1.0
 */
class Sub2PTProxy implements PTProxy {

    private final static String HOME_NAME =
            "java:comp/env/projecttracker/ProjectTracker";
    private final static Random rand = new Random();

    /** the number of defined project phases */
    private final static int NUMBER_PHASES = 8;
    private static AccuracyTestUtils utils;
    private ProjectTrackerLocal bean;
    static User adminUser;  // must be externally initialized

    static {
        try {
            utils = new AccuracyTestUtils();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Sub2PTProxy() throws Exception {
        Context ctx = new InitialContext();
        ProjectTrackerLocalHome home =
                (ProjectTrackerLocalHome) ctx.lookup(HOME_NAME);
        bean = home.create();
    }

    public Project getProject(UserProjectInfo projectInfo)
            throws Exception {
        return bean.getProject(projectInfo, new TCSubject(adminUser.getId()));
    }

    public UserProjectInfo[] getProjectInfo(User user) throws Exception {
        return bean.getProjectInfo(new TCSubject(user.getId()));
    }

    public Project getProject(long projectId, User requestor)
            throws Exception {
        return bean.getProjectById(projectId, new TCSubject(requestor.getId()));
    }


    public void saveProject(Project project, String reason, User requestor)
            throws Exception {
        bean.saveProject(project, reason, new TCSubject(requestor.getId()));
    }

    /**
     * @param rrid the reviewer responsibility id; <= 0 for no responsibility
     */
    public void assignUserRole(User user, Role role,
                               ReviewerResponsibility resp, Project proj)
            throws Exception {
        UserRole[] uroles = proj.getParticipants();

        for (int i = 0; i < uroles.length; i++) {
            if ((role.equals(uroles[i].getRole()))
                    && ((resp == null)
                    ? (uroles[i].getReviewerResponsibility() == null)
                    : (resp.equals(uroles[i].getReviewerResponsibility())))) {
                System.err.println("*** Assigning user " + user.getId()
                        + " to user role " + uroles[i].getId());
                uroles[i].setUser(user);
                proj.setParticipants(uroles);

                return;
            }
        }

        // Define a new User Role
        UserRole[] newRoles = new UserRole[uroles.length + 1];

        System.arraycopy(uroles, 0, newRoles, 0, uroles.length);
        newRoles[uroles.length] = new UserRole(0L, role, user, null, resp, 1L);
        newRoles[uroles.length].setId(0L);  // A hack to set the dirty flag
        proj.setParticipants(newRoles);
    }

    public static void removeUserRoleStatic(UserRole ur, Connection con)
            throws Exception {
        Statement stmt = con.createStatement(
                ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
        PreparedStatement ps = con.prepareStatement(
                "delete from payment_info where payment_info_id=? and "
                + "modify_user=?;");

        ps.setLong(2, adminUser.getId());

        ResultSet rs = stmt.executeQuery(
                "select * from r_user_role where r_user_role_id="
                + ur.getId() + " and modify_user=" + adminUser.getId() + ";");
        while (rs.next()) {
            ps.setLong(1, rs.getLong(6));
            ps.executeUpdate();
            rs.deleteRow();
        }
    }

    public Project createProject(String name, String version, User manager)
            throws Exception {
        Connection con = Sub2PTProxy.utils.getConnection();
        long versionId = -1L;

        try {
            versionId = createProjectStatic(name, version, con);
        } finally {
            con.close();
        }
        UserProjectInfo[] upis;
        TCSubject subject = new TCSubject(manager.getId());
        Date[] dates = new Date[NUMBER_PHASES * 2];
        Calendar cal = Calendar.getInstance();

        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        dates[0] = new Date(cal.getTimeInMillis());
        for (int i = 1; i < NUMBER_PHASES * 2; i += 2) {
            cal.add(Calendar.DATE, 2);
            dates[i] = new Date(cal.getTimeInMillis());
            if ((i + 1) < (NUMBER_PHASES * 2)) {
                dates[i + 1] = dates[i];
            }
        }

        bean.createProject(name, version, versionId, 1L, name + " overview",
                dates, subject);
        upis = bean.getProjectInfo(subject);
        Arrays.sort(upis,
                new Comparator() {
                    public int compare(Object o1, Object o2) {
                        UserProjectInfo u1 = (UserProjectInfo) o1;
                        UserProjectInfo u2 = (UserProjectInfo) o2;
                        long diff = u1.getId() - u2.getId();

                        if (diff < 0L) {
                            return 1;
                        } else if (diff > 0L) {
                            return -1;
                        } else {
                            return 0;
                        }
                    }
                });
        for (int i = 0; i < upis.length; i++) {
            if (upis[i].getProjectName().equals(name)
                    && upis[i].getProjectVersion().equals(version)) {
                return bean.getProject(upis[i], subject);
            }
        }

        return null;
    }

    public void registerDeveloper(User user, Project proj, Connection con)
            throws Exception {
        PreparedStatement ps = con.prepareStatement(
                "select version from comp_versions where comp_vers_id=?;");
        ps.setLong(1, proj.getCompVersId());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            bean.userInquiry(user.getId(), proj.getCatalogueId(),
                    rs.getLong(1), proj.getProjectType().getId());
        } else {
            throw new IllegalStateException(
                    "Specified project has unrecognized comp version id");
        }
    }

    /**
     * Creates the comp_versions and comp_catalog rows for a new project, and
     * returns the version ID.  This method can be used to prepare for
     * createProject(String, String, User).  In other words, it is a utility
     * method for the tests' use.
     *
     * @return the version ID for the newly created [TCS] project
     */
    public static long createProjectStatic(String name, String version,
                                           Connection con) throws Exception {
        PreparedStatement ps;
        Statement stmt;
        long ccid = -1L;
        long versionId = -1L;
        boolean okay;

        // create comp_versions row
        ps = con.prepareStatement("insert into comp_versions "
                + "(comp_vers_id, component_id, version, version_text, "
                + "create_time, phase_id, phase_time, price, comments) "
                + "values (?, NULL, "
                + "(select max(version) from comp_versions) + 1, "
                + "?, ?, ?, ?, ?, ?);");
        ps.setString(2, version);
        ps.setTime(3, new Time(System.currentTimeMillis()));
        ps.setLong(4, Phase.ID_SUBMISSION);
        ps.setTime(5, new Time(System.currentTimeMillis()));
        ps.setDouble(6, 0.0);
        ps.setString(7, "For testing");
        okay = false;
        for (int i = 0; i < 3; i++) {
            versionId = Math.abs(rand.nextLong()) / 1000;
            ps.setLong(1, versionId);
            try {
                ps.executeUpdate();
                okay = true;
                break;
            } catch (SQLException sqle) {
                sqle.printStackTrace(System.err);
            }
        }
        ps.close();
        if (!okay) {
            throw new IllegalStateException("Could not create version entry");
        }

        // create comp_catalog row
        ps = con.prepareStatement("insert into comp_catalog "
                + "(component_id, current_version, short_desc, "
                + "component_name, description, function_desc, create_time, "
                + "status_id) values (?, ?, ?, ?, ?, ?, ?, 1);");
        ps.setLong(2, versionId);
        ps.setString(3, "Project for testing");
        ps.setString(4, name);
        ps.setString(5, "Project for testing");
        ps.setString(6, "Project for testing");
        ps.setTime(7, new Time(System.currentTimeMillis()));
        okay = false;
        for (int i = 0; i < 3; i++) {
            ccid = Math.abs(rand.nextLong()) / 1000;
            ps.setLong(1, ccid);
            try {
                ps.executeUpdate();
                okay = true;
                break;
            } catch (SQLException sqle) {
                sqle.printStackTrace(System.err);
            }
        }
        ps.close();
        if (!okay) {
            stmt = con.createStatement();
            stmt.executeUpdate(
                    "delete from comp_versions where comp_vers_id="
                    + versionId + ";");
            stmt.close();
            throw new IllegalStateException(
                    "Could not create comp_catalog row");
        }

        // update comp_versions row
        ps = con.prepareStatement(
                "update comp_versions set component_id=? where comp_vers_id=?;");
        ps.setLong(1, ccid);
        ps.setLong(2, versionId);
        ps.executeUpdate();
        ps.close();

        return versionId;
    }

    public static void removeProject(Project proj, Connection con)
            throws Exception {
        Statement stmt = con.createStatement();

        UserRole[] urs = proj.getParticipants();

        for (int i = 0; i < urs.length; i++) {
            removeUserRoleStatic(urs[i], con);
        }

        stmt.executeUpdate("delete from project where project_id="
                + proj.getId() + ";");
        stmt.executeUpdate("delete from phase_instance where project_id="
                + proj.getId() + ";");
        stmt.executeUpdate(
                "update comp_versions set component_id=NULL where component_id="
                + proj.getId() + ";");
        stmt.executeUpdate("delete from comp_catalog where component_id="
                + proj.getId() + ";");
        stmt.executeUpdate("delete from comp_versions where component_id="
                + proj.getId() + ";");
        stmt.close();
    }

    public void remove() throws Exception {
        bean.remove();
    }
}

