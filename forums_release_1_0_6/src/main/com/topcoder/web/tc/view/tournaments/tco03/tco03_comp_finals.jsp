<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

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
            <jsp:include page="/includes/global_left.jsp">
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

            <p>
View the component tournament progress live!  Every half hour, the
latest submissions from both the designers and developers will be posted
on the Live Updates page!  Each submission will include the latest
class, sequence and use case diagrams as well as the component
specification and java files.  You can also see the initial review
scorecards for each competitor.  Click on the "View" buttons below to
launch the submissions browser!
            </p>
            <p>
Don't forget to watch the competitors stage their appeals and discuss
their submissions with the review board and the project managers live in
the Arena applet.
            </p>


            <table border="0" cellspacing="0" cellpadding="5" width="500" align="center">
            <tr>
            <td align="left" valign="top" width="50%">

            <table border="0" cellspacing="0" cellpadding="3" width="250" align="center" class="formFrame">
               <tr>
                  <td class="header" align="center" colspan="3">Design Finals</td>
               <tr>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right" width="40%"></td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right" width="30%"><A href="/stat?tc?module=MemberProfile&cr=119676" class="coderTextYellow">Pops</a>&#160;&#160;</td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right" width="30%"><A href="/stat?tc?module=MemberProfile&cr=152342" class="coderTextYellow">kyky</a>&#160;&#160;</td>
               </tr>
               <tr>
                  <td class="formTextOdd" align="left">Member since:</td>
                  <td class="formTextOdd" align="right">04.17.01&#160;&#160;</td>
                  <td class="formTextOdd" align="right">08.02.01&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="formTextEven" align="left">Total earnings:</td>
                  <td class="formTextEven" align="right">$15,966.62&#160;&#160;</td>
                  <td class="formTextEven" align="right">$4,670.75&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="formTextOdd" align="left">TC rating:</td>
                  <td class="formTextOdd" align="right">1703&#160;&#160;</td>
                  <td class="formTextOdd" align="right">2138&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="formTextEven" align="left">Initial score:</td>
                  <td class="formTextEven" align="right">92.63&#160;&#160;</td>
                  <td class="formTextEven" align="right">86.87&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="bodyText" align="left" bgcolor="#FFCC00"><b>Final score:</b></td>
                  <td class="bodyText" align="right" bgcolor="#FFCC00"><b>92.24&#160;&#160;</b></td>
                  <td class="bodyText" align="right" bgcolor="#FFCC00"><b>86.65&#160;&#160;</b></td>
                </tr>
               <tr>
                  <td class="statTextLarge" background="/i/graybv_bg.gif"><strong>Live Updates:</td>
                  <td class="statTextLarge" background="/i/graybv_bg.gif"align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=pops_final_doc1','pops',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
                  <td class="statTextLarge" background="/i/graybv_bg.gif"align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=kyky_final_doc1','kyky',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
               </tr>
            </table>

            </td>
            <td align="right" valign="top" width="50%">

            <table border="0" cellspacing="0" cellpadding="3" width="250" align="center" class="formFrame">
               <tr>
                  <td class="header" align="center" colspan="3">Development Finals</td>
               </tr>
               <tr>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right" width="40%"></td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right" width="30%"><A href="/stat?tc?module=MemberProfile&cr=277356" class="coderTextYellow">aksonov</a>&#160;&#160;</td>
                  <td background="/i/graybv_bg.gif" class="statTextLarge" align="right" width="30%"><A href="/stat?tc?module=MemberProfile&cr=154714" class="coderTextBlue">rnielsen</a>&#160;&#160;</td>
               </tr>
               <tr>
                  <td class="formTextOdd" align="left">Member since:</td>
                  <td class="formTextOdd" align="right">04.17.02&#160;&#160;</td>
                  <td class="formTextOdd" align="right">09.10.01&#160;&#160;</td>
               </tr>
                <tr>
                  <td class="formTextEven" align="left">Total earnings:</td>
                  <td class="formTextEven" align="right">$5,193.45&#160;&#160;</td>
                  <td class="formTextEven" align="right">$24.00&#160;&#160;</td>
               </tr>
                <tr>
                  <td class="formTextOdd" align="left">TC rating:</td>
                  <td class="formTextOdd" align="right">1572&#160;&#160;</td>
                  <td class="formTextOdd" align="right">1293&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="formTextEven" align="left">Initial score:</td>
                  <td class="formTextEven" align="right">85.31&#160;&#160;</td>
                  <td class="formTextEven" align="right">84.71&#160;&#160;</td>
                </tr>
                <tr>
                  <td class="bodyText" align="left" bgcolor="#FFCC00"><b>Final score:</b></td>
                  <td class="bodyText" align="right" bgcolor="#FFCC00"><b>66.06&#160;&#160;</b></td>
                  <td class="bodyText" align="right" bgcolor="#FFCC00"><b>88.70&#160;&#160;</b></td>
                </tr>
               <tr>
                  <td class="statTextLarge" background="/i/graybv_bg.gif"><strong>Live Updates:</td>
                  <td class="statTextLarge" background="/i/graybv_bg.gif"align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=aksonov_final_doc1','aksonov',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
                  <td class="statTextLarge" background="/i/graybv_bg.gif"align="right"><A class="topLink" href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=comp_docs&d4=rnielsen_final_doc1','rnielsen',800,600);"><img src="/i/view.gif" border="0" width="60" height="18"/></A></td>
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
