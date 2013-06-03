/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.topcoder.security.groups.model.GroupAuditRecord;
import com.topcoder.security.groups.services.GroupAuditService;
import com.topcoder.security.groups.services.SecurityGroupException;

/**
 * <p>
 * Unit test for {@link HibernateGroupAuditService}. Test data should already be in database
 * </p>
 * 
 * @author backstretlili
 * @version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/securityGroupsApplicationContext.xml")
public class HibernateGroupAuditServiceTest {

    /**
     * <p>
     * Instance of {@link HibernateGroupAuditService}.
     * </p>
     */
    private GroupAuditService groupAuditService;

    /**
     * <p>
     * Test method for {@link GroupAuditService#add(GroupAuditRecord record)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can add a GroupAuditRecord</li>
     * </ol>
     * </p>
     */
    @Test
    public void testAdd() {
        GroupAuditRecord gar = generateGroupAuditRecord();

        try {
            assertTrue(groupAuditService.add(gar) > 0);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * A utility method used to generate a GroupAuditRecord entity for testing.
     * 
     * @return GroupAuditRecord the generated GroupAuditRecord
     */
    private GroupAuditRecord generateGroupAuditRecord() {
        GroupAuditRecord gar = new GroupAuditRecord();
        gar.setDate(new Date(System.currentTimeMillis()));
        gar.setHandle("test");
        gar.setIpAddress("127.0.0.1");
        gar.setNewValue("new value");
        gar.setPreviousValue("previous value");
        return gar;
    }

    /**
     * <p>
     * Test method for {@link GroupAuditService#searchAuditRecords(int pageSize, int page)} .
     * </p>
     * <p>
     * This method test the scenarios like this:
     * <ol>
     * <li>can search GroupAuditRecords</li>
     * </ol>
     * </p>
     */
    @Test
    public void testSearchAuditRecords() {

        try {
            assertTrue(groupAuditService.searchAuditRecords(20, 1).getValues().size() == 4);
        } catch (SecurityGroupException e) {
            fail("Should not throw any exception");
        } catch (IllegalArgumentException e) {
            fail("Should not throw any exception");
        }
    }

    /**
     * Setter of groupAuditService
     * 
     * @param groupAuditService
     *            the Spring injected groupAuditService
     */
    @Resource
    public void setGroupAuditService(GroupAuditService groupAuditService) {
        this.groupAuditService = groupAuditService;
    }

}
