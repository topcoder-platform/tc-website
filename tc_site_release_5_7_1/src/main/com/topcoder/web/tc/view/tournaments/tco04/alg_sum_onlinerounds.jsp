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
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="online"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>Online Rounds</p>
		<br/>

                        <table width="400" class="formFrame" cellspacing="2" cellpadding="6" align="center">
                            <tr><td class="sidebarTitle" colspan="2">Problem Set Analyses</td></tr> 
                            <tr><td class="sidebarText">&#160;09.11.04</td><td class="sidebarText" nowrap="0">&#160;TCO04 - Online Round 1 - <a href="/tc?module=Static&d1=match_editorials&d2=tco04_online_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="sidebarText">&#160;09.14.04</td><td class="sidebarText" nowrap="0">&#160;TCO04 - Online Round 2 - <a href="/tc?module=Static&d1=match_editorials&d2=tco04_online_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="sidebarText">&#160;09.22.04</td><td class="sidebarText" nowrap="0">&#160;TCO04 - Online Round 3 - <a href="/tc?module=Static&d1=match_editorials&d2=tco04_online_rd_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="sidebarText">&#160;09.29.04</td><td class="sidebarText" nowrap="0">&#160;TCO04 - Online Round 4 - <a href="/tc?module=Static&d1=match_editorials&d2=tco04_online_rd_4">Problem Set &amp; Analysis</a></td></tr>
                        </table>
         <p><br/></p>

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