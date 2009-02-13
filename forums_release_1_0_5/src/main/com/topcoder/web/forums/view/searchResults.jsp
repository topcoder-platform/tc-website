<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.Query,
                 com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.util.StringUtils,
                 java.util.*,
                 java.text.SimpleDateFormat"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%  Paginator paginator = (Paginator)request.getAttribute("paginator");
    Query query = (Query)request.getAttribute("query");
    String searchScope = (String)request.getAttribute("searchScope"); 
    String dateRange = (String)request.getAttribute("dateRange");
    String status = (String)request.getAttribute("status"); 
    String mode = (String)request.getAttribute("mode"); 
    Iterator results = (Iterator)request.getAttribute("results"); 
    
    int numResults = paginator.getPageable().getResultFilter().getNumResults(); 
    SimpleDateFormat formatter = new SimpleDateFormat("EEE, MMM d yyyy 'at' h:mm a"); 
    boolean displayPerThread
        = JiveGlobals.getJiveBooleanProperty("search.results.groupByThread", true); 
    int resultCount = (displayPerThread) ? query.getResultByThreadCount() : query.getResultCount(); 
    
    StringBuffer linkBuffer = new StringBuffer("?module=Search");
    if (mode != null) {
        linkBuffer.append("&").append(ForumConstants.SEARCH_MODE).append("=").append(mode);
    }
    linkBuffer.append("&").append(ForumConstants.SEARCH_STATUS).append("=").append(status);
    linkBuffer.append("&").append(ForumConstants.SEARCH_QUERY).append("=").append(StringUtils.URLEncode(query.getQueryString(), JiveGlobals.getCharacterEncoding()));
    linkBuffer.append("&").append(ForumConstants.SEARCH_SCOPE).append("=").append(searchScope);
    linkBuffer.append("&").append(ForumConstants.SEARCH_DATE_RANGE).append("=").append(dateRange);
    if (query.getFilteredUser() != null) { 
        linkBuffer.append("&").append(ForumConstants.SEARCH_HANDLE).append("=").append(query.getFilteredUser().getUsername());
    }
    linkBuffer.append("&").append(ForumConstants.SEARCH_RESULT_SIZE).append("=").append(numResults);
    
    String sortFieldLink = linkBuffer.toString();
    String sortFieldLabel = "";
    if (query.getSortField() == Query.RELEVANCE) {
        sortFieldLink += "&" + ForumConstants.SEARCH_SORT_FIELD + "=" + Query.DATE;
        sortFieldLabel = "sort by date";
    } else {
        sortFieldLink += "&" + ForumConstants.SEARCH_SORT_FIELD + "=" + Query.RELEVANCE;
        sortFieldLabel = "sort by relevance";
    }
    
    linkBuffer.append("&").append(ForumConstants.SEARCH_SORT_FIELD).append("=").append(query.getSortField());
    String link = linkBuffer.toString(); %>

<%  if (resultCount > 0) { %>
<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td class="rtbc">Search Results (<%=numResults*paginator.getPageIndex()+1%> - <%=Math.min(resultCount,numResults*(paginator.getPageIndex()+1))%> of <%=resultCount%>) <a href="<%=sortFieldLink%>" class="rtbcLink">(<%=sortFieldLabel%>)</a></td>
        <% Page[] pages; %>
        <% if (paginator.getNumPages() > 1) { %>
       <td class="rtbc" align="right"><b>
           <%  if (paginator.getPreviousPage()) { %>
               <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
                   << PREV</A>&#160;&#160;&#160;
           <%  } %> [
           <%  pages = paginator.getPages();
               for (int i=0; i<pages.length; i++) {
           %>  <%  if (pages[i] != null) { %>
                       <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                               <span class="currentPage"><%= pages[i].getNumber() %></span>
                       <%  } else { %>
                                <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                               <%= pages[i].getNumber() %></A>
                       <%  } %>
               <%  } else { %> ... <%  } %>
           <%  } %> ]
           <%  if (paginator.getNextPage()) { %>
               &#160;&#160;&#160;<A href="<%=link%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT >></A>
           <%  } %>
        </b></td>
    </tr>
    <%  } %>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="70%">Message</td>
        <td class="rtHeader" width="10%">Author</td>
        <td class="rtHeader" width="10%" align="right">Replies</td>
        <td class="rtHeader" width="10%" align="right">Views</td>
        <td class="rtHeader" align="center">Date</td>
    </tr>
    <tc-webtag:iterator id="result" type="com.jivesoftware.forum.QueryResult" iterator='<%=results%>'>
        <%  ForumMessage message = result.getMessage(); %>
        <tr>
            <td class="rtThreadCellWrap"><a href="?module=Message&messageID=<%=message.getID()%>" class="rtbcLink"><%=ForumsUtil.getMessageSubjectPreview(message, query.getQueryString())%></a><br><div class="rtDescIndent"><%=ForumsUtil.getMessageBodyPreview(message, query.getQueryString())%></div></td>
            <td class="rtThreadCell"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></td>
            <td class="rtThreadCell" align="right"><%=message.getForumThread().getTreeWalker().getChildCount(message)%></td>
            <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(message.getForumThread())%></td>
          <td class="rtThreadCell"><b><%=formatter.format(message.getModificationDate())%></b></td>
        </tr>
   </tc-webtag:iterator>
</table>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <% if (paginator.getNumPages() > 1) { %>
        <td class="rtbc" align="right"><b>
            <%  if (paginator.getPreviousPage()) { %>
                <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
                    << PREV</A>&#160;&#160;&#160;
            <%  } %> [
            <%  pages = paginator.getPages();
                for (int i=0; i<pages.length; i++) {
            %>  <%  if (pages[i] != null) { %>
                        <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                                <span class="currentPage"><%= pages[i].getNumber() %></span>
                        <%  } else { %>
                                <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                                <%= pages[i].getNumber() %></A>
                        <%  } %>
                <%  } else { %> ... <%  } %>
            <%  } %> ]
            <%  if (paginator.getNextPage()) { %>
                &#160;&#160;&#160;<A href="<%=link%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT >></A>
            <%  } %>
        </b></td>
    </tr>
    <%  } %>
</table>

<%  } else { %>
<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td class="rtbc">No search results for "<%=query.getQueryString()%>". Please try a less restrictive search.</td>
    </tr>
</table>
<%  } %>