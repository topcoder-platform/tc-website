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
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/i/clear.gif" alt="" width="10" height="15" border="0" colspan="5" /></td></tr>
                <tr><td align="center" colspan="5"><img src="/i/store/store_logo.gif" alt="TopCoder Gear Store" width="540" height="77" border="0" /></td></tr>
                <tr BGcolor="#CCCCCC">
                    <td><img src="/i/clear.gif" alt="" width="28" height="15" border="0" /></td>
                    <td><img src="/i/store/tshirt_gray.jpg" alt="Short Sleeve T-Shirt, Gray" width="328" height="326" border="0" /></td>
                    <td><img src="/i/clear.gif" alt="" width="5" height="15" border="0" /></td>
                    <td>
                                <table BGcolor="#CC0000">
                                    <tr><td class="bodyText" align="left">Short Sleeve T-Shirt, Gray</td></tr>
                                    <tr><td class="bodyText" align="left">Short Sleeve T-Shirt, Black</td></tr>
                                    <tr><td class="bodyText" align="left">Long Sleeve T-Shirt, Gray</td></tr>
                                    <tr><td class="bodyText" align="left">Long Sleeve T-Shirt, Black</td></tr>
                                    <tr><td class="bodyText" align="left">Polo Shirt</td></tr>
                                    <tr><td class="bodyText" align="left">Hooded Jacket</td></tr>
                                    <tr><td class="bodyText" align="left">Backpack</td></tr>
                                    <tr><td><img src="/i/store/gear_watermark.gif" alt="TopCoder Gear Store" width="151" height="132" border="0" /></td></tr>
                                </table>
                    </td>
                    <td><img src="/i/clear.gif" alt="" width="28" height="15" border="0" /></td>
                </tr>
                <tr BGcolor="#CCCCCC">
                    <td><img src="/i/clear.gif" alt="" width="28" height="15" border="0" /></td>
                    <td class="bodyText">   
                                <table>
                                    <tr><td colspan="3" class="bodyText"> The 6.1oz 100% ring-spun cotton, heavyweight beefy ash t-shirt has double needle hems, and is 
                                    taped shoulder to shoulder. The Topcoder logo is silkscreened on the left chest and on the upper back. </td></tr>
                                    <tr>
                                        <td>$16.95</td>
                                        <td><img src="/i/clear.gif" alt="" width="75" height="18" border="0" /></td>
                                        <td><img src="/i/store/buy_button.gif" alt="Buy Now" width="63" height="18" border="0" /></td>
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
