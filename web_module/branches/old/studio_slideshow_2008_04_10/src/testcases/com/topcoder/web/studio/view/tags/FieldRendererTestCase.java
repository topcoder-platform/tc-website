/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.view.tags;

import junit.framework.TestCase;
import junit.framework.Assert;

import com.topcoder.web.studio.mock.MockPageContext;
import com.topcoder.web.studio.mock.MockJspWriter;

import java.util.List;
import java.util.Map;

/**
 * <p>A unit test case for {@link FieldRenderer} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.14)
 */
public class FieldRendererTestCase extends TestCase {

    /**
     * <p>The instance of {@link FieldRenderer} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private FieldRenderer testedInstance = null;

    /**
     * <p>Constructs new <code>FieldRendererTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public FieldRendererTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        MockPageContext.releaseState();
        MockJspWriter.releaseState();
        MockPageContext.setMethodResult("getOut", new MockJspWriter(4096, true));
        this.testedInstance = new FieldRenderer();
        this.testedInstance.setPageContext(new MockPageContext());
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void tearDown() throws Exception {
        this.testedInstance = null;
        MockPageContext.releaseState();
        MockJspWriter.releaseState();
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link FieldRenderer#doStartTag()} method for accurate behavior.</p>
     *
     * <p>Passes the text which contains the <code>\r\n</code> characters as line separators only and verifies that the
     * method produces the correct content.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDoStartTag_RN() throws Exception {
        String originalContent = "1212\r\n232131312\r\n11312313\r\n\r\n13412r3123\r\n13123123n";
        String expectedContent = "1212<br/>232131312<br/>11312313<br/><br/>13412r3123<br/>13123123n";
        this.testedInstance.setText(originalContent);

        this.testedInstance.doStartTag();

        String methodName = "print_String";
        Assert.assertTrue("The content is not written", MockJspWriter.wasMethodCalled(methodName));
        List args = MockJspWriter.getMethodArguments(methodName);
        Map argsMap = (Map) args.get(0);
        String actualContent = (String) argsMap.get("1");

        Assert.assertEquals("The text is not formatted correctly",
                            expectedContent.toUpperCase(), actualContent.toUpperCase());
    }

    /**
     * <p>Accuracy test. Tests the {@link FieldRenderer#doStartTag()} method for accurate behavior.</p>
     *
     * <p>Passes the text which contains the <code>\n</code> characters as line separators only and verifies that the
     * method produces the correct content.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDoStartTag_N() throws Exception {
        String originalContent = "1212\n232131312\n11312313\n\n13412r3123\n13123123n";
        String expectedContent = "1212<br/>232131312<br/>11312313<br/><br/>13412r3123<br/>13123123n";
        this.testedInstance.setText(originalContent);

        this.testedInstance.doStartTag();

        String methodName = "print_String";
        Assert.assertTrue("The content is not written", MockJspWriter.wasMethodCalled(methodName));
        List args = MockJspWriter.getMethodArguments(methodName);
        Map argsMap = (Map) args.get(0);
        String actualContent = (String) argsMap.get("1");
        
        Assert.assertEquals("The text is not formatted correctly",
                            expectedContent.toUpperCase(), actualContent.toUpperCase());
    }

    /**
     * <p>Accuracy test. Tests the {@link FieldRenderer#doStartTag()} method for accurate behavior.</p>
     *
     * <p>Passes the text which contains the <code>\n</code> and <code>\r\n</code> characters as line separators and
     * verifies that the method produces the correct content.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDoStartTag_RNN() throws Exception {
        String originalContent = "1212\r\n232131312\n11312313\r\n\n13412r3123\r\n13123123n";
        String expectedContent = "1212<br/>232131312<br/>11312313<br/><br/>13412r3123<br/>13123123n";
        this.testedInstance.setText(originalContent);

        this.testedInstance.doStartTag();

        String methodName = "print_String";
        Assert.assertTrue("The content is not written", MockJspWriter.wasMethodCalled(methodName));
        List args = MockJspWriter.getMethodArguments(methodName);
        Map argsMap = (Map) args.get(0);
        String actualContent = (String) argsMap.get("1");
        
        Assert.assertEquals("The text is not formatted correctly",
                            expectedContent.toUpperCase(), actualContent.toUpperCase());
    }
}
