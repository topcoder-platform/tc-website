<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText{   background-color: #EEEEEE; }
.GAtableText2{   background-color: #FF6600; }
.GAtableText3{   background-color: #FFCC00; }
.GAtableText4{   background-color: #FFFF00; }
.GAtableText5{   background-color: #FFFF99; }

</style>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right;"><tc-webtag:forumLink forumID="506092" message="Discuss this article" /></div>
<span class="bigTitle">The art of testing C++ code: An introduction to cppUnit</span>

      <p>
      <img src="/i/m/sql_lall_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="275640" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

    <span class="bodySubtitle">Background:</span><br />
    Before a motor company releases a new car, it must first be tested to make sure the steering, acceleration and brakes function correctly.
    Before releasing a new medical drug into the market, it undergoes strict testing to ensure it does what it claims with no undesired harm.
    In the same way, before any software is released into the wild, it should first be subjected to rigorous tests to try to confirm
    that each section of the code is bug free.
    <br /><br />
    <a href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Unit_test">Unit testing</a>, popularized as part of the framework for
    <a href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Xtreme_Programming">Xtreme Programming</a>, is one possible method for code-testing
    based on testing every aspect of the code for well-defined behavior. To assist developers, unit testing code has been developed for
    many different platforms, commonly referred to as <a href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/XUnit">xUnit</a>. TCS developers may recognize
    many listed there, such as jUnit, jsUnit, nUnit, and httpUnit (covered in this <a href="/tc?module=Static&d1=features&d2=071006">feature</a>).
    cppUnit is the port of this framework for use with C++ projects.
    <br /><br />

    <span class="bodySubtitle">Building your unit:</span><br>
    Before developing cppUnit code, it must be first built locally. Detailed information is available from the
    <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/cppunit-wiki/BuildingCppUnit1">cppUnit wiki build page</a>,
    and is summarized below. This process applies to those on a Unix machine or running cygwin under Windows:
    <ol>
      <li><strong>Obtain the source</strong>, available from cppUnit's sourceforge
        <a href="/?t=sponsor&c=link&link=http://prdownloads.sourceforge.net/cppunit/">download page</a>. At the time of writing, the most recent stable version is 1.10.2</li>
      <li><strong>Unpack locally</strong> by unzipping and untarring the download.</li>
      <li><strong>Check configuration details</strong> available by reading the INSTALL-x file provided. Beware that some information provided
          about cygwin here is <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/cppunit-wiki/BuildingCppUnit1#head-dbaa9ca011a5c2325563f7881fac60345a6d7bf5">outdated and incorrect.</a></li>
      <li><strong>Generate makefiles</strong> by running <tt>./configure</tt>.</li>
      <li><strong>Compile</strong> it all by calling <tt>make</tt>. This will output a lot of information to the console,
          and may include warnings, but hopefully no errors.</li>
      <li><strong>Test</strong> the installation with <tt>make check</tt>. Yes, you are testing testing code!</li>
      <li><strong>Install</strong> libraries and headers with <tt>make install</tt>.</li>
    </ol>
    For those using Linux or cygwin, it may be useful to check first to see if cppUnit has already been installed. A good indication is to see if
    <tt>./cppunit-config</tt>, a cppUnit utility, can run.<br /><br />
    If you are interested in using cppUnit from Windows using Visual Studio, there will be a .dsw file provided that allows you to test a project in
    the Post-Build phase. For more information, see the build page linked above. 
    Also available are instructions to build cppUnit within <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/cppunit-wiki/CppUnitWithEclipse">Eclipse</a>.
    <br /><br />
    <span class="bodySubtitle">Unit interaction:</span><br>
    Unit testing with cppUnit is based around <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/class_test_fixture.html">TestFixture</a>
    instances, each of which contains a suite of test cases. 
    <br><br>
    To write some tests of your own, first create a test class that extends publicly from the <tt>CppUnit::TestFixture</tt> class.
    Inside that you can then create as many void test methods as you like, performing various assertion tests using the multitude of
    helpful test macros provided by <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/group___assertions.html">TestAsserts.h</a>.
    For example, here is a method which tests the return value of a method multiple times, using most of the available macros:
    <pre class="codeBox">
class suiteOfTests : public CppUnit::TestFixture {
    /* snip */
public:
    void ageTest(){
        int age = ClassImTesting.getAge();

        // simple asserts
        CPPUNIT_ASSERT(age == 18);
        CPPUNIT_ASSERT_MESSAGE("Must be 18", age == 18);

        // asserting equality:
        CPPUNIT_ASSERT_EQUAL(age, 18);
        CPPUNIT_ASSERT_EQUAL_MESSAGE("Must be 18", age, 18);
        CPPUNIT_ASSERT_DOUBLES_EQUAL(age * 1.0, 18.0, 1e-10);

        // exception asserts:
        CPPUNIT_ASSERT_THROW( ClassImTesting->testAge(age - 1), WrongAgeException);
        CPPUNIT_ASSERT_NO_THROW(  ClassImTesting->testAge(age), WrongAgeException);

        // inverse asserts:
        if(age != 18)
            CPPUNIT_FAIL("Must be 18");
        CPPUNIT_ASSERT_ASSERTION_FAIL( CPP_UNIT_ASSERT( age != 18 ));
    }

    void setUp(){...}    // used to set up the require preconditions
    void tearDown(){...} // called after tests are run, in order to clean up.
};
    </pre>
As you can see, the macros provided give a variety of ways to test the code, including checking for boolean true/false, equality with optional epsilon, checking error handling, and manually failing or inverting an assertion. Each macro expands into a cppUnit assertion which includes a
message (which you may provide in xx_MESSAGE macros)
to help you find the test if it fails, as well as the line in the source from which it originates.
<br><br>
There are also two functions, <tt>setUp</tt> and <tt>tearDown</tt>, where you should put any logic that must be executed before or after the tests are run, respectively.<br /><br />
In addition it is simple to create your own assertions, including custom macros. Their creation is beyond the scope of this introduction, but a clear example is available <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/struct_asserter.html">here</a>.<br />
<br><br>
<span class="bodySubtitle">Declaration of intent:</span><br />
The benefit to using a TestFixture comes when telling the rest of your code where your tests lie. Again, through the use of macros,
cppUnit will automatically put all of your tests together in a testing suite, available statically. Use is self-explanatory, for example:
    <pre class="codeBox">
#include &lt;cppunit/TestCase.h>
#include &lt;cppunit/extensions/HelperMacros.h&gt;

class suiteOfTests : public CppUnit::TestFixture {
    // generation macros, using the class and method names
    CPPUNIT_TEST_SUITE( suiteOfTests ); // use CPPUNIT_TEST_SUB_SUITE for subclasses,
                                        //    to call inherited tests
        CPPUNIT_TEST( ageTest );        // add each method name in a CPPUNIT_TEST call
        CPPUNIT_TEST( heightTest );     //        "                        "

    CPPUNIT_TEST_SUITE_END();           // generates the TestSuite* suite() method

    public:
    void ageTest(){...}
    void heightTest(){...}
    /* snip */
};
    </pre>
The result of these will be an additional two methods:<br />
<tt>static void addTestsToSuite(...)</tt>, which will be called by a tester to register all the methods found inside a CPPUNIT_TEST macro.<br />
<tt>static CPPUNIT_NS::TestSuite *suite()</tt>, which returns a suite of tests that can be executed at runtime.<br />
    <br />

    <span class="bodySubtitle">Final preparation:</span>
    <ul>
    <li><strong>Testing manually:</strong> Having written all these test cases, no doubt you'll be wanting to execute them at some stage.
    cppUnit provides a <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/class_test_runner.html">TestRunner</a> class that you can add TestSuites to, as well
    as execute by calling its <tt>run(...)</tt> method.</li>
    <li><strong>Testing using registry:</strong> It may not suprise you to learn that there is a more automated way of running tests, through use of
    macros found inside <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/_helper_macros_8h.html">HelperMacros.h</a>.
    As shown below, you can register your fixtures by putting their class name inside a <tt>CPPUNIT_TEST_SUITE_REGISTRATION</tt> macro. This
    will add the entire suite to a Factory registry, which can be obtained statically later and added to a TestRunner (see below).</li>
    <li><strong>XML generation:</strong> The default output for cppUnit is to print to the console the suite results, as well as any errors encountered.
    As with other xUnit ports, cppUnit provides a simple way to also output all results to an XML file. It is constructed as in instance
    of <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/class_xml_outputter.html">XmlOutputter</a> as shown below, and added to the
    TestRunner before the suites are run.<br />
    Other forms of output are supported, such as GUI using <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/cppunit-wiki/MfcTestRunner">MFC</a> or
    <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/cppunit-wiki/QtTestRunner">Qt</a> depending on compile environment. It is also possible to
    create your own custom output formatters, feel free to explore the cppUnit wiki's information about this.</li>
    </ul>
<pre class="codeBox">
#include &lt;fstream&gt;
#include &lt;cppunit/TestCase.h&gt;
#include &lt;cppunit/XmlOutputter.h&gt;
#include &lt;cppunit/ui/text/TestRunner.h&gt;
#include &lt;cppunit/extensions/TestFactoryRegistry.h&gt;

    // ...
    CPPUNIT_TEST_SUITE_REGISTRATION( suiteOfTests );

    // ...
    CppUnit::TestRunner runner; // creates a test executor

    // Specify XML output and inform the test runner of this format (optional)
    CppUnit::XmlOutputter* outputter =
            new CppUnit::XmlOutputter(&runner.result(), std::ofstream("result.xml"));
    runner.setOutputter(outputter);

    // use the suite factory, then execute all tests
    runner.addTest( CppUnit::TestFactoryRegistry::getRegistry().makeTest() );
    runner.run( "", false );
</pre>

    <span class="bodySubtitle">All units go:</span><br />
    Once you have written your cppUnit code, the following should compile it using gcc, as long as the initial build step was successful.
    This assumes the main() method is in cppTester.cpp, and you want the executable to be called textExec (though  the names are easily changed):
    <pre class="codeBox">
g++ <i>$(cflags)</i> -o testExec cppTester.cpp ..[any other .cpp / .o].. <i>$(lflags)</i>
</pre>

where <tt>$(cflags)</tt> are the required compiler flags, as found by running <tt>./cppunit-config --cflags</tt><br />
and <tt>$(lflags)</tt> are the required librarys to be linked, found with <tt>./cppunit-config --link</tt>
<br><br>
    <span class="bodySubtitle">Debriefing:</span><br />
    Hopefully this introduction has introduced enough of cppUnit for you to start writing and running your own suite of tests. <br />
    However, cppUnit has many more features and options for you to explore if you wish. Some places to start include:
    <ul>
    <li>Documentation: <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/doc/lastest/index.html">http://cppunit.sourceforge.net/doc/lastest/index.html</a></li>
    <li>cppUnit wiki: <a href="/?t=sponsor&c=link&link=http://cppunit.sourceforge.net/cgi-bin/moin.cgi">http://cppunit.sourceforge.net/cgi-bin/moin.cgi</a></li>
    <li>Code Project article: <a href="/?t=sponsor&c=link&link=http://www.codeproject.com/library/Using_CPPUnit.asp">http://www.codeproject.com/library/Using_CPPUnit.asp</a></li>
    </ul>
    
    In addition, if you have any questions regarding cppUnit or this article in particular, feel free to ask at the <a href="http://forums.topcoder.com">forums</a>.
<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
