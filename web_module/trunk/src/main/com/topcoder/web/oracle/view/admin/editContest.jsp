<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp">
    <jsp:param name="section" value="admin"/>
</jsp:include>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">back to
    Contests</A></div>

<h1>Edit Contest Details</h1>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminEditContest"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<div class="header">Contest Details</div>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>
<tr>
    <td colspan="2">
      <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_NAME%>"><span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Contest Name:
    </td>
    <td class="value" width="100%">
        <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
    </td>
</tr>
<tr>
    <td colspan="2">
                <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_STATUS_ID%>"><span class="bigRed">${err}
                    <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Status:
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="<%=Constants.CONTEST_STATUS_ID%>" list="${contestStatuses}" valueField="id"
                                textField="description"/>
    </td>
</tr>
</tbody>
    </table>
    </form>
    <p>
        <button name="submit" value="submit" type="submit">Save</button>
    </p>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>
