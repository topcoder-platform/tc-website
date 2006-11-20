<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../../script.jsp" />
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float:right;">
<tc-webtag:forumLink forumID="506180" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Behind the Scenes at the Webcast</span><br>
11.17.06 6:30 PM
<br><br>
<img src="/i/m/RRLevering_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="344462" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Both the online Arena and the room that I'm sitting in are buzzing.  It's the finals of the algorithm competition, what most people are really here to see/compete in.  But at that the same time, there's another buzz around the competition and that's of the ongoing AOL webcast.  For the first time, a TopCoder event is being broadcast all official-like, with large satellite-laden trucks.  Everyone seems to agree that it's a good move for the competition in general; bringing more of the excitement of this event to people at home that just can't get the same feeling from home.  My goal here is to give you a little idea of what goes on behind the scenes to bring this kind of coverage here.
<br /><br /> 
The media journey starts with the main filming area, which is currently located in the hotel lobby.  They started this area up yesterday, which to a lot of people seemed like a strange place to put the announcers, but I'm sure there are technical reasons.
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/anchor-desk.jpg" alt="anchor-desk.jpg"/> </div> 
<br /><br />
The three announcers, better known to TopCoder members as <tc-webtag:handle coderId="270505" context="algorithm"/>, <tc-webtag:handle coderId="154754" context="algorithm"/>, and "that guy from ESPN" [Jeremy Schaap] sit here announcing the competition.  There's also a cameraman and several other important looking people calling the shots here.  I got to talk to <tc-webtag:handle coderId="270505" context="algorithm"/> a little before he got his "pretty paint", while he was munching on his cereal in the hotel restaurant.
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/makeup2.jpg" alt="makeup2.jpg"/> </div> 
<br /><br />
He explained that he and Ken get copies of the problem/discussion before the match, so they can have a little inside knowledge of the problem.  His job is to translate what the coders are doing into something that makes sense to perhaps a less technical audience.  He seemed to be a little nervous, but I think most viewers can agree that he did a pretty good job.
<br /><br />
From here, they cut to either previously recorded feeds or the TopCoder correspondent on the tournament floor here in the main room that does live interviews.  She's filmed by means of a camera on an enormous boom, on a movable platform.  
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/boom_camera.jpg" alt="boom_camera.jpg"/> </div> 
<br /><br />
It moves around the room and films all those swooping shots across the room.  There's also a normal shoulder-held camera that's carried around to get some of the supplementary shots, like those of people clustered around the viewing screens/laptops.  In addition, there's POV cameras mounted on all of the finalist's monitors.
<br /><br /> 
Finally, all of this video feed ends up in the real behind-the-scenes, the truck that's parked right out the back of the hotel.  The truck (that's normally contracted for televising sporting events) is divided into three rooms: engineering, audio, and production.  Production is the main control room for the entire process, where the feeds get streamed together.
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/video_controls.jpg" alt="video_controls.jpg"/> </div> 
<br /><br />
Audio is essentially an incredibly large mixing board where sound levels are adjusted from the feeds.  
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/audio_controls.jpg" alt="audio_controls.jpg"/> </div> 
<br /><br />
Finally, the engineering room controls a lot of the output, including I believe the satellite that actually broadcasts the final signal that ends up transmitted by AOL across the Internet and into the browser window that you're probably watching as I write.
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/satellite_truck.jpg" alt="satellite_truck.jpg"/> </div> 
<br /><br />
       </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../../foot.jsp" />
</body>

</html>
