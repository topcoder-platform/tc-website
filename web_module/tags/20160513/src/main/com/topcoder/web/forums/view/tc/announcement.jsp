<%@ page import="com.jivesoftware.base.User,
                com.jivesoftware.forum.Forum,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                java.util.Calendar,
                java.util.Date,
                java.util.TimeZone" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forumCategory" name="forumCategory" type="com.jivesoftware.forum.ForumCategory" toScope="request"/>
<tc-webtag:useBean id="announcement" name="announcement" type="com.jivesoftware.forum.Announcement" toScope="request"/>

<%  Forum forum = (Forum)request.getAttribute("forum");
    User user = (User)request.getAttribute("user"); 
    
    String level2val = "";
    if (forumCategory != null) {
        level2val = forumCategory.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME);
    }   %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="Announcement"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
       <jsp:include page="searchHeader.jsp" />
   </td>
   <td align="right" nowrap="nowrap" valign="top">   
       <A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
   </td>
</tr>
<tr><td colspan="3" style="padding-bottom:3px;"><b>
   <%   if (ForumsUtil.canAnnounce(forum)) { %>
   <div style="float:right;white-space: nowrap;">
        <%  Date now = Calendar.getInstance(TimeZone.getTimeZone("EST")).getTime();
            if (announcement.getEndDate() == null || announcement.getEndDate().after(now)) { %> 
            <A href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>&<%=ForumConstants.ANNOUNCEMENT_COMMAND%>=Expire" class="rtbcLink">Expire</A>&#160; |
        <%  } else { %>
            <A href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>&<%=ForumConstants.ANNOUNCEMENT_COMMAND%>=Activate" class="rtbcLink">Activate</A>&#160; |
        <%  } %> 
        &#160;<A href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>&<%=ForumConstants.ANNOUNCEMENT_COMMAND%>=Delete" class="rtbcLink">Delete</A><br/>   
   </div>
   <%   } %> 
    <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A> <img src="/i/interface/exp_w.gif" align="absmiddle"/>  
    </tc-webtag:iterator>
     <%  if (forum != null) { %>
         <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A> <img src="/i/interface/exp_w.gif" align="absmiddle"/> 
     <%  } %>
     <img src="/i/interface/announcement.gif" alt="" border="0" /> <%=announcement.getSubject()%>
   </td>
</tr>
</table>

<%-------------POSTS---------------%>
<table cellpadding="0" cellspacing="0" class="rtTable rtTablePost">
   <tr>
      <td class="rtHeader" colspan="2">
         <div style="float: right; padding-left: 5px; white-space: nowrap;">
            <a name=<%=announcement.getID()%>><tc-webtag:format object="${announcement.startDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/> 
         </div>
         <%=announcement.getSubject()%></a>
         <%  if (announcement.getUser() != null && announcement.getUser().equals(user)) { %>
             | <A href="?module=PostAnnounce&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>" class="rtbcLink">Edit</A>
         <%  } %>
      </td>
   </tr>
   <tr>
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
            <%  if (ForumsUtil.displayMemberPhoto(user, announcement.getUser())) { %>
                <img src="<%=announcement.getUser().getProperty("imagePath")%>" width="61" height="61" border="0" class="rtPhoto" /><br/>
            <%  } %>
             <span class="bodyText"><%if (announcement.getUser() != null) {%><tc-webtag:handle coderId="<%=announcement.getUser().getID()%>"/><%}%></span><br/><%if (announcement.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=announcement.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(announcement.getUser()), "post")%></A><%}%>
         </div>
      </td>
      <td class="rtTextCell" width="100%"><%=announcement.getBody()%>
      </td>
   </tr>
</table>
<%-------------POSTS END---------------%>

<div style="clear:both;">&nbsp;</div>

        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
