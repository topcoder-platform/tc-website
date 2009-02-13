<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tchs07.RegistrationBase" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title>
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;"/>

        <jsp:include page="links.jsp">
            <jsp:param name="tabLev1" value="rules"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
            <h2>Registration</h2>

            <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCHS07SubmitRegistration"/>


                <p align="left">To complete your registration for the 2007 TopCoder&#174; High School Tournament you
                    must <b>read and agree to</b> the terms listed below.</p>

                <div align="center">
                    <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tchs07&d3=termsContent&<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.TCHS07_TERMS_OF_USE_ID%>"></iframe>
                </div>
                <br/><br/>


                <p align="center">
                    <tc-webtag:errorIterator id="err" name="<%=RegistrationBase.AGE%>"><span class="bigRed">${err}
                        <br/></span></tc-webtag:errorIterator>
                    How old are you? <tc-webtag:textInput name="<%=RegistrationBase.AGE%>" size="3" maxlength="3"/>
                </p>


                <p align="center">
                    <tc-webtag:errorIterator id="err" name="<%=RegistrationBase.IN_COLLEGE%>"><span class="bigRed">${err}
                        <br/></span></tc-webtag:errorIterator>
                    Are you enrolled full time at a college or university? <tc-webtag:listSelect name='<%=RegistrationBase.IN_COLLEGE%>' list="<%=RegistrationBase.YES_NO_ANSWERS%>"/>
                </p>

                <p align="center">
                    <tc-webtag:errorIterator id="err" name="<%=RegistrationBase.IN_HIGH_SCHOOL%>"><span class="bigRed">${err}
                        <br/></span></tc-webtag:errorIterator>
                    Are you enrolled full time at a secondary school? <tc-webtag:listSelect name='<%=RegistrationBase.IN_HIGH_SCHOOL%>' list="<%=RegistrationBase.YES_NO_ANSWERS%>"/>
                </p>


                <div align="center">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">
                        <span class="bigRed">${err}</span>
                        <br/></tc-webtag:errorIterator>
                    <br/>
                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                    I agree
                </div>

                <div align="center">
                    <button name="submit" value="submit" type="submit">Submit</button>
                </div>

            </form>

        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body>
</html>

