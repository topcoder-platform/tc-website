<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Download the Data</title>
    <%-- Meta Tags --%>
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
        
        
            <h1>Download the Data</h1>
            <div class="full-content">
                <p>Your algorithm should be programmed in such a way that it can take these statistical data and a list of a week's matchups and output a prediction for the  score of each game.</p>
                <p>Use these data to build your algorithm and check back each week as the lateset data will be available.</p>
                <h2><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadFile&amp;<%=Constants.CONTEST_ID%>=<%=Constants.CONTEST_ID_DEFAULT%>&amp;<%=Constants.FILENAME%>=stats.zip">Download Now</a></h2>
                <p>(Right-click and choose &quot;Save Target As...&quot; (IE) or &quot;Save Link As...&quot; (Firefox))</p>
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
