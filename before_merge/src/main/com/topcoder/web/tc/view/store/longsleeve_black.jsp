<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Gear Store</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
    function doSubmit(selection) {
      sel = selection.options[selection.selectedIndex].value;
      if (sel == "#") {
        alert("Please choose a size from the menu.");
        selection.focus();
      } else {
        window.open(sel, 'buyWindow');
      }
    }
</SCRIPT>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="store"/>
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
                    <td BGcolor="#FFFFFF"><img src="/i/store/longsleeve_black.jpg" alt="Short Sleeve T-Shirt, Gray" width="328" height="326" border="0" /></td>
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
                                    <tr><td colspan="3" class="bodyText">The 6.1oz 100% ring-spun cotton,long sleeve, heavyweight beefy ash t-shirt has double needle hems, and is taped shoulder to shoulder. The TopCoder logo is silkscreened on the left chest and on the upper back.</td></tr>
                                    <tr>
                                        <form name="sizeSelect">
                                        <td valign="middle" nowrap>$26.95 ($28.95 for XXL)</td>
                                        <td valign="middle" class="bodyText">
                                          <select name="menu" size="1" class="dropdown">
                                             <option SELECTED VALUE="#">Select a Size:</option>
                                             <option value="http://promo.askallied.com/topcoder/index.cfm?nav=proddet&CatID=69450&PID=309536&name=TopCoder%20Gear">Small</option>
                                             <option value="http://promo.askallied.com/topcoder/index.cfm?nav=proddet&CatID=69450&PID=309537&name=TopCoder%20Gear">Medium</option>
                                             <option value="http://promo.askallied.com/topcoder/index.cfm?nav=proddet&CatID=69450&PID=309538&name=TopCoder%20Gear">Large</option>
                                             <option value="http://promo.askallied.com/topcoder/index.cfm?nav=proddet&CatID=69450&PID=309539&name=TopCoder%20Gear">X-Large</option>
                                             <option value="http://promo.askallied.com/topcoder/index.cfm?nav=proddet&CatID=69450&PID=309540&name=TopCoder%20Gear">XX-Large</option>
                                          </select>
                                          </td>
                                          <td valign="middle" class="bodyText" width="100%">
                                          <input type="button" onClick="doSubmit(document.sizeSelect.menu);" value="Buy Now" class="bodyText">
                                          </td>
                                        </form>
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
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
