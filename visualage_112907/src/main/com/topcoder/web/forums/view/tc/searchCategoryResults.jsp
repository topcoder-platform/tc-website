<%@ page import="com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.Query,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.topcoder.web.forums.model.ImageData,
                 java.text.SimpleDateFormat,
                 java.util.Hashtable,
                 java.util.Iterator"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  User user = (User) request.getAttribute("user");
	Paginator paginator = (Paginator)request.getAttribute("categoriesPaginator");
    Query query = (Query)request.getAttribute("query");
    String searchScope = (String)request.getAttribute("searchScope"); 
    String dateRange = (String)request.getAttribute("dateRange");
    String status = (String)request.getAttribute("status"); 
    String mode = (String)request.getAttribute("mode");
    Hashtable<String,ImageData> imageDataTable = (Hashtable<String,ImageData>)request.getAttribute("imageDataTable");
    
    int numResults = paginator.getPageable().getResultFilter().getNumResults(); 
    SimpleDateFormat formatter = new SimpleDateFormat("EEE, MMM d yyyy 'at' h:mm a z"); 
    boolean displayPerThread = JiveGlobals.getJiveBooleanProperty("search.results.groupByThread", true); 
    int resultCount = ((Integer)request.getAttribute("categoriesCount")).intValue();
    
    StringBuffer linkBuffer = new StringBuffer("?module=Search");
    if (mode != null) {
        linkBuffer.append("&").append(ForumConstants.SEARCH_MODE).append("=").append(mode);
    }
    linkBuffer.append("&").append(ForumConstants.STATUS).append("=").append(status);
    linkBuffer.append("&").append(ForumConstants.SEARCH_QUERY).append("=").append(com.jivesoftware.util.StringUtils.URLEncode(query.getQueryString(), JiveGlobals.getCharacterEncoding()));
    linkBuffer.append("&").append(ForumConstants.SEARCH_SCOPE).append("=").append(searchScope);
    linkBuffer.append("&").append(ForumConstants.SEARCH_DATE_RANGE).append("=").append(dateRange);
    if (query.getFilteredUser() != null) { 
        linkBuffer.append("&").append(ForumConstants.SEARCH_HANDLE).append("=").append(query.getFilteredUser().getUsername());
    }
    linkBuffer.append("&").append(ForumConstants.SEARCH_CATEGORY_RESULT_SIZE).append("=").append(numResults);
    
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
        <td class="rtbc" style="padding-bottom:2px;">Category Results (<%=numResults*paginator.getPageIndex()+1%> - <%=Math.min(resultCount,numResults*(paginator.getPageIndex()+1))%> of <%=resultCount%>) <a href="<%=sortFieldLink%>" class="rtbcLink">(<%=sortFieldLabel%>)</a></td>
        <% Page[] pages; %>
        <% if (paginator.getNumPages() > 1) { %>
       	<td class="rtbc" align="right"><b>
           <%  if (paginator.getPreviousPage()) { %>
               <A href="<%=link%>&<%=ForumConstants.SEARCH_CATEGORY_START_IDX%>=<%=paginator.getPreviousPageStart()%>" class="rtbcLink">
                   << PREV</A>&#160;&#160;&#160;
           <%  } %> [
           <%  pages = paginator.getPages(5);
               for (int i=0; i<pages.length; i++) {
           %>  <%  if (pages[i] != null) { %>
                   <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                           <span class="currentPage"><%= pages[i].getNumber() %></span>
                   <%  } else { %>
                            <A href="<%=link%>&<%=ForumConstants.SEARCH_CATEGORY_START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                           <%= pages[i].getNumber() %></A>
                   <%  } %>
               <%  } else { %> ... <%  } %>
           <%  } %> ]
           <%  if (paginator.getNextPage()) { %>
               &#160;&#160;&#160;<A href="<%=link%>&<%=ForumConstants.SEARCH_CATEGORY_START_IDX%>=<%=paginator.getNextPageStart()%>" class="rtbcLink">NEXT ></A>
           <%  } %>
        </b></td>
    </tr>
    <%  } %>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="100%">Category</td>
        <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
        <td class="rtHeader" align="center" colspan="2" nowrap="nowrap">
        	<div style="width:320px;">Last Post</div>
        </td>
    </tr>
    <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)request.getAttribute("categoriesPage")%>'>
        <tr>
            <td class="rtThreadCellWrap">
            	<%	if (ForumsUtil.isSoftwareSubcategory(category)) { %>
            	    <%	ImageData imageData = (ImageData)imageDataTable.get(String.valueOf(category.getID())); %>
            		<%	if (imageData != null && !"".equals(StringUtils.checkNull(imageData.getPhaseIcon()))) { %>
                		<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getPhaseIcon()%>" alt="<%=imageData.getPhaseText()%>" width="25" height="17" border="0">
					<%	} %>
					<%	if (imageData != null && !"".equals(StringUtils.checkNull(imageData.getTechnologyIcon()))) { %>
						<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getTechnologyIcon()%>" alt="<%=imageData.getTechnologyText()%>" border="0"/>
					<%	} %>
					&#160;
				<%	} %>
                <% if (user == null) { %>
                	<A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=category.getMessageCount()%>" class="rtLinkNew"><%=category.getName()%></A>
                <% } else { %>
                	<A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
                <% } %>
                <% if (category.getDescription() != null) { %><br/>
                	<div class="rtDescIndent"><%=category.getDescription()%></div>
                <% } %>
            </td>
            <td class="rtThreadCell" style="width: 80px;"><%=category.getThreadCount()%>&#160;/&#160;<%=category.getMessageCount()%></td>
            <% if (category.getLatestMessage() != null) { %>
	            <tc-webtag:useBean id="message" name="category" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
	            <td class="rtThreadCell" style="width: 220px;"><b>
	                <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
	            </td>
	            <% if (message.getUser() != null) { %>
		            <td class="rtThreadCell" style="width: 100px;">
		            	<tc-webtag:handle coderId="<%=message.getUser().getID()%>"/>
		            </td>
	            <% } else { %>
	            	<td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
	            <% } %>
            <% } else { %>
	            <td class="rtThreadCell" style="width: 220px;">&nbsp;</td>
	            <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table><br>

<%  } %>