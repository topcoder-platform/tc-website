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
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="514974" message="Discuss this article" />
</div>

<span class="bigTitle">Using Mock Objects with Components</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/real_vg_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15891862" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>The number of components posted on TopCoder Design and Development contests seems to increase almost every week. While more components means more variety, opportunity, and prize money (all good things), the increased number of components can lead to challenges for developers. When the component you're working on is dependent on another component that is also currently in development (or vice versa) it can make effective unit testing very difficult. </p>

<p>The point of unit testing, of course, is to focus on one individual unit of software at a time to ensure that each piece performs its task correctly. The problem, though, is that these units don't exist in a vacuum. If the component on which your project depends is not yet ready, you will need to simulate it in some way. </p>

<p>This is where mock objects come in. Wikipedia defines mock objects, or &quot;mocks,&quot; as &quot;stub-like objects that implement no logic of their own and are used to replace the parts of the system with which the unit under test interacts.&quot; </p>

<p>If mock objects are &quot;stub-like,&quot; how are they actually different from stubs? Distinguishing mocks from stubs can be tricky, and there are a host of articles and blog entries on the topic (some of which you can explore for yourself, below). For our purposes, it's easiest to understand stubs as static code that gives you one particular response that you expect; mock objects, on the other hand, are dynamically generated and illustrate the range of available responses in an interaction. </p>

<p>Using a mock generally requires manually creating a mock-up implementation of the classes needed for testing. This can be a big effort, as you will need to implement each of the methods of the mock-ups as well as invent some mechanism to check the usage of the mock-up classes. In this article we'll look into an alternative to this labor-intensive approach. </p>

<p>By relying on so-called &quot;Mock Object&quot; libraries, the process of creating mock-ups can be semi-automated, with the mock-up classes created in run time instead of compile time. This approach is backed with various so-called &quot;Mock Objects&quot; libraries. In particular, I'll look at <a target="_blank" href="<tc-webtag:linkTracking link='http://www.easymock.org' refer='feature_040207' />">EasyMock</a>, a free open-source software tool that was the first dynamic Mock Object generator. While the examples below are all based on the Java version, a .NET version of EasyMock and specialized .NET libraries such as Rhino Mocks are available as well.</p>

<p><span class="bodySubtitle">Mock objects in practice</span></p>

<p> The best way to demonstrate the value of Mock Objects is through a simple example, in which we compare them to manually coded mock-ups. In this example, let's assume we have two components posted for development -- one called &quot;Guitars,&quot; the other called &quot;Guitarists.&quot; The &quot;Guitars&quot; component defines the &quot;Guitar&quot; interface as: </p>

<pre class="code"> 
 interface Guitar {
     void play(); 
 }
</pre>

The &quot;Guitarists&quot; component defines the &quot;Guitarist&quot; interface as:

<pre class="code"> 
 interface Guitarist {
     void playGuitar(Guitar guitar);
 } 
</pre>

It also has an implementation of this interface, defined as:

<pre class="code"> 
 public class CoolGuitarist implements Guitarist {
     void playGuitar(Guitar guitar) {
        guitar.play();
     }
 } 
</pre>

We want to guarantee that the CoolGuitarist.playGuitar() method will really call the Guitar.play() method, so we need to write some unit tests. Here's where we run into a problem, though, because we don't have any Guitar implementations yet for testing. Let's go ahead and code a mock-up implementation: \

<pre class="code"> 
 class MockGuitar implements Guitar {
     private int timesPlayed = 0;
     public int getTimesPlayed() {
        return timesPlayed;
     }
     public void play() {
        timesPlayed++;
     }
 } 
</pre>

Next, we code our unit tests with a method like this:

<pre class="code"> 
 public void testGuitaristPlay() {
     // Create mock-up object
     MockGuitar guitar = new MockGuitar();
     // Create object to test
     Guitarist guitarist = new CoolGuitarist();
     // Execute method to test
     guitarist.playGuitar(guitar);
     // Check whether the method did its work correctly
     assertEquals(1, guitar.getTimesPlayed());
 } 
</pre>

Let's see how this test method can be rewritten using Mock Objects library, in particular the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.easymock.org' refer='feature_040207' />">EasyMock 2.2</a> library.

<pre class="code"> public void testGuitaristPlay() {
     // Create mock-up object
     Guitar guitar = createMock(Guitar.class);
     // Create object to test
     Guitarist guitarist = new CoolGuitarist();
     // Record the sequence of calls, the mock object should expect
     guitar.play();
     // Replay the sequence of calls
     replay(guitar);
     // Execute method to test
     guitarist.playGuitar(guitar);
     // Verify the sequence of calls
     verify(guitar); 
 } 
</pre>

<p>While the test method using the mock objects library is a bit longer, it does take fewer lines of code than manually coding the mock class implementation. The use of mock objects also makes things clearer for the people reading the tests (if they are familiar with the technique), as there is no need to look into the implementation of mock classes to understand any assumptions the developer made about the classes' behavior. </p>

<p><span class="bodySubtitle">Advanced techniques</span><br />
Just checking to see if a particular method of a mocked object was called is generally insufficient, however. Instead, you will usually need to specify what the method of a mock object should return to its caller. The method can either return some value or throw an exception, and there are means to specify both behaviors. Let's assume that the Guitar interface is a bit expanded (going forward, we will indicate new items with red):</p>

<pre class="code">
 interface Guitar {
<font color="#FF0000">     boolean isTuned();
     void tune() throws StringsTornException;
</font>     void play();&nbsp;
 } 
</pre>

The CoolGuitarist class will then need to be changed to something like:

<pre class="code">
 public class CoolGuitarist {
     void playGuitar(Guitar guitar) throws StringsTornException {
<font color="#FF0000">        if (!guitar.isTuned()) {
            guitar.tune(); 
        }
</font>        guitar.play();
     }
 } 
</pre>

The Guitarist interface will need to have its playGuitar() method signature updated as well, to indicate that it can throw StringsTornException. The test case will need to test for the new behavior, as follows:

<pre class="code">
 public void testGuitaristPlay() {
     // Create mock-up object
     Guitar guitar = createMock(Guitar.class);
     // Create object to test
     Guitarist guitarist = new CoolGuitarist();
     // Record the sequence of calls, the mock object should expect
<font color="#FF0000">     // Specify that method call should return &quot;false&quot; value
     expect(guitar.isTuned()).andReturn(false);
     guitar.tune();
</font>     guitar.play();
     // Replay the sequence of calls
     replay(guitar);
     // Execute method to test
     guitarist.playGuitar(guitar);
     // Verify the sequence of calls
     verify(guitar); 
 } 
</pre>

For exceptions the following can be written:

<pre class="code">
 public void testGuitaristPlayFailure() {
     // Create mock-up object
     Guitar guitar = createMock(Guitar.class);
     // Create object to test
     Guitarist guitarist = new CoolGuitarist();
     // Record the sequence of calls, the mock object should expect
 <font color="#FF0000">    // Specify that method call should return &quot;false&quot; value
     expect(guitar.isTuned()).andReturn(false);
     expect(guitar.tune()).andThrow(new StringsTornException());</font>
     // Replay the sequence of calls
     replay(guitar);
<font color="#FF0000">     try {</font>
         // Execute method to test
         guitarist.playGuitar(guitar);
<font color="#FF0000">         fail(&quot;StringsTornException should have been thrown&quot;);
     } catch (StringsTornException e) {
         // Exception was expected
     }</font>
     // Verify the sequence of calls
     verify(guitar); 
 } 
</pre>

<p>The method returned by the expect() method provides even more flexibility in addition to that shown above. Beyond the andReturn() and andThrow() methods, it also provides the times() method, which allows you to specify how many method calls are expected. For example, expect(guitar.isTuned()).andReturn(true).times(3), specifies that the isTuned() method should be expected to be called three times and always return &quot;true&quot; value. </p>

<p>The methods can be chained to an even further extent to specify different return values for the same call. For example, expect(guitar.isTuned()).andReturn(true).times(3).andReturn(false) will specify that the method should be expected to be called three times returning &quot;true&quot; value and one time returning &quot;false&quot; value.

<p>There are even more useful features provided by the EasyMock library. For more information, I'd encourage you to check out its <a target="_blank" href="<tc-webtag:linkTracking link='http://www.easymock.org/EasyMock2_2_Documentation.html' refer='feature_040207' />">documentation</a>.</p>

<p><span class="bodySubtitle">Conclusions</span><br />
There are some cases when mock objects are less convenient to use than manually written mock classes, such as instances when getter/setter methods are mostly called. For example, consider the HttpServletRequest class, which has setAttribute() and getAttribute() methods. It would be more convenient and clear to use the setAttribute() method to set the attributes of the request object than it would be to provide the expectations for getAttribute() method calls.</p>

<p>Most of the time, though, using mock objects will help you streamline and accelerate unit testing. EasyMock and similar mock object libraries are easy enough to learn and to use in the unit tests for TopCoder components and, in most cases, their use will result in a significant decrease in code amount and an increase in code clarity.</p>

<p>To learn more, check out some of the references below. </p>

<p><span class="bodySubtitle">References:</span>
<ul>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://en.wikipedia.org/wiki/Mock_object' refer='feature_040207' />">WikiPedia: Mock Object</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.easymock.org/EasyMock2_2_Documentation.html' refer='feature_040207' />">EasyMock 2.2 documentation</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://sourceforge.net/projects/easymocknet/' refer='feature_040207' />">EasyMock .NET</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ayende.com/projects/rhino-mocks.aspx' refer='feature_040207' />">Rhino Mocks</a> (Mock Objects library for .NET)</li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.onjava.com/pub/a/onjava/2004/02/11/mocks.html?page=1' refer='feature_040207' />">ONJava.com &ndash; Approaches to Mocking</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://www.martinfowler.com/articles/mocksArentStubs.html' refer='feature_040207' />">Martin Fowler: Mocks aren't stubs</a></li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://codebetter.com/blogs/jeremy.miller/archive/2005/12/19/135757.aspx' refer='feature_040207' />">Jeremy Miller: Mock Objects and Stubs</a></li>
</ul></p>
<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
