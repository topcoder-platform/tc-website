<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Component Final Round</title>

<jsp:include page="../../../script.jsp" />

</head>

<body onLoad="timer(1);">

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
   <jsp:param name="selectedTab" value="component_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="comp_final"/>
</jsp:include>

            <p class="terciary">
                Play-by-Play&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=comp_final_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=comp_final_analysis">Problem Analysis</a>
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tccc03/champ_main.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">Photo caption.<br/><br/></span>
            </div>
            
            <h2>Component Final Round</h2>

            <p>by Matt Murphy, <em>TopCoder Staff</em><br />
            Friday, December 5, 2003</p>

            <p>Text <strong>handle</strong> text, text, text.</p>

            <p>Text <strong>handle</strong> text, text, text.</p>

            <div align="center">
            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
            </table>
            </div>	

            <p>Text <strong>handle</strong> text, text, text.</p>

            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">handle</td>
                    <td class="pointsScore">xxx.xx</td>
                </tr>
            </table>
            </div>	

            <p>Text <strong>handle</strong> text, text, text.</p>

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
