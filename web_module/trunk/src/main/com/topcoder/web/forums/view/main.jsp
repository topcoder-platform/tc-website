<%  response.setHeader( "Expires", "Sat, 6 May 1995 12:00:00 GMT" );
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
    response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
    response.setHeader( "Pragma", "no-cache" ); %>

<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.Forum,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="deepCategories" name="deepCategories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%  User user = (User)request.getAttribute("user"); 
    ResultFilter resultFilter = (ResultFilter)request.getAttribute("resultFilter"); 
    ReadTracker readTracker = forumFactory.getReadTracker(); 
    String trackerClass = ""; %>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value="forums"/>
            <jsp:param name="level2" value=""/>
            <jsp:param name="unreadCategories" value="<%=unreadCategories%>"/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>
    
<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
    <td nowrap="nowrap" valign="top">
        <jsp:include page="searchHeader.jsp" ></jsp:include>
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
</table>

            <%  if (forumFactory.getRootForumCategory().getForumCount() > 0) { %>
            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" width="80%">Forum</td>
                    <td class="rtHeader" width="20%">T./M.</td>
                    <td class="rtHeader" align="center" colspan="2">Last Post</td>
                </tr>
                <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
                    <%  trackerClass = (user == null || forum.getMessageCount() <= 0 || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ) ? "rtLinkOld" : "rtLinkBold"; %>
                    <tr>
                        <td class="rtThreadCellWrap">
                        <%  if (user == null) { %>
                            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.MESSAGE_COUNT%>=<jsp:getProperty name="forum" property="messageCount"/>" class="rtLinkNew"><jsp:getProperty name="forum" property="name"/></A>
                        <%  } else { %>
                            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="<%=trackerClass%>"><jsp:getProperty name="forum" property="name"/></A>
                        <%  } %>
                           <% if (forum.getDescription() != null) { %><br/><div class="rtDescIndent"><jsp:getProperty name="forum" property="description"/></div><% } %></td>
                        <td class="rtThreadCell"><jsp:getProperty name="forum" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="forum" property="messageCount"/></td>
                        <% if (forum.getMessageCount() > 0) { %>
                           <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                           <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></b></td>
                            <% if (message.getUser() != null) { %>
                                <td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                            <% } else { %>
                                <td class="rtThreadCell"></td>
                            <% } %>
                        <% } else { %>
                            <td class="rtThreadCell"></td>
                            <td class="rtThreadCell"></td>
                        <% } %>
                    </tr>
                </tc-webtag:iterator>
            </table>
            <%  } %>
            
            <%  if (deepCategories.size() > 0) { %>
            <br><table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" width="80%">Category</td>
                    <td class="rtHeader" width="20%">T./M.</td>
                    <td class="rtHeader" align="center" colspan="2">Last Post</td>
                </tr>
                <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)deepCategories.iterator()%>'>
                    <%  trackerClass = (user == null || category.getMessageCount() <= 0 || readTracker.getReadStatus(user, category.getLatestMessage()) == ReadTracker.READ) ? "rtLinkOld" : "rtLinkBold"; %>
                    <tr>
                        <td class="rtThreadCellWrap">
                        <%  if (user == null) { %>
                            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>&<%=ForumConstants.MESSAGE_COUNT%>=<jsp:getProperty name="category" property="messageCount"/>" class="rtLinkNew"><jsp:getProperty name="category" property="name"/></A>
                        <%  } else { %>
                            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="<%=trackerClass%>"><jsp:getProperty name="category" property="name"/></A>
                        <%  } %>
                            <% if (category.getDescription() != null) { %><br/><div class="rtDescIndent"><jsp:getProperty name="category" property="description"/></div><% } %></td>
                        <td class="rtThreadCell"><jsp:getProperty name="category" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="category" property="messageCount"/></td>
                        <% if (category.getMessageCount() > 0) { %>
                            <tc-webtag:useBean id="message" name="category" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                            <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></b></td>
                            <% if (message.getUser() != null) { %>
                                <td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                            <% } else { %>
                                <td class="rtThreadCell"></td>
                            <% } %>
                        <% } else { %>
                            <td class="rtThreadCell"></td>
                            <td class="rtThreadCell"></td>
                        <% } %>
                    </tr>
                </tc-webtag:iterator>
            </table>
            <%  } %>

            <%  if (categories.size() > 0) { 
                    Calendar calendar = Calendar.getInstance(); 
                    calendar.set(Calendar.MILLISECOND, 0);
                    calendar.set(Calendar.SECOND, 0);
                    calendar.set(Calendar.MINUTE, 0);
                    %>
            <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)categories.iterator()%>'>
            <%  String limit = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_DISPLAY_LIMIT));
                if (!"0".equals(limit)) { %>
                    <%  Iterator itForums = null, itForumsCopy = null;
                        int numActiveForums = 0;
                        if (!"".equals(limit)) { 
                            if (limit.endsWith("d")) {
                                int numDays = Integer.parseInt(limit.substring(0, limit.length()-1));
                                calendar.add(Calendar.DATE, numDays*-1);
                                resultFilter.setModificationDateRangeMin(calendar.getTime());
                                calendar.add(Calendar.DATE, numDays);
                                resultFilter.setNumResults(ForumConstants.MAX_DISPLAYED_FORUMS_PER_CATEGORY);
                                itForums = category.getForums(resultFilter); itForumsCopy = category.getForums(resultFilter);
                            } else {
                                //resultFilter.setNumResults(Integer.parseInt(category.getProperty("displayLimit")));
                                ArrayList forumsList = ForumsUtil.getForums(category, resultFilter, true);
                                ArrayList pageList = ForumsUtil.getForumsPage(forumsList, 0, Integer.parseInt(category.getProperty("displayLimit")));
                                itForums = pageList.iterator(); itForumsCopy = pageList.iterator();               
                            }
                        } else { 
                            resultFilter.setNumResults(ResultFilter.NULL_INT);
                            itForums = category.getForums(resultFilter); itForumsCopy = category.getForums(resultFilter);
                        }
                        while (itForums.hasNext()) {
                            if (((Forum)itForums.next()).getMessageCount() > 0) numActiveForums++;
                        }
                        if (numActiveForums > 0) { %>
				            <br><table cellpadding="0" cellspacing="0" class="rtTable">
				                    <tr>
				                       <td class="rtHeader" width="80%">
				                            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A>
				                       </td>
				                       <td class="rtHeader" width="20%">T./M.</td>
				                       <td class="rtHeader" align="center" colspan="2">Last Post</td>
				                    </tr>
				                    <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForumsCopy%>'>
				                        <%  trackerClass = (user == null || forum.getMessageCount() <= 0 || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ) ? "rtLinkOld" : "rtLinkBold"; %>
				                        <%  if (forum.getMessageCount() > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
					                        <tr>
					                           <td class="rtThreadCellWrap">
					                                <%  if (user == null) { %>
					                                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.MESSAGE_COUNT%>=<jsp:getProperty name="forum" property="messageCount"/>" class="rtLinkNew"><jsp:getProperty name="forum" property="name"/></A>
					                                <%  } else { %>
					                                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="<%=trackerClass%>"><jsp:getProperty name="forum" property="name"/></A>
					                                <%  } %>
					                                <% if (forum.getDescription() != null) { %><br/><div class="rtDescIndent"><jsp:getProperty name="forum" property="description"/></div><% } %></td>
					                           <td class="rtThreadCell"><jsp:getProperty name="forum" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="forum" property="messageCount"/></td>
					                           <% if (forum.getMessageCount() > 0) { %>
					                               <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
					                                <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></b></td>
					                               <% if (message.getUser() != null) { %>
					                                    <td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
					                               <% } else { %>
					                                    <td class="rtThreadCell"></td>
					                                <% } %>
					                            <% } else { %>
					                               <td class="rtThreadCell"></td>
					                               <td class="rtThreadCell"></td>
					                           <% } %>
					                       </tr>
				                       <%  } %>
				                    </tc-webtag:iterator>
				            </table>
                        <%  } %>
                <%  } %>
            </tc-webtag:iterator>
            <%  } %>
            
            <table cellpadding="0" cellspacing="0" class="rtbcTable">
                <tr>
                    <td>A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.</td>
                    <td align="right"><a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img border="none" src="http://www.topcoder.com/i/interface/btn_rss.gif"/></a></td>
                </tr>
                <tr>
                    <td>The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.</td>
                    <td></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>