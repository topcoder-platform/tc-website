<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.BaseProcessor"%>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >

<script type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
        document.loginForm.submit();
        return false;
    } else return true;
}
</script>

</head>
<body onLoad="Javascript:document.loginForm.<%=Constants.HANDLE%>.focus();">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />


    <table class=bodyCenter cellspacing=0 cellpadding=0>
        <tr>
            <td align=center>

                <jsp:include page="tabs.jsp" >
                    <jsp:param name="tabLev1" value="login"/>
                </jsp:include>

                <jsp:include page="time.jsp" >
                    <jsp:param name="timer" value="off"/>
                </jsp:include>

                <table cellspacing=0 cellpadding=0 class=bodyTable>
                    <tr>
                        <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
                        <td class=bodyT>&#160;</td>
                        <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
                    </tr>
                    <tr>
                        <td class=bodyL>&#160;</td>
                        <td class=bodyContent>
                            <p class=pL>
                                <span class=bodyBigTitle>Welcome to the Testing Application.</span>
                                <br/><br/>
                                Please login to the Technical Assessment Tool below.  Your ID and PASSWORD are in the email that contained the link to this page.
                                <br/><br/>
                            </p>

                            <form action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>" method=post name=loginForm target="_top">
                                <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="<%=Constants.RP_LOGIN%>"/>
                                <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
                                <table width="400" cellspacing=0 cellpadding=0 border=0 class=tableFrame>
                                    <tr>
                                        <td class=tableTitle colspan=2>Login</td>
                                    </tr>
                                    <tr><td class=tableText colspan=2><p class=pC><span class=bigRed><tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator></span></p></td></tr>
                                    <tr>
                                        <td class=loginLeft>Login:</td>
                                        <td class=loginRight><tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="100" onKeyPress="submitEnter(event)"/></td>
                                    </tr>
                                    <tr><td class=tableText colspan=2><p class=pC><span class=bigRed><tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator></span></p></td></tr>
                                    <tr>
                                        <td class=loginLeft>Password:</td>
                                        <td class=loginRight><tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15" maxlength="15" onKeyPress="submitEnter(event)"/></td>
                                    </tr>
                                    <tr>
                                        <td class=tableText align=right>&#160;</td>
                                        <td class=loginRight><a href="javascript: document.loginForm.submit();"><img src="/i/corp/screening/buttonGo.gif" alt=""/></a></td>
                                    </tr>
                                    <tr><td class=tableText colspan=2>&#160;</td></tr>
                                </table>
                        </td>
                        <td class=bodyR>&#160;</td>
                    </tr>
                    <tr>
                        <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
                        <td class=bodyB>&#160;</td>
                        <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</body>
</html>




