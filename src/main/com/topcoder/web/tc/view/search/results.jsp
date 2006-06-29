<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<% ResultSetContainer results = memberSearch.getResults();%>
          <a name="data"></a>
         Search Results: 
         <strong><jsp:getProperty name="memberSearch" property="start"/></strong> to 
         <strong><jsp:getProperty name="memberSearch" property="end"/></strong> of
         <strong><jsp:getProperty name="memberSearch" property="total"/></strong><br>

<table cellspacing="0" cellpadding="0" class="stat" width="100%">
<tbody>
   <tr>
      <td class="title" colspan="12">
         Member Search Results
      </td>
   </tr>
   <tr>
      <td class="header">Handle</td>
      <td class="headerC">Algo<br>Rating</td>
      <td class="headerC">HS<br>Rating</td>
      <td class="headerC">Des<br>Rating</td>
      <td class="headerC">Dev<br>Rating</td>
      <td class="header">School</td>
      <td class="headerC">State</td>
      <td class="header">Country</td>
      <td class="headerC">Algo<br>Events</td>
      <td class="headerC">Last<br><nobr>Algo Event</nobr></td>
      <td class="headerC">HS<br>Events</td>
      <td class="headerC">Last<br><nobr>HS Event</nobr></td>
   </tr>
   <%boolean even = false;%>
   <rsc:iterator list="<%=results%>" id="resultRow">
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap="nowrap"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' /></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="rating" format="#" ifNull="unrated"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="hs_rating" format="#" ifNull="unrated"/></td>                  
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="unrated"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="unrated"/></td>
      <td class="value"><rsc:item row="<%=resultRow%>" name="school_name" ifNull="N/A"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
      <td class="value"><rsc:item row="<%=resultRow%>" name="country_name"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
      <td class="valueR"><rsc:item row="<%=resultRow%>" name="num_hs_ratings"/></td>
      <td class="valueC"><rsc:item row="<%=resultRow%>" name="last_hs_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
   </tr>
   <%even=!even;%>
   </rsc:iterator>
</table>
<div class="pagingBox">
<%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bodyText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bodyText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>