<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Overview</title>

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

            <div align="center">
                <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />
                <img src="/i/promos/tco03/tco_home_comp_start_a.gif" alt="Component Competition starts Sept 2" width="540" height="165" border="0"/><br/>
                <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />
            </div>

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
            
            <table width="500" align="center" border="0" cellpadding="2" cellspacing="2" class="formFrame">
               <tr>
                  <td width = "40%" align = "left" class="advancers_header">Round</td>
                  <td width = "20%" align = "right" class="advancers_header">Advancers</td>
                  <td width = "20%" align = "right" class="advancers_header">Room Winners</td>
                  <td width = "20%" align = "right" class="advancers_header">Wildcards</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/index?t=tournaments&amp;c=tco03_top100" class="topLink">Top 100</a></td>
                  <td align = "right" class="advancers_faded"><a href="/index?t=tournaments&amp;c=tco03_top100">100</a></td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded">n/a</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/?&amp;t=tournaments&amp;c=tco03_advancers&amp;rd=4700" class="topLink">Qualification Round 1</a></td>
                  <td align = "right" class="advancers_faded"><a href="/?&amp;t=tournaments&amp;c=tco03_advancers&amp;rd=4700">200</a></td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded">n/a</td>
               </tr>
            </table>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
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
