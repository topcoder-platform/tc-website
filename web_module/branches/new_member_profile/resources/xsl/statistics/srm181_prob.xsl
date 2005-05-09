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

<title>Single Round Match 181 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 181</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, January 28, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p>This SRM seemed significantly easier than the last few for Division I coders, with seven 
coders within 50 points of leader <b>tomek</b> after the coding phase.  After challenge phase, 
however, <b>SnapDragon</b> barely pulled ahead by picking up a successful challenge, and he 
won the match with an impressive 1629.45 points.</p> 

<p>On the Division II side of things, the success rates for the easy and medium problems were very high, but many coders were stopped by the hard.  The winner of it all was <b>RandySaint</b>, who used his high score on the 950 to finish in first place in Division II by over 100 points over <b>sanjay31</b>.</p>
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b>KiloMan</b> 
</font> 
<A href="Javascript:openProblemRating(2268)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      236 / 242 (97.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      232 / 236 (98.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NeverMore</b> for 248.64 points (2 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      229.03 (for 232 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>Projectiles coming at KiloMan?  No worries, just dodge!  Unfortunately, that's not as easy as it sounds. If the shots are coming at height above 2 and KiloMan jumps, then he gets hit, and if they are at height 2 or less and he stands still, then he is also hit.  To put that in code, that turns out to be just a couple of if statements:
</p>

<pre>
    hits = 0;
    for (int i = 0; i &lt; pattern.size(); i++) {
        if (pattern[i] &gt; 2 &amp;&amp; jumps[i] == 'J') hits++;
        else if (pattern[i] &lt;= 2 &amp;&amp; jumps[i] == 'S') hits++;
    }
    return hits;
</pre>

<font size="+2"> 
<b>CombinationLock</b> 
</font> 
<A href="Javascript:openProblemRating(1945)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      160 / 242 (66.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      142 / 160 (88.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krumble</b> for 500.85 points (9 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      309.29 (for 142 correct submissions) 
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
      175 / 185 (94.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      174 / 175 (99.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>John Dethridge</b> for 291.18 points (4 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      228.25 (for 174 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The algorithm given in the problem statement to open an arbitrary combination lock could basically be directly translated into code.
</p>

<p>The initialization step was to set the current rotation direction to counterclockwise, and set N to be the number of numbers in the combination.  Rotate the wheel N full turns in the current rotation direction, and then keep rotating until the notch points to the next number in the combination.  Then decrement N, reverse the rotation direction, and repeat until there are no more numbers in the combination to input.  The high success rate for this problem in both divisions was pretty indicative of its straightforward nature.
</p>

<pre>
    int N = combo.length, L = N;
    double ret = 0;
    int at = start;
    int dir = 1;       //we're calling 1 counterclockwise and 1 clockwise
    for (int i = 0; i &lt; L; i++, N--) {
        int K;
	if (dir == 1) K = combo[i] - at;
	else K = at - combo[i];
	if (K &lt; 0) K += size;
	ret += 360.0 * (N + 1.0*K/size);
	at = combo[i];
	dir = -dir;
    }
    return ret;
</pre>

<font size="+2"> 
<b>EngineersPrimes</b> 
</font> 
<A href="Javascript:openProblemRating(2017)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      48 / 242 (19.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 48 (31.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>RandySaint</b> for 721.58 points (17 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      501.75 (for 15 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
What we want is the smallest non-prime that isn't divisible by any of the first N.  The first thing to do is determine what the first N primes are.  Since N is, at most, 100000, and the 100000th prime is 1299709, you can use a variety of methods: <a href="http://mathworld.wolfram.com/SieveofEratosthenes.html">Eratosthenes' Sieve</a>, simply caching the primes as you find them, or the brute force, divide by every number up to the square root method.
</p>

<p>At this point, what is the smallest number that isn't divisible by those first N primes that isn't prime, either?  First, since it's not prime, it must have at least two prime divisors; for the smallest number possible, there must be only two such divisors, which must each be as small as possible.  However, neither of those two numbers can be any of the first N primes, otherwise their product would be divisible by one of those primes.  Thus, we take the (N+1)st prime and square it, thus forming the smallest number not divisible by the first N primes that is also not prime itself.  Any lower number is either: (a) prime, or (b) divisible by at least one of the first N primes.  (The proof is left as an exercise for the reader.)
</p>

<pre>
    int p[100001];
    int at = 0;

    bool prime (int k) {
        for (int i = 0; i &lt; at &amp;&amp; p[i] * p[i] &lt;= k; i++)
	    if (k % p[i] == 0) return false;
	p[at++] = k;
        return true;
    }

    long long smallestNonPrime (int N) {
        p[at++] = 2;
        int count = 1;
        long long last = -1;
        for (int i = 3; at &lt;= N; i += 2)
            if (prime(i)) last = i;
	return last * last;
    }
</pre>

<font size="+2"> 
<b>TrueFalse</b> 
</font> 
<A href="Javascript:openProblemRating(2253)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      131 / 185 (70.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      91 / 131 (69.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 446.13 points (10 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      299.48 (for 91 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
As various match editorial writers have said in the past, the constraints should tell you something about the intended algorithm for the problem.  Something like 15 to 20 should scream out "BRUTE FORCE!"  And indeed, this problem was very brute-forceable.
</p>

<p>
What it asked for was the lexicographically earliest answer key that was consistent with the test papers.  What many people skimmed over while reading was the stipulation that each question was answered correctly at least once, and the admin room received plenty of "example 2 doesn't work!" messages.  But past that, it was a pretty simple loop over all possible answer keys - the maximum number possible was 2^16, or 65536.  For each of the possible keys, you just check two things: that the number of right answers by each student is correct, and that the answer to each question appears in some students' answer to that question.
</p>

<font size="+2"> 
<b>KiloManX</b> 
</font> 
<A href="Javascript:openProblemRating(2288)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      56 / 185 (30.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      49 / 56 (87.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dgarthur</b> for 954.67 points (6 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      744.43 (for 49 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
I just said that 15 to 20 should ring alarm bells, but here's one place that's not going to work.  At first glance, it may seem that the best way to do things is a brute-force search over all N! boss orders, but at N = 15, that's not going to run in time.  Instead, there's a massive time reduction that can be made by noticing that at any given point, you will have acquired some number of boss weapons, and that beating boss 1 and then boss 2 is exactly the same in terms of state as beating boss 2 and then boss 1.  The only difference, perhaps, is the number of shots it takes.  Looking at it in this way, the O(2^n) DP solution is the way to go.
</p>

<p>
Our desired state is the situation where we have all N weapons.  To get there, we could have beaten any of those N bosses with any of the other N - 1 weapons, or with the KiloBuster, and we will pick the option that requires the least shots.  This process is recursive, so we can just recurse until we get to the base case, which is possessing no weapons.  There are a whole lot of overlapping subproblems, or subsets of weapons, so we can cache these efficiently using bitmasks.  This one turned out to be essentially a textbook demonstration of DP, as evidenced by the extremely high scores on this problem, not to mention the high success rate by those who did submit.
</p>

z<pre>
    int N;
    int shots[16][16], health[15];
    int best[32768];

    int recurse(int x) {
        if (x == 0) return 0;
        if (best[x] != 0) return best[x];
	int ret = 2000000000;
	for (int i = 0; i &lt; N; i++) {
	    if ((x &amp; (1 &lt;&lt; i)) != 0) {
	        int s = health[i];
		for (int j = 0; j &lt; N; j++) {
		    if (i != j &amp;&amp; (x &amp; 1 &lt;&lt; j) != 0 &amp;&amp; shots[j+1][i+1] &lt; s)
		        s = shots[j+1][i+1];
		}
		int q = recurse(x ^ (1 &lt;&lt; i)) + s;
		if (q &lt; ret) ret = q;
	    }
	}
	return ret;
    }

    int leastShots(vector&lt;string&gt; damageChart, vector&lt;int&gt; bossHealth) {
        N = damageChart.size()
        for (int i = 0; i &lt; N; i++)
            shots[0][i+1] = health[i] = bossHealth[i];
        for (int i = 0; i &lt; N; i++)
            for (int j = 0; j &lt; N; j++) {
	        if (i == j || damageChart[i][j] == '0') shots[i+1][j+1] = 1000000;
		else shots[i+1][j+1] = (health[j] + damageChart[i][j] - '1') /
		                       (damageChart[i][j] - '0');
            }
	return recurse((1 &lt;&lt; N)-1);    
    }
</pre>

<p>
It should be noted that this problem is in fact just the same as the problem of constructing a minimal spanning tree on a directed graph, starting from a specified node, called the root.  If I had insisted stubbornly on keeping N = 50, which was the original constraint size when I originally proposed the problem, then DP would also time out and a more sophisticated algorithm would have been necessary.  While the undirected MST algorithm can be solved using a greedy algorithm, that doesn't quite work when the edges become directed, as one of the example cases demonstrated.
</p>

<p>However, various algorithms have been discovered that solve the directed case of the Minimal Spanning Tree problem.  More on such algorithms can be found <a href="http://www.ce.rit.edu/~sjyeec/dmst.html">here</a>.  Implementations of the Chu-Liu/Edmonds Algorithm run in O(E log V) on average and O(V^2) for dense graphs, certainly well in time to solve this problem, although with N = 15, it's overkill.
</p>



                        <p>
                        <img src="/i/m/antimatter_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=275071"><strong>antimatter</strong></a><br />
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
