<%--
  - $RCSfile$
  - $Revision$
  - $Date$
  -
  - Copyright (C) 1999-2004 Jive Software. All rights reserved.
  -
  - This software is the proprietary information of Jive Software.  Use is subject to license terms.
--%>

<%@ page import="com.jivesoftware.util.StringUtils,
                 com.jivesoftware.forum.AttachmentManager,
                 com.jivesoftware.forum.database.DbAttachmentManager,
                 com.jivesoftware.base.action.ActionUtils,
                 java.util.Iterator,
                 java.util.List,
                 com.jivesoftware.forum.Attachment,
                 com.jivesoftware.forum.action.AttachAction,
                 com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.forum.ForumThread,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.HashMap,
                 java.util.HashSet,
                 com.topcoder.web.common.BaseProcessor"
    contentType="text/html"
    errorPage="errorPage.jsp"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistory" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumMessage parentMessage = (ForumMessage)request.getAttribute("parentMessage");
	ForumMessage tempMessage = (ForumMessage)request.getSession().getAttribute("tempMessage");
    ForumThread thread = (ForumThread)request.getAttribute("thread");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
%>

<%  // Get the action associated with this view:

    // Get commonly used objects from it:
    AttachmentManager attachManager = DbAttachmentManager.getInstance();

    // Escape the markAsQuestion parameter
    String markAsQuestion = request.getParameter("markAsQuestion");
    if (markAsQuestion != null) {
        markAsQuestion = StringUtils.escapeHTMLTags(markAsQuestion);
    }
    // Escape the ansQuestion parameter
    String ansQuestion = request.getParameter("ansQuestion");
    if (ansQuestion != null) {
        ansQuestion = StringUtils.escapeHTMLTags(ansQuestion);
    }
%>

<html>
<head>
<title>TopCoder Software Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <!--script language="JavaScript" type="text/javascript" src="utils.js"></script-->
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    
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
                <jsp:param name="title" value="File Attachments"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
       <td class="rtbc">
       <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A> > 
       </tc-webtag:iterator>
         <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A>
            <%   if (thread != null) { %>
            > <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="thread" property="name"/></A>
            <%   } %>
            > <jsp:getProperty name="message" property="subject"/>
       </td>
       <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
    </tr>
</table>

<div id="jive-attachfilepage">
<p>
<%-- Use the form below to attach files to this message. --%>
Use the form below to attach files to this message.
</p>

<span class="bigRed">
<%
if (errors.size() > 0) {
	Iterator errorIter = errors.keySet().iterator();
	while(errorIter.hasNext()) {
		String key = (String) errorIter.next();
		out.println(key + ": " + errors.get(key));
	}
}
%>
</span>
<%--
<ww:if test="hasActionErrors()">
    <p class="jive-error-text">
    <ww:iterator value="getActionErrors()">
        <ww:property /> <br />
    </ww:iterator>
    </p>
</ww:if>
--%>

<script language="JavaScript" type="text/javascript">
<!--
var clicked = false;
function isClicked() {
    if (!clicked) { clicked = true; return true; }
    return false;
}
//-->
</script>
<% HashMap actiongetFieldErrors = new HashMap(); %>
<%  for (int i=0; i < attachManager.getMaxAttachmentsPerMessage(); i++) { %>
<%      if (actiongetFieldErrors.containsKey("attachFile" + i)) { %>
<span class="jive-error-text">
        <%  List l = (List) actiongetFieldErrors.get("attachFile" + i);
            for (int j = 0; j < l.size(); j++) {
               String  error = (String) l.get(j);
        %>
                <br> <%= StringUtils.escapeHTMLTags(error) %>
        <%  } %>
</span>
    <% } %>
<%  } %>
<br><br>

<%
	long actiongetForumID = forum.getID();
	long actiongetThreadID = (tempMessage.getForumThread() != null ? tempMessage.getForumThread().getID() : -1);
	long actiongetMessageID = tempMessage.getID();
	String actionisReply = "action.isReply";
	long actiongetTid = 789;
	String actiongetSubject = tempMessage.getSubject();
	String actiongetBody = tempMessage.getBody();
	int actiongetAttachmentCount = 0;
%>

<form name="form1" method="post" enctype="multipart/form-data" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_SUBJECT%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_BODY%>"/>

<%  if (actiongetSubject != null) { %>

    <input type="hidden" name="encSubject" value="<%= StringUtils.encodeHex(actiongetSubject.getBytes()) %>">

<%  } %>

<%  if (actiongetBody != null) { %>

    <input type="hidden" name="encBody" value="<%= StringUtils.encodeHex(actiongetBody.getBytes()) %>">

<%  } %>

<table cellpadding="3" cellspacing="0" border="0">

<%  Iterator iter = new HashSet().iterator();//action.getAttachments();
    int c = 1;
    while (iter.hasNext()) {
        Attachment attachment = (Attachment) iter.next();
%>
        <tr>
        <td>
            <%-- File 1 [2, 3, 4 ...]: --%>
            attach.file_in_sequence
                param <%= c++ %>
        </td>
        <td>
            <%= attachment.getName() %>
        </td>
    </tr>
<%  } %>

<%  for (int i=actiongetAttachmentCount+1; i<=attachManager.getMaxAttachmentsPerMessage(); i++) { %>

    <tr>
        <td>
            <%-- File 1 [2, 3, 4 ...]: --%>
            File <%= i %>:
        </td>
        <td>
            <input type="file" name="attachFile" size="40" id="f<%= i %>">
        </td>
    </tr>

<%  } %>

</table>

<br>

<%-- Attach Files & Post Message --%>
<input type="image" class="rtButton" alt="Attach Files" onclick="form1.module.value='Attach'"/>

<%-- Cancel --%>
<input type="submit" name="doCancel" value="Cancel" onclick="form1.module.value='Post'">

</form>

</div>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="includes/foot.jsp" />

</body>

</html>