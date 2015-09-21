/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.topcoder.security.groups.services.DirectProjectService;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.dto.ProjectDTO;

/**
 * <p>
 * Unit test for {@link DirectProjectService}. Test data should already be in
 * database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(defaultRollback=true)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateDirectProjectServiceTest {

    /**
     * <p>
     * Instance of {@link DirectProjectService}.
     * </p>
     */
    private DirectProjectService directProjectService;

    /**
     * <p>
     * Test method for {@link DirectProjectService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can find a DirectProject by projectId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_Found() {
        long projectId = 1L;
        String name = "DirectProject name";

        try {
            ProjectDTO dp = directProjectService.get(projectId);
            assertTrue(dp != null);
            assertTrue(dp.getName().equals(name));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for {@link DirectProjectService#get(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not find a DirectProject by projectId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGet_NotFound() {
        long projectId = 3223423L;

        try {
            assertTrue(directProjectService.get(projectId) == null);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link DirectProjectService#getProjectsByClientId(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can get Projects by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetProjectsByClientId_Found() {
        long clientId = 1L;
        String name = "Test Project 1";

        try {
            List<ProjectDTO> projects = directProjectService.getProjectsByClientId(clientId);
            assertTrue(projects.size() > 0);
            assertTrue(projects.get(0).getName().equals(name));
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * <p>
     * Test method for
     * {@link DirectProjectService#getProjectsByClientId(long id)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can not get Projects by clientId</li>
     * </ol>
     * </p>
     */
    @Test
    public void testGetProjectsByClientId_NotFound() {
        long clientId = 2342323L;

        try {
            assertTrue(directProjectService.getProjectsByClientId(clientId).size() == 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of directProjectService
     * 
     * @param directProjectService
     *            the Spring injected directProjectService
     */
    @Resource
    public void setDirectProjectService(DirectProjectService directProjectService) {
        this.directProjectService = directProjectService;
    }

}
