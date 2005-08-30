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

<title>Single Round Match 186 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 186</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Saturday, March 13, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>

The dragon roars again! On a Saturday when his chief rival was away,
<b>SnapDragon</b> came from behind to take the round and, as his reward
for weeks of consistent coding excellence, to recapture the number-one
ranking from <b>tomek</b>. Will he be king of the hill for long? We look
forward to an exciting tussle, preferably with more head-to-head action,
in the weeks and months to come. In other news, <b>jms137</b> came back
with a vengeance from his premature Collegiate Challenge exit to place
a strong second. <b>Eryx</b> continued his steady rise toward the top
ten with a third-place finish.

</p><p>

Division Two was once again a house of pain as no one solved the Level
Three, but a little birdie told me that there will now be a concerted
effort to crack down on the killer problems. Patience, young coders,
patience. It was a lucky thirteenth showing for <b>riq2</b>, who came in
first by a slim three-point margin over <b>kiveol</b>. Not far back in
third was the stalwart <b>darkphantom</b>, who's been gradually improving
over two years with TopCoder.

</p>
 
<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a
href="/stat?c=problem_statement&amp;pm=2405&amp;rd=4750">GolfScore</a></b>
</font>
<A href="Javascript:openProblemRating(2405)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      183 / 195 (93.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      167 / 183 (91.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cvip11</b> for 244.24 points (4 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201.83 (for 167 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given the par values of an 18-hole golf course and the score obtained
on each hole, expressed in relative terms such as "bogey" and "birdie",
we are to compute the total score achieved by a player. There is one
scoring phrase that is not relative, namely "hole in one". Coding a
successful solution depends partly on dealing with this special case.

</p><p>

The other challenge is to find a way of translating the scoring
phrases into their numerical values. The simplest approach is to use
<code>if</code> statements or a <code>switch</code> to check each case
individually. If we see that the phrase is "albatross", for instance,
we know that it means -3 in relation to par, so we can add the par value
less three to the total score. This calls for much typing, however,
and the more we type, the greater the latitude for error.

</p><p>

Consider, instead, that we can look up the scoring phrase in an array
and use its position to directly calculate a numerical value. In this
array, the scoring phrases should be listed in order, say from lowest
to highest as below. We then initialize the total score to zero. When
iterating over the holes, we single out the "hole in one" case and
immediately increment the score by one.

</p><pre>
  public int tally(int[] parValues, String[] scoreSheet) {
    String[] scores = {"triple bogey", "double bogey", "bogey",
                       "par", "birdie", "eagle", "albatross"};
    int tot = 0;
    for (int i = 0, j; i &lt;18; i++) {
      if (scoreSheet[i].equals("hole in one")) {
        tot++;
        continue;
      }
</pre><p>

There are predefined functions in most languages to quickly find an
element in a sorted array, but a <code>for</code> loop will suffice
here. The scoring phrase "triple bogey" is at position 0, and its value
is +3. The scoring phrase "par" is at position 3 with a value of 0. In
general, we can subtract the position of a phrase and add three to obtain
its value.

</p><pre>
      for (j = 0; j &lt;7; j++)
        if (scoreSheet[i].equals(scores[j]))
          break;
      tot += parValues[i]-j+3;
    }
    return tot;
  }
</pre><p>

If the scoring phrases were not mapped in arithmetic progression to
their values, we would probably want to use an associative array of some
kind, such as a map or a hash, to look up the integer corresponding to
each string.

</p>

<font size="+2">
<b><a
href="/stat?c=problem_statement&amp;pm=2413&amp;rd=4750">WordWrap</a></b>
</font>
<A href="Javascript:openProblemRating(2413)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      147 / 195 (75.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      92 / 147 (62.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>koder</b> for 453.07 points (9 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      324.80 (for 92 correct submissions)
    </td>
  </tr>
</table></blockquote>


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
      163 / 165 (98.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      126 / 163 (77.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 247.25 points (3 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      211.69 (for 126 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>
We are to implement a simplified version of the word-processing feature
that, given a piece of text, redistributes the line breaks so as to make
every line fit tightly within a desired column width. Line breaks are
not represented as such in this problem, since each line is given as a
separate element of an input array.

</p><p>

It seems that the first task at hand is to split the lines into tokens,
for which different programming languages offer various facilities. One
might use Java's trusty old <code>StringTokenizer</code>, for instance,
or resort to an even more ancient tool that comes with C++, the outrageous
<code>strtok</code> function. An approach that translates well into any
language is to do the tokenizing on the fly.

</p><p>

When working with Java strings at the character level, it is advisable
to use <code>StringBuffer</code> rather than the <code>String</code>
class, since the latter makes a whole new copy of the string with each
concatenation. This makes it a painfully slow operation. Even for
problems that use relatively small data sets, indiscriminate use of
<code>String</code> concatenation can cause your program to run out of
time. Beware!

</p><p>

In the code below, after declaring <code>StringBuffer</code>s to store
the current token and line, we initialize three integers that will serve
to keep track of the token length, line index, and character index.

</p><pre>
  public String[] justify(String[] lines, int columnWidth) {
    Vector v = new Vector();
    StringBuffer tok = new StringBuffer(), line = new StringBuffer();
    int tlen = 0, li = 0, ci = 0;
</pre><p>

Let us consider the current character in the current line. If it is not
a space, we can add it to the current token.

</p><pre>
    while (li &lt;lines.length) {
      char c = lines[li].charAt(ci);
      if (c != ' ')
        tok.append(c);
</pre><p>

If the character is either a space or the last character in the current
line, we have just completed a token. If the current line cannot
accommodate its length, we must store it and make a fresh line that
starts with this latest token. Otherwise, we add it to the current line.

</p><pre>
      if (c == ' ' || ci == lines[li].length()-1) {
        if (line.length() &gt;0 &amp;&amp; line.length()+1+tok.length() &gt;columnWidth) {
          v.add(line);
          line = tok;
        }
        else {
          if (line.length() &gt;0)
            line.append(' ');
          line.append(tok);
        }
</pre><p>

Furthermore, we must initialize a new token. If we have reached the end
of a line, we increment the line counter and reset the character counter.
Whether or not we have completed a token, the character counter must
be initialized.

</p><pre>
        tok = new StringBuffer();
        if (ci == lines[li].length()-1) {
          li++;
          ci = 0;
          continue;
        }
      }
      ci++;
    }
</pre><p>

Once we have processed all characters, let's not forget to store the
current line! Then a quick conversion from <code>StringBuffer</code>
to <code>String</code>, and we're done.

</p><pre>
    v.add(line);
    String[] ret = new String[v.size()];
    for (int i = 0; i &lt;v.size(); i++)
      ret[i] = ((StringBuffer) v.elementAt(i)).toString();
    return ret;
  }
</pre><p>

In typesetting systems that generate printer-ready copy, justification
means not only that words are redistributed among lines, but that the
spacing within and between words is adjusted so as to present a pleasing
uniformity of line length. It is rumored that <b>radeye</b> has plenty
to say on this subject if you only ask.

</p>

<font size="+2">
<b><a
href="/stat?c=problem_statement&amp;pm=2410&amp;rd=4750">LumberjackHack</a></b>
</font>
<A href="Javascript:openProblemRating(2410)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      12 / 195 (6.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 12 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>null</b> for null points (NONE)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>

<p>

We are asked to compute the minimum cost for a lumberjack to reach the
left or right edge of a grid where cells filled with a log are always
accessible, but no more than a single water cell may be traversed in the
course of the trip. A problem that asks for shortest paths in a grid
suggests the floodfill algorithm, which is just breadth-first search
carried out in a rectangular array.

</p><p>

To implement floodfill, we begin by allocating an array that will store,
for each cell in the grid, the minimum cost to reach it. The twist in
this problem is that a two-dimensional array will not suffice, since the
lumberjack may reach a cell with or without having traversed a water cell,
and a minimum cost must be stored separately for each case. This is likely
what tripped up many coders' efforts during the match. To see why it
won't do to merge the two cases at each cell, consider the example below.

</p>

<div align="center"><img src="/i/srm/srm186_2.png"/></div>

<p>
The lumberjack takes 38 seconds to travel from A to B along the solid
blue line. By following the solid red line and traversing a water cell
along the way, he can travel from A to B in only 31 seconds. Now if
the latter route is held to be the optimal way of getting from A to B,
then it seems that the lumberjack should use the dashed red line to reach
safety, at a total cost of 31+19 = 50 seconds. Yet the dashed blue line,
which the lumberjack can only follow if he hasn't previously used up his
chance to traverse a water cell, will lead to safety at a lower total
cost of 38+11 = 49 seconds.
</p>

<p>
Hence, we must take care to allocate a three-dimensional array that,
for each cell in the grid, lets us store the best known cost of reaching
it both with and without traversing a water cell.
</p>

<pre>
  public int timeToShore(String[] riverMap) {
    int QLEN = 110000, q[][] = new int[QLEN][4], head, tail;
    int cost[][][] = new int[50][50][2];
    int dx[] = {-1, 0, 1, 0}, dy[] = {0, -1, 0, 1};
    int xx = riverMap.length, yy = riverMap[0].length(), best = -1;
    for (int i = 0; i &lt;riverMap.length; i++)
      for (int j = 0; j &lt;riverMap[i].length(); j++) {
        if (riverMap[i].charAt(j) == '+') {
          q[0][0] = i;
          q[0][1] = j;
        }
        cost[i][j][0] = cost[i][j][1] = -1;
      }
    q[0][2] = q[0][3] = tail = 0;
    head = 1;
</pre>

<p>
We also allocate a queue that will store the grid locations we are
currently exploring. You may recall from elementary algorithmics that a
stack lends itself to depth-first search, which tends to be inefficient
for grid exploration because it can explore rather long paths before
getting around to shorter ones. Breadth-first search, which always
explores shorter paths before longer ones, is implemented with a queue. In
the Java code above, we declare a pair of arrays, <code>dx</code> and
<code>dy</code>, that let us look up the <i>x</i> and <i>y</i> coordinate
increments for each of the four directions. We also find the lumberjack's
starting location and initialize the cost array with a dummy value.
</p>

<pre>
    while (head != tail) {
      int x = q[tail][0], y = q[tail][1], c = q[tail][2], w = q[tail][3];
      tail = (tail+1)%QLEN;
      if (w &gt;1 || (cost[x][y][w] != -1 &amp;&amp; cost[x][y][w] &lt;= c))
        continue;
      cost[x][y][w] = c;
      if ((y == 0 || y == yy-1) &amp;&amp; (best == -1 || c &lt;best))
        best = c;
</pre>

<p>
This loop runs until the queue is empty. Here we are reading a state off
the tail of the queue. Further below, we shall push new states onto its
head. States that are not better than the current optimum need not be
pursued any further. Otherwise, we update the optimal cost of reaching
this cell in the grid, as well as the optimal cost of reaching safety,
if applicable.
</p>

<pre>
      for (int i = 0; i &lt;4; i++) {
        int nx = x+dx[i], ny = y+dy[i], nc = c, nw = w;
        if (nx &lt;0 || nx >= xx || ny &lt;0 || ny >= yy)
          continue;
        if (riverMap[nx].charAt(ny) == '.') {
          nc += 3;
          nw++;
        }
        else
          nc += 1 + (i%2 == 0 ? 0 : 1);
        q[head][0] = nx;
        q[head][1] = ny;
        q[head][2] = nc;
        q[head][3] = nw;
        head = (head+1)%QLEN;
      }
    }
    return best;
  }
</pre>

<p>
Finally, we generate a new state in each of the four directions,
remembering to increment the travel cost appropriately. Notice that most
of this code consists of bookkeeping for the cost grid and the state
queue: initializing arrays, popping states off, pushing states on. This
is routine stuff that will come to you easily once you have implemented
breadth-first search a few times.
</p>

<font size="+2">
<b><a
href="/stat?c=problem_statement&amp;pm=2243&amp;rd=4750">Foobar</a></b>
</font>
<A href="Javascript:openProblemRating(2243)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      123 / 165 (74.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      75 / 123 (60.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 452.53 points (9 mins 24 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      296.90 (for 75 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given a piece of text and a mapping of plain characters to code
characters, we are to overwrite with asterisks any profanity (from a
fixed list of seven) that is rendered with any number of letters encoded
and any number of spaces separating the letters. Formally speaking,
all such renderings of a profanity constitute a regular language, which
can therefore be recognized by a regular expression or, equivalently,
by a finite automaton. Indeed, a few enlightened coders attempted to
solve this problem by generating a state machine from the given encoding.

</p><p>

A less civilized approach that works just as well here, what with the
limit of 50 characters in a text fragment, is to take every possible
substring, of which there are no more than 50*50 = 2500, and determine by
iteration whether it amounts to a profanity. First, however, to ensure
that asterisks are not written over spaces adjoining a profanity, we
discard substrings that begin or end with a space. For the remaining
substrings, we can eliminate all spaces and think no more of them. Why
should we?

</p><pre>
  public String censor(String plain, String code, String text) {
    String[] cusses = {"heck", "gosh", "dang",
                       "shucks", "fooey", "snafu", "fubar"};
    StringBuffer clean = new StringBuffer(text);
    for (int i = 0; i &lt;text.length(); i++)
      for (int j = i; j &lt;text.length(); j++) {
        if (text.charAt(i) == ' ' || text.charAt(j) == ' ')
          continue;
        String sub = text.substring(i, j+1).replaceAll(" ", "");
</pre><p>

We can easily cut down on the number of iterations by considering
only those cases where the substring is exactly as long as a candidate
profanity.

</p><pre>
        for (int ix = 0; ix &lt;cusses.length; ix++) {
          if (cusses[ix].length() != sub.length())
            continue;
          String cuss = cusses[ix];
</pre><p>

If a character in the candidate does not equal the corresponding character
of a profanity, we loop through the possible encodings to see whether one
of them applies. If none of them does, we break out of the inner loop.

</p><pre>
          int jx = 0;
          for ( ; jx &lt;cuss.length(); jx++)
            if (sub.charAt(jx) != cuss.charAt(jx)) {
              int kx = 0;
              for ( ; kx &lt;code.length(); kx++)
                if (sub.charAt(jx) == code.charAt(kx) &amp;&amp;
                  plain.charAt(kx) == cuss.charAt(jx))
                    break;
              if (kx == code.length())
                break;
          }
</pre><p>

If we never broke out of the inner loop, then an encoding was found for
every character, so we can proceed with censorship. We know the original
length of the substring from the indices we used to extract it.

</p><pre>
          if (jx == cuss.length())
            for (int k = i; k &lt;= j; k++)
              clean.setCharAt(k, '*');
        }
      }
    return clean.toString();
  }
</pre><p>

</p><p>

Censoring profanities in the real world is not nearly so simple. Quite
apart from the technical difficulties involved, there is the matter
of deciding what is offensive and what is not. Standards of propriety
vary through time and space, but so do semantics. For instance, to tell
someone that "you suck" or to say of something that "it sucks" used
to mean, when the expression arose in the fifties, that the object of
scorn was hollow and filled with a vacuum. It was the sort of banter
that required some scientific education to appreciate fully. Today,
by association with an unrelated field of endeavor, these phrases have
acquired a rather more scurrilous quality.

</p>

<font size="+2">
<b><a
href="/stat?c=problem_statement&amp;pm=2411&amp;rd=4750">PuckShot</a></b>
</font>
<A href="Javascript:openProblemRating(2411)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      27 / 165 (16.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      15 / 27 (55.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 672.49 points (22 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      519.81 (for 15 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p>

We are asked to calculate the steepest angle at which a hockey puck
can be fired from the blue line, off the boards, and into the net
while avoiding a few 50-centimeter line segments scattered on the ice.
The elegant way to do this begins with the observation that unless the
puck can be aimed at the right goalpost, it must graze the left endpoint
of some player. For every such shot, one can verify without resorting
to floating-point calculations whether the puck's path intersects any
other player's line segment. Only when calculating the magnitude of the
optimal angle is it necessary to compute a <code>double</code> value.

</p><p>

A less tidy approach that requires <code>double</code>s throughout is
to calculate the shadow projected by each player onto the goal line,
keeping track of the longest intervals that are left in the clear. The
right endpoint of the rightmost such interval will then supply the answer.
In either approach, we can obviate the fuss of calculating rebounds by
reflecting the hockey rink. The puck can then pass through the looking
glass, as it were, and continue traveling in a mirror world to the
right.  All players are reflected indiscriminately, so that they can block
the puck before or after the rebound. The straight path of travel makes
it impossible for both a player and his mirror image to block the puck.

</p>

<div align="center"><img src="/i/srm/srm186.png" /></div>

<p>
In the Java code below, we use a single loop to iterate over the players
twice, using them raw the first time and reflecting them the second.
Values <code>l</code> and <code>r</code> are the <i>x</i> coordinates that
result from projecting the left and right endpoints of a player onto the
goal line. We can get away with the expression <code>iceHeight/y</code>
only because the problem constraints guarantee a non-zero <code>y</code>.
The arrays <code>sl</code> and <code>sr</code> are used to store the
left and right endpoints of the longest intervals that are not shadowed
by any player so far. We shall use <code>nsl</code> and <code>nsr</code>
to temporarily hold the new intervals computed in each iteration.
</p>

<pre>
  public double caromAngle(int puckCoord, int[] xCoords, int[] yCoords) {
    double[] sl = new double[50], sr = new double[50];
    double[] nsl = new double[50], nsr = new double[50];
    int px = puckCoord, snum = 1, nsnum;
    px = puckCoord;
    int pnum = 2*xCoords.length;
    sl[0] = iceWidth+(iceWidth-goalWidth)/2.0;
    sr[0] = sl[0]+goalWidth;
    for (int i = 0; i &lt;pnum; i++) {
      double x, y, l, r;
      x = xCoords[i &lt;pnum/2 ? i : i-pnum/2];
      y = yCoords[i &lt;pnum/2 ? i : i-pnum/2];
      if (i >= pnum/2)
        x += 2*(iceWidth-x);
      l = px + iceHeight/y * (x-playerWidth/2.0 - px);
      r = px + iceHeight/y * (x+playerWidth/2.0 - px);
</pre>

<p>
We maintain the unshadowed intervals in order from left to right while
calculating the effect of successive shadows. There are four types of
shadow to deal with.  There is a kind that obscures an interval entirely,
and another that doesn't occlude it at all. Among the shadows that fall
partially onto an interval, some leave an unoccluded segment to the left,
and some to the right. Or perhaps both, but there is no need to deal
with such cases separately.
</p>

<pre>
      nsnum = 0;
      for (int j = 0; j &lt;snum; j++) {
        if (l &lt;= sl[j] &amp;&amp; sr[j] &lt;= r)
          continue;
        if (r &lt;sl[j] || sr[j] &lt;l) {
          nsl[nsnum] = sl[j];
          nsr[nsnum++] = sr[j];
          continue;
        }
        if (sl[j] &lt;l) {
          nsl[nsnum] = sl[j];
          nsr[nsnum++] = l;
        }
        if (r &lt;sr[j]) {
          nsl[nsnum] = r;
          nsr[nsnum++] = sr[j];
        }
      }
      for (int j = 0; j &lt;nsnum; j++) {
        sl[j] = nsl[j];
        sr[j] = nsr[j];
      }
      snum = nsnum;
    }
    if (snum == 0)
      return -1;
    double x = sl[0];
    double angle = Math.atan(iceHeight/(x-px))*180.0/Math.PI;
    return angle;
  }
</pre>

<p>
All our calculations use a reflected goal. Thus, in retrieving what
appears to be the left endpoint of the leftmost interval, we actually
obtain the right endpoint of the rightmost interval.
</p>



                        <p>
                        <img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=273434"><strong>Eeyore</strong></a><br />
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
