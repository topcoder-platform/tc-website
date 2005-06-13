<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.web.common.StringUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco04_alg_adv_overview"); %>

</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="overview"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

        <p class=pageTitle>Advancers</p>

            <h2>Overview</h2>

            <p>Click a column title to sort the list of advancers by that column. Click <a href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&d1=tournaments&d2=tco04&d3=alg_adv_overview">here</a> to reset the list to its originally sorted format.</p>

            <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=seed&d1=tournaments&d2=tco04&d3=alg_adv_overview">Seed</a></td>
                    <td width = "15%" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=handle_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Handle</a></td>
                    <td width = "5%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=desc&sc=rating&d1=tournaments&d2=tco04&d3=alg_adv_overview">Rating</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=round1_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Round 1</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=round2_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Round 2</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=round3_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Round 3</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=round4_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Round 4</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=semi_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Semi</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=wildcard_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Wildcard</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&sd=asc&sc=finals_sort&d1=tournaments&d2=tco04&d3=alg_adv_overview">Final</a></td>
                </tr>
               <%-- formatting this crappy to save space in the download to the client --%>
                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow">
<tr><td align="center" class="<%=even?"formHandleEven":"formHandleOdd"%>" ><rsc:item name="seed" row="<%=resultRow%>"/></td>
<td class="<%=even?"formHandleEven":"formHandleOdd"%>" ><A HREF="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>" CLASS="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item name="handle" row="<%=resultRow%>"/></A></td>
<td align="right" class="<%=even?"formHandleEven":"formHandleOdd"%>" ><rsc:item name="rating" row="<%=resultRow%>"/>&#160;&#160;</td>
<% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="round1" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="round1" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="round2" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="round2" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="round3" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="round3" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round4")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="round4" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="round4" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("semi")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="semi" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="semi" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("wildcard")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="wildcard" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="wildcard" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
<td  class="<%=even?"eliminateDk":"eliminateLt"%>"><rsc:item name="final" row="<%=resultRow%>"/></td>
<% } else { %>
<td  class="<%=even?"advanceDk":"advanceLt"%>"><rsc:item name="final" row="<%=resultRow%>"/></td>
<% } %>
</tr>
<%even=!even;%>
</rsc:iterator>
            </table>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
