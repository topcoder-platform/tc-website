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

			<h2>Unit Tests - C#</h2>

			<a name="sectionI"></a>
		<span class=bodySubtitle>Directory Creation</span>
		<p>First, you'll need to create the directory for your Unit Tests.&nbsp; The root for your tests will be<font face="Courier New" size="2">src/csharp/tests/</font>. After that, you'll add the namespace path.&nbsp; For our example package, <font face="Courier New" size="2"> TopCoder.Util.Tutorial</font>, the directory would be <font face="Courier New" size="2"> TopCoder/Util/Tutorial/</font>. For those in the back of the classroom, the full path to your unit tests will be <font face="Courier New" size="2">src/csharp/tests/TopCoder/Util/Tutorial/</font>.</p>
		<span class=bodySubtitle>Creating Tests</span>
		<p>Unit tests test units of code. In TopCoder components, units are generally classes. To this end, you'll need to create a separate test class for each class in your main source tree.</p>
		<p>Let's walk through an example test case. We'll test the SaveAs function in <a href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial#sectionV">Section V</a>. Let's say the function exists in an arbitrary class, TutorialLayout.</p>
		<p>First, we'll need to create a&nbsp;C# source file for this unit test, TutorialLayoutTest.cs.</p>
<pre>/*
 * TutorialLayoutTest.cs
 *
 * Copyright (c) 2004, TopCoder, Inc. All rights reserved
 */
 */
using System;
// .... required system using directives ....

// Required NUnit using directive
using NUnit.Framework;

namespace TopCoder.Util.Tutorial {
    /// &lt;summary&gt;
    /// This class tests TutorialLayout for  proper behavior. It covers
    /// saving, loading, rearranging, ....
    ///
    &lt;/summary&gt;
    [TestFixture]
    public class TutorialLayoutTest
    {
    }
}</pre>

		<p>Here we have the copyright notice, followed by the System and NUnit reference. Next we have the class declaration. Each test class will require the TestFixture attribute tag, which indicates to NUnit the nature of the class. To begin with the class will be empty.</p>
		<span class=bodySubtitle>Accuracy Tests</span>
		<p>Now we can add test code. Let's add a test to verify that saving blank files works as expected.</p>

<pre>// File name and path for test saves
private const string SAVEAS_OUTPUT = "test_files/unit_tests/output/test_saveas.txt";
// Reference blank save file
private const string SAVEAS_BLANK_REFERENCE = "test_files/unit_tests/blank_saveas.txt";

/// &lt;summary&gt;
/// Tests saving a blank TutorialLayout object.
/// &lt;/summary&gt;
[Test]
public void SaveAsBlank()
{
    TutorialLayout test_object = new TutorialLayout(TutorialLayout.SINGLE_DOCUMENT, true);

    test_object.SaveAs(SAVEAS_OUTPUT);

    Assertion.Assert(file_compare(SAVEAS_OUTPUT, SAVEAS_BLANK_REFERENCE),"Files do not match.");
}</pre>

		<p>First, we've added a couple of private variables that will hold the rather long string values used in our tests. You can add private variables to your unit tests just like you would in any class. Next, there is the actual test function, SaveAsBlank(). Note the [Test] attribute: this attribute tells NUnit to call this specific function during test execution.</p>
		<p>The test itself creates an instance of the class we're testing, and calls the function we're testing. Next, we use NUnit to test an assertion.&nbsp; Here, the assertion is that the function file_compare returns true.&nbsp; If it does not return true, the test will fail, and "Files do not match." will be given as the reason for failure.&nbsp; Note that the assert arguments are in the opposite order of JUnit assertions.</p>
		<p>Now that we have one test, we can easily copy that test to create more tests!&nbsp; Let's write a test that verifies a more complex object saves as expected.</p>

<pre>// Reference complex save file
private const string SAVEAS_COMPLEX_REFERENCE = "test_files/unit_tests/complex_saveas.txt";

/// &lt;summary&gt;
/// Tests saving a complex TutorialLayout object.
/// &lt;/summary&gt;
[Test]
public void SaveAsComplex()
{
	TutorialLayout test_object = new TutorialLayout(TutorialLayout.MULTIPLE_DOCUMENT, true);

	// Add objects to the blank layout.
	test_object.Add(new TutorialContents());
	test_object.Add(new TutorialIndex());
	test_object.Add(new TutorialChapter("First Chapter"));

	test_object.SaveAs(SAVEAS_OUTPUT);

	Assertion.Assert(file_compare(SAVEAS_OUTPUT, SAVEAS_COMPLEX_REFERENCE), "Files do not match.");
}</pre>

		<p>Note the ease with which we can create another test. Many tests will lend themselves to a simple copy. Assert is not the only assert function available to us. We can also test equality, sameness, null values, and so forth. For more information, see the <a href="http://www.nunit.org/assertions.html#comparisons">NUnit documentation</a>.</p>
		<span class=bodySubtitle>Failure Tests</span>
		<p>Now we have some tests that test valid input, but what about invalid input? As we can tell from the <a href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial#sectionV">XML doc from Section V</a>, the SaveAs function should fail if we pass in a null reference.</p>

<pre>/// &lt;summary&gt;
/// Tests SaveAs for failure with null input.
/// &lt;/summary&gt;
[Test]
[ExpectedException(typeof(ArgumentNullException))]
public void SaveAsNull()
{
    TutorialLayout test_object = new TutorialLayout(TutorialLayout.SINGLE_DOCUMENT, true);

    // This call should throw an IAE
    test_object.SaveAs(null);
}</pre>

		<p>This code shows the power of NUnit.  The function is marked with the [Test] attribute, as normal, but there is another attribute here, ExpectedException.  If the execution of this test function does not throw an exception, of the type marked, the test will fail.  Alternatively, you can use Assert.Fail(string message) to immediately fail a test.  See the <a href="/tc?module=Static&d1=dev&d2=devUnitTestsJava">Java section of this tutorial</a> for more failure testing strategy.</p>
		<p>Note that so far, we have a bit of duplicate code. Also, you may have wondered,&nbsp;what if the output files are somehow already on the system? How can I guarantee a clean environment and reduce code duplication?</p>		<span class=bodySubtitle>[SetUp] and [TearDown]</span>
		<p>The solution to all these questions is provided by the NUnit Framework. You can add functions which will be called before and after each test function. Let's move the duplicate code into TestSetUp(), and use both functions to ensure our environment is clean.</p>

<pre>// blank object to operate on
private TutorialLayout test_object;

/// &lt;summary&gt;
/// Sets up the test environment, deleting SaveAs output,
/// if it exists.  Creates a blank test_object.
/// &lt;summary&gt;
[SetUp]
public void TestSetUp()
{
	cleanOutput();

	test_object = new TutorialLayout(TutorialLayout.SINGLE_DOCUMENT, true);
}

/// &lt;summary&gt;
/// Tears down the test environment, deleting SaveAs output,
/// if it exists.
/// &lt;summary&gt;
[TearDown]
public void TestTearDown()
{
	cleanOutput();
}</pre>
		<p>Now, we can remove the test_object instantiation from our two test functions. You would have to write the cleanOutput() function, to do the specific clean up tasks (determine if file exists, delete if so).</p>
		<p>Note that TestSetUp() and TestTearDown() will be called before every test execution. As you add test cases, your TestSetUp() and TestTearDown() code may not apply to each test. If this is a problem, you can easily create multiple TestCase classes for a single target unit. For instance, we could rename our current TutorialLayoutTest.java to TutorialLayoutSaveTest.java.&nbsp; Do whatever is most appropriate to your component and your test volume.</p>
		<p>It is also worth noting that NUnit provides [TestFixtureSetUp] and [TestFixtureTearDown] attributes. These attributes mark functions to be call before and after ALL [Test] functions have run.</p>
		<p>Here is a copy of the completed example unit test: <a href="/i/development/TutorialLayoutTest.cs">TutorialLayoutTest.cs</a>. This should give you an idea of how unit tests should be constructed.&nbsp; For more information about NUnit testing and unit testing practices, please visit <a href="http://www.nunit.org/">www.nunit.org</a>.&nbsp; </p>
		<span class=bodySubtitle>Running NUnit Tests</span>
		<p>To run your Unit Tests, navigate to your project directory (where your default.build is). At a command prompt, type:</p>
		<pre>nant test</pre>
		<p>If all your tests compile, they'll run. The results will be logged in the <font face="Courier New" size="2">log/</font> directory, in a text file.  You can read the log to find which tests passed, which tests failed, and the reasons for failure.</p>

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
