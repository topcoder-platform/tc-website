<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco03_advancers"); %>

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
   <jsp:param name="selectedTab" value="coding_overview"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

            <h2>Advancers</h2>

            <p>Click a column name to sort the list of advancers by that column.</p>

            <table width="400" align="center" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                  <td class="header" width="100%" colspan="4">Round ID</td>
               </tr>
                <tr>
                   <td class="testTableTitle_off" width="10%" align="center">
                       <a class="statTextBig" href="/">
                           Seed
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="left">
                       <a class="statTextBig" href="/">
                           Handle
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="right">
                       <a class="statTextBig" href="/">
                           Rating
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="right">
                       <a class="statTextBig" href="/">
                           Points
                       </a>
                   </td>
                </tr>

                <rsc:iterator list="<%=rsc%>" id="resultRow">
                    <tr class="advancers_list">
                       <td class="advancers_list" align="right"><rsc:item name="seed" row="<%=resultRow%>"/></td>
                       <td class="advancers_list" align="left"><rsc:item name="handle" row="<%=resultRow%>"/></td>
                       <td class="advancers_list" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                       <td class="advancers_list" align="right"><rsc:item name="points" row="<%=resultRow%>"/></td>
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
