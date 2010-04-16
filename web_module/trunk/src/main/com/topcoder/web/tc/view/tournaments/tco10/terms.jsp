<%--
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 *
  JSP renders the form for registration to 2010 TCO event and terms of use to be accepted by
 * registrants.
 *
 * Author TCSDEVELOPER
 * Version 1.0 (2010 TCO WebSite Release assembly v1.0)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.web.common.model.Event,
                 com.topcoder.web.tc.Constants" %>
<%@ include file="includes/taglibs.jsp" %>

<c:set var="event" value="${requestScope.event}"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="TERMS_OF_USE_ID" value="<%=Constants.TERMS_OF_USE_ID%>"/>

<tco10:pageSetup title="TCO 10 : Registration" area="overview"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <div class="bigColumn">
                    <div class="text">
                        <h2 class="pageTitle">Registration</h2>

                        <form name="terms" method="post" action="/tco10">
                            <input name="module" value="SubmitUnifiedRegistration" type="hidden"/>
                            <p align="center">To complete your registration for the
                                <c:out value="${event.description}"/> you must
                                <br/><strong>read and agree to</strong> the terms listed below.</p>

                            <div align="center">
                                <p>
                                <iframe width="600" height="300" marginwidth="5"
                                        src="/tc?module=Static&amp;d1=tournaments&amp;d2=tco10&amp;d3=termsContent&${TERMS_OF_USE_ID}=${event.terms.id}"></iframe>
                                </p>
                            </div>
                            <div align="center">
                                <p>
                                    <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}">
                                        <span class="bigRed">${err}</span>
                                        &nbsp;<br />
                                    </tc-webtag:errorIterator>
                                    <tc-webtag:chkBox name="${TERMS_AGREE}"/>
                                    I agree
                                </p>
                            </div>
                            <div align="center">
                                <button name="submit" value="submit" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>

                <jsp:include page="includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
