/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link ProjectDTO}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly)
 * @since 1.0
 */
public class ProjectDTOTest {

    /**
     * <p>
     * Sample project name for test purpose.
     * </p>
     */
    private static final String SAMPLE_PROJECT_NAME = "Sample Project Name";

    /**
     * <p>
     * Sample data for project ID.
     * </p>
     */
    private static final long SAMPLE_PROJECT_ID = 1L;

    /**
     * <p>
     * This field represents the commonly used ProjectDTO instance.
     * </p>
     */
    private ProjectDTO instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new ProjectDTO();
    }

    /**
     * Test method for {@link ProjectDTO#ProjectDTO()}.
     */
    @Test
    public void testProjectDTO() {
        ProjectDTO projectDTO = new ProjectDTO();
        assertNotNull(projectDTO);
    }

    /**
     * Test method for {@link ProjectDTO#getProjectId()}.
     */
    @Test
    public void testGetProjectId() {
        TestHelper.setProperty(instance, "projectId", SAMPLE_PROJECT_ID);
        assertEquals(SAMPLE_PROJECT_ID, instance.getProjectId());
    }

    /**
     * Test method for {@link ProjectDTO#setProjectId(long)}.
     */
    @Test
    public void testSetProjectId() {
        instance.setProjectId(SAMPLE_PROJECT_ID);
        assertEquals(SAMPLE_PROJECT_ID, TestHelper.getProperty(instance, "projectId", Long.class).longValue());
    }

    /**
     * Test method for {@link ProjectDTO#getName()}.
     */
    @Test
    public void testGetName() {
        TestHelper.setProperty(instance, "name", SAMPLE_PROJECT_NAME);
        assertEquals(SAMPLE_PROJECT_NAME, instance.getName());
    }

    /**
     * Test method for {@link ProjectDTO#setName(java.lang.String)}.
     */
    @Test
    public void testSetName() {
        instance.setName(SAMPLE_PROJECT_NAME);
        assertEquals(SAMPLE_PROJECT_NAME, TestHelper.getProperty(instance, "name", Class.class));

    }

}
