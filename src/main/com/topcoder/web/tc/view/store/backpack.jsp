<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Gear Store</title>

<jsp:include page="../../script.jsp" />

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
                <jsp:param name="level1" value="home"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" align="center">
    <table width="500" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/i/clear.gif" alt="" width="10" height="15" border="0" colspan="5" /></td></tr>
                <tr><td align="center" colspan="5" BGcolor="#CCCCCC"><img src="/i/store/store_logo.gif" alt="TopCoder Gear Store" width="540" height="77" border="0" /></td></tr>
                <tr BGcolor="#CCCCCC">
                    <td><img src="/i/clear.gif" alt="" width="28" height="15" border="0" /></td>
                    <td BGcolor="#FFFFFF"><img src="/i/store/backpack.jpg" alt="Backpack" width="328" height="326" border="0" /></td>
                    <td><img src="/i/clear.gif" alt="" width="5" height="15" border="0" /></td>
                    <td BGcolor="#CC0000">
                        <jsp:include page="inventory.jsp" />
                    </td>
                    <td><img src="/i/clear.gif" alt="" width="28" height="15" border="0" /></td>
                </tr>
                <tr BGcolor="#CCCCCC">
                    <td><img src="/i/clear.gif" alt="" width="28" height="15" border="0" /></td>
                    <td class="bodyText" colspan="3">   
                                 <table width="100%" border="0" cellpadding="5" cellspacing="0">
                                    <tr><td colspan="3" class="bodyText"> The computer backpack, is pewter and has the TopCoder logo embroidered on it. </td></tr>
                                    <tr>
                                        <td valign="middle" nowrap>$34.95</td>
                                        <td valign="middle" width="100%" nowrap>
                                        <button type="submit" onClick="window.open(http://promo.askallied.com/topcoder/index.cfm?nav=proddet&CatID=69450&PID=309541&name=Go%20Shopping, 'buyWindow');" value="Buy Now" class="bodyText">Buy Now</button>
                                        </td>
                                    </tr>
                                </table>
                    </td>
                   <td colspan="3"></td>
                </tr>
   </table>

            <p><br></p>
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
