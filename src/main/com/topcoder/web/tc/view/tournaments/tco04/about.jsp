<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>2004 TopCoder Open</p>

            <p><span class="bodySubtitle">Algorithm competition results</span></p>
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Place</td>
                    <td width="33%" class="sidebarTitle">Competitor</td>
                    <td width="33%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td class="sidebarText">1st place finisher - Algorithm Competition Champion</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=144400">tomek</a></td>
                    <td class="sidebarText" align="right">$20,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">2nd place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=272072">SnapDragon</a></td>
                    <td class="sidebarText" align="right">$10,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">3rd place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=260835">reid</a></td>
                    <td class="sidebarText" align="right">$5,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">4th place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=7445961">snewman</a></td>
                    <td class="sidebarText" align="right">$2,500</td>
                </tr>
            </table>

            <br/>

            <p><span class="bodySubtitle">Design competition results</span></p>
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Place</td>
                    <td width="33%" class="sidebarTitle">Competitor</td>
                    <td width="33%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td class="sidebarText">1st place finisher - Design Competition Champion</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=278342">adic</a></td>
                    <td class="sidebarText" align="right">$20,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">2nd place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=152342">kyky</a></td>
                    <td class="sidebarText" align="right">$10,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">3rd place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=277356">aksonov</a></td>
                    <td class="sidebarText" align="right">$5,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">4th place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=289824">MPhk</a></td>
                    <td class="sidebarText" align="right">$2,500</td>
                </tr>
            </table>

            <br/>

            <p><span class="bodySubtitle">Development competition results</span></p>
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Place</td>
                    <td width="33%" class="sidebarTitle">Competitor</td>
                    <td width="33%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td class="sidebarText">1st place finisher - Development Competition Champion</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=310233">Standlove</a></td>
                    <td class="sidebarText" align="right">$10,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">2nd place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=7270519">chippydip</a></td>
                    <td class="sidebarText" align="right">$4,000</td>
                </tr>
                <tr>
                    <td class="sidebarText">3rd place finisher</td>
                    <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=7463987">ShindouHikaru</a></td>
                    <td class="sidebarText" align="right">$2,500</td>
                </tr>
            </table>

            
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
