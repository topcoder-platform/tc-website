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
            <td class=bodyT colspan=2><img src="/i/corp/screening/clear.gif" alt=""/></td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- LEFT NAV --%>
            <td class=bodyNav>
            <jsp:include page="helpLeft.jsp" >
                <jsp:param name="selected" value="resources"/>
            </jsp:include>
            </td>

<%-- CONTENT --%>
            <td class=bodyContent>

            <p class=pL>
            <span class=bodyBigTitle>Resources</span>
            <br /><br />


            <span class="bodySmallTitle">Java</span><br />
            <a href="http://java.sun.com/j2se/1.4.2/docs/api/index.html">http://java.sun.com/j2se/1.4.2/docs/api/index.html</a>
            <br /><br />
            <span class="bodySmallTitle">C++</span><br />
            <a href="http://www.sgi.com/tech/stl/">http://www.sgi.com/tech/stl/</a>
            <br /><br />
            <span class="bodySmallTitle">C#</span><br />
            <a href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/cpref_start.asp">http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/cpref_start.asp</a>
            <br /><br />
            <span class="bodySmallTitle">Visual Basic</span><br />
            <a href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/cpref_start.asp">http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/cpref_start.asp</a>

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