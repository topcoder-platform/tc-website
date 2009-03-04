<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows marathon track leaderboard page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.model.EventType,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set value="<%=DataAccessConstants.START_RANK%>" var="START_RANK"/>
<c:set value="<%=DataAccessConstants.NUMBER_RECORDS%>" var="NUMBER_RECORDS"/>
<c:set value="<%=DataAccessConstants.SORT_DIRECTION%>" var="SORT_DIRECTION"/>
<c:set value="<%=DataAccessConstants.SORT_COLUMN%>" var="SORT_COLUMN"/>
<c:set value="<%=AdvancersBase.FULL_LIST%>" var="FULL_LIST"/>
<c:set value="<%=Constants.MODULE_KEY%>" var="MODULE_KEY"/>
<c:set value="<%=Constants.HANDLE%>" var="HANDLE"/>

<!--  To set up a new contest, please complete the corresponding rounds ids for each part of the competition -->
<!--  Leave empty if the round doesn't exist or it's not finished -->

<c:set value="/longcontest/stats/?module=ViewOverview&amp;rd=" var="details_link"/>
<c:set var="sortColumn" value="${param[SORT_COLUMN]}"/>
<c:set var="sortDirection" value="${param[SORT_DIRECTION]}"/>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>
<c:set var="croppedDataBefore" value="<%=rsc.croppedDataBefore()%>"/>
<c:set var="croppedDataAfter" value="<%=rsc.croppedDataAfter()%>"/>
<c:set var="seedColumnIndex" value="<%=rsc.getColumnIndex("seed")%>"/>
<c:set var="handleSortColumnIndex" value="<%=rsc.getColumnIndex("handle_sort")%>"/>
<c:set var="ratingColumnIndex" value="<%=rsc.getColumnIndex("rating")%>"/>
<c:set var="round1SortColumnIndex" value="<%=rsc.getColumnIndex("round1_sort")%>"/>
<c:set var="round2SortColumnIndex" value="<%=rsc.getColumnIndex("round2_sort")%>"/>
<c:set var="round3SortColumnIndex" value="<%=rsc.getColumnIndex("round3_sort")%>"/>
<c:set var="finalsSortColumnIndex" value="<%=rsc.getColumnIndex("finals_sort")%>"/>


<c:set var="round1_id" value=""/>
<%-- 
<c:set var="round2_id" value=""/>
<c:set var="round3_id" value=""/>
<c:set var="finals_id" value=""/>
 --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Marathon Competition</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<script type="text/javascript">
    function next() {
        var myForm = document.advancersForm;
        myForm.${START_RANK}.value= parseInt(myForm.${START_RANK}.value) + parseInt(myForm.${NUMBER_RECORDS}.value);
        myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
        myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
        myForm.submit();
    }

    function previous() {
        var myForm = document.advancersForm;
        myForm.${START_RANK}.value-=parseInt(myForm.${NUMBER_RECORDS}.value);
        myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
        myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
        myForm.submit();
    }
</script>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="marathon"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="marathon"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="marathon"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                                <jsp:param name="tertiaryTab" value="leaderboard"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
																<h2 class="title">Marathon Competition Leaderboard</h2>

                                                                <form name="advancersForm" action='${sessionInfo.servletPath}' method="get">
                                                                    <tc-webtag:hiddenInput name="${MODULE_KEY}" value="MarathonAdvancers"/>
                                                                    <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                                                                    <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>
                                                                    <tc-webtag:hiddenInput name="${FULL_LIST}"/>
                                                    
                                                                    <div align="center">
                                                                        <a href="${sessionInfo.servletPath}?module=MarathonAdvancers">Reset sorting</a>
                                                        
                                                                        <c:choose>
                                                                            <c:when test="${full}">
                                                                                | <a href="${sessionInfo.servletPath}?module=MarathonAdvancers&amp;full=false">Pages</a>
                                                                                | Full view
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                | Page view
                                                                                | <a href="${sessionInfo.servletPath}?module=MarathonAdvancers&amp;full=true">Full view</a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                        
                                                                        <br />
                                                                        <c:if test="${!full}">
                                                                            <div class="pagingBox">
                                                                                <c:choose>
                                                                                    <c:when test="${croppedDataBefore}">
                                                                                        <a href="Javascript:previous()">&lt;&lt; prev</a>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        &lt;&lt; prev
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                |
                                                                                <c:choose>
                                                                                    <c:when test="${croppedDataAfter}">
                                                                                        <a href="Javascript:next()">next &gt;&gt;</a>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        next &gt;&gt;
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                    <div align="center" style="margin: 20px 0 10px 0;">
                                                                        <img src="/i/tournament/tco09/iconAdvanced.png" alt="Advanced" /> = Advanced 
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;<img src="/i/tournament/tco09/iconEliminated.png" alt="Eliminated" /> = Eliminated 
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;- = Did not compete
                                                                    </div>
    																<div><p>
    																	<table class="data" width="100%" cellpadding="0" cellspacing="0">
    																		<tr>
    																			<th class="first">&nbsp;</th>
                                                                                <th width="10%">
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${seedColumnIndex}"/>">Seed</a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${handleSortColumnIndex}"/>">Handle</a>
                                                                                    <br /><tc-webtag:textInput name="${HANDLE}" size="12" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${ratingColumnIndex}"/>">Rating</a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${round1SortColumnIndex}"/>">R1</a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${round2SortColumnIndex}"/>">R2</a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${round3SortColumnIndex}"/>">R3</a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="${finalsSortColumnIndex}"/>">Final</a>
                                                                                </th>
    																			<th class="last">&nbsp;</th>
    																		</tr>
                                                                            <c:forEach items="${rsc}" var="resultRow">
                                                                            <tr>
                                                                                <td class="first">&nbsp;</td>
                                                                                <td>${resultRow.map["seed"]}</td>
                                                                                <td><tc-webtag:handle coderId="${resultRow.map['coder_id']}" context="marathon_match"/></td>
                                                                                <td>${resultRow.map["rating"]}</td>
                                                                                <td><c:choose><c:when test="${empty round1_id}">&nbsp;</c:when><c:when test="${not empty resultRow.map['round1']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['round1'])}.png" alt="${resultRow.map["round1"]}" /></c:when><c:otherwise>-</c:otherwise></c:choose></td>
                                                                                <td><c:choose><c:when test="${empty round2_id}">&nbsp;</c:when><c:when test="${empty resultRow.map['round1'] or resultRow.map['round1'] == 'Eliminated'}">&nbsp;</c:when><c:when test="${not empty resultRow.map['round2']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['round2'])}.png" alt="${resultRow.map["round2"]}" /></c:when><c:otherwise>-</c:otherwise></c:choose></td>
                                                                                <td><c:choose><c:when test="${empty round3_id}">&nbsp;</c:when><c:when test="${empty resultRow.map['round2'] or resultRow.map['round2'] == 'Eliminated'}">&nbsp;</c:when><c:when test="${not empty resultRow.map['round3']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['round3'])}.png" alt="${resultRow.map["round3"]}" /></c:when><c:otherwise>-</c:otherwise></c:choose></td>
                                                                                <td><c:choose><c:when test="${empty finals_id}">&nbsp;</c:when><c:when test="${empty resultRow.map['round3'] or resultRow.map['round3'] == 'Eliminated'}">&nbsp;</c:when><c:when test="${not empty resultRow.map['final']}"><img src="/i/tournament/tco09/icon${fn:trim(resultRow.map['final'])}.png" alt="${resultRow.map["final"]}" /></c:when><c:otherwise>&nbsp;</c:otherwise></c:choose></td>
                                                                                <td class="last">&nbsp;</td>
                                                                            </tr>
                                                                            </c:forEach> 
    																	</table></p>
                                                                        <br />
                                                                        <c:if test="${!full}">
                                                                            <div align="center">
                                                                                <div class="pagingBox">
                                                                                    <c:choose>
                                                                                        <c:when test="${croppedDataBefore}">
                                                                                            <a href="Javascript:previous()">&lt;&lt; prev</a>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            &lt;&lt; prev
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    |
                                                                                    <c:choose>
                                                                                        <c:when test="${croppedDataAfter}">
                                                                                            <a href="Javascript:next()">next &gt;&gt;</a>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            next &gt;&gt;
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                
                                                                                   <br />
                                                                                
                                                                                   View &#160;
                                                                                   <tc-webtag:textInput name="${NUMBER_RECORDS}" size="4" maxlength="4"/>
                                                                                   &#160;at a time starting with &#160;
                                                                                   <tc-webtag:textInput name="${START_RANK}" size="4" maxlength="4"/>
                                                                                    <button name="nameSubmit" value="submit" type="submit">Go</button>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </form>
                                                            </div><!-- End .pageContent -->
                                                        </div>
                                                    </div><!-- End #mainContentInner -->
                                                </div><!-- End #mainContent -->

                                                <jsp:include page="../../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../../footer.jsp"/>
</body>
</html>
