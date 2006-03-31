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
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">Advancers</span>
<br/><br/>

            <table class="tableFrame" cellpadding="5" cellspacing="2">
                <tr>
                    <td class="advancersTitle" width="125">Round</td>
                    <td class="advancersTitle" width="225" align="right">Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="advancersRound" width="125">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advQual" class="advRound">Qualification Round</a>
                    </td>
                    <td class="sidebarText" width="225" align="right">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advQual" class="VStop">100</a></td>
                </tr>
                <tr valign="top">
                    <td class="advancersRound" width="125">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advRd1" class="advRound">Online Round 1</a></td>
                    <td class="sidebarText" width="225" align="right">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advRd1" class="VStop">50</a></td>
                </tr>
                <tr valign="top">
                    <td class="advancersRound" width="125">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advRd2" class="advRound">Online Round 2</a></td>
                    <td class="sidebarText" width="225" align="right">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advRd2" class="VStop">25</a></td>
                </tr>
                <tr valign="top">
                    <td class="advancersRound" width="125">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advRd3" class="advRound">Online Round 3</a></td>
                    <td class="sidebarText" width="225" align="right">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advRd2" class="VStop">10</a></td>
                </tr>
                <tr valign="top">
                    <td class="advancersRound" width="125">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advWinners" class="advRound">Final Round</a></td>
                    <td class="sidebarText" width="225" align="right">
                        <a href="/pl/?&module=Static&d1=verisign06&d2=advWinners" class="VStop">Winners</a></td>
                </tr>
            </table>


            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <br/><br/><br/><br/><br/>
            To find out more detailed information about the VeriSign&#174; Iternal Coding Competition, including a list of the
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
