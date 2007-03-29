<%@ page import="com.topcoder.web.tc.controller.request.util.SubmitBallBug" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

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
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
<%-- SAMPLE TABLE --%>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="mainForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitBallBug"/>


<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin-bottom: 40px;">
<thead>
    <tr>
        <td class="title" colspan="2">
        Report a bug
        </td>
    </tr>
</thead>
<tbody>

    <tr class="light">
        <td class="value" nowrap="nowrap" style="border-top: none; vertical-align: middle;" colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=SubmitBallBug.BUG_DESC%>"><span class="bigRed"><%=err%><br /></span></tc-webtag:errorIterator>
        </td>
    </tr>


    <tr class="light">
        <td class="value" nowrap="nowrap" style="border-top: none; vertical-align: middle;">
            Bug description:
        </td>
        <td class="value" style="border-top: none;">
            <tc-webtag:textArea name="<%=SubmitBallBug.BUG_DESC%>" rows="6" cols="40"/>
        </td>
    </tr>
        <tr class="light">
        <td class="value" nowrap="nowrap" style="border-top: none; vertical-align: middle;" colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=SubmitBallBug.HOW_TO%>"><span class="bigRed"><%=err%><br /></span></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr class="light">
        <td class="value" nowrap="nowrap" style="border-top: none; vertical-align: middle;">
            How to reproduce bug:
        </td>
        <td class="value" style="border-top: none;">
            <tc-webtag:textArea name="<%=SubmitBallBug.HOW_TO%>" rows="6" cols="40"/>
        </td>
    </tr>
    <tr class="light">
        <td class="valueC" colspan="2" style="border-top: none;">
            <button name="submit" value="submit" type="submit" style="margin-top: 10px;">Submit</button>
        </td>
    </tr>
</tbody>
</table>
</form>

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