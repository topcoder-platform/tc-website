<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="tcTop.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>Contest Registration</h1>
                
                <div align="center">


                    <strong>Are you sure you want to register for this contest?</strong>
                    <br /><br />
                    Please be aware that you are NOT REGISTERED for the tournament that this contest is part of.
                    Registering for this contest will not register you for the tournament.
                    If you don't register for the tournament prior to registering for this contest,
                    it will not count in the tournament standings even if you sign up at a later date.
                    <br /><br />

                    <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.REG_CONFIRM%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.TERMS_AGREE%>" value="on"/>


                        <br /><br />
                        <a href="#" onclick="document.terms.submit()">Yes, register for this contest anyway</a>

                    </form>
                </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="tcFoot.jsp"/>

    </div>
</body>
</html>