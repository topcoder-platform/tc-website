<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tco03Links.jsp" >
   <jsp:param name="selectedContest" value="component"/>
   <jsp:param name="selectedTab" value="component_advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="component_advancers"/> 
   <jsp:param name="selectedTab" value="finals"/>
</jsp:include>

            <h2>Advancers</h2>
            <br/>
<!-- Design Winners Begins -->
<%--            <table border="0" cellspacing="0" cellpadding="3" width="510" align="center">
               <tr>
                  <td class="formHandleEven" align="left" width="30%">Statistics</td>
                  <td class="formHandleEven" align="center" width="17%">Pops</td>
                  <td class="formHandleEven" align="center" width="17%">kyky</td>
                  <td class="formHandleEven" align="center" width="17%">aksonov</td>
                  <td class="formHandleEven" align="center" width="17%">rnielsen</td>
                </tr>
                <tr>
                  <td class="formHandleOdd" align="left">Member since</td>
                  <td class="formHandleOdd" align="right">04.17.01</td>
                  <td class="formHandleOdd" align="right">08.02.01</td>
                  <td class="formHandleOdd" align="right">04.17.02</td>
                  <td class="formHandleOdd" align="right">09.10.01</td>
                </tr>
                <tr>
                  <td class="formHandleEven" align="left">Total earnings</td>
                  <td class="formHandleEven" align="right">$9,688.95</td>
                  <td class="formHandleEven" align="right">$1,225.75</td>
                  <td class="formHandleEven" align="right">$5,143.45</td>
                  <td class="formHandleEven" align="right">$0.00</td>
                </tr>
                <tr>
                  <td class="formHandleOdd" align="left">TC rating</td>
                  <td class="formHandleOdd" align="right">1745</td>
                  <td class="formHandleOdd" align="right">2170</td>
                  <td class="formHandleOdd" align="right">1511</td>
                  <td class="formHandleOdd" align="right">1293</td>
                </tr>
                <tr>
                  <td class="formHandleEven" align="left">TCO avg. score</td>
                  <td class="formHandleEven" align="right">93.92</td>
                  <td class="formHandleEven" align="right">80.53</td>
                  <td class="formHandleEven" align="right">93.80</td>
                  <td class="formHandleEven" align="right">92.63</td>
                </tr>
            </table>
            <br/>
--%>
            <table border="0" cellspacing="0" cellpadding="5" width="510" align="center">
            <tr>
            <td align="left" valign="top" width="50%">

            <table border="0" cellspacing="0" cellpadding="3" width="250" align="center" class="formFrame">
               <tr>
                  <td class="header" align="center" colspan="3">Design Finals</td>
               <tr>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right"></td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right"><A href="/" class="coderTextYellow">Pops</a></td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right"><A href="/" class="coderTextYellow">kyky</a></td>
               </tr>
               <tr>
                  <td class="formTextOdd" align="left">Member since</td>
                  <td class="formTextOdd" align="right">04.17.01</td>
                  <td class="formTextOdd" align="right">08.02.01</td>
                </tr>
                <tr>
                  <td class="formTextEven" align="left">Total earnings</td>
                  <td class="formTextEven" align="right">$5,143.45</td>
                  <td class="formTextEven" align="right">$0.00</td>
                </tr>
                <tr>
                  <td class="formTextOdd" align="left">TC rating</td>
                  <td class="formTextOdd" align="right">1511</td>
                  <td class="formTextOdd" align="right">1293</td>
                </tr>
                <tr>
                  <td class="formTextEven" align="left">TCO avg. score</td>
                  <td class="formTextEven" align="right">93.92</td>
                  <td class="formTextEven" align="right">80.53</td>
                </tr>
               <tr>
                  <td class="formTextOdd" align="left" width="40%">Current update</td>
                  <td class="formTextOdd" align="right" width="30%"><A href="/">view</A></td>
                  <td class="formTextOdd" align="right" width="30%"><A href="/">view</A></td>
               </tr>
            </table>
            
            </td>
            <td align="right" valign="top" width="50%">
            
            <table border="0" cellspacing="0" cellpadding="3" width="250" align="center" class="formFrame">
               <tr>
                  <td class="header" align="center" colspan="3">Development Finals</td>
               </tr>
               <tr>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right"></td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right"><A href="/" class="coderTextYellow">aksonov</a></td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right"><A href="/" class="coderTextBlue">rnielsen</a></td>
               </tr>
               <tr>
                  <td class="formTextOdd" align="left">Member since</td>
                  <td class="formTextOdd" align="right">04.17.02</td>
                  <td class="formTextOdd" align="right">09.10.01</td>
               </tr>
                <tr>
                  <td class="formTextEven" align="left">Total earnings</td>
                  <td class="formTextEven" align="right">$5,143.45</td>
                  <td class="formTextEven" align="right">$0.00</td>
               </tr>
                <tr>
                  <td class="formTextOdd" align="left">TC rating</td>
                  <td class="formTextOdd" align="right">1511</td>
                  <td class="formTextOdd" align="right">1293</td>
                </tr>
                <tr>
                  <td class="formTextEven" align="left">TCO avg. score</td>
                  <td class="formTextEven" align="right">93.80</td>
                  <td class="formTextEven" align="right">92.63</td>
                </tr>
               <tr>
                  <td class="formTextOdd" align="left" width="40%">Current update</td>
                  <td class="formTextOdd" align="right" width="30%"><A href="/">view</A></td>
                  <td class="formTextOdd" align="right" width="30%"><A href="/">view</A></td>
               </tr>
            </table>
            
            </td>
            </tr>
            </table>
         <p><br/></p>
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
