<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>');
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
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

            <h2>Advancers</h2>

            <p>Click a column name to sort the list of advancers by that column.</p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="0" class="formFrame">
               <tr>
                  <td width = "10%" align = "right" class="bracket_header"><a class="topLink" href="/">Seed</a></td>
                  <td width = "15%" align = "left" class="bracket_header"><a class="topLink" href="/">Handle</a></td>
                  <td width = "15%" align = "right" class="bracket_header"><a class="topLink" href="/">Rating</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="/">Round 1</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="/">Round 2</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="/">Round 3</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="/">Round 4</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="/">Semi</a></td>
                  <td width = "10%" align = "center" class="bracket_header"><a class="topLink" href="/">Final</a></td>
               </tr>
                   <tr>
                      <td align = "right" class="advancers_list">1</td>
                      <td align = "left" class="advancers_list">ntrefz</td>
                      <td align = "right" class="advancers_list">1111</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">champion</td>
                   </tr>
                   <tr>
                      <td align = "right" class="advancers_list">1</td>
                      <td align = "left" class="advancers_list">ntrefz</td>
                      <td align = "right" class="advancers_list">1111</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText"><font color=red>eliminated</font></td>
                   </tr>
                   <tr>
                      <td align = "right" class="advancers_list">1</td>
                      <td align = "left" class="advancers_list">ntrefz</td>
                      <td align = "right" class="advancers_list">1111</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText"><font color=red>eliminated</font></td>
                      <td class="sidebarText">&#160;</td>
                   </tr>
                   <tr>
                      <td align = "right" class="advancers_list">1</td>
                      <td align = "left" class="advancers_list">ntrefz</td>
                      <td align = "right" class="advancers_list">1111</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText"><font color=red>eliminated</font></td>
                      <td class="sidebarText">&#160;</td>
                      <td class="sidebarText">&#160;</td>
                   </tr>
                   <tr>
                      <td align = "right" class="advancers_list">1</td>
                      <td align = "left" class="advancers_list">ntrefz</td>
                      <td align = "right" class="advancers_list">1111</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText">advanced</td>
                      <td class="sidebarText"><font color=red>eliminated</font></td>
                      <td class="sidebarText">&#160;</td>
                      <td class="sidebarText">&#160;</td>
                      <td class="sidebarText">&#160;</td>
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
