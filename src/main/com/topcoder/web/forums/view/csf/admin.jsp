<%@ page import="com.topcoder.web.forums.ForumConstants"%>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%--  com.jivesoftware.base.PresenceManager presenceManager = forumFactory.getPresenceManager(); 
    Iterator itOnline = presenceManager.getOnlineUsers(); --%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csfforums"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">


        <jsp:include page="top.jsp"/>


        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="forums"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <table cellpadding="0" cellspacing="0" class="rtbcTable">
                    <tr>
                        <td class="categoriesBox" style="padding-right: 20px;">
                            <jsp:include page="categoriesHeader.jsp"/>
                        </td>
                        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
                            <jsp:include page="searchHeader.jsp"/>
                        </td>
                        <td align="right" nowrap="nowrap" valign="top">
                            <A href="?module=History" class="rtbcLink">My Post History</A> |
                            <A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-bottom:3px;"><b>
                            <a href="?module=Main" class="rtbcLink">Forums</a> > Administration
                        </b></td>
                    </tr>
                </table>

                <form name="form1" method="post" action="${sessionInfo.servletPath}">
                    <tc-webtag:hiddenInput name="module" value="Admin"/>
                    <table cellpadding="0" cellspacing="0" class="rtTable">
                        <tr>
                            <td class="rtHeader" colspan="2">Admin Console</td>
                        </tr>
                        <tr>
                            <td class="rtTextCell" nowrap="nowrap"><strong>Command:</strong></td>
                            <td class="rtTextCell100">
                                <select size="1" name="<%=ForumConstants.ADMIN_COMMAND%>">
                                    <% String[] commandNames = {"Enable ratings"};
                                        String[] commandValues = {ForumConstants.ADMIN_ENABLE_RATINGS};
                                        for (int i = 0; i < commandNames.length; i++) { %>
                                    <option value="<%=commandValues[i]%>"><%=commandNames[i]%>
                                    </option>
                                    <% } %>
                                </select>
                            </td>
                        </tr>
                        <%--
                        <tr>
                           <td class="rtTextCell" nowrap="nowrap"><strong>Online users:</strong></td>
                           <td class="rtTextCell100">
                             <%  while (itOnline.hasNext()) { %>
                                 <%  User u = (User)itOnline.next(); %>
                                 <csf:handle coderId="<%=u.getID()%>"/><%  if (itOnline.hasNext()) { %>, <% } %>
                             <%  } %>
                           </td>
                        </tr>
                        --%>
                    </table>
                    <div align="right">
                        <input type="image" src="/i/forums/update.gif" alt="Update"/>
                    </div>
                </form>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>