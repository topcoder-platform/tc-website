package com.topcoder.mpsqas.tester;

import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.shared.util.logging.Logger;

import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * TesterWaiter is a wrapper for the tester that allows other classes to simple do:<br>
 * <code>String testResult=new TesterWaiter().test(classFiles,packagename,classname,paramtypes,args);</code><br>
 * and get a result back.  This way the other classes do not have to deal with sockets or threads, if they do not want.
 * The class has sends the test to the tester, then waits for a response.  When it gets a response it returns it.  It
 * gives up if it waits longer than 2*TIME_OUT_MILLIS
 *
 * @author mitalub
 */
public class TesterWaiter extends Thread {
    private boolean quit;
    private ArrayList testData;
    private boolean testComplete;
    private ArrayList testResponse;
    private static Logger log = Logger.getLogger(TesterWaiter.class);

    /**
     * The test method is the method to call to get code tested.  It returns an ArrayList whose first element is the result of the test as a String,
     * or a time out message. The second element is the result Object, or null.   It starts a thread to do all the work, waits for the thread to
     * signal it is done, or waits until a time out, whichever comes first.
     *
     * @param classFiles A HashMap of classname->classfile
     * @param packageName The name of the package in which the class to test lives.
     * @param className The name of the class to test.
     * @param methodName The name of the method to test
     * @param paramTypes The types of parameters the method takes.
     * @param args  The arguments, as an Object[]
     */
    public ArrayList test(HashMap classFiles, String packageName, String className, String methodName, ArrayList paramTypes, Object[] args) {
        log.debug("In TesterWaiter.test()");
        ArrayList testResults;
        this.testData = new ArrayList(6);
        this.testData.add(classFiles);
        this.testData.add(packageName);
        this.testData.add(className);
        this.testData.add(methodName);
        this.testData.add(paramTypes);
        this.testData.add(args);
        long startTime = System.currentTimeMillis();
        this.testComplete = false;
        this.quit = false;
        start();
        long starttime = System.currentTimeMillis();
        while (!testComplete && System.currentTimeMillis() - startTime < 2.0 * ApplicationConstants.TIME_OUT_MILLIS) {
            try {
                Thread.sleep(10);
            } catch (Exception e) {
            }
        }

        if (!testComplete) {
            this.quit = true;
            testResults = new ArrayList();
            testResults.add("Tester timed out.");
            testResults.add(null);
        } else {
            testResults = this.testResponse;
        }
        log.debug("TesterWaiter.test returning " + testResults);
        return testResults;
    }

    /**
     * run takes care of the communication with the tester.  It gets a connection to the tester, sends the test information,
     * gets the response.  When it is done, it sets a flag so the test method will know.  It is very persitant.  That is, if
     * there are any exceptions it will try, and try again until the test method says time is up.
     */
    public void run() {
        Socket socket = null;
        ObjectOutputStream outputStream = null;
        ObjectInputStream inputStream = null;

        //first, try to get connected to the tester
        while (!this.testComplete && !this.quit) {
            log.debug("Getting tester connection.");
            try {
                socket = new Socket(ApplicationConstants.TESTER_IP, ApplicationConstants.PUT_TEST_PORT);
                outputStream = new ObjectOutputStream(new BufferedOutputStream(socket.getOutputStream()));
                outputStream.flush();
                inputStream = new ObjectInputStream(socket.getInputStream());

                //next, send the test request
                outputStream.writeObject(testData);
                outputStream.flush();

                log.debug("Waiting for response.");
                //wait for the response
                while (!this.quit && !this.testComplete) {
                    try {
                        socket.setSoTimeout((int) ApplicationConstants.TIME_OUT_MILLIS);
                        this.testResponse = (ArrayList) inputStream.readObject();
                        this.testComplete = true;
                    } catch (InterruptedIOException iioe) {
                    }
                }
            } catch (Exception e) {
                log.debug("Error in test waiter.");
                e.printStackTrace();
                try {
                    Thread.sleep(500);
                } catch (Exception e2) {
                }
            }
        }

        //lastly, try closing stuff up
        try {
            inputStream.close();
        } catch (Exception e) {
        }
        try {
            outputStream.close();
        } catch (Exception e) {
        }
        try {
            socket.close();
        } catch (Exception e) {
        }
    }

}
