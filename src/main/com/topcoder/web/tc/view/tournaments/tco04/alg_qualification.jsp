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

            <p>Click a column name to sort the list of advancers by that column.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                  <td class="header" width="100%" colspan="5">Qualification Round</td>
               </tr>
                <tr>
                   <td class="testTableTitle_off" width="10%" align="center">
                       <a class="statTextBig" href="">
                           Seed
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="left">
                       <a class="statTextBig" href="">
                           Handle
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="30%" align="center">
                       <a class="statTextBig" href="">
                           Problem Set
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="15%" align="right">
                       <a class="statTextBig" href="">
                           Rating
                       </a>
                   </td>
                   <td class="testTableTitle_off" width="15%" align="right">
                       <a class="statTextBig" href="">
                           Points
                       </a>
                   </td>
                </tr>
                <tr class="formHandleOdd">
					<td class="formHandleOdd" align="center">&#160;</td>
					<td class="formHandleOdd" align="left">&#160;</td>
					<td class="formHandleOdd" align="center">&#160;</td>
					<td class="formHandleOdd" align="right">&#160;</td>
					<td class="formHandleOdd" align="right">&#160;</td>
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
