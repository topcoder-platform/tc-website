<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "c_forum_search.jsp";
    String action = request.getParameter("a");
%>

<% // PAGE SPECIFIC DECLARATIONS %>
<%@ page import="com.topcoder.forum.*" %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ page import="com.topcoder.dde.forum.*" %>

<%@ include file="/includes/forumUtils.jsp" %>
<%
    ForumSearchView searchResults = null;
    String keywords = request.getParameter("keywords");
    if (keywords == null) {
        keywords = "";
    }

    // If action is null, show advanced search form
    // If action is not null, try to do the search
    if (action != null) {

        if (keywords.trim().length() > 0) {
            debug.addMsg("search", "searching for " + keywords);
            searchResults = forumBean.search(forumId, keywords, null);
            if (searchResults != null) {
                debug.addMsg("forumsearch", "found " + searchResults.size() + " items");
            } else {
                debug.addMsg("forumsearch", "found 0 items");
            }
        }

    } else {
        debug.addMsg("forumsearch", "searching not performed");
    }
%>


<html>
<head>
    <title>TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
<script language="JavaScript" src="/scripts/javascript.js"></script>
</head>

<body class="body" marginheight="0" marginwidth="0">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp" >
                <jsp:param name="level1" value="forum"/>
                <jsp:param name="level2" value="customer"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <%@ include file="/includes/forumTitle.jsp" %>

            <table width="100%" cellpadding="0" cellspacing="1" border="0" class="forumBkgd">
<%  if (searchResults != null && searchResults.size() > 0) { %>
                    <tr valign="top">
                        <td width="2%" class="forumTitleCenter">New</td>

<%      if ( forumType == com.topcoder.dde.catalog.Forum.SPECIFICATION) { %>
                        <td width="98%" class="forumTitle">Developer Forum</td>

<%      } else { %>
                        <td width="98%" class="forumTitle">Customer Forum</td>

<%      } %>
                </tr>

<%      Iterator itr = searchResults.iterator();
        int row = 0;
        String oddeven;
        while (itr.hasNext()) {
            row++;
            oddeven = (row%2==0)?"Even":"Odd";
            ForumSearchResult fsr = (ForumSearchResult)itr.next();
            Collection path = fsr.getPath();

            Iterator pathItr = path.iterator();
            com.topcoder.forum.Forum forum = (pathItr.hasNext())? (com.topcoder.forum.Forum)pathItr.next() : null;
            Topic topic = (pathItr.hasNext())? (Topic)pathItr.next() : null;
            com.topcoder.forum.Thread thread = (pathItr.hasNext())? (com.topcoder.forum.Thread)pathItr.next() : null;
            Post post = (pathItr.hasNext())? (Post)pathItr.next() : null;
%>
                <tr valign="top">

<%          if (post != null) { %>
                    <td class="forumTextCenter<%=oddeven%>">

<%              if (post.getCreateTime() != null && newSinceTime < post.getCreateTime().getTime()) { %>
                            <img src="/images/iconRecentPosting.gif" alt="*" width="8" height="12" border="0" />

<%              } else { %>
                        &nbsp;

<%              } %>
                    </td>
                    <td class="forumText<%=oddeven%>"><p><strong>
                        <a href="c_forum_message.jsp?f=<%=forumId%>&r=<%=thread.getId()%>"><%=forumComponent.getName()%> &gt; <%=topic.getName()%> &gt; <%=thread.getSubject()%></a></strong></p>
                        <p><strong>Message posted on <%=dateFormat.format(post.getCreateTime())%>&nbsp;EST by&nbsp;<%=post.getUsername()%></strong></p>
                        <p><%= textToHtml(post.getText()) %></p>
                    </td>

<%          } else if (thread != null) { %>
                    <td class="forumTextCenter<%=oddeven%>">

<%              if (thread.getLastPostTime() != null && newSinceTime < thread.getLastPostTime().getTime() && thread.getNumPosts() > 0) { %>
                            <img src="/images/iconRecentPosting.gif" alt="*" width="8" height="12" border="0" />

<%              } else { %>
                            &nbsp;

<%              } %>
                        </td>
                        <td class="forumText<%=oddeven%>"><p><strong><a href="c_forum_message.jsp?f=<%=forumId%>&r=<%=thread.getId()%>"><%=forumComponent.getName()%> &gt; <%=topic.getName()%> &gt; <%=thread.getSubject()%></a></strong></p></td>

<%          } else if (topic != null) { %>
                    <td class="forumTextCenter<%=oddeven%>">

<%              if (topic.getLastPostTime() != null && newSinceTime < topic.getLastPostTime().getTime() && topic.getTotalPosts() > 0) { %>
                        <img src="/images/iconRecentPosting.gif" alt="*" width="8" height="12" border="0" />

<%              } else { %>
                            &nbsp;

<%              } %>
                        </td>
                    <td class="forumText<%=oddeven%>"><p><strong><a href="c_forum.jsp?f=<%=forumId%>"><%=forumComponent.getName()%> &gt; <%=topic.getName()%></a></strong></p></td>
<%          } %>
                </tr>

<%      }
    } else {
%>
                <tr valign="top"><td width="100%" class="forumTextOdd"><br>&nbsp;No results were found. Please try broadening your search criteria.<br>&nbsp;</td></tr>
<%  } %>
                <tr><td class="forumHeadFoot" colspan="2" height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0"/></td></tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td height="28"><img src="/images/taglineRecentPosting.gif" alt="* Recently posted message" width="182" height="28" border="0" /></td></tr>
            </table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 3 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</form>
</body>
</html>
