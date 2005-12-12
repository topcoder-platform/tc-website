<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="long_contests"/>
                <jsp:param name="level2" value="topcoder_practice"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="long_comps_topcoder"/>
                <jsp:param name="title" value="Practice Contests"/>
            </jsp:include>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                            <tr>
                                <td class="tableTitle" colspan="6">Practice Contests</td>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="20%">Contest</td>
<%--
                                <td class="tableHeader" width="20%" align="right">Registrants</td>
--%>
                                <td class="tableHeader" width="20%" align="right">Competitors</td>
                                <td class="tableHeader" width="20%">&#160;</td>
                                <td class="tableHeader" width="20%">&#160;</td>
                            </tr>

                            <%boolean even = true;%>

                            <logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>"><b>
                                        <tc-webtag:beanWrite name="contest" property="contestName"/></b></td>
<%--
                                    <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 35px;">
                                        <A href="registrants page" class="statLink">
                                            <tc-webtag:beanWrite name="contest" property="numRegistrants"/></A></td>
--%>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 35px;">
                                            <tc-webtag:beanWrite name="contest" property="numCompetitors"/></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>">submit</A>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>">standings</A>
                                    </td>
                                </tr>
                                <%even = !even;%>
                            </logic:iterate>
                        </TABLE>
                    </TD>
                </tr>
            </TABLE>


        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>