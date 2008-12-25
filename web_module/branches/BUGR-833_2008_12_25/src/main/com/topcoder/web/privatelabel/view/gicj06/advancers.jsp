﻿<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gicj06.css"/>
    <title>Google Code Jam India, Powered by TopCoder</title>
</head>

<body>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gicj06/logo_CodeJam.gif" alt="Google Code Jam India logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
<td width="49%">&#160;</td>
<td>
<div class="greenBigBox">

<!-- Tab bar links-->
<div align="center">
    <jsp:include page="links.jsp">
        <jsp:param name="selectedTab" value="advancers"/>
    </jsp:include>
</div>

<br><br>
<span valign="top">
<jsp:include page="right.jsp"/>
</span>
<span class="bigTitle">Advancers</span>
                <br><br>
                <table class="tableFrame" cellpadding="5" cellspacing="2" border="0" width="400" style="margin-bottom:500px;">
                    <tr>
                        <td class="advancersTitle">Round</td>
                        <td class="advancersTitle" align="right" width="100%">Advancers</td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gicj06&d2=advQual" class="topLink">Qualification
                            Round</a></td>
                        <td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=gicj06&d2=advQual">500</a></td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gicj06&d2=advRound1" class="topLink">Round 1</a></td>
                        <td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=gicj06&d2=advRound1">50</a></td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gicj06&d2=advFinal" class="topLink">Onsite Finals</a></td>
                        <td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=gicj06&d2=advFinal">Winners</a>
                        </td>
                    </tr>
                </table>

To find out more detailed information about Google&#153; Code Jam India, including a list of the prizes, please read the
<a href="/pl/?module=Static&d1=gicj06&d2=rules">Terms and Conditions</a>.
            </div>
        </td>
        <td width="49%">&#160;</td>
    <tr>
</table>
<jsp:include page="foot.jsp"/>
</body>
</html>
