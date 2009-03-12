<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP is responsible for rendering Marathon Competition leaderboard
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants, com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.model.EventType,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="TCO09Constants" class="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants"/>
<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>

<%--  To set up a new contest, please complete the corresponding rounds ids for each part of the competition --%>
<%--  Leave empty if the round doesn't exist or it's not finished --%>
<c:set value="/longcontest/stats/?module=ViewOverview&amp;rd=" var="details_link"/>
<c:set var="round1_id" value="13766"/>
<c:set var="round2_id" value="13767"/>
<c:set var="round3_id" value="13768"/>
<c:set var="finals_id" value="13769"/>

<jsp:include page="../../leaderboardPageHead.jsp">
    <jsp:param name="phase_id" value="${TCO09Constants.MARATHON_MATCH_PHASE_ID}"/>
    <jsp:param name="add_title_tag" value="${true}" />
</jsp:include>
<%-- title suffix --%>
    Leaderboard
</h2>

<script type="text/javascript" src="/js/popup.js"></script>
<script type="text/javascript">
    function next() {
        var myForm = document.advancersForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value= parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        myForm.submit();
    }
    function previous() {
        var myForm = document.advancersForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value-=parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        myForm.submit();
    }
</script>

<br /> 
<form name="advancersForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="MarathonAdvancers"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=AdvancersBase.FULL_LIST%>"/>

    <div align="center">
        <a href="/tco09?module=MarathonAdvancers">Reset sorting</a>
        <c:choose>
            <c:when test="${full}">
                | <a href="/tco09?module=MarathonAdvancers&amp;full=false">Pages</a>
                | Full view
            </c:when>
            <c:otherwise>
                | Page view
                | <a href="/tco09?module=MarathonAdvancers&amp;full=true">Full view</a>
            </c:otherwise>
        </c:choose>
        <br />
        <c:if test="${!full}">
            <div class="pagingBox">
                <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
            </div>
        </c:if>
    </div>
    <div align="center" style="margin: 20px 0 10px 0;">
        <img src="/i/tournament/tco09/iconAdvanced.png" alt="Advanced" /> = Advanced 
        &nbsp;&nbsp;&nbsp;&nbsp;<img src="/i/tournament/tco09/iconEliminated.png" alt="Eliminated" /> = Eliminated 
        &nbsp;&nbsp;&nbsp;&nbsp;- = Did not compete
    </div>
    <table class="data" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <th class="first">&nbsp;</th>
            <th width="5%">
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("seed")%>"/>">Seed</a>
            </th>
            <th>
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("handle_sort")%>"/>">Handle</a>
                <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="12" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
            </th>
            <th style="text-align:center;">
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
            </th>
            <th style="text-align:center;">
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round1_sort")%>"/>">R1</a>
            </th>
            <th style="text-align:center;">
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round2_sort")%>"/>">R2</a>
            </th>
            <th style="text-align:center;">
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round3_sort")%>"/>">R3</a>
            </th>
            <th style="text-align:center;">
                <a href="/tco09?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("finals_sort")%>"/>">Final</a>
            </th>
            <th class="last">&nbsp;</th>
        </tr>
        <rsc:iterator list="<%=rsc%>" id="resultRow">
<%-- formatting this crappy to save space in the download to the client --%>
<tr>
<td class="first">&nbsp;</td>
<td class="valueC">${resultRow.map["seed"]}</td>
<td class="value textAlign"><tc-webtag:handle coderId="${resultRow.map['coder_id']}" context="marathon_match"/></td>
<td class="valueC">${resultRow.map["rating"]}</td>
<td class="valueC"><c:choose><c:when test="${empty round1_id}">&nbsp;</c:when><c:when test="${not empty resultRow.map['round1']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['round1'])}.png" alt="${resultRow.map["round1"]}" /></c:when><c:otherwise>-</c:otherwise></c:choose></td>
<td class="valueC"><c:choose><c:when test="${empty round2_id}">&nbsp;</c:when><c:when test="${empty resultRow.map['round1'] or resultRow.map['round1'] == 'Eliminated'}">&nbsp;</c:when><c:when test="${not empty resultRow.map['round2']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['round2'])}.png" alt="${resultRow.map["round2"]}" /></c:when><c:otherwise>-</c:otherwise></c:choose></td>
<td class="valueC"><c:choose><c:when test="${empty round3_id}">&nbsp;</c:when><c:when test="${empty resultRow.map['round2'] or resultRow.map['round2'] == 'Eliminated'}">&nbsp;</c:when><c:when test="${not empty resultRow.map['round3']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['round3'])}.png" alt="${resultRow.map["round3"]}" /></c:when><c:otherwise>-</c:otherwise></c:choose></td>
<td class="valueC"><c:choose><c:when test="${empty finals_id}">&nbsp;</c:when><c:when test="${empty resultRow.map['round3'] or resultRow.map['round3'] == 'Eliminated'}">&nbsp;</c:when><c:when test="${not empty resultRow.map['final']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['final'])}.png" alt="${resultRow.map["final"]}" /></c:when><c:otherwise>&nbsp;</c:otherwise></c:choose></td>
<td class="last">&nbsp;</td>
</tr>
        </rsc:iterator>
    </table>
    <br />
    <c:if test="${!full}">
        <div align="center">
            <div class="pagingBox">
                <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>           
                <br />
                View &#160;
                <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                &#160;at a time starting with &#160;
                <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                <button name="nameSubmit" value="submit" type="submit">Go</button>
            </div>
        </div>
    </c:if>
</form>
<jsp:include page="../../leaderboardPageBottom.jsp" />