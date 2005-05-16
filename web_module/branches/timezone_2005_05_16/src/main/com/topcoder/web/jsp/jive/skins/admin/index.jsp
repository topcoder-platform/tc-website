
<%--
/**
 * /skins/admin/index.jsp
 * 8/26/2000
 */
--%>

<%@ page 
	import="java.io.*,
            java.util.*,
            com.coolservlets.forum.*,
            com.coolservlets.forum.util.*,
	        com.coolservlets.forum.util.tree.*,
	        com.coolservlets.forum.util.admin.*" %>
	
<jsp:useBean id="adminBean" scope="session"
 class="com.coolservlets.forum.util.admin.AdminBean"/>

<% try { %>
		
<%	//////////////////////////////
	// Jive installation check
	
	// Check for the existence of the property "setup" in the 
	// jive.properties file. This is managed by the PropertyManager class.
	// This property tells us if the admin tool is being run for the first time.
	
	boolean setupError = false;
	String installed = null;
	try {
		installed = PropertyManager.getProperty("setup");
		if( installed == null || installed.equals("") ) {
			// the "installed" property doesn't exist or isn't set
			response.sendRedirect("setup/setup.jsp");
			return;
		}
		else if( !installed.equals("true") ) {
			setupError = true;
		}
	}
	catch( Exception e ) {
		// signal an error. the file jive.properties might not exist.
		setupError = true;
	}
	
	// print out a setup error:
	if( setupError ) { %>
		<html>
		<head>
		<title>Jive Administration - Beta</title>
		<link rel="stylesheet" type="text/css" href="style/global.css">
		</head>
		<body>
		Setup Error! Make sure your <b>jive.properties</b> file is in
		your app server's classpath.
		</body>
		</html>
<%		// for some reason, we have to call flush.. some app servers won't
		// display the above html w/o flushing the stream
		out.flush();
		return;
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

<%	////////////////////////
	// get parameters
	boolean logout = ParamUtils.getBooleanParameter(request,"logout");
%>

<%	/////////////////////////
	// logout if requested:
	if( logout ) {
		try {
			session.invalidate();
			adminBean.resetAuthToken();
		}
		catch( IllegalStateException ignored ) { // if session is already invalid
		}
		finally {
			response.sendRedirect( "index.jsp" );
			return;
		}
	}
%>


<%	///////////////////////////////////////
	// Get the permissions for this user:
	boolean isSystemAdmin = true;
	boolean isForumAdmin  = true;
	boolean isGroupAdmin  = true;
%>

<%	//////////////////////////////////////////////////////////////////
	// set the menu trees in the bean based on the user's permissions
	
	// system tree
	if( isSystemAdmin || isGroupAdmin ) {
		com.coolservlets.forum.util.tree.Tree systemTree 
			= new com.coolservlets.forum.util.tree.Tree("system");
		int nodeID = 0;
		TreeNode node = null;
		
		if( isSystemAdmin ) {
			node = new TreeNode( nodeID++, "System Settings" );
			//node.addChild( new TreeLeaf("Cache Settings", "cache.jsp") );
			node.addChild( new TreeLeaf("Database Info", "dbInfo.jsp") );
			node.addChild( new TreeLeaf("Search Settings", "searchSettings.jsp") );
			node.setVisible(true);
			systemTree.addChild(node);
		}
		
		if( isSystemAdmin ) {
			node = new TreeNode( nodeID++, "Users" );
			node.addChild( new TreeLeaf("User Summary", "users.jsp") );
			//node.addChild( new TreeLeaf("System Admins", "systemAdmins.jsp") );
			node.addChild( new TreeLeaf("Passwords", "password.jsp") );
			node.addChild( new TreeLeaf("Create User", "createUser.jsp") );
			//node.addChild( new TreeLeaf("Edit User",   "editUser.jsp") );
			node.addChild( new TreeLeaf("Remove User", "removeUser.jsp") );
			node.setVisible(true);
			systemTree.addChild(node);
		}
		
		if( isSystemAdmin || isGroupAdmin ) {
			node = new TreeNode( nodeID++, "Groups" );
			node.addChild( new TreeLeaf("Group Summary", "groups.jsp") );
			if( isSystemAdmin ) {
				node.addChild( new TreeLeaf("Create Group", "createGroup.jsp") );
			}
			node.addChild( new TreeLeaf("Edit Group",   "editGroup.jsp") );
			node.addChild( new TreeLeaf("Remove Group", "removeGroup.jsp") );
			node.setVisible(true);
			systemTree.addChild(node);
		}
		
		if( systemTree.size() > 0 ) {
			adminBean.addTree( "systemTree", systemTree );
		}
	}
	
	// forum tree
	if( isSystemAdmin ) {
		com.coolservlets.forum.util.tree.Tree forumTree 
			= new com.coolservlets.forum.util.tree.Tree("forum");
		int nodeID = 0;
		TreeNode node = null;
		
		node = new TreeNode( nodeID++, "Forums" );
		node.addChild( new TreeLeaf("Summary",     "forums.jsp") );
		node.addChild( new TreeLeaf("Create",      "createForum.jsp") );
		node.addChild( new TreeLeaf("Edit Properties", "editForum.jsp") );
		node.addChild( new TreeLeaf("Remove",      "removeForum.jsp") );
		node.addChild( new TreeLeaf("Filters",     "forumFilters.jsp") );
		node.addChild( new TreeLeaf("Content",     "forumContent.jsp") );
		node.setVisible(true);
		forumTree.addChild(node);
		
		adminBean.addTree( "forumTree", forumTree );
	}
%>

<html>
<head>
<title>Jive Administration</title>
</head>

<frameset rows="85,*" bordercolor="#0099cc" border="0" frameborder="0" framespacing="0" style="background-color:#0099cc">
	<frame src="header.jsp" name="header" scrolling="no" marginheight="0" marginwidth="0" noresize>
	<%--frame src="toolbar.jsp" name="toolbar" scrolling="no" noresize--%>
	<frameset cols="175,*" bordercolor="#0099cc" border="0" frameborder="0" style="background-color:#0099cc">
		<frame src="sidebar.jsp" name="sidebar" scrolling="auto" marginheight="0" marginwidth="0" noresize>	   
		<frameset rows="15,*" bordercolor="#0099cc" border="0" frameborder="0" style="background-color:#0099cc">
			<frame src="shadow.html" name="shadow" scrolling="no" marginheight="0" marginwidth="0" noresize>	   
			<frame src="main.jsp" name="main" scrolling="auto" noresize>
		</frameset>
		
	</frameset>
	
</frameset>

</html>

<% } catch( Exception e ) {
		System.err.println(e);
		e.printStackTrace();
	}
%>

