<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
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

                <!-- Tab bar links-->
                <div align="center">
                    <jsp:include page="ZH_links.jsp">
                        <jsp:param name="selectedTab" value="registration"/>
                    </jsp:include>
                </div>

                <br><br>
                <span class="bigTitle">Activation Successful!</span>
                <span valign=top>
         <jsp:include page="ZH_right_reg.jsp"/>
         </span>
                <br><br>

                <div style="float: left;">
                    <b>Step 5 of 5</b>
                    <div class="regBreadOff">General</div>
                    <div class="regBreadOff">Demographics</div>
                    <div class="regBreadOff">Confirm</div>
                    <div class="regBreadOff">Success</div>
                    <div class="regBreadOn">Activation</div>
                </div>


                <table cellpadding="0" cellspacing="0" class="bodyText" align="center" border="0"
                       style="padding-right: 40px;">
                    <tr>
                        <td>
                            You may practice for the contest by clicking the Competition Arena link above.
                            <br><br>
                            If you encounter any problems, please contact us at <A
                                href="mailto:gcjc@topcoder.com?subject=Question regarding Google Code Jam China">gcjc@topcoder.com</A>.

                            <br><br>
                            To find out more detailed information about the Google Code Jam China, including a list of
                            the prizes, please read the <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">Terms and
                            Conditions</a>.
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