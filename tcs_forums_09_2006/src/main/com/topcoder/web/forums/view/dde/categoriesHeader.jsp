<%@ page import="com.topcoder.shared.util.ApplicationServer,
	 			com.topcoder.web.forums.ForumConstants"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<A class="rtLinkBold" href="?module=Main">Customer Forums</A><br />
<A class="rtLinkBold" href="?module=Main&<%=ForumConstants.FORUM_TYPE%>=<%=ForumConstants.DEVELOPER_FORUM%>">Developer Forums</A>