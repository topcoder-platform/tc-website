<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="scoreHash" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageColLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageColLink" class="java.lang.String" scope="request"/>
<%
    ResultSetContainer coders = (ResultSetContainer) resultMap.get("long_contest_test_results_coders");
    ResultSetContainer cases = (ResultSetContainer) resultMap.get("long_contest_test_results_cases");
    ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_overview_info");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) rsc.get(0);
%>
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
<STYLE TYPE="text/css">
.scrollUp
{
padding-bottom: 5px;
text-align: center;
}
.scrollDown
{
padding-top: 5px;
text-align: center;
}
.scrollLeft
{
padding-right: 5px;
text-align: right;
}
.scrollRight
{
padding-left: 5px;
text-align: left;
}
</STYLE>
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
                <jsp:param name="title" value="System Test Results"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>

            <span class="bigHandle">Contest: <A href="?module=ViewOverview&rd=<rsc:item name="round_id" row="<%=infoRow%>"/>" class="bcLink"><rsc:item name="contest_name" row="<%=infoRow%>"/></A></span><br>
            <span class="bodySubtitle">Registrants: <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=infoRow%>"/>" class="bcLink">
                <rsc:item name="num_registrants" row="<%=infoRow%>"/></A></span><br>
            <span class="bodySubtitle">Competitors: <rsc:item name="num_competitors" row="<%=infoRow%>"/></span><br>

            <div class="pagingBox">&#160;</div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="bodyText">
               <tr><td class="scrollUp" colspan="3">
                  <logic:notEmpty name="prevPageLink">
                  <a href="<%=prevPageLink%>"><img src="/i/interface/btn_tableScroll_U.gif" alt="UP" border="0" /></A>
                  </logic:notEmpty>
               </td></tr>
                <tr>
                     <td class="scrollLeft">
                        <logic:notEmpty name="prevPageColLink">
                        <a href="<%=prevPageColLink%>" class="bcLink"><img src="/i/interface/btn_tableScroll_L.gif" alt="LEFT" border="0" /></A>
                        </logic:notEmpty>
                     </td>
                    <td class="statTableHolder" width="100%">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                            <tr>
                                <td class="tableTitle" colspan="<%=cases.getRowCount()+2%>">System Test Results</td>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="1%">
                                    <A href="<%=sortLinkBase%>&<%=DataAccessConstants.SORT_COLUMN%>=1&<%=DataAccessConstants.SORT_DIRECTION%>=<%=("1".equals(request.getParameter(DataAccessConstants.SORT_COLUMN))&&!"desc".equals(request.getParameter(DataAccessConstants.SORT_DIRECTION)))?"desc":"asc"%>">Handle</A>
                                </td>
                                <td class="tableHeader" align="right" width="1%">
                                    <A href="<%=sortLinkBase%>&<%=DataAccessConstants.SORT_COLUMN%>=2&<%=DataAccessConstants.SORT_DIRECTION%>=<%=("2".equals(request.getParameter(DataAccessConstants.SORT_COLUMN))&&!"asc".equals(request.getParameter(DataAccessConstants.SORT_DIRECTION)))?"asc":"desc"%>">Score</A>
                                </td>
                                <rsc:iterator list="<%=cases%>" id="resultRow">
                                    <% String sortDir = "desc"; %>
                                    <logic:equal parameter="<%=Constants.TEST_CASE_ID%>" value="<%=resultRow.getStringItem("test_case_id")%>">
                                        <logic:equal parameter="<%=DataAccessConstants.SORT_COLUMN%>" value="3">
                                            <logic:notEqual parameter="<%=DataAccessConstants.SORT_DIRECTION%>" value="asc">
                                                <% sortDir = "asc"; %>
                                            </logic:notEqual>
                                        </logic:equal>
                                    </logic:equal>
                                    <td class="tableHeader" align="right" nowrap="nowrap">
                                        <A href="<%=sortLinkBase%>&<%=DataAccessConstants.SORT_COLUMN%>=3&<%=DataAccessConstants.SORT_DIRECTION%>=<%=sortDir%>&<%=Constants.TEST_CASE_ID%>=<rsc:item name="test_case_id" row="<%=resultRow%>"/>">Test
                                            <br>Case <rsc:item name="rank" row="<%=resultRow%>"/></A><br>
                                        <span style="font-weight: normal;">(<A href="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>?module=ViewSystemTest&<%=Constants.TEST_CASE_ID%>=<rsc:item name="test_case_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<%=request.getParameter(Constants.PROBLEM_ID)%>">details</A>)</span>
                                    </td>
                                </rsc:iterator>
                            </tr>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=coders%>" id="coderRow">
                                <% String style = even ? "statLt" : "statDk";
                                    even = !even; %>
                                <logic:equal parameter="<%=Constants.CODER_ID%>" value="<%=coderRow.getStringItem("coder_id")%>">
                                    <% style = "statHighlight"; %>
                                </logic:equal>
                                <tr align="right">
                                    <td class="<%=style%>" align="left" nowrap="nowrap">
                                        <tc-webtag:handle coderId='<%=coderRow.getLongItem("coder_id")%>'/></td>
                                    <td class="<%=style%>">
                                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSubmissionHistory&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<%=request.getParameter(Constants.PROBLEM_ID)%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=coderRow%>"/>" class="statLink">
                                            <rsc:item name="point_total" row="<%=coderRow%>" format="0.00"/></a></td>
                                    <rsc:iterator list="<%=cases%>" id="caseRow">
                                        <td class="<%=style%>">
                                            <tc-webtag:format object="<%=scoreHash.get(coderRow.getItem("coder_id") + "_" + caseRow.getItem("test_case_id"))%>" ifNull="--"/></td>
                                    </rsc:iterator>
                                </tr>
                            </rsc:iterator>
                        </TABLE>
                    </TD>
                     <td class="scrollRight">
                        <logic:notEmpty name="nextPageColLink">
                        <a href="<%=nextPageColLink%>"><img src="/i/interface/btn_tableScroll_R.gif" alt="RIGHT" border="0"/></A>
                        </logic:notEmpty>
                     </td>
                </tr>
              <tr>
                  <td class="scrollDown" colspan="3">
                     <logic:notEmpty name="nextPageLink">
                     <a href="<%=nextPageLink%>"><img src="/i/interface/btn_tableScroll_D.gif" alt="Down" border="0" /></A>
                     </logic:notEmpty>
                  </td></tr>
             </TABLE>

            <div class="pagingBox">&#160;</div>

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