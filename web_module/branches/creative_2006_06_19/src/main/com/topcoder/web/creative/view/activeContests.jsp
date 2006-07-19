<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>
</head>

<body>

<jsp:include page="creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="creativeLeft.jsp">
    <jsp:param name="node" value="active_contests"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <div class="breadcrumb">
            Active Contests
        </div>

        <h1>Active Contests</h1>


        <h2 align="right">Need help? Learn how to <strong><A href="">get started</A></strong></h2>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="6">Active Contests</td>
                    </tr>
                    <tr>
                        <td class="header" colspan="2">Project</td>
                        <td class="headerC">Registration ends</td>
                        <td class="headerC">Submissions</td>
                        <td class="headerR">Payment</td>
                        <td class="headerC">Submit by</td>
                    </tr>
                    <% boolean even = true;%>
                    <rsc:iterator list="<%=contests%>" id="resultRow">
                        <tr class="<%=even?"dark":"light"%>">
                            <td class="value"><A href="/?module=Static&d1=projectDetails">
                                <rsc:item name="name" row="<%=resultRow%>"/></A></td>
                            <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">
                                Register /
                                Submit</button></td>
                            <td class="valueC">
                                <rsc:item name="start_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                            <td class="valueC">0</td>
                            <td class="valueR">$1,600.00</td>
                            <td class="valueC">
                                <rsc:item name="end_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                        </tr>
                        <% even = !even;%>
                    </rsc:iterator>
                </tbody>
            </table>
        </div>

        <jsp:include page="creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
