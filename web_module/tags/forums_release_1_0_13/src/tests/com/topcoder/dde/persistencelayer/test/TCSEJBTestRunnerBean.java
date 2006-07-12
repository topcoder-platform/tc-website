/*
 * TCSEJBTestRunnerBean.java
 *
 * Adapted by John C. Bollinger from code from the JUnitEJB utility
 *
 * Distributable under LGPL license.
 * See terms of license at gnu.org.
 */
package com.topcoder.dde.persistencelayer.test;

import java.lang.reflect.Constructor;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.transaction.Status;
import javax.transaction.SystemException;

import net.sourceforge.junitejb.*;

/**
 * A substitute EJBTestRunner implementation that passes a session context
 * to test cases if they support it.
 *
 * @see EJBTestRunner
 *
 * @author <a href="mailto:dain@daingroup.com">Dain Sundstrom</a>
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TCSEJBTestRunnerBean implements SessionBean {
    transient private SessionContext ctx;

    /**
     * Runs the specified test method on the specified class.
     * @param className the name of the test class
     * @param methodName the name of the test method
     * @throws RemoteTestException If any throwable is thrown during
     * execution of the method, it is wrapped with a RemoteTestException and
     * rethrown.
     */
    public void run(String className, String methodName)
            throws RemoteTestException {

        EJBTestCase testCase = getTestInstance(className, methodName);

        setUpEJB(testCase);

        RemoteTestException exception = null;
        try {
            runTestCase(testCase);
        } catch (RemoteTestException e) {
            exception = e;
        } finally {
            try {
                tearDownEJB(testCase);
            } catch (RemoteTestException e) {
                // favor the run exception if one was thrown
                if (exception == null) {
                    exception = e;
                }
            }
            if (exception != null) {
                throw exception;
            }
        }
    }

    /**
     * Runs the setUpEJB method on the specified test case
     * @param testCase the actual test case that will be run
     * @throws RemoteTestException If any throwable is thrown during execution
     * of the method, it is wrapped with a RemoteTestException and rethrown.
     */
    private void setUpEJB(EJBTestCase testCase) throws RemoteTestException {
        try {
            ctx.getUserTransaction().begin();
            try {
                testCase.setUpEJB();
            } catch (Throwable e) {
                throw new RemoteTestException(e);
            }
            if (ctx.getUserTransaction().getStatus() == Status.STATUS_ACTIVE) {
                ctx.getUserTransaction().commit();
            }
        } catch (Throwable e) {
            try {
                ctx.getUserTransaction().rollback();
            } catch (SystemException unused) {
                // eat the exception we are exceptioning out anyway
            }
            if (e instanceof RemoteTestException) {
                throw (RemoteTestException) e;
            } else {
                throw new RemoteTestException(e);
            }
        }
    }

    /**
     * Runs the test method on the specified test case
     * @param testCase the actual test case that will be run
     * @throws RemoteTestException If any throwable is thrown during execution
     * of the method, it is wrapped with a RemoteTestException and rethrown.
     */
    private void runTestCase(EJBTestCase testCase) throws RemoteTestException {
        try {
            ctx.getUserTransaction().begin();
            try {
                testCase.runBare();
            } catch (Throwable e) {
                throw new RemoteTestException(e);
            }
            if (ctx.getUserTransaction().getStatus() == Status.STATUS_ACTIVE) {
                ctx.getUserTransaction().commit();
            }
        } catch (Throwable e) {
            try {
                ctx.getUserTransaction().rollback();
            } catch (SystemException unused) {
                // eat the exception we are exceptioning out anyway
            }
            if (e instanceof RemoteTestException) {
                throw (RemoteTestException) e;
            } else {
                throw new RemoteTestException(e);
            }
        }
    }

    /**
     * Runs the tearDownEJB method on the specified test case
     * @param testCase the actual test case that will be run
     * @throws RemoteTestException If any throwable is thrown during execution
     * of the method, it is wrapped with a RemoteTestException and rethrown.
     */
    private void tearDownEJB(EJBTestCase testCase) throws RemoteTestException {

        try {
            ctx.getUserTransaction().begin();
            try {
                testCase.tearDownEJB();
            } catch (Throwable e) {
                throw new RemoteTestException(e);
            }
            if (ctx.getUserTransaction().getStatus() == Status.STATUS_ACTIVE) {
                ctx.getUserTransaction().commit();
            }
        } catch (Throwable e) {
            try {
                ctx.getUserTransaction().rollback();
            } catch (SystemException unused) {
                // eat the exception we are exceptioning out anyway
            }
            if (e instanceof RemoteTestException) {
                throw (RemoteTestException) e;
            } else {
                throw new RemoteTestException(e);
            }
        }
    }

    /**
     * Gets a instance of the test class with the specified class name and
     * initialized to execute the specified method.
     *
     * @param className the name of the test class
     * @param methodName the name of the test method
     * @return a new instance of the test class with the specified class name and
     *    initialized to execute the specified method.
     */
    private EJBTestCase getTestInstance(String className, String methodName) {
        Class testClass = null;
        EJBTestCase testCase = null;
        Constructor constructor = null;

        try {
            testClass = Class.forName(className);
        } catch (ClassNotFoundException e) {
            throw new EJBException("Test class not found : " + className, e);
        }

        try {
            constructor = testClass.getConstructor(
                    new Class[]{String.class, SessionContext.class});
            testCase =
                    (EJBTestCase) constructor.newInstance(new Object[]{methodName, ctx});
        } catch (NoSuchMethodException nsme) {
            try {
                constructor = testClass.getConstructor(new Class[]{String.class});
                testCase =
                        (EJBTestCase) constructor.newInstance(new Object[]{methodName});
            } catch (Exception e) {
                e.printStackTrace();
                throw new EJBException(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new EJBException(e);
        }
        testCase.setServerSide(true);
        return testCase;

    }

    public void ejbCreate() {
    }

    public void ejbRemove() {
    }

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }
}
