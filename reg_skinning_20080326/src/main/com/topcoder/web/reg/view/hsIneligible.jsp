<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <reg_tags:style/>
</head>


<body>

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div id="pageAligner" align="center">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>

        <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
            <input type="hidden" name="module" value="HsIneligible" />

            <div align="center">
        <c:choose>
            <c:when test="${not registeredComp and not requestedComp}"> 
                <p>
                    Sorry, you are ineligible for HS.
                </p>
                <p>
                    Would you like to register for our post-HS competitions instead?
                </p>
                <p>
                    <input type="submit" name="continue" value="Yes" />
                    <input type="submit" name="continue" value="No" />
                </p>
           </c:when>
            <c:when test="${not registeredComp and requestedComp}"> 
                <p>
                    Sorry, you are ineligible for HS.
                </p>
                <p>
                    Continue to register for post-HS competitions?
                </p>
                <p>
                    <input type="submit" name="continue" value="Yes" />
                    <input type="submit" name="continue" value="No" />
                </p>
           </c:when>
            <c:when test="${registeredComp}"> 
                <p>
                    Sorry, you are ineligible for HS.
                </p>
                <p>
                    <input type="submit" name="continue" value="Cancel" />
                </p>
           </c:when>
                
             </c:choose>
            </div>

        </form>

    </div>
</div>

</body>
</html>
