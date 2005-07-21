<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "c_forum_message.jsp";
    String action = request.getParameter("a");
%>
<%@ page import="com.topcoder.forum.*" %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ page import="com.topcoder.dde.forum.*" %>

<%@ include file="/includes/forumUtils.jsp" %>
<%
    /////////////////////////////////////////////
    //Process actions
    /////////////////////////////////////////////

    if (action != null) {
        if (canModerate && action.equalsIgnoreCase("Delete Checked")) {
            // Collect checked posts and delete them
            Enumeration keys = request.getParameterNames();
            while (keys.hasMoreElements()) {
                String key = "" + keys.nextElement();
                String val = request.getParameter(key);
                if (key.startsWith("selPost_") && val != null) {
                    long id = Long.parseLong(key.substring(key.indexOf("_")+1, key.length()));
                    Post post = forumBean.getPost(id);
                    if (post != null) {
                        forumBean.deletePost(post);
                    }
                }
            }
        }
    }

    /////////////////////////////////////////////
    //Get List of topics and posts
    /////////////////////////////////////////////

    com.topcoder.forum.Thread thread = forumBean.getThread(threadId);
    List threads = forumBean.getThreads(thread.getTopicId());
    Iterator itr = threads.iterator();
    com.topcoder.forum.Thread prevThread = null;
    com.topcoder.forum.Thread currentThread = null;
    com.topcoder.forum.Thread nextThread = null;
    while(itr.hasNext()) {
        currentThread = (com.topcoder.forum.Thread)itr.next();
        if (currentThread.getId() == threadId) {
            if (itr.hasNext()) {
                nextThread = (com.topcoder.forum.Thread)itr.next();
            }
            break;
        }
        prevThread = currentThread;
    }
    if (prevThread != null) {
        prevThreadId = prevThread.getId();
    }
    if (nextThread != null) {
        nextThreadId = nextThread.getId();
    }

    List posts = forumBean.getPosts(threadId);
    Map postMap = new HashMap();
    itr = posts.iterator();
    while (itr.hasNext()) {
        Post post = (Post)itr.next();
        postMap.put(new Long(post.getId()), post);
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Forum for <%=forumComponent.getName()%> version <%=forumComponent.getVersionText()%> at TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />

<script language="JavaScript" src="/scripts/javascript.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/javascriptForum.js"></script>
</head>

<body class="body" marginheight="0" marginwidth="0">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp" >
                <jsp:param name="level1" value="forum"/>
                <jsp:param name="level2" value="customer"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <%@ include file="/includes/forumTitle.jsp" %>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
<!-- Column Titles begin -->
                <tr valign="top"><form name="frmForum" action="<%=page_name%>?f=<%=forumId%>&r=<%=threadId%>" method="post">
<% if (canModerate) { %>
                    <td width="1%" class="forumTitleCenter">Select</td>
                    <td width="1%" class="forumTitleCenter">Edit</td>
<% } %>
                    <td width="1%" class="forumTitleCenter">New</td>
                    <td width="52%" class="forumTitle">Messages</td>
                    <td width="17%" class="forumTitle">Attachments</td>
                    <td width="30%" class="forumTitle">Posted On</td>
                </tr>
<!-- Column Titles end -->

<!-- Column Forum Subject begins -->
                <tr valign="top">
<%  Iterator postItr = posts.iterator();
    if (postItr.hasNext()) {
        Post post = (Post)postItr.next();
        if (canModerate) {
%>
                    <td width="1%" class="forumSubjectCenter">&nbsp;</td>
                    <td width="1%" class="forumSubjectCenter"><a href="c_forum_edit_thread.jsp?f=<%=forumId%>&r=<%=threadId%>&p=<%=post.getId()%>">edit</a></td>
<%      } %>
                    <td class="forumSubjectCenter">
<%      if (post.getCreateTime()!=null && newSinceTime<post.getCreateTime().getTime()) { %>
                        <img src="/images/iconRecentPosting.gif" alt="*" width="8" height="12" border="0" />
<%      } else { %>
                        &nbsp;
<%      } %>
                    </td>
                    <td class="forumSubject"><strong><%=thread.getSubject()%></strong><br /></td>
                    <td class="forumSubject">
<%      Iterator attachItr = post.attachmentIterator();
        String linebreak = "";
        while (attachItr.hasNext()) {
            Attachment attach = (Attachment)attachItr.next();
%>
                        <%=linebreak%><a href="/forum/attachment?f=<%=forumId%>&id=<%=attach.getId()%>"><%=attach.getName()%></a>
<%          linebreak = "<br />";
        }
%>
                    &nbsp;</td>
                    <td class="forumSubject">
                        <%=dateFormat.format(post.getCreateTime())%> EST by <strong><%=post.getUsername()%></strong>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="forumSubjectMessage" colspan="<%=(canModerate) ? 6 : 4%>">
                        <%=textToHtml(post.getText())%>
                        <p class="forumReply"><a href="c_forum_edit_message.jsp?f=<%=forumId%>&r=<%=threadId%>&rp=<%=post.getId()%>">[Reply]</a></p>
                    </td>
                </tr>
<%  } %>
<!-- Column Forum Subject ends -->

<!-- Column Forum Replies begin -->
<%  while(postItr.hasNext()) {
        Post post = (Post)postItr.next();
%>
                <tr valign="top">
<%      if (canModerate) { %>
                    <td width="1%" class="forumTextCenterEven"><input type="checkbox" name="selPost_<%= post.getId() %>"></td>
                    <td width="1%" class="forumTextCenterEven"><a href="c_forum_edit_message.jsp?f=<%=forumId%>&r=<%=threadId%>&p=<%=post.getId()%>">edit</a></td>
<%      } %>
                    <td class="forumTextCenterEven">
<%      if (post.getCreateTime()!=null && newSinceTime<post.getCreateTime().getTime()) { %>
                        <img src="/images/iconRecentPosting.gif" alt="*" width="8" height="12" border="0" />
<%      } else { %>
                        &nbsp;
<%      } %>
                    </td>
                    <td class="forumThreadEven"><strong>Re: <%=thread.getSubject()%></strong><br /></td>
                    <td class="forumTextEven">
<%      Iterator attachItr = post.attachmentIterator();
        String linebreak = "";
        while (attachItr.hasNext()) {
            Attachment attach = (Attachment)attachItr.next();
%>
                        <%=linebreak%><a href="/forum/attachment?f=<%=forumId%>&id=<%=attach.getId()%>"><%=attach.getName()%></a>
<%          linebreak = "<br />";
        }
%>
                    &nbsp;</td>
                    <td class="forumTextEven">
<%      if (post.getCreateTime()!=null) { %>
                        <%=dateFormat.format(post.getCreateTime())%>&nbsp;EST by&nbsp;<strong><%=post.getUsername()%></strong>
<%      } %>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="forumMessage" colspan="<%=(canModerate) ? 6 : 4%>">
<%      if (post.getParentPostId() > 0 && post.getParentPostId() != thread.getInitialPostId()) {
            Post parent = (Post)postMap.get(new Long(post.getParentPostId()));
            if (parent != null) {
%>
                        <p><strong>In response to message posted on <%=dateFormat.format(parent.getCreateTime())%> EST by <%=parent.getUsername()%></strong></p>
<%          }
        }
%>
                        <%=textToHtml(post.getText())%>
                        <p class="forumReply"><a href="c_forum_edit_message.jsp?f=<%=forumId%>&r=<%=threadId%>&rp=<%=post.getId()%>">[Reply]</a></p>
                    </td>
                </tr>
<%  } %>

                <tr valign="top">
                    <td class="forumHeadFoot" colspan="<%=(canModerate) ? 6 : 4%>" align="center">
                        <table border="0" cellpadding="5" cellspacing="0">
                            <tr valign="middle">
<%  if (canModerate) { %>
                                <td class="adminControl"><input class="adminControlButton" type="submit" name="a" value="Delete Checked" /></td>
<%  } else { %>
                                <td class="adminControl"><img src="/images/clear.gif" alt="" width="10" height="1" border="0" /></td>
<%  } %>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td height="28"><img src="/images/taglineRecentPosting.gif" alt="* Recently posted message" width="182" height="28" border="0" /></td></tr>
            </table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 3 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</form>
</body>
</html>
