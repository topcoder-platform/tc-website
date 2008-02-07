<%@ page import="com.jivesoftware.forum.Query,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.topcoder.web.common.BaseProcessor,
                 java.util.HashMap,
                 java.util.Iterator"
        %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="dates" name="dates" type="java.util.HashMap" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% HashMap errors = (HashMap) request.getAttribute(BaseProcessor.ERRORS_KEY);
    Paginator paginator = (Paginator) request.getAttribute("paginator");
    Query query = (Query) request.getAttribute("query");
    String searchScope = (String) request.getAttribute("searchScope");
    String dateRange = (String) request.getAttribute("dateRange");
    String status = (String) request.getAttribute("status");
    Iterator results = (Iterator) request.getAttribute("results"); %>

<script type="text/javascript">
    function noenter(e)
    {
        var k = (window.event) ? event.keyCode : e.which;
        return !(k == 13);
    }
</script>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csfforums"/>
    </jsp:include>
    <script type="text/javascript">
        function openWin(url, name, w, h) {
            win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
    </script>
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
                    <td nowrap="nowrap" valign="top" width="100%">
                        <jsp:include page="searchHeader.jsp">
                            <jsp:param name="queryTerms" value="<%=query.getQueryString()%>"/>
                        </jsp:include>
                    </td>
                    <td align="right" nowrap="nowrap" valign="top">
                        <A href="?module=History" class="rtbcLink">My Post History</A> |
                        <A href="?module=Settings" class="rtbcLink">User Settings</A><br>
                    </td>
                </tr>
            </table>
            <b><a href="?module=Main" class="rtbcLink">Forums</a> > Search</b><br><br>

            <% if ("search".equals(status)) { %>
            <jsp:include page="searchResults.jsp"/>
            <% } %>

        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>