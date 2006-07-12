<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
<jsp:param name="tabLev3" value="bloomberg"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="left"><img src="/i/tournament/tccc06/bloomberg_logo.gif" alt="Bloomberg" border="0" /></div>
<br><br>
Bloomberg is proud to welcome the world's top programming talent to the
2006 Top Coder Collegiate Challenge.  This presents an opportunity to
test your programming skills against the best the world has to offer.
Good luck.
<br><br>
When the rush of competition is over and you are up to the challenge of
working with and not just competing against the best, you need to find
the right place to build your career.  Bloomberg is looking for the best
in programming talent.
<br><br>
When your main product is a 24 hr a day 365 day a year, real-time
worldwide financial information and trading system, you have no choice;
you need the best.
<br><br>
Are you up to the challenge?
<br><br>
<A href="/?t=sponsor&c=link&link=http://careers.bloomberg.com">careers.bloomberg.com</A>
<br><br><br><br><br><br><br><br><br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="bloomberg"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
