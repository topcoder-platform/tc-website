package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.rmi.*;

import java.sql.*;

import javax.naming.*;

import javax.rmi.PortableRemoteObject;

import javax.sql.*;


/**
 *
 *
 * @author $author$
 * @version $Revision$
 */
public class SimpleFailureCases extends FailureCasesWithData {
    public SimpleFailureCases(String name) {
        super(name);
    }

    public void setUp()
            throws Exception {
        super.setUp();
        log("Running a Simple Failure Test Case");
    }

    /**
     *
     *	Saving a single project like this should fail because
     *	we haven't saved the userroles yet
     *
     */
    public void testSimpleProjectSave()
            throws Exception {
        for (int i = 0; i < projects.length; i++) {
            pt.saveProject(projects[i], "Save test", null);
        }
    }

    private void saveUserRoles(Project p)
            throws Exception {
        UserRole[] arr = p.getParticipants();
        for (int j = 0; j < arr.length; j++) saveUserRole(arr[j], p);
    }

    /**
     *
     *	Saving a single project like this should succeed
     *
     */
    public void testShouldSucceed()
            throws Exception {
        saveUserRoles(projects[0]);
        pt.saveProject(projects[0], "Save test", null);
    }

    public void testOverflowProjectNotes()
            throws Exception {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 50000; i++) sb.append("testtesttest");
        saveUserRoles(projects[0]);
        projects[0].setNotes(sb.toString());
        pt.saveProject(projects[0], "Save test", null);
    }

    public void testOverflowProjectSaveReason()
            throws Exception {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 50000; i++) sb.append("testtesttest");
        saveUserRoles(projects[0]);
        pt.saveProject(projects[0], sb.toString(), null);
    }

    public void testSetProjectURL()
            throws Exception {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 50000; i++) sb.append("testtesttest");
        saveUserRoles(projects[0]);
        projects[0].setProjectInformationURL(new java.net.URL("gopher", sb.toString(), "info.txt"));
        pt.saveProject(projects[0], "Save test", null);
    }

    public void testProjectTrackerBadGetProjectByIdNullUser()
            throws Exception {
        try {
            pt.getProjectById(1000, null);
        } catch (Throwable t) {
            System.out.println("Making a bad request for aproject by id: null user");
            t.printStackTrace();
            return;
        }
        fail("Expected an exception for making a bad request to get a project");
    }

    public void testProjectTrackerBadGetProjectBadId()
            throws Exception {
        pt.getProjectById(100000, new TCSubject(users[0].getId()));
    }

    public void testProjectTrackerBadGetProjectByNullUPI()
            throws Exception {
        try {
            pt.getProject(null, new TCSubject(users[0].getId()));
        } catch (Throwable t) {
            System.out.println("Making a bad request for aproject by userprojectinfo: null userprojectinfo");
            t.printStackTrace();
            return;
        }
        fail("Expected an exception for making a bad request to get a project");
    }

    public void testProjectTrackerBadGetProjectNullUser()
            throws Exception {
        UserProjectInfo[] arrUPI = pt.getProjectInfo(new TCSubject(users[0].getId()));
        try {
            pt.getProject(arrUPI[0], null);
        } catch (Throwable t) {
            System.out.println("Making a bad request for aproject by userprojectinfo: null user");
            t.printStackTrace();
        }

    }

}
