<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
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
            
        <p class=bigTitle>Advancers</p>

            <table width="500" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                  <td class="advTitle" width="100%" colspan="5">Qualification Round</td>
               </tr>
                <tr class="advHeader">
                   <td width="10%" align="center">
                       <a href="/">
                           Seed
                       </a>
                   </td>
                   <td width="30%" align="left">
                       <a href="/">
                           Handle
                       </a>
                   </td>
                   <td width="30%" align="center">
                       <a href="/">
                           Problem Set
                       </a>
                   </td>
                   <td width="15%" align="right">
                       <a href="/">
                           Rating
                       </a>
                   </td>
                   <td width="15%" align="right">
                       <a href="/">
                           Points
                       </a>
                   </td>
                </tr>
               <tr class="advanceLt">
                  <td align="center">1</td>
                  <td align="left"><A HREF="/" CLASS="coderTextRed">handle</A></td>
                  <td align="center" nowrap="nowrap">1</td>
                  <td align="right">1000</td>
                  <td align="right">1000</td>
               </tr>
               <tr class="advanceDk">
                  <td align="center">1</td>
                  <td align="left"><A HREF="/" CLASS="coderTextYellow">handle</A></td>
                  <td align="center" nowrap="nowrap">1</td>
                  <td align="right">1000</td>
                  <td align="right">1000</td>
               </tr>
               <tr class="advanceLt">
                  <td align="center">1</td>
                  <td align="left"><A HREF="/" CLASS="coderTextBlue">handle</A></td>
                  <td align="center" nowrap="nowrap">1</td>
                  <td align="right">1000</td>
                  <td align="right">1000</td>
               </tr>
               <tr class="advanceDk">
                  <td align="center">1</td>
                  <td align="left"><A HREF="/" CLASS="coderTextGreen">handle</A></td>
                  <td align="center" nowrap="nowrap">1</td>
                  <td align="right">1000</td>
                  <td align="right">1000</td>
               </tr>
               <tr class="advanceLt">
                  <td align="center">1</td>
                  <td align="left"><A HREF="/" CLASS="coderTextGray">handle</A></td>
                  <td align="center" nowrap="nowrap">1</td>
                  <td align="right">1000</td>
                  <td align="right">1000</td>
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
