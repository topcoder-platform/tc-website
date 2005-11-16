<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
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
                        <jsp:param name="selectedTab" value="registration"/>
                    </jsp:include>
                </div>

                <br><br>
                <span class="bigTitle">注册</span>
                <span valign=top>
				 <jsp:include page="ZH_right_reg.jsp"/>
				 </span>
                <br><br>

                <div style="float: left;">
                    <b>第四步（共五步）</b>
                    <div class="regBreadOff">常规信息</div>
                    <div class="regBreadOff">人口统计信息</div>
                    <div class="regBreadOff">确认</div>
                    <div class="regBreadOn">成功</div>
                    <div class="regBreadOff">激活</div>
                </div>


                <table cellpadding="0" cellspacing="0" class="bodyText" align="center" border="0"
                       style="padding-right: 40px;">
                    <tr>
                        <td>
                            一封电子邮件将会被发送至注册时您提供的电子邮箱中。您必须按照那封电子邮件中的说明激活您的帐号才能参加Google Code Jam - 中国编程挑战赛。
                            <br><br>
                            <span class="bigRed">您将不能参加比赛如果您的帐号没有被激活。</span>
                            <br><br>
                            点击上面的竞技场小标签可以进入竞技场。请在资格赛前花一些时间在训练室内熟悉环境。
                            <br><br>
                            如果您遇到任何问题，请通过如下电子邮箱地址联系我们： <A
                                href="mailto:gcjc@topcoder.com?subject=Question regarding Google Code Jam China">gcjc@topcoder.com</A>.
                            <br><br>
                            祝您在竞技场中好运!
                        </td>
                    </tr>
                </table>

                <br><br>
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