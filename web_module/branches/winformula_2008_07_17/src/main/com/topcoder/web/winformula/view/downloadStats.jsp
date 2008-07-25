<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>Winformula Developer Challenge :: Powered by TopCoder - Download Stats</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="compete" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
        
            <h1>Download stats...</h1>
            <div class="full-content">
                <p><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadFile&amp;<%=Constants.CONTEST_ID%>=<%=Constants.CONTEST_ID_DEFAULT%>&amp;<%=Constants.FILENAME%>=test.zip">
                 Test File</a></p>
            </div>
        
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>

    <div id="footer">
    <%-- Footer --%>
    </div>
    
<%-- End Wrapper --%>
</div>
</body>
</html>
