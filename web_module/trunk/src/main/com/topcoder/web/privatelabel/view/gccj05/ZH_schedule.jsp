<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
        <div class="greenBigBox">

            <%-- Tab bar links--%>
            <div align="center">
                <jsp:include page="ZH_links.jsp">
                    <jsp:param name="selectedTab" value="schedule"/>
                </jsp:include>
            </div>


            <br><br>
            <span class="bigTitle">竞赛日程</span>
            <span valign=top>
         <jsp:include page="ZH_right.jsp"/>
         </span>
            <br><br>

            <span class="greenSubtitle">入围赛
</span><br>
            <a name="sched"></a>
            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">赛事安排</td>
                    <td class="sidebarTitle" width="35%">日期和时间 *</td>
                    <td class="sidebarTitle" width="21%" align="center">参赛人数</td>
                    <td class="sidebarTitle" width="19%" align="center">晋级人数</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">入围赛
</td>
                    <td class="sidebarText" nowrap=nowrap>2005年12月12日中午至2005年12月13日中午<br></td>
                    <td class="sidebarText" align="center">所有合格注册者</td>
                    <td class="sidebarText" align="center">500</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="4">* 注意：以上时间皆为北京时间</td>
                </tr>
            </table>

            <br><br>
            <span class="greenSubtitle">在线淘汰赛</span><br>
            凡晋级至在线淘汰赛的参赛者都须在淘汰赛开赛前10分钟登陆TopCoder竞技场。各地区开赛时间以北京时间为准。未能准时参加此次在线赛事的参赛者，不论任何理由，他/她都将被作自动弃权处理。
            <br><br>

            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">赛事安排</td>
                    <td class="sidebarTitle" width="35%">日期和时间 *</td>
                    <td class="sidebarTitle" width="21%" align="center">参赛人数</td>
                    <td class="sidebarTitle" width="19%" align="center">晋级人数</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">在线第一轮</td>
                    <td class="sidebarText">12月19日，9:00 PM开始</td>
                    <td class="sidebarText" align="center">500</td>
                    <td class="sidebarText" align="center">250</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">在线第二轮</td>
                    <td class="sidebarText">2005年12月22日，9:00 PM开始</td>
                    <td class="sidebarText" align="center">250</td>
                    <td class="sidebarText" align="center">50</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="4">* 注意：以上时间皆为北京时间。如果当日在线赛事因故取消，赛事将在下一工作日的同一时间举行。</td>
                </tr>
            </table>

            <br><br>
            <span class="greenSubtitle">总决赛</span><br>
            最终50名精英参赛者将在中国举行的总决赛一决高下，具体地点待定。每位决赛选手须到现场参赛。
            <br><br>

            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">赛事轮次</td>
                    <td class="sidebarTitle" width="50%">日期和时间*</td>
                    <td class="sidebarTitle" width="25%" align="center">参赛人数</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">总决赛</td>
                    <td class="sidebarText">2006年1月20日，时间待定<br></td>
                    <td class="sidebarText" align="center">50</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3">* 注意：以上时间皆为北京时间。现场赛的时间视具体情况而定。</td>
                </tr>
            </table>

            <br><br>
            想要了解更多的 Google&#153; Code Jam - 中国编程挑战赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
        </div>
    </td>
    <td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>