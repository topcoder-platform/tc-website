<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Assembly Competitions</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>


<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="assembly_how_to_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="How to Compete"/>
</jsp:include>

<span class="bigTitle">How to Compete</span>
<br><br>
With TopCoder's new Assembly Registration Tool, you can now do all the Assembly-related planning you used to do by email through a streamlined, online process. This includes:

<ul>
<li>Accessing open and available projects</li>
<li>Registering for a project as a free agent</li>
<li>Registering for a project as a team captain</li>
<li>Viewing and recruiting free agents</li>
<li>Managing your team's roster and payment assignments</li>
<li>Contacting and working with team members</li>
</ul>
<br><br>
More detailed documentation on using the tool is coming soon, but you can check it out at 
<a href="/registration/actions/ProjectManagement.do?method=displayProjectList">www.topcoder.com/registration/</a> now.
<br><br>
Got questions or comments? <tc-webtag:forumLink forumID="517268" message="Discuss it here" />.

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td>
   <jsp:include page="/public_right.jsp">
       <jsp:param name="level1" value="default"/>
   </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

