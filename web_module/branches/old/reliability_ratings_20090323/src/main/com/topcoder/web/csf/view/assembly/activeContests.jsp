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
<%--
                    <% boolean even = true;%>
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <A href="/?module=Static&d1=assembly&d2=btWorkspaceDetails">British Telecom Workspace</A>
                        </td>
                        <td class="valueC" nowrap="nowrap">
                             <strong>08.28.2007</strong><br>17:00 EDT
                        </td>
                        <td class="valueC" nowrap="nowrap">
                             <strong>09.12.2007</strong><br>17:00 EDT
                        </td>
                        <td class="valueR" nowrap="nowrap">
                            $7,000.00
                        </td>
                        <td class="valueC">
                            14
                        </td>
                        <td class="valueC">
                            0
                        </td>
                        <td class="valueR" nowrap="nowrap">
                            <A href="/?module=SecureStatic&d1=assembly&d2=reg2" class="button" style="margin: 4px;">Register</A>
                            <A href="/?module=Static&d1=assembly&d2=orIntro" class="button" style="margin: 4px;">Submit</A>
                        </td>
                    </tr>
                    <% even = !even;%>
--%>

                <tr class="light">

                    <td class="valueC" colspan="7">
                        <div align="center" style="margin: 40px 0px 40px 0px;">
                            There are currently no active contests, but check back soon.<br>
                            In the meantime, take a look at our <A href="/?module=Static&d1=assembly&d2=pastContests">Past Competitions</A>.
                        </div>
                    </td>
                </tr>

                </tbody>
            </table>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>