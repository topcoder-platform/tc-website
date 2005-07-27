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
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value=""/>
</jsp:include>

<br/>

<table width="500" border="0" cellspacing="3" cellpadding="0" align="center">
    <tr valign="top">
        <td width="100%" class="bodyText"  valign="top">
            <p><span class="bodySubtitle">Algorithm competition results</span></p>
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Place</td>
                    <td class="sidebarTitle">Seed</td>
                    <td width="33%" class="sidebarTitle">Competitor</td>
                    <td width="33%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td class="sidebarText">1st place finisher - Algorithm Competition Champion</td>
                    <td class="sidebarText" align="center">1</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=144400">tomek</a></td>
                    <td class="sidebarText" align="right">$25,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">2nd place finisher</td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=152347">ZorbaTHut</a></td>
                    <td class="sidebarText" align="right">$9,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">3rd place finisher</td>
                    <td class="sidebarText" align="center">3</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=270505">John Dethridge</a></td>
                    <td class="sidebarText" align="right">$4,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">4th place finisher</td>
                    <td class="sidebarText" align="center">2</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=260835">reid</a></td>
                    <td class="sidebarText" align="right">$2,000</td>
                </tr>
            </table>

            <br/>

            <p><span class="bodySubtitle">Design competition results</span></p>
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Place</td>
                    <td class="sidebarTitle">Seed</td>
                    <td width="33%" class="sidebarTitle">Competitor</td>
                    <td width="33%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td class="sidebarText">1st place finisher - Design Competition Champion</td>
                    <td class="sidebarText" align="center">1</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=277356">aksonov</a></td>
                    <td class="sidebarText" align="right">$25,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">2nd place finisher</td>
                    <td class="sidebarText" align="center">2</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=278342">adic</a></td>
                    <td class="sidebarText" align="right">$9,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">3rd place finisher</td>
                    <td class="sidebarText" align="center">3</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=289824">MPhk</a></td>
                    <td class="sidebarText" align="right">$4,000</td>
                </tr>
            </table>

            <br/>

            <p><span class="bodySubtitle">Development competition results</span></p>
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Place</td>
                    <td class="sidebarTitle">Seed</td>
                    <td width="33%" class="sidebarTitle">Competitor</td>
                    <td width="33%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td class="sidebarText">1st place finisher - Development Competition Champion</td>
                    <td class="sidebarText" align="center">1</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=7389864">roma</a></td>
                    <td class="sidebarText" align="right">$15,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">2nd place finisher</td>
                    <td class="sidebarText" align="center">2</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=153089">preben</a></td>
                    <td class="sidebarText" align="right">$2,500</td>
                </tr>
                <tr>
                    <td class="sidebarText">3rd place finisher</td>
                    <td class="sidebarText" align="center">3</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=268851">gladius</a></td>
                    <td class="sidebarText" align="right">$1,500</td>
                </tr>
            </table>

        </td>
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
