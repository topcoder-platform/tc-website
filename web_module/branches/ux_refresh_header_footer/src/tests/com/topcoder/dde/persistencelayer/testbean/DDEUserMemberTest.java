package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMember;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMemberHome;

public final class DDEUserMemberTest extends DDEServerTestCase {

    private LocalDDEUserMemberHome userMemberHome;

    DDEUserMemberTest() {
    }

    protected void setUp() throws NamingException {
        userMemberHome = (LocalDDEUserMemberHome) lookup(LocalDDEUserMemberHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        int tcRating = 14;
        int tcsRating = 15;
        LocalDDEUserMember userMember = userMemberHome.create(tcRating, tcsRating, userMaster);
        Long primaryKey = testGetPrimaryKey(userMember);
        testGetUserMaster(userMember, userMaster);
        testGetTcRating(userMember, tcRating);
        testGetTcsRating(userMember, tcsRating);
        testRemove(userMember, primaryKey);
    }

    private void testGetTcsRating(LocalDDEUserMember userMember, int tcsRating) {
        int tcsRating2 = userMember.getTcsRating();
        assertEquals(tcsRating, tcsRating2);
    }

    private void testGetTcRating(LocalDDEUserMember userMember, int tcRating) {
        int tcRating2 = userMember.getTcRating();
        assertEquals(tcRating, tcRating2);
    }

    private void testRemove(LocalDDEUserMember userMember, Long primaryKey) throws RemoveException {
        userMember.remove();
        try {
            userMemberHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testGetUserMaster(LocalDDEUserMember userMember, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = userMember.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private Long testGetPrimaryKey(LocalDDEUserMember userMember) throws FinderException {
        Long primaryKey = (Long) userMember.getPrimaryKey();
        LocalDDEUserMember userMember2 = userMemberHome.findByPrimaryKey(primaryKey);
        assertTrue(userMember.isIdentical(userMember2));
        return primaryKey;
    }

}
