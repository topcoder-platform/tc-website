package com.topcoder.dde.persistencelayer.testbean;

import java.sql.Timestamp;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMasterHome;

public final class DDEUserMasterTest extends DDEServerTestCase {

    static final long LOGIN_ID = 0;

    private static final Timestamp LAST_LOGIN_TIME = currentTimestamp();
    private static final int NUM_LOGINS = 0;
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;

    private LocalDDEUserMasterHome userMasterHome;

    DDEUserMasterTest() {
    }

    static LocalDDEUserMaster create() throws CreateException {
        try {
            LocalDDEUserMasterHome userMasterHome = lookup();
            LocalDDEUserMaster userMaster;
            try {
                userMaster = userMasterHome.findByPrimaryKey(new Long(LOGIN_ID));
            } catch (FinderException e) {
                userMaster = userMasterHome.create(LOGIN_ID, LAST_LOGIN_TIME, NUM_LOGINS, STATUS_ID);
            }
            return userMaster;
        } catch (Exception e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        userMasterHome = lookup();
    }

    private static LocalDDEUserMasterHome lookup() throws NamingException {
        return (LocalDDEUserMasterHome) lookup(LocalDDEUserMasterHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        long status = STATUS_ID;
        int numLogins = NUM_LOGINS;
        LocalDDEUserMaster userMaster;
        try {
            userMaster = userMasterHome.findByPrimaryKey(new Long(LOGIN_ID));
        } catch (FinderException e) {
            userMaster = create();
        }
        testGetPrimaryKey(userMaster);
        testGetNumLogins(userMaster, numLogins);
        testGetStatus(userMaster, status);
    }

    private void testGetNumLogins(LocalDDEUserMaster userMaster, int numLogins) {
        int numLogins2 = userMaster.getNumLogins();
        assertEquals(numLogins, numLogins2);
    }

    private void testGetStatus(LocalDDEUserMaster userMaster, long status) {
        long status2 = userMaster.getStatusId();
        assertEquals(status, status2);
    }

    private Long testGetPrimaryKey(LocalDDEUserMaster userMaster) throws FinderException {
        Long primaryKey = (Long) userMaster.getPrimaryKey();
        LocalDDEUserMaster userMaster2 = userMasterHome.findByPrimaryKey(primaryKey);
        assertTrue(userMaster.isIdentical(userMaster2));
        return primaryKey;
    }

}
