<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>');
}
</SCRIPT>

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
   <jsp:param name="selectedTab" value="coding_rules"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="coding_rules"/>
   <jsp:param name="selectedTab" value="prizes"/>
</jsp:include>

            <h2>About the Prizes</h2>

            <p>The tournament will award prizes to all competitors in Online Round #1 and $100,000 in cash prizes. Up to 500 competitors will
            receive a prize for competing in Online Round #1, and up to 200 eligible competitors will receive cash prizes.
            Any and all applicable taxes on prizes, including the cost of a guest attending the onsite rounds, are the sole
            responsibility of the prizewinner. Prizes will be distributed as follows:</p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">500 competitors who compete in Online Round #1</td>
                    <td width="50%" class="sidebarText" align="right">Limited edition 2003 TopCoder Open sponsored by Intel&#174;  t-shirt</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">200 competitors who advance to and compete in Online Round #2</td>
                    <td width="50%" class="sidebarText" align="right">$25 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">100 competitors who advance to and compete in Online Round #3</td>
                    <td width="50%" class="sidebarText" align="right">$50 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">50 competitors who advance to and compete in Online Round #4</td>
                    <td width="50%" class="sidebarText" align="right">$100 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">12 Semifinalists* who compete in one of four Semifinal rounds but do not advance to the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$1,000 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">4<span class="super">th</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$3,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">3<span class="super">rd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$5,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">2<span class="super">nd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$15,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">1<span class="super">st</span> place finisher* - Tournament Champion</td>
                    <td width="50%" class="sidebarText" align="right">$50,000</td>
                </tr>

                <tr>
                    <td colspan="2" class="sidebarText">* Prize will be awarded at the conclusion of the Championship Round.
                        Winner must be present at the onsite rounds to receive prize.</td>
                </tr>
            </table>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
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
