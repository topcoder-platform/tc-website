<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
           		 java.util.Iterator,
                 java.util.Enumeration"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top_forums.jsp" >
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
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>

        Hello.

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>