package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompForumXref;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompForumXrefHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.forum.persistencelayer.interfaces.LocalForumMaster;
import com.topcoder.forum.persistencelayer.testbean.ForumMasterTest;

public final class DDECompForumXrefTest extends DDEServerTestCase {

    private LocalDDECompForumXrefHome compForumXrefHome;

    DDECompForumXrefTest() {
    }

    protected void setUp() throws NamingException {
        compForumXrefHome = (LocalDDECompForumXrefHome) lookup(LocalDDECompForumXrefHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        int forumType = 7;
        LocalForumMaster forumMaster = ForumMasterTest.create();
        long forumId = forumMaster.getId().longValue();
        LocalDDECompForumXref compForumXref = compForumXrefHome.create(forumId, forumType, versions);
        Long primaryKey = testGetPrimaryKey(compForumXref);
        testGetForumType(compForumXref, forumType);
        testGetCompVersions(compForumXref, versions);
        testRemove(compForumXref, forumMaster, versions, catalog, primaryKey);
    }

    private void testGetCompVersions(LocalDDECompForumXref compForumXref, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = compForumXref.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private void testGetForumType(LocalDDECompForumXref compForumXref, int forumType) {
        int forumType2 = compForumXref.getForumType();
        assertEquals(forumType, forumType2);
    }

    private Long testGetPrimaryKey(LocalDDECompForumXref compForumXref) throws FinderException {
        Long primaryKey = (Long) compForumXref.getPrimaryKey();
        LocalDDECompForumXref compForumXref2 = compForumXrefHome.findByPrimaryKey(primaryKey);
        assertTrue(compForumXref.isIdentical(compForumXref2));
        return primaryKey;
    }

    private void testRemove(LocalDDECompForumXref compForumXref, LocalForumMaster forumMaster, LocalDDECompVersions versions,
                            LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        compForumXref.remove();
        forumMaster.remove();
        versions.remove();
        catalog.remove();
        try {
            compForumXrefHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
