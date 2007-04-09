<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.StringUtils,
                 java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco07_alg_adv_overview"); %>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="overview"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">

        <span class="bigTitle">Advancers - Overview</span>
            <br><br>
            Click a column title to sort the list of advancers by that column. Click <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">here</a> to reset the list to its originally sorted format.
            <br><br>
            <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr class="advHeader">
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=seed&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Seed</a></td>
                    <td width = "15%" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=handle_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Handle</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=section&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Section</a></td>
                    <td width = "5%" align = "right" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=desc&amp;sc=rating&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Rating</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round1_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Round 1</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round2_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Round 2</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round3_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Round 3</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=semi_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Semi</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=wildcard_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Wildcard</a></td>
                    <td width = "10%" align = "center" nowrap="nowrap"><a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=finals_sort&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg&amp;d4=advancers">Final</a></td>
                </tr>
<%-- formatting this crappy to save space in the download to the client --%>
                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow">
<tr>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="seed" row="<%=resultRow%>"/></td>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context="algorithm"/></td>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="section" row="<%=resultRow%>"/></td>
<td  class="<%=even?"advanceDkR":"advanceLtR"%>"><rsc:item name="rating" row="<%=resultRow%>"/></td>
<% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDkC":"eliminateLtC"%>"><rsc:item name="round1" row="<%=resultRow%>"/></td>
<% } else { %>
<td   class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="round1" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDkC":"eliminateLtC"%>"><rsc:item name="round2" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="round2" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDkC":"eliminateLtC"%>"><rsc:item name="round3" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="round3" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("semi")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDkC":"eliminateLtC"%>"><rsc:item name="semi" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="semi" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("wildcard")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDkC":"eliminateLtC"%>"><rsc:item name="wildcard" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="wildcard" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDkC":"eliminateLtC"%>"><rsc:item name="final" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDkC":"advanceLtC"%>"><rsc:item name="final" row="<%=resultRow%>"/></td>
<% } %>
</tr>
<%even=!even;%>
</rsc:iterator>
            </table>
        </div>
		</td>


<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
