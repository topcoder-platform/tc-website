<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                java.util.Date"

        %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<%
    ResultSetContainer examples = (ResultSetContainer) resultMap.get("long_coder_examples");
    ResultSetContainer tmp = (ResultSetContainer) resultMap.get("long_contest_over");
    boolean over = tmp.getBooleanItem(0, 0);
    boolean self = !examples.isEmpty() && examples.getLongItem(0, "coder_id")==sessionInfo.getUserId();
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
            <script type="text/javascript">
            function next() {
            var myForm = document.exampleForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
            }
            function previous() {
            var myForm = document.exampleForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
            }
        </script>
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
                <jsp:param name="title" value="Example History"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>
                <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br>                
                <span class="bodySubtitle">Problem: <mm:problemLink roundId="${infoRow.map['round_id']}" problemId="${infoRow.map['problem_id']}" problemName="${infoRow.map['problem_name']}" /> </span><br/>
            <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId='<%=request.getParameter(Constants.CODER_ID)%>'/></span>
            <br/>

            <form name="exampleForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.NUMBER_RECORDS%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="ViewExampleHistory"/>

            <div style="clear: both;" align="center">
               <div class="pagingBox">
                    <%=(examples.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                   | <%=(examples.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
               </div>
            </div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                            <tr>
                                <td class="tableTitle" colspan="<%= over || self? 4 : 3 %>">Example Tests: ${infoRow.map['num_submissions']}</td>
                            </tr>
                            <tr>
                                <td class="tableHeader" align="center" nowrap="nowrap">
                                    <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=examples.getColumnIndex("submission_number")%>" includeParams="true" excludeParams="sr;nr"/>">Example Test</A></td>
                                <td class="tableHeader" width="100%" align="center">
                                    <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=examples.getColumnIndex("submit_time")%>" includeParams="true" excludeParams="sr;nr"/>">Time</A></td>
                                <td class="tableHeader" align="center" nowrap="nowrap">
                                    <A href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=examples.getColumnIndex("language_name")%>" includeParams="true" excludeParams="sr;nr"/>">Language</A></td>
                                <% if (over||self) { %>
                                <td class="tableHeader" align="right">&#160;</td>
                                <% } %>
                            </tr>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=examples%>" id="resultRow">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                    <% if (over||self) { %>
                                       <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemSolution&amp;<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&amp;<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&amp;<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>&amp;<%=Constants.EXAMPLE_FLAG%>=1" class="statLink">
                                    <% } %>
                                        <rsc:item name="submission_number" row="<%=resultRow%>"/>
                                    <% if (over||self) { %>
                                       </A>
                                    <% } %>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                        <tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/><%=resultRow.getIntItem("status_id")==130?"*":""%></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <rsc:item name="language_name" row="<%=resultRow%>"/></td>
                                    <% if (over||self) { %>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                    <% if (resultRow.getIntItem("status_id")==150) { %>
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewExampleResults&amp;<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&amp;<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&amp;<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>" class="statLink">example results</A>
                                    <% } %>
                                    </td>
                                    <% } %>
                                </tr>
                                <%even = !even;%>
                            </rsc:iterator>
                        </TABLE>
                    </TD>
                </tr>
            </table>
            </form>
            <p>* Indicates that this submission has not yet been scored</p>

            <div class="pagingBox">
                    <%=(examples.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                | <%=(examples.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
            </div>

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