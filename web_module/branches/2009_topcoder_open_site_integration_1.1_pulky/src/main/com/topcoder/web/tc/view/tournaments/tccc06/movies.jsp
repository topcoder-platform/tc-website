<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="movies"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Onsite Movies</span>

<br><br>
<span class="bodySubtitle">Webcast</span><br>
Requires Flash 7 or higher:
<br><br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=1">Chapter 1</A></strong> (26:27)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=2">Chapter 2</A></strong> (28:48)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=3">Chapter 3</A></strong> (30:37)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=4">Chapter 4</A></strong> (29:46)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=5">Chapter 5</A></strong> (32:31)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=6">Chapter 6</A></strong> (29:54)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=7">Chapter 7</A></strong> (26:22)<br>
<strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=8">Chapter 8</A></strong> (25:27)
<br><br>
<tc-webtag:forumLink forumID="506218" message="Discuss the webcast" />

<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
