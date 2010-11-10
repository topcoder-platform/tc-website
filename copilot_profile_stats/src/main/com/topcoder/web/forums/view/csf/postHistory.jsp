<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.action.util.Page,
                 com.topcoder.shared.util.DBMS,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.Iterator"
        %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="historyUser" name="historyUser" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistoryLocal" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% String sortField = (String) request.getAttribute("sortField");
    String sortOrder = (String) request.getAttribute("sortOrder");

    StringBuffer linkBuffer = new StringBuffer("?module=History");
    linkBuffer.append("&").append(ForumConstants.USER_ID).append("=").append(historyUser.getID());

    StringBuffer messageLinkBuffer = new StringBuffer(linkBuffer.toString());
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    messageLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MESSAGE_SUBJECT);
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
    if (sortField.equals(String.valueOf(JiveConstants.MESSAGE_SUBJECT))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        }
    } else {  // default
        messageLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
    }
    if (sortField.equals(String.valueOf(JiveConstants.MODIFICATION_DATE))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        }
    } else {  // default
        dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
    }
    String messageLink = messageLinkBuffer.toString();
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }
    String link = linkBuffer.toString();
%>

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
<div id="content">

    <jsp:include page="top.jsp"/>

    <jsp:include page="primaryNav.jsp">
        <jsp:param name="selectedTab" value="discuss"/>
    </jsp:include>

    <div id="main">
        <div class="pageHeader">
            <span class="pageName">Forums</span>
        </div>

        <table cellpadding="0" cellspacing="0" class="rtbcTable">
            <tr>
                <td class="categoriesBox" style="padding-right: 20px;">
                    <jsp:include page="categoriesHeader.jsp"/>
                </td>
                <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
                    <jsp:include page="searchHeader.jsp"/>
                </td>
                <td align="right" nowrap="nowrap" valign="top">
                    <A href="?module=History" class="rtbcLink">My Post
                        History</A> | <A href="?module=Settings" class="rtbcLink">User
                    Settings</A><br/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom:3px;">
                    <strong><a href="?module=Main" class="rtbcLink">Forums</a> > Post History:
                        <csf:handle coderId="<%=historyUser.getID()%>"/>
                        (<%=ForumsUtil.display(forumFactory.getUserMessageCount(historyUser), "post")%>)
                    </strong>
                </td>
                <% if (paginator.getNumPages() > 1) { %>
                <td class="rtbc" width="100%" align="right" nowrap="nowrap" style="padding-bottom:3px;"><b>
                    <% if (paginator.getPreviousPage()) { %>
                    <A href="<%=link%>&<%=ForumConstants.START_IDX%>=${paginator.previousPageStart}" class="rtbcLink">
                        &lt;&lt;PREV</A>&#160;&#160;&#160;
                    <% } %> [
                    <% Page[] pages = paginator.getPages(5);
                        for (int i = 0; i < pages.length; i++) {
                    %>  <% if (pages[i] != null) { %>
                    <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
                    <span class="currentPage"><%= pages[i].getNumber() %></span>
                    <% } else { %>
                    <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                        <%= pages[i].getNumber() %>
                    </A>
                    <% } %>
                    <% } %>
                    <% } %> ]
                    <% if (paginator.getNextPage()) { %>
                    &#160;&#160;&#160;<A href="<%=link%>&<%=ForumConstants.START_IDX%>=${paginator.nextPageStart}" class="rtbcLink">NEXT
                    &gt;</A>
                    <% } %>
                </b>
                </td>
                <% } %>
            </tr>
        </table>

        <table cellpadding="0" cellspacing="0" class="rtTable">
            <tr>
                <td class="rtHeader" width="100%"><a href="<%=messageLink%>" class="rtbcLink">Post</a></td>
                <td class="rtHeader">Forum</td>
                <td class="rtHeader"><a href="<%=dateLink%>" class="rtbcLink">Date</a></td>
                <td class="rtHeader" align="right">Replies</td>
                <td class="rtHeader" align="right">Edits</td>
            </tr>
            <tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage"
                                iterator='<%=(Iterator)request.getAttribute("messages")%>'>
            <tr class="light">
                <td class="rtThreadCellWrap">
                    <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">
                        <jsp:getProperty name="message" property="subject"/>
                    </A>
                    <% if (message.getParentMessage() != null) { %>
                    (response to
                    <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%>
                    by
                    <csf:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>
                    (<A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getParentMessage().getUser().getID()%>" alt="Post history for <%=message.getParentMessage().getUser().getUsername()%>" class="rtbcLink"/>history
                </A>
                )<%}%>)
                <% } %></td>
            <td class="rtThreadCell" nowrap="nowrap">
                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=message.getForum().getID()%>&mc=<%=message.getForum().getMessageCount()%>" class="rtbcLink"><%=message.getForum().getName()%>
                </A>
            </td>
            <td class="rtThreadCell" nowrap="nowrap"><strong>
                <tc-webtag:format object="${message.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
            </strong>
            </td>
            <td class="rtThreadCell" align="right"><%=message.getForumThread().getTreeWalker().getRecursiveChildCount(message)%>
            </td>
            <td class="rtThreadCell" align="right">
                <A href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink"><%=historyBean.getEditCount(message.getID(), DBMS.FORUMS_DATASOURCE_NAME)%>
                </A>
            </td>
        </tr>
        </tc-webtag:iterator>
    </table>

</div>

<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>