<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco03_advancers"); %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
}
</SCRIPT>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="charity"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_overview"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                  </tr>
               </table>

<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>



               <blockquote>
               <h2>Advancers</h2>
               </blockquote>
<!-- Online Rounds begins -->

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="2" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="crpfTitle" width="100%" colspan="3" bgcolor="#4E9DD5">Round 1</td>
               </tr>
                <tr>
                    <td class="crpfAdvancersSort" width="25%" align="left" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=crpf_advancers&rd=<%=rsc.getIntItem(0, "round_id")%>&<%=DataAccessConstants.SORT_COLUMN%>=handle_sort&<%=DataAccessConstants.SORT_DIRECTION%>=asc">Handle</a></td>
                    <td class="crpfAdvancersSort" width="25%" align="right" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=crpf_advancers&rd=<%=rsc.getIntItem(0, "round_id")%>&<%=DataAccessConstants.SORT_COLUMN%>=rating&<%=DataAccessConstants.SORT_DIRECTION%>=desc">Rating</a></td>
                    <td class="crpfAdvancersSort" width="50%" align="right" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=crpf_advancers&rd=<%=rsc.getIntItem(0, "round_id")%>&<%=DataAccessConstants.SORT_COLUMN%>=points&<%=DataAccessConstants.SORT_DIRECTION%>=desc">Points</a></td>
               </tr>
                <rsc:iterator list="<%=rsc%>" id="resultRow">
                    <tr valign="top">
                        <td class="sidebarText" align="left"><A HREF="/stat?c=member_profile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>" CLASS="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item name="handle" row="<%=resultRow%>"/></A></td>
                        <td class="sidebarText" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                        <td class="sidebarText" align="right"><rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
                    </tr>
                </rsc:iterator>
            </table><br />
<!-- Online Rounds ends -->
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>