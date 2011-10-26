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
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

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
						<td colspan="3" style="padding-bottom:3px;"><b>
							<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
								<a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></a> >
							</tc-webtag:iterator>
							<a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></a>
				            <%	if (thread != null) { %>
								> <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtbcLink"><%=thread.getName()%></a>
				            <%	} %>
				            <%	if (message.getID() > 0) { %>
				            	> <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink"><%=message.getSubject()%></a>
				            <%	} else if (message.getSubject().trim().equals("")) { %>
            					> <%=pageTitle%>
				            <%	} else { %>
								> <%=message.getSubject()%>
							<%	} %>
						</b></td>
					   	<!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
					</tr>
				</table>
				
				<br />
				<p><span class="small"><b>
					Use the form below to attach files to this message. 
					Maximum file size: <%=ForumsUtil.getFileSizeStr(attachManager.getMaxAttachmentSize()*1024)%>.
				</b></span></p>
				
				<%  if (errors.get(ForumConstants.ATTACHMENT_ERROR) != null) { %>
					<span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ATTACHMENT_ERROR%>"><%=err%><br /></tc-webtag:errorIterator></span>
				<% 	} %>
				
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
					        	<a href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></a>
					        	<a href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></a> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>) [<a href="javascript:void(0)" onClick="form1.module.value='<%=removeProcessor%>';form1.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.STATUS_DELETE%>';form1.<%=ForumConstants.ATTACHMENT_ID%>.value='<%=attachment.getID()%>';form1.submit();" class="rtbcLink">remove</a>]
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
				
				<br />
				
				<%-- Attach Files & Post Message --%>
				<input type="image" src="/i/v2/interface/btnAttachFiles.png" class="rtButton" alt="Attach Files" onClick="form1.module.value='Attach'"/>
				
				<%-- Cancel --%>
				<%	if (postMode.equals("Edit")) {
						String urlNext = sessionInfo.getServletPath() + "?module=Message&" + ForumConstants.MESSAGE_ID + "=" + message.getID(); %> 
						<a href="<%=urlNext%>"><img src="/i/v2/interface/btnCancel.png" class="rtButton" alt="Cancel"/></a>
				<%	} else { %>
						<input type="image" src="/i/v2/interface/btnCancel.png" class="rtButton" alt="Cancel" onClick="form1.module.value='Post'"/>
				<%	} %>
				
				</form>
				

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>