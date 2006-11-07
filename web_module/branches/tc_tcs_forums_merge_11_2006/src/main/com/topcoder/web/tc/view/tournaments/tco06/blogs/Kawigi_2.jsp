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
<span class="bigTitle">Algrorithm Semifinal 1: Dropping like flies</span><br>
05.03.06 2:40 PM
<br><br>
<img src="/i/m/Kawigi_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8416646" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
I got to the first algorithm semifinal right as it was being started.  Of course, the coding phase didn't start right at the scheduled 9:00 time - that was when the 
<tc-webtag:handle coderId="7346876" darkBG="true" />'s-voice-through-a-filter competitor introductions started.  Everyone was ordered off the competition platform and the round 1 competitors stood under a large monitor to be called back up to the platform in alphabetical order (sorry, <tc-webtag:handle coderId="269554" darkBG="true" /> and <tc-webtag:handle coderId="10157606" darkBG="true" />.
<br><br>
The funny thing for me is comparing this sort of techno-intro to the pomp and fanfare I remembered from the 2004 ICPC finals.  With ICPC, there was a chamber orchestra playing our official fanfare and it had a much more <a target="_blank" href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0120591/">Armageddon</a> feel to it.  This had a more <a target="_blank" href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0113855/">Mortal Kombat</a> feel.  All we needed was some fast techno music while the names were read.
<br><br>
The fun thing with being here is opening the arena and telling people what's going on.  Since I'm here typing this, I'm not really up and looking at the monitors too often, but I'm sitting where I can watch the leader board and tell people what's happening (of course, <tc-webtag:handle coderId="282718" darkBG="true" /> was mainly running the play-by-play).</p>
<p>Right now I have <tc-webtag:handle coderId="275071" darkBG="true" /> and <tc-webtag:handle coderId="8357090" darkBG="true" /> theorizing about the problems and what's going to happen in the challenge phase next to me, with <tc-webtag:handle coderId="270505" darkBG="true" />, <tc-webtag:handle coderId="260835" darkBG="true" /> and <tc-webtag:handle coderId="310333" darkBG="true" /> adding comments occasionally.  Funny statement of the morning courtesy of <tc-webtag:handle coderId="275071" darkBG="true" />: "I hope <tc-webtag:handle coderId="272072" darkBG="true" /> isn't in the WildCard if I'm there..."  Related quote in the arena from <tc-webtag:handle coderId="277659" darkBG="true" />: "snap's not gonna be happy to have to come up through the wildcard."  So I guess no one wants <tc-webtag:handle coderId="272072" darkBG="true" /> in the wildcard.  But he just resubmitted the 500 for 162.59 points, and he's in 6th place, so it sounds likely.
<br><br>
Second funny conversation - people in chat referred to <tc-webtag:handle coderId="269554" darkBG="true" />'s strategy of not getting the 250 and going straight to the 1000 as a " <tc-webtag:handle coderId="270505" darkBG="true" />."  <tc-webtag:handle coderId="277659" darkBG="true" /> said, "My definition of "pulling a <tc-webtag:handle coderId="270505" darkBG="true" />" is to write code that is body-slammed against the left margin."  I'm not sure either would be my definition so much as exhausting every valid single-letter identifier in a solution.
<br><br>
With two minutes left, it sounded like <tc-webtag:handle coderId="7346876" darkBG="true" /> found the reverb settings and announced that there were two minutes left with an electronically lowered echoing voice.  Yeah, so under the 2-minutes-left pressure, everyone has to stop and laugh.  The same overly-reverberated voice announces the end of the coding phase, and the start and end of the challenge phase.
<br><br>
The challenge phase wasn't any faster than one would think, but was still interesting, with at least 2 successful and 4 unsuccessful challenges.  Petr looked like he was padding his lead with one successful and one unsuccessful challenge.  What was really interesting was watching the system tests results come in at the end - Each person's row was updated starting from the bottom of the standings after the challenge phase, and we heard yells and jeers as it started to almost look like EVERY solution was going to fail.  Finally, about half-way up the board, we started to see people pass one or the other problem, but not more than one until <tc-webtag:handle coderId="309982" darkBG="true" />, who was previously in second place.  When <tc-webtag:handle coderId="10574855" darkBG="true" /> and <tc-webtag:handle coderId="272072" darkBG="true" />'s 500s failed, it became apparent that Petr's challenging was not padding his lead, but allowing him to make it to the finals without having to go through the wildcard round by .25 points.  That just proves that every second counts (for either one of them).
<br><br>
One thing I forgot to mention yesterday was the publicity here.  People say that there's more than in previous years, but I don't have anything to compare it with.  People are walking around with cameras and video cameras, interviewing contestants and spectators (I was sitting next to <tc-webtag:handle coderId="304031" darkBG="true" /> explaining the challenge phase to one of them earlier).  At some level, you don't really <em>understand</em> the pressure and nerves of the challenge phase unless you've done one where you knew that advancing, money, or your rating was on the line.  The media isn't obtrusive, but they are walking around sometimes in places where it seems like they shouldn't be :-)  I just ignore them and assume everything's ok.
<br><br>
Hmm, since writing that, I just got interviewed impromptu about <tc-webtag:handle coderId="10574855" darkBG="true" />'s narrow 2nd to advance.  I shouldn't talk so much.  Anyways, see you next round!</p>
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
