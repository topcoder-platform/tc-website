<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.Query,
                 java.util.*,
                 java.text.SimpleDateFormat"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%  Paginator paginator = (Paginator)request.getAttribute("paginator");
    Query query = (Query)request.getAttribute("query");
    String searchScope = (String)request.getAttribute("searchScope"); 
    String dateRange = (String)request.getAttribute("dateRange");
    String status = (String)request.getAttribute("status"); %>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td class="rtbc">Search Results</td>
        <% Page[] pages; %>
        <% if (paginator.getNumPages() > 1) { %>
	    <td class="rtbc" align="right"><b>
	        <%  if (paginator.getPreviousPage()) { %>
	            <A href="?module=Search&<%=ForumConstants.SEARCH_STATUS%>=<%=status%>&<%=ForumConstants.SEARCH_QUERY%>=<jsp:getProperty name="query" property="queryString"/>&<%=ForumConstants.SEARCH_SCOPE%>=<%=searchScope%>&<%=ForumConstants.SEARCH_DATE_RANGE%>=<%=dateRange%><% if (query.getFilteredUser() != null) { %>&<%=ForumConstants.SEARCH_HANDLE%>=<%=query.getFilteredUser().getUsername()%><% } %>&<%=ForumConstants.SEARCH_RESULT_SIZE%>=<%=paginator.getPageable().getResultFilter().getNumResults()%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
	                << PREV</A>&#160;&#160;&#160;
	        <%  } %> [
	        <%  pages = paginator.getPages(5);
	            for (int i=0; i<pages.length; i++) {
	        %>  <%  if (pages[i] != null) { %>
	                    <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
	                            <span class="currentPage"><%= pages[i].getNumber() %></span>
	                    <%  } else { %>
                                <A href="?module=Search&<%=ForumConstants.SEARCH_STATUS%>=<%=status%>&<%=ForumConstants.SEARCH_QUERY%>=<jsp:getProperty name="query" property="queryString"/>&<%=ForumConstants.SEARCH_SCOPE%>=<%=searchScope%>&<%=ForumConstants.SEARCH_DATE_RANGE%>=<%=dateRange%><% if (query.getFilteredUser() != null) { %>&<%=ForumConstants.SEARCH_HANDLE%>=<%=query.getFilteredUser().getUsername()%><% } %>&<%=ForumConstants.SEARCH_RESULT_SIZE%>=<%=paginator.getPageable().getResultFilter().getNumResults()%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
	                            <%= pages[i].getNumber() %></A>
	                    <%  } %>
	            <%  } %>
	        <%  } %> ]
	        <%  if (paginator.getNextPage()) { %>
	            &#160;&#160;&#160;<A href="?module=Search&<%=ForumConstants.SEARCH_STATUS%>=<%=status%>&<%=ForumConstants.SEARCH_QUERY%>=<jsp:getProperty name="query" property="queryString"/>&<%=ForumConstants.SEARCH_SCOPE%>=<%=searchScope%>&<%=ForumConstants.SEARCH_DATE_RANGE%>=<%=dateRange%><% if (query.getFilteredUser() != null) { %>&<%=ForumConstants.SEARCH_HANDLE%>=<%=query.getFilteredUser().getUsername()%><% } %>&<%=ForumConstants.SEARCH_RESULT_SIZE%>=<%=paginator.getPageable().getResultFilter().getNumResults()%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT >></A>
	        <%  } %>
        </b></td>
   </tr>
<% } %>
</table>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" width="70%">Message</td>
      <td class="rtHeader" width="10%">Author</td>
      <td class="rtHeader" width="10%" align="right">Replies</td>
      <td class="rtHeader" width="10%" align="right">Views</td>
      <td class="rtHeader" align="center" colspan="2">Last Post</td>
   </tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
   <tr>
      <td class="rtbc">Search Results</td>
   	<td class="rtbc" align="right"><b>
		 [
      <span class="currentPage">1</span>
      <a href="" class="rtbcLink">2</a>
      <a href="" class="rtbcLink">3</a>
      <a href="" class="rtbcLink">4</a>
      <a href="" class="rtbcLink">5</a>
      &nbsp;&nbsp;&nbsp;<a href="?module=ThreadList&amp;forumID=55&amp;start=15&amp;mc=2986" class="rtbcLink">NEXT&gt;&gt;</a>
	</b></td></tr>
</table>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" width="70%">Message</td>
      <td class="rtHeader" width="10%">Author</td>
      <td class="rtHeader" width="10%" align="right">Replies</td>
      <td class="rtHeader" width="10%" align="right">Views</td>
      <td class="rtHeader" align="center" colspan="2">Last Post</td>
   </tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
   <tr>
   	<td class="rtThreadCellWrap"><a href="?module=Thread&amp;threadID=8859&amp;start=0&amp;mc=5" class="rtLinkNew">Link List</a></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=10575801" class="coderTextBlack">bytesurfer</a></td>
   	<td class="rtThreadCell" align="right">4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell" align="right">10&nbsp;&nbsp;&nbsp;&nbsp;</td>
   	<td class="rtThreadCell"><b>Jun 10, 2005 2:35 PM</b></td>
   	<td class="rtThreadCell"><a href="/stat?c=member_profile&amp;cr=144400" class="coderTextRed">tomek</a></td>
	</tr>
</table>