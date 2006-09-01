package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDocumentation;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDocForumXref;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDocForumXrefHome;
import com.topcoder.forum.persistencelayer.interfaces.LocalForumMaster;
import com.topcoder.forum.persistencelayer.interfaces.LocalForumTopics;
import com.topcoder.forum.persistencelayer.testbean.ForumMasterTest;
import com.topcoder.forum.persistencelayer.testbean.ForumTopicsTest;

public class DDEDocForumXrefTest extends DDEServerTestCase {

    private LocalDDEDocForumXrefHome docForumXrefHome;

    DDEDocForumXrefTest() {
    }

    protected void setUp() throws NamingException {
        docForumXrefHome = lookup();
    }

    private static LocalDDEDocForumXrefHome lookup() throws NamingException {
        return (LocalDDEDocForumXrefHome) lookup(LocalDDEDocForumXrefHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalForumMaster forumMaster = ForumMasterTest.create();
        LocalForumTopics forumTopics = ForumTopicsTest.create(forumMaster);
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        LocalDDECompDocumentation compDocumentation = DDECompDocumentationTest.create(versions);
        LocalDDEDocForumXref result = docForumXrefHome.create(forumTopics.getId().longValue(), compDocumentation);
        LocalDDEDocForumXref docForumXref = result;
        Long primaryKey = testGetPrimaryKey(docForumXref);
        testGetCompDocumentation(docForumXref, compDocumentation);
        testRemove(docForumXref, compDocumentation, forumTopics, forumMaster, versions, catalog, primaryKey);
    }

    private void testGetCompDocumentation(LocalDDEDocForumXref docForumXref, LocalDDECompDocumentation compDocumentation) {
        LocalDDECompDocumentation compDocumentation2 = docForumXref.getCompDocumentation();
        assertTrue(compDocumentation.isIdentical(compDocumentation2));
    }

    private void testRemove(LocalDDEDocForumXref docForumXref, LocalDDECompDocumentation compDocumentation,
                            LocalForumTopics forumTopics, LocalForumMaster forumMaster, LocalDDECompVersions versions, LocalDDECompCatalog catalog,
                            Long primaryKey) throws RemoveException {
        docForumXref.remove();
        compDocumentation.remove();
        forumTopics.remove();
        forumMaster.remove();
        versions.remove();
        catalog.remove();
        try {
            docForumXrefHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDEDocForumXref docForumXref) throws FinderException {
        Long primaryKey = (Long) docForumXref.getPrimaryKey();
        LocalDDEDocForumXref docForumXref2 = docForumXrefHome.findByPrimaryKey(primaryKey);
        assertTrue(docForumXref.isIdentical(docForumXref2));
        return primaryKey;
    }

}
