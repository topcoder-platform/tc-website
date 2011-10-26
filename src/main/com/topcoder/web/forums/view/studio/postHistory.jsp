<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.action.util.Page,
                 com.topcoder.shared.util.DBMS,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.Iterator"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="historyUser" name="historyUser" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistoryLocal" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% String sortField = (String) request.getAttribute("sortField");
    String sortOrder = (String) request.getAttribute("sortOrder");

    StringBuffer linkBuffer = new StringBuffer("?module=History");
    linkBuffer.append("&").append(ForumConstants.USER_ID).append("=").append(historyUser.getID());

    StringBuffer messageLinkBuffer = new StringBuffer(linkBuffer.toString());
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    messageLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MESSAGE_SUBJECT);
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
    if (sortField.equals(String.valueOf(JiveConstants.MESSAGE_SUBJECT))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        }
    } else {  // default
        messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
    }
    if (sortField.equals(String.valueOf(JiveConstants.MODIFICATION_DATE))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        }
    } else {  // default
        dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
    }
    String messageLink = messageLinkBuffer.toString();
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }
    String link = linkBuffer.toString();
%>

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
                    <jsp:include page="categoriesHeader.jsp"/>
                </td>
                <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
                    <jsp:include page="searchHeader.jsp"/>
                </td>
                <td align="right" nowrap="nowrap" valign="top">
                    <a href="?module=History" class="rtbcLink">My Post
                        History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My
                    Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User
                    Settings</a><br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding:15px 0 3px 0;">
                    <strong><a href="?module=Main" class="rtbcLink">Forums</a> > Post History:
                        <studio:handle coderId="<%=historyUser.getID()%>"/>
                        (<%=ForumsUtil.display(forumFactory.getUserMessageCount(historyUser), "post")%>)
                    </strong>
                </td>
                <% if (paginator.getNumPages() > 1) { %>
                <td class="rtbc" width="100%" align="right" nowrap="nowrap" style="padding-bottom:3px;"><b>
                    <% if (paginator.getPreviousPage()) { %>
                    <a href="<%=link%>&<%=ForumConstants.START_IDX%>=${paginator.previousPageStart}" class="rtbcLink">
                        &lt;&lt;PREV</a>&#160;&#160;&#160;
                    <% } %> [
                    <% Page[] pages = paginator.getPages(5);
                        for (int i = 0; i < pages.length; i++) {
                    %>  <% if (pages[i] != null) { %>
                    <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
                    <span class="currentPage"><%= pages[i].getNumber() %></span>
                    <% } else { %>
                    <a href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                        <%= pages[i].getNumber() %></a>
                    <% } %>
                    <% } %>
                    <% } %> ]
                    <% if (paginator.getNextPage()) { %>
                    &#160;&#160;&#160;<a href="<%=link%>&<%=ForumConstants.START_IDX%>=${paginator.nextPageStart}" class="rtbcLink">NEXT
                    &gt;</a>
                    <% } %>
                </b>
                </td>
                <% } %>
            </tr>
        </table>

        <table cellpadding="0" cellspacing="0" class="rtTable">
            <tr>
                <td class="rtHeader" width="100%"><a href="<%=messageLink%>" class="rtbcLink">Post</a></td>
                <td class="rtHeader">Forum</td>
                <td class="rtHeader"><a href="<%=dateLink%>" class="rtbcLink">Date</a></td>
                <td class="rtHeader" align="right">Replies</td>
                <td class="rtHeader" align="right">Edits</td>
            </tr>
            <tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage"
                                iterator='<%=(Iterator)request.getAttribute("messages")%>'>
            <tr class="light">
                <td class="rtThreadCellWrap">
                    <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">
                        <jsp:getProperty name="message" property="subject"/>
                    </a>
                    <% if (message.getParentMessage() != null) { %>
                    (response to
                    <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</a><%if (message.getParentMessage().getUser() != null) {%>
                    by <studio:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>
                    (<a href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getParentMessage().getUser().getID()%>" alt="Post history for <%=message.getParentMessage().getUser().getUsername()%>" class="rtbcLink"/>history
                </a>)<%}%>)
                <% } %></td>
            <td class="rtThreadCell" nowrap="nowrap">
                <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=message.getForum().getID()%>&mc=<%=message.getForum().getMessageCount()%>" class="rtbcLink"><%=message.getForum().getName()%></a>
            </td>
            <td class="rtThreadCell" nowrap="nowrap"><strong>
                <tc-webtag:format object="${message.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></strong>
            </td>
            <td class="rtThreadCell" align="right"><%=message.getForumThread().getTreeWalker().getRecursiveChildCount(message)%></td>
            <td class="rtThreadCell" align="right">
                <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink"><%=historyBean.getEditCount(message.getID(), DBMS.FORUMS_DATASOURCE_NAME)%></a>
            </td>
        </tr>
        </tc-webtag:iterator>
    </table>



                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>