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
         <strong><jsp:getProperty name="memberSearch" property="total"/></strong><br />

<div align="center" style="padding:5px 0px 5px 0px;">
    <strong>Sort by: 
    <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />">Handle</a> | 
    <a style="text-decoration:none;" href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("state_code") %>" includeParams="true" excludeParams="sr" />">State / Province</a> | 
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
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("sort_rating") %>" includeParams="true" excludeParams="sr" />">Algorithm</a></td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("design_rating") %>" includeParams="true" excludeParams="sr" />">Design</a></td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("dev_rating") %>" includeParams="true" excludeParams="sr" />">Development</a></td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_hs_ratings") %>" includeParams="true" excludeParams="sr" />">TCHS</a></td>
        <td class="headerC" colspan="3" style="border-left:solid 1px #ffffff;"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("num_mm_ratings") %>" includeParams="true" excludeParams="sr" />">Marathon Match</a></td>
    </tr>
    <tr>
        <td class="header"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<tc-webtag:sort column="<%= results.getColumnIndex("lower_handle") %>" includeParams="true" excludeParams="sr" />">Handle</a></td>
        <td class="headerC" style="border-left:solid 1px #ffffff;">Rating</td>
        <td class="headerC"># Ratings</td>
        <td class="headerC">Last Event</td>
        <td class="headerC" style="border-left:solid 1px #ffffff;">Rating</td>
        <td class="headerC"># Ratings</td>
        <td class="headerC">Last Event</td>
        <td class="headerC" style="border-left:solid 1px #ffffff;">Rating</td>
        <td class="headerC"># Ratings</td>
        <td class="headerC">Last Event</td>
        <td class="headerC" style="border-left:solid 1px #ffffff;">Rating</td>
        <td class="headerC"># Ratings</td>
        <td class="headerC">Last Event</td>
        <td class="headerC" style="border-left:solid 1px #ffffff;">Rating</td>
        <td class="headerC"># Ratings</td>
        <td class="headerC">Last Event</td>
    </tr>
   
    <%boolean even = false;%>
    <rsc:iterator list="<%=results%>" id="resultRow">
    <tr class="<%=even?"dark":"light"%>">
        <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' /><br />
            <rsc:item row="<%=resultRow%>" name="school_name" ifNull="N/A"/><br />
            <rsc:item row="<%=resultRow%>" name="country_name"/><br />
            <rsc:item row="<%=resultRow%>" name="state_code"/></td>
        
        <%-- Algorithm --%>
        <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        
        <%-- Design --%>
        <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_des_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_des_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        
        <%-- Development --%>
        <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_dev_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_dev_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        
        <%-- TCHS --%>
        <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="hs_rating" format="#" ifNull="unrated"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="num_hs_ratings"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_hs_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
        
        <%-- Marathon Match --%>
        <td class="valueC" style="border-left:solid 1px #ffffff;"><rsc:item row="<%=resultRow%>" name="mm_rating" format="#" ifNull="unrated"/></td>
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