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
<tc-webtag:forumLink forumID="505636" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Collegiate Challenge <br> Qualification Problem Set 3</span><BR/>February 23-24, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
TopCoder's highest rated member, tomek, competed in this problem set, but ended up a little bit slower than Wernie, who took 1<sup>st</sup> place by less than 10 points.  bmerry was a close 3<sup>rd</sup>, less than 50 points out of 1<sup>st</sup> place, and the best new comer was freestyler in 14<sup>th</sup>.
</p> 
  
<H1> The Problems </H1> 

<font size="+2"> 
<b>Commission</b> 
</font> 
<A href="Javascript:openProblemRating(2293)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505636" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      123 / 132 (93.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      117 / 123 (95.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>haha</b> for 246.43 points (2 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      199.39 (for 117 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was actually inspired by a real-life scenario involving a furniture company.  Basically, you want to know how much a cheaper salesman will have to sell in order to for you to make the same profit as you currently do with your expensive salesman.  Your current salesman sells <b>$sales</b> goods, <b>cost%</b> of which go to your overhead, and 20% of which go towards his commission.  The new salesman works for a lower commission, so he doesn't need to sell quite as much for you to make the same profit.  While you could have used some sort of numerical search technique (binary search, for instance), if you work with the terms a bit, there is a relatively simple closed form solutions that most coders found without trouble.  First, find out how much profit you currently make: <b>sales*(1-0.2-cost/100)</b>.  Next, consider that your profit with the new salesman will be <b>x*(1-commission/100-cost/100)</b>, for some <b>x</b>, which represents the return value.  Now, you simply need to set these two equations to be equal and do the algebra to get <b>x = sales*(1-0.2-cost/100)/(1-commission/100-cost/100)</b>
</p> 

<font size="+2"> 
<b>Scale</b> 
</font> 
<A href="Javascript:openProblemRating(2294)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505636" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      65 / 132 (49.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 65 (67.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Wernie</b> for 520.08 points (12 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      357.65 (for 44 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Image scaling is a pretty well-studied algorithm, and there are lots of different ways to do it.  The method used in this problem is not very commonly used, as more advanced interpolation techniques are generally preferred.<br/><br/>
The algorithm to solve this problem was hinted at in the problem statement.  Basically, you first scale the image up so that width of the image is divisible by both the original width and the scaled width.  You do the same thing for the height.  You could find the least common multiple of the two widths, but that help you in the worst case, so you might as well just use the prduct of the two widths as the width in your scaled up image.  Hence, in the problem statement, when we scaled an image from 2x2 to 3x3, we first made a 6x6 image.  In the worst case, this will give you an image with 20 million pixels, which is quite manageable, so long as you use only one or two bytes per pixel.  Once you have the larger image, you can scale it back down to the required dimensions by dividing up into a number of blocks, each one the same size as the original image.  Hence, when we go from 2x2 to 3x3, our blocks are 2x2.  If we take the average value of the pixels in a block, and round it, we get the value for one pixel in the return:
<pre>
        char[][] b = new char[image.length*y][image[0].length()*x];
        for(int i = 0; i&lt;b.length; i++)for(int j = 0; j&lt;b[0].length; j++)
            b[i][j] = image[i/y].charAt(j/x);
        String[] ret = new String[y];
        Arrays.fill(ret,"");
        for(int i = 0; i&lt;y; i++)for(int j = 0; j&lt;x; j++){
            double tot = 0;
            for(int k = 0; k&lt;image.length; k++)for(int l =0 ; l&lt;image[0].length(); l++){
                tot += b[i*image.length+k][j*image[0].length()+l];
            }
            ret[i] += (char)Math.round(tot/image.length/image[0].length());
        }
        return ret;
</pre>
If we needed to, we could solve this without explicitly making the scaled up image.  Our loops end up being basically the same, and our runtime is still O(N^4) (where N is the size of the largest dimension), but we use a lot less memory.  Basically, we note that when we look up <tt>b[i*image.length+k][j*image[0].length()+l]</tt> in the above code, we could instead have looked up the value in the original image simply by dividing the two coordinates by x and y, respectively: <tt>image[(i*image.length+k)/y].charAt((j*image[0].length()+l)/x)</tt>.  We can also improve our runtime significantly if we want to be really clever.  Rather than considering a larger, scaled up image, we can calculate exactly which pixels in the original image have an effect on a particular pixel in the new image.  Say we are considering pixel (i,j) in the scaled image.  That pixel falls in the region from <tt>(i-1,j-1)</tt> to <tt>(i,j)</tt> in the scaled image, and if you do out the math, you'll find that it falls in the region <tt>((i-1)*width/y,(j-1)*height/y)</tt> to <tt>(i*width/y,j*height/y)</tt>, where width and heigh correspond to the original image.  Now, we can go to the original image and iterate over all pixels that are at least partly in this region, and calculate how much of each one is in the region.  The runtime for this is a little harder to calculate, but it works out to O(N^2), a significant improvement.  See mathijs' solution for an implementation of this.
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
