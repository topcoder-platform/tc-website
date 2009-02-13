
<%
/**
 * editForum.jsp
 * July, 2000
 */
%>

<%@ page import="java.util.*,
                 com.coolservlets.forum.*,
                 com.coolservlets.forum.util.*,
				 com.coolservlets.forum.util.admin.*"%>

<jsp:useBean id="adminBean" scope="session"
 class="com.coolservlets.forum.util.admin.AdminBean"/>
 
<%	////////////////////////////////
	// Jive authorization check
	
	// check the bean for the existence of an authorization token.
	// Its existence proves the user is valid. If it's not found, redirect
	// to the login page
	Authorization authToken = adminBean.getAuthToken();
	if( authToken == null ) {
		response.sendRedirect( "login.jsp" );
		return;
	}
%>
 
<%	////////////////////
	// Security check
	
	// make sure the user is authorized to administer users:
	ForumFactory forumFactory = ForumFactory.getInstance(authToken);
	ForumPermissions permissions = forumFactory.getPermissions(authToken);
	boolean isSystemAdmin = true;
	boolean isUserAdmin   = true;
	
	// redirect to error page if we're not a forum admin or a system admin
	if( !isUserAdmin && !isSystemAdmin ) {
		request.setAttribute("message","No permission to administer forums");
		response.sendRedirect("error.jsp");
		return;
	}
%>
 
<%	////////////////////
	// get parameters
	
	int forumID   = ParamUtils.getIntParameter(request,"forum",-1);
	boolean doUpdate = ParamUtils.getBooleanParameter(request,"doUpdate");
	String newForumName = ParamUtils.getParameter(request,"forumName");
	String newForumDescription = ParamUtils.getParameter(request,"forumDescription");
%>

<%	//////////////////////////////////
	// global error variables
	
	String errorMessage = "";
	
	boolean noForumSpecified = (forumID < 0);
%>

<%	////////////////////
	// make a profile manager
	ProfileManager manager = forumFactory.getProfileManager();
%>

<%	/////////////////
	// update forum settings, if no errors
	if( doUpdate && !noForumSpecified ) {
		try {
			Forum tempForum = forumFactory.getForum(forumID);
			if( newForumName != null ) {
				tempForum.setName(newForumName);
			}
			if( newForumDescription != null ) {
				tempForum.setDescription(newForumDescription);
			}
			request.setAttribute("message","Forum properties updated successfully");
			response.sendRedirect("forums.jsp");
			return;
		}
		catch( ForumNotFoundException fnfe ) {
			System.err.println(fnfe); fnfe.printStackTrace();
		}
		catch( UnauthorizedException ue ) {
			System.err.println(ue); ue.printStackTrace();
		}
	}
%>

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style/global.css">
</head>

<body background="images/shadowBack.gif" bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

<%	///////////////////////
	// pageTitleInfo variable (used by include/pageTitle.jsp)
	String[] pageTitleInfo = { "Forums : Edit Forum Properties" };
%>
<%	///////////////////
	// pageTitle include
%><%@ include file="include/pageTitle.jsp" %>

<p>

<%	////////////////////
	// display a list of groups to edit if no group was specified:
	if( noForumSpecified ) {
		String formAction = "edit";
%>
		<%@ include file="forumChooser.jsp"%>
		
		
		
<%	/////////////////////
	// get an iterator of forums and display a list
	
	forumIterator = forumFactory.forums();
	if( !forumIterator.hasNext() ) {
%>
		No forums!
<%
	}
%>
		
<%		out.flush();
		return;
	}
%>

<%	/////////////////////
	// at this point, we know there is a group to work with:
	Forum forum = null;
	try {
		forum                  = forumFactory.getForum(forumID);
	}
	catch( ForumNotFoundException fnfe ) {
	}
	catch( UnauthorizedException ue ) {
	}
	String forumName             = forum.getName();
	String forumDescription      = forum.getDescription();
%>

Properties for: <%= forumName %>

<p>

<form action="editForum.jsp" method="post">
<input type="hidden" name="doUpdate" value="true">
<input type="hidden" name="forum" value="<%= forumID %>">
	Change Forum Name:
	<input type="text" name="forumName" value="<%= forumName %>">
	
	<p>
	
	Change Description:
	<textarea cols="30" rows="5" wrap="virtual" name="forumDescription"><%= forumDescription %></textarea>
	
	<p>
	
	<input type="submit" value="Update">
</form>

</body>
</html>

