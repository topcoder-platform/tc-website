<%  response.setHeader( "Expires", "Sat, 6 May 1995 12:00:00 GMT" );
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
    response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
    response.setHeader( "Pragma", "no-cache" ); %>

<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.topcoder.web.forums.util.ImageMapper,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.Forum,
                 com.jivesoftware.forum.ForumCategory,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.WatchManager,
                 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="deepCategories" name="deepCategories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%  User user = (User)request.getAttribute("user"); 
    ResultFilter resultFilter = (ResultFilter)request.getAttribute("resultFilter"); 
    ReadTracker readTracker = forumFactory.getReadTracker(); 
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = ""; %>

<html>
<head>
<title>TopCoder Software Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<jsp:include page="/style.jsp">
<jsp:param name="key" value="tcs_forums"/>
</jsp:include>

</head>

<body>

<jsp:include page="includes/top.jsp"/>
<jsp:include page="includes/menu.jsp">
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180" class="leftColumn">
        <jsp:include page="includes/left.jsp" >
            <jsp:param name="level1" value="forum"/>
            <jsp:param name="level2" value="all"/>
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
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
        <jsp:include page="searchHeader.jsp" ></jsp:include>
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
</table>
            <%
				if (categories.size() > 0) {
                    Calendar calendar = Calendar.getInstance();
                    calendar.set(Calendar.MILLISECOND, 0);
                    calendar.set(Calendar.SECOND, 0);
                    calendar.set(Calendar.MINUTE, 0);
            %>
            <br><table cellpadding="0" cellspacing="0" class="rtTable">
				<tr>
				   <td class="rtHeader" width="100%">
						Forum
				   </td>
				   <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
				   <td class="rtHeader" align="center" colspan="2"><div style="width:300px;">Last Post</div></td>
				</tr>
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
                                    
                                       <tr>
                                          <td class="rtThreadCellWrap">
											<img src="http://software.topcoder.com/images/<%= ImageMapper.getStatusIcon(category) %>" alt="" width="25" height="17" border="0">
											<img src="http://software.topcoder.com/images/<%= ImageMapper.getTechnologyIcon(category) %>" alt="" border="0"/>
                                            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A>
                                            <% if (category.getDescription() != null) { %>
												<br/><div class="rtDescIndent"><jsp:getProperty name="category" property="description"/></div>
											<% } %>
										  </td>
                                          <td class="rtThreadCell" style="width: 80px;"><jsp:getProperty name="category" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="category" property="messageCount"/></td>
                                          <% if (category.getMessageCount() > 0) { %>
                                              <tc-webtag:useBean id="message" name="category" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                                               <td class="rtThreadCell" style="width: 190px;"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></b></td>
                                              <% if (message.getUser() != null) { %>
                                                   <td class="rtThreadCell" style="width: 100px;"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                                              <% } else { %>
                                                   <td class="rtThreadCell" style="width: 100px;"></td>
                                               <% } %>
                                           <% } else { %>
                                              <td class="rtThreadCell" style="width: 190px;"></td>
                                              <td class="rtThreadCell" style="width: 100px;"></td>
                                          <% } %>
                                      </tr>
                                
                                <%  if (!"".equals(limit)) {
                                        int limitCNT = -1;
                                        try {
                                            limitCNT = Integer.parseInt(limit);
                                        } catch (Exception e) {}
                                        if (category.getForumCount() >= limitCNT) { %>
                                            <tr><td class="rtThreadCell" colspan="4"><A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtLinkNew">...more</A></td></tr>
                                    <%  } %>
                                <%  } %>
                        
                        <%  } %>
                <%  } %>
            </tc-webtag:iterator>
            </table>
            <%  } %>
            
            <table cellpadding="0" cellspacing="0" class="rtbcTable">
                <tr>
                    <td>A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <%if (user!=null) {%><A href="?module=Main&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark all as read)</A><%}%></td>
                    <td align="right"><a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img border="none" src="http://www.topcoder.com/i/interface/btn_rss.gif"/></a></td>
                </tr>
                <!--
                <tr>
                    <td>The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.</td>
                    <td></td>
                </tr>
                -->
            </table>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="includes/foot.jsp" />

</body>

</html>