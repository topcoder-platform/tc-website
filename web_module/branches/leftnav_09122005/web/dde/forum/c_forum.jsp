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
    String page_name = "c_forum.jsp";
    String action = request.getParameter("a");
%>
<%@ page import="com.topcoder.forum.*" %>

<%@ include file="/includes/forumUtils.jsp" %>
<%
    /////////////////////////////////////////////
    //Process actions
    /////////////////////////////////////////////

    if (action != null) {
        if (canModerate && action.equalsIgnoreCase("Delete Checked")) {
            // Collect checked posts and delete them
            Enumeration keys = request.getParameterNames();
            ArrayList alThreads = new ArrayList();
            while (keys.hasMoreElements()) {
                String key = "" + keys.nextElement();
                String val = request.getParameter(key);
                if (key.startsWith("selTopic_") && val != null) {
                    long id = Long.parseLong(key.substring(key.indexOf("_")+1, key.length()));
                    Topic topic = forumBean.getTopic(id);
                    if (topic != null) {
                        forumBean.deleteTopic(topic);
                    }
                } else if (key.startsWith("selThread_") && val != null) {
                    long id = Long.parseLong(key.substring(key.indexOf("_")+1, key.length()));
                    com.topcoder.forum.Thread thread = forumBean.getThread(id);
                    if (thread != null) {
                        forumBean.deleteThread(thread);
                    }
                }
            }
        } else if (canModerate && action.equalsIgnoreCase("Create New Topic")) {
            response.sendRedirect("/forum/c_forum_edit_topic.jsp?f="+forumId);
            return;
        }
    }

    /////////////////////////////////////////////
    //Get List of topics
    /////////////////////////////////////////////

    List topics = forumBean.getTopics(forumId);
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
                <tr valign="top"><form name="frmForum" action="<%=page_name%>?f=<%=forumId%>" method="post">
<% if (canModerate) { %>
                    <td width="1%" class="forumTitleCenter">Select</td>
                    <td width="1%" class="forumTitleCenter">Edit</td>
<% } %>
                    <td width="1%" class="forumTitleCenter">New</td>
                    <td width="50%" class="forumTitle">Thread</td>
                    <td width="2%" class="forumTitleCenter">Messages</td>
                    <td width="17%" class="forumTitle">Posted by</td>
                    <td width="30%" class="forumTitle">Last Updated</td>
                </tr>
<!-- Column Titles end -->

<!-- Column Forum Threads begin -->
<%  Iterator topicItr = topics.iterator();
    while (topicItr.hasNext()) {
        Topic topic = (Topic)topicItr.next();
%>
                <tr valign="top">
<%      if (canModerate) { %>
                    <td width="1%" class="forumSubjectCenter"><input type="checkbox" name="selTopic_<%= topic.getId() %>"></td>
                    <td width="1%" class="forumSubjectCenter"><a href="c_forum_edit_topic.jsp?f=<%=forumId%>&t=<%=topic.getId()%>">edit</a></td>
<%      } %>
                    <td class="forumSubjectCenter" align="center">&nbsp;</td>
                    <td class="forumSubject" colspan="4">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr valign="top">
                                <td width="75%" class="forumText"><strong><%=topic.getName()%></strong></td>
                                <td width="25%" class="forumNewThread"><a href="c_forum_edit_thread.jsp?f=<%=forumId%>&t=<%=topic.getId()%>">[Create New Thread]</a></td>
                            </tr>
                        </table></td>
                </tr>
<%      List threads = forumBean.getThreads(topic);
        Collections.sort(threads, new Comparator() {
             public int compare (Object o1, Object o2 )  {
                 com.topcoder.forum.Thread t1 = (com.topcoder.forum.Thread)o1;
                 com.topcoder.forum.Thread t2 = (com.topcoder.forum.Thread)o2;
                 return t2.getLastPostTime().compareTo(t1.getLastPostTime());
             }
          });

        Iterator threadItr = threads.iterator();
        while (threadItr.hasNext()) {
            com.topcoder.forum.Thread thread = (com.topcoder.forum.Thread)threadItr.next();
%>
                <tr valign="top">
<%          if (canModerate) { %>
                    <td width="1%" class="forumTextCenterEven"><input type="checkbox" name="selThread_<%= thread.getId() %>"></td>
                    <td width="1%" class="forumTextCenterEven"><a href="c_forum_edit_thread.jsp?f=<%=forumId%>&r=<%=thread.getId()%>">edit</a></td>
<%          } %>
                    <td class="forumTextCenterEven">
<%          if (thread.getNumPosts()>0 && thread.getLastPostTime()!=null && newSinceTime<thread.getLastPostTime().getTime()) { %>
                        <img src="/images/iconRecentPosting.gif" alt="*" width="8" height="12" border="0" />
<%          } else { %>
                        &nbsp;
<%          } %>
                    </td>
                    <td class="forumThreadEven"><strong><a class="forumLink" href="c_forum_message.jsp?f=<%=forumId%>&r=<%=thread.getId()%>"><%=thread.getSubject()%></a></strong></td>
                    <td class="forumTextCenterEven"><%=thread.getNumPosts()%></td>
                    <td class="forumTextEven"><strong><%=thread.getInitialPostUsername()%></strong></td>
                    <td class="forumTextEven">
<%          if (thread.getNumPosts()>0 && thread.getLastPostTime()!=null) { %>
                        <%=dateFormat.format(thread.getLastPostTime())%>&nbsp;ET by&nbsp;<strong><%=thread.getLastPostUsername()%></strong>
<%          } %>
                    </td>
                </tr>
<%      } %>
<%  } %>
                <tr valign="top">
                    <td class="forumHeadFoot" colspan="<%=(canModerate) ? 7 : 5%>" align="center">
                        <table border="0" cellpadding="5" cellspacing="0">
                            <tr valign="middle">
<%  if (canModerate) { %>
                                <td class="adminControl"><input class="adminControlButton" type="submit" name="a" value="Delete Checked" /></td>
                                <td class="adminControl"><input class="adminControlButton" type="submit" name="a" value="Create New Topic" /></td>
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
