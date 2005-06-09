<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="home"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
		<td width="100%" align="center">
			<img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br/>
			<jsp:include page="big_promo.jsp" />
  			<jsp:include page="news.jsp" />
  			<jsp:include page="arena.jsp" />
		 </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
               <tr><td><img src="/i/clear.gif" width="180" height="5" border="0"></td></tr>
               <tr><td><img src="/i/top_10_lists_top.gif" alt="Competition Leaders" width="180" height="11" border="0"></td></tr>
               <tr><td><img src="/i/module_labels_comp_leaders.gif" alt="Competition Leaders" width="180" height="20" border="0" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_coders.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_designers.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_developers.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_schools.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_countries.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><img src="/i/home_right_bottom.gif" width="180" height="20" border="0" /></td></tr>
           </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
               <tr><td><img src="/i/clear.gif" width="180" height="5" border="0"></td></tr>
               <tr><td><img src="/i/home/right_list_top.gif" alt="" width="180" height="11" border="0"></td></tr>
               <tr><td><img src="/i/home/header_recent_placements.gif" alt="Recent Placements" border="0" /></td></tr>
               <tr><td><jsp:include page="recently_placed.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><img src="/i/home_right_bottom.gif" width="180" height="20" border="0" /></td></tr>
           </table>


            <p><br/></p>
         </td>
<!-- Right Column Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

