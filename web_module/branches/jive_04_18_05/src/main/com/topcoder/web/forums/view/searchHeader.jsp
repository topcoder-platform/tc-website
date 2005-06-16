<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.BaseProcessor,
         		 com.topcoder.web.forums.ForumConstants,
                 com.jivesoftware.forum.Query,
                 com.jivesoftware.util.StringUtils,
                 java.util.*"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    String queryTerms = com.topcoder.web.common.StringUtils.checkNull(request.getParameter("queryTerms")); %>

<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_STATUS%>" value="search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_SCOPE%>" value="all"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_DATE_RANGE%>" value="all"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_MODE%>" value="<%=ForumConstants.SEARCH_MODE_BASIC%>"/>
<input name="<%=ForumConstants.SEARCH_QUERY%>" size="20" maxlength="100" value="<%=StringUtils.escapeHTMLTags(queryTerms)%>" id="<%=ForumConstants.SEARCH_QUERY%>" type="text">
<input name="Search" value="Search" type="submit" alt="Search" onclick="">
&#160;
<A href="?module=Search" class="rtbcLink">Advanced Search</A>
<% if (errors != null && errors.get(ForumConstants.SEARCH_QUERY) != null) { %><br/><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_QUERY%>"><%=err%></tc-webtag:errorIterator></span><% } %>
</form>