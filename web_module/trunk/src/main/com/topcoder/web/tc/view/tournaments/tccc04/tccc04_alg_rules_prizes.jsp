<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

<jsp:include page="../../script.jsp" />

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
   <jsp:param name="tabLev2" value="rules"/>
   <jsp:param name="tabLev3" value="prizes"/>
</jsp:include>

            <h2>About the Prizes</h2>

            <p>The tournament will award prizes to up to 500 competitors and $38,000 in cash prizes.  Any and all applicable 
            taxes on prizes are the sole responsibility of the prizewinner.  Prizes will be distributed as follows:</p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">1st place finisher* - Algorithm Competition Champion</td>
                    <td width="50%" class="sidebarText" align="right">$25,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">2nd place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$7,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">3rd place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$4,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">4th place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$2,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">500 competitors who compete in Online Round #1 </td>
                    <td width="50%" class="sidebarText" align="right">Limited edition 2004 TopCoder Collegiate Challenge t-shirt</td>
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
