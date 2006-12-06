package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEContactType;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserContact;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserContactHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

public final class DDEUserContactTest extends DDEServerTestCase {

    private LocalDDEUserContactHome userContactHome;

    DDEUserContactTest() {
    }

    protected void setUp() throws NamingException {
        userContactHome = (LocalDDEUserContactHome) lookup(LocalDDEUserContactHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        LocalDDEContactType contactType = DDEContactTypeTest.create();
        String contactInfo = "UserContactInfo13";
        LocalDDEUserContact userContact = userContactHome.create(contactInfo, userMaster, contactType);
        Long primaryKey = testGetPrimaryKey(userContact);
        testGetUserMaster(userContact, userMaster);
        testGetContactType(userContact, contactType);
        testGetContactInfo(userContact, contactInfo);
        testRemove(userContact, contactType, primaryKey);
    }

    private void testGetContactInfo(LocalDDEUserContact userContact, String contactInfo) {
        String contactInfo2 = userContact.getContactInfo();
        assertEquals(contactInfo, contactInfo2);
    }

    private void testGetContactType(LocalDDEUserContact userContact, LocalDDEContactType contactType) {
        LocalDDEContactType contactType2 = userContact.getContactType();
        assertTrue(contactType.isIdentical(contactType2));
    }

    private void testRemove(LocalDDEUserContact userContact, LocalDDEContactType contactType, Long primaryKey)
            throws RemoveException {
        userContact.remove();
        contactType.remove();
        try {
            userContactHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testGetUserMaster(LocalDDEUserContact userContact, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = userContact.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private Long testGetPrimaryKey(LocalDDEUserContact userContact) throws FinderException {
        Long primaryKey = (Long) userContact.getPrimaryKey();
        LocalDDEUserContact userContact2 = userContactHome.findByPrimaryKey(primaryKey);
        assertTrue(userContact.isIdentical(userContact2));
        return primaryKey;
    }

}
