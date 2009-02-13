<%  response.setHeader( "Expires", "Sat, 6 May 1995 12:00:00 GMT" );
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
    response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
    response.setHeader( "Pragma", "no-cache" ); %>

<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.WatchManager,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.action.util.Paginator,
                 java.util.Iterator,
                 java.util.Enumeration,
                 com.jivesoftware.forum.ForumPermissions,
                 com.topcoder.web.forums.model.TCAuthFactory,
                 com.jivesoftware.base.AuthToken"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
<title>TopCoder Software Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tcs_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="includes/top.jsp"/>
<jsp:include page="includes/menu.jsp">
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180" class="leftColumn">
        <jsp:include page="includes/left.jsp" >
            <jsp:param name="level1" value="forum"/>
            <jsp:param name="level2" value="all"/>
        </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>
			
			The attachment has been successfully removed.
            
         <br><br><br>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="includes/foot.jsp" />

</body>

</html>