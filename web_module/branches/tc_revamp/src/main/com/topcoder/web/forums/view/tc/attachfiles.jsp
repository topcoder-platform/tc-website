<%@ page import="com.jivesoftware.forum.Attachment,
                 com.jivesoftware.forum.AttachmentManager,
                 com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.forum.ForumThread,
                 com.jivesoftware.forum.database.DbAttachmentManager,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.HashMap,
                 java.util.Iterator"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumMessage message = (ForumMessage)request.getAttribute("message");
    ForumThread thread = (ForumThread)request.getAttribute("thread");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    AttachmentManager attachManager = forumFactory.getAttachmentManager(); 
    String pageTitle = postMode.equals("Edit") ? "Edit Attachments" : "Attach Files"; %>

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
                <jsp:param name="title" value="<%=pageTitle%>"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
       <td class="categoriesBox" style="padding-right: 20px;">
          <jsp:include page="categoriesHeader.jsp" />
       </td>
       <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
           <jsp:include page="searchHeader.jsp" />
       </td>
    </tr>
    
    <tr>
        <td colspan="2" style="padding-bottom:3px;"><b>
            <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A> <img src="/i/interface/exp_w.gif" align="absmiddle"/>
            </tc-webtag:iterator>
            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
            <%    if (thread != null) { %>
                <img src="/i/interface/exp_w.gif" align="absmiddle"/> <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtbcLink"><%=thread.getName()%></A>
            <%    } %>
            <%    if (message.getID() > 0) { %>
                <img src="/i/interface/exp_w.gif" align="absmiddle"/> <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink"><%=message.getSubject()%></A>
            <%    } else if (message.getSubject().trim().equals("")) { %>
                <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=pageTitle%>
            <%    } else { %>
                <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=message.getSubject()%>
            <%    } %>
        </b></td>
       <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
    </tr>
</table>

<br>

<b>Use the form below to attach files to this message. 
Maximum file size: <%=ForumsUtil.getFileSizeStr(attachManager.getMaxAttachmentSize()*1024)%>.</b>

<%  if (errors.get(ForumConstants.ATTACHMENT_ERROR) != null) { %>
    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ATTACHMENT_ERROR%>"><%=err%><br/></tc-webtag:errorIterator></span>
<%     } %>

<form name="form1" method="post" enctype="multipart/form-data" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.TEMP_MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_SUBJECT%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_BODY%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.ATTACHMENT_ID%>"/>

<table cellpadding="3" cellspacing="0" border="0">

<%  String removeProcessor = postMode.equals("Edit") ? "EditAttachments" : "AttachFiles";
    Iterator iter = message.getAttachments();
       int i=1;
    while (iter.hasNext()) {
        Attachment attachment = (Attachment)iter.next(); %>
        <tr>
            <td>File <%=i++%>: </td>
            <td>
                <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></A>
                <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></A> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>) [<a href="javascript:void(0)" onclick="form1.module.value='<%=removeProcessor%>';form1.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.STATUS_DELETE%>';form1.<%=ForumConstants.ATTACHMENT_ID%>.value='<%=attachment.getID()%>';form1.submit();" class="rtbcLink">remove</a>]
            </td>
        </tr>
<%  } %>

<%  for (i=message.getAttachmentCount()+1; i<=attachManager.getMaxAttachmentsPerMessage(); i++) { %>
        <tr>
            <td>File <%=i%>: </td>
            <td><input type="file" name="attachFile" size="40" id="f<%=i%>"></td>
        </tr>
<%  } %>

</table>

<br>

<%-- Attach Files & Post Message --%>
<input type="image" src="/i/interface/btn_attach_files.gif" class="rtButton" alt="Attach Files" onclick="form1.module.value='Attach'"/>

<%-- Cancel --%>
<%    if (postMode.equals("Edit")) {
        String urlNext = sessionInfo.getServletPath() + "?module=Message&" + ForumConstants.MESSAGE_ID + "=" + message.getID(); %> 
        <a href="<%=urlNext%>"><img src="/i/interface/btn_cancel.gif" class="rtButton" alt="Cancel"/></a>
<%    } else { %>
        <input type="image" src="/i/interface/btn_cancel.gif" class="rtButton" alt="Cancel" onclick="form1.module.value='Post'"/>
<%    } %>

</form>

<div style="clear:both;">&nbsp;</div>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>