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
<jsp:param name="tabLev3" value="ubs"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
<div class="spacerUBS">
<br>
<img src="/i/tournament/tccc06/ubs_logo.gif" align="left" alt="UBS" border="0" />
</div>
<br><br><br>
<div class="bodySpacer">
UBS is pleased to sponsor the 2006 TopCoder Collegiate Challenge. UBS, one of the largest financial services firms in the world, is a leader in equities, corporate finance, M&amp;A advisory and financing, financial structuring, fixed income issuance and trading, foreign exchange, derivatives and risk management.
<br><br>
The global financial markets are increasingly electronic and trading in these markets presents a unique combination of technical and trading challenges. We are looking for developers to join our team that can work on advanced trading algorithms, build the underlying infrastructure to trade with milliseconds of latency and integrate access to a wide range of global products.
<br><br>
At UBS, you'll have access to the resources and expertise of a global firm while enjoying the flexibility and autonomy of a start-up. The technology we build is responsible for trading every 1 in 9 shares globally*, managing trillions of dollars in assets, and trading across nearly every product and region around the globe.
<br><br>
Become part of our exciting future at UBS. There are positions for extraordinary coders in our offices all over the world. <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ubs_confirm">Apply Now</a>
<br><br>
<b>You &amp; Us. UBS.</b>
<br><br>
<a href="/?t=sponsor&c=link&link=http://www.ubs.com" target="_blank">www.ubs.com</a>
<br><br>
<span class="smallText">* source: AutEx and a leading private industry survey 2005</span>
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
<td>&#160;</td>
<%--
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="ubs"/>
            </jsp:include>
         </td>
--%>      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
