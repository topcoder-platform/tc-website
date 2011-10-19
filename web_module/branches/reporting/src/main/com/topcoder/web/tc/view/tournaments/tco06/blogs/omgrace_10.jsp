<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">What a week it was!</span><br>
05.05.06 10:00 PM
<br><br>
<img src="/i/m/omgrace_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21518515" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
After the awards ceremony, we took group pictures (they're in my last post) and I also got the opportunity to take some pictures with the competitors.  Here are some pictures of me and the fellas:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-10-01.jpg" alt="" /></div>
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-10-02.jpg" alt="" /></div>
<br><br>
Have you noticed in other pictures that there aren't many females at the TopCoder Open?  I've heard rumors that female programmers exist... hopefully more women will compete next year to qualify for the competition - it's really fun, trust me!  
<br><br>
After all the pictures, we had a reception and I ate the COOLEST mashed potatoes!  You know how sometimes at brunch buffets they have omelet stations?  Well we had a mashed potato station!  There were a bunch of toppings you could choose from - cheddar cheese, goat cheese, sun-dried tomatoes, chives, caviar, and others.  The chef cooked the potatoes exactly the way you would make an omelet - here's a picture so you can get a better idea:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-10-03.jpg" alt="" /></div>
<br><br>
Here are some of my favorite pictures from the reception:
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-10-04.jpg" alt="" /></div>
<br><br>
<div align="center"><img src="/i/tournament/tco06/blogs/omgrace-10-05.jpg" alt="" /></div>
<br><br>
<tc-webtag:handle coderId="113178" darkBG="true" /> also won a video iPod from VeriSign - he can upload pictures and videos of his soon-to-be-born baby!  
<br><br>
I had an amazing time in Las Vegas with the competitors and the staff from TopCoder.  Thanks so much for making the week so wonderful - I hope you enjoyed reading my blog as much as I enjoyed writing them.   Also, congratulations to ALL of the competitors - everyone amazed me with their brilliance throughout the week and it was great watching you guys compete - in the arena and during the Gameworks event.  If you guys are ever in the New York City area, let me know - we'll get together and play DDR. :-)    
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
