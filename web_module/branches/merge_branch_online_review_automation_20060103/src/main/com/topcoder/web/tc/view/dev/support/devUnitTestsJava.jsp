<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development Tutorial</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="devTutorial"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

		<p><A href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial">Back to tutorial</A></p>

			<h2>Unit Tests - Java</h2>

			<a name="sectionI"></a>
		<h4>Directory Creation</h4>
		<p>First, you'll need to create the directory for your Unit Tests.&nbsp; The root for your tests will be<font face="Courier New" size="2">src/java/tests/</font>. After that, you'll add the package path.&nbsp; For our example package, <font face="Courier New" size="2">com.topcoder.util.tutorial</font>, the directory would be <font face="Courier New" size="2">com/topcoder/util/tutorial/</font>. For those in the back of the classroom, the full path to your unit tests will be <font face="Courier New" size="2">src/java/tests/com/topcoder/util/tutorial/</font>.</p>
		<h4>Main Test Suite - UnitTests.java</h4>
		<p>Now that your directory has been created, you can create your test suite.&nbsp; This suite won't contain any actual testing code, but will hold all your individual unit tests.&nbsp;&nbsp;Create <font face="Courier New" size="2">src/java/tests/com/topcoder/util/tutorial/UnitTests.java</font>and open it in your editor.</p>
		<p>First, add the copyright notice (as with every file).</p>
<pre>/**
 * UnitTests.java
 *
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 */</pre>
		<p>Next, add the package. Our example package is com.topcoder.util.tutorial. Your
			package will be specific to your project.</p>
<pre>package com.topcoder.util.tutorial;</pre>
		<p>After this, you'll need some basic imports for your code to compile against the
			JUnit library.</p>
<pre>import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
</pre>
		<p>Now, you'll add the class declaration to the file.</p>
<pre>/**
 * This file aggregates all of the Unit Tests for this component.
 *
 * @author TCSDEVELOPER
 */
public class UnitTests extends TestCase {
}</pre>
		<p>This class will only contain one method: suite(). The suite() function
			aggregates all the test cases you will create.</p>
<pre>/**
 * Creates a test suite containing all Unit Tests
 * for this component.
 *
 * @return A test suite containing all unit tests.
 */
public static Test suite() {
	return null;
}</pre>
		<p>You'll need to create the actual object that the function returns.</p>
<pre>TestSuite suite = new TestSuite();
// Add tests here.
// suite.addTestSuite(TestClass.class);
return suite;</pre>
		<p>Your UnitTests.java should now look&nbsp;like <a href="/i/development/UnitTestSkeleton.java">this file</a>.</p>
		<h4>Creating Tests</h4>
		<p>Unit tests test units of code. In TopCoder components, units are generally classes. To this end, you'll need to create a separate test class for each class in your main source tree.</p>		<p>Let's walk through an example test case. We'll test the SaveAs function in the Documentation section above. Let's say the function exists in an arbitrary class, TutorialLayout.</p>
		<p>First, we'll need to create a Java source file for this unit test, TutorialLayoutTest.java.</p>
<pre>/**
 * TutorialLayoutTest.java
 *
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 */
package com.topcoder.util.tutorial;

// Required import for JUnit.
import junit.framework.TestCase;

import com.topcoder.util.tutorial.TutorialLayout;

/**
 * This class tests TutorialLayout for proper behavior.  It covers
 * saving, loading, rearranging, ....
 *
 * @author TCSDEVELOPER
 */
public class TutorialLayoutTest extends TestCase
{
}</pre>
		<p>Here we have the copyright notice, followed by the package and JUnit import. New here is an import of the class we're testing. What you import will depend on the extent of your tests. Many will only need one or two imports, but some tests may reference all classes in your component. Next we have the class declaration. Each test class will extend JUnit's TestCase. To begin with the class will be empty.</p>
		<h4>Accuracy Tests</h4>
		<p>Now we can add test code. Let's add a test to verify that saving blank files works as expected.</p>

<pre>// File name and path for test saves
private static final String SAVEAS_OUTPUT = "test_files/unit_tests/output/test_saveas.txt";
// Reference blank save file
private static final String SAVEAS_BLANK_REFERENCE = "test_files/unit_tests/blank_saveas.txt";

/**
 * Tests saving a blank TutorialLayout object.
 */
public void testSaveAsBlank()
{
	TutorialLayout test_object = new TutorialLayout(TutorialLayout.SINGLE_DOCUMENT, true);

	test_object.SaveAs(SAVEAS_OUTPUT);

	assertTrue("Files do not match.", file_compare(SAVEAS_OUTPUT, SAVEAS_BLANK_REFERENCE));
}</pre>
		<p>First, we've added a couple of private variables that will hold the rather long string values used in our tests. You can add private variables to your unit tests just like you would in any class. Next, there is the actual test function, testSaveAsBlank(). It creates an instance of the class we're testing, and calls the function we're testing. Next, we use JUnit to test an assertion.&nbsp; Here, the assertion is that the function file_compare returns true.&nbsp; If it does not return true, the test will fail, and "Files do not match." will be given as the reason for failure.</p>
		<p>Now that we have one test, we can easily copy that test to create more tests!&nbsp; Let's write a test that verifies a more complex object saves as expected.</p>
<pre>// Reference complex save file
private static final String SAVEAS_COMPLEX_REFERENCE = "test_files/unit_tests/complex_saveas.txt";

/**
 * Tests saving a complex TutorialLayout object.
 */
public void testSaveAsComplex()
{
	TutorialLayout test_object = new TutorialLayout(TutorialLayout.MULTIPLE_DOCUMENT, true);

	// Add objects to the blank layout.
	test_object.Add(new TutorialContents());
	test_object.Add(new TutorialIndex());
	test_object.Add(new TutorialChapter("First Chapter"));

	test_object.SaveAs(SAVEAS_OUTPUT);

	assertTrue("Files do not match.", file_compare(SAVEAS_OUTPUT, SAVEAS_COMPLEX_REFERENCE));
}</pre>
		<p>Note the ease with which we can create another test. Many tests will lend themselves to a simple copy. assertTrue is not the only assert function available to us. We can also test equality, inequality, null values, and so forth. For more information, see the <a href="http://www.junit.org/junit/javadoc/index.htm">JUnit javadocs</a>.</p>
		<h4>Failure Tests</h4>
		<p>Now we have some tests that test valid input, but what about invalid input? As we can tell from the javadocs from <a href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial#sectionV">Section V</a>, the SaveAs function should fail if we pass in a null reference.</p>
<pre>/**
 * Tests SaveAs for failure with null input.
 */
public void testSaveAsNull()
{
	TutorialLayout test_object = new TutorialLayout(TutorialLayout.SINGLE_DOCUMENT, true);

	try
	{
		// This call should throw an IAE
		test_object.SaveAs(null);

		fail("Did not throw exception.");
	}
	catch (IllegalArgumentException iae) { /* expected */ }
}</pre>
		<p>This code is very simple. If the SaveAs call does not throw an exception, which will be caught in the try/catch block, the next line to be executed is a call to fail. Unlike assertions, we are not testing anything.&nbsp; If the statement is ever reached, the test will fail immediately, with the given message.</p>
		<p>Note that so far, we have a bit of duplicate code. Also, you may have wondered,&nbsp;what if the output files are somehow already on the system? How can I guarantee a clean environment and reduce code duplication?</p>		<h4>setUp() and tearDown()</h4>
		<p>The solution to all these questions is provided by the JUnit Framework. You can add setUp() and tearDown() functions which will be called before and after each test function. Let's move the duplicate code into setUp(), and use both functions to ensure our environment is clean.</p>
<pre>// blank object to operate on
private TutorialLayout test_object;

/**
 * Sets up the test environment, deleting SaveAs output,
 * if it exists.  Creates a blank test_object.
 */
public void setUp()
{
	cleanOutput();

	test_object = new TutorialLayout(TutorialLayout.SINGLE_DOCUMENT, true);
}

/**
 * Tears down the test environment, deleting SaveAs output,
 * if it exists.
 */
public void tearDown()
{
	cleanOutput();
}</pre>
		<p>Now, we can remove the test_object instantiation from our two test functions. You would have to write the cleanOutput() function, to do the specific clean up tasks (determine if file exists, delete if so).</p>
		<p>Note that setUp() and tearDown() will be called before every test execution. As you add test cases, your setUp() and tearDown() code may not apply to each test. If this is a problem, you can easily create multiple TestCase classes for a single target unit. For instance, we could rename our current TutorialLayoutTest.java to TutorialLayoutSaveTest.java.&nbsp; Do whatever is most appropriate to your component and your test volume.</p>
		<p>Common setup and teardown applicable to one or many whole TestCases can be factored out by wrapping individual TestCases or entire TestSuites with suitable junit.extensions.TestSetup objects. These provide setup and teardown methods that wrap all the tests defined by a JUnit Test object.</p>
		<p>Here is a copy of the completed example unit test: <a href="/i/development/TutorialLayoutTest.java">TutorialLayoutTest.java</a>. This should give you an idea of how unit tests should be constructed.&nbsp; For more information about JUnit testing and unit testing practices, please visit <a href="http://www.junit.org/">www.junit.org</a>.&nbsp;</p>
		<h4>Running JUnit Tests</h4>
		<p>To run your Unit Tests with the build script, you will need to create one more file, AllTests.java.&nbsp; You can use <a href="/i/development/AllTests.java">this file</a> as a base. You'll need to change the package to the package for your project, but otherwise, it should work as is. Save it to the same directory as UnitTests.java.</p>
		<p>Now, navigate to your project directory (where your build.xml is). At a command prompt, type:</p>
		<pre>ant test</pre>
		<p>If all your tests compile, they'll run. The results will be logged in the <font face="Courier New" size="2">log/</font> directory, in a text file. Here is a sample of a <a href="/i/development/failed.log">log with failures</a>, as well as a <a href="/i/development/passed.log">successful log</a>.</p>

		<p><A href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial">Back to tutorial</A></p>
		<p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
