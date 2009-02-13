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

<title>Single Round Match 160 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 160</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Saturday, August 23, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
Tonight's set was pretty standard, with lots of successful submissions and few challenges in both divisions.  In an unusual turn of events, SRM 160 was not won by a member with a target, nor even by a red member.  Instead, it was a yellow member, PMH, who had the highest score, unaided by any challenges.  This win, the first by a yellow member in a long time, propelled PMH up 215 rating points, to 2066.
Less than 50 points behind was the TCCC champion dgarthur.  Rounding out the top 3 was bladerunner, only 8 points behind dgarthur.  
<br/><br/>In division 2, newcomer hagman was dominant, beating second place (and also a first time competitor) Jiggly by over 200 points.  His impressive win gave hagman a debut rating of 1809, and making him a member to watch.
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>Substitute</b> 
</font><A href="Javascript:openProblemRating(1333)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      141 / 146 (96.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      135 / 141 (95.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Jiggly</b> for 246.77 points (3 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      211.54 (for 135 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The simplest way to solve this problem was to look at each character in the code, starting from the first character, in order.  As you go along, you keep an integer representing the value so far.  If the character in the code is not in the key, you simply ignore it.  Otherwise, you multiply the integer by 10, and add the number represented by the character.  This is the standard way to parse numbers in any base: look at each character one at a time, multiplying by the base (10 in this case) and then adding each time.
</p> 

<font size="+2"> 
<b>Intersect</b> 
</font><A href="Javascript:openProblemRating(1356)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      81 / 146 (55.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 81 (77.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hagman</b> for 477.43 points (6 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      298.56 (for 63 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Computational geometry problems often trip people up, but this one wasn't too bad.  
There are a couple of ways to do this, and the simplest solution (in Java) makes use of the java.awt.Rectangle class.  
However, even without that class, the problem was quite doable.  
The first thing to do is initialize 4 integer to represent the rectangle that is in common to all of the rectangles in the input.
We'll label these 4 integers lx, ly, hx, and hy, and initialize lx and ly to -1,000,000 and hx and hy to 1,000,000.  This ensures that all of the rectangles in the input are smaller than the rectangle represented by lx, ly, hx, and hy.
Now, we process each rectangle one at a time.  First, we sort the x and y coordinates to find minx, miny, maxx, and maxy, for each rectangle.  
Next, we shrink the rectangle represented by lx, ly, hx, and hy to be only the area where it overlaps with rectangle represented by minx, miny, maxx, and maxy.
To do this, we simply set lx = max(lx, minx), and hx = min(hx,maxx), and similarly for y.  After we have done this for all rectangles, we need to check and see if lx, ly, hx, and hy represent a rectangle with positive area.  If lx &gt;= hx, or ly &gt;= hy, then return 0.  Otherwise, return (hx-lx)*(hy-ly).
</p> 

<font size="+2"> 
<b>Quilting</b> 
</font><A href="Javascript:openProblemRating(1608)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      11 / 146 (7.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 11 (54.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hagman</b> for 644.05 points (24 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      516.43 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 



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
      71 / 125 (56.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      53 / 71 (74.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>LunaticFringe</b> for 415.12 points (13 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      273.33 (for 53 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The tricky part about this problem was figuring out exactly how to spiral out.  Once you had that down, the rest was pretty simple.  First, you start with a big 2-D char array, say 200 x 200.  Initialize them all to something that won't be in the return, like 0.  Then, start with x and y at 100.  Now, you'll want to have two arrays, lets call them dx, and dy, each with 4 elements, each of which represents how to move in each direction.  For example, in java, you'd have:
<pre>
   int[] dx = {0,-1,0,1};
   int[] dy = {-1,0,1,0};
</pre>
You also have a variable, dir, representing what direction you are currently heading.  Last, you have two variables, gone and toGo, representing how far you have gone in one direction, and how far you need to go.
You initialize dir to 0, gone to 0, and toGo to 1.  So, you start at (100, 100), and add a section of quilt, whose color is determined by the three simple rules (finding which color to add can be done simply by looping over all of the 8 adjacent locations).
Then, you move dx[dir] in the x direction, and dy[dir] in the y direction, and increment gone.  If gone equals toGo, then you increment dir, mod 4.  The key step is knowing when to increase toGo.  If you look at the pattern, it turns out that you should increment gone whenever you increment dir to 2 or back to 0.  So, you have something like this:
<pre>
   char quilt[200][200];
   int x = 100, y = 100, dir = 0, gone = 0, toGo = 1;
   for(int i = 0; i &lt; length*width; i++){
      place a section of quilt at x,y.
      x = x + dx[dir];
      y = y + dy[dir];
      gone = gone + 1;
      if(gone == toGo){
         dir = (dir + 1)%4;
         if(dir==2 || dir == 0){
            toGo = toGo + 1;
         }
         gone = 0;
      }
   }
</pre>
Then, all thats left is to trim your big 2-D char array down to a String[], which isn't too hard.
</p> 

<font size="+2"> 
<b>Iditarod</b> 
</font><A href="Javascript:openProblemRating(1647)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      125 / 125 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      113 / 125 (90.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bsdude</b> for 241.36 points (5 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.80 (for 113 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Clearly very few people had trouble with this problem, since over 90% of competitors submitted it correctly.  This is pretty standard string parsing, and since the characters were always in the same positions, you could just parse substrings into integers, and with a little bit of simple math, you were done.  Handling the 12 AM/PM bit was the only real caveot here, but that was clearly illustrated in the examples.
</p> 

<font size="+2"> 
<b>Permutation</b> 
</font><A href="Javascript:openProblemRating(1135)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      16 / 125 (12.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 16 (43.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>PMH</b> for 739.97 points (18 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      551.75 (for 7 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The key to this problem was to realize that everything about lexicographic strings was really more of a smoke screen than anything else.  Finding the lexicographically  first string is pretty simple, once you understand the structure of the cycles in the problem.
<br/><br/>First, lets look at another way to find the cycle length of a string, other than actually going through and applying the permutation over and over again.  Each letter is permutated to some other letter (or itself), and that other letter is permuted to yet another letter, and so on.  Eventually, if you follow
 this chain of permutations, you'll get back to the letter you started at.  So, we can see that there are going to be a number of independent cycles in the permutation.  For example, the permutation "BADEC" has two cycles in it: A->B->A, and D->E->C->D.  These two cycles have length 2 and 3, respectively.  Therefore, every 2 times that we apply the permutation to the first cycle
we get back where he started.  Similarly, every three times we apply the permutation to the second cycle, we get back to where we started.  Now, you should be familiar
with the concept of a least common multiple (LCM).  In this case, the least common multiple of 2 and 3 is 6, and 6 permutations is the first time that both cycles are back where they started (the one of length 2 has gone around 3 times, and the one of length 3 has gone around 2 times).
So, the length of any permutation's cycle is the LCM of the lengths of all the smaller cycles that the permutation contains.
This implies that we want to find a set of numbers whose LCM is maximized, and whose sum (remember that the sum of the lengths of the cycles will be the total number of characters) is less than or equal to the input, n.
There are a few ways to do this.  You can do some recursive search, adding in factors, or perhaps even brute force if you realize that the potential factors come from a relatively small set of possibilities.  The way I did it was to try every possible LCM up to a certain large number.  
For each potential LCM, I took the prime factorization of that number, which gave me all of the factors that had to be cycle lengths.  If the sum of the factors was sufficiently small, I considered it as a potential set of smaller cycle lengths for my permutation.
<br/><br/>So, once you have the cycle lengths (factors), the question is how to get the lexicographically first string with those cycles.  It turns out that the best way to do this is to have all of the smaller cycles first, and to make each cycle be the letters, in order, but shifted left 1.  For example, if your cycle lengths where 2 and 3, the first string would be "BADEC".  Its a little hard to explain, but if you play with it a little on paper, you should be able to convince yourself.
<pre>
import java.util.*;
public class Permutation{
   String ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
   public String best(int n){
      int max = 1;
      for(int i = 1; i&lt;200000 ; i++){
         if(sum(pf(i)) &lt;= n)max = i;
      }
      int[] p = pf(max);
      int s = sum(p);
      Arrays.sort(p);
      String ret = "";
      for(int i = 0; i&lt;n-s; i++){
         ret+=ch.charAt(0);
         ch = ch.substring(1);
      }
      for(int i = 0; i&lt;p.length; i++){
         String st = ch.substring(0,p[i]);
         ch = ch.substring(p[i]);
         ret += st.substring(1)+st.charAt(0);
      }
      return ret;
   }
   /**
    * returns the prime factorization of n
    */
   int[] pf(int n){
      ArrayList al = new ArrayList(10);
      for(int i = 2; i*i&lt;=n; i++){
         int push = 1;
         while(n%i==0){
            n/=i;
            push*=i;
         }
         if(push&gt;1)
            al.add(new Integer(push));
      }
      if(n&gt;1)al.add(new Integer(n));
      int[] ret = new int[al.size()];
   for(int i = 0; i&lt;ret.length; i++)ret[i]=((Integer)al.get(i)).intValue();
      return ret;
   }
   int sum(int[] n){
      int ret = 0;
      for(int i = 0; i&lt;n.length; i++)
         ret+=n[i];
      return ret;
   }
}
</pre>
Most of the solutions I saw did essentially the same thing - find a set of integers whose product was maximized and whose sum did not exceed n.  However, most people did it with some sort of a recursive search, instead of taking prime factorizations.
</p> 


                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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

