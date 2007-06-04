<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    String time = StringUtils.checkNull((String) request.getAttribute("time"));
%>
<c:set var="row" value="<%=rsr%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Contest Details"/>
    </jsp:include>

<div align="center">
    <table style="margin-top: 20px; margin-bottom: 20px;" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td style="padding: 0px 5px 10px 0px;" align="center" width="50%">
                    <a class="bigButton" style="width: 130px;"
                       href="/longcontest/?module=ViewReg&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}">Register/Submit</a>
                    <%--<div class="bigButton" style="width: 100px;">Register</div>--%>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding-top: 10px;" align="center">
                    Register to get info necessary to submit a solution<br/>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="sectionHeader">Competition Overview</div>

<p>
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer justo dui, pharetra sed, ornare a, luctus sed,
    lacus. Vivamus nonummy. Ut bibendum nisi quis lacus. Nunc eu lacus sit amet urna vehicula vestibulum. Maecenas
    laoreet nunc. Nulla facilisi. Proin sem. Praesent nisl arcu, lobortis non, molestie nec, gravida ac, ipsum. Aenean
    ornare nibh a nulla. Fusce dignissim, sem pulvinar adipiscing faucibus, pede dui laoreet ligula, in hendrerit nunc
    lorem id dui. Maecenas ante.
</p>

<p>
    Morbi ut nibh vel justo placerat posuere. Etiam ac sem a elit posuere gravida. Curabitur commodo nulla vitae massa.
    Fusce tincidunt tincidunt arcu. Proin interdum consequat diam. Pellentesque metus nisl, consectetuer quis, viverra
    non, imperdiet at, nibh. Maecenas imperdiet, arcu sit amet condimentum viverra, tortor elit ornare urna, eu interdum
    nulla nulla quis augue. Nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse
    potenti. Nam a sem et ante pulvinar sollicitudin.
</p>

<p>
    Nulla metus. Nullam malesuada quam. Curabitur convallis aliquet dui. Nulla augue nulla, elementum nec, commodo eget,
    vulputate et, diam. Vivamus commodo, dui sed mollis rhoncus, augue est hendrerit sapien, et scelerisque augue enim
    at sem. Morbi vel sem sed nisl facilisis tincidunt. Vestibulum nec est. Vestibulum ante ipsum primis in faucibus
    orci luctus et ultrices posuere cubilia Curae; Fusce ut mi. Mauris sollicitudin lacinia velit. Curabitur sed arcu.
    Vivamus ipsum. Ut ullamcorper felis hendrerit pede. Cras felis eros, convallis non, pretium ac, interdum id, dui.
    Praesent hendrerit consectetuer massa. Vestibulum laoreet. Donec sollicitudin vehicula turpis. Quisque eget nisi et
    dolor porta ultricies.
</p>

<div class="sectionHeader">Prizes</div>

<p>
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer justo dui, pharetra sed, ornare a, luctus sed,
    lacus. Vivamus nonummy. Ut bibendum nisi quis lacus. Nunc eu lacus sit amet urna vehicula vestibulum. Maecenas
    laoreet nunc. Nulla facilisi. Proin sem. Praesent nisl arcu, lobortis non, molestie nec, gravida ac, ipsum. Aenean
    ornare nibh a nulla. Fusce dignissim, sem pulvinar adipiscing faucibus, pede dui laoreet ligula, in hendrerit nunc
    lorem id dui. Maecenas ante.
</p>

<div class="sectionHeader">Timeline</div>

<div align="center" style="margin: 20px;">
    <table cellpadding="0" cellspacing="0" style="width: 180px;">
        <tbody>
            <tr>
                <td align="center" colspan="2" style="border-bottom: 1px solid #999999;">
                    <strong>Registration &amp; Submission</strong>
                </td>
            </tr>
            <tr>
                <td width="100%" align="left">
                    <strong>Opens:</strong>
                </td>
                <td align="center" nowrap="nowrap">
                    <rsc:item name="reg_start_time" row="<%=rsr%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Closes:</strong>
                </td>
                <td align="center" nowrap="nowrap">
                    <rsc:item name="reg_end_time" row="<%=rsr%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<h2 align="center">
    <a href="?<%=Constants.MODULE_KEY%>=MatchRules&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}" class="bcLink">Rules & Regulations</a>
</h2>



            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>