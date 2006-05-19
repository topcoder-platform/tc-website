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
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Component Development Finals Summary</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tco06/onsite_photos/shot_development.jpg" alt="" class="photoFrameBig" /><br>
</div>
<p>by <strong>the Development Review Board</strong><br>
<em>TopCoder Members</em><br />
Friday, May 5, 2006<br>
<br><br>
Congratulations to <tc-webtag:handle coderId="7548200" darkBG="true" />, the overall Development Competition winner! See below for a summary of how the Development Competition went...
<br><br>
The TCO Component Competition started with 5 weeks of Online
Qualification Rounds, with many components each week to develop. The
participants got scores based on their placement in each component, with
a cumulative score calculated from up to the four highest scores.  First
place was taken by <tc-webtag:handle coderId="299979" darkBG="true" /> with the perfect score: 40 points (10
points for each first place), though he actually got seven first places
and one third place. Congratulations for such a success!
<br><br>
As the Development Competition closed, the leading eight competitors
were: <tc-webtag:handle coderId="299979" darkBG="true" />, <tc-webtag:handle coderId="7548200" darkBG="true" />, <tc-webtag:handle coderId="15664457" darkBG="true" />, <tc-webtag:handle coderId="11789293" darkBG="true" />, <tc-webtag:handle coderId="15832159" darkBG="true" />, <tc-webtag:handle coderId="10098406" darkBG="true" />, <tc-webtag:handle coderId="7210680" darkBG="true" /> and
<tc-webtag:handle coderId="14926554" darkBG="true" />.  But <tc-webtag:handle coderId="11789293" darkBG="true" /> couldn't attend the finals, leaving his place to
<tc-webtag:handle coderId="10526732" darkBG="true" />.
<br><br>
The Championship Round consisted of 3 online portions. During each, the
developers had to submit a component -- either in Java or C# -- with
similar requirements. One big difference from regular component
competitions: after the reviews ended, the developers didn't get the
results to start the appeals.
<br><br>
The first online component was the "Document Indexer Persistence," which
implements the persistence layer for the Document Indexer component to
save and load the data in XML or databases.  The Document Indexer
component handles indexes on multiple documents and can group them into
collections. Document Indexer Persistence was designed with scalability
in mind and, for that purpose, xml files can be split in case they are
bigger than the maximum size permitted by the file system, and the
storage in database can be de-normalized to be faster.  Those
requirements made the component harder than it seems at first sight, so
developers have had a tough time developing that component!  For that
component, 6 developers choose to implement it in Java and 2 in C#.
<br><br>
The second component was the "Testing Framework," which wraps some
common tasks when testing on servers, like initializing and cleaning a
database, or starting up and shutting down a web server. This component
will surely be very useful for testing components using those
technologies.
<br><br>
Even if this component has many classes and methods, most of them aren't
very hard to implement. For this second component 5 developers chose C# and 3 chose Java. All the developers did a great job, having very high scores.
<br><br>
The third component was the "Bread Crumb Trail Tag" in Java and "Bread
Crumb Trail Control" in C#. Those components are intended to be used in
web pages to help the user know where he is, for example "Forums >
Round Tables >  General Discussion."  This component involves much more
than just what you see; the hard part is discovering where the page is
located in the site map, and identifying the best path from the root up
to that page.  The user can specify a site map in an XML file using
regular expression patterns to match URLs.
<br><br>
This time, there were 5 developers that chose Java and 3 that choose C#.
Even if this component has many classes and methods and involves
slightly more complex algorithms, like finding shortest paths, as well
as the additional complexity in testing Web components, most developers
did a great job.
<br><br>
After developing those components, the onsite portion started in Las
Vegas, where each day the contestants have 2 hours to appeal each one of
the components. To be in tune with Las Vegas, before the appeals each
contestant has to wager points on each of the components.
<br><br>
In the first round, there were 128 (nice number!) appeals, of which 62
were successful. The developers started by looking at their scorecards and submitting a few appeals, but as the round progressed more and more appeals were submitted, and it was impossible for the reviewers to keep up and provide real time response.
<br><br>
The appeals had a broad range of reasons: some came because the reviewer
was just wrong in his correction (hey, we're human!), some stemmed from
the reviewers not quite understanding the developer's ideas, and some
were more subjective issues, like whether a part of code should be
factored or not. There were also appeals that weren't about whether the
reviewer's corrections were good, but rather if their punctuation was
accurate.  And finally, a few appeals were just a desperate effort to
get a few more points.
<br><br>
Before the appeals, <tc-webtag:handle coderId="10098406" darkBG="true" /> was taking the first position, closely
followed by <tc-webtag:handle coderId="7548200" darkBG="true" /> and <tc-webtag:handle coderId="299979" darkBG="true" />, but <tc-webtag:handle coderId="299979" darkBG="true" /> was very convincing
with his appeals and got 5.66 points in the appeals phase, moving to
the first place.  <tc-webtag:handle coderId="7548200" darkBG="true" /> raised his score by 2.56 points, bringing him
to second place, and <tc-webtag:handle coderId="10098406" darkBG="true" /> could just raise his score by 0.85,
leaving him in third. <tc-webtag:handle coderId="15664457" darkBG="true" /> was 6th before appeals and, after raising his score by 3.68 points, he moved to the 5th position.
<br><br>
The second round of appeals was for the Testing Framework component,
in which there were much higher scores, so less appeals were expected.
Effectively, less appeals were done, but still 66 appeals were done,
of which only 26 were successful. 
<br><br>
Probably in this round the funniest "appeal" was because a developer
was scored down for a method that was not used anywhere, so his appeal
just said " Arrrgghhh. Silly me. This is not an appeal. Just
complaining myself so I feel better. Thank you :-)."
<br><br>
<tc-webtag:handle coderId="7548200" darkBG="true" /> was first before the appeals, and after 5 failed appeals
continued in the top.  <tc-webtag:handle coderId="14926554" darkBG="true" /> was second and 4 succesfull appeals
out of 9, raising his score in 0.68 points, but still not enough to
reach <tc-webtag:handle coderId="7548200" darkBG="true" />.
<br><br>
<tc-webtag:handle coderId="299979" darkBG="true" /> moved from the 4th position to the 3rd after raising 3.05
points in appeals, and <tc-webtag:handle coderId="7210680" darkBG="true" /> moved from 6th to 4th thanks to his
almost 4 points raised in appeals.
<br><br>
The third round of appeals was for the Bread Crumb Trail.  There were
99 appeals, and 56 succeeded.  This component had some complex
Algorithms; this could be a reason why the accuracy reviewer gave
some developers lower scores than the other two reviewer. Probably
his tests were able to detect subtle issues that were not so easy to
find by just looking at code.
<br><br>
The top 4 developers were <tc-webtag:handle coderId="7210680" darkBG="true" />, <tc-webtag:handle coderId="7548200" darkBG="true" />, <tc-webtag:handle coderId="10098406" darkBG="true" /> and <tc-webtag:handle coderId="14926554" darkBG="true" /> in that
order, and they had just a small difference in scores; from the 1st to
the 4th just 1.5 points. <tc-webtag:handle coderId="7210680" darkBG="true" /> raised his score in 2.5 points, but
the other 3 of the top four could raise more points, and <tc-webtag:handle coderId="7210680" darkBG="true" />
dropped to the 4th position, leaving <tc-webtag:handle coderId="7548200" darkBG="true" /> in the first place.
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
