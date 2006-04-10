<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Room 4 Photos</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="room4"/>
</jsp:include>

            <p class="terciary">
                <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room4">Play-by-Play</a>&nbsp;&nbsp;|&nbsp;&nbsp;Photos&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room4_analysis">Problem Analysis</a>
            </p>

            <h2>Room 4 Photos</h2>

            <p>by Kathryn DeStefano, <em>TopCoder Staff</em><br />
            Thursday, December 4, 2003</p>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/01.jpg');"><img src="/i/tournament/tco03/room4/01_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/02.jpg');"><img src="/i/tournament/tco03/room4/02_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/03.jpg');"><img src="/i/tournament/tco03/room4/03_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/04.jpg');"><img src="/i/tournament/tco03/room4/04_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/05.jpg');"><img src="/i/tournament/tco03/room4/05_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                    </td>
                </tr>

                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tco03/room4/01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>

                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/06.jpg');"><img src="/i/tournament/tco03/room4/06_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/07.jpg');"><img src="/i/tournament/tco03/room4/07_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/08.jpg');"><img src="/i/tournament/tco03/room4/08_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/09.jpg');"><img src="/i/tournament/tco03/room4/09_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tco03/room4/10.jpg');"><img src="/i/tournament/tco03/room4/10_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
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
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>