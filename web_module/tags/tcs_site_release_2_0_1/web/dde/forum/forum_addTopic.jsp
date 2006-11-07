<%
    // Takes in a topic id, and presents form to add subtopics to it
%>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
	// STANDARD PAGE VARIABLES
	String page_name = "c_forum.jsp";
	String action = request.getParameter("a");	
%>

<% // PAGE SPECIFIC DECLARATIONS %>
<%@ page import="com.topcoder.forum.*" %>

<%
	long topicId = 0;
	try {
		topicId = Long.parseLong(request.getParameter("topic"));
	} catch (NumberFormatException nfe) {
		response.sendRedirect("c_forum.jsp");
	}
	
	Object o = CONTEXT.lookup(ForumRemoteHome.EJB_REF_NAME);
	ForumRemoteHome forumHome = (ForumRemoteHome) PortableRemoteObject.narrow(o, ForumRemoteHome.class);
	ForumRemote forum = forumHome.create(topicId); 	
	
        Topic topic = null;
	ForumView view = forum.generateView();
	Iterator iterType = view.iterator();
	if (iterType.hasNext()) {
            Object objElement = iterType.next();
            if (objElement instanceof Topic) {
                topic = (Topic)objElement;
            }
        }

        if (topic == null) {
            response.sendRedirect("c_forum.jsp");
        }

        forum.pushPath(topic);
        view = forum.generateView();
        Iterator iterTmpTopic = view.iterator();
        Topic tmpTopic = (Topic)iterTmpTopic.next();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
<script language="JavaScript" src="/scripts/javascript.js"></script>
    <script language="JavaScript" type="text/javascript" src="/scripts/javascriptForum.js"></script>
</head>

<body class="body">

<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/nav.jsp" %>


<!-- breadcrumb begins -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
<!-- breadcrumb ends -->

<!--Middle Column begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr valign="middle">
		<td class="forumSearch" width="1%">&nbsp;</td>
		<td class="forumSearch" width="1%" nowrap>View:</td>
		<td class="forumSearch" align="left" width="1%" nowrap><a class="forumSearch" href="c_forum.jsp">All posts</a> | <a class="forumSearch" href="c_forum.jsp">New since yesterday</a> | <a class="forumSearch" href="c_forum.jsp">New since last week</a></td>
		<td class="forumSearch" width="96%">&nbsp;</td>
		<td class="forumSearch" align="right" width="1%" nowrap><a class="forumSearch" href="c_forum_advsearch.jsp">Advanced Search</a></td>
		<td class="forumSearch" align="right" width="1%"><input class="forumSearchForm" type="text" size="14" name="siteSearch" value="Search Posts" maxlength="40"></td>
		<td class="forumSearch" align="left" width="1%" nowrap><input class="forumSearchButton" type="submit" name="go" value="&nbsp;Go >>&nbsp;"></input></td>
		<td class="forumSearch" width="1%">&nbsp;</td>
	</tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
	<tr valign="top">
		<td width="1%" class="forumTitle" align="center">New</td>
		<td width="60%" class="forumTitle" align="left">Topic Name</td>
		<td width="2%" class="forumTitle" align="center">Subtopics</td>
		<td width="2%" class="forumTitle" align="center">Posts</td>
		<td width="35%" class="forumTitle" align="left">Last Post</td>
	</tr>

	<!-- Selected topic -->
	<tr valign="top">
	<tr valign="top">
		<td class="forumText" align="center"><img src="/images/iconStatusCollabSm.gif" alt="*" width="17" height="12" border="0" /></td>
		<td class="forumText" align="left"><strong><a class="forumLink" href="c_forum.jsp?fe=<%= topic.getId() %>"><%= topic.getName() %></a></strong><br />
			<%= topic.getText() %>
		</td>
		<td class="forumText" align="center"><%= tmpTopic.getSubtopics().size() %></td>
		<td class="forumText" align="center"><%= topic.getNumPosts() %></td>
		<td class="forumText" align="left"><%= topic.getLastPostDate() %> by <strong><%= topic.getLastPostUsername() %></strong></td>
	</tr>

<%
            Iterator iterSubtopics = tmpTopic.getSubtopics().iterator();
            while (iterSubtopics.hasNext()) {
                    Topic subtopic = (Topic)iterSubtopics.next();
                    forum.pushPath(topic);
                    view = forum.generateView();
                    Iterator iterTmpSubtopic = view.iterator();
                    Topic tmpSubtopic = (Topic)iterTmpSubtopic.next();
%>
	<tr valign="top">
		<td class="forumTextCenter"><img src="/images/iconStatusCollabSm.gif" alt="*" width="17" height="12" border="0" /></td>
		<td class="forumSubtopic"><a href="forum_addTopic.jsp?topic=<%= subtopic.getId() %>"><%= subtopic.getName() %></a><br />
                       <%= subtopic.getText() %>
                </td>
		<td class="forumTextCenter"><%= tmpSubtopic.getSubtopics().size() %></td>
		<td class="forumTextCenter"><%= subtopic.getNumPosts() %></td>
		<td class="forumText" align="left"><%= subtopic.getLastPostDate() %> by <strong><%= subtopic.getLastPostUsername() %></strong></td>
	</tr>
<% 
                forum.popPath();
            } 
%>

</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr valign="middle">
		<td class="forumSearch" align="left"><img src="/images/iconStatusCollabSm.gif" alt="*" width="17" height="12" border="0" /> New posts since your last visit</td>
	</tr>
</table>
<!--Middle Column ends -->

<!-- Create a New Subtopic -->
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="middle">
	<tr>
		<td align="center">
			<table width="800" cellpadding="0" cellspacing="0" border="0">
				<tr><td width="800"><img src="/images/createSubtopicHead.gif" alt="Create a New Subtopic" width="800" height="29" border="0" /></td></tr>
			</table>
			
			<table width="800" cellpadding="0" cellspacing="10" border="0" class="compSearch">
				<tr><td class="adminControl">Create new Subtopics to add to this Topic</td></tr>
				<tr valign="top">
					<td align="center">
						<table cellpadding="0" cellspacing="10" border="0" class="compSearch">

<!-- Subtopic -->
							<tr valign="middle">
								<td class="registerLabel">Subtopic 1</td>
								<td class="registerText"><input class="registerForm" type="text" name="firstName" value ="" size="55" maxlength="100"></td>
							</tr>

<!-- Subtopic -->
							<tr valign="middle">
								<td class="registerLabel">Subtopic 2</td>
								<td class="registerText"><input class="registerForm" type="text" name="firstName" value ="" size="55" maxlength="100"></td>
							</tr>

<!-- Subtopic -->
							<tr valign="middle">
								<td class="registerLabel">Subtopic 3</td>
								<td class="registerText"><input class="registerForm" type="text" name="firstName" value ="" size="55" maxlength="100"></td>
							</tr>

<!-- Subtopic -->
							<tr valign="middle">
								<td class="registerLabel">Subtopic 4</td>
								<td class="registerText"><input class="registerForm" type="text" name="firstName" value ="" size="55" maxlength="100"></td>
							</tr>

<!-- Subtopic -->
							<tr valign="middle">
								<td class="registerLabel">Subtopic 5</td>
								<td class="registerText"><input class="registerForm" type="text" name="firstName" value ="" size="55" maxlength="100"></td>
							</tr>

						</table>
					</td>
				</tr>
				<tr><td class="adminControl" colspan="2"><input class="adminControlButton" type="submit" name="reply" value="&nbsp;Create Subtopics &nbsp;"></input></td></tr>
			</table>
			
			<table width="800" cellpadding="0" cellspacing="0" border="0">
				<tr><td width="800"><img src="/images/messageReplyFoot.gif" alt="" width="800" height="11" border="0" /></td></tr>
			</table></td>
	</tr>
</table>
	
<!-- breadcrumb begins -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
<!-- breadcrumb ends -->

<jsp:include page="/includes/footer.jsp" flush="true" />

</form>
</body>
</html>