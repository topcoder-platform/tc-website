<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

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
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="summary"/>
   <jsp:param name="tabLev3" value="room1"/>
</jsp:include>

            <p class="terciary">
                <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room1">Play-by-Play</a>&nbsp;&nbsp;|&nbsp;&nbsp;Problem Analysis
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tccc04/room1/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">photo caption<br/><br/></span>
            </div>
            
            <h2>Problem Set Analysis &amp; Opinion</h2>

            <a href="/stat?c=member_profile&cr=273217"><img src="/i/m/somedude_mug.gif" alt="" width="55" height="61" border="0" align="left" /></a>
            <p>by <a href="/stat?c=member_profile&cr=000000">somedude</a>, <br/>
            <em>TopCoder Member</em><br />
            Thursday, April 14, 2003<br/><br/></p>

            <h3>ProblemName<br/>
            <span class="bodyText">Used as: Division 1 - Level 1:</span></h3>
                                    
            <p>solution</p>
            

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
