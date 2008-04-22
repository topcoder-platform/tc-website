<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Internal Coding Competition, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="results"/>
    <jsp:param name="tabLev3" value="srm2"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">Results</span>
<br/><br/>
Congratulations to the following winners from SRM 2:
<br><br>
1st Place, $1,500 and a trip to the VTS Finals:&#160;<b>vdods</b>
<br><br>
2nd Place, $750 and a trip to the VTS Finals:&#160;<b>joseki</b>
<br><br>
3rd Place and $500:&#160;<b>stacy</b>
<br><br>
Best of luck to <b>vdods</b> and <b>joseki</b>! They will join <b>Relic</b>, the VeriSign Sponsor Track Winner, along with <b>pegli</b> and <b>hksantosh</b>, the winners of SRM 1, at the VeriSign Technical Symposium (VTS) June 11 - 13, 2006, for the final showdown.


<!--
         <table width="350" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
            <tr>
               <td class="sidebarTitle" width="125">Round</td>
               <td class="sidebarTitle" width="225">Advancers</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><a href="">SRM 1</a></td> <a href="/pl/?&module=Static&d1=verisign06&d2=adv1">
               <td class="sidebarText" align="right">100</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><a href="">SRM 2</a></td>
               <td class="sidebarText" align="right">5</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><a href="">Championship Round</a></td>
               <td class="sidebarText" align="right">1</td>
            </tr>
         </table>
-->

            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <br/><br/><br/><br/><br/>
            To find out more detailed information about the VeriSign&#174; Internal Coding Competition, including a list of the
            prizes, please read the <a href="/pl/?&module=Static&d1=verisign06&d2=rules">Terms and Conditions</a>.
        </div>    
      </td>


<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
    <jsp:include page="right.jsp"/>

</td>

</tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
