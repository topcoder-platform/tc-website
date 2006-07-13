/*
 * ProjectConverter.java
 *
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.review.projecttracker.ProjectTracker;
import com.topcoder.apps.review.projecttracker.ProjectTrackerHome;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.security.TCSubject;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.Hashtable;

/**
 * This class is used to convert(create) online review projects
 * for existing projects in the dde(tcs site).
 *
 * @author FatClimber
 */
public class ProjectConverter {
    private static Connection getInformixConnection() throws SQLException {
        new com.informix.jdbc.IfxDriver();
        //String url = "jdbc:informix-sqli://65.112.118.208:1526/tcs_catalog2:" +
        //        "INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=catalyst";
        String url = "jdbc:informix-sqli://172.16.20.25:1526/tcs_catalog2:" +
                "INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=catalyst";
        Connection conn = DriverManager.getConnection(url);
        //conn.setAutoCommit(false);
        return conn;
    }

    private static ProjectTracker getProjectTracker() {
        InitialContext initialContext = null;
        ProjectTrackerHome ptHome;
        ProjectTracker pt = null;
        try {
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            //env.put(Context.PROVIDER_URL, "localhost:1099"); //providerUrl);
            env.put(Context.PROVIDER_URL, "localhost:1199"); //providerUrl);
            initialContext = new InitialContext(env);
            //initialContext = new InitialContext();

            java.lang.Object objRef =
                    initialContext.lookup(ProjectTrackerHome.EJB_REF_NAME);
            ptHome =
                    (ProjectTrackerHome) PortableRemoteObject.narrow(
                            objRef,
                            ProjectTrackerHome.class);
            pt = ptHome.create();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                initialContext.close();
            } catch (NamingException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }
        return pt;
    }


    public static void convert() throws SQLException, RemoteException {
        ProjectTracker pt = getProjectTracker();
        Connection conn = getInformixConnection();

        FileOutputStream logFile;
        FileOutputStream removeFile;
        try {
            logFile = new FileOutputStream("convert.log");
            removeFile = new FileOutputStream("convert_remove.sql");
        } catch (FileNotFoundException e) {
            System.err.println("Unable to create log-files!");
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        PrintStream log = new PrintStream(logFile);
        PrintStream remove = new PrintStream(removeFile);

        TCSubject requestor = new TCSubject(287998); // TCSMicah

        // SQL Query to retrieve projects that have
        // not passed submission-phase.
        PreparedStatement ps = conn.prepareStatement(
                "SELECT cc.component_name, cv.version_text, " +
                "cv.phase_id, cc.description, " +
                "cv.comp_vers_id, cv.component_id, " +
                "cv.version, " +
                "cvd.posting_date, " +
                "cvd.initial_submission_date, " +
                "cvd.winner_announced_date, " +
                "cvd.final_submission_date, " +
                "cvd.estimated_dev_date, " +
                "cvd.screening_complete_date, " +
                "cvd.review_complete_date, " +
                "cvd.aggregation_complete_date, " +
                "cvd.phase_complete_date, " +
                "cvd.production_date," +
                "cvd.level_id  " +
                "FROM comp_catalog cc, comp_versions cv, " +
                "comp_version_dates cvd " +
                "WHERE " +
                "cc.component_id = cv.component_id AND " +
                "cv.comp_vers_id = cvd.comp_vers_id AND " +
                "cv.phase_id = cvd.phase_id AND " +
                "cc.status_id = 102 AND " +
                "cv.phase_id in (112,113) AND " +
                "cvd.initial_submission_date >= EXTEND(CURRENT, YEAR TO DAY) " +
                "ORDER BY cv.phase_id, cc.component_name ");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String projectName = rs.getString(1);
            String version = rs.getString(2).trim();
            long phaseId = rs.getLong(3);
            String overview = rs.getString(4);
            long compVersId = rs.getLong(5);
            long componentId = rs.getLong(6);
            long versionId = rs.getLong(7);
            Date postingDate = rs.getDate(8);
            Date initialSubmissionDate = rs.getDate(9);
            Date winnerAnnouncedDate = rs.getDate(10);
            Date finalSubmissionDate = rs.getDate(11);
            Date estimatedDevDate = rs.getDate(12);
            Date screeningCompleteDate = rs.getDate(13);
            Date reviewCompleteDate = rs.getDate(14);
            Date aggregationCompleteDate = rs.getDate(15);
            Date phaseCompleteDate = rs.getDate(16);
            Date productionDate = rs.getDate(17);
            long levelId = rs.getLong("level_id");

            System.out.println("name: " + projectName +
                    " ,version: " + version +
                    " ,phaseId: " + phaseId);

            long projectTypeId = ProjectType.ID_DESIGN;
            Date[] dates;
            if (phaseId == 112) {
                projectTypeId = ProjectType.ID_DESIGN;
                dates = new Date[]{
                    postingDate,
                    initialSubmissionDate,
                    screeningCompleteDate,
                    reviewCompleteDate,
                    aggregationCompleteDate,
                    winnerAnnouncedDate,
                    finalSubmissionDate,
                    phaseCompleteDate,
                    estimatedDevDate
                };
            } else if (phaseId == 113) {
                projectTypeId = ProjectType.ID_DEVELOPMENT;
                dates = new Date[]{
                    postingDate,
                    initialSubmissionDate,
                    screeningCompleteDate,
                    reviewCompleteDate,
                    aggregationCompleteDate,
                    winnerAnnouncedDate,
                    finalSubmissionDate,
                    phaseCompleteDate,
                    productionDate
                };
            } else {
                log.println("Error: phaseId not in (112,113), could not convert project! " +
                        "compVersId: " + compVersId + " ,phaseId: " + phaseId);
                continue;
            }

            // Use ProjectTracker.createProject()
            // to create project and insert tables:
            // project, phase_instance, payment_info, r_user_role
            long projectId = 0;
/*
            try {
                projectId = pt.convertProject(projectName, version, versionId,
                        //componentId, compVersId, phaseId, projectTypeId, overview, dates, requestor, levelId);
            } catch (RemoteException e2) {
                log.println(e2.toString());
                throw new RuntimeException();
            } catch (TCException e2) {
                log.println(e2.toString());
                continue;
            }
*/
            remove.println("\n-- Delete project with projectId: " + projectId);
            remove.println("DELETE FROM payment_info\n " +
                    "WHERE payment_info_id IN\n " +
                    "(SELECT payment_info_id\n " +
                    "FROM r_user_role\n " +
                    "WHERE project_id = " + projectId + ");");
            remove.println("DELETE FROM submission WHERE project_id = " + projectId + ";");
            remove.println("DELETE FROM r_user_role WHERE project_id = " + projectId + ";");
            remove.println("DELETE FROM phase_instance WHERE project_id = " + projectId + ";");
            remove.println("DELETE FROM project WHERE project_id = " + projectId + ";");
            String projectTypeString;
            if (projectTypeId == 1)
                projectTypeString = "Design";
            else
                projectTypeString = "Development";
            String projectVersionType = projectName + " " +
                    version + " " +
                    projectTypeString;
            //projectTypeManager.getProjectType(projectTypeId).getName() + " ";
            remove.println("DELETE FROM security_perms " +
                    "WHERE permission LIKE '% " + projectId + "';");
            remove.println("DELETE FROM user_role_xref\n " +
                    "WHERE role_id IN\n " +
                    "(SELECT role_id\n " +
                    "FROM security_roles\n " +
                    "WHERE description LIKE '" + projectVersionType + " %');");
            remove.println("DELETE FROM security_roles\n " +
                    "WHERE description LIKE '" + projectVersionType + " %';");

        } // end of while get open projects
        Common.close(rs);
        Common.close(ps);
        Common.close(conn);
        try {
            logFile.close();
            removeFile.close();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Connection informixConnection = null;
        try {
            convert();
        } catch (Exception e) {
            System.err.println("Error converting projects(exception thrown):");
            e.printStackTrace();
        } finally {
            if (informixConnection != null) {
                try {
                    informixConnection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
