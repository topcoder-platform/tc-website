/*
 * UserManagerTest.java
 *
 * Created on June 30, 2003, 7:08 PM
 */

package com.topcoder.apps.review.stresstests;

import junit.framework.*;
import com.topcoder.security.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

/**
 * Tests UserManager performance.
 *
 * @author  valeriy
 * @version 1.0
 */
public class UserManagerTest extends AbstractStressTest {

    public static final long USERID = 2059064;

    /** Creates a new instance of UserManagerTest */
    public UserManagerTest(String name) {
        super(name);
    }

    /** Tests getUser(TCSubject) method
     *  in single thread
     */
    public void testGetUser1_10() throws Exception {
        run(1, 10, 0, new Object[]{new Long(USERID)});
    }

    /** Tests getUser(TCSubject) method
     *  in 10 threads
     */
    public void testGetUser10_10() throws Exception {
        run(10, 10, 0, new Object[]{new Long(USERID)});
    }


    Worker getWorker(int count, int type, Object[] params) {
        return new UserWorker(count, params);
    }

    class UserWorker extends Worker {

        long userId;

        UserWorker(int count, Object[] params) {
            super(count, params);
            userId = ((Long) params[0]).longValue();
        }

        public void process() throws Exception {
            User user = userManager.getUser(new TCSubject(userId));
            if (user == null) {
                System.out.println("User " + userId + " not found. You may need to adjust USERID variable.");
            }
        }
    }

    public static Test suite() {
        return new TestSuite(UserManagerTest.class);
    }
}
