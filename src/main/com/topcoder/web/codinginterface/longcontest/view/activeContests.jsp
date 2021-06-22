<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.model.LongContest"

        %>
<%@ page import="com.topcoder.web.common.model.algo.RoundType" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>
  <%
         // New location to be redirected
         String site = new String("https://www.topcoder.com/challenges/?filter[tracks][data_science]=true");
         response.setStatus(response.SC_MOVED_PERMANENTLY);
         response.setHeader("Location", site);
  %>

</body>

</html>
