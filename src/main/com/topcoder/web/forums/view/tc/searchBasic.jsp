<%@ page import="com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.forum.Query,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.jivesoftware.util.StringUtils,
                 com.topcoder.web.common.BaseProcessor,
                 java.util.HashMap,
                 java.util.Iterator"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="dates" name="dates" type="java.util.HashMap" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    Paginator paginator = (Paginator)request.getAttribute("paginator");
    Query query = (Query)request.getAttribute("query");
    String searchScope = (String)request.getAttribute("searchScope");
    String dateRange = (String)request.getAttribute("dateRange");
    String status = (String)request.getAttribute("status");
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
	<td class="categoriesBox" style="padding-right: 20px;">
		<jsp:include page="categoriesHeader.jsp" />
	</td>
    <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
		<jsp:include page="searchHeader.jsp" >
			<jsp:param name="queryTerms" value="<%=query.getQueryString()%>"/>
		</jsp:include>
    </td>
    <td align="right" nowrap="nowrap" valign="top">   
		<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
	</td>
</tr>
<tr>
	<td colspan="3" style="padding-top:3px;padding-bottom:9px;">
		<b><a href="?module=Main" class="rtbcLink">Forums</a> <img src="/i/interface/exp_w.gif" align="absmiddle"/> Search</b>
	</td>
</tr>
</table>

<%	if ("search".equals(status)) { %>
	<%	boolean displayPerThread = JiveGlobals.getJiveBooleanProperty("search.results.groupByThread", true); 
    	int resultCount = (displayPerThread) ? query.getResultByThreadCount() : query.getResultCount(); 
		int categoriesCount = (request.getAttribute("categoriesCount") != null) ? ((Integer)request.getAttribute("categoriesCount")).intValue() : 0;
		if (categoriesCount > 0) { %>
		<jsp:include page="searchCategoryResults.jsp"/><p>
	<%	} %>
	<%	if (resultCount > 0) { %>
    	<jsp:include page="searchResults.jsp"/>
    <%	} %>
    <%	if (categoriesCount == 0 && resultCount == 0) { %>
	    <table cellpadding="0" cellspacing="0" class="rtbcTable">
		    <tr>
		        <td class="rtbc">No search results for "<%=StringUtils.escapeHTMLTags(query.getQueryString())%>". Please try a less restrictive search.</td>
		    </tr>
		</table>
	<%	} %>
<%  } %>

<div style="clear:both;">&nbsp;</div>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>