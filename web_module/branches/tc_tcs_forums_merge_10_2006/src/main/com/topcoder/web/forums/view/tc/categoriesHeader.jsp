<%@ page import="com.topcoder.shared.util.ApplicationServer,
				 com.jivesoftware.forum.ForumFactory" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ForumFactory forumFactory = (ForumFactory)request.getAttribute("forumFactory"); %>
<% String unreadCategories = request.getAttribute("unreadCategories") == null ? "" : (String)request.getAttribute("unreadCategories");%>

<% Iterator itCategories = forumFactory.getRootForumCategory().getCategories(); %>

<A class="<%=(unreadCategories.indexOf("roundtables")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=13">Round Tables</A><br>
<A class="<%=(unreadCategories.indexOf("matches")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=14">Algorithm Matches</A><br>
<A class="<%=(unreadCategories.indexOf("highschool")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=21">High School Matches</A><br>
<A class="<%=(unreadCategories.indexOf("assembly")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=19">Assembly Contests</A><br>
<A class="<%=(unreadCategories.indexOf("longcontests")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=17">Marathon Matches</A><br>
<A class="<%=(unreadCategories.indexOf("news")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">News Discussions</A><br>
<A class="<%=(unreadCategories.indexOf("software")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=378">Software Forums</A><br>
<A class="<%=(unreadCategories.indexOf("sponsors")<0)?"rtLinkOld":"rtLinkBold"%>" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=6">Sponsor Discussions</A>