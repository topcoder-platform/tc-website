<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                java.util.Date"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<%
    ResultSetContainer submissions = (ResultSetContainer) resultMap.get("long_coder_submissions");
    ResultSetContainer tmp = (ResultSetContainer) resultMap.get("long_contest_over");
    
    boolean over = tmp.getBooleanItem(0, 0);
    boolean self = !submissions.isEmpty() && submissions.getLongItem(0, "coder_id")==sessionInfo.getUserId();
    boolean collab = resultMap.containsKey("long_collab_round");
%>
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
            <jsp:param name="node" value="m_long_contests"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <td class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Submission History"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>
            <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br/>                
            <span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>

            <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId='<%=request.getParameter(Constants.CODER_ID)%>'/></span>
            <br />
            <br />
            <div style="clear: both;" align="left">
                Scores for submissions prior to the current submission are displayed for historic purposes only, they
                are not updated.  A score is locked once a competitor makes another submission.  The current submission score
                will continue to be updated as long as it remains the most recent submission.
            </div>

            <div style="clear: both;" align="center">
               <div class="pagingBox">
                   <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
                   </logic:notEmpty>&lt;&lt; prev<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
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
                                <td class="tableTitle" colspan="4">Submissions: ${infoRow.map['num_submissions']}</td>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="20%">
                                    <a href="<%=sortLinkBase%><tc-webtag:sort column="4"/>">Submission</a></td>
                                <td class="tableHeader" width="20%" align="center">
                                    <a href="<%=sortLinkBase%><tc-webtag:sort column="5"/>">Time</a></td>
                                <td class="tableHeader" width="20%" align="right">
                                    <a href="<%=sortLinkBase%><tc-webtag:sort column="6"/>">Score</a></td>
                                <td class="tableHeader" width="20%" align="center">
                                    <a href="<%=sortLinkBase%><tc-webtag:sort column="<%=submissions.getColumnIndex("language_name")%>"/>">Language</a></td>
                            </tr>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=submissions%>" id="resultRow">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>">
                                    <% if (over||self||collab) { %>
                                       <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemSolution&amp;<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&amp;<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&amp;<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>" class="statLink">
                                    <% } %>
                                        <rsc:item name="submission_number" row="<%=resultRow%>"/>
                                    <% if (over||self) { %>
                                       </a>
                                    <% } %>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                        <tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right">
                                        <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/><%=resultRow.getIntItem("status_id")==130?"*":""%></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <rsc:item name="language_name" row="<%=resultRow%>"/></td>
                                </tr>
                                <%even = !even;%>
                            </rsc:iterator>
                        </table>
                    </td>
                </tr>
            </table>
            <p>* Indicates that this submission has not yet been scored</p>

            <div class="pagingBox">
                <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink">
                </logic:notEmpty>&lt;&lt; prev<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
                &nbsp;|&nbsp;
                <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink">
                </logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty>
            </div>

        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt="" /></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>