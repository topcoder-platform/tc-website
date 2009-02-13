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

<title>Single Round Match 241 Statistics at TopCoder</title>

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

<!-- Left Column Begins -->
    <td width="170" bgcolor="#FFFFFF">
       <xsl:call-template name="global_left"/>
    </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
    <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
    <td class="bodyText" width="100%">
       <xsl:call-template name="BodyTop">
          <xsl:with-param name="image1">white</xsl:with-param>
          <xsl:with-param name="image">statisticsw</xsl:with-param>
          <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
       </xsl:call-template>

       <table border="0" cellspacing="10" cellpadding="0" width="100%">
       <tr valign="top">
             <td class="bodyText" width="100%">

<!--body contextual links-->
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                   <tr valign="middle">
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 241</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Wednesday, May 4, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
In Division 1, <b>pparys</b> took home his first SRM victory, solving all
three problems correctly.  <b>bladerunner</b> and <b>Petr</b> took the second and third
slots.  <b>venco</b>, <b>Ruberik</b> and <b>misof</b> rounded out the set of coders
who successfully got all three.
</p>

<p>In division 2, <b>dplass</b> was first, followed by <b>matthew0028</b> who failed systests
on his easy.  As an interesting note, had his easy passed, he would still have been second
place, but by a margin of less than 1 point.  <b>haixiashi</b> made a good entrance to
TopCoder with a third place finish, which catapaulted him into division 1 for next time.</p>
<H1>
The Problems
</H1>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4500&amp;rd=7216" name="4500">BlackjackWinner</a></b>
</font>
<A href="Javascript:openProblemRating(4500)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division Two - Level One: <blockquote><table cellspacing="2" ID="Table1">
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
      174 / 186 (93.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      45 / 174 (25.86%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>HoldMeDown</b> for 239.94 points (5 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      192.17 (for 45 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem, given a certain value of <i>bet</i> will return one of four values:
-<i>bet</i>, 0, <i>bet</i>, or <i>bet</i> * 3 / 2.  The trick is to frame the if statements
in the right order.  Notice from the constraints that <i>bet</i> is always even, so rounding
isn't an issue here.
</p>

<pre>
public int winnings(int bet, int dealer, int dealerBlackjack, int player, int blackjack) {
	if (player &gt; 21 || player &lt; dealer &amp;&amp; dealer &#8804; 21)
		return -bet;
	if (dealerBlackjack == 1 &amp;&amp; blackjack == 1)
		return 0;
	if (dealerBlackjack == 1 &amp;&amp; blackjack == 0)
		return -bet;
	if (blackjack == 1 &amp;&amp; dealerBlackjack == 0)
		return bet * 3 / 2;
	if (dealer &gt; 21 || player &gt; dealer)
		return bet;		
	return 0;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4485&amp;rd=7216" name="4485">ReportAccess</a></b>
</font>
<A href="Javascript:openProblemRating(4485)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division Two - Level Two: <blockquote><table cellspacing="2" ID="Table2">
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
      147 / 186 (79.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      68 / 147 (46.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Onko</b> for 477.24 points (6 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      375.30 (for 68 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2" ID="Table3">
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
      184 / 186 (98.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      153 / 184 (83.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sjelkjd</b> for 248.16 points (2 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      221.08 (for 153 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem was not especially difficult, and was rather straightforward.  The point
here was to see (hopefully) a quick way to write a solution.  The initial thought might
be to split out the permissions for each user into an array, split out the required permissions
into an array, and compare, for each user, whether or not their permissions include all of
the necessary ones.  This is a fine solution, but could take a little while to code
(relatively speaking).</p>
<p>The next thought might be to do a simple string search for each required permission
within the permission string for each user.  However, this by itself could fail in the
case where the report requires permission for "system", and the user only has permission
on "systemadmin".  Instead, we need to search for a string that can't be a substring of
something else.</p>
<p>We do this by padding each user's permission string with spaces on each end.  We can
then search for each required permission, padded with a space at the front and back, to
ensure that it won't be a substring of another permission.  The final requirement is to
sort the resulting list of allowed users, which is handled trivially by the API for your
language of choice.</p>
<pre>
public String[] whoCanSee(String[] userNames, String[] allowedData, String[] reportData) {
	boolean[] b = new boolean[userNames.length];
	int c = 0;
	for (int i = 0; i &lt; userNames.length; i++) {
		allowedData[i] = " " + allowedData[i] + " ";
		b[i] = true;
		for (int j = 0; j &lt; reportData.length; j++)
			if (allowedData[i].indexOf(" " + reportData[j] + " ") == -1)
				b[i] = false;
		if (b[i]) c++;
	}
	String[] ret = new String[c];
	c = 0;
	for (int i = 0; i &lt; userNames.length; i++)
		if (b[i]) {
			ret[c] = userNames[i];
			c++;
		}
	Arrays.sort(ret);
	return ret;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4501&amp;rd=7216" name="4501">AirTravel</a></b>
</font>
<A href="Javascript:openProblemRating(4501)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division Two - Level Three: <blockquote><table cellspacing="2" ID="Table4">
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
      35 / 186 (18.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      14 / 35 (40.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dplass</b> for 750.01 points (17 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      536.47 (for 14 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>That we are given the distance formula is a big help here, as most people probably don't
have it memorized.  (I sure didn't.)  Furthermore, deriving it can be a bit of a time
consuming, and certainly math-intense exercise.  Of course, looking for the appropriate online
resources is always a good option, too.  In any case, the first step is to calculate the
distances between each pair of airports that we are allowed to travel, and store them in an
array, where <i>d</i>[<i>i</i>][<i>j</i>] is the distance from airport <i>i</i> to airport
<i>j</i>.  Note the need to convert degrees to radians when using the trig functions.
If we are not allowed to travel from airport <i>i</i> to airport
<i>j</i>, we use a suitably high "infinity" value, like 999999, as our distance.</p>
<p>Next, we loop over our aiports, and essentially determine if the distance from
airport <i>i</i> to airport <i>j</i> can be made shorter by travelling through airport
<i>k</i> on the way.  We execute this loop as many times as there are airports, to allow for
the possibility that we travel through all of the airports.  Notice here that if travel from
<i>i</i> to <i>j</i> is not allowed, then travelling through <i>k</i> will only be better
if travel from <i>i</i> to <i>k</i> and <i>k</i> to <i>j</i> are both allowed; this is due to
our use of an infinity value.</p>
<p>Finally, we check our "best" distance from <i>origin</i> to <i>destination</i>, and
return -1 if it's our infinity value (meaning we can't make that trip), or the value.</p>
<pre>
double[][] d;

double mul = 3.14159265358979323 / 180;

public double cdist(double lat1, double lon1, double lat2, double lon2) {
	return 4000 * Math.acos(Math.sin(lat1 * mul) 
            * Math.sin(lat2 * mul) + Math.cos(lat1 * mul) 
            * Math.cos(lat2 * mul) * Math.cos(lon1 * mul - lon2 * mul));
}

public double shortestTrip(int[] latitude, int[] longitude, String[] canTravel, int origin, int destination) {
d = new double[latitude.length][latitude.length];
for (int i = 0; i &lt; latitude.length; i++) for (int j = 0; j &lt; latitude.length; j++)
	if (i == j) d[i][j] = 0; else d[i][j] = 999999;
for (int i = 0; i &lt; canTravel.length; i++) {
	String[] s = canTravel[i].split(" ");
	for (int j = 0; j &lt; s.length; j++) {
		int k = Integer.parseInt(s[j]);
		if (i != k) {
			double t = cdist(latitude[i], longitude[i], latitude[k], longitude[k]);
			System.out.println(i+" "+k+" "+t);
			d[i][k] = Math.min(d[i][k], t);
		}
	}
}

for (int n = latitude.length - 2; n &#8805; 0; n--)
	for (int i = n; i &lt; latitude.length; i++)
		for (int j = 0; j &lt; latitude.length; j++)
			for (int k = 0; k &lt; latitude.length; k++)
				d[i][j] = Math.min(d[i][j], d[i][k] + d[k][j]);
if (d[origin][destination] == 999999) return -1;
return d[origin][destination];
}
</pre>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4574&amp;rd=7216" name="4574">BrokenCalculator</a></b>
</font>
<A href="Javascript:openProblemRating(4574)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Two: <blockquote><table cellspacing="2" ID="Table5">
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
      119 / 186 (63.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 119 (52.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tmyklebu</b> for 427.23 points (12 mins 9 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      269.78 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>This problem, at first glance, might appear like a straightforward Breadth First
Search, but upon digging in a little further, it's obvious a little more thought is needed.</p>
<p>The first thing to do is determine what numbers we can type in without using any
operators.  If our target is within this set, we return 1, 2, or 3 as appropriate.</p>
<p>Otherwise, we start keeping track of the fewest keys needed to get to every number from
0 to 999.  Since our target will require an operator key after entering some number,
we initialize those values we can reach to 2, 3, or 4, and the remainder to a suitable
infinity value.</p>
<p>Next, we set up a queue for which values we will search, and populate it with all the
values we can reach without operators.  Then, we take numbers out of the queue one at a
time, try each of the [up to four] operations on them, and add them back to the queue if the resultant
number has been reached in less steps than our previous best.  We continue this until the
queue is empty.  Note that after performing an operation, we will need to either press the
equals key to see our result, or press another operator to continue our calculation.  Hence,
we always add 1 more key press after performing the operation.</p>
<p>Once the queue is empty, if our best result for the target is our infinity value, then
it can't be reached, and return -1.  Else, return the best result.</p>
<pre>
// fewest keystrokes to get to target values
int[] best = new int[1000];

// fewest keystrokes not involving any operators
int[] bestnop = new int[1000];

// queue
int[] q = new int[1000000];
int p = 0;
int r = 0;

// add a value to the queue
void add(int i)
{
	q[p] = i;
	p++;
}

// pull next value from queue
int get()
{
	r++;
	return q[r - 1];
}

// is there anything in the queue?
boolean full()
{
	return (p &gt; r);
}
public int fewestKeys(int[] keys, String operators, int target) {
	// which operations can we do
	boolean plus = (operators.indexOf("+") &gt; -1);
	boolean sub = (operators.indexOf("-") &gt; -1);
	boolean mul = (operators.indexOf("*") &gt; -1);
	boolean div = (operators.indexOf("/") &gt; -1);

	// initialize our infinity values
	for (int i = 0; i &lt; 1000; i++) 
	{
		best[i] = 999999;
		bestnop[i] = 999999;
	}

	// everything we can type with three numbers
	for (int i = 0; i &lt; keys.length; i++)
		for (int j = 0; j &lt; keys.length; j++) 
			for (int k = 0; k &lt; keys.length; k++)
			{
				bestnop[keys[i] * 100 + keys[j] * 10 + keys[k]] = 3;
				best[keys[i] * 100 + keys[j] * 10 + keys[k]] = 3;
				add(keys[i] * 100 + keys[j] * 10 + keys[k]);
			}
	
	// ...with two numbers
	for (int i = 0; i &lt; keys.length; i++)
		for (int j = 0; j &lt; keys.length; j++) 
		{
			bestnop[keys[i] * 10 + keys[j]] = 2;
			best[keys[i] * 10 + keys[j]] = 2;
			add(keys[i] * 10 + keys[j]);
		}
		
	// ... with one number
	for (int i = 0; i &lt; keys.length; i++)
	{
		bestnop[keys[i]] = 1;
		best[keys[i]] = 1;
		add(keys[i]);
	}
	
	// if we don't need any operators, no need to continue
	if (best[target] &lt; 999999) return best[target];
	
	// we know we have to perform an operation, so add that keypress
	for (int i = 0; i &lt; 1000; i++)
		if (best[i] &lt; 999999) best[i]++;
	
	// while there's more searching to do...
	while (full())
	{
		// get next value to search
		int n = get();
		
		// try each allowed operation using each number we can reach without operators
		// ... lather, rinse, repeat
		for (int i = 0; i &lt; 1000; i++)
			if (bestnop[i] &lt; 999999) 
			{
				if (plus &amp;&amp; n + i &lt; 1000) 
				{
					int t = best[n] + bestnop[i] + 1;
					if (t &lt; best[n + i]) 
					{
						best[n + i] = t;
						add(n + i);
					}
				}
				if (sub &amp;&amp; n - i &#8805; 0)
				{
					int t = best[n] + bestnop[i] + 1;
					if (t &lt; best[n - i]) 
					{
						best[n - i] = t;
						add(n - i);
					}
				}
				if (mul &amp;&amp; n * i &lt; 1000)
				{
					int t = best[n] + bestnop[i] + 1;
					if (t &lt; best[n * i]) 
					{
						best[n * i] = t;
						add(n * i);
					}
				}
				if (div &amp;&amp; i &gt; 0)
				{
					int t = best[n] + bestnop[i] + 1;
					if (t &lt; best[n / i]) 
					{
						best[n / i] = t;
						add(n / i);
					}
				}
			}
	}

	// is it impossible?
	if (best[target] == 999999) return -1;
	
	// otherwise return the result
	return best[target];
}
</pre>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4425&amp;rd=7216" name="4425">PatternCutting</a></b>
</font>
<A href="Javascript:openProblemRating(4425)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2" ID="Table6">
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
      23 / 186 (12.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 23 (39.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>pparys</b> for 607.02 points (26 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      493.02 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>The nature of this problem, especially given the tight constraint on the size of the paper,
is that most people could do this very easily by hand.  However, teaching a computer to do
it is the real challenge here.</p>

<p>My solution works like this: first, figure out the four rotations of the pattern, and
store them somehow.  Then, setup an imaginary piece of paper, which is all there.  Next,
start from the upper-left, traversing left-to-right, top to bottom, trying to cut
out a pattern at each location, rotated in each of the four orientations.  Every time this
is possible, cut it from our paper, recurse (starting at the next position), then put the
pattern back into the paper to try the next rotation/position.</p>

<p>We simply keep track of the highest counts as we go, and return the best result.  But,
given 36 squares in the sheet of paper, that's 36 * 4 cutouts to try, and recursing after
each attempt will clearly give us <b>way</b> too long of a run time.  So, we need to optimize
things a bit.</p>

<p>I introduced several optimizations in my solution.  First, note that if the pattern is a
1x1 square or a 1x2 square, these are the two cases that return the largest number of cutouts,
and are very easy results to calculate right up front.</p>

<p>Now, as we are cutting out from our pattern, we can do another big optimization: bailing
out when we know that we can't improve our best result.  For instance, if the paper has 36
squares, and the pattern uses 5 squares, we know, with certainty, that our result can never
be more than 7.  So, if we find a way to make 7 cutouts, we can return that result and look
no more.  Similarly, if we're at row 2, column 1 on this 6x6 sheet, we know that we only have
30 more squares to look at, so we can't possibly cut out more than 6 more squares.  In my
solution, I use the variable <i>localMax</i> to indicate this.</p>

<p>Similarly, when recursing, we pass in the best result we have found so far from that point,
passed as the parameter <i>min</i>.  So, for instance, if my recursion has yielded that it's
possible to cut out 5 of a pattern from where I am already, I know that further recursive
calls need not consider cases where it's no longer possible to cut out more than 5, since
they cannot possibly improve my result.  After all this is done, the recursive function 
simply returns the best result.</p>

<pre>
// the sheet we cut from
public boolean[][] b;

// size of our paper
public int mx, my;

// the four rotations
public String[][] p;

// number of blocks in the pattern
public int c;

// cut out a pattern, rotated, at a given position
public void cut(int x, int y, int r) {
	for (int i = 0; i &lt; p[r].length; i++)
		for (int j = 0; j &lt; p[r][i].length(); j++)
			if (p[r][i].charAt(j) == 'X') b[x + j][y + i] = true;
}

// paste the pattern back in
public void paste(int x, int y, int r) {
	for (int i = 0; i &lt; p[r].length; i++)
		for (int j = 0; j &lt; p[r][i].length(); j++)
			if (p[r][i].charAt(j) == 'X') b[x + j][y + i] = false;
}

// can we cut the pattern out from here?
public boolean canCut(int x, int y, int r) {
	if (x + p[r][0].length() &gt; mx) return false;
	if (y + p[r].length &gt; my) return false;
	for (int i = 0; i &lt; p[r].length; i++)
		for (int j = 0; j &lt; p[r][i].length(); j++)
			if (p[r][i].charAt(j) == 'X' &amp;&amp; b[x + j][y + i]) return false;
	return true;
}

// Determine the most cuttings we can do, starting at (x, y),
//  knowing that we don't care about results less than min
public int partialMax(int x, int y, int min) {
	int best = 0;
	while (y &lt; my) {
		int maxRemain = (my - y - 1) * mx + (mx - x);
		maxRemain /= c;
		if (min &gt; maxRemain) return best;
		if (best &gt; maxRemain) return best;
		int localbest = best;
		for (int r = 0; r &lt; 4; r++)
			if (canCut(x, y, r)) {
				cut(x, y, r);
				x++; if (x &#8805; mx) { x = 0; y++; }
				localbest = Math.max(localbest, 1 + partialMax(x, y, localbest));
				x--; if (x &lt; 0) { x = mx - 1; y--; }
				paste(x, y, r);
			}
		best = Math.max(best, localbest);
		x++; if (x &#8805; mx) { x = 0; y++; }
	}
	return best;
}

public int getMax(int width, int height, String[] pattern) {
	// Deal with the trivial cases that could cause a timeout
	if (pattern.length * pattern[0].length() == 2)
		return (height * width / 2);
	if (pattern.length * pattern[0].length() == 1)
		return height * width;
	
	// Determine the size of paper, and number of blocks in our pattern
	c = 0;
	for (int i = 0; i &lt; pattern.length; i++) for (int j = 0; j &lt; pattern[i].length(); j++)
		if (pattern[i].charAt(j) == 'X') c++;
	my = height;
	mx = width;

	// create our virtual paper
	b = new boolean[width][height];
	
	// and our pattern rotations
	p = new String[4][];
	p[0] = pattern;
	p[2] = new String[pattern.length];
	for (int i = 0; i &lt; pattern.length; i++) {
		p[2][i] = "";
		for (int j = 0; j &lt; pattern[0].length(); j++)
			p[2][i] += pattern[pattern.length - 1 - i].charAt(pattern[0].length() - 1 - j);
	}
	p[1] = new String[pattern[0].length()];
	for (int i = 0; i &lt; pattern[0].length(); i++) {
		p[1][i] = "";
		for (int j = 0; j &lt; pattern.length; j++)
			p[1][i] += pattern[j].charAt(pattern[j].length() - i - 1);
	}
	p[3] = new String[pattern[0].length()];
	for (int i = 0; i &lt; pattern[0].length(); i++) {
		p[3][i] = "";
		for (int j = 0; j &lt; pattern.length; j++)
			p[3][i] += pattern[pattern.length - 1 - j].charAt(i);
	}

	// start our search-cutting from the upper left
	return partialMax(0, 0, 0);
}
</pre>


                <p>
                <img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=10407399"><strong>timmac</strong></a><br />
                <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                </p>
             </td>
          </tr>
       </table>

       <p><br /></p>

    </td>
<!-- Center Column Ends -->

<!-- Gutter -->
    <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
    <td width="170">
       <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
       <xsl:call-template name="public_right_col"/>
    </td>
<!-- Right Column Ends -->

<!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
