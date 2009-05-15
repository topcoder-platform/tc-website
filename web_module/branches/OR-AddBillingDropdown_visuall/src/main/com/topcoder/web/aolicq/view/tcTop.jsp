<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%@ page import="com.topcoder.web.aolicq.model.ContestProperty" %>
<%@ page import="com.topcoder.web.aolicq.model.PrizeType" %>
<%@ page import="com.topcoder.web.aolicq.model.ReviewStatus" %>
<%@ page import="com.topcoder.web.aolicq.model.SubmissionStatus" %>
<%@ page import="com.topcoder.web.aolicq.model.SubmissionType" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<script type="text/javascript" src="/js/popup.js"></script>

