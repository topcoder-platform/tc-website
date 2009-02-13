<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Final Round Photos</title>

<jsp:include page="../../../script.jsp" />

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
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
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

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="final"/>
</jsp:include>

            <p class="terciary">
                <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final">Play-by-Play</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;Video&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final_analysis">Problem Analysis</a>
            </p>
            
            <h2>and the winner is...</h2>

            <table border="0" cellspacing="0" width="400" cellpadding="3" align="center">
               <tr>
                  <td width="100%" class="bodyText" align="center">
                            <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" width="240" height="196" codebase="http://www.apple.com/qtactivex/qtplugin.cab"> 
                            <param name="src" value="/i/tournament/tco03/final/TCO_movie.mov"></param>
                            <param name="autoplay" value="true"></param>
                            <param name="controller" value="true"></param>
                            <embed src="/i/tournament/tco03/final/TCO_movie.mov" width="240" height="196" autoplay="true" controlloer="true" pluginspage="http://www.apple.com/quicktime/download/"></embed>
                            </object><br />
                  </td>
               </tr>
                  <td width="50%" class="bodyText" align="center"><A href="/i/tournament/tco03/final/TCO_movie.mov">right click to save (1.26MB)</A></td>
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
