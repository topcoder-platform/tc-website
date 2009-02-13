<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% String unreadCategories = request.getAttribute("unreadCategories") == null ? "" : (String)request.getAttribute("unreadCategories");%>

<%-- TODO: replace with actual categories --%>
<A class="rtLinkBold" href="?module=Category&categoryID=13">Round Tables</A><br>
<A class="rtLinkOld" href="?module=Category&categoryID=14">Creative Contests</A><br>