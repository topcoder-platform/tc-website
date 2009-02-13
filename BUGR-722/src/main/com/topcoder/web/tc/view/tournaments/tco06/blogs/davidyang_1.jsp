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
<span class="bigTitle">TopCoder's May Madness</span><br>
05.02.06
<br><br>
<img src="/i/m/davidyang_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21471147" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Walking through the Las Vegas airport is a chance to view the wide swath of diversity that occupies this small planet.  Tourists from Japan, college frat boys, Silicon Valley millionaires and East coast bankers come to this desert oasis on full planes cramped shoulder-to-shoulder with similar dreams: a chance to play their cards and hit it big.  Perhaps it is in this spirit that 64 top minds in computer science and algorithms kicked off tonight the 2006 TopCoder Open.  
<br><br>
Those of you familiar with TopCoder know the TopCoder Open as the culmination of SRMs, QRMs and many other TLAs that pit TopCoder's celebrity-status programmers (who are out here from all over the world ) in the frenzy of the TopCoder Arena.  If that last sentence made no sense to you, here's a brief summary:   TopCoder organizes weekly Single Round Matches online through a computer-based interface.  Anyone can participate (and usually hundreds to thousands do) and people are separated into rooms of about 20 competitors.  (See the TopCoder Program for stories of crazy places from where people have participated in these SRMs.) Each competitor is given the same three problems of increasing difficulty and 75 minutes to submit an answer to all three questions.  These problems can be as straight forward as determining how people pick dates at a party based on looks (hottest first, obviously) to as eclectic as finding out ways there are to slice a sentence into palindromes (a lot, usually).  The problems are a coder's worst nightmare -- take a mixture of Microsoft interview puzzle, your senior year CS algorithm course and throw in a nonstop countdown clock and you get a sense of each competitor's mindset.
<br><br>
After 75 minutes of intense programming, TopCoder is generous enough to give you five minutes of rest before you jump into part two of the competition.  Like Russell Crowe <A target="_blank" href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0172495/">exploding out of the Coliseum gates</a>, each competitor in your room is given a chance to examine your code and try to bludgeon it with test cases until it breaks.  If they break your code, you lose all the points for that problem and their status moves up - if not, they get docked a small percentage of their score.  Coders strategies vary - do you try to bring down the people above you in ranking, or kill off the weakest?  (Turns out the latter is more popular).  Hearts break and fortunes crumble as coders view and challenge each other's submissions for the next 15 minutes.  When the Challenge phase closes, your code now has to go through System Test where it might get hit with thousands of test cases that only the most sadistic tester would envision.  If it passes all these tests, you get points based on the speed you submitted the problem and, based on overall points, you are given a new overall rating.  
<br><br>
At the TopCoder Open, things get even more exciting.  Here is the virtual TopCoder Arena writ live and large.  The Arena sits on an elevated stage surpassing even the most ecstatic boyhood visions of the ultimate LAN party.  Sixteen computers sit side-by-side on an elevated stage with metal posts and light scaffolding resembling something out of Soul Caliber.  Additional screens plaster the walls and kiosks around the room giving observers a chance to view each Coder's monitor and peer into their mind during the competition - to me it has the same voyeuristic thrill similar to those feltcams pervasive in <A target="_blank" href="/?t=sponsor&c=link&link=http://sports.espn.go.com/espn/poker/index">poker tournaments</a>.
<br><br>
A little about me:  I come to this event as a participant in the <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_winners">Pick Me</a> contest run by TopCoder to select bloggers to capture the excitement and energy of the Open.  You can read more about me in <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_davidyang">my essay</a>.  Personally, one of the most amazing stories here today is the community that has developed around TopCoder and its competitions.  In my first SRM, the competition was definitely fierce but afterwards many stayed around the Arena chatting (and consoling each other) and I definitely saw the collaboration, respect and sportsmanship that TopCoders show one another.  Seeing it in person here in Las Vegas has only made it more poignant.
<br><br>
The next few days promise to be exciting ones - the "May Madness" of the coding world - so keep it tuned here for constant updates!
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
