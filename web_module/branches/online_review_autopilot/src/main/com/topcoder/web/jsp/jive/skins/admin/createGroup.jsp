
<%
/**
 * createGroup.jsp
 * July, 2000
 */
%>

<%@ page import="java.util.*,
                 com.coolservlets.forum.*,
                 com.coolservlets.forum.util.*,
				 com.coolservlets.forum.util.admin.*"
	errorPage="error.jsp"
%>

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
	boolean isSystemAdmin = true;
	boolean isGroupAdmin  = true;
	
	// redirect to error page if we're not a group admin or a system admin
	if( !isGroupAdmin && !isSystemAdmin ) {
		throw new UnauthorizedException("Sorry, you don't have permission to create a group");
	}
%>
 
<%	////////////////////
	// get parameters
	
	String groupName         = ParamUtils.getParameter(request,"groupName");
	String groupDescription  = ParamUtils.getParameter(request,"groupDescription");
	boolean doCreate         = ParamUtils.getBooleanParameter(request,"doCreate");
%>
 
<%	//////////////////////////////////
	// global error variables
	
	String errorMessage = "";
	
	boolean errorGroupName = (groupName == null);
	boolean errorGroupAlreadyExists = false;
	boolean errors = (errorGroupName);
%>

<%	//////////////////
	// load user of this page:
	
	ProfileManager manager = forumFactory.getProfileManager();
	
	// UserNotFoundException is caught by error page
	User user = manager.getUser(authToken.getUserID());
%>

<%	////////////////////
	// create the group
	
	if( !errors && doCreate ) {
		try {
			Group newGroup = manager.createGroup(groupName);
			// add this user as an administrator of the new group
			newGroup.addAdministrator(user);
			if( groupDescription != null ) {
				newGroup.setDescription( groupDescription );
			}
		}
		catch( GroupAlreadyExistsException gaee ) {
			errorGroupAlreadyExists = true;
		}
	}
%>

<%	////////////////
	// error check
	errors = (errorGroupName || errorGroupAlreadyExists);
%>

<%	////////////////////
	// set error messages
	if( errors ) {
		if( errorGroupName ) {
			errorMessage = "Please specify a group name.";
		}
		else if( errorGroupAlreadyExists ) {
			errorMessage = "This group already exists, please choose "
				+ "a different name";
		}
		else {
			errorMessage = "A general error occured while creating a group.";
		}
	}
%>

<%	//////////////////////////////////////////////////////////////////////
	// if a user was successfully created, say so and return (to stop the 
	// jsp from executing
	if( !errors ) {
		response.sendRedirect(
			response.encodeRedirectURL("groups.jsp?msg=Group was created successfully!")
		);
		return;
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
	String[] pageTitleInfo = { "Groups : Create Group" };
%>
<%	///////////////////
	// pageTitle include
%><%@ include file="include/pageTitle.jsp" %>

<p>

<span class="errorText">
	<%= doCreate?errorMessage:"" %>
</span>

<p>

<font size="-1">
This creates a group with no permissions, no admins, and no users. Once you create
this group, you should edit its properties.
</font>

<p>

<%-- form --%>
<form action="createGroup.jsp" method="post" name="f">
<input type="hidden" name="doCreate" value="true">

<b>New Group Information:</b>
<p>

<table bgcolor="#999999" cellspacing="0" cellpadding="0" border="0" width="95%" align="right">
<td>
<table bgcolor="#999999" cellspacing="1" cellpadding="3" border="0" width="100%">

<%-- name row --%>
<tr bgcolor="#ffffff">
	<td><font size="-1">Group Name:</i></font></td>
	<td><input type="text" name="groupName" size="30" maxlength="100"
		 value="<%= (groupName!=null)?groupName:"" %>">
	</td>	
</tr>

<%-- description row --%>
<tr bgcolor="#ffffff">
	<td><font size="-1">Group Description:<br>(optional)</i></font></td>
	<td>
		<textarea name="groupDescription" wrap="virtual" cols="40" rows="5"
 		><%= (groupDescription!=null)?groupDescription:"" %></textarea>
	</td>	
</tr>

</table>
</td>
</table>
<br clear="all"><br>

<script language="JavaScript" type="text/javascript">
<!--
document.f.groupName.focus();
//-->
</script>

<p>

<center>
	<input type="submit" value="Create Group">
</center>

</form>
<%-- /form --%>

</body>
</html>

