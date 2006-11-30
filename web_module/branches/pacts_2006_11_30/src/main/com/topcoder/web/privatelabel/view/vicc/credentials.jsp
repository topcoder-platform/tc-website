<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>
<head>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
    <jsp:include page="../script.jsp"/>
</head>
<body>


<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="registration"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
        <div class="bodySpacer">

            <span class="bigTitle">Registration</span>
            <br><br>

            Please enter your email address below. You should receive an email shortly with your username and password.
            <br><br>

            <table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
                <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
                    <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VICC_CREDENTIALS%>"/>
                    <tr>
                        <td colspan="2" class="errorText" align="center">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/>
                            </tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="40%" nowrap class="bodyText">
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


            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <!-- Right Column-->
        <td width="180" align="right" style="padding: 0px 15px 0px 0px;">
            <jsp:include page="right.jsp"/>

        </td>

    </tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
