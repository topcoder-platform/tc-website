<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="results"/>
    <jsp:param name="tabLev3" value="sponsortrack"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">Results</span>
<br/><br/>
Congratulations to the winners from the Sponsor Track:
<br><br>

         <table width="350" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
            <tr>
               <td class="sidebarTitle">Place</td>
               <td class="sidebarTitle">Winner</td>
               <td class="sidebarTitle">Prize*</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>First</b></td> 
               <td class="sidebarText"><b>Relic</b></td>
               <td class="sidebarText"><b>$2,500 and a trip to VTS Finals</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText">Second</td> 
               <td class="sidebarText">Slavejovanovski</td>
               <td class="sidebarText">$1,500</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText">Third</td> 
               <td class="sidebarText">jwalzer</td>
               <td class="sidebarText">$750</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText" colspan="3">*Prize amounts are in US Dollars or country equivalent.</td> 
            </tr>
         </table>


            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <br/><br/><br/><br/><br/>
            To find out more detailed information about the VeriSign&#174; Code Fest, including a list of the
            prizes, please read the <a href="/pl/?&module=Static&d1=vicc&d2=rules">Terms and Conditions</a>.
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
