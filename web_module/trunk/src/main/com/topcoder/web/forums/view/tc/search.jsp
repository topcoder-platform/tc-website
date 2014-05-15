<%@ page import="com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.Query,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.jivesoftware.util.StringUtils,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 java.text.SimpleDateFormat,
                 java.util.Date,
                 java.util.HashMap"
%>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="dates" name="dates" type="java.util.HashMap" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  User user = (User)request.getAttribute("user");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    Paginator paginator = (Paginator)request.getAttribute("paginator");
    Query query = (Query)request.getAttribute("query");
    String searchScope = (String)request.getAttribute("searchScope");
    String dateRange = (String)request.getAttribute("dateRange");
    String status = (String)request.getAttribute("status");
    String mode = (String)request.getAttribute("mode");
    Iterator results = (Iterator)request.getAttribute("results"); %>

<script type="text/javascript">
function noenter(e)
{
  var k = (window.event)? event.keyCode: e.which;
  return !(k == 13);
}
</script>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="Forum Search"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
    <td style="padding-bottom:3px;" class="breadcrumbs">
        <b><a href="?module=Main" class="rtbcLink">Forums</a> <img src="/i/interface/exp_w.gif" align="absmiddle"/> Search</b>
    </td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable rtSearch">
<form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
<tc-webtag:hiddenInput name="module" value="Search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>" value="search"/>
   <tr>
      <td class="rtHeader" colspan="2">Search Criteria</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Query:</strong></td>
      <td class="rtTextCell100">
         <input name="<%=ForumConstants.SEARCH_QUERY%>" size="50" maxlength="100" value="<%if (query != null) {%><%=StringUtils.escapeHTMLTags(query.getQueryString())%><%}%>" id="<%=ForumConstants.SEARCH_QUERY%>" type="text">
         <input name="Search" value="Search" type="submit" alt="Search" onclick="">
         <%--&#160;<a href="#" onclick="openWin('searchTips.jsp','st',600,400);" class="rtLinkOld">Search Tips</a>--%>
         <% if (errors.get(ForumConstants.SEARCH_QUERY) != null) { %><br/><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_QUERY%>"><%=err%></tc-webtag:errorIterator></span><% } %>
      </td>
   </tr>

   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Forum:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="<%=ForumConstants.SEARCH_SCOPE%>" id="<%=ForumConstants.SEARCH_SCOPE%>">
<tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
<%  String searchScopeValue = "f" + forum.getID();
    if (searchScope != null && searchScope.equals(searchScopeValue)) { %>
        <option value="<%=searchScopeValue%>" selected>&#149;&#160;<%=forum.getName()%></option>
    <%  } else { %>
        <option value="<%=searchScopeValue%>">&#149;&#160;<%=forum.getName()%></option>
    <%  } %>
</tc-webtag:iterator>
<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)request.getAttribute("categories")%>'>
<%  String categoryValue = "c" + category.getID();
    if (searchScope != null && searchScope.equals(categoryValue)) { %>
        <option value="<%=categoryValue%>" selected><%=category.getName()%></option>
    <%  } else { %>
        <option value="<%=categoryValue%>"><%=category.getName()%></option>
    <%  } %>
    <%  if (!"true".equals(category.getProperty(ForumConstants.PROPERTY_HIDE_SEARCH_FORUMS))) { %> 
    <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=category.getForums()%>'>
   <%  String forumValue = "f" + forum.getID();
       if (searchScope != null && searchScope.equals(forumValue)) { %>
           <option value="<%=forumValue%>" selected>&#149;&#160;<%=forum.getName()%></option>
       <%  } else { %>
           <option value="<%=forumValue%>">&#149;&#160;<%=forum.getName()%></option>
       <%  } %>
    </tc-webtag:iterator>
    <%  } %>
</tc-webtag:iterator>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Date Range:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="<%=ForumConstants.SEARCH_DATE_RANGE%>" id="<%=ForumConstants.SEARCH_DATE_RANGE%>">
<%  if (dateRange == null || dateRange.equals("all")) { %>
        <option value="all" selected>All</option>
<%  } else { %>
        <option value="all">All</option>
<%  } %>
<%  SimpleDateFormat formatter = new SimpleDateFormat("M/d/yy");
    for (int i=0; i<ForumConstants.SEARCH_DATES.length; i++) { %>
        <%  if (dateRange != null && dateRange.equals(ForumConstants.SEARCH_DATES[i])) { %>
                <option value="<%=ForumConstants.SEARCH_DATES[i]%>" selected>&#149;&#160;<%=ForumConstants.SEARCH_DATE_LABELS[i]%> (<%=formatter.format((Date)dates.get(ForumConstants.SEARCH_DATES[i]))%>)</option>
        <%  } else { %>
                <option value="<%=ForumConstants.SEARCH_DATES[i]%>">&#149;&#160;<%=ForumConstants.SEARCH_DATE_LABELS[i]%> (<%=formatter.format((Date)dates.get(ForumConstants.SEARCH_DATES[i]))%>)</option>
        <%  } %>
<%  } %>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Handle:</strong></td>
      <td class="rtTextCell100">
         <input name="<%=ForumConstants.SEARCH_HANDLE%>" size="20" maxlength="50" id="<%=ForumConstants.SEARCH_HANDLE%>" value="<%if (query != null && query.getFilteredUser() != null){%><%=query.getFilteredUser().getUsername()%><%}%>" type="text"/>&#160;
         (Leave field blank to search all users)
         <% if (errors.get(ForumConstants.SEARCH_HANDLE) != null) { %><br/><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_HANDLE%>"><%=err%></tc-webtag:errorIterator></span><% } %>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Results Per Page:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="<%=ForumConstants.SEARCH_RESULT_SIZE%>" id="<%=ForumConstants.SEARCH_RESULT_SIZE%>">
<%  int[] resultSizes = { 10, 20, 30, 50 };
   for (int i=0; i<resultSizes.length; i++) {
      if ((query != null && paginator.getPageable().getResultFilter().getNumResults() == resultSizes[i]) ||
            (query == null && (authToken.isAnonymous() || user.getProperty("jiveSearchRange") == null) && resultSizes[i] == ForumConstants.DEFAULT_SEARCH_RANGE) ||
            (query == null && user != null && user.getProperty("jiveSearchRange") != null && resultSizes[i] == Integer.parseInt(user.getProperty("jiveSearchRange")))) { %>
         <option value="<%=resultSizes[i]%>" selected><%=resultSizes[i]%></option>
   <%   } else { %>
         <option value="<%=resultSizes[i]%>"><%=resultSizes[i]%></option>
   <%   }
   } %>
</select>
      </td>
   </tr>
</form>
</table>
<br>

<%    if ("search".equals(status)) { %>
    <%    boolean displayPerThread = JiveGlobals.getJiveBooleanProperty("search.results.groupByThread", true); 
        int resultCount = (displayPerThread) ? query.getResultByThreadCount() : query.getResultCount(); 
        int categoriesCount = (request.getAttribute("categoriesCount") != null) ? ((Integer)request.getAttribute("categoriesCount")).intValue() : 0;
        if (categoriesCount > 0) { %>
        <jsp:include page="searchCategoryResults.jsp"/><p>
    <%    } %>
    <%    if (resultCount > 0) { %>
        <jsp:include page="searchResults.jsp"/>
    <%    } %>
    <%    if (categoriesCount == 0 && resultCount == 0) { %>
        <table cellpadding="0" cellspacing="0" class="rtbcTable">
            <tr>
                <td class="rtbc">No search results for "<%=StringUtils.escapeHTMLTags(query.getQueryString())%>". Please try a less restrictive search.</td>
            </tr>
        </table>
    <%    } %>
<%  } %>

<div style="clear:both;">&nbsp;</div>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
