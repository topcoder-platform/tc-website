<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Logo Design Contest</title>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>

<style type="text/css">
.pageSpacer
{
   width: 510px;
	padding: 15px 0px 10px 0px;
   text-align: left;
}
.logoBox {
   text-align: center;
}

</style>

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
         <td class="bodyText" width="100%" align="center">

         <div class="pageSpacer">

            <div class="logoBox"><img src="/i/tournament/tco05/logo_logo.gif" alt="TCO05 Logo Contest" border="0"/></div>
            <div align="center">
   			<jsp:include page="logo_links.jsp" >
   			<jsp:param name="selectedTab" value="overview"/>
   			</jsp:include>
            </div>

            <br><br>
            <span class="bodySubtitle">Design the face of the TCO05</span><br>
            At this year's TopCoder Open we are adding yet another competition into the mix.  This time, we will be offering any member a chance to win $2500 by designing the tournament logo for the TCO05!
            <br><br>
            TopCoder would like to give any member the opportunity to put their creativity to the test and come up with the logo design that we'll be using to brand this year's TCO.  That includes our website, t-shirts, the stage at the onsite finals, and anywhere else that the TCO might show up.  So here is your chance to express what TopCoder tournaments mean to you, by designing the face of this year's TopCoder Open.
            <br><br>
            <b>Color guidelines</b><br>
            <img src="/i/tournament/tco05/logo_colors.gif" alt="" border="0" align="right" />
            We've selected these 2 colors on the right to be the "coloring theme", meaning you must use them in your logo design.  You are not limited to these 2 colors.  We will allow the use of black(000000), white(FFFFFF), or any gray in between.
            <br><br>
            <b>The Theme</b><br>
            Design a logo that will fit into the 2005 TopCoder Open theme: a high-speed race.  TopCoder contestants can be compared to the likes of racing cars, screaming airplanes, and thundering horses. Think of speed and accuracy, combined with all the pressure it takes to reach the end FIRST. Think of movement, noise, blurred colors and shapes. Thoughts and calculations careening through minds at warp speed. Yeah, we need a logo for that!
            <br><br>
            <b>Not a TopCoder member yet?</b><br>
            <A href="/Registration">Register here</A>
            <br><br>
            <b>Ready to submit your design?</b><br>
            <A href="/tc?module=TCO05LogoTerms">Submit now</A>
         </div>

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
