
<%
/**
 * forumContent.jsp
 * July, 2000
 */
%>

<%@ page import="java.util.*,
                 java.text.SimpleDateFormat,
                 com.coolservlets.forum.*,
                 com.coolservlets.forum.util.*,
				 com.coolservlets.forum.util.admin.*"%>

<jsp:useBean id="adminBean" scope="session"
 class="com.coolservlets.forum.util.admin.AdminBean"/>

<%!	//////////////////////////
	// global vars
	
	// date formatter for message dates
	private final SimpleDateFormat dateFormatter
		= new SimpleDateFormat( "EEE, MMM d 'at' hh:mm:ss z" );
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
	boolean deleteThread = ParamUtils.getBooleanParameter(request,"deleteThread");
	int threadID = ParamUtils.getIntParameter(request,"thread",-1);
%>
 
<%	//////////////////////////////////
	// global error variables
	
	String errorMessage = "";
	
	boolean noForumSpecified = (forumID < 0);
	boolean noThreadSpecified = (threadID < 0);
%>

<%	////////////////////
	// make a profile manager
	ProfileManager manager = forumFactory.getProfileManager();
%>

<%	/////////////////////
	// delete a thread
	if( !noForumSpecified && !noThreadSpecified ) {
		try {
			Forum tempForum = forumFactory.getForum(forumID);
			ForumThread tempThread = tempForum.getThread(threadID);
			tempForum.deleteThread(tempThread);
		}
		catch( ForumNotFoundException fnfe ) {
		}
		catch( ForumThreadNotFoundException ftnfe ) {
		}
		catch( UnauthorizedException ue ) {
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
	String[] pageTitleInfo = { "Forums : Manage Forum Content" };
%>
<%	///////////////////
	// pageTitle include
%><%@ include file="include/pageTitle.jsp" %>

<p>

<%	//////////////////////
	// show the name of the forum we're working with (if one was selected)
	Forum currentForum = null;
	if( !noForumSpecified ) {
		try {
			currentForum = forumFactory.getForum(forumID);
	%>
			You're currently working with forum: <b><%= currentForum.getName() %></b>
	<%	}
		catch( ForumNotFoundException fnfe ) {
	%>
			<span class="errorText">Forum not found.</span>
	<%	}
		catch( UnauthorizedException ue ) {
	%>
			<span class="errorText">Not authorized to administer this forum.</span>
	<%	}
	}
%>

<p>

<%	///////////////////////
	// show a pulldown box of forums where this user can manage content:
	Iterator forumIterator = forumFactory.forums();
	if( !forumIterator.hasNext() ) {
%>
		No forums!
<%	}
%>

<p>

<form>
	<select size="1" name="" onchange="location.href='forumContent.jsp?forum='+this.options[this.selectedIndex].value;">
	<option value="-1">Manage content for:
	<option value="-1">---------------------
<%	while( forumIterator.hasNext() ) {
		Forum forum = (Forum)forumIterator.next();
%>
		<option value="<%= forum.getID() %>"><%= forum.getName() %>
<%	}
%>
	</select>
</form>

<%	if( noForumSpecified ) {
		out.flush();
		return;
	}
%>
	
<p>

<%-- thread table --%>

<table bgcolor="#cccccc" cellpadding=0 cellspacing=0 border=0 width="100%">
<td>
<table bgcolor="#cccccc" cellpadding=3 cellspacing=1 border=0 width="100%">
<tr bgcolor="#dddddd">
	<td class="forumListHeader" width="1%" nowrap bgcolor="#cccccc"><b>delete<br>thread?</b></td>
	<td class="forumListHeader" width="96%">subject</td>
	<td class="forumListHeader" width="1%" nowrap>replies</td>
	<td class="forumListHeader" width="1%" nowrap>posted by</td>
	<td class="forumListHeader" width="1%" nowrap>date</td>
</tr>

<%	/////////////////////
	// get an iterator of threads
	Iterator threadIterator = currentForum.threads();
	
	if( !threadIterator.hasNext() ) {
%>
	
	<tr bgcolor="#ffffff">
		<td colspan="5" align="center" class="forumListCell">
		<br><i>No messages in this forum.</i><br><br>
		</td>
	</tr>
	
<%	}
	try {
	while( threadIterator.hasNext() ) {
		ForumThread currentThread = (ForumThread)threadIterator.next();
		int currentThreadID = currentThread.getID();
		ForumMessage rootMessage = currentThread.getRootMessage();
		boolean rootMsgIsAnonymous = rootMessage.isAnonymous();
		User rootMessageUser = rootMessage.getUser();
		String username = rootMessageUser.getUsername();
		String name = rootMessageUser.getName();
		String email = rootMessageUser.getEmail();
%>
	<tr>
		<td width="1%" class="forumListCell" align="center">
			<input type="radio"
			 onclick="if(confirm('Are you sure you want to delete this thread and all its messages?')){location.href='forumContent.jsp?forum=<%=forumID%>&deleteThread=true&thread=<%=currentThreadID%>';}">
		</td>
		<td class="forumListCell" width="96%">
			<%= currentThread.getName() %>
		</td>
		<td class="forumListCell" width="1%" nowrap align="center">
			<%= currentThread.getMessageCount()-1 %>
		</td>
		<td class="forumListCell" width="1%" nowrap align="center">
		<%	if( rootMsgIsAnonymous ) { %>
			<i>Anonymous</i>
		<%	} else { %>
			<a href="mailto:<%=email%>" title="<%= name %>"><%= username %></a>
		<%	} %>
		</td>
		<td class="forumListDateCell" width="1%" nowrap>
			<%= dateFormatter.format(rootMessage.getCreationDate()) %>
		</td>
	</tr>

<%	}
	} catch( Exception e ) {
	}
%>

</table>
</td>
</table>

<%-- /thread table --%>


</body>
</html>

