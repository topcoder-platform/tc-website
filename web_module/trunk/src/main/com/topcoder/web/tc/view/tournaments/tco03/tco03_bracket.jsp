<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco03_bracket"); %>

</head>

<body onLoad="timer(1);">

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

<jsp:include page="tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

            <h2>Advancers</h2>

            <p>Click a column name to sort the list of advancers by that column.</p>

            <p><a href="?module=SimpleStats&c=tco03_bracket&trans=true">Reset List</a></p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="0" class="formFrame">
               <tr>
                  <td width = "10%" align = "right" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=seed">Seed</a></td>
                  <td width = "15%" align = "left" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=handle_sort">Handle</a></td>
                  <td width = "15%" align = "right" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=desc&sc=rating">Rating</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=round1_sort">Round 1</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=round2_sort">Round 2</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=round3_sort">Round 3</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=round4_sort">Round 4</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=semi_sort">Semi</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="?module=SimpleStats&c=tco03_bracket&trans=true&sd=asc&sc=finals_sort">Final</a></td>
               </tr>



                <rsc:iterator list="<%=rsc%>" id="resultRow">
                   <tr>
                      <td align="right" class="advancers_list"><rsc:item name="seed" row="<%=resultRow%>"/></td>
                      <td align="left" class="advancers_list"><A HREF="/stat?c=member_profile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>" CLASS="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item name="handle" row="<%=resultRow%>"/></A></td>
                      <td align="right" class="advancers_list"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                      <% if (resultRow.getStringItem("round1").equals("Eliminated")) { %>
                          <td class="sidebarText"><font color="#CC0000"><rsc:item name="round1" row="<%=resultRow%>"/></font></td>
                      <% } else { %>
                          <td class="sidebarText"><rsc:item name="round1" row="<%=resultRow%>"/></td>
                      <% } %>
                      <% if (resultRow.getStringItem("round2").equals("Eliminated")) { %>
                          <td class="sidebarText"><font color="#CC0000"><rsc:item name="round2" row="<%=resultRow%>"/></font></td>
                      <% } else { %>
                          <td class="sidebarText"><rsc:item name="round2" row="<%=resultRow%>"/></td>
                      <% } %>
                      <% if (resultRow.getStringItem("round3").equals("Eliminated")) { %>
                          <td class="sidebarText"><font color="#CC0000"><rsc:item name="round3" row="<%=resultRow%>"/></font></td>
                      <% } else { %>
                          <td class="sidebarText"><rsc:item name="round3" row="<%=resultRow%>"/></td>
                      <% } %>
                      <% if (resultRow.getStringItem("round4").equals("Eliminated")) { %>
                          <td class="sidebarText"><font color="#CC0000"><rsc:item name="round4" row="<%=resultRow%>"/></font></td>
                      <% } else { %>
                          <td class="sidebarText"><rsc:item name="round4" row="<%=resultRow%>"/></td>
                      <% } %>
                      <% if (resultRow.getStringItem("semi").equals("Eliminated")) { %>
                          <td class="sidebarText"><font color="#CC0000"><rsc:item name="semi" row="<%=resultRow%>"/></font></td>
                      <% } else { %>
                          <td class="sidebarText"><rsc:item name="semi" row="<%=resultRow%>"/></td>
                      <% } %>
                      <% if (resultRow.getStringItem("final").equals("Eliminated")) { %>
                          <td class="sidebarText"><font color="#CC0000"><rsc:item name="final" row="<%=resultRow%>"/></font></td>
                      <% } else { %>
                          <td class="sidebarText"><rsc:item name="final" row="<%=resultRow%>"/></td>
                      <% } %>
                   </tr>
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
