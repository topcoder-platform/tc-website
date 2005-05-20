<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>

<html>
<head>
<title>TopCoder</title>
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
                <jsp:param name="title" value="Forum Post History"/>
            </jsp:include>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId="<%=user.getID()%>"/>(<%=forumFactory.getUserMessageCount(user)%>posts)</span>
<br>
<span class="bodySubtitle">Forum Post History</span><br>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<% if (paginator.getNumPages() > 1) { %>
	<td class="rtbc" align="right" width=20%><b>
		<%  if (paginator.getPreviousPage()) { %>
			<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="user" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
            	<< PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
        			<%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        					<span class="rtbcCurrPage"><%= <%= pages[i].getNumber() %></span>
        			<%  } else { %>
            				<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="user" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
	                		<%= pages[i].getNumber() %></A>
	                <%  } %>
            <%  } %>
        <%  } %> ]
		<%  if (paginator.getNextPage()) { %>
			&#160;&#160;&#160;<A href="?module=History&<%=ForumConstants.USER_ID%>=<jsp:getProperty name="user" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT>></A>
        <%  } %>
	</b></td></tr>
<% } %>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="40%">Topic</td>
        <td class="rtHeader" width="40%">Forum</td>
        <td class="rtHeader" width="20%">Date</td>
        <td class="rtHeader" align="right">Replies</td>
    </tr>
	<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
	<tr>
      	<td class="rtThreadCellWrap"><A href="" class="rtLinkNew"><jsp:getProperty name="message" property="subject"/></A></td>
      	<td class="rtThreadCell"><A href="" class="rtLinkNew"><%=message.getForum().getName()%></A></td>
      	<td class="rtThreadCell"><strong><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy 'at' h:mm a z"/></strong></td>
      	<td class="rtThreadCell" align="right"><%=message.getForumThread().getTreeWalker().getChildCount(message)%></td>
    </tr>
	</tc-webtag:iterator>        
</table>

            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" width="40%">Topic</td>
                    <td class="rtHeader" width="40%">Forum</td>
                    <td class="rtHeader" width="20%">Date</td>
                    <td class="rtHeader" align="right">Replies</td>
                </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think dok is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A> (response to <A href="/" class="rtLinkNew">post</A> by <A href="/" class="coderTextYellow">ilham</A>)</td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
               <tr>
                  <td class="rtThreadCellWrap"><A href="" class="rtLinkNew">I think TopCoder is dandy</A></td>
                  <td class="rtThreadCell"><A href="" class="rtLinkNew">Algorithm Competition Discussion</A></td>
                  <td class="rtThreadCell"><strong>May 16, 2005 3:58 PM</strong></td>
                  <td class="rtThreadCell" align="right">5</td>
               </tr>
            </table>
            <p>A topic with a <strong>bold title</strong> indicates it either has a new thread or has a thread with new postings.</p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>