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
<map name="aol">
<area shape="rect" alt="" coords="436,442,530,455" href="/?t=sponsor&c=link&link=http://developer.aol.com" target="_blank" />
<area shape="rect" alt="" coords="489,515,595,527" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_recruiting" />
</map>
<div align="center"><IMG SRC="/i/tournament/tccc06/aol_landing.gif" border="0" ALT="Wanna Be an All-Star Coder" usemap="#aol"/></div>
<br><br>
<div class="bodySpacer">
<span class="smallText">This tournament is brought to you by TopCoder, Inc. (<A href="/">http://www.topcoder.com/</A>) 703 Hebron Avenue, Glastonbury, CT 06033. AOL LLC is not responsible for any aspect of the Tournament.</span>
</div>
<br><br>
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