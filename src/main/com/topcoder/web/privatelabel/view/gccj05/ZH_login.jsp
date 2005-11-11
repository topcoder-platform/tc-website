<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google&#153; Code Jam - 中国编程挑战赛, 竞赛软件由 Topcoder&#174;公司提供</title>
</head>

<body>

<SCRIPT type="text/javascript">
    function submitEnter(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            document.frmLogin.submit();
            return false;
        } else return true;
    }
</SCRIPT>

<table border=0 width=100% cellpadding=0 cellspacing=0>
    <tr>
        <td width="49%">&#160;</td>
        <td align=center>
            <table border=0 width=100% cellpadding=0 cellspacing=0>
                <tr>
                    <td width="49%"></td>
                    <td valign=bottom align=center><img border=0 src="/i/events/gccj05/gcjc_logo.gif"
                                                        alt="Google Code Jam logo"></td>
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
                <div align=center>
                    <jsp:include page="ZH_links.jsp">
                        <jsp:param name="selectedTab" value="registration"/>
                    </jsp:include>
                </div>


                <br><br>

                <div style="float: left">
                <span class="bigTitle">注册</span>
                </div>

                <div style="float: right">
                    <jsp:include page="right_reg.jsp"/>
                </div>
                <br><br>
                注册截止日期：美国东部时间八月十九日星期五下午5点整<br/><br/>
				如果您<A href="">还不是TopCoder成员</A>或者不想使用现有帐号，请点击<A href="">这里</A>。
                <br><br>
                如果您已经是TopCoder成员，在下面输入帐号名和密码后，您的TopCoder帐号将可以直接在今年的Google编程挑战赛中使用。<br/><br/>

                <form method="post" name="frmLogin" action="<%=sessionInfo.getSecureAbsoluteServletPath()%>">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_CHINA_05_LOGIN%>">
                    <input type="hidden" name="<%=Constants.EVENT_ID%>" value="4">
                    <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="15857">
                    <table border="0" cellpadding="3" cellspacing="0" align="center">
                        <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

                        <tr valign="top">
                            <td class="errorText" colspan="3" align="center">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/>
                                </tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr valign="middle">
                            <td nowrap class="bodyText" align="right">帐号：</td>
                            <td colspan="2" align="left"><input type="text" name="<%=Constants.HANDLE%>" value=""
                                                                maxlength="15" size="12"
                                                                onkeypress="submitEnter(event)"></td>
                        </tr>

                        <tr valign="middle">
                            <td nowrap class="bodyText" align="right">密码：</td>
                            <td align="left"><input type="password" name="<%=Constants.PASSWORD%>" value=""
                                                    maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
                            <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()"
                                                                       class="bodyText">登录 ></a></td>
                        </tr>
                        <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                    </table>
                    <p><br/></p>

                    <script>
                        document.frmLogin.<%=Constants.HANDLE%>.focus();
                    </script>

                </form>

                <br/><br/>
                想要了解更多的 Google&#153; Code Jam - 中国编程挑战赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
            </div>
        </td>
        <td width="49%">&#160;</td>
    <tr>
</table>
<jsp:include page="foot.jsp"/>
</body>
</html>