
<%
/**
 * groupPerms.jsp
 * July, 2000
 */
%>

<%@ page import="java.util.*,
                 java.net.URLEncoder,
                 com.coolservlets.forum.*,
                 com.coolservlets.forum.util.*,
				 com.coolservlets.forum.util.admin.*"%>

<jsp:useBean id="adminBean" scope="session"
 class="com.coolservlets.forum.util.admin.AdminBean"/>
 
<%!	////////////////////////
	// global page variables
	
	private final String ADD = " <- ";
	private final String REMOVE = " -> ";
%>

<%!	///////////////////
	// global methods
	
	private String getParameterMode( String paramVal ) {
		if( paramVal == null ) {
			return "";
		}
		if( paramVal.equals(ADD) ) { return "add"; }
		else if( paramVal.equals(REMOVE) ) { return "remove"; }
		else {
			return "";
		}
	}
	
	private int[] getIntListboxParams( String[] paramVal ) {
		if( paramVal == null ) { 
			return new int[0]; 
		}
		int[] params = new int[paramVal.length];
		for (int i=0;i<paramVal.length;i++)
		{
			try {
				params[i] = Integer.parseInt(paramVal[i]);
			} catch( NumberFormatException nfe ) {}
		}
		return params;
	}
%>

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
		request.setAttribute("message","No permission to administer groups");
		response.sendRedirect("error.jsp");
		return;
	}
%>

<%	////////////////////
	// get parameters
	
	int groupID = ParamUtils.getIntParameter(request,"group",-1);
	boolean doAction = ParamUtils.getBooleanParameter(request,"doAction");
	
	String groupAdminMode = getParameterMode(ParamUtils.getParameter(request,"groupAdminMode"));
	String groupUserMode  = getParameterMode(ParamUtils.getParameter(request,"groupUserMode"));
	
	int[] groupAdminsParam = getIntListboxParams(request.getParameterValues("groupAdmins"));
	int[] allAdminsParam   = getIntListboxParams(request.getParameterValues("allAdmins"));
	int[] groupUsersParam  = getIntListboxParams(request.getParameterValues("groupUsers"));
	int[] allUsersParam    = getIntListboxParams(request.getParameterValues("allUsers"));
%>

<%	/////////////////////
	// other page variables
	
	boolean addGroupAdmin = (groupAdminMode.equals("add"));
	boolean removeGroupAdmin = (groupAdminMode.equals("remove"));
	
	boolean addGroupUser = (groupUserMode.equals("add"));
	boolean removeGroupUser = (groupUserMode.equals("remove"));
%>

<%	///////////////////////
	// error variables
	
	boolean errorGroupNotFound = false;
	boolean errorNoPermission = false;
	boolean errors = false;
%>

<%	//////////////////////////////////
	// global variables
	
	ProfileManager manager = forumFactory.getProfileManager();
%>

<%	/////////////////////
	// try to load the group from the passed in group id
	Group group = null;
	try {
		group = manager.getGroup(groupID);
	}
	catch( GroupNotFoundException gnfe ) {
		response.sendRedirect("error.jsp?msg="
			+ URLEncoder.encode("Group " + groupID + " not found") );
		return;
	}
%>

<%	/////////////////////
	// this group properties
	
	String groupName = group.getName();
	String groupDescription = group.getDescription();
	int userCount = group.getUserCount();
	Iterator adminIterator = group.administrators();
	Iterator allAdmins = manager.users();
	Iterator userIterator = group.users();
	Iterator allUsers = manager.users();
%>


<%	/////////////////////////
	// do an action!
	
	if( doAction ) {
		
		// add a group administrator
		if( addGroupAdmin ) {
			for( int i=0; i<allAdminsParam.length; i++ ) {
				try {
					User admin = manager.getUser(allAdminsParam[i]);
					group.addAdministrator(admin);
				}
				catch( UserNotFoundException unfe ) {}
				catch( UnauthorizedException ue   ) {}
			}
		}
		
		// remove a group administrator
		else if( removeGroupAdmin ) {
			for( int i=0; i<groupAdminsParam.length; i++ ) {
				try {
					User admin = manager.getUser(groupAdminsParam[i]);
					group.removeAdministrator(admin);
				}
				catch( UserNotFoundException unfe ) {}
				catch( UnauthorizedException ue   ) {}
			}
		}
		
		// add a group user
		else if( addGroupUser ) {
			System.err.println( "in addgroupuser" );
			for( int i=0; i<allUsersParam.length; i++ ) {
				try {
					System.out.println( "add: " + allUsersParam[i] );
					User user = manager.getUser(allUsersParam[i]);
					group.addUser(user);
				}
				catch( UserNotFoundException unfe ) {}
				catch( UnauthorizedException ue   ) {}
			}
		}
		
		// remove a group user
		else if( removeGroupUser ) {
			System.err.println( "in removegroupuser" );
			for( int i=0; i<groupUsersParam.length; i++ ) {
				try {
					System.out.println( "remove: " + groupUsersParam[i] );
					User user = manager.getUser(groupUsersParam[i]);
					group.removeUser(user);
				}
				catch( UserNotFoundException unfe ) {}
				catch( UnauthorizedException ue   ) {}
			}
		}
	}
%>

<%	////////////////////
	// if we did something, redirect to this page again (since we're doing POSTS
	// on the form)
	
	// uncommented so i can debug parameters!!
	if( doAction ) {
		response.sendRedirect("groupPerms.jsp?group="+groupID);
		return;
	}
%>

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style/global.css">
	<script language="JavaScript" type="text/javascript">
	<!--
		function selAllListBox( el, chkbx ) {
			if( chkbx.checked ) {
				for( var i=0; i<el.options.length; i++ ) {
					el.options[i].selected = true;
				}
			}
		}
	//-->
	</script>
</head>

<body background="images/shadowBack.gif" bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

<%	///////////////////////
	// pageTitleInfo variable (used by include/pageTitle.jsp)
	String[] pageTitleInfo = { "Groups : Group Permissions" };
%>
<%	///////////////////
	// pageTitle include
%><%@ include file="include/pageTitle.jsp" %>

<p>

<b>Permissions for group:</b>
<%= groupName %>
<p>

<%---------------------- form: make this a POST!! -------------%>
<form action="groupPerms.jsp" method="get"> 
<input type="hidden" name="doAction" value="true">
<input type="hidden" name="group" value="<%= groupID %>">

<%-- member table --%>
<table bgcolor="#666666" cellpadding="0" cellspacing="0" width="80%" align="center" border="0">
<td>
<table bgcolor="#666666" cellpadding="3" cellspacing="1" width="100%" align="center" border="0">
<tr bgcolor="#eeeeee">
	<td width="<%= isSystemAdmin?"99":"100" %>%">
	Members of this group
	</td>
	<%	if( isSystemAdmin ) { %>
		<td width="1%" nowrap>
		<a href="createUser.jsp?type=user">Create New User</a>
		</td>
	<%	} %>
</tr>
<tr bgcolor="#ffffff">
	<td colspan="2">
	
	<%-- table for listboxes of members --%>
	<table cellpadding="3" cellspacing="0" border="0" width="100%">
	<tr>
		<td width="40%" align="center">
			Members of this group:
			<br>
			<select size="5" name="groupUsers" multiple>
			<%	HashMap groupUserMap = new HashMap(); %>
			<%	while( userIterator.hasNext() ) { %>
			<%		User user = (User)userIterator.next(); %>
			<%		int userID = user.getID(); %>
			<%		groupUserMap.put( ""+userID, ""+userID ); %>
				<option value="<%=user.getID()%>"><%= user.getUsername() %>
			<%	} %>
			</select>
			<br>
			(<input type="checkbox" name="" value="" id="cbusr01"
			  onclick="selAllListBox(this.form.groupUsers,this);">
			<label for="cbusr01">Select All</label>)
		</td>
		<td width="20%" align="center">
			<input type="submit" name="groupUserMode" value="<%= ADD %>">
			<p>
			<input type="submit" name="groupUserMode" value="<%= REMOVE %>">
		</td>
		<td width="40%" align="center">
			All members not in this group:
			<br>
			<select size="5" name="allUsers" multiple>
			<%	while( allUsers.hasNext() ) { %>
			<%		User user = (User)allUsers.next(); %>
			<%		String userID = ""+user.getID(); %>
			<%		if( !groupUserMap.containsKey(userID) ) { %>
						<option value="<%=user.getID()%>"><%= user.getUsername() %>
			<%		} %>
			<%	} %>
			</select>
			<br>
			(<input type="checkbox" name="" value="" id="cbusr02"
			  onclick="selAllListBox(this.form.allUsers,this);">
			<label for="cbusr02">Select All</label>)
		</td>
	</tr>
	</table>
	<%-- /table for listboxes of members --%>
	
	</td>
</tr>
</table>
</td>
</table>
<%-- /member table --%>

<p>

<%-- admin table --%>
<table bgcolor="#666666" cellpadding="0" cellspacing="0" width="80%" align="center" border="0">
<td>
<table bgcolor="#666666" cellpadding="3" cellspacing="1" width="100%" align="center" border="0">
<tr bgcolor="#eeeeee">
	<td width="<%= isSystemAdmin?"99":"100" %>%">
	Adminstrators for this group
	</td>
	<%	if( isSystemAdmin ) { %>
		<td width="1%" nowrap>
		<a href="createUser.jsp?type=admin">Create New Admin</a>
		</td>
	<%	} %>
</tr>
<tr bgcolor="#ffffff">
	<td colspan="2">
	
	<%-- table for listboxes of admins --%>
	<table cellpadding="3" cellspacing="0" border="0" width="100%">
	<tr>
		<td width="40%" align="center">
			Admins for this group:
			<br>
			<select size="5" name="groupAdmins" multiple>
			<%	HashMap groupAdminMap = new HashMap(); %>
			<%	while( adminIterator.hasNext() ) { %>
			<%		User admin = (User)adminIterator.next(); %>
			<%		int adminID = admin.getID(); %>
			<%		groupAdminMap.put( ""+adminID, ""+adminID ); %>
				<option value="<%=admin.getID()%>"><%= admin.getUsername() %>
			<%	} %>
			</select>
			<br>
			(<input type="checkbox" name="" value="" id="cbadm01"
			  onclick="selAllListBox(this.form.groupAdmins,this);">
			<label for="cbadm01">Select All</label>)
		</td>
		<td width="20%" align="center">
			<input type="submit" name="groupAdminMode" value="<%= ADD %>">
			<p>
			<input type="submit" name="groupAdminMode" value="<%= REMOVE %>">
		</td>
		<td width="40%" align="center">
			All admins not in this group:
			<br>
			<select size="5" name="allAdmins" multiple>
			<%	while( allAdmins.hasNext() ) { %>
			<%		User admin = (User)allAdmins.next(); %>
			<%		String adminID = ""+admin.getID(); %>
			<%		if( !groupAdminMap.containsKey(adminID) ) { %>
			<%			//if( admin.hasPermission(ForumPermissions.SYSTEM_ADMIN) || admin.hasPermission(ForumPermissions.GROUP_ADMIN) ) { %>
						<option value="<%=admin.getID()%>"><%= admin.getUsername() %>
			<%			//} %>
			<%		} %>
			<%	} %>
			</select>
			<br>
			(<input type="checkbox" name="" value="" id="cbadm02"
			  onclick="selAllListBox(this.form.allAdmins,this);">
			<label for="cbadm02">Select All</label>)
		</td>
	</tr>
	</table>
	<%-- /table for listboxes of admins --%>
	
	</td>
</tr>
</table>
</td>
</table>
<%-- /admin table --%>

<p>

</form>

<center>
	<form action="groups.jsp">
	<input type="submit" value="Done">
	</form>
</center>

</body>
</html>


