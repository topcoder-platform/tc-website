<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
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

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="advancers"/>
   <jsp:param name="tabLev3" value="overview"/>
</jsp:include>

            <h2>Overview</h2>
            
            <p>This will be Dok's advancers/elimination page.</p>

            <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                <tr>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Seed</a></td>
                    <td width = "15%" class="brac_head"><a class="topLink" href="">Handle</a></td>
                    <td width = "5%" align = "right" class="brac_head"><a class="topLink" href="">Rating</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 1</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 2</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 3</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Round 4</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Semi</a></td>
                    <td width = "10%" align = "center" class="brac_head"><a class="topLink" href="">Final</a></td>
                </tr>
                <tr>
                    <td align="center" class="formHandleEven">seed</td>
                    <td class="formHandleEven"><A HREF="">Handle</A></td>
                    <td class="formHandleEven">rating</td>
                    <td class="advanceDk">advanced</td>
                    <td class="advanceDk">advanced</td>
                    <td class="advanceDk">advanced</td>
                    <td class="eliminateDk">eliminated</td>
                    <td class="eliminateDk">&#160;</td>
                    <td class="eliminateDk">&#160;</td>
                </tr>
                <tr>
                    <td align="center" class="formHandleOdd">seed</td>
                    <td class="formHandleOdd"><A HREF="">Handle</A></td>
                    <td class="formHandleOdd">rating</td>
                    <td class="advanceLt">advanced</td>
                    <td class="advanceLt">advanced</td>
                    <td class="advanceLt">advanced</td>
                    <td class="eliminateLt">eliminated</td>
                    <td class="eliminateLt">&#160;</td>
                    <td class="eliminateLt">&#160;</td>
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
