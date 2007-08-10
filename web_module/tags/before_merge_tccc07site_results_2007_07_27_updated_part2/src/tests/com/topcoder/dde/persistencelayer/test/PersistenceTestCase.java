/*
 * PersistenceTestCase.java
 *
 * By John C. Bollinger
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.util.idgenerator.bean.*;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.Hashtable;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import javax.transaction.UserTransaction;

import junit.framework.AssertionFailedError;
import net.sourceforge.junitejb.*;

/**
 * an EJBTestCase subclass that provides a common infrastructure for persistence
 * layer test cases
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class PersistenceTestCase extends EJBTestCase {

    /**
     * the JNDI name by which a DataSource appropriate for this application can
     * be accessed
     */
    private static final String DS_JNDI_NAME = "java:/InformixDS";

    /**
     * the JNDI name by which the apprpriate JUnit test runner bean for this
     * application can be obtained
     */
    private static final String TEST_RUNNER_NAME =
            "dde/persistence_layer/EJBTestRunner";

    /**
     * a <code>DataSource</code> that can provide connections to the
     * appropriate DB
     */
    protected DataSource dataSource;

    /**
     * Id Generator Local Home interface
     */
    private LocalIdGenHome idGenHome;

    /**
     * Component interface reference for the Id Generator bean
     */
    private LocalIdGen idGen;

    /**
     * The EJB session context in which this test case is running, if any
     */
    protected SessionContext sessionContext = null;

    /**
     * a <code>Hashtable</code> containing naming context environment parameters
     * for use when constructing an InitialContext
     */
    static Hashtable namingContextEnv = new Hashtable();

    /**
     * the name of the table managed by the bean being tested
     */
    protected String tableName;

    /**
     * the name primary key field of the table managed by the bean being tested
     */
    protected String pkFieldName;

    /**
     * a shared naming context so that the tests don't each need to set up and
     * tear down their own <code>Context</code>.  They <strong>do</strong> need
     * to synchronize access to this <code>Context</code>, however, by locking
     * contextLock.
     */
    protected static Context ctx = null;

    /**
     * an object that serves as a mutex lock on context ctx.  A separate object
     * is used so that all accesses can be synchronized, even when ctx is
     * <code>null</code>.
     */
    protected static Object contextLock = new Object();

    static boolean addedZeroStatus = false;

    /**
     * initializes a PersistenceTestCase instance to run the test named testName
     * against an entity bean managing table _tableName
     */
    public PersistenceTestCase(String testName, String _tableName) {
        this(testName, _tableName, null);
    }

    /**
     * initializes a PersistenceTestCase instance to run the test named testName
     * against an entity bean managing table _tableName in the session context
     * referred to by sc
     */
    public PersistenceTestCase(String testName, String _tableName,
                               SessionContext sc) {
        super(testName);
        tableName = _tableName;
        pkFieldName = _tableName + "_ID";
        sessionContext = sc;
    }

    /**
     * a utility method for converting an object to a <code>long</code> value;
     * throws an exception if <code>key</code>'s runtime class is not a
     * subclass of <code>Number</code>
     *
     * @param  key the object from which to produce a <code>long</code> value.
     *         The intended usage is to pass an object returned from an EJB's
     *         <code>getPrimaryKey</code> method
     *
     * @return the <code>long</code> value of <code>key</code>
     *
     * @throws IllegalArgumentException if <code>key</code>'s runtime class is
     *         not a subclass of <code>Number</code>
     */
    public static long keyToLong(Object key) {
        assertNotNull("key is null", key);
        assertTrue("key is a " + key.getClass().getName() + ", not a Number",
                (key instanceof Number));
        return ((Number) key).longValue();
    }

    /**
     * performs a DB query to look up a row by its primary key.  It is good form
     * for the caller to close the returned <code>ResultSet</code> when done
     * with it, but that will otherwise happen automatically when the
     * <code>PreparedStatement</code> with which the <code>ResultSet</code> is
     * associated is closed.  Returns an empty, scrollable, updatable
     * <code>ResultSet</code> if <code>primaryKey</code> is <code>null</code>.
     *
     * @param  primaryKey an <code>Object</code> representing the primary key of
     *         the desired DB row
     *
     * @return a <code>ResultSet</code> containing the query results (which
     *         might be empty).  The <code>ResultSet</code> is scrollable and
     *         updatable if <code>primaryKey</code> is <code>null</code>.
     *
     * @throws SQLException if there is any problem involving the conversation
     *         with the DB
     */
    ResultSet getRowJDBC(Connection con, Object primaryKey) throws SQLException {
        if (primaryKey == null) {
            return con.createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE
            ).executeQuery("SELECT * FROM " + tableName
                    + " WHERE 0=1;");
        } else {
            return con.createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE
            ).executeQuery("SELECT * FROM " + tableName
                    + " WHERE " + pkFieldName + "="
                    + keyToLong(primaryKey) + ";");
        }
    }

    /**
     * deletes the row represented by the supplied <code>RowData</code>
     */
    protected void deleteRow(RowData rd) throws SQLException {
        Connection con = dataSource.getConnection();
        deleteRow(con, rd);
        con.close();
    }

    /**
     * deletes the row represented by the supplied <code>RowData</code>, using
     * the specified <code>Connection</code>
     */
    protected void deleteRow(Connection con, RowData rd) throws SQLException {
        con.createStatement().executeUpdate(
                "DELETE FROM " + tableName + " WHERE " + pkFieldName + "="
                + keyToLong(rd.getPrimaryKey()) + ";");
    }

    /**
     * counts the rows in the configured table
     */
    protected int countRows() throws SQLException {
        Connection con = dataSource.getConnection();
        ResultSet rs = con.createStatement().executeQuery(
                "SELECT * FROM " + tableName + ";");
        int count;
        for (count = 0; rs.next(); count++) {
        }
        con.close();
        return count;
    }

    /**
     * tests whether the the DB row corresponding to the specified primary key
     * matches the provided object, and throws an AssertionFailedError if not.
     * This implementation always succeeds; it should be overridden by test
     * cases that want to test such a condition.
     *
     * @param  the primary key with which to look up the desired DB row
     * @param  expected the <code>Object</code> that represents the expected
     *         values of the row
     */
    protected void assertMatchesDB(RowData expected) throws Exception {
        Connection con = dataSource.getConnection();
        ResultSet rs = getRowJDBC(con, expected.getPrimaryKey());
        try {
            rs.next();
            assertTrue("database does not match expected values",
                    expected.matchesResultSet(rs));
        } finally {
            con.close();
        }
    }

    /**
     * ensures that a row matching the supplied RowData is in the DB
     */
    protected void ensureInDB(RowData rd) throws Exception {
        Connection con = dataSource.getConnection();
        assertNotNull(rd);
        // delete first in case a row with the same PK is already present
        deleteRow(con, rd);
        // now insert the row
        rd.insertRowData(getRowJDBC(con, null));
        con.close();
    }

    /**
     * returns the next id from the sequence maintained by this object
     */
    long nextId() throws Exception {
        assertNotNull("No id generator", idGen);
        return idGen.nextId();
    }

    /**
     * compares two object references for equality, treating null references as
     * equal to each other
     *
     * @param  o1 the first object to compare
     * @param  o2 the second object to compare
     *
     * @return <code>true</code> if <code>o1</code> and <code>o2</code> are
     *         both <code>null</code>, or if <code>o1.equals(o2)</code>
     */
    static boolean objectsMatch(Object o1, Object o2) {
        return ((o1 == null) ? (o2 == null) : o1.equals(o2));
    }

    /**
     * sets up the fixture for this test
     */
    public void setUpEJB() throws Exception {
        super.setUpEJB();
        synchronized (contextLock) {
            if (ctx == null) {
                ctx = new InitialContext();
            }
            dataSource = (DataSource) ctx.lookup(DS_JNDI_NAME);
            idGenHome = (LocalIdGenHome) ctx.lookup(LocalIdGenHome.EJB_REF_NAME);
        }
        idGen = idGenHome.create();
        assertNotNull("Id Generator bean not obtained", idGen);
    }

    /**
     * cleans up the fixture for this test
     */
    public void tearDownEJB() throws Exception {
        idGen.remove();
        super.tearDownEJB();
    }

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * commits the current transaction and begins a new one, provided that there
     * is a SessionContext with which to do so
     */
    protected void transactionBoundary() throws Exception {
        if (sessionContext != null) {
            sessionContext.getUserTransaction().commit();
            sessionContext.getUserTransaction().begin();
        }
    }

    /*
     * Note: this method copied directly from EJBTestCase to work around that
     *       class' brain dead InitialContext construction.  This works with
     *       getEJBTestRunner(), below.
     */
    public void runBare() throws Throwable {
        if (!isServerSide()) {
            // We're not on the server side yet, invoke the test on the serverside.
            EJBTestRunner testRunner = null;
            try {
                testRunner = getEJBTestRunner();
                assertNotNull("Obtained a null EJBTestRunner reference", testRunner);
                testRunner.run(getClass().getName(), getName());
            } catch (RemoteTestException e) {
                // if the remote test exception is from an assertion error
                // rethrow it with a sub class of AssertionFailedError so it is
                // picked up as a failure and not an error.
                // The server has to throw sub classes of Error because that is the
                // allowable scope of application exceptions. So
                // AssertionFailedError which is an instance of error has to be
                // wrapped in an exception.
                Throwable remote = e.getRemoteThrowable();
                if (remote instanceof AssertionFailedError) {
                    throw new RemoteAssertionFailedError(
                            (AssertionFailedError) remote, e.getRemoteStackTrace());
                }
                throw e;
            } finally {
                // be a good citizen, drop my ref to the session bean.
                if (testRunner != null) {
                    testRunner.remove();
                }
            }
        } else {
            // We're on the server side, so invoke the test the regular way.
            super.runBare();
        }
    }

    /**
     * Looks up the ejb test runner home in JNDI (at "ejb/EJBTestRunner")
     * and creates a new runner.  This method is invoked only on the client
     * side.
     *
     * @throws Exception if any problem happens
     */
    private EJBTestRunner getEJBTestRunner() throws Exception {
        InitialContext jndiContext = new InitialContext(namingContextEnv);

        // Get a reference from this to the Bean's Home interface
        Object ref = jndiContext.lookup(TEST_RUNNER_NAME);
        EJBTestRunnerHome runnerHome = (EJBTestRunnerHome)
                PortableRemoteObject.narrow(ref, EJBTestRunnerHome.class);

        // create the test runner
        return runnerHome.create();
    }

    /**
     * Override to run the test and assert its state.
     * @exception Throwable if any exception is thrown
     */
    protected void runTest() throws Throwable {
        String fName = getName();
        Method runMethod = null;
        try {
            // use getMethod to get all public inherited
            // methods. getDeclaredMethods returns all
            // methods of this class but excludes the
            // inherited ones.
            runMethod = getClass().getMethod(fName, null);
        } catch (NoSuchMethodException e) {
            fail("Method \"" + fName + "\" not found");
        }
        if (!Modifier.isPublic(runMethod.getModifiers())) {
            fail("Method \"" + fName + "\" should be public");
        }

        try {
            runMethod.invoke(this, new Class[0]);
        } catch (InvocationTargetException e) {
            e.fillInStackTrace();
            throw e.getTargetException();
        } catch (IllegalAccessException e) {
            e.fillInStackTrace();
            throw e;
        }
    }
}
