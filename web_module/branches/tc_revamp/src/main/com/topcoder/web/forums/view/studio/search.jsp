<%@ page import="com.jivesoftware.base.User,
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

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="dates" name="dates" type="java.util.HashMap" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
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

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>TopCoder Studio</title>

	<jsp:include page="style.jsp">
   	 <jsp:param name="key" value="tc_studio_forums"/>
	</jsp:include>
	
	<script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
	<script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
	
	<script type="text/javascript">
        function openWin(url, name, w, h) {
            win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
    </script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="forums" />
        </jsp:include>
        <br />
        <!-- container -->
    	<div id="container">
            <!-- content -->
           <div id="wrapper">
            	<div id="content">
                	<div class="contentTop">
                	<h1>Forums</h1>
                	<div class="contentMiddle forums">

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
	<td class="categoriesBox" style="padding-right: 20px;">
		<jsp:include page="categoriesHeader.jsp" />
	</td>
	<td align="right" nowrap="nowrap" width="100%" valign="top">   
		<a href="?module=History" class="rtbcLink">My Post History</a> | <a href="?module=Watches" class="rtbcLink">My Watches</a> | <a href="?module=Settings" class="rtbcLink">User Settings</a><br />
	</td>
</tr>
<tr>
	<td colspan="3" style="padding-bottom:2px;">
		<b><a href="?module=Main" class="rtbcLink">Forums</a> > Search</b>
	</td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
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
         &#160;<a href="#" onclick="openWin('searchTips.jsp','st',600,400);" class="rtLinkOld">Search Tips</a>
         <% if (errors.get(ForumConstants.SEARCH_QUERY) != null) { %><br /><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_QUERY%>"><%=err%></tc-webtag:errorIterator></span><% } %>
      </td>
   </tr>

   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Forum:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="<%=ForumConstants.SEARCH_SCOPE%>" id="<%=ForumConstants.SEARCH_SCOPE%>">
<%  if (searchScope == null || searchScope.equals("all")) { %>
        <option value="all" selected>All Forums</option>
<%  } else { %>
        <option value="all">All Forums</option>
<%  } %>
<tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
<%  String searchScopeValue = "f" + forum.getID();
    if (searchScope != null && searchScope.equals(searchScopeValue)) { %>
        <option value="<%=searchScopeValue%>" selected>&#149;&#160;<jsp:getProperty name="forum" property="name"/></option>
    <%  } else { %>
        <option value="<%=searchScopeValue%>">&#149;&#160;<jsp:getProperty name="forum" property="name"/></option>
    <%  } %>
</tc-webtag:iterator>
<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)request.getAttribute("categories")%>'>
<%  String categoryValue = "c" + category.getID();
    if (searchScope != null && searchScope.equals(categoryValue)) { %>
        <option value="<%=categoryValue%>" selected><jsp:getProperty name="category" property="name"/></option>
    <%  } else { %>
        <option value="<%=categoryValue%>"><jsp:getProperty name="category" property="name"/></option>
    <%  } %>
    <%  if (!"true".equals(category.getProperty(ForumConstants.PROPERTY_HIDE_SEARCH_FORUMS))) { %> 
    <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=category.getForums()%>'>
   <%  String forumValue = "f" + forum.getID();
       if (searchScope != null && searchScope.equals(forumValue)) { %>
           <option value="<%=forumValue%>" selected>&#149;&#160;<jsp:getProperty name="forum" property="name"/></option>
       <%  } else { %>
           <option value="<%=forumValue%>">&#149;&#160;<jsp:getProperty name="forum" property="name"/></option>
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
         <% if (errors.get(ForumConstants.SEARCH_HANDLE) != null) { %><br /><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_HANDLE%>"><%=err%></tc-webtag:errorIterator></span><% } %>
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
<br />
<% if ("search".equals(status)) { %>
    <jsp:include page="searchResults.jsp"/>
<% } %>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>