<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gcjsa07.css"/>
    <title>Google Code Jam Latin America 2007, Powered by TopCoder</title>
    <jsp:include page="../script.jsp"/>
</head>

<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center">
                        <img border=0 src="/i/events/gcjsa07/codejamlogo.png" alt="Google Code Jam logo"></td>
                    <td width="49%"></td>
                </tr>
            </table>
        </td>
    </tr>

    <!-- Tab bar links-->
    <tr>
        <td>
            <div align="center">
                <jsp:include page="links.jsp">
                    <jsp:param name="selectedTab" value="registration"/>
                </jsp:include>
                <br/>
            </div>
        </td>
    </tr>

    <tr>

        <!-- content -->
        <td>
            <div align="center">
                <div class="pageLayout" align="left">

         <span valign="top">
         <jsp:include page="right_reg.jsp"/>
         </span>

                    <span class="bigBluetitle">Registration</span>
                    <br><br>

                    Please enter your email address below. You should receive an email shortly with your username and
                    password.
                    <br><br>

                    <table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
                        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="GET" name="regForm">
                            <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
                            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_LATIN_AMERICA_07_CREDENTIALS%>"/>
                            <tr>
                                <td colspan="2" class="errorText" align="center">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/>
                                    </tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="40%" nowrap>
                                    Email Address
                                </td>
                                <td width="60%">
                                    <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="20" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><a href="javascript: document.regForm.submit();">Send Email</a></td>
                            </tr>
                        </form>
                    </table>


                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <br><br><br><br><br><br><br>
                    To find out more detailed information about the Google&#153; Code Jam 2006, please read the
                    <a href="/pl/?module=Static&d1=gcjsa07&d2=rules">Terms and Conditions</a>.
                    <br><br>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div align="center">
                <jsp:include page="foot.jsp"/>
            </div>
        </td>
    </tr>

</table>
</body>
</html>