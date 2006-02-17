<%@ page import="java.util.HashSet"%>
<%@page contentType="text/xml"%>
<% HashSet h = (HashSet)request.getAttribute("unreadCategories"); %>
<taconite-root xml:space="preserve">
    <taconite-replace-children contextNodeID="m_forums" parseInBrowser="true">
        <li><a href="http://www.branch2.topcoder.com/tc"><%=h.contains("roundtables")?"Unread":""%>Round Tables</a></li>
        <li><a href="http://www.branch2.topcoder.com/tc"><%=h.contains("matches")?"Unread":""%>Algorithm Matches</a></li>
        <li><a href="http://www.branch2.topcoder.com/tc"><%=h.contains("longcontests")?"Unread":""%>Marathon Matches</a></li>
        <li><a href="http://www.branch2.topcoder.com/tc"><%=h.contains("news")?"Unread":""%>News Discussions</a></li>
        <li><a href="http://www.branch2.topcoder.com/tc"><%=h.contains("sponsors")?"Unread":""%>Sponsor Discussions</a></li>06
    </taconite-replace-children>
</taconite-root>