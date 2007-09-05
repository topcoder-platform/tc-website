<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% ResultSetContainer results = memberSearch.getResults(); %>
          <a name="data"></a>
         Search Results: 
         <strong><jsp:getProperty name="memberSearch" property="start"/></strong> to 
         <strong><jsp:getProperty name="memberSearch" property="end"/></strong> of
         <strong><jsp:getProperty name="memberSearch" property="total"/></strong><br>

<table cellspacing="0" cellpadding="0" class="stat" width="100%">
<tbody>
   <tr>
      <td class="title" colspan="8">
         Member Search Results
      </td>
   </tr>
   <tr>
    <%--
      <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />">
                Handle</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("sort_rating") %>" includeParams="true" excludeParams="sr" />">
                Algo<br>Rating</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("sort_hs_rating") %>" includeParams="true" excludeParams="sr" />">
                HS<br>Rating</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("sort_mm_rating") %>" includeParams="true" excludeParams="sr" />">
                Marathon<br>Rating</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("design_rating") %>" includeParams="true" excludeParams="sr" />">
                Des<br>Rating</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("dev_rating") %>" includeParams="true" excludeParams="sr" />">
                Dev<br>Rating</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("school_name") %>" includeParams="true" excludeParams="sr" />">
                School</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("state_code") %>" includeParams="true" excludeParams="sr" />">
                State</a></td>
      <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("country_name") %>" includeParams="true" excludeParams="sr" />">
                Country</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_ratings") %>" includeParams="true" excludeParams="sr" />">
                Algo<br>Events</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_competed") %>" includeParams="true" excludeParams="sr" />">
                Last<br><nobr>Algo Event</nobr></a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_hs_ratings") %>" includeParams="true" excludeParams="sr" />">
                HS<br>Events</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_hs_competed") %>" includeParams="true" excludeParams="sr" />">
                Last<br><nobr>HS Event</nobr></a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_mm_ratings") %>" includeParams="true" excludeParams="sr" />">
                Marathon<br>Events</a></td>
      <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("last_mm_competed") %>" includeParams="true" excludeParams="sr" />">
                Last<br><nobr>Marathon Event</nobr></a></td>
    --%>
        <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />">
                    Handle</a></td>
        <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("school_name") %>" includeParams="true" excludeParams="sr" />">
                    School</a></td>
        <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("country_name") %>" includeParams="true" excludeParams="sr" />">
                    Country</a></td>
        <td class="headerC"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("state_code") %>" includeParams="true" excludeParams="sr" />">
                    State</a></td>
        <td class="headerC">Competition</td>
        <td class="headerC">Rating</td>
        <td class="headerC"># Ratings</td>
        <td class="headerC">Last Event</td>
   </tr>
   
   <%boolean even = false;%>
   <rsc:iterator list="<%=results%>" id="resultRow">
   <tr class="<%=even?"dark":"light"%>">
   <%--
      <td class="value" nowrap="nowrap"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' /></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="rating" format="#" ifNull="unrated"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="hs_rating" format="#" ifNull="unrated"/></td>                  
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="mm_rating" format="#" ifNull="unrated"/></td>                  
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="unrated"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="unrated"/></td>
      <td class="value"><rsc:item row="<%=resultRow%>" name="school_name" ifNull="N/A"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
      <td class="value"><rsc:item row="<%=resultRow%>" name="country_name"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="num_hs_ratings"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_hs_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="num_mm_ratings"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_mm_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
   --%>
       <td class="value" rowspan="5"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' /></td>
       <td class="value" rowspan="5"><rsc:item row="<%=resultRow%>" name="school_name" ifNull="N/A"/></td>
       <td class="value" rowspan="5"><rsc:item row="<%=resultRow%>" name="country_name"/></td>
       <td class="valueC" rowspan="5" style="border-right:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
       <td class="valueC">Algo</td>
       <td class="valueC"><rsc:item row="<%=resultRow%>" name="rating" format="#" ifNull="unrated"/></td>
       <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
       <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
   </tr>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">Des</td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_des_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_des_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
   </tr>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">Dev</td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_dev_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_dev_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
   </tr>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">HS</td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="hs_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_hs_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_hs_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
    </tr>
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">MM</td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="mm_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_mm_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_mm_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
    </tr>
   <%even=!even;%>
   </rsc:iterator>
   
</table>
<div class="pagingBox">
<%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bodyText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bodyText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>