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
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="qualification"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>Advancers</p>

            <h2>Overview</h2>

            <p>Click a column title to sort the list of advancers by that column. Click <a href="">here</a> to reset the list to its originally sorted format.</p>

            <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Seed</a></td>
                    <td width = "15%" class="brac_head"><a class="topLink" href="">Handle</a></td>
                    <td width = "5%" align = "center" class="brac_head"><a class="topLink" href="">Rating</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 1</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 2</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 3</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 4</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Semi</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Wildcard</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Final</a></td>
                </tr>
				<tr>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
					<td  class="advanceLt">&#160;</td>
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
