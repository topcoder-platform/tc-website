<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505634" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Collegiate Challenge <br> Qualification Problem Set 1</span><BR/>February 23-24, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
Last year's Collegiate Challenge winner, dgarthur was assigned to this room, but only got 5<sup>th</sup>, 35 points behind winner Eryx.  antimatter and WishingBone took 2<sup>nd</sup> and 3<sup>rd</sup>, respectively, and were separated by less than 2 points.  Fleur, in 8<sup>th</sup> place, was the most notable new comer, less than 50 points behind the top spot.
</p> 
  
<H1> The Problems </H1> 

<font size="+2"> 
<b>DiamondLogo</b> 
</font> 
<A href="Javascript:openProblemRating(1910)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505634" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      110 / 132 (83.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      93 / 110 (84.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>WishingBone</b> for 287.38 points (4 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.93 (for 93 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
While this problem was a little bit more involved than some of the other Qualification Round easy problems, passing the example cases all but guaranteed a correct solution (I looked at a few failed solutions, and didn't find one that passed the examples).  I think that a big part of many of the failures was that it was a bit tricky to compare your solution to the reference because there were so many repeated characters.  If you aren't using an automatic validator (check out the plugins link from the home page), you should really copy and paste both answers to make sure everything lines up.  Anyhow, to the solution...
<br/><br/>
First off, the return is square with size*2-1 rows and columns.  So, if we loop over the rows, our outer loop should go from 0 to size*2-2.  In each row, we first add some background characters, then an 'X', some spaces, another 'X' and some more background characters.  The meat of the problem is figuring out how many spaces and how many backgroud characters to add.  In my solution, I dispensed with the bottom half of the image by using the symmetry to copy the top half.  This makes it a little bit easier to figure out how many spaces and background characters to use, since you would otherwise have to deal with two different cases.  So, for row <i>i</i>, with <i>i</i> &lt;= size, there are max(0,<i>i</i>*2-1) spaces.  There are also size-i-1 background characters on each side of the diamond.  Both of these equations can be easily derived simply by looking at the examples, and if you can come up with equations that work for the examples, you can be pretty confident (for this problem) that your equations are generally correct.
<pre>
    public String[] logo(int size, char background)
    {
        String[] ret = new String[size*2-1];
        for (int i = 0; i &lt; size; i++) {
            char[] row = new char[size*2-1];
            Arrays.fill(row, ' ');
            row[size-1-i] = 'X';
            row[size-1+i] = 'X';
            for (int j = 0; j &lt; size-1-i; j++) {
                row[j] = background;
                row[size*2-2-j] = background;
            }
            ret[i] = new String(row);
            ret[size*2-2-i] = new String(row);
        }
        return ret;
    }
</pre>
</p> 

<font size="+2"> 
<b>Surveyor</b> 
</font> 
<A href="Javascript:openProblemRating(1359)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505634" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      57 / 132 (43.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      46 / 57 (80.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 537.01 points (3 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      433.27 (for 46 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem can be solved by using the polygon area algorithm that has been described in previous writeups.  You can read about this on <a href="http://mathworld.wolfram.com/PolygonArea.html">MathWorld</a>.  But here you didn't need to know this general formula to find the area, as all the angles were 90 or 270 degrees.  Since there are at most 50 edges, there are at most 50 distinct x coordinates.  Similarly, there at most 50 distinct y coordinates.  So, we can use coordinate compression to solve this problem.  We look at each interval, between two adjacent x coordinates, then we go through and look at all of the horizontal edges that span the current interval.  If we sort these horizontal lines by y coordinate, we get a series y<sub>1</sub>,y<sub>2</sub>,...,y<sub>n</sub>, with y<sub>1</sub> &lt;= y<sub>2</sub> &lt;= ... &lt;= y<sub>n</sub>.  Now, since y<sub>1</sub> is the bottom edge, we know that the region between y<sub>1</sub> and y<sub>2</sub> is in the polygon, while the region between y<sub>2</sub> and y<sub>3</sub> is not and so on.  Hence, we can find all the regions within the interval that are in the polygon and add them up.
<pre>
    public int area(String direction, int[] length){
    int[] x = new int[length.length];
    int[] y = new int[length.length];
    String dirs = "SENW";
    int[] dx = {0,1,0,-1};
    int[] dy = {1,0,-1,0};
    int xx = 0, yy = 0;
    for(int i = 0; i&lt;length.length; i++){
        x[i] = xx;
        y[i] = yy;
        xx += length[i]*dx[dirs.indexOf(direction.charAt(i))];
        yy += length[i]*dy[dirs.indexOf(direction.charAt(i))];
    }
    int[] xs = (int[])x.clone();
    Arrays.sort(xs);
    int[] ys = new int[x.length];
    int ptr;
    int ret = 0;
    for(int i = 0; i+1&lt;xs.length; i++){
        if(xs[i]==xs[i+1])continue;
        ptr = 0;
        for(int j = 0; j&lt;y.length; j++){
            if(x[j] &lt;= xs[i] &amp;&amp; x[(j+1)%x.length] &gt;= xs[i+1] || 
               x[(j+1)%x.length] &lt;= xs[i] &amp;&amp; x[j] &gt;= xs[i+1]){
                ys[ptr++] = y[j];
            }
        }
        Arrays.sort(ys,0,ptr);
        for(int j = 0; j&lt;ptr; j+=2){
            ret += (xs[i+1]-xs[i])*(ys[j+1]-ys[j]);
        }
    }
    return ret;
}
</pre>
</p> 

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
