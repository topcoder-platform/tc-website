<%@ page import="com.jivesoftware.util.StringUtils,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.HashMap"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    String queryTerms = com.topcoder.web.common.StringUtils.checkNull(request.getParameter("queryTerms")); %>
<div style="margin-bottom:6px;">
<form name="formSearch" method="post" action="${sessionInfo.servletPath}">
<tc-webtag:hiddenInput name="module" value="Search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>" value="search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_SCOPE%>" value="all"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_DATE_RANGE%>" value="all"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_MODE%>" value="<%=ForumConstants.SEARCH_MODE_BASIC%>"/>
<input name="<%=ForumConstants.SEARCH_QUERY%>" size="20" maxlength="100" value="<%=StringUtils.escapeHTMLTags(queryTerms)%>" id="<%=ForumConstants.SEARCH_QUERY%>" type="text">
<input name="Search" value="Search" type="submit" alt="Search" onclick="">
<br />
<a href="?module=Search" class="rtbcLink">Advanced Search</a>
<% if (errors != null && errors.get(ForumConstants.SEARCH_QUERY) != null) { %><br /><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_QUERY%>"><%=err%></tc-webtag:errorIterator></span><% } %>
</form>
</div>