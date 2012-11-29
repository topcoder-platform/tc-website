/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import com.topcoder.security.groups.TestHelper;

/**
 * <p>
 * Unit test for {@link PagedResult}
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly)
 * @since 1.0
 */
public class PagedResultTest {

    /**
     * <p>
     * This field represents the commonly used PagedResult instance.
     * </p>
     */
    private PagedResult<String> instance;

    /**
     * <p>
     * Initialize the {{@link #instance} field.
     * </p>
     */
    @Before
    public void setUp() {
        instance = new PagedResult<String>();
    }

    /**
     * Test method for {@link PagedResult#PagedResult()}.
     */
    @Test
    public void testPagedResult() {
        PagedResult<String> pagedResult = new PagedResult<String>();
        assertNotNull(pagedResult);
    }

    /**
     * Test method for {@link PagedResult#getTotal()}.
     */
    @Test
    public void testGetTotal() {
        int TOTAL = 1;
        TestHelper.setProperty(instance, "total", TOTAL);
        assertEquals(TOTAL, instance.getTotal());
    }

    /**
     * Test method for {@link PagedResult#setTotal(int)}.
     */
    @Test
    public void testSetTotal() {
        int TOTAL = 1;
        instance.setTotal(TOTAL);
        assertEquals(TOTAL,
                TestHelper.getProperty(instance, "total", Integer.class)
                        .intValue());
    }

    /**
     * Test method for {@link PagedResult#getPage()}.
     */
    @Test
    public void testGetPage() {
        int PAGE = 1;
        TestHelper.setProperty(instance, "page", PAGE);
        assertEquals(PAGE, instance.getPage());
    }

    /**
     * Test method for {@link PagedResult#setPage(int)}.
     */
    @Test
    public void testSetPage() {
        int PAGE = 1;
        instance.setPage(PAGE);
        assertEquals(PAGE,
                TestHelper.getProperty(instance, "page", Integer.class)
                        .intValue());
    }

    /**
     * Test method for {@link PagedResult#getValues()}.
     */
    @Test
    public void testGetValues() {
        List<String> VALUES = new ArrayList<String>();
        VALUES.add("String");
        VALUES.add("String2");
        TestHelper.setProperty(instance, "values", VALUES);
        assertEquals(VALUES, instance.getValues());
    }

    /**
     * Test method for {@link PagedResult#setValues(List)}.
     */
    @Test
    public void testSetValues() {
        List<String> VALUES = new ArrayList<String>();
        VALUES.add("String");
        VALUES.add("String2");
        instance.setValues(VALUES);
        assertEquals(VALUES,
                TestHelper.getProperty(instance, "values", ArrayList.class));
    }

}
