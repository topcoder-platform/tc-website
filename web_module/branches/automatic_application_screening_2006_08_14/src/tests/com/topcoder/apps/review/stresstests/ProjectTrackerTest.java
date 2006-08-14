/*
 * ProjectTrackerTest.java
 *
 * Created on June 30, 2003, 7:08 PM
 */

package com.topcoder.apps.review.stresstests;

import junit.framework.*;
import com.topcoder.security.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

/**
 * Tests ProjectTracker performance.
 *
 * @author  valeriy
 * @version 1.0
 */
public class ProjectTrackerTest extends AbstractStressTest {

    public static final long USERID = 2059064;
    public static final long PROJECTID = 2809382;

    private TCSubject user;

    /** Creates a new instance of ProjectTrackerTest */
    public ProjectTrackerTest(String name) {
        super(name);
    }

    protected void setUp() throws Exception {
        super.setUp();
        user = /*userManager.getUser(*/new TCSubject(USERID);
        if (user == null) {
            System.out.println("User " + USERID + " not found. You may need to adjust USERID variable.");
        }
    }

    /** Tests getProjectById(long, TCSubject) method
     *  in single thread
     */
    public void testGetProjectById1_10() throws Exception {
        run(1, 10, 0, new Object[]{new Long(PROJECTID), user});
    }

    /** Tests getProjectById(long, TCSubject) method
     *  in 10 threads
     */
    public void testGetProjectById10_10() throws Exception {
        run(10, 10, 0, new Object[]{new Long(PROJECTID), user});
    }

    /** Tests saveProject(Project, String) method
     *  in single thread
     */
    public void testSaveProject1_10() throws Exception {
        run(1, 10, 1, new Object[]{new Long(PROJECTID), user});
    }

    /** Tests getProjectInfo(TCSubject) method
     *  in single thread
     */
    public void testGetProjectInfo1_10() throws Exception {
        run(1, 10, 2, new Object[]{user});
    }

    /** Tests getProjectInfo(TCSubject) method
     *  in 10 threads
     */
    public void testGetProjectInfo10_10() throws Exception {
        run(10, 10, 2, new Object[]{user});
    }

    Worker getWorker(int count, int type, Object[] params) {
        switch (type) {
            case 0:
                return new ProjectWorker1(count, params);
            case 1:
                return new ProjectWorker2(count, params);
            case 2:
                return new ProjectWorker3(count, params);
        }
        return null;
    }

    class ProjectWorker1 extends Worker {

        long projectId;
        TCSubject user;

        ProjectWorker1(int count, Object[] params) {
            super(count, params);
            projectId = ((Long) params[0]).longValue();
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            Project prj = projectTracker.getProjectById(projectId, user);
            if (prj == null) {
                System.out.println("Project " + projectId + " not found. You may need to adjust PROJECTID variable.");
            }
        }
    }

    class ProjectWorker2 extends Worker {

        long projectId;
        TCSubject user;

        ProjectWorker2(int count, Object[] params) {
            super(count, params);
            projectId = ((Long) params[0]).longValue();
            user = (TCSubject) params[1];
        }

        public void process() throws Exception {
            Project prj = projectTracker.getProjectById(projectId, user);
            if (prj == null) {
                System.out.println("Project " + projectId + " not found. You may need to adjust PROJECTID variable.");
            } else {
                prj.setNotes("notes");
                projectTracker.saveProject(prj, "stress test", user);
            }
        }
    }

    class ProjectWorker3 extends Worker {

        TCSubject user;

        ProjectWorker3(int count, Object[] params) {
            super(count, params);
            user = (TCSubject) params[0];
        }

        public void process() throws Exception {
            UserProjectInfo[] prjs = projectTracker.getProjectInfo(user);
            if (prjs == null || prjs.length == 0) {
                System.out.println("Projects for user " + user.getUserId() + " not found. You may need to adjust USERID variable.");
            }
        }
    }

    public static Test suite() {
        final TestSuite suite = new TestSuite();

        suite.addTest(new TestSuite(ProjectTrackerTest.class));

        return suite;
    }
}
