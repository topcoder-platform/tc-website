<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.web.common.StringUtils"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tccc04_alg_adv_overview"); %>

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="advancers"/>
   <jsp:param name="tabLev3" value="overview"/>
</jsp:include>

            <h2>Overview</h2>

            <p>Click a column title to sort the list of advancers by that column. Click <a href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true">here</a> to reset the list to its originally sorted format.</p>

            <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=seed">Seed</a></td>
                    <td width = "15%" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=handle_sort">Handle</a></td>
                    <td width = "5%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=desc&sc=rating">Rating</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=round1_sort">Round 1</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=round2_sort">Round 2</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=round3_sort">Round 3</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=round4_sort">Round 4</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=semi_sort">Semi</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=wildcard_sort">Wildcard</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true&sd=asc&sc=finals_sort">Final</a></td>
                </tr>

               <%-- formatting this crappy to save space in the download to the client --%>
                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow">
<td align="center" class="<%=even?"formHandleEven":"formHandleOdd"%>" ><rsc:item name="seed" row="<%=resultRow%>"/></td>
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


         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
