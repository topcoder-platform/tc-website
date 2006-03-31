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
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">Advancers</span>
<br/><br/>

         <table width="350" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
            <tr>
               <td class="sidebarTitle" width="125">Round</td>
               <td class="sidebarTitle" width="225">Advancers</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><a href="">SRM 1</a></td> <!--<a href="/pl/?&module=Static&d1=verisign06&d2=adv1">-->
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
