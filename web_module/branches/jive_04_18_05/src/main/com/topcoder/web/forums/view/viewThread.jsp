<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 com.jivesoftware.forum.stats.ViewCountManager,
         		 com.jivesoftware.forum.action.util.Page,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>

<html>
<head>
<title>TopCoder</title>

<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
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
            <jsp:param name="image" value="round_table"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="/forums/" class="rtbcLink">Round Tables</A> >> 
	<A href="/forums/?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >> 
	<jsp:getProperty name="thread" property="name"/></td>
<% if (paginator.getNumPages() > 1) { %>
	<td class="rtbc" align="right"><b> 
		<%  if (paginator.getPreviousPage()) { %>
			<A href="/forums/?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
            	<< PREV</A>&#160;&#160;&#160;
        <%  } %>

		[
        <%  Page[] pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
        			<%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
        					<%= pages[i].getNumber() %>
        			<%  } else { %>
            				<A href="/forums/?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
	                		<%= pages[i].getNumber() %></A>
	                <%  } %>
            <%  } %>
        <%  } %>
        ]

		<%  if (paginator.getNextPage()) { %>
			&#160;&#160;&#160;<A href="/forums/?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT>></A>
        <%  } %>
	</b></td></tr>
<% } %>
</table>

<%  int startIdx = paginator.getStart(); 
	int endIdx = paginator.getNextPageStart(); 
	int idx = 0;
%>
<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
<%  if (idx >= startIdx && idx < endIdx) { %>
<table cellpadding="0" cellspacing="0" class="rtTable">
<tr><td class="rtHeader" colspan="2"><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM dd, yyyy 'at' h:mm a z"/> | New way to solve problem</td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer"><img src="/i/m/radeye_mug.gif" border="0" class="rtPhoto" /><br><A href="/" class="coderTextRed">radeye</A><br><A href="/">1037 posts</A></div></td>
<td class="rtTextCell">
Doesn't this problem permit a much simpler, O(c^2) algorithm?<br><br>
Choosing the first point to be at 0 does not in any way reduce the space of solutions, since any quadrilateral that does not include 0 can be rotated counterclockwise until it does, and you're guaranteed to still have the same shape. So we know we can start at 0.<br><br>
Now, just use dynamic programming to calculate a[lastpoint][numpoints] where lastpoint increases from 1 on up and numpoints is the number of points, and the a[][] contains the best (which is to say, least area) consumed by the space between the chords and the arc for those hops; numpoints goes from 2 (two points, one chord) to 4 (four points, three chords).<br><br>
Once you have this array, run through it from 0 backwards, adding the fourth chord/arc area and minimizing the result.<br><br>
Of course another algorithm (once you realize you can always use point 0) is O(n log n) by considering all "opposite" points of the diagonal and then using binary search to find the best point on either side. This can easily be improved to O(n) by walking the midpoints along as the diagonal point goes around the circle:
<pre>
p1 = 0 // fixed never changes
p3 = 2 // the diagonally distant point
p2 = 1
p4 = 3
trial() ;
while (p2 < n) {
   p2++ ;
   while (p1+1 is better) increment p1 ;
   while (p3+1 is better) increment p3 ;
   trial() ;
}
</pre>
</td>
</tr>
<tr><td class="rtFooter" align="right"><A href="/"><img src="/i/roundTables/reply.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/prevTopic.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/nextTopic.gif" class="rtButton" alt="" /></A></td></tr>
</table>
<%  } idx++; %>
</tc-webtag:iterator>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr><td class="rtHeader" colspan="2">Mon, Jan 24 2005 at 1:05 PM EST | Re: New way to solve problem</td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer"><img src="/i/m/n0vice_mug.gif" border="0" class="rtPhoto" /><br><A href="/" class="coderTextBlue">n0vice</A><br><A href="/">86 posts</A></div></td>
<td class="rtTextCell">
Cool! I wish I had thought about it during the contest.<br><br>
Is it possible to do O(n) for any n points around the circle?
</td></tr>
<tr><td class="rtFooter" align="right"><A href="/"><img src="/i/roundTables/reply.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/prevTopic.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/nextTopic.gif" class="rtButton" alt="" /></A></td></tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr><td class="rtHeader" colspan="2">Mon, Jan 24 2005 at 1:10 PM EST | Re: New way to solve problem</td></tr>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer"><A href="/" class="coderTextGreen">uler3161</A><br><A href="/">20 posts</A></div></td>
<td class="rtTextCell">
I think that's pretty simmilar to what I tried during the match. The problem I ran into is that since you have to get the exact number at half price, this limits the number of items you can get with points. So then if there is a way to get more than that number with points, that solution will not be valid. So then I tried keeping track of the number of items I'd used in the dp as well as the points and it all got too complicated and slow.
</td></tr>
<tr><td class="rtFooter" align="right"><A href="/"><img src="/i/roundTables/reply.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/prevTopic.gif" class="rtButton" alt="" /></A><A href="/"><img src="/i/roundTables/nextTopic.gif" class="rtButton" alt="" /></A></td></tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class="rtbc"><A href="/" class="rtbcLink">Algorithm Competitions</A> >> <A href="/" class="rtbcLink">Problems</A> >> <A href="/" class="rtbcLink">SRM 220</A> >> <A href="/" class="rtbcLink">Division 1 Level 1 (HiddenNumbers)</A> >> BlaBla</span>
<td class="rtbc" align="right" nowrap="nowrap"><b><< PREV&#160;&#160;&#160;[ 1 <A href="/">2</A> <A href="/">3</A> ]&#160;&#160;&#160;<A href="/">NEXT>></A></b></td></tr>
</table>

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
