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
    <title>Google Code Jam China, Powered by TopCoder</title>
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
                    <jsp:include page="EN_links.jsp">
                        <jsp:param name="selectedTab" value="registration"/>
                    </jsp:include>
                </div>
                <br><br>

                <span class="bigTitle">Registration</span>
                <span valign=top>
         <jsp:include page="EN_right_reg.jsp"/>
         </span>

                <br><br>
                Registration will close on Friday, August 19 at 5:00PM EDT.<br/><br/>
                If you are <A
                    href="<%=sessionInfo.getSecureAbsoluteServletPath()%>?module=<%=Constants.GOOGLE_CHINA_05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=15857&<%=Constants.EVENT_ID%>=4"
                    class="bigRed">not currently a TopCoder member</A> or do not want to use an existing account, please
                click <a
                    href="<%=sessionInfo.getSecureAbsoluteServletPath()%>?module=<%=Constants.GOOGLE_CHINA_05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=15857&<%=Constants.EVENT_ID%>=4"
                    class="bigRed">here</a>.
                <br><br>
                If you are currently a TopCoder member, you may enter your handle and password below to convert your
                account for use in this year's Google Code Jam.<br/><br/>

                <form method="post" name="frmLogin" action="<%=sessionInfo.getSecureAbsoluteServletPath()%>">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_CHINA_05_LOGIN%>"/>
                    <input type="hidden" name="<%=Constants.EVENT_ID%>" value="4"/>
                    <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="15857"/>
                    <table border="0" cellpadding="3" cellspacing="0" align="center">
                        <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

                        <tr valign="top">
                            <td class="errorText" colspan="3" align="center">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/>
                                </tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr valign="middle">
                            <td nowrap class="bodyText" align="right">Handle:</td>
                            <td colspan="2" align="left"><input type="text" name="<%=Constants.HANDLE%>" value=""
                                                                maxlength="15" size="12"
                                                                onkeypress="submitEnter(event)"></td>
                        </tr>

                        <tr valign="middle">
                            <td nowrap class="bodyText" align="right">Password:</td>
                            <td align="left"><input type="password" name="<%=Constants.PASSWORD%>" value=""
                                                    maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
                            <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()"
                                                                       class="bodyText">Login&#160;&gt;</a></td>
                        </tr>
                        <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                    </table>
                    <p><br/></p>

                    <script>
                        document.frmLogin.<%=Constants.HANDLE%>.focus();
                    </script>

                </form>

                <br/><br/>
To find out more detailed information about the Google&#153; Code Jam China, including a list of the prizes, please read the
<a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Terms and Conditions</a>.
            </div>
        </td>
        <td width="49%">&#160;</td>
    <tr>
</table>
<jsp:include page="foot.jsp"/>
</body>
</html>