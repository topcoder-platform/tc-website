<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Logo Design Contest</title>
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
            <jsp:include page="/includes/global_left.jsp">
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

            <div class="logoBox"><img src="/i/tournament/tco06/logo_logo.gif" alt="TCO06 Logo Contest" border="0"/></div>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="overview"/>
            </jsp:include>
            </div>

            <br><br>
            <span class="bodySubtitle">Design the face of the TCO06</span><br>
            The TCO05 Logo Design Contest had such a great turnout (over 500 valid submissions!) that we decided to do it again.  We're giving out <b>$5000 in cash prizes</b> for the top 5 submissions.
            <br><br>
            TopCoder would like to give any member the opportunity to put their creativity to the test and come up with the logo design that we'll be using to brand this year's TCO.  That includes our website, t-shirts, the stage at the onsite finals, and anywhere else that the TCO might show up.  So here is your chance to express what TopCoder tournaments mean to you, by designing the face of this year's TopCoder Open.  All TopCoder members are welcome to vote on 10 finalists selected by the TopCoder staff.
            <br><br>
            <b>Not a TopCoder member yet?</b><br>
            <A href="/Registration">Register here</A>
            <br><br>
            <b>Make sure you read the contest rules:</b><br>
            <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_rules">Read the rules</A>
            <br><br>
            <b>Ready to submit your design?</b><br>
            <A href="/tc?module=TCO06LogoTerms">Submit now</A>
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
