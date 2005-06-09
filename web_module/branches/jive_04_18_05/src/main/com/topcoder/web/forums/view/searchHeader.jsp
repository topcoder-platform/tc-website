<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_STATUS%>" value="search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_SCOPE%>" value="all"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_DATE_RANGE%>" value="all"/>
<A href="?module=Search" class="rtbcLink">Search:</A>&#160;
<input name="<%=ForumConstants.SEARCH_QUERY%>" size="20" maxlength="100" value="" id="<%=ForumConstants.SEARCH_QUERY%>" type="text">
<input name="Search" value="Search" type="submit" alt="Search" onclick="">
&#160;<a href="#" onclick="openWin('searchTips.jsp','st',600,400);" class="rtbcLink">Search Tips</a>
</form>
