<%@ page import="com.topcoder.web.common.BaseServlet,
				 com.topcoder.web.common.BaseProcessor,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager,
         		 com.jivesoftware.forum.ForumMessage,
         		 com.jivesoftware.forum.ForumThread,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumMessage message = (ForumMessage)request.getAttribute("message");
	ForumThread thread = (ForumThread)request.getAttribute("thread");
	HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY); %>

<script type="text/javascript">
function noenter(e)
{
    var k = (window.event)? event.keyCode: e.which;
    return !(k == 13);
}

function toggle(targetId)
{
    target = document.getElementById(targetId);
    if (target.style.display == "none") {
        target.style.display="";
    } else {
        target.style.display="none";
    }
}

// IE only
function AllowTabCharacter() {
    if (event != null) {
        if (event.srcElement) {
            if (event.srcElement.value) {
                if (event.keyCode == 9) {  // tab character
                    if (document.selection != null) {
                        document.selection.createRange().text = '\t';
                        event.returnValue = false;
                    } else {
                        event.srcElement.value += '\t';
                        return false;
                    }
                }
            }
        }
    }
}
</script>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top_forums.jsp" >
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
<%  String postHeading = "";
	String postDesc = "";

	if (postMode.equals("New")) {
		postHeading = "New Thread";
		postDesc = "Create a new thread";
	} else if (postMode.equals("Reply")) {
		String replySubject = message.getSubject();
		if (!replySubject.startsWith("Re: ")) {
        	replySubject = "Re: " + replySubject;
        }
		postHeading = replySubject;
		postDesc = "Reply";
	} else if (postMode.equals("Edit")) {
		String editSubject = message.getSubject();
		if (!editSubject.startsWith("Edit: ")) {
        	editSubject = "Edit: " + editSubject;
        }
		postHeading = editSubject;
		postDesc = "Edit message";
	} %>

        <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="<%=postDesc%>"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
	<tr>
	    <td class="rtbc"><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</A> >>
			<A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A>
				<%	if (thread != null) { %>
					>> <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="thread" property="name"/></A>
				<%	} %>
				>> <%=postHeading%>
	    </td>
	    <td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>
	</tr>
</table>
<br><div id="Options" style="display: none">Allowed tags: &lt;annot&gt;, &lt;a&gt;, &lt;abbr&gt;, &lt;acronym&gt;, &lt;blockquote&gt;, &lt;b&gt;, &lt;br&gt;, &lt;div&gt;, &lt;em&gt;, &lt;font&gt;, &lt;i&gt;, &lt;img&gt;, &lt;li&gt;, &lt;ol&gt;, &lt;p&gt;, &lt;s&gt;, &lt;span&gt;, &lt;strike&gt;, &lt;sub&gt;, &lt;sup&gt;, &lt;strong&gt;, &lt;tt&gt;, &lt;u&gt;, &lt;ul&gt;. Syntax highlighting is applied to text within [code][/code] blocks.</div>

<table cellpadding="0" cellspacing="0" class="rtTable">
<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

<tr><td class="rtHeader" colspan="2"><%=postHeading%></td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
<%  if (user.getProperty("imagePath") != null) { %>
	<img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
<%  } %>
<span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=forumFactory.getUserMessageCount(user)%> posts</A></div></td>
<td class="rtTextCell100">
<%  if (errors.get(ForumConstants.MESSAGE_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%></tc-webtag:errorIterator><br/></span><% } %>
<b>Subject:</b><br/><tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>" onKeyPress="return noenter(event)"/><br/><br/>
<%  if (errors.get(ForumConstants.MESSAGE_BODY) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_BODY%>"><%=err%></tc-webtag:errorIterator><br/></span><% } %>
<b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none"><br/>Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
<br/><tc-webtag:textArea rows="15" cols="72" name="<%=ForumConstants.MESSAGE_BODY%>" onKeyDown="AllowTabCharacter()"/>
</td>
</tr>
<tr><td class="rtFooter"><input type="image" src="/i/roundTables/post.gif" class="rtButton" alt="Post" onclick="form1.module.value='PostMessage'"/><input type="image" src="/i/roundTables/preview.gif" class="rtButton" alt="Preview" onclick="form1.module.value='PreviewMessage'"/></td></tr>
</form>
</table>

<%  if (postMode.equals("Edit") || postMode.equals("Reply")) { %>
        <span class="bodySubtitle">Original Message</span><br/>
        <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr><td class="rtHeader" colspan="2"><a name=<jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="message" property="subject"/>
        <%  if (message.getParentMessage() != null) { %>
            (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>)
        <%  } %>
        </a></td></tr>
        <tr>
        <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
        <%  if (message.getUser().getProperty("imagePath") != null) { %>
            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
        <%  } %>
        <span class="bodyText"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%> posts</A></div></td>
        <td class="rtTextCell100"><jsp:getProperty name="message" property="body"/></td>
        </tr>
        </table>
<%  } %>
<font color="red"><div align="left" id="Warning" style="display: none">Warning: one or more &lt;pre&gt; tags is not closed.</div></font>

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
