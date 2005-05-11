<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Design</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

<script>
function openWin(url, name) {
    win = window.open(url, name, "menubar=no,status=no,scrollbars=yes,resizable=yes,toolbar=no,width=800,height=600");
    win.location.href = url;
    win.focus();
}
</script>
    
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
   <jsp:param name="tabLev2" value="development"/> 
   <jsp:param name="tabLev3" value="finals"/>
</jsp:include> 

            <h2>Development Finals</h2>

<!-- Design Winners Begins -->

            <table border="0" cellspacing="0" cellpadding="3" width="400" align="center" class="formFrame">
               <tr>
                  <td class="header" align="center" colspan="4">Development Finals</td>
               <tr>
                  <td class="advHeader" align="right" width="40%"></td>
                  <td class="advHeader" align="right" width="20%"><A href="/tc?module=MemberProfile&cr=268851">gladius</a>&#160;&#160;</td>
                  <td class="advHeader" align="right"width="20%"><A href="/tc?module=MemberProfile&cr=153089">preben</a>&#160;&#160;</td>
                  <td class="advHeader" align="right" width="20%"><A href="/tc?module=MemberProfile&cr=7389864">roma</a>&#160;&#160;</td>
               </tr>
               <tr>
                  <td class="advCell" align="left">Member since:</td>
                  <td class="advCell" align="right">02.22.02&#160;&#160;</td>
                  <td class="advCell" align="right">08.19.01&#160;&#160;</td>
                  <td class="advCell" align="right">07.26.03&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="advCell" align="left">Development rating:</td>
                  <td class="advCell" align="right">714&#160;&#160;</td>
                  <td class="advCell" align="right">819&#160;&#160;</td>
                  <td class="advCell" align="right">997&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="advCell" align="left">Algorithm rating:</td>
                  <td class="advCell" align="right">1797&#160;&#160;</td>
                  <td class="advCell" align="right">814&#160;&#160;</td>
                  <td class="advCell" align="right">1646&#160;&#160;</td>
                </tr>
                <tr>  
                  <td class="advCell" align="left">Initial score:</td>
                  <td class="advCell" align="right">56.31&#160;&#160;</td>
                  <td class="advCell" align="right">73.46&#160;&#160;</td>
                  <td class="advCell" align="right">86.51&#160;&#160;</td>
                </tr>
                <tr>  
                  <td class="advCell" align="left" bgcolor="#FFCC00"><b>Final score:</b></td>
                  <td class="advCell" align="right" bgcolor="#FFCC00"><b>63.23&#160;&#160;</b></td>
                  <td class="advCell" align="right" bgcolor="#FFCC00"><b>64.83&#160;&#160;</b></td>
                  <td class="advCell" align="right" bgcolor="#FFCC00"><b>79.40&#160;&#160;</b></td>
                </tr>
               <tr>
                  <td class="advHeader"><strong>Submissions:</td>
                  <td class="advHeader" align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=gladius_init_doc1','pops',800,600);"><img src="/i/viewGray.gif" border="0" width="60" height="18"/></A></td>
                  <td class="advHeader" align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=preben_init_doc1','kyky',800,600);"><img src="/i/viewGray.gif" border="0" width="60" height="18"/></A></td>
                  <td class="advHeader" align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_finals&d4=roma_init_doc1','pops',800,600);"><img src="/i/viewGray.gif" border="0" width="60" height="18"/></A></td>
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
