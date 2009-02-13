<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.SubmitAlgoRegistration" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="component"/>
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value="rules"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <!-- Body-->
    <tr valign=top>
        <td valign=top align=center>
            <div class=bodySpacer>

                <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCCC06ComponentTermsAgree"/>

                    <p class=bigTitle>Registration</p>

                    <p align="left">To complete your registration for the 2006 TopCoder Collegiate Challenge you must
                        <b>read
                            and agree to</b> the terms listed below.</p>

                    <div align="center">
                        <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tccc06&d3=terms_content&<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.TCCC06_COMPONENT_TERMS_OF_USE_ID%>"></iframe>
                    </div>

                    <p align="center">
                        <tc-webtag:chkBox name="<%=SubmitAlgoRegistration.AOL_SURVEY%>"/> Yes, I would like to
                        participate
                        in an AOL&#174; research survey. By participating in the survey and
                        providing my TopCoder handle, I understand that I will be entered into a raffle for a 60GB Apple
                        iPod.
                    </p>

                    <p align="center">
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                        <br></tc-webtag:errorIterator></span>
                        <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_AGREE%>"/>I agree
                    </p>

                    <button name="submit" value="submit" type="submit">Submit</button>
                </form>
            </div>
        </td>

        <!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
                <jsp:param name="level1" value="all"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>

</body>

</html>
