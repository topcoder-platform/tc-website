<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
      <jsp:param name="tabLev1" value="login"/>
      </jsp:include>

      <jsp:include page="time.jsp" >
      <jsp:param name="probTimer" value="off"/>
      </jsp:include>

     <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT>&#160;</td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- CONTENT --%>
            <td class=bodyContent>
            <p class=pL>
            <span class=bodyBigTitle>Coding Room</span>
            <br/><br/>

            <iframe src="/i/corp/screening/probState.html" width="100%" height="200px" scrolling="auto" frameborder="1">
            [Your user agent does not support frames or is currently configured not to display frames. However, you may visit <A href="foo.html">the related document.</A>]
            </iframe>

            <br/><br/>

            <textarea width="100%" height="200x" style="width:100%;height:200px" name="code" wrap="logical" rows="21" cols="42"></textarea>

            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>