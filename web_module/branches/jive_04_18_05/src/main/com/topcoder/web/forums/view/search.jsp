<%@ page import="com.topcoder.web.common.BaseServlet,
				 com.topcoder.web.common.BaseProcessor,
         		 com.topcoder.web.forums.ForumConstants,
         		 java.util.*,
         		 java.text.SimpleDateFormat"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%	HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY); %>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<link type="text/css" rel="stylesheet" href="/css/stats.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value=""/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="Forum Search"/>
            </jsp:include>

<span class="bodySubtitle">Forum Search</span><br/>
<table cellpadding="0" cellspacing="0" class="rtTable">
<form name="form1" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module" value="Search"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.SEARCH_STATUS%>" value="search"/>
   <tr>
      <td class="rtHeader" colspan="2">Search Forum Content</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Query:</strong></td>
      <td class="rtTextCell100">
         <input name="<%=ForumConstants.SEARCH_QUERY%>" size="50" maxlength="100" value="" id="<%=ForumConstants.SEARCH_QUERY%>" type="text">
         <input name="Search" value="Search" type="submit" alt="Search" onclick="">
         &#160;<a href="#" onclick="openWin('searchTips.jsp','st',300,400);" class="rtLinkNew">Search Tips</a>
         <% if (errors.get(ForumConstants.SEARCH_QUERY) != null) { %><br/><font color="red"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_QUERY%>"><%=err%></tc-webtag:errorIterator></font><% } %>
      </td>
   </tr>
   
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Forum:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="<%=ForumConstants.SEARCH_SCOPE%>" id="<%=ForumConstants.SEARCH_SCOPE%>">
<option value="all">All Forums</option>
<tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
<option value="f<jsp:getProperty name="forum" property="ID"/>">&#149;&#160;<jsp:getProperty name="forum" property="name"/></option>
</tc-webtag:iterator>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Date Range:</strong></td>
      <td class="rtTextCell100">
<%	Calendar calendar = Calendar.getInstance();
	calendar.setTime(new Date());
	SimpleDateFormat formatter = new SimpleDateFormat("M/d/yy"); 
	SimpleDateFormat yearFormatter = new SimpleDateFormat("1/1/yy");
	calendar.add(Calendar.DAY_OF_MONTH, -1);
	String dateYesterday = formatter.format(calendar.getTime());
	calendar.add(Calendar.DAY_OF_MONTH, -6);
	String dateLast7Days = formatter.format(calendar.getTime());
	calendar.add(Calendar.DAY_OF_MONTH, -23);
	String dateLast30Days = formatter.format(calendar.getTime());
	calendar.add(Calendar.DAY_OF_MONTH, -60);
	String dateLast90Days = formatter.format(calendar.getTime());
	calendar.add(Calendar.DAY_OF_MONTH, 90);
	String dateThisYear = yearFormatter.format(calendar.getTime());
	calendar.add(Calendar.YEAR, -1);
	String dateLastYear = yearFormatter.format(calendar.getTime());
	%>
<select size="1" name="<%=ForumConstants.SEARCH_DATE_RANGE%>" id="<%=ForumConstants.SEARCH_DATE_RANGE%>">
<option value="all" selected="selected">All</option>
<option value="<%=dateYesterday%>">&#149;&#160;Yesterday (<%=dateYesterday%>)</option>
<option value="<%=dateLast7Days%>">&#149;&#160;Last 7 Days (<%=dateLast7Days%>)</option>
<option value="<%=dateLast30Days%>">&#149;&#160;Last 30 Days (<%=dateLast30Days%>)</option>
<option value="<%=dateLast90Days%>">&#149;&#160;Last 90 Days (<%=dateLast90Days%>)</option>
<option value="<%=dateThisYear%>">&#149;&#160;This Year (<%=dateThisYear%>)</option>
<option value="<%=dateLastYear%>">&#149;&#160;Last Year (<%=dateLastYear%>)</option>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Handle:</strong></td>
      <td class="rtTextCell100">
         <input name="<%=ForumConstants.SEARCH_HANDLE%>" size="20" maxlength="50" id="<%=ForumConstants.SEARCH_HANDLE%>" value="" type="text" />&#160;
         (Leave field blank to search all users)
         <% if (errors.get(ForumConstants.SEARCH_HANDLE) != null) { %><br/><font color="red"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.SEARCH_HANDLE%>"><%=err%></tc-webtag:errorIterator></font><% } %>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Results Per Page:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="<%=ForumConstants.SEARCH_RESULT_SIZE%>" id="<%=ForumConstants.SEARCH_RESULT_SIZE%>">
<%  int[] resultSizes = { 10, 20, 30, 50 };
	for (int i=0; i<resultSizes.length; i++) {
		if (resultSizes[i] == ForumConstants.DEFAULT_SEARCH_RESULT_SIZE) { %>
			<option value="<%=resultSizes[i]%>" selected><%=resultSizes[i]%></option>
	<%	} else { %>
			<option value="<%=resultSizes[i]%>"><%=resultSizes[i]%></option>
	<%	}
	} %>
</select>
      </td>
   </tr>
</form>
</table>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>