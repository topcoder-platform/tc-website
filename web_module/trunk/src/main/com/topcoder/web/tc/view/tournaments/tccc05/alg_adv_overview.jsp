<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="overview"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Advancers - Overview</p>

            <p>Click a column title to sort the list of advancers by that column. Click <a href="?module=SimpleStats&c=tco04_alg_adv_overview&trans=true&d1=tournaments&d2=tco04&d3=alg_adv_overview">here</a> to reset the list to its originally sorted format.</p>

            <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr class="advHeader">
                    <td width = "10%" align = "center"><a href="/">Seed</a></td>
                    <td width = "15%"><a href="/">Handle</a></td>
                    <td width = "5%" align = "center"><a href="/">Rating</a></td>
                    <td width = "10%" align = "center"><a href="/">Round 1</a></td>
                    <td width = "10%" align = "center"><a href="/">Round 2</a></td>
                    <td width = "10%" align = "center"><a href="/">Round 3</a></td>
                    <td width = "10%" align = "center"><a href="/">Round 4</a></td>
                    <td width = "10%" align = "center"><a href="/">Semi</a></td>
                    <td width = "10%" align = "center"><a href="/">Wildcard</a></td>
                    <td width = "10%" align = "center"><a href="/">Final</a></td>
                </tr>
               <tr class="advanceLt">
                  <td align="center">test</td>
                  <td>test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
               </tr>
               <tr class="advanceDk">
                  <td align="center">test</td>
                  <td>test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
                  <td align="center">test</td>
               </tr>
            </table>
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
