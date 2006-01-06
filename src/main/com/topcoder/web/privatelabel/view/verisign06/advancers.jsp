<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
<title>VeriSign Coder Challenge 2006, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body bgcolor="#FFF">

<table align="left" cellspacing="0" cellpadding="0" valign="top" width="760">
   <tr>
      <td colspan="2" align="right" valign="top" style="padding: 2px 0px 0px 0px;">
	    <a href="http://www.verisign.com/index.html" class="VStop">US Home</a> &#160;&#160; | &#160;&#160;
		<a href="http://www.verisign.com/verisign-worldwide/index.html" class="VStop">Worldwide Sites</a> &#160;&#160; | &#160;&#160;
	    <a href="http://www.verisign.com/site-map/index.html" class="VStop">Site Map</a>					
	  </td>
   </tr>      
   <tr>
      <td align="left" valign="top"><a href="http://www.verisign.com/index.html"><img border=0 src="/i/events/verisign06/www_vrsn_logo.gif" alt="VeriSign, Inc.&#0174;"></a></td>
      <td align="left" valign="bottom"><img border=0 src="/i/events/verisign06/connectionline.gif" alt=""></td>
   </tr>
   
<!-- Tab bar links-->
   <tr>
      <td colspan="2">
         <div align="left">
         <jsp:include page="links.jsp" >
         <jsp:param name="selectedTab" value="advancers"/>
         </jsp:include>
         </div>
      </td>
    </tr>

<!-- main content -->

    <tr>
      <td align="left" valign="top" colspan="2" style="padding: 0px 0px 0px 20px;">

         <span valign=top><jsp:include page="right.jsp" /></span>
         <br/><br/><br/>
         
         <span class="blkBigHead">Advancers</span>
         <br/><br/>

         <table class="tableFrame" cellpadding="5" cellspacing="2">
         <tr>
         <td class="advancersTitle" width="125">Round</td>
         <td class="advancersTitle" width="225" align="right">Advancers</td>
         </tr>
         <tr valign="top">
         <td class="advancersRound" width="125"><a href="/pl/?&module=Static&d1=verisign06&d2=advQual" class="advRound">Qualification Round</a></td>
         <td class="sidebarText" width="225" align="right"><a href="/pl/?&module=Static&d1=verisign06&d2=advQual" class="VStop">100</a></td>
         </tr>
         <tr valign="top">
         <td class="advancersRound" width="125"><a href="/pl/?&module=Static&d1=verisign06&d2=advRd1" class="advRound">Online Round 1</a></td>
         <td class="sidebarText" width="225" align="right"><a href="/pl/?&module=Static&d1=verisign06&d2=advRd1" class="VStop">50</a></td>
         </tr>
         <tr valign="top">
         <td class="advancersRound" width="125"><a href="/pl/?&module=Static&d1=verisign06&d2=advRd2" class="advRound">Online Round 2</a></td>
         <td class="sidebarText" width="225" align="right"><a href="/pl/?&module=Static&d1=verisign06&d2=advRd2" class="VStop">25</a></td>
         </tr>
         <tr valign="top">
         <td class="advancersRound" width="125"><a href="/pl/?&module=Static&d1=verisign06&d2=advRd3" class="advRound">Online Round 3</a></td>
         <td class="sidebarText" width="225" align="right"><a href="/pl/?&module=Static&d1=verisign06&d2=advRd2" class="VStop">10</a></td>
         </tr>
         <tr valign="top">
         <td class="advancersRound" width="125"><a href="/pl/?&module=Static&d1=verisign06&d2=advWinners" class="advRound">Final Round</a></td>
         <td class="sidebarText" width="225" align="right"><a href="/pl/?&module=Static&d1=verisign06&d2=advWinners" class="VStop">Winners</a></td>
         </tr>
         </table>


         <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
         To find out more detailed information about the VeriSign&#153; Coder Challenge 2006, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=verisign06&d2=rules">Terms and Conditions</a>.
      </td>
   <tr>
   <tr><td colspan="2">&#160;</td></tr>
   <tr><td colspan="2"><jsp:include page="foot.jsp" /></td></tr>
</table>
</body>
</html>