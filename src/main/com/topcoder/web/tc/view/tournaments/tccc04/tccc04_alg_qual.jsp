<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tccc04_alg_qual"); %>

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
   <jsp:param name="tabLev3" value="qualification"/>

</jsp:include>

            <h2>Advancers</h2>

            <p>Click a column name to sort the list of advancers by that column.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                  <td class="header" width="100%" colspan="5">Qualification Round</td>
               </tr>
                <tr>
                   <td class="testTableTitle_off" width="10%" align="center">
                       <a class="statTextBig" href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=seed&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Seed
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="left">
                       <a class="statTextBig" href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Handle
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="center">
                       <a class="statTextBig" href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=round_name&<%=DataAccessConstants.SORT_DIRECTION%>=asc">
                           Problem Set
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="15%" align="right">
                       <a class="statTextBig" href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=rating&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                           Rating
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="15%" align="right">
                       <a class="statTextBig" href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true&<%=DataAccessConstants.SORT_COLUMN%>=points&<%=DataAccessConstants.SORT_DIRECTION%>=desc">
                           Points
                       </a>
                   </td>
                </tr>

                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow"><tr class="formHandleOdd">
<td class="<%=even?"formHandleEven":"formHandleOdd"%>" align="center"><rsc:item name="seed" row="<%=resultRow%>"/></td>
<td class="<%=even?"formHandleEven":"formHandleOdd"%>" align="left"><A HREF="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>" CLASS="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item name="handle" row="<%=resultRow%>"/></A></td>
<td class="<%=even?"formHandleEven":"formHandleOdd"%>" align="center" nowrap="0"><rsc:item name="round_name" row="<%=resultRow%>"/></td>
<td class="<%=even?"formHandleEven":"formHandleOdd"%>" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
<td class="<%=even?"formHandleEven":"formHandleOdd"%>" align="right"><rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
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
