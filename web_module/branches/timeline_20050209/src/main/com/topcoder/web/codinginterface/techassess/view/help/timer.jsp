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

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="off"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT colspan=2>&#160;</td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- LEFT NAV --%>
            <td class=bodyNav>
            <jsp:include page="helpLeft.jsp" >
                <jsp:param name="selected" value="timer"/>
            </jsp:include>
            </td>

<%-- CONTENT --%>
            <td class=bodyContent>

            <p class=pL>
            <span class=bodyBigTitle>The Timer</span>
            <br /><br />
            The timer in the coding window will be always counting down to the end of the current testing phase.  Remember that there
            is variable latency between your computer and our servers.  For that reason, it is ALWAYS best to perform any submissions
            with at least 30 seconds left on the timer.
            <br><br>

            </p>

            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB colspan=2>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>