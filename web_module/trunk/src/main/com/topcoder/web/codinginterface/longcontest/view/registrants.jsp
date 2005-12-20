<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String level2 = "topcoder";
   String image = "long_comps_topcoder";
    if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="topcoder_practice";
    } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="intel_practice";
        image = "long_comps_intel";
    } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
        level2="intel";
        image = "long_comps_intel";
    }
%>
<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                <jsp:param name="level2" value="<%=level2%>"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Registrants"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>

            <logic:notEmpty name="<%=Constants.MESSAGE%>">
                <tc-webtag:useBean id="message" type="java.lang.String" name="<%=Constants.MESSAGE%>" toScope="page"/>
                <span class="errorText"><%=message%></span><br>
            </logic:notEmpty>
            <logic:empty name="<%=Constants.MESSAGE%>">
                <jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
                <jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
                <jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
                <jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
                <jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
                <%
                    ResultSetContainer registrants = (ResultSetContainer) resultMap.get("long_contest_round_registrants");
                    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_round_registrants_info");
                    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) rsc.get(0);
                %>

                <span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/></span><br>
                <span class="bodySubtitle">Registrants: <rsc:item name="num_competitors" row="<%=infoRow%>"/></span><br>

               <div style="clear: both;" align="center">
                   <div class="pagingBox">
                       <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
                       </logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
                       &nbsp;|&nbsp;
                       <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink">
                       </logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty>
                   </div>
                </div>

                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                                <tr>
                                    <td class="tableTitle" colspan="6">Registrants</td>
                                </tr>
                                <tr>
                                    <td class="tableHeader" width="20%">
                                        <A href="<%=sortLinkBase%><tc-webtag:sort column="1"/>">Handle</A></td>
                                    <td class="tableHeader" width="20%">
                                        <A href="<%=sortLinkBase%><tc-webtag:sort column="4"/>">Country</A></td>
                                    <td class="tableHeader" width="10%">
                                        <A href="<%=sortLinkBase%><tc-webtag:sort column="2"/>">State</A></td>
                                    <td class="tableHeader" width="30%">
                                        <A href="<%=sortLinkBase%><tc-webtag:sort column="5"/>">School</A></td>
                                    <td class="tableHeader" width="20%">
                                        <A href="<%=sortLinkBase%><tc-webtag:sort column="3"/>">Default Language</A>
                                    </td>
                                </tr>
                                    <%-- ITERATOR --%>
                                <%boolean even = true;%>
                                <rsc:iterator list="<%=registrants%>" id="resultRow">
                                    <tr>
                                        <td class="<%=even?"statLt":"statDk"%>">
                                            <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>'/></td>
                                        <td class="<%=even?"statLt":"statDk"%>">
                                            <rsc:item name="country_name" row="<%=resultRow%>"/></td>
                                        <td class="<%=even?"statLt":"statDk"%>">
                                            <rsc:item name="state_code" row="<%=resultRow%>"/></td>
                                        <td class="<%=even?"statLt":"statDk"%>">
                                            <rsc:item name="school_name" row="<%=resultRow%>"/></td>
                                        <td class="<%=even?"statLt":"statDk"%>">
                                            <rsc:item name="language_name" row="<%=resultRow%>"/></td>
                                    </tr>
                                    <%even = !even;%>
                                </rsc:iterator>
                                    <%-- END ITERATOR --%>
                            </TABLE>
                        </TD>
                    </tr>
                </TABLE>

                <div class="pagingBox">
                    <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
                    </logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
                    &nbsp;|&nbsp;
                    <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink">
                    </logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty>
                </div>

            </logic:empty>

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