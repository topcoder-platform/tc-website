<%@ page import="com.topcoder.web.forums.ForumConstants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%--  com.jivesoftware.base.PresenceManager presenceManager = forumFactory.getPresenceManager(); 
    Iterator itOnline = presenceManager.getOnlineUsers(); --%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>TopCoder Studio</title>

	<jsp:include page="style.jsp">
    	<jsp:param name="key" value="tc_studio_forums"/>
	</jsp:include>
	
	<script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
	<script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
		<jsp:include page="top.jsp">
            <jsp:param name="section" value="forums" />
        </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="wrapper">
            	<div id="content">
                	<div class="contentTop">
                	<h1>Forums</h1>
                	<div class="contentMiddle forums">

					<table cellpadding="0" cellspacing="0" class="rtbcTable">
					   <tr>
						  <td class="categoriesBox" style="padding-right: 20px;">
							 <jsp:include page="categoriesHeader.jsp" />
						  </td>
						  <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
							 <jsp:include page="searchHeader.jsp" />
						   </td>
						   <td align="right" nowrap="nowrap" valign="top">
							   <a href="?module=History" class="rtbcLink">My Post History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User Settings</a><br />
						   </td>
					   </tr>
					   <tr>
						  <td colspan="3" style="padding-bottom:3px;"><b>
							<a href="?module=Main" class="rtbcLink">Forums</a> > Administration
						  </b></td>
					   </tr>
					</table>

					<form name="form1" method="post" action="${sessionInfo.servletPath}">
					<tc-webtag:hiddenInput name="module" value="Admin"/>
					<table cellpadding="0" cellspacing="0" class="rtTable">
					   <tr>
						  <td class="rtHeader" colspan="2">Admin Console</td>
					   </tr>
					   <tr>
						  <td class="rtTextCell" nowrap="nowrap"><strong>Command:</strong></td>
						  <td class="rtTextCell100">
							<select size="1" name="<%=ForumConstants.ADMIN_COMMAND%>">
							<%  String[] commandNames = { "Enable ratings" };
								String[] commandValues = { ForumConstants.ADMIN_ENABLE_RATINGS };
								for (int i=0; i<commandNames.length; i++) { %>
									<option value="<%=commandValues[i]%>"><%=commandNames[i]%></option>
							<%  } %>
							</select>
						  </td>
					   </tr>
					   <%--
					   <tr>
						  <td class="rtTextCell" nowrap="nowrap"><strong>Online users:</strong></td>
						  <td class="rtTextCell100">
							<%  while (itOnline.hasNext()) { %>
								<%  User u = (User)itOnline.next(); %>
								<studio:handle coderId="<%=u.getID()%>"/><%  if (itOnline.hasNext()) { %>, <% } %>
							<%  } %>
						  </td>
					   </tr>
					   --%>
					</table>
					<div align="right">
					<input type="image" src="/i/v2/interface/btnUpdate.png" alt="Update" />
					</div></form>
            

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>