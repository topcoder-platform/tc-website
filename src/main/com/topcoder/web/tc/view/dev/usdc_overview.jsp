<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />


<!-- Tab bar links-->
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="overview"/>
</jsp:include>


<h2>Overview</h2>

<p><img src="/i/development/usdc/gladius.jpg" width="200" height="136" border="0" align="right">TopCoder is excited to announce the Ultimate Software Development Contest (USDC)!  Now, TopCoder members can compete for 
numerous prizes while designing and developing software components.  Long gone are the days of waiting to see if new projects 
are available, rushing to register for the newest components, or anxiously awaiting the next major TopCoder tournament.  
Now, consistent competitive software development is at your finger-tips, with more prizes than ever!</p>

<ul>
<li><strong>Dates:</strong><br/>
June 1, 2004 through September 2, 2004</li>
<li><strong>Prizes:</strong><br/>
$50,000 in total cash prizes, with:
	<ul><li>$1,600 paid each week</li>
	<li>$5,250 paid each month
	<li>$13,500 paid each quarter</li></ul>
(All prizes are in addition to current component project payments.*)
</li>
<p>*See <a href="/tc?module=Static&d1=dev&d2=usdc_rules">official rules</a> for details</p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
