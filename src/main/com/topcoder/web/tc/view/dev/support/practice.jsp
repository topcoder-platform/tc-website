<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Design Tutorial</title>

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
                <jsp:param name="node" value="digital_run"/>
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
Below are a list of six components.  Read the requirement specifications to decide which one you would like to practice on or complete them all!
<br><br>
<div align="center">
<table cellpadding="3" cellspacing="0" border="0">
<tbody>
   <tr>
      <td width="50%" colspan="2" align="center">
      <img src="/i/interface/dotnet.gif" alt=".NET" border="0" />
      </td>
      <td width="50%" colspan="2" align="center">
      <img src="/i/interface/java.gif" alt=".Java" border="0" />
      </td>
   </tr>
   <tr>
      <td>
      Set - Req Spec
      <td>
      <A href=""><img src="/i/interface/download.gif" alt="download" border="0" /></A>
      </td>
      </td>
      <td>
      Bloom Filter- Req Spec
      </td>
      <td>
      <A href=""><img src="/i/interface/download.gif" alt="download" border="0" /></A>
      </td>
   </tr>
   <tr>
      <td>
      Object Diff - Req Spec
      </td>
      <td>
      <A href=""><img src="/i/interface/download.gif" alt="download" border="0" /></A>
      </td>
      <td>
      File Event Alerter - Req Spec
      </td>
      <td>
      <A href=""><img src="/i/interface/download.gif" alt="download" border="0" /></A>
      </td>
   </tr>
   <tr>
      <td>
      Comp Name - Req Spec
      </td>
      <td>
      <A href=""><img src="/i/interface/download.gif" alt="download" border="0" /></A>
      </td>
      <td>
      Comp Name - Req Spec
      </td>
      <td>
      <A href=""><img src="/i/interface/download.gif" alt="download" border="0" /></A>
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
If you still have questions about your design, or why one technique was used over another, please feel free to post questions in the Practice Competition forum (NEED LINK HERE).  Here you can interact with other TopCoder members to discuss best practices and the components in general.</li>
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
