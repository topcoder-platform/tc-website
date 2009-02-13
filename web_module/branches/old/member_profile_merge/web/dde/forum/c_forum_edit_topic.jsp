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
	String page_name = "c_forum_edit_topic.jsp";
	String action = request.getParameter("a");
%>

<% // PAGE SPECIFIC DECLARATIONS%>
<%@ page import="com.topcoder.forum.*" %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ page import="com.topcoder.dde.forum.*" %>

<%@ include file="/includes/forumUtils.jsp" %>

<%
    if (tcUser == null) {
        session.setAttribute("nav_redirect_msg", "You must login to edit topics");
        response.sendRedirect("/login.jsp");
        return;
    }

    Topic topic = null;

    /////////////////////////////////////////////
    //Process actions
    /////////////////////////////////////////////

    debug.addMsg("EditTopic", "Processing action " + action);

    // process action
    if (action == null) {
        action = "new";
        if (topicId != 0) {
            topic = forumBean.getTopic(topicId);
        }

    } else {
        String name = request.getParameter("txtTopic");
        String desc = request.getParameter("taDescription");

        if (action.equalsIgnoreCase("create topic")) {
            com.topcoder.forum.Forum forum = forumBean.getForum(forumId);
            topic = new Topic();
            topic.setName(name);
            topic.setDescription(desc);
            Topic tmpTopic = forumBean.createTopic(forum, topic);

            debug.addMsg("EditTopic", tmpTopic.getName() + tmpTopic.getId());

            response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
            return;
        } else if (action.equalsIgnoreCase("save")) {
            topic = forumBean.getTopic(topicId);
            topic.setName(name);
            topic.setDescription(desc);
            forumBean.updateTopic(topic);
            response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
            return;
        }
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=(topic != null)?"Edit Topic":"Create New Topic"%> for the <%=forumComponent.getName()%> version <%=forumComponent.getVersionText()%> Forum at TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
<script language="JavaScript" src="/scripts/javascript.js"></script>
</head>

<body class="body" onLoad="frmTopic.txtTopic.focus()">

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

<!--Middle Column begins -->
            <table width="100%" cellpadding="0" cellspacing="1" border="0" class="forumBkgd" align="center">
                <tr valign="top">
                    <form name="frmTopic" action="<%=page_name%>" method="post">
                    <input type="hidden" name="f" value="<%=forumId%>">
                    <input type="hidden" name="t" value="<%=topicId%>">

<!-- Title-->
                    <td class="forumTitleCenter" width="100%">
                        <table cellpadding="0" cellspacing="0" border="0" align="center">
                            <tr valign="top">
                                <td class="forumText"><font color="white"><strong><%=(topic != null)?"Edit Topic":"Create New Topic"%></strong></font></td>
                            </tr>
                        </table></td>
                </tr>

<!-- Topic -->
                 <tr valign="top">
                    <td class="forumTextCenterEven" width="100%">
                        <div align="center">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr valign="top">
                                <td class="forumText">
                                    <p><strong>Topic</strong></p>
                                    <p><input class="registerForm" type="text" name="txtTopic" value ="<%=(topic==null)?"":topic.getName()%>" size="60" maxlength="100"></p>
                                    &nbsp;</td>
                            </tr>

<!-- Description -->
                            <tr valign="top">
                                <td class="forumText">
                                    <p><strong>Description</strong></p>
                                    <p><textarea class="adminControlForm" name="taDescription" rows="24" cols="90"><%=(topic == null)?"":topic.getDescription()%></textarea></p>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </div>
                        </td>
                </tr>

<%  if (topic != null) { %>
                <tr><td class="adminControl" colspan="2">
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0"><br>
                    <input class="adminControlButton" type="submit" name="a" value="Save"></input><br>
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0">
                </td></tr>
<%  } else { %>
                <tr><td class="adminControl" colspan="2">
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0"><br>
                    <input class="adminControlButton" type="submit" name="a" value="Create Topic"></input><br>
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0">
                </td></tr>
<%  } %>
            </table>

            <table width="100%" cellpadding="0" cellspacing="0" border="0" class="middle">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
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