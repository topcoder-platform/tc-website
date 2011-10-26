<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants, com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.model.EventType,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!--  To set up a new contest, please complete the corresponding rounds ids for each part of the competition -->
<!--  Leave empty if the round doesn't exist or it's not finished -->

<c:set value="stat?c=round_overview&er=5&rd=" var="details_link"/>
<c:set var="round1A_id" value="10898"/>
<c:set var="round1B_id" value="10897"/>
<c:set var="round1C_id" value="10899"/>
<c:set var="round2_id" value="10891"/>
<c:set var="round3_id" value="10908"/>
<c:set var="round4_id" value=""/>
<c:set var="semi1_id" value=""/>
<c:set var="semi2_id" value=""/>
<c:set var="semi3_id" value=""/>
<c:set var="wildcard_id" value=""/>
<c:set var="finals_id" value=""/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />

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
</head>
<body>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="overview"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Advancers</span></h1>
                
                <form name="advancersForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCCC07AlgorithmAdvancers"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
                <tc-webtag:hiddenInput name="<%=AdvancersBase.FULL_LIST%>"/>

                <div align="center">
                <a href="/tc?module=TCCC07AlgorithmAdvancers">Reset sorting</a>

                <c:choose>
                    <c:when test="${full}">
                        | <a href="/tc?module=TCCC07AlgorithmAdvancers&full=false">Pages</a>
                        | Full view
                    </c:when>
                    <c:otherwise>
                        | Page view
                        | <a href="/tc?module=TCCC07AlgorithmAdvancers&full=true">Full view</a>
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
                <br /><br />
                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("seed")%>"/>">Seed</a>
                        </td>
                        <td class="header">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("handle_sort")%>"/>">Handle</a>
                            <br /><tc-webtag:textInput name="<%=Constants.HANDLE%>" size="12" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("section")%>"/>">Section</a>
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round1_sort")%>"/>">Round 1</a>
                            <br />details: 
                            <br />
                            <c:if test = "${not empty round1A_id}"><a href="${details_link}${round1A_id}">A</a></c:if>
                            <c:if test = "${not empty round1B_id}"><a href="${details_link}${round1B_id}">B</a></c:if>
                            <c:if test = "${not empty round1C_id}"><a href="${details_link}${round1C_id}">C</a></c:if>
                            </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round2_sort")%>"/>">Round 2</a>
                            <br /><c:if test = "${not empty round2_id}"><a href="${details_link}${round2_id}">details</a></c:if>
                            <br />&nbsp;
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round3_sort")%>"/>">Round 3</a>
                            <br /><c:if test = "${not empty round3_id}"><a href="${details_link}${round3_id}">details</a></c:if>
                            <br />&nbsp;
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round4_sort")%>"/>">Round 4</a>
                            <br /><c:if test = "${not empty round4_id}"><a href="${details_link}${round4_id}">details</a></c:if>
                            <br />&nbsp;
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("semi_sort")%>"/>">Semi</a>
                            <br />
                            <c:if test = "${not empty semi1_id}"><a href="${details_link}${semi1_id}">details:</a></c:if>
                            <br />&nbsp;
                            <c:if test = "${not empty semi1_id}"><a href="${details_link}${semi1_id}">1</a></c:if>
                            <c:if test = "${not empty semi2_id}"><a href="${details_link}${semi2_id}">2</a></c:if>
                            <c:if test = "${not empty semi3_id}"><a href="${details_link}${semi3_id}">3</a></c:if>
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("wildcard_sort")%>"/>">Wildcard</a>
                            <br /><c:if test = "${not empty wildcard_id}"><a href="${details_link}${wildcard_id}">details</a></c:if>
                            <br />&nbsp;
                        </td>
                        <td class="headerC">
                            <a href="/tc?<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("finals_sort")%>"/>">Final</a>
                            <br /><c:if test = "${not empty finals_id}"><a href="${details_link}${finals_id}">details</a></c:if>
                            <br />&nbsp;
                        </td>
                    </tr>
                </thead>
                <tbody>
<%-- formatting this crappy to save space in the download to the client --%>
<%boolean even = false;%>
<rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=(even ? "dark" : "light")%>">
<td class="valueC">${resultRow.map["seed"]}</td>
<td class="value"><tc-webtag:handle coderId="${resultRow.map['coder_id']}" context="algorithm"/></td>
<td class="valueC">${resultRow.map["section"]}</td>
<td class="valueC">${resultRow.map["rating"]}</td>
<td class="${resultRow.map['round1'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["round1"]}</td>
<td class="${resultRow.map['round2'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["round2"]}</td>
<td class="${resultRow.map['round3'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["round3"]}</td>
<td class="${resultRow.map['round4'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["round4"]}</td>
<td class="${resultRow.map['semi'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["semi"]}</td>
<td class="${resultRow.map['wildcard'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["wildcard"]}</td>
<td class="${resultRow.map['final'] == 'Eliminated' ? 'valueCE' : 'valueCA'}">${resultRow.map["final"]}</td>
</tr>
<%even = !even;%>
</rsc:iterator>
                </tbody>
                </table>
                <br />
                    <c:if test="${!full}">
                        <div align="center">
                            <div class="pagingBox">
                               <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                               | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                            
                               <br>
                            
                               View &#160;
                               <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                               &#160;at a time starting with &#160;
                               <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                                <button name="nameSubmit" value="submit" type="submit">Go</button>
                            </div>
                        </div>
                    </c:if>
                </form>
            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>