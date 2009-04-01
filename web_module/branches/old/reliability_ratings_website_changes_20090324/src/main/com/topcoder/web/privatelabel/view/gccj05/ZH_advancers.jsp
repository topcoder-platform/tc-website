﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <title>Google&#153; Code Jam - 中国编程挑战赛, 竞赛软件由 Topcoder&#174;公司提供</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<table border="0" width=100% cellpadding=0 cellspacing=0>
    <tr>
        <td width="49%">&#160;</td>
        <td align="center">
            <table border="0" width=100% cellpadding=0 cellspacing=0>
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                            alt="Google Coder Jam China logo"></td>
                    <td width="49%"></td>
                </tr>
            </table>
        </td>
        <td width="49%"></td>
    </tr>
    <tr>
        <td width="49%">&#160;</td>
        <td>
            <div class=greenBigBox>

                <%-- Tab bar links--%>
                <div align="center">
                    <jsp:include page="ZH_links.jsp">
                        <jsp:param name="selectedTab" value="advancers"/>
                    </jsp:include>
                </div>

                <br><br>

                <span class="bigTitle">晋级</span>
                <span valign=top>
         <jsp:include page="ZH_right.jsp"/>
         </span>

                <br><br>

                <table class=tableFrame cellpadding=5 cellspacing=2 border="0" width="400">
                    <tr>
                        <td class="advancersTitle">轮次</td>
                        <td class="advancersTitle" align="right" width="100%">晋级</td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gccj05&d2=ZH_advQual" class="topLink">入围赛</a></td>
                        <td class="sidebarText" align="right"><a
                                href="/pl/?module=Static&d1=gccj05&d2=ZH_advQual">500</a></td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gccj05&d2=ZH_advRound1"
                                                      class="topLink">第一轮</a></td>
                        <td class="sidebarText" align="right"><a
                                href="/pl/?module=Static&d1=gccj05&d2=ZH_advRound1">250</a></td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gccj05&d2=ZH_advRound2"
                                                      class="topLink">第二轮</a></td>
                        <td class="sidebarText" align="right"><a
                                href="/pl/?module=Static&d1=gccj05&d2=ZH_advRound2">50</a></td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?module=Static&d1=gccj05&d2=ZH_advFinal"
                                                      class="topLink">现场总决赛</a></td>
                        <td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=gccj05&d2=ZH_advFinal">胜出者</a>
                        </td>
                    </tr>
                </table>


                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                To find out more detailed information about the Google Code Jam China, including a list of the prizes,
                please read the <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">Terms and Conditions</a>.
            </div>
        </td>
        <td width="49%">&#160;</td>
    <tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>
