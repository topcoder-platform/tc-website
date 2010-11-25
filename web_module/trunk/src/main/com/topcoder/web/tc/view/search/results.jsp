<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays search results
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% ResultSetContainer results = memberSearch.getResults(); %>

<% if (results.size() == 0) { %>
<div class="bigRed" align="center" style="margin: 40px;">
    Your search returned 0 matches. Please try different search criteria.
</div>

<% } else { %>
    <a name="jump"></a>
    <div class="pagingBox">
        Search Results:
        <strong><jsp:getProperty name="memberSearch" property="start"/></strong> to
        <strong><jsp:getProperty name="memberSearch" property="end"/></strong> of
        <strong><jsp:getProperty name="memberSearch" property="total"/></strong><br />
        <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
        | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\">next &gt;&gt;</a>":"next &gt;&gt;")%>
    </div>

    <div align="left">
        <strong>Sort by:
        <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />#jump">Handle</a> |
        <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("state_code") %>" includeParams="true" excludeParams="sr" />#jump">State</a> |
        <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("school_name") %>" includeParams="true" excludeParams="sr" />#jump">School</a> |
        <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("country_name") %>" includeParams="true" excludeParams="sr" />#jump">Country</a>
        </strong>
    </div>
    <div style="clear:both;">
    <table cellspacing="0" cellpadding="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="40">Member Search Results</td>
        </tr>
        <tr>
            <td class="headerC B">&nbsp;</td>
            <td class="headerC B NW" colspan="3">Algorithm<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Conceptualization<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Specification<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Architecture<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Design<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Development<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Assembly<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Test Suites<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">Test Scenarios<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">UI Prototype<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">RIA Build<br />Rated Events</td>
            <td class="headerC B NW" colspan="3">TCHS<br />Rated Events</td>
            <td class="headerC NW" colspan="3">Marathon Match<br />Rated Events</td>
        </tr>
        <tr>
            <td class="header B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />#jump">Handle</a></td>

            <%-- Algorithm --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Conceptualization --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("concept_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_concept_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_concept_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Specification --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("spec_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_spec_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_spec_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Architecture --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("arch_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_arch_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_arch_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Design --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("design_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_des_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_des_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Development --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("dev_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_dev_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_dev_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Assembly --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("ass_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_ass_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_ass_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Test Suites --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("test_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_test_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_test_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Test Scenarios --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("test_scenarios_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_test_scenarios_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_test_scenarios_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- UI Prototype --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("ui_prototype_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_ui_prototype_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_ui_prototype_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- RIA Build --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("ria_build_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_ria_build_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_ria_build_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- TCHS --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("hs_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_hs_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC B"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_hs_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>

            <%-- Marathon Match --%>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("mm_rating") %>" includeParams="true" excludeParams="sr" />#jump">Rating</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_mm_ratings") %>" includeParams="true" excludeParams="sr" />#jump">#</a></td>
            <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_mm_competed") %>" includeParams="true" excludeParams="sr" />#jump">Last</a></td>
        </tr>

        <%boolean even = false;%>
        <rsc:iterator list="<%=results%>" id="resultRow">
        <c:set var="rr" value="<%= resultRow %>" />
        <tr class="<%=even?"dark":"light"%>">
            <td class="value B"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' />
                <div style="margin-left: 10px;">
                <c:if test="${not empty rr.map['school_name'] }">
                    <rsc:item row="<%=resultRow%>" name="school_name"/><br/>
                </c:if>
                <c:if test="${not empty rr.map['state_code'] }">
                    <rsc:item row="<%=resultRow%>" name="state_code"/>,
                </c:if>
                <rsc:item row="<%=resultRow%>" name="country_name"/>
                </div>
            </td>

            <%-- Algorithm --%>
            <c:choose>
            <c:when test="${not empty rr.map['rating'] and (rr.map['rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Conceptualization --%>
            <c:choose>
            <c:when test="${not empty rr.map['concept_rating'] and (rr.map['concept_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="concept_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_concept_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_concept_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Specification --%>
            <c:choose>
            <c:when test="${not empty rr.map['spec_rating'] and (rr.map['spec_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="spec_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_spec_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_spec_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Architecture --%>
            <c:choose>
            <c:when test="${not empty rr.map['arch_rating'] and (rr.map['arch_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="arch_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_arch_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_arch_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Design --%>
            <c:choose>
            <c:when test="${not empty rr.map['design_rating'] and (rr.map['design_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_des_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_des_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Development --%>
            <c:choose>
            <c:when test="${not empty rr.map['dev_rating'] and (rr.map['dev_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_dev_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_dev_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Assembly --%>
            <c:choose>
            <c:when test="${not empty rr.map['ass_rating'] and (rr.map['ass_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="ass_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ass_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_ass_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Test Suites --%>
            <c:choose>
            <c:when test="${not empty rr.map['test_rating'] and (rr.map['test_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="test_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_test_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_test_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>
	    
            <%-- Test Scenarios --%>
            <c:choose>
            <c:when test="${not empty rr.map['test_scenarios_rating'] and (rr.map['test_scenarios_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="test_scenarios_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_test_scenarios_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_test_scenarios_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>
	    
            <%-- UI Prototype --%>
            <c:choose>
            <c:when test="${not empty rr.map['ui_prototype_rating'] and (rr.map['ui_prototype_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="ui_prototype_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ui_prototype_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_ui_prototype_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>
	    
            <%-- RIA Build --%>
            <c:choose>
            <c:when test="${not empty rr.map['ria_build_rating'] and (rr.map['ria_build_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="ria_build_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ria_build_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_ria_build_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- TCHS --%>
            <c:choose>
            <c:when test="${not empty rr.map['hs_rating'] and (rr.map['hs_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="hs_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_hs_ratings"/></td>
                <td class="valueC B"><rsc:item row="<%=resultRow%>" name="last_hs_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC B" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>

            <%-- Marathon Match --%>
            <c:choose>
            <c:when test="${not empty rr.map['mm_rating'] and (rr.map['mm_rating']  > 0)}">
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="mm_rating" format="#" ifNull="unrated"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_mm_ratings"/></td>
                <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_mm_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
            </c:when>
            <c:otherwise>
                <td class="valueC" colspan="3">
                    <span class="grayedOut">unrated</span>
                </td>
            </c:otherwise>
            </c:choose>
       </tr>
       <%even=!even;%>
       </rsc:iterator>

    </table>
    </div>
    <div class="pagingBox">
    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\">next &gt;&gt;</a>":"next &gt;&gt;")%>
    </div>
<% } %>