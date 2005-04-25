/*
 * AbstractStressTest.java
 *
 * Created on June 30, 2003, 7:08 PM
 */

package com.topcoder.apps.review.stresstests;

import junit.framework.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

import javax.naming.*;
import javax.rmi.PortableRemoteObject;

import org.apache.cactus.ServletTestCase;

/**
 * Superclass for all stress tests.
 *
 * @author  valeriy
 * @version 1.0
 */
public abstract class AbstractStressTest extends ServletTestCase {

    protected UserManagerLocal userManager;
    protected DocumentManagerLocal documentManager;
    protected ProjectTrackerLocal projectTracker;

    /** Creates a new instance of AbstractStressTest */
    public AbstractStressTest(String name) {
        super(name);
    }

    protected void setUp() throws Exception {
        Context ctx = new InitialContext();

        ProjectTrackerLocalHome phome = (ProjectTrackerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome"), ProjectTrackerLocalHome.class);
        this.projectTracker = phome.create();

        UserManagerLocalHome uhome = (UserManagerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.projecttracker.UserManagerLocalHome"), UserManagerLocalHome.class);
        this.userManager = uhome.create();

        DocumentManagerLocalHome dhome = (DocumentManagerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.document.DocumentManagerLocalHome"), DocumentManagerLocalHome.class);
        this.documentManager = dhome.create();
    }

    public void run(int threadCount, int opCount, int type, Object[] params) throws Exception {
        Worker[] threads = new Worker[threadCount];
        long start = System.currentTimeMillis();
        //for (int i = 0; i < threadCount; i++) {
        threads[0] = getWorker(opCount, type, params);
        threads[0].run();
        //}
        int failed = 0;
        //for (int i = 0; i < threadCount; i++) {
        //    threads[i].join();
        if (threads[0].failed) failed++;
        //}
        long total = System.currentTimeMillis() - start;
        System.out.println("type=" + type + " threads=" + threadCount + " ops=" + opCount + " time=" + total + " ops/sec=" + ((double) threadCount * opCount / total * 1000) + " failed=" + failed);
        if (failed > 0) fail("Test failed");
    }

    abstract Worker getWorker(int count, int type, Object[] params);

    abstract class Worker extends Thread {

        int count;
        Object[] params;
        boolean failed = false;

        Worker(int count, Object[] params) {
            this.count = count;
            this.params = params;
        }

        public void run() {
            try {
                for (int i = 0; i < count; i++) {
                    process();
                }
            } catch (Exception e) {
                failed = true;
                e.printStackTrace();
            }
        }

        public abstract void process() throws Exception;
    }


}
