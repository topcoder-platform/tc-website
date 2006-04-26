<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% String unreadCategories = request.getAttribute("unreadCategories") == null ? "" : (String)request.getAttribute("unreadCategories");%>

<A class="<%=(unreadCategories.indexOf("roundtables")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=13">Round Tables</A><br>
<A class="<%=(unreadCategories.indexOf("matches")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=14">Algorithm Matches</A><br>
<A class="<%=(unreadCategories.indexOf("assembly")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=19">Assembly Contests</A><br>
<A class="<%=(unreadCategories.indexOf("longcontests")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=17">Marathon Matches</A><br>
<A class="<%=(unreadCategories.indexOf("news")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">News Discussions</A><br>
<A class="<%=(unreadCategories.indexOf("sponsors")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=6">Sponsor Discussions</A>