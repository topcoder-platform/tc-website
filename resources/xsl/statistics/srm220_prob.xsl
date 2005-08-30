<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/> 

<title>Single Round Match 220 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins  -->
    <td width="170" bgcolor="#FFFFFF">
       <xsl:call-template name="global_left"/>
    </td>
<!-- Left Column Ends  -->

<!-- Gutter Begins  -->
    <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends  -->

<!-- Center Column Begins  -->
    <td class="bodyText" width="100%">
       <xsl:call-template name="BodyTop">
          <xsl:with-param name="image1">white</xsl:with-param>
          <xsl:with-param name="image">statisticsw</xsl:with-param>
          <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
       </xsl:call-template>

       <table border="0" cellspacing="10" cellpadding="0" width="100%">
       <tr valign="top">
             <td class="bodyText" width="100%">

<!--body contextual links -->
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                   <tr valign="middle">
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 220</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Tuesday, November 23, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links -->


<h2>Match summary</h2>
<p>
<p>New Slovakian speed coder <b>misof</b> let failed challenges trump him out of a win in his first match while <b>Shadowfax21</b> edged him out of the lead.  Almost 150 points behind them, new coder <b>pure_</b> took a convincing third place in Division 2.</p>
<p>Meanwhile, Division 1 was extremely exciting; the 900 point problem causing several lead changes due to resubmissions, challenges and a system test that took out nearly half of the remaining submissions.  In the end, <b>tomek</b> took the lead, finishing all three problems without resubmitting and with time to spare.  Two challenges widened his lead over <b>Jan_Kuipers</b>, who was the fastest to finish the hard problem but was set back by having to resubmit the medium problem twice.  <b>lars</b> just stayed ahead of <b>dgarthur</b>'s challenge-fest to take 3rd place.</p>
</p>
<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3091&amp;rd=5866" name="3091">LeapAge</a></b>
</font>
<A href="Javascript:openProblemRating(3091)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      197 / 203 (97.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      184 / 197 (93.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cypressx</b> for 248.92 points (1 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214.83 (for 184 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This problem was a reasonably simple counting problem - only simple because it was very possible within the constraints to try every year between born and year and count the leap years.  A few coders attempted to be cleverer than that and do the problem without loops, but this turned out to be unnecessarily tricky and caused several failures.  One twist to the problem was that the parameters didn't have to be leap years.  Strangely, failed solutions failed on cases when they <i>were</i> leap years, more often than not, either from counting the first year or not counting the last year.  Here's a simple solution:</p>
<pre>
int count = 0;
for (int y = born + 1; y &lt;= year; y++)
   if (y%4 ==0 &amp;&amp; (y%100 != 0 || y%400 == 0))
      count++;
return count;
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3075&amp;rd=5866" name="3075">HiddenNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(3075)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      550
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      103 / 203 (50.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      47 / 103 (45.63%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 488.24 points (10 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      304.65 (for 47 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      174 / 180 (96.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      127 / 174 (72.99%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 283.14 points (7 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      221.87 (for 127 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>I think the premise of looking for numbers without knowing why must have been inspired by having watched the movie, "Holes".  This parsing and sorting problem wasn't hard to figure out, but the particulars could be a problem to some implementations, including at least one which actually timed out.  Another potential challenge was doing the comparisons for sorting, but the constraints allowed for the main piece of sorting to be done by converting the strings to 64-bit integers and comparing them.  Some coders discovered that parsing them as doubles and comparing them didn't necessarily work.  After that, if they were equal in value, you had to account for how many leading zeros each had.  If you know your language's mechanism for sorting with a custom comparer, the rest was easy, the final task being to leave out the right number of elements.</p>
<p>The comparison could also be done without conversion to longs, like so:</p>
<pre>
   public int compare(Object o1, Object o2)
   {
      String s1 = (String)o1;
      String s2 = (String)o2;
      int originalLength1 = s1.length();
      int originalLength2 = s2.length();
      while (s1.startsWith("0"))
         s1 = s1.substring(1);
      while (s2.startsWith("0"))
         s2 = s2.substring(1);
      if (s1.length() &gt; s2.length())
         return 1;
      if (s2.length() &gt; s1.length())
         return -1;
      if (s1.equals(s2))
         return originalLength1-originalLength2;
      return s1.compareTo(s2);
   }
</pre>
<p>Using this allows you to avoid worrying about the particulars of your language's string-to-long conversion.</p>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3070&amp;rd=5866" name="3070">TaglishTranslator</a></b>
</font>
<A href="Javascript:openProblemRating(3070)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 203 (14.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 29 (34.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 667.60 points (26 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      553.95 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>I thought of this problem while reading complaints on the Round Tables about problems that favor native English-speakers over other coders.  I wondered what would happen if I made a problem that specifically favored speakers of my favorite Austronesian language over native English-Speakers.  It didn't work however, as the only Tagalog-speaking contestant that I know of that opened the problem didn't have enough time to finish it.</p>

<p>This problem was a parsing problem in its purest form - reading data in one format and spitting it back out in a different, somewhat unrelated format.  It required reading in the input as an English sentence and determining what the noun, verb and sometimes object were.  The problem required you to decide what tense the verb was, whether the subject and object were names or things, and whether the object (if it existed) was a direct or indirect object.  At that point, it needed to be recreated with Tagalog syntax and verb conjugations.  The hardest part of converting it to Tagalog syntax is doubling the first syllable of the verb root in some of the verb tenses.</p>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3073&amp;rd=5866" name="3073">HeartsGame</a></b>
</font>
<A href="Javascript:openProblemRating(3073)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      69 / 180 (38.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      47 / 69 (68.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 344.83 points (21 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      236.05 (for 47 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>This simulation problem turned out to be confusing at first to coders who didn't read the problem statement carefully enough.  The thing that people didn't realize was that the input came in the order the cards were played, so the first card in each trick was the first card played, not the card played by player 1.  In some ways, this made the problem easier and in other ways it  made it harder, but it did make it harder to understand for several people.</p>

<p>The real challenge to this problem, however, was figuring out who was cheating.  In order to figure this out, you had to keep track of:</p>

<ul>
<li>Whether each player played a scoring card on the first trick.</li>
<li>What suits each player didn't play when they were supposed to.</li>
<li>Whether each player led with a heart before hearts were broken.</li>
<li>Whether or not a Heart has been played already.</li>
</ul>

<p>A good way to model this is to keep track of what players have "claimed" they are out of what suits.  For instance, if the trick is led with a club and the player plays something else, they are claiming they are out of clubs.  If a player leads a trick with a heart before hearts are broken, they are claiming that they are out of every other suit.  As a special case, if a player plays a scoring card in the first trick, they are claiming they have no non-hearts except for possibly the Queen of Spades.</p>

<p>At the end of the round, you had to return the scores for the non-cheating players and the string "CHEATER!" for the cheating players.  This requires that you tag which players cheated without messing up scoring in any way, particularly if a scoring player "shot the moon".</p>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3076&amp;rd=5866" name="3076">RearrangeFurniture</a></b>
</font>
<A href="Javascript:openProblemRating(3076)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      50 / 180 (27.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      15 / 50 (30.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Jan_Kuipers</b> for 787.97 points (11 mins 2 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      566.17 (for 15 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
<p>When I originally wrote this problem, I understood what made it tricky, but I wasn't completely sure what the best way was to solve it.  The short, simple examples made the problem look deceptively easy, but some coders weren't fooled by this apparent simplicity, including the match-winner, <b>tomek</b> and <b>dgarthur</b>, who resubmitted when he realized that he handled the hard case slightly wrong.</p>

<p>A few coders noticed that this problem easily mapped to <a href="http://acmicpc-live-archive.uva.es/nuevoportal/data/p2481.pdf" target="_blank">SillySort</a> from the 2002 ICPC World Finals.  What this problem was missing was SillySort's 3rd test case - one that showed that you couldn't just take the smallest unsorted element and swap it with whatever element belonged in its place.</p>

<p>The key to figuring out this problem was to recognize that you needed to resolve cycles in the data - if you follow an item to the item that's in its spot, and then the one that's in the next one's spot, until you reach the original item again, you'll have a cycle of elements that should be in each others' spots.  If an item is already in its spot, it forms a cycle of one element.  The minimum cost of resolving a cycle is <tt>(sum of the weights in the cycle)+(number of elements in the cycle-2)*(minimum weight in cycle)</tt>.  This cost is zero for one-element cycles and the sum of the elements for two-element cycles.  For larger cycles, it is the cost of swapping the smallest element in the cycle with each element until all of them are in the right spot.</p>

<p>The tricky part of this problem is figuring out that simply resolving all the cycles doesn't always give you the best answer.  Sometimes the optimal answer comes by swapping the smallest element of the whole set into the cycle and then resolving the new cycle.  The cost of swapping in the smallest element is the sum of that weight and the smallest weight in the cycle.  The cost of resolving the new cycle is <tt>(sum of the weights in the cycle + minimum of all weights) + (number of elements in the cycle + 1) * (minimum of all weights)</tt>.  Sometimes this creates a smaller final value and sometimes it makes it bigger.  The key to this problem was figuring out which cycles should merge with the smallest element and which should just be resolved.</p>

<p>Here's a fairly simple implementation:</p>
<pre>
//minimum of all elements:
int min = Integer.MAX_VALUE;
for (int i=0; i&lt;weights.length; i++)
   min = Math.min(min, weights[i]);
boolean[] done = new boolean[weights.length];
int total = 0;
for (int i=0; i&lt;weights.length; i++)
{
   if (!done[i])
   {
      int sum = 0;         //sum of weights in a cycle
      int cyclemin = weights[i];   //minimum of weights in a cycle
      int ind = i;
      int count = 0;         //number of weights in a cycle
      while (!done[ind])
      {
         done[ind] = true;
         count++;
         sum += weights[ind];
         cyclemin = Math.min(cyclemin, weights[ind]);
         ind = finalPositions[ind];
      }
      //minimum of the cost to resolve and the cost to swap in and resolve.
      total += Math.min(sum+cyclemin*(count-2), cyclemin+min+sum+min*count);
   }
}
return total;
</pre>
</p>

                <p>
                <img src="/i/m/Kawigi_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=8416646"><strong>Kawigi</strong></a><br />
                <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                </p>
             </td>
          </tr>
       </table>

       <p><br /></p>

    </td>
<!-- Center Column Ends  -->

<!-- Gutter  -->
    <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends  -->

<!-- Right Column Begins  -->
    <td width="170">
       <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
       <xsl:call-template name="public_right_col"/>
    </td>
<!-- Right Column Ends  -->

<!-- Gutter  -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends  -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
