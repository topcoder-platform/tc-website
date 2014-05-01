<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
     if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID || roundType==Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_practice";
     } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_practice";
         image = "long_comps_intel";
     } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_compete";
         image = "long_comps_intel";
     }
%>
<html>
<head>
    <title>TopCoder</title>
<jsp:include page="script.jsp" />
<jsp:include page="style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
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
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="node" value="<%=myNode%>"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <td class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Registrants"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;font-size: 13px">

                <a href="/longcontest/?module=ViewProblemStatement&amp;<%=Constants.ROUND_ID%>=${infoRow.map['round_id']}&amp;<%=Constants.COMPONENT_ID%>=${infoRow.map['component_id']}">Problem Statement</a>

                &nbsp;|&nbsp;

                <a href="/tc?module=MatchDetails&amp;<%=Constants.ROUND_ID%>=${infoRow.map['round_id']}">Register & Rules</a>

                &nbsp;|&nbsp;

                <a href="/longcontest/?module=ViewStandings&amp;<%=Constants.ROUND_ID%>=${infoRow.map['round_id']}">Standings</a>

                &nbsp;|&nbsp;

                <a href="https://apps.topcoder.com/forums/?module=ThreadList&forumID=${infoRow.map['forum_id']}">Forum</a>

               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>

            <logic:notEmpty name="<%=Constants.MESSAGE%>">
                <tc-webtag:useBean id="message" type="java.lang.String" name="<%=Constants.MESSAGE%>" toScope="page"/>
                <span class="errorText"><%=message%></span><br/>
            </logic:notEmpty>
            <logic:empty name="<%=Constants.MESSAGE%>">
                <jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
                <jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
                <jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
                <jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
                <%
                    ResultSetContainer registrants = (ResultSetContainer) resultMap.get("long_contest_round_registrants");
                %>
                
                <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br>                
                <span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>
                
                <span class="bodySubtitle">Registrants: ${infoRow.map['num_competitors']}</span><br>

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
                                            <tc-webtag:handle context='marathon_match' coderId='<%=resultRow.getLongItem("coder_id")%>'/></td>
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
