<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Competitions</span>
            </div>

            <div align="center" style="margin: 20px 0px 40px 0px;">
                <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                    <tbody>
                        <tr>
                            <td style="padding-right: 20px; background: transparent url(/i/layout/dotsVertical.png) top right repeat-y;">
                                <A href="/?module=ViewActiveContests"><img src="/i/layout/btnCreative.png" alt="Creative"/></A>
                            </td>
                            <td style="padding-left: 20px;">
                                <A href="/?module=Static&d1=assembly&d2=activeContests"><img src="/i/layout/btnAssembly.png" alt="Assembly"/></A>
                                <%--
                                <img src="/i/layout/btnAssemblyNA.png" alt=""/>
                                --%>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>