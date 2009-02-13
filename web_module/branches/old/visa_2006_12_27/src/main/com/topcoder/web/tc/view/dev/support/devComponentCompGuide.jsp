<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Competition Guidelines</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="dev_documentation"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

<div class="guide">

<h2>Component Competition Guidelines</h2>

We have posted a number of answers, clarifications and best practices for the component competition process in various forum threads. The following, along with our updated <A href="/tc?module=Static&d1=dev&d2=support&d3=devReviewerGuide">Reviewer Guidelines</A>, compiles these updates into one definitive list, and it should be considered required reading for component competitors and reviewers. This document will be updated as needed over time &mdash; to discuss the points below or raise more questions, please visit the <A href="https://software.topcoder.com/forum/c_active_collab.jsp?ft=2">Developer Forums</A>. 

<H2>Design</H2>
<ul>
<li><span class=bodySubtitle>Type-Safe Arguments and Return Values</span><br>
For Java versions prior to 1.5, accepting collections as method parameters and using them as return types makes those methods difficult to understand.  For Java 1.5, generics should be used to identify the type of the collection contents.  Type information should not be hidden by a Collection.
</li>
<li><span class=bodySubtitle>The Singleton Pattern</span><br>
This design pattern is almost always a bad idea in a component design.  At the component level, you simply don't know what kind of application will need to use your component.
</li>
<li><span class=bodySubtitle>Sub-Components</span><br>
Sometimes a design includes a request for one or more new components. You do not need to provide designs for the sub-components, but you do need to explain what the current project will need from the sub-component, and why the sub-component is useful and generic enough to merit a separate project.
</li>
</ul>

<H2>Development</H2>
<ul>
<li><span class=bodySubtitle>Scoping New Classes</span><br>
If you add helper methods or classes, you should scope them as narrowly as possible while maintaining their useability. For example, if a helper class absolutely has to be public (to span across packages), then it is fine to make it public.
</li>
<li><span class=bodySubtitle>Resource Management</span><br>
Components should manage their resources wisely. Just because Java and .NET use garbage collection doesn't mean that resource deallocation can be ignored. For example, a component that uses JDBC should close its Connection, PreparedStatement and ResultSet objects when they are no longer needed. If these references are allowed to leak, they might stick around in the VM until it's restarted.  A common mistake is to create a Connection, PreparedStatement, and ResultSet, and then return the ResultSet to the caller, immediately leaking the first two objects.
</li>
<li><span class=bodySubtitle>JDBC Connection Management</span><br>
JDBC Connection objects should *never* be cached.  Creating and closing connections every time you need them rarely results in a performance drop, since most applications will be using a connection pool.
</li>
<li><span class=bodySubtitle>Creating SQL Statements</span><br>
Prepared Statements should be used almost exclusively.  The cases where dynamic SQL needs to be used are exceedingly rare.  The performance degradation incurred by using dynamic SQL can be severe and will cause difficulties for all applications accessing the database.  Dynamic SQL also introduces security issues (SQL Injection) that are alleviated by the use of Prepared Statements.
</li>
<li><span class=bodySubtitle>Absolute Paths</span><br>
Components should not require absolute paths in their configuration, and neither should test cases.
</li>
<li><span class=bodySubtitle>Hardcoded Paths</span><br>
Components should not require hardcoded paths in their configuration, and neither should test cases.
</li>
<li><span class=bodySubtitle>Environment Dependencies</span><br>
You should be very careful that you do not introduce operating system or file system dependencies into your code and test cases.  You should also check whether a submission you are reviewing has those dependencies.  Examples include assuming that the file system is or is not case sensitive, assuming that files can or cannot be marked executable, or that there will not be extra files in the testing directories (a common case when the component is checked out of CVS or Subversion).
</li>
<li><span class=bodySubtitle>Localization</span><br>
Locale dependencies are another major issue.  You should make absolutely sure that all strings are formatted for the proper locale.  This is a particularly big problem when creating documents that have to conform to a specific standard: if a locale happens to contradict the standard, the component won't work in it.  A common problem is generating locale-specific string representations of floating point numbers for a format that assumes that the decimal separator is a dot.  Any locale where the decimal separator is a comma will break the format.
</li>
<li><span class=bodySubtitle>Testing</span><br>
   <ul>
   <li><i>Separating Tests</i><br>
       Testing for multiple issues in a single function is poor practice, since when one of the checks fails JUnit / NUnit will count the whole block as a failure.  This doesn't pinpoint the problem to a tester, and more importantly it results in a score that does not reflect how many tests the submission truly passed.
   </li>
   <li><i>Test Location</i><br>
       All your tests should be placed in the base test directory (generally src/java/tests/main/package/name for Java, or src/csharp/tests/Main/Package/Name for .NET).  If you wish to separate your tests for each package in the design, you may do so.  However, in that case you are responsible for ensuring that all your tests end up in your development submission.
       <br><br>
       Competitors should <strong>never</strong> place tests in the Accuracy, Stress, or Failure directories.  Those directories are for reviewer tests only.
   </li>
   </ul>
</li>
</ul>
</div>
            <br/>
            <br/>
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

<jsp:include page="/foot.jsp" />

</body>

</html>
