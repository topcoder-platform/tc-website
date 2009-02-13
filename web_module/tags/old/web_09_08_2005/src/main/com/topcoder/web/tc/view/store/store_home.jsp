<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Gear Store</title>

<jsp:include page="../script.jsp" />

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
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
          		<tr><td height="15"><img src="/i/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
		        <tr><td align="center"><a href="/tc?module=Static&d1=store&d2=tshirt_gray" ><img src="/i/store/store_home_a.gif" alt="TopCoder Gear Store" width="540" height="58" border="0" /></a><br/>
                <a href="/tc?module=Static&d1=store&d2=tshirt_gray" ><img src="/i/store/store_home_b.jpg" alt="TopCoder Gear Store" width="540" height="441" border="0" /></a></td></tr>
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
