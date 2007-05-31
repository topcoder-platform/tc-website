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
                <A href="/?module=Static&d1=assembly&d2=activeContests">Active Assembly Competitions</A><br>
                <strong>Past Assembly Competitions</strong>
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
                        <td class="header">
                            Winner
                        </td>
                        <td class="headerC">
                            Registrants
                        </td>
                        <td class="headerC">
                            Submissions
                        </td>
                        <td class="headerR">
                            Prize
                        </td>
                        <td class="headerC" nowrap="nowrap">
                            Start Date
                        </td>
                        <td class="headerC">
                            End Date
                        </td>
                    </tr>
                    <% boolean even = true;%>
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <A href="/?module=Static&d1=assembly&d2=btBusinessDetails">BT Business CSF Mashup Assembly Competition</A>
                        </td>
                        <td class="value">
                            <strong>dsdirect</strong>
                        </td>
                        <td class="valueC">
                            31
                        </td>
                        <td class="valueC">
                            3
                        </td>
                        <td class="valueR" nowrap="nowrap">
                            $6,750.00
                        </td>
                        <td class="valueC" nowrap="nowrap">
                             <strong>04.10.2007</strong><br>16:00 EST
                        </td>
                        <td class="valueC" nowrap="nowrap">
                             <strong>04.23.2007</strong><br>17:00 EST
                        </td>
                    </tr>
                    <% even = !even;%>
                </tbody>
            </table>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>