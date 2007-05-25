<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Active Assembly Competitions</span>
            </div>
            
            <div class="breadcrumb">
                <div style="float:left;"><A href="/?module=Static&amp;d1=competitions">Competitions</A> >&nbsp;</div>
                <div style="float:left; margin-bottom: 10px;">
                <strong>Active Assembly Competitions</strong><br>
                <A href="/?module=Static&d1=assembly&d2=pastContests">Past Assembly Competitions</A>
                </div>
            </div>

            <br style="clear: both;" />

            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%; margin-bottom: 120px;">
                <thead>
                    <tr>
                        <td class="title" colspan="7"><span class="title">Competitions</span></td>
                    </tr>
                    <tr>
                        <td class="header" width="100%">
                            Project
                        </td>
                        <td class="headerC" nowrap="nowrap">
                            Registration opens
                        </td>
                        <td class="headerC" nowrap="nowrap">
                            Submit by
                        </td>
                        <td class="headerR">
                            Prize
                        </td>
                        <td class="headerC">
                            Registrants
                        </td>
                        <td class="headerC">
                            Submissions
                        </td>
                        <td class="header">&nbsp;</td>
                    </tr>
                    <% boolean even = true;%>
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <A href="/?module=Static&d1=assembly&d2=msSessionManifestDetails">Microsoft Session Manifest Tool</A>
                        </td>
                        <td class="valueC" nowrap="nowrap">
                             <strong>05.22.2007</strong><br>16:00 EST
                        </td>
                        <td class="valueC" nowrap="nowrap">
                             <strong>06.05.2007</strong><br>17:00 EST
                        </td>
                        <td class="valueR" nowrap="nowrap">
                            <span class="bigRed">$6,000.00</span>
                        </td>
                        <td class="valueC">
                            14
                        </td>
                        <td class="valueC">
                            0
                        </td>
                        <td class="valueR" nowrap="nowrap">
                            <%--registration closed--%>
                            <A href="/?module=SecureStatic&d1=assembly&d2=reg" class="button" style="margin: 4px;">Register</A>
                            <A href="/?module=Static&d1=assembly&d2=orIntro" class="button" style="margin: 4px;">Submit</A>
                        </td>
                    </tr>
                    <% even = !even;%>

<%--
                <tr class="light">

                    <td class="valueC" colspan="7">
                        <div align="center" style="margin: 40px 0px 40px 0px;">
                            There are currently no active contests, but check back soon.<br>
                            In the meantime, take a look at our <A href="/?module=Static&d1=assembly&d2=pastContests">Past Competitions</A>.
                        </div>
                    </td>
                </tr>
--%>

                </tbody>
            </table>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>