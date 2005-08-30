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

<title>Single Round Match 225 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 225</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Tuesday, December 28, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
In Division 1, the three coders who finished all three problems, <b>Eryx</b>, <b>Snapdragon</b> and <b>kalinov</b>, took the top three spots.  They finished the coding phase just about a challenge away from each other, and <b>Eryx</b>'s 3 challenges secured his lead while <b>SnapDragon</b>'s two moved him into second place.  In the end, of course, what was important was that their solutions held up in the system tests.</p>
<p>In Division 2, it almost appeared that newcomers would sweep the top 3 spots, but when an obscene number of 500-pointers failed, the top three spots were again occupied by the only three coders to successfully solve all three problems.  The leader was newcomer <b>Snail</b>, followed by <b>BeanSweany</b>, who will be returning to Division 1, and third was <b>fvillaf</b>, who will be entering Division 1 for the first time.
</p>
<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3077&amp;rd=5871" name="3077">SignatureDecorator</a></b>
</font>
<A href="Javascript:openProblemRating(3077)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      174 / 189 (92.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      142 / 174 (81.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Wang_Wei</b> for 249.40 points (1 mins 24 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      207.50 (for 142 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This simple String-manipulation problem got a few people hung up who didn't read the problem statement carefully enough (or who didn't scrutinize the output of their programs on the example cases closely enough).  The idea was that you start with a string and you are given a series of instructions on how to manipulate it by adding "decorations" to it.</p>
<p>The available instructions were "append", "prepend" and "surround".  The trickiest of these was surround, because it involved prepending the decoration to the string, and then appending it to the string <i>backwards</i>.  By far, the most coders that failed this problem forgot to reverse the string before appending it in surround commands.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3092&amp;rd=5871" name="3092">ParameterSubstitution</a></b>
</font>
<A href="Javascript:openProblemRating(3092)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      111 / 189 (58.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 111 (20.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Shadowstalker</b> for 371.02 points (18 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      280.74 (for 23 correct submissions)
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
      163 / 172 (94.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      91 / 163 (55.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 237.64 points (6 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      180.36 (for 91 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
While there were several submissions faster than Shadowstalker's in Division 2 and SnapDragon's in Division 1, this problem turned out to have a lot more tricky cases to worry about than most.  Using what looked like the clever, easy way messed up most coders and using a method that was simple and "safe" was the way to approach this problem.</p>
<p>The safest way to do this problem was to just iterate one character at a time and construct the output.  Normally this means copying the string one character at a time until you run into a '$' symbol.  Once you find a '$', you check to see if there's a number after it.  If the next digit is not a number, or if it is a number that is greater than the number of parameters, you can just append the '$' and continue as if there were no ‘$’.  If a valid digit did follow, you also needed to check if the next character after that was a digit and if the two digits after the '$' formed a number less than or equal to the number of available parameters.  Then you insert the parameter indicated by the number after the '$' in place of the '$' and number.</p>
<p>The most common problem was doing a substitution that made something that looked like another parameter show up.  A few flavors of this problem were in the examples, but there were one or two ways to make this happen that people didn't think about.  Another common problem was that peoples' code couldn't handle parameters next to each other with no characters in between.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3094&amp;rd=5871" name="3094">ImageSteganography</a></b>
</font>
<A href="Javascript:openProblemRating(3094)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      21 / 189 (11.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 21 (76.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Obviously</b> for 707.99 points (20 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      572.39 (for 16 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was inspired by my father, who uses steganography tools in his work.  The idea behind steganography is that one can encrypt data into a file that doesn't appear to be anything secret.  A bmp image or a wav sound clip can have loads of data encrypted in them and look/sound indistinguishable from their original form.</p>
<p>In this problem, you needed to encrypt each character of the input into three bytes of the output.  One easy way to go about this problem was to start by creating an array of numbers from 0 to 3 that is 3 times as long as the message to be encoded.  This represents the numbers to be encoded into the image.  Then go through the numbers in the original image and insert these numbers (one way to do this is <tt>imageNum/4*4+encodeNum</tt>).</p>
<p>The final trick was that you had to encode an "end of message" number, which is basically putting a 3 in every spot after the message is done.</p>
<p>I avoided special-casing anything in my solution, which is hardly minimal:</p>
<p><pre>
   public String[] encode(String[] image, String message)
   {
      String[] ret = new String[image.length];
      int[] encoded = new int[801];
      for (int i=0; i&lt;encoded.length/3; i++)
      {
         int letter = 63;
         if (i &lt; message.length())
         {
            if (message.charAt(i) == ' ')
               letter = 0;
            else if (message.charAt(i) &gt;= 'A' &amp;&amp; message.charAt(i) &lt;= 'Z')
               letter = 1+message.charAt(i)-'A';
            else if (message.charAt(i) &gt;= 'a' &amp;&amp; message.charAt(i) &lt;= 'z')
               letter = 27+message.charAt(i)-'a';
            else if (message.charAt(i) &gt;= '0' &amp;&amp; message.charAt(i) &lt;= '9')
               letter = 53+message.charAt(i)-'0';
         }
         encoded[i*3] = 3&amp;letter;
         encoded[i*3+1] = 3&amp;(letter&gt;&gt;2);
         encoded[i*3+2] = 3&amp;(letter&gt;&gt;4);
      }
      int index = 0;
      DecimalFormat fmt = new DecimalFormat("000");
      for (int i=0; i&lt;ret.length; i++)
      {
         ret[i] = "";
         for (int j=0; j&lt;image[i].length(); j+= 3)
         {
            int current = Integer.parseInt(image[i].substring(j, j+3));
            current = current/4 * 4 + encoded[index++];
            ret[i] += fmt.format(current);
         }
      }
      //System.out.println(decode(ret));
      return ret;
   }
</pre></p>
<p>An interesting exercise I did while writing this problem is writing a decoder for the image.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3098&amp;rd=5871" name="3098">ComboBoxKeystrokes</a></b>
</font>
<A href="Javascript:openProblemRating(3098)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      127 / 172 (73.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      87 / 127 (68.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 481.67 points (5 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      343.50 (for 87 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
The best part about this problem is how many possible ways there are to look at it.  One way, for instance, is to model the problem as an unweighted directed graph, and make edges from each element to the next element to start with each letter.  Then it becomes a very typical shortest-path algorithm.  Another method is to start from each element and make an array of best distances.  The starting element always requires 0 keystrokes, then for each element, the next element starting with each letter of the alphabet requires no more than one more keystroke than the current element.  My implementation looks like this:</p>
<p><pre>
   public int minimumKeystrokes(String[] elements)
   {
      String e = "";
      for (int i=0; i&lt;elements.length; i++)
         e += elements[i].toLowerCase().charAt(0);
      int max = 0;
      for (int i=0; i&lt;e.length(); i++)
      {
         int[] dists = new int[e.length()];
         Arrays.fill(dists, 1000000000);
         dists[0] = 0;
         String e2 = e.substring(i) + e.substring(0, i);
         for (int j=0; j&lt;e.length(); j++)
         {
            for (char c = 'a'; c &lt;= 'z'; c++)
            {
               int ind = e2.indexOf(c, j+1);
               if (ind &gt;= 0)
                  dists[ind] = Math.min(dists[ind], dists[j] + 1);
            }
            max = Math.max(max, dists[j]);
         }
      }
      return max;
   }
</pre></p>
<p>One of the things that makes this implementation simple is that I am always starting from the first element of the combo box, and I manipulate the combo box to start on each element in sequence.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3485&amp;rd=5871" name="3485">Triangulation</a></b>
</font>
<A href="Javascript:openProblemRating(3485)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      9 / 172 (5.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 9 (33.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 453.78 points (44 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      411.52 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem is a very common thing to do in the area of computer graphics, because writing code for triangles can often be more efficient than writing it for general polygons.  Doing this can be tricky, however, with non-convex polygons (and could potentially be trickier if self-intersecting polygons are allowed).</p>
<p>This problem required the coder to find a set of N-3 lines that could be drawn to correctly triangulate the polygon.  Since almost any polygon has more than one correct triangulation, the set of lines should be the lexicographically smallest possible.  This didn't make the problem more complicated as much as it told you what order to look at lines.</p>
<p>The basic algorithm required to do this involved starting from the first point, and trying to insert a line from that point to every non-adjacent point after that.  For each of these lines, if the line doesn't intersect any previous lines or any of the edges of the polygon, and if it's inside the polygon, you can add it to your output.</p>
<p>At this point, the problem becomes two simpler problems now - how do you check if two lines intersect, and how do you determine if a line is inside a polygon (if the line doesn't intersect any of the edges of the polygon, it will either be all inside or all outside the polygon).  To answer these questions, I recommend reading the recent TopCoder editorials on geometry: <a href="http://www.topcoder.com/tc?module=Static&amp;d1=tutorials&amp;d2=geometry2#line_line_intersection">This one</a> explains how to find out where two lines intersect (you then must decide if that point is on both line segments).  <a href="http://www.topcoder.com/tc?module=Static&amp;d1=tutorials&amp;d2=geometry3#pointinpolygon">This one</a> explains how to decide if a point is inside a polygon (just try it with the midpoint of the new line).
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
