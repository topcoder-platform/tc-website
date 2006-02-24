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

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="onsite_events"/>
   <jsp:param name="tabLev3" value="reception"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/reception.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">Competitors and spectators enjoying the reception<br/><br/> </span>
            </div>

            <h2>Opening Night Reception</h2>

            <p>by lbackstrom, <em>TopCoder Staff</em><br />
            Wednesday, April 14, 2004</p>

            <p>
            Tonight, TopCoder kicked off what promises to be its biggest and best event ever. 30 TopCoders, representing 16 different countries, spent the evening getting to know one another at the opening reception in the stylish Park Plaza hotel.  These coders are the best of the best, having survived an extremely competitive month of online rounds, in which over 95% of coders were eliminated.
            </p>
            <p>
            Newcomers to the prestiguous onsite round used the time to their advantage, grilling competitors who have been here before about the format and strategies of the onsite event.  But, for the most part, the competitors relaxed and tried to forget about the extreme 75 minutes of furious coding that they must undertake tomorrow.  Popular topics of discussion included the recent ACM competition and the ImagineCup, two other competitions in which TopCoders did well.  Competitors also recounted humorous anecdotes from prior competitions, the crowd favorite of which was related to Floyd's algorithm.  And of course, it wouldn't be a coding competition if there wasn't talk about algorithms.  In addition, representatives from sponsors Yahoo! and NVIDIA were present, chatting with members and handing out goodies.
            </p>
            <p>
            The next two days promise to be exciting -- the top designer and developer will be decided and the final four algorithm coders will advance and vie for the $25,000 grand prize.  Congratulations to all the coders who have made it so far, and good luck to everyone in the upcoming events.
            </p>


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
