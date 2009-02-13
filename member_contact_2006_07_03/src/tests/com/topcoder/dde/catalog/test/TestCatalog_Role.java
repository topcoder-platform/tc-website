/*
 * TestCatalog_Role.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.Role;
import com.topcoder.dde.catalog.CatalogException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit testcase exercising the Role management of the Catalog EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestCatalog_Role extends RemoteCatalogTestCase {

    protected Role role;
    protected Catalog catalog;

    public TestCatalog_Role(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        role = new Role("Test role #" + idGen.nextId(), "A role for testing");
    }

    public void tearDown() throws Exception {
        catalog.remove();
        super.tearDown();
    }

    public void testAddRole() throws Exception {
        Role l2 = catalog.addRole(role);
        try {
            assertEquals("Role not added correctly", role,
                    catalog.getRole(l2.getId()));
        } finally {
            catalog.removeRole(l2.getId());
        }
    }

    public void testAddRole_Null() throws Exception {
        try {
            catalog.addRole(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testAddRole_Duplicate() throws Exception {
        Role r2 = catalog.addRole(role);
        try {
            catalog.addRole(r2);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        } finally {
            catalog.removeRole(r2.getId());
        }
    }

    public void testGetRoles() throws Exception {
        ArrayList active = new ArrayList();
        ArrayList deleted = new ArrayList();
        Collection roles;

        active.add(catalog.addRole(role));
        active.add(catalog.addRole(new Role("Test role #" + idGen.nextId(),
                "A role for testing")));
        active.add(catalog.addRole(new Role("Test role #" + idGen.nextId(),
                "A role for testing")));
        role = catalog.addRole(new Role("Test role #" + idGen.nextId(),
                "A role for testing"));
        catalog.removeRole(role.getId());
        deleted.add(role);
        role = catalog.addRole(new Role("Test role #" + idGen.nextId(),
                "A role for testing"));
        catalog.removeRole(role.getId());
        deleted.add(role);

        roles = catalog.getRoles();

        try {
            Iterator it = roles.iterator();
            assertTrue("Missing active Roles",
                    roles.containsAll(active));
            deleted.retainAll(roles);
            assertEquals("Retrieved deleted Roles", 0, deleted.size());
            String last = ((Role) it.next()).getName();
            while (it.hasNext()) {
                String next = ((Role) it.next()).getName();
                assertTrue("Roles out of order", next.compareTo(last) >= 0);
                last = next;
            }
        } finally {
            Iterator it = active.iterator();
            while (it.hasNext()) {
                Role l2 = (Role) it.next();
                catalog.removeRole(l2.getId());
            }

        }
    }

    public void testGetRole_Missing() throws Exception {
        try {
            catalog.getRole(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

/*
 * removeRole tested implicitly in the getRoles test
 *
    public void testRemoveRole() throws Exception {
        Role l2 = catalog.addRole(role);
        catalog.removeRole(l2.getId());
        assertTrue("License Level not removed",
                !catalog.getRoles().contains(l2));
    }
 */

    public void testRemoveRole_Missing() throws Exception {
        try {
            catalog.removeRole(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateRole() throws Exception {
        Role l2 = catalog.addRole(role);
        l2.setDescription("Updated description");
        catalog.updateRole(l2);
        try {
            assertEquals("Role update not successful", l2,
                    catalog.getRole(l2.getId()));
        } finally {
            catalog.removeRole(l2.getId());
        }
    }

    public void testUpdateRole_Missing() throws Exception {
        try {
            catalog.updateRole(role);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateRole_Null() throws Exception {
        try {
            catalog.updateRole(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestCatalog_Role.class));
    }

}