<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<script src="/js/tcscript.js" type="text/javascript"></script>
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
            
<span class="bigTitle">TCCC06 Webcast - Chapter <c:out value="${param['clip']}" escapeXml="true"/></span>

<br><br>
<c:if test='${param.clip == "1"}'>
previous chapter
</c:if>
<c:if test='${param.clip > "1"}'>
<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=<c:out value="${param['clip']-1}" escapeXml="true"/>">previous chapter</A>
</c:if>
<c:if test='${param.clip == "8"}'>
 | next chapter
</c:if>
<c:if test='${param.clip < "8"}'>
 | <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=<c:out value="${param['clip']+1}" escapeXml="true"/>">next chapter</A>
</c:if>

<div align="left" style="margin-top: 20px;">

<script language="JavaScript">
var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="254" id="webcast" align="middle">'
+ '<param name="allowScriptAccess" value="always" />'
+ '<param name="movie" value="/flash/media/video_3x2.swf?app=webcast&clip=part<c:out value="${param['clip']}" escapeXml="true"/>" />'
+ '<param name="quality" value="high" />'
+ '<param name="bgcolor" value="#083A3A" />'
+ '<param name="allowFullScreen" value="true" />'
+ '<embed src="/flash/media/video_3x2.swf?app=webcast&clip=part<c:out value="${param['clip']}" escapeXml="true"/>" quality="high" bgcolor="#083A3A" allowFullScreen="true" width="320" height="254" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
+ '</object>';

doWrite(s);
</script>

</div>
<br><br>
<tc-webtag:forumLink forumID="506218" message="Discuss the webcast" />

        </div>
      </td>
        
         
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
