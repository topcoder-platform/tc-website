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
   <jsp:param name="tabLev3" value="finals"/>
</jsp:include> 

            <h2>Design Finals</h2>

<!-- Design Winners Begins -->

            <table border="0" cellspacing="0" cellpadding="3" width="250" align="center" class="formFrame">
               <tr>
                  <td class="header" align="center" colspan="4">Design Finals</td>
               <tr>
                  <td class="advHeader" align="right" width="40%"></td>
                  <td class="advHeader" align="right" width="20%"><A href="/stat?c=member_profile&cr=278342">adic</a>&#160;&#160;</td>
                  <td class="advHeader" align="right"width="20%"><A href="/stat?c=member_profile&cr=277356">aksonov</a>&#160;&#160;</td>
                  <td class="advHeader" align="right" width="20%"><A href="/stat?c=member_profile&cr=289824">MPhk</a>&#160;&#160;</td>
               </tr>
               <tr>
                  <td class="advCell" align="left">Member since:</td>
                  <td class="advCell" align="right">04.17.01&#160;&#160;</td>
                  <td class="advCell" align="right">08.02.01&#160;&#160;</td>
                  <td class="advCell" align="right">04.17.01&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="advCell" align="left">Total earnings:</td>
                  <td class="advCell" align="right">$15,966.62&#160;&#160;</td>
                  <td class="advCell" align="right">$4,670.75&#160;&#160;</td>
                  <td class="advCell" align="right">$15,966.62&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="advCell" align="left">TC rating:</td>
                  <td class="advCell" align="right">1703&#160;&#160;</td>
                  <td class="advCell" align="right">2138&#160;&#160;</td>
                  <td class="advCell" align="right">1703&#160;&#160;</td>
                </tr>
                <tr>  
                  <td class="advCell" align="left">Initial score:</td>
                  <td class="advCell" align="right">92.63&#160;&#160;</td>
                  <td class="advCell" align="right">86.87&#160;&#160;</td>
                  <td class="advCell" align="right">92.63&#160;&#160;</td>
                </tr>
                <tr>  
                  <td class="advCell" align="left" bgcolor="#FFCC00"><b>Final score:</b></td>
                  <td class="advCell" align="right" bgcolor="#FFCC00"><b>92.24&#160;&#160;</b></td>
                  <td class="advCell" align="right" bgcolor="#FFCC00"><b>86.65&#160;&#160;</b></td>
                  <td class="advCell" align="right" bgcolor="#FFCC00"><b>92.24&#160;&#160;</b></td>
                </tr>
               <tr>
                  <td class="advHeader"><strong>Submissions:</td>
                  <td class="advHeader" align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc1','pops',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
                  <td class="advHeader" align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_final_doc1','kyky',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
                  <td class="advHeader" align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc1','pops',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
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
