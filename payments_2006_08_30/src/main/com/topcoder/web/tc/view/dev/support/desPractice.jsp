<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Component Competition Practice</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="des_getting_started"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<span class="title">Practicing & Training for<br>TopCoder Component Competitions</span>
<br><br>
Six components, three .NET and three Java components have been set up as practice components.  These components are actual components that have been used in previous rated events. This gives the event participants a chance to identify their errors or fine-tune their solutions, and it gives others a chance to get a feel for the types of problems that are used in a rated event.  These practice components are different than rated components since a Review Board is not involved; rather there are self-evaluations for each person to use in evaluating their work.  Also, the practice components do not involve all of the work of rated components.  
<br><br>
It is highly recommended that all new members try a practice component prior to competing in a rated component competition. By participating in a practice component, you will learn to use the required toolset, the nature of the designs and implementations, and the expected structure of your submission. You will also get a chance to look at an winning submissions from previous .NET and Java competitions.
<br><br>
At the very least, looking at submissions from others and following the guided self-evaluation will show you 
<ol>
<li>exactly how to structure your submission</li>
<li>samples of the various deliverables, and</li>
<li>how to evaluate your own work.</li>
</ol>
<ul>
<li><strong>Selecting a Problem</strong><br>
Below is a list of components, with two more arriving soon.  Read the requirement specifications to decide which one you would like to practice on or complete them all!
<br><br>
<div align="center">
<table cellpadding="6" cellspacing="0" border="0">
<tbody>
   <tr>
      <td colspan="3" align="center">
      <img src="/i/interface/dotnet_big.jpg" alt=".NET" border="0" />
      </td>
      <td colspan="3" align="center">
      <img src="/i/interface/java_big.jpg" alt=".Java" border="0" />
      </td>
   </tr>
   <tr>
      <td nowrap="nowrap" width="25%" style="border-bottom: 1px solid #999999;" class="small">
      Problem
      </td>
      <td nowrap="nowrap" width="25%" align="center" style="border-bottom: 1px solid #999999;" class="small">
      Requirement<br>specs
      </td>
      <td nowrap="nowrap" align="center" style="border-right: 1px solid #999999; border-bottom: 1px solid #999999;" class="small">
      Distributions
      </td>
      <td nowrap="nowrap" width="25%" style="border-bottom: 1px solid #999999;" class="small">
      Problem
      </td>
      <td nowrap="nowrap" width="25%" align="center" style="border-bottom: 1px solid #999999;" class="small">
      Requirement<br>specs
      </td>
      <td nowrap="nowrap" align="center" style="border-bottom: 1px solid #999999;" class="small">
      Distributions
      </td>
   </tr>
   <tr>
      <td nowrap="nowrap">
      <strong>Object Diff</strong>
      </td>
      <td align="center">
      <A href="/i/development/downloads/ObjectDiffObjectives.pdf"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      </td>
      <td align="center" style="border-right: 1px solid #999999;">
      <A href="/i/development/downloads/ObjectDiffTutorial.zip"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      </td>
      <td nowrap="nowrap">
      <strong>File Event Alerter</strong>
      </td>
      <td align="center">
      <A href="/i/development/downloads/FileEventAlerterObjectives.pdf"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      </td>
      <td align="center">
      <A href="/i/development/downloads/FileEventAlerterTutorial.zip"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      </td>
   </tr>
   <tr>
      <td nowrap="nowrap">
      <strong>coming soon&#8230;</strong>
      </td>
      <td align="center">&#160;
      <%--
      <A href="/i/development/downloads/ObjectDiffObjectives.pdf"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      --%>
      </td>
      <td align="center" style="border-right: 1px solid #999999;">&#160;
      <%--
      <A href="/i/development/downloads/ObjectDiffTutorial.zip"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      --%>
      </td>
      <td nowrap="nowrap">
      <strong>coming soon&#8230;</strong>
      </td>
      <td align="center">
      <%--
      <A href="/i/development/downloads/FileEventAlerterObjectives.pdf"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      --%>
      </td>
      <td align="center">
      <%--
      <A href="/i/development/downloads/FileEventAlerterTutorial.zip"><img src="/i/interface//emblem/disk.gif" alt="download" border="0" /></A>
      --%>
      </td>
   </tr>
</tbody>
</table>
<br><br>
</div>

</li>
<li><strong>Submission of the Practice Components</strong><br>
The practice components are designed to allow you to take your time and get a feel for the tools and skills required to compete. These components are not reviewed or submitted.</li>
<li><strong>Self Evaluation</strong><br>
Although you will not receive peer review, you will be able to score yourself using our scorecard (provide link to scorecard) and the self evaluation form included with each download.  Evaluating your own work and identifying areas to improve is a key skill set in component competitions. Honing that skill now through these practice competitions will greatly improve your chances of winning.  </li>
<li><strong>Additional questions</strong><br>
If you still have questions about your design, or why one technique was used over another, please feel free to post questions in the <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=327735">Getting Started forum</A>.  Here you can interact with other TopCoder members to discuss best practices and the components in general.</li>
</ul>


</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>
</html>
