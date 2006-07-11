<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="aol"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
            <br>
<div align="center"><img src="/i/tournament/tccc06/aol_landing.jpg" alt="Wanna Be an All-American Coder?" border="0" /></div>
<br><br>

<%--<div align="center">
<a href="/?t=sponsor&c=link&link=http://developer.AOL.com/">Join AOL Developer Central</a>
&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=AOL_chat_031706">SRM 293 Chat Transcript</A>
&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=AOL_chat_040306">SRM 296 Chat Transcript</A>
</div>
<br><br>--%>
      </td>

<!-- Right Column-->
<td>&#160;</td>
<%--
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="aol"/>
            </jsp:include>
         </td>
--%>
   </tr>

</table>




<jsp:include page="../../foot.jsp" />
</body>

</html>