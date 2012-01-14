<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10651&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506243" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 27</span><br>Monday, January 8, 2007
<br><br>

<h2>Match summary</h2> 

Many competitors tripped on a tricky 500-point problem that was
easy to get wrong, but not nearly as easy to get wrong as the
1000-pointer. In the end five coders got all three problems correct;
<tc-webtag:handle coderId="22375930" context="hs_algorithm" /> was one
of them, and won with a comfortable lead. The other four followed in the
rankings and deserve to be mentioned for great performances: <tc-webtag:handle coderId="22664999" context="hs_algorithm" />,
<tc-webtag:handle coderId="22627853" context="hs_algorithm" />,
<tc-webtag:handle coderId="22641901" context="hs_algorithm" /> and
<tc-webtag:handle coderId="22014601" context="hs_algorithm" />.

<H1> The Problems </H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7331&amp;rd=10651" name="7331">BrickMystery</a></b> 
</font> 
<A href="Javascript:openProblemRating(7331)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506243" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201 / 227 (88.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187 / 201 (93.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sluga</b> for 246.94 points (3 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      199.32 (for 187 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Finding the 7-bit binary represnentation of an integer was the core
of this problem. This can be done by repeatedly dividing the number by
2 and saving the remainders, which give the digits in reverse
order. The rest of the problem is pretty-printing the values. Here's
one Java implementation:

<pre>   public String[] createPattern(String message) {
      String[] ret = new String[2 + message.length()];
      ret[0] = ret[message.length()+1] = "x.......x";

      for ( int i=0; i&lt;message.length(); ++i ) {
         ret[i+1] = "x";
         int x = message.charAt(i);
         for ( int j=0; j&lt;7; ++j ) {
            ret[i+1] = ".x".charAt( x%2 ) + ret[i+1];
            x /= 2;
         }
         ret[i+1] = "x" + ret[i+1];
      }

      return ret;
   }</pre>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7330&amp;rd=10651" name="7330">Armies</a></b> 

</font> 

<A href="Javascript:openProblemRating(7330)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506243" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      151 / 227 (66.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      87 / 151 (57.62%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Weiqi</b> for 457.05 points (8 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      329.48 (for 87 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The rules in the problem statement don't give an explicit algorithm
for determining the order in which the creatures attack. However, we
can devise an algorithm that considers creatures that are left and
selects the next creature to attack:

<ul>

<li>The next creature to attack has the highest might of all remaining
creatures.</li>

<li>If more than one creature from different armies has the same
highest might, we select a creature from the army that didn't attack last.</li>

<li>If there's still more than one choice inside a single army, select
the creature that comes earlier in the input.</li>

</ul>

It can be verified that this algorithm generates an ordering that
satisfies all three rules from the problem statement (the problem
statement also guarantees that this ordering is unique). However, you 
need to be careful to handle all the tie-breaking rules
correctly. For a clear implementation, see
<tc-webtag:handle coderId="15604398" context="hs_algorithm" />'s
<a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=15604398&rd=10651&pm=7330">
solution</a>.</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7329&amp;rd=10651" name="7329">AdaptiveRouting</a></b> 

</font> 

<A href="Javascript:openProblemRating(7329)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506243" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      17 / 227 (7.49%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      5 / 17 (29.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ilyaraz</b> for 572.50 points (29 mins 42 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      483.94 (for 5 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The behavior of the network is entirely
deterministic and, since we're observing through an all-knowing
perspective, simulation is the solution to this problem.
<br /><br />
Each router maintains a copy of the network layout and runs its
shortest-path algorithm on that graph (which may be different than the
graphs in other routers). This means that, in our simulation, we need
to keep a separate graph for each router. In addition, these graphs
change over time as information about failed links reaches
routers. The simulation needs to be time-oriented so that each router
acts only upon information available to it at some moment in time.
<br /><br />
The simulation itself can be implemented using a priority queue of
<i>events</i>. An event describes the arrival of a packet at some
router and needs to contain the following information:

<ul>
<li>The time at which the packet arrives,</li>
<li>The router at which the packet arrives, and</li>
<li>The packet itself &ndash; if it is the data packet or a control packet (if it's a
control packet, we also need to know which link it is about).</li>
</ul>

To start off the simulation, we generate two events for each failed
link &ndash; at time 0, a control packet is generated in the two
points that the link used to connect. We also generate a single data
packet at time 0, in router A. What is left is to process the events
in increasing time order and:

<ul>
<li>When a control packet arrives at a router, relay it to all
neighbors that don't know about the failed link yet, generating new
events. (<i>Alternately, send to all neighbors and have them discard information they already have.</i>)
<li>When the data packet arrives at a router, calculate the shortest
path to the destination (passing solutions used Dijkstra's,
Floyd-Warshall and even Bellman-Ford algorithms) and send the packet
to the first router on that path (generating a new event). One trick
is to run the single-source shortest path algorithm from the
destination router for tie-breaking purposes.</li>
</ul>

When the data packet arrives at the destination, we're done and can
return the time at which this occurred. If at some point a router
calculates that there is no path to the destination, we can return
&ndash;1 (because a new route to the destination won't magically
appear).
<br /><br />
The long and convoluted problem statement served as a hint that competitors needed to pay a
lot of attention to the details while coding. Indeed, the
problem offered plenty of opportunities to get the implementation
wrong.
<br /><br />
 

<div class="authorPhoto">
    <img src="/i/m/lovro_big3.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7390467" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
