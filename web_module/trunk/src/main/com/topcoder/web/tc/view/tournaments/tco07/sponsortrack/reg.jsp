<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="sponsortrack"/>
                    <jsp:param name="tabLev2" value="register"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                   <%-- <img src="/i/tournament/tco07/competitorsbanner.jpg" alt="Competitors" />--%>
                    <div id="pageBody">
                        <h1><div>Registration</div></h1>

                <p>The registration period is from 9:00AM EDT (GMT/UTC -4) on Monday, March 12 to 6:00PM EDT (GMT/UTC -4) on Tuesday, March 27, 2007</p>
                <p>You must be logged into your TopCoder account in order to register for this competition.</p>
                <p></p>

                <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCO07SponsorTermsAgree"/>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%>
                        <br/></tc-webtag:errorIterator><br/></span>
                    <b>Company name:</b>&#160;&#160;
                    <br/>
                    <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="30" maxlength="100"/>
                    <br/><br/>

                    <div align="center">
                        <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tccc06&d3=spon_reg_content"></iframe>
                        <p align="center">
<span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
    <br></tc-webtag:errorIterator></span>
                            <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>I agree
                        </p>
                        <%--
                                                <c:choose>
                                                    <c:when test="${sessionInfo.anonymous}">
                                                        In order to register, you must first
                                                        <a href="/tc?module=Login&amp;nextpage=/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=spon_reg">login</a>.
                                                    </c:when>
                                                    <c:otherwise>
                        --%>
                        <button name="submit" value="submit" type="submit">Submit</button>
                        <%--
                                                    </c:otherwise>
                                                </c:choose>
                        --%>
                        <br/><br/>
                    </div>
                </form>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
