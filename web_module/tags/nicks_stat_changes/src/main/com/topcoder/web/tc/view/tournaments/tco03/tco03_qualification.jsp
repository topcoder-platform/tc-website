<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

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

<jsp:include page="tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="coding_advancers"/>
   <jsp:param name="selectedTab" value="qualification"/>
</jsp:include>

            <h2>Advancers</h2>

             <table width="500" align="center" border="0" cellpadding="2" cellspacing="2" class="formFrame">
               <tr>
                  <td width = "40%" align = "left" class="advancers_header">Round</td>
                  <td width = "60%" align = "right" class="advancers_header">Advancers</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/tc?module=SimpleStats&c=tco03_top100" class="topLink">Top 100</a></td>
                  <td align = "right" class="advancers_faded"><a href="/tc?module=SimpleStats&c=tco03_top100">100</a></td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4700&trans=true" class="topLink">Qualification Round 1</a></td>
                  <td align = "right" class="advancers_faded"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4700&trans=true">200</a></td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4701&trans=true" class="topLink">Qualification Round 2</a></td>
                  <td align = "right" class="advancers_faded"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4701&trans=true">200</a></td>
               </tr>
            </table>
            <br/><br/>

<%--
            <table width="500" align="center" border="0" cellpadding="2" cellspacing="2" class="formFrame">
               <tr>
                  <td width = "40%" align = "left" class="advancers_header">Round</td>
                  <td width = "15%" align = "right" class="advancers_header">Advancers</td>
                  <td width = "15%" align = "right" class="advancers_header">Room Winners</td>
                  <td width = "15%" align = "right" class="advancers_header">Wildcards</td>
                  <td width = "15%" align = "right" class="advancers_header">radeye's Odds</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4702&trans=true" class="topLink">Online Round 1</a></td>
                  <td align = "right" class="advancers_faded"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4702&trans=true">200</a></td>
                  <td align = "right" class="advancers_faded"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4702&trans=true">47</a></td>
                  <td align = "right" class="advancers_faded"><a href="/tc?module=SimpleStats&c=tco03_advancers&rd=4702&trans=true">153</a></td>
                  <td align = "right" class="advancers_faded"><A href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd1','radeye1',900,600);">view</A></td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><A href="/tc?module=SimpleStats&c=tco03_advancers&rd=4703&trans=true" class="topLink">Online Round 2</A></td> 
                  <td align = "right" class="advancers_faded"><A href="/tc?module=SimpleStats&c=tco03_advancers&rd=4703&trans=true">100</A></td>
                  <td align = "right" class="advancers_faded"><A href="/tc?module=SimpleStats&c=tco03_advancers&rd=4703&trans=true">20</A></td>
                  <td align = "right" class="advancers_faded"><A href="/tc?module=SimpleStats&c=tco03_advancers&rd=4703&trans=true">80</A></td>
                  <td align = "right" class="advancers_faded"><A href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd2','radeye2',900,600);">view</A></td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid">Online Round 3</td>
                  <td align = "right" class="advancers_faded">TBD</td>
                  <td align = "right" class="advancers_faded">TBD</td>
                  <td align = "right" class="advancers_faded">TBD</td>
                  <td align = "right" class="advancers_faded"><A href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd3','radeye3',900,600);">view</A></td>
               </tr>
            </table>
--%>

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
