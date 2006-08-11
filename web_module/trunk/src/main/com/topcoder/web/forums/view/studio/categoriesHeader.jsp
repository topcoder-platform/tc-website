<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% String unreadCategories = request.getAttribute("unreadCategories") == null ? "" : (String)request.getAttribute("unreadCategories");%> 

<%-- TODO: replace with actual categories --%>
<A class="<%=(unreadCategories.indexOf("roundtables")<0)?"rtLinkOld":"rtLinkBold"%>" href="?module=Category&categoryID=2">Round Tables</A><br>
<A class="<%=(unreadCategories.indexOf("contests")<0)?"rtLinkOld":"rtLinkBold"%>" href="?module=Category&categoryID=3">TopCoder Studio Contests</A><br>