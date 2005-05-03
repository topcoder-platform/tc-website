<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

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
<tr><td class="rtbc"><A href="forums/" class="rtbcLink">Round Tables</A> >> <A href="/" class="rtbcLink"><%=forum.getName()%></A></td>
<td class="rtbc" align="right"><b><< PREV&#160;&#160;&#160;[ 1 <A href="/">2</A> <A href="/">3</A> ]&#160;&#160;&#160;<A href="/">NEXT>></A></b></td></tr>
</table>

<table cellpadding="0" cellspacing="0" class="rtTable">
<tr>
<td class="rtHeader" width="70%">Topic</td>
<td class="rtHeader" width="10%">Author</td>
<td class="rtHeader" width="10%">Replies</td>
<td class="rtHeader" width="10%">Views</td>
<td class="rtHeader" align="center" colspan="2">Last Post</td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkNew">WebWork UI taglib elements broken on Jive 3.2.3?</A>  [ <A href="/" class="rtLinkNew">1</A> <A href="/" class="rtLinkNew">2</A> ]</td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
<td class="rtThreadCell">27</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkNew">Search only shows some messages</A>  [ <A href="/" class="rtLinkNew">1</A> <A href="/" class="rtLinkNew">2</A> ]</td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
<td class="rtThreadCell">22</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">How to participate in forum?</A></td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">1</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">Search not support Chinses?</A></td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">1</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">Does this question work on your forums?</A></td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">1</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">i cant EDIT or DELETE Announcements ... WHY ??</A>  [ <A href="/" class="rtLinkOld">1</A> <A href="/" class="rtLinkOld">2</A> <A href="/" class="rtLinkOld">3</A> <A href="/" class="rtLinkOld">4</A> ]</td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">46</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkNew">WebWork UI taglib elements broken on Jive 3.2.3?</A>  [ <A href="/" class="rtLinkNew">1</A> <A href="/" class="rtLinkNew">2</A> ]</td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
<td class="rtThreadCell">27</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkNew">Search only shows some messages</A>  [ <A href="/" class="rtLinkNew">1</A> <A href="/" class="rtLinkNew">2</A> ]</td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
<td class="rtThreadCell">22</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell"><A href="/" class="coderTextBlue">dane_avilla</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">How to participate in forum?</A></td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">1</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">Search not support Chinses?</A></td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">1</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">Does this question work on your forums?</A></td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">1</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
<tr>
<td class="rtThreadCellWrap"><A href="/" class="rtLinkOld">i cant EDIT or DELETE Announcements ... WHY ??</A>  [ <A href="/" class="rtLinkOld">1</A> <A href="/" class="rtLinkOld">2</A> <A href="/" class="rtLinkOld">3</A> <A href="/" class="rtLinkOld">4</A> ]</td>
<td class="rtThreadCell"><A href="/" class="coderTextGreen">mike_ddorf</A></td>
<td class="rtThreadCell">46</td>
<td class="rtThreadCell">123</td>
<td class="rtThreadCell"><b>Feb 2, 2005 6:52 PM</b></td>
<td class="rtThreadCell">by: <A href="/" class="coderTextRed">coral9527</A></td>
</tr>
</table>
<br><br>
A thread with a <b>bold title</b> indicates it is either a new thread or has new postings.

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
