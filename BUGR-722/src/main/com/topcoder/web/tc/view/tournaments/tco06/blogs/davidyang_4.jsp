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
<span class="bigTitle">Poker whizzes and polymaths</span><br>
05.04.06 9:35 PM
<br><br>
<img src="/i/m/davidyang_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21471147" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
As the poker tournament at the TCO has really taken on a life of its own over the last few years, I thought I’d try my hand at it and give you a first-person perspective of what it feels to compete.  But sitting at the poker table with the contestants of the 2006 TopCoder Open can be more than a little intimidating.  Poker (and especially Texas Hold‘Em) is not only a battle of psyche and will, it also invariably provides many opportunities for leveraging mathematical brainpower.  Any <a target="_blank" href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0128442/">Matt Damon</a> fan will know the term "rounders," a term used to refer to poker players who are constantly rounding probability estimates of how their cards and chips stack up.  My fear was that in this crowd one might find some "exacters," not the type of people that would result in a friendly poker game.  
<br/><br/>
My first table had TopCoders <tc-webtag:handle coderId="7501828" darkBG="true" />, <tc-webtag:handle coderId="252022" darkBG="true" />, <tc-webtag:handle coderId="15664457" darkBG="true" /> and admin <tc-webtag:handle coderId="156859" darkBG="true" />.  <a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Betting_(poker)">Blinds</a> were low but many had never played before so we started slow.  <tc-webtag:handle coderId="252022" darkBG="true" /> wasn’t letting anyone see free cards (very heavy betting to discourage people who will pay a little to see more cards drawn) and soon he started bluffing pretty heavily: all-in calls every other hand were the norm and many were intimidated/eliminated within the first 20 minutes.  As the chaff was separated from the wheat, tables combined, blinds increased and the competition heated up significantly.  <tc-webtag:handle coderId="305384" darkBG="true" /> relentlessly upped the blinds until all but six remained at the final table.  These included <tc-webtag:handle coderId="7442498" darkBG="true" />, <tc-webtag:handle coderId="309982" darkBG="true" />, <tc-webtag:handle coderId="10270846" darkBG="true" />, <tc-webtag:handle coderId="270505" darkBG="true" />, <tc-webtag:handle coderId="311170" darkBG="true" /> and me, all had TopCoder ratings well into the high 2000’s (except me, mine is a glorious 701 after a devastating SRM) and <tc-webtag:handle coderId="311170" darkBG="true" /> and <tc-webtag:handle coderId="309982" darkBG="true" /> had proven their intellectual power earlier that day in the Qualifying rounds. 
<br/><br/>
I had the high stack but didn’t have a good read on <tc-webtag:handle coderId="270505" darkBG="true" /> and <tc-webtag:handle coderId="311170" darkBG="true" /> since they had just joined our table after the last round of eliminations.  All I knew was that <tc-webtag:handle coderId="270505" darkBG="true" /> was a PhD candidate in combinatorics (gulp) and <tc-webtag:handle coderId="311170" darkBG="true" /> had a reputation for his aggressive style – these were not players to be taken lightly.  He immediately demonstrated it by betting $5,000 dollars on his first hand (spending his earnings a little early?).  <tc-webtag:handle coderId="309982" darkBG="true" /> went all-in after admitting he was really tired and needed to sleep and not long after <tc-webtag:handle coderId="10270846" darkBG="true" /> was eliminated by <tc-webtag:handle coderId="270505" darkBG="true" />.  Three hands later, <tc-webtag:handle coderId="7442498" darkBG="true" /> was forced by the blinds to go heads-up against <tc-webtag:handle coderId="270505" darkBG="true" /> and was also eliminated.  By this time, <tc-webtag:handle coderId="270505" darkBG="true" /> had the chip lead and I was left with only enough chips to play a few more hands.  I decided to try my luck with one of the worst hands in poker, 2-3 offsuit against John’s J-9.  Unfortunately, no cards dropped (we’re in Vegas so I wasn’t expecting it!) and my short career in competition here at TCO was put to an abrupt end.  A few hands later, <tc-webtag:handle coderId="311170" darkBG="true" /> also went all in on K-9 only to have <tc-webtag:handle coderId="270505" darkBG="true" /> lay down a A-10!  Five cards later, it was over and <tc-webtag:handle coderId="270505" darkBG="true" /> was declared winner.  Check out <tc-webtag:handle coderId="21518515" darkBG="true" />’s <a href=" http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=omgrace_4">blog</a> for a full description of his fantastic prize package (I walked away with a pretty cool shoulder bag of TopCoder goodies).  John could not be convinced to try his luck (and his winnings) out on the real Vegas floor though.
<br/><br/>
<tc-webtag:handle coderId="282718" darkBG="true" /> informed me today while we were watching <tc-webtag:handle coderId="270505" darkBG="true" /> in Round 3 that his auspicious victory in the tournament could foreshadow a repeat of <tc-webtag:handle coderId="262056" darkBG="true" /> victory over <tc-webtag:handle coderId="144400" darkBG="true" /> in a previous TCO.  While watching the challenge phase of Round 3 I also couldn’t help but notice the parallels between the TopCoder Open and major poker tournaments.  TopCoder tournaments, like their poker equivalent, bring together a community of 20-40 world-class competitors that have for years tested their mettle against each other through forums like TCCC, TCO, ICPC and IOI.  As many competitors have said, it’s usually the same faces year after year and over time, they’ve developed an understanding of their relative skills and weaknesses against certain types of problems.  Watching <tc-webtag:handle coderId="144400" darkBG="true" /> immediately challenge 2 500-point problems in the opening round of his Challenge phase reminded me of a seasoned poker veteran easily calling a player’s bluff – of course there is a legendary story (unconfirmed) about <tc-webtag:handle coderId="144400" darkBG="true" />’s early submission of a 1000-point problem to throw off others about the problem’s difficulty in an earlier Open.  With this kind of drama, all we need is ESPN2 and a [ TopCoder ] emblazoned Gold Bracelet to complete the story!
<br/><br/>
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
