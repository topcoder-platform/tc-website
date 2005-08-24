<%@ page import="com.topcoder.web.common.BaseServlet,
             com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.common.StringUtils,
                java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="message" name="message" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="revisionList" name="revisionList" type="java.util.ArrayList" toScope="request"/>

<%  String threadView = (String)request.getAttribute("threadView"); %>

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
         </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="Revision History"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td valign="top">
   <span class="rtbc"><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</A> >>
        <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >> 
        <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink"><jsp:getProperty name="message" property="subject"/></A> >>
        Revision History 
        <%  if (revisionList.size() == 1) { %> 
                (1 edit) 
        <%  } else { %> 
                (<%=revisionList.size()%> edits) 
        <%  } %>
        </span><br><br>
   </td>
</tr>
</table>

<%-------------POSTS---------------%>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">
         <a name=<jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="message" property="subject"/></a>
            <%  if (message.getParentMessage() != null) { %>
               (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
            <%  } %>
         </a>
      </td>
   </tr>
   <tr>
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
            <%  if (message.getUser() != null && !("false".equals(message.getUser().getProperty("jiveDisplayMemberPhoto"))) && message.getUser().getProperty("imagePath") != null) { %>
                <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
            <%  } %>
             <span class="bodyText"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></span><br/><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%> posts</A><%}%>
         </div>
      </td>
      <td class="rtTextCell" width="100%"><jsp:getProperty name="message" property="body"/>
      </td>
   </tr>
</table>

<tc-webtag:iterator id="revision" type="com.topcoder.web.forums.model.Revision" iterator='<%=revisionList.iterator()%>'>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">
         <a name=<jsp:getProperty name="revision" property="ID"/>><tc-webtag:beanWrite name="revision" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="revision" property="subject"/></a>
            <%  if (message.getParentMessage() != null) { %>
               (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
            <%  } %>
         </a>
      </td>
   </tr>
   <tr>
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
            <%  if (message.getUser() != null && !("false".equals(message.getUser().getProperty("jiveDisplayMemberPhoto"))) && message.getUser().getProperty("imagePath") != null) { %>
                <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
            <%  } %>
            <span class="bodyText"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></span><br/><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%> posts</A><%}%>
         </div>
      </td>
      <td class="rtTextCell" width="100%"><jsp:getProperty name="revision" property="body"/>
      </td>
   </tr>
</table>
</tc-webtag:iterator>
<%-------------POSTS END---------------%>

        <p><br/></p>
        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
