<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>2006 TopCoder Collegiate Challenge - Logo Design Contest</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

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
        <td width="180"><jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%" align="center">

         <div class="pageSpacer">

            <div class="logoBox"><img src="/i/tournament/tccc06/logo_logo.gif" alt="TCCC06 Logo Contest" border="0"/></div><br>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="overview"/>
            </jsp:include>
            </div>

            <br><br>
            <span class="bodySubtitle">Design the 2006 TopCoder Collegiate Challenge Logo</span><br>
            The 2006 TopCoder Collegiate Challenge Logo Design Contest has arrived!  We are looking for all designers, from professionals to amateurs, to take their best shot at crafting the logo for the TCCC06.  We're giving out $5,000 in cash prizes!
            <br><br>
            To put your creativity to the test, just send us a logo design that we can use to brand this year's TCCC &mdash; including our website, t-shirts, the stage at the onsite finals, and anywhere else the TCCC name might appear. All TopCoder members are welcome to submit, and all members will have the chance to vote on the finalists selected by TopCoder staff. For more details and submission guidelines, review the <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_rules">Official Contest Rules</A>.
            <br><br>
            <b>Know someone who would be interested? Invite them to join TopCoder!</b>
            <br><br>
            <b>Not a TopCoder member yet?</b><br>
            <A href="/reg/">Register here</A>
            <br><br>
            <b>Make sure you read the contest rules:</b><br>
            <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_rules">Read the rules</A>
            <br><br>
            <b>Helpful Logo Design Hints</b><br>
            You may find the information at the sites below helpful when starting your logo design.
            <br>
            <A href="/?t=sponsor&c=link&link=http://www.fizbang.com/1-3-06.php" target="blank">http://www.fizbang.com/1-3-06.php</A><br>
            <A href="/?t=sponsor&c=link&link=http://www.mymarkets.com/lm/01.htm" target="blank">http://www.mymarkets.com/lm/01.htm</A><br>
            <A href="/?t=sponsor&c=link&link=http://www.attitudedesign.co.uk/journal/?p=41" target="blank">http://www.attitudedesign.co.uk/journal/?p=41</A>
            
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