<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Design</title>

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
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="design"/>
   <jsp:param name="tabLev3" value="finalists"/>
</jsp:include> 

            <h2 align="center">Congratulations to 4 finalists in the TCCC Design Competion!</h2>

<!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="450" align="center" class="formFrame">
                <tr valign="middle">
                    <td class="advTitle" colspan="3">Design Finalists</td>
                </tr>
                <tr valign="middle">
                    <td class="advHeader" width="20%" align="left">Handle</td>
                    <td class="advHeader" width="60%" align="right">Score</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=278342">adic</a></td>
                    <td class="advCell" align="right">81.15</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="advCell" align="right">78.00</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=289824">MPhk</a></td>
                    <td class="advCell" align="right">77.25</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="advCell" align="right">76.57</td>
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
