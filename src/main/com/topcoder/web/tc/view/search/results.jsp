<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% ResultSetContainer results = memberSearch.getResults(); %>
          <a name="data"></a>
         Search Results: 
         <strong><jsp:getProperty name="memberSearch" property="start"/></strong> to 
         <strong><jsp:getProperty name="memberSearch" property="end"/></strong> of
         <strong><jsp:getProperty name="memberSearch" property="total"/></strong><br />

<div align="center" style="padding:5px 0px 5px 0px;">
    <strong>Sort by: 
    <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />">Handle</a> | 
    <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("state_code") %>" includeParams="true" excludeParams="sr" />">State</a> | 
    <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("country_name") %>" includeParams="true" excludeParams="sr" />">Country</a>
    </strong>
</div>
<table cellspacing="0" cellpadding="0" class="stat" width="100%">
<tbody>
    <tr>
        <td class="title" colspan="16">Member Search Results</td>
    </tr>
    <tr>
        <td class="headerC">&nbsp;</td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;">Algorithm</td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;">Design</td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;">Development</td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;">TCHS</td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;">Marathon Match</td>
    </tr>
    <tr>
        <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />">Handle</a></td>
        
        <%-- Algorithm --%>
        <td class="headerC" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("rating") %>" includeParams="true" excludeParams="sr" />">Rating</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_ratings") %>" includeParams="true" excludeParams="sr" />"># Ratings</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_competed") %>" includeParams="true" excludeParams="sr" />">Last Event</a></td>
        
        <%-- Design --%>
        <td class="headerC" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("design_rating") %>" includeParams="true" excludeParams="sr" />">Rating</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_des_ratings") %>" includeParams="true" excludeParams="sr" />"># Ratings</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_des_competed") %>" includeParams="true" excludeParams="sr" />">Last Event</td>
        
        <%-- Development --%>
        <td class="headerC" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("dev_rating") %>" includeParams="true" excludeParams="sr" />">Rating</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_dev_ratings") %>" includeParams="true" excludeParams="sr" />"># Ratings</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_dev_competed") %>" includeParams="true" excludeParams="sr" />">Last Event</td>
        
        <%-- TCHS --%>
        <td class="headerC" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("hs_rating") %>" includeParams="true" excludeParams="sr" />">Rating</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_hs_ratings") %>" includeParams="true" excludeParams="sr" />"># Ratings</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_hs_competed") %>" includeParams="true" excludeParams="sr" />">Last Event</td>
        
        <%-- Marathon Match --%>
        <td class="headerC" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("mm_rating") %>" includeParams="true" excludeParams="sr" />">Rating</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_mm_ratings") %>" includeParams="true" excludeParams="sr" />"># Ratings</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_mm_competed") %>" includeParams="true" excludeParams="sr" />">Last Event</td>
    </tr>
   
    <%boolean even = false;%>
    <rsc:iterator list="<%=results%>" id="resultRow">
    <c:set var="rr" value="<%= resultRow %>" />
    <tr class="<%=even?"dark":"light"%>">
        <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' /><br />
            <c:if test="${not empty rr.map['school_name'] }">
                <rsc:item row="<%=resultRow%>" name="school_name"/><br/>
            </c:if>
            <c:if test="${not empty rr.map['state_code'] }">
                <rsc:item row="<%=resultRow%>" name="state_code"/>,  
            </c:if>
            <rsc:item row="<%=resultRow%>" name="country_name"/>
            </td>
        
        <%-- Algorithm --%>
        <c:choose>
        <c:when test="${not empty rr.map['rating'] and (rr.map['rating']  > 0)}">
            <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="rating" format="#" ifNull="unrated"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        </c:when>
        <c:otherwise>
            <td class="valueC" colspan="3">
                unrated
            </td> 
        </c:otherwise>
        </c:choose>
        
        <%-- Design --%>
        <c:choose>
        <c:when test="${not empty rr.map['design_rating'] and (rr.map['design_rating']  > 0)}">
            <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="unrated"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_des_ratings"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_des_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        </c:when>
        <c:otherwise>
            <td class="valueC" colspan="3">
                unrated
            </td> 
        </c:otherwise>
        </c:choose>
        
        <%-- Development --%>
        <c:choose>
        <c:when test="${not empty rr.map['dev_rating'] and (rr.map['dev_rating']  > 0)}">
            <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="unrated"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_dev_ratings"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_dev_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        </c:when>
        <c:otherwise>
            <td class="valueC" colspan="3">
                unrated
            </td> 
        </c:otherwise>
        </c:choose>
        
        <%-- TCHS --%>
        <c:choose>
        <c:when test="${not empty rr.map['hs_rating'] and (rr.map['hs_rating']  > 0)}">
            <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="hs_rating" format="#" ifNull="unrated"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_hs_ratings"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_hs_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        </c:when>
        <c:otherwise>
            <td class="valueC" colspan="3">
                unrated
            </td> 
        </c:otherwise>
        </c:choose>
        
        <%-- Marathon Match --%>
        <c:choose>
        <c:when test="${not empty rr.map['mm_rating'] and (rr.map['mm_rating']  > 0)}">
            <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="mm_rating" format="#" ifNull="unrated"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_mm_ratings"/></td>
            <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_mm_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        </c:when>
        <c:otherwise>
            <td class="valueC" colspan="3">
                unrated
            </td> 
        </c:otherwise>
        </c:choose>
   </tr>
   <%even=!even;%>
   </rsc:iterator>
   
</table>
<div class="pagingBox">
<%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bodyText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bodyText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>