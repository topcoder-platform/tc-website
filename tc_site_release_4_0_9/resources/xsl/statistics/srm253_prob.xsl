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

<title>Single Round Match 253 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 253</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, July 23, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
SRM 253 had a large turnout, and also offered cash prizes to the top finishers in each room.  Coincidence?
<b>Eryx</b> finished first in division 1, with the fastest time on the 1000-point problem.
A successful challenge by <b>snewman</b> lifted him up to second place, with <b>Petr</b> finishing third.
<b>tomek</b> followed closely behind, rising to within 7 rating points of the top spot on the coder ranking list.
</p>

<p>
In division 2, newcomer <b>soul-net</b> finished in first place by a margin of over 100 points, with the fastest time on the 1000-point problem and 5 successful challenges.
Such success with challenges is rarely seen from coders competing in their first TopCoder event.
<b>killer</b> and <b>motono</b> finished second and third, followed closing by <b>cryst</b>.
</p>


<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4675&amp;rd=7227"
name="4675">ObjectPacking</a></b>
</font>
<A href="Javascript:openProblemRating(4675)"><img hspace="10" border="0" height= "18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      339 / 373 (90.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      271 / 339 (79.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>RizLA</b> for 247.85 points (2 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      208.52 (for 271 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this problem, you must simply loop over all the boxes in the input, test each one to see if the object will fit inside, and keep track of the area of the smalled box.
Here is a sample solution:
</p>
<pre>
    int smallBox(int objWidth, int objLength, vector&lt;int&gt; boxWidth, vector&lt;int&gt; boxLength) {
        int ret = -1;
        for (int i=0; i&lt;boxWidth.size(); i++) {
            const int W = boxWidth[i];
            const int L = boxLength[i];
            if ((W &#8805; objWidth &amp;&amp; L &#8805; objLength) || (W &#8805; objLength &amp;&amp; L &#8805; objWidth))
                if (ret == -1 || W*L &lt; ret)
                    ret = W*L;
        }
        return ret;
    }
</pre>
<p>
The only tricky part is that you need to test the box in each of the two possible orientations.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4674&amp;rd=7227"
name="4674">Decipher</a></b>
</font>
<A href="Javascript:openProblemRating(4674)"><img hspace="10" border="0" height= "18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      201 / 373 (53.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      153 / 201 (76.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gcdart</b> for 482.45 points (5 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      280.17 (for 153 correct submissions)
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
      269 / 282 (95.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      251 / 269 (93.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 247.05 points (3 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186.78 (for 251 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The solution to this problem has three parts: 1) finding the frequency of letters appearing in the encoded text, 2) sorting these letters by frequency, and 3) replacing them with those given in the frequencyOrder string.  To see how these steps can be coded efficiently, let's dissect <b>antimatter</b>'s solution, which took him just over 3 minutes to write.
(I have expanded some macros and renamed the parameters to the function, for purposes of clarification.) </p>

<pre>
    vector&lt;string&gt; decipher(vector&lt;string&gt; encoded, string
frequencyOrder) {
        map&lt;char, int&gt; foo;
        for (int i = 0; i &lt; encoded.size(); i++) {
            for (int j = 0; j &lt; encoded[i].size(); j++) {
                if (encoded[i][j] != ' ') foo[encoded[i][j]]++;
            }
        }
</pre>

<p>
The first few lines loop over each character of each line in the encoded text, making a histogram of the letter occurrences.  He uses an STL map to keep a count of how many times each letter appears.
</p>

<pre>
        vector&lt;pair&lt;int,char&gt; &gt; X;
        for (map&lt;char,int&gt;::iterator i = foo.begin(); i != foo.end(); ++i) {
            X.push_back(make_pair(-i-&gt;second, i-&gt;first));
        }
        sort(X.begin(), X.end();
</pre>

<p>
The next 5 lines sort the letters by frequency. 
He first creates an STL vector data structure of pairs, where each pair contains the frequency and the letter.
The STL sort() algorithm sorts the pairs based on the first element in each pair (the letter frequency).
Note that only letters that appear in encoded will have been added to the map, and therefore only those letters will be present in the vector.
Also note that this implicitly implements the tie-break case in the problem statement, because the letters will be read out of the map in alphabetical order, and sort() will not swap two letters that have the same frequency.
</p>

<pre>
        map&lt;char,char&gt; rev;
        for (int i = 0; i &lt; X.size(); i++) rev[X[i].second] = frequencyOrder[i]; </pre>

<p>
He can get the letters sorted by frequency by looking at the second element in each of the sorted vector of pairs.
He copies these letters into a second STL map to creating a remapping table.
This code relies on the fact that X will contain the same number of elements as there are characters in frequencyOrder.
</p>

<pre>
        for (int i = 0; i &lt; encoded.size(); i++) {
            for (int j = 0; j &lt; encoded[i].size(); j++) {
                if (encoded[i][j] != ' ') encoded[i][j] = rev[encoded[i][j]];
            }
        }
        return encoded;
    }
</pre>

<p>
These last few lines simply loop over each character of each line of encoded, and replace them using the remapping table created above.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4678&amp;rd=7227"
name="4678">ABCPath</a></b>
</font>
<A href="Javascript:openProblemRating(4678)"><img hspace="10" border="0" height= "18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      104 / 373 (27.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      33 / 104 (31.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>soul-net</b> for 901.29 points (9 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      676.34 (for 33 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Several coders were tempted to solve this function with a recursive function.
Starting at each 'A' in the grid and recursing on each neighboring 'B'.
The recursive function would then call itself on each neighboring 'C', and so on, until it reaches the end of a path.  Such a solution does it fact find every path of consecutive letters and works fine for small input cases.  But the problem is that some input cases contain <i>billions</i> of paths, and the simple recursive solutions timed out in the system tests.
</p>

<p>
A more efficient solution is instead of finding each path, mark all the letters that are <i>part of a path</i>.  For example, consider the grid given in the problem statement:
</p>

<pre>
A B E
C F G
B D H
A B C
</pre>

<p>
We'll use uppercase letters to represent letters that are part of a path.
Since all paths start with 'A', every 'A' is in a path and we'll initialize them to uppercase and all other letters to lowercase:
</p>

<pre>
<b>A</b> b e
c f g
b d h
<b>A</b> b c
</pre>

<p>
Now, the next step is to loop over all the letters and look for any 'b'
that is next to an uppercase 'A', and change those 'b's to uppercase:
</p>

<pre>
A <b>B</b> e
c f g
<b>B</b> d h
A <b>B</b> c
</pre>

<p>
Then, loop over all the letters and look for any 'c'
that is next to an uppercase 'B':
</p>

<pre>
A B e
<b>C</b> f g
B d h
A B <b>C</b>
</pre>

<p>
And then 'd':
</p>

<pre>
A B e
C f g
B <b>D</b> h
A B C
</pre>

<p>
The search for an 'e' next to an uppercase 'D' doesn't result in any matches.
Therefore, the longest path is from 'A' to 'D', 4 letters long.
A solution could also use a second 2-dimensional array of boolean values to mark which letters are reachable, rather than changing them from lowercase to uppercase.
Note that the maximum running time of this algorithm is the size of the largest  grid (50x50) times the longest possible path (26), much smaller than the billions of paths a simple recursive solution would have to find.
</p>

<p>
If you enjoyed this problem, and are looking for something similar but a little more challenging, try solving the next problem "AlphabetCount" in the division 1 practice room.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4668&amp;rd=7227"
name="4668">AlphabetCount</a></b>
</font>
<A href="Javascript:openProblemRating(4668)"><img hspace="10" border="0" height= "18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      243 / 282 (86.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177 / 243 (72.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>HardCoder</b> for 497.78 points (1 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      369.71 (for 177 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This was a straightforward dynamic programming problem, solved by keeping a count of subpaths to each letter.
Create a 2-dimensional array, and initialize it with a 1 corresponding to each 'A' in the grid, and a 0 for all other letters.
Then, for each 'B' in the grid, set its value to the sum of the values of all adjacent 'A's.
Next, for each 'C' in the grid, set its value to the sum of the values of all adjacent 'B's.
Repeat for all letters up to the limit specified as a parameter to the problem, and then return the sum total of the values for that letter.
The only thing you need to be careful about is avoiding arithmetic overflow.
</p>

<p>
For an example of a clean, easy-to-read implementation, see <b>HardCoder</b>'s solution, which he wrote in under 2 minutes!
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4667&amp;rd=7227"
name="4667">Pitches</a></b>
</font>
<A href="Javascript:openProblemRating(4667)"><img hspace="10" border="0" height= "18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      37 / 282 (13.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      14 / 37 (37.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 670.23 points (22 mins 23 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      518.47 (for 14 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first key to this problem is expressing the pitcher's chance of success (a strike out) as a 2-dimensional function of the probabilities that the pitcher and batter use to select a pitch.
The second key is to then solve for the two values of those probabilities that define the "equilibrium point", the point where neither the batter nor the pitcher can improve their situation.
</p>

<p>
Imagine the function as a terrain, and the equilibrium point as a ball on that terrain.  The pitcher wants to get the ball to as high an elevation as he can, but can only roll it north and south.  The batter wants to get the ball to as low an elevation as he can, but can only roll the ball east and west.
The (an) equilibrium point is a location on the terrain where if the pitcher were to roll the ball north <i>or</i> south, the batter would then immediately be able to roll the ball east or west to a lower elevation, thus improving his situation.  And, at the same time, at this point if the batter were to roll the ball east or west, the pitcher would then immediately be able to roll the ball north or south to a higher elevation, improving his situation.
</p>

<p>
In this problem, the function that expresses the pitcher's chance is a linear combination of his chances of success for each of the 4 possible combinations of the batter and pitcher choosing a fast ball or a curve ball.
Since this function is bilinear, the equilibrium point described above is either at one of the four corners, or where the gradient is zero.
When the count is 3 balls and 2 strikes, these chances come directly from the stats parameter to the problem.  For other counts, they also depend on the solution to the problem with balls+1 and with strikes+1, which can be obtained with a recursive call to the method.
</p>

<p>
Here is my solution to this problem:
</p>

<pre>
    public double strikeOut(double[] stats, int balls, int strikes) {
        double P_strike = (strikes &lt; 2) ? strikeOut(stats, balls,
strikes+1) : 1;
        double P_ball   = (balls &lt; 3)   ? strikeOut(stats, balls+1,
strikes) : 0;
        double A = P_ball * stats[0] + P_strike*stats[1];
        double B = P_ball * stats[2] + P_strike*stats[3];
        double C = P_ball * stats[4] + P_strike*stats[5];
        double D = P_ball * stats[6] + P_strike*stats[7];
        if (A &#8805; B &amp;&amp; C &#8805; D) return Math.max(B, D);
        if (A &#8804; B &amp;&amp; C &#8804; D) return Math.max(A, C);
        if (A &#8805; C &amp;&amp; B &#8805; D) return Math.min(A, B);
        if (A &#8804; C &amp;&amp; B &#8804; D) return Math.min(C, D);
        return (A*D - B*C) / (A+D-B-C);
   }
</pre>

<p>
See the discussion in the forums for an even shorter solution by <b>snewman</b>.
</p>
                <p>
                <img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=287269"><strong>legakis</strong></a><br />
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
