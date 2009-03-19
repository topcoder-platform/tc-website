/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.view.tags;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.topcoder.web.studio.mock.MockPageContext;
import com.topcoder.web.studio.mock.MockJspWriter;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.util.config.ConfigManager;

import org.mockejb.jndi.MockContextFactory;

import javax.naming.InitialContext;
import java.util.List;
import java.util.Map;

/**
 * <p>A unit test for {@link HandleTag} class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class HandleTagTestCase extends TestCase {

    /**
     * <p>The instance of {@link HandleTag} which is tested. This instance is initialized in {@link #setUp()} method and
     * released in {@link #tearDown()} method.</p>
     */
    private HandleTag testedInstance = null;

    /**
     * <p>Constructs new <code>HandleTagTest</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public HandleTagTestCase(String name) {
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

        String dbNamespace = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";
        ConfigManager cm = ConfigManager.getInstance();
        String jdbcUrl = cm.getString(dbNamespace, "connections.TestingConnection.parameters.jdbc_url");
        String jdbcUser = cm.getString(dbNamespace, "connections.TestingConnection.parameters.user");
        String jdbcPassword = cm.getString(dbNamespace, "connections.TestingConnection.parameters.password");

        MockContextFactory.setAsInitial();
        InitialContext context = new InitialContext();
        context.bind(DBMS.STUDIO_DATASOURCE_NAME, new InformixSimpleDataSource(jdbcUrl, jdbcUser, jdbcPassword));
        context.bind(DBMS.OLTP_DATASOURCE_NAME,
                     new InformixSimpleDataSource(jdbcUrl.replaceAll("studio_oltp", "informixoltp"),
                                                  jdbcUser, jdbcPassword));
        context.bind(DBMS.COMMON_OLTP_DATASOURCE_NAME,
                     new InformixSimpleDataSource(jdbcUrl.replaceAll("studio_oltp", "common_oltp"),
                                                  jdbcUser, jdbcPassword));

        
        this.testedInstance = new HandleTag();
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
        MockContextFactory.revertSetAsInitial();
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link HandleTag#doStartTag()} method for accurate behavior.</p>
     *
     * <p>Passes the ID of an existing coder and verifies that the method produces the correct content which is a
     * hyperlink to <code>Member Profile</code> page for the requested user.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDoStartTag_ExistingUser() throws Exception {
        String expectedContent = "<a class=\"coderText\" href=\"/?module=ViewMemberProfile&ha=heffan\">heffan</a>";
        this.testedInstance.setCoderId(132456);

        this.testedInstance.doStartTag();

        String methodName = "print_String";
        Assert.assertTrue("The content is not written", MockJspWriter.wasMethodCalled(methodName));
        List args = MockJspWriter.getMethodArguments(methodName);
        Map argsMap = (Map) args.get(0);
        String actualContent = (String) argsMap.get("1");

        Assert.assertEquals("The coder link is not formatted correctly",
                            expectedContent.toUpperCase(), actualContent.toUpperCase());
    }

    /**
     * <p>Accuracy test. Tests the {@link HandleTag#doStartTag()} method for accurate behavior.</p>
     *
     * <p>Passes the ID of non-existing coder and verifies that the method produces the correct content which is a plain
     * <code>UNKNOWN USER</code> text.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDoStartTag_NonExistingUser() throws Exception {
        String expectedContent = "UNKNOWN USER";
        this.testedInstance.setCoderId(53934838L);

        this.testedInstance.doStartTag();

        String methodName = "print_String";
        Assert.assertTrue("The content is not written", MockJspWriter.wasMethodCalled(methodName));
        List args = MockJspWriter.getMethodArguments(methodName);
        Map argsMap = (Map) args.get(0);
        String actualContent = (String) argsMap.get("1");

        Assert.assertEquals("The coder link is not formatted correctly",
                            expectedContent.toUpperCase(), actualContent.toUpperCase());
    }
}
