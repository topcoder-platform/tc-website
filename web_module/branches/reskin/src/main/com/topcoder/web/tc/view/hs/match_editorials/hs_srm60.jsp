<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 60 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13529&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="524127" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 60</span><br />Tuesday, October 28, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
The match atracted 66 competitors. Coders were faced with standard Easy problem, a little bit easier Medium and a little bit harder Hard problem. Success rate for Easy problem was low - only 56.52%. Only 5 coders managed to solve Hard problem correctly.
</p> 
<p>
First submission was made by <tc-webtag:handle coderId="22696982" context="hs_algorithm"/> who submitted    Easy problem for 234.32 points. <tc-webtag:handle coderId="22263204" context="hs_algorithm"/> was the first who submitted all the problems and won the
match. <tc-webtag:handle coderId="22263204" context="hs_algorithm"/> showed great performance scoring the fastest time on each problem - congrats! Challenge and System test phase didn't make any changes in the first five places that were occupied by 
<tc-webtag:handle coderId="22263204" context="hs_algorithm"/>, <tc-webtag:handle coderId="22662575" context="hs_algorithm"/>, <tc-webtag:handle coderId="22698470" context="hs_algorithm"/>, <tc-webtag:handle coderId="15700786" context="hs_algorithm"/>
and <tc-webtag:handle coderId="21347419" context="hs_algorithm"/>, respectively.
</p>
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10042&amp;rd=13529" name="10042">WordsPuzzle</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10042)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524127" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      42 / 62 (67.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      26 / 42 (61.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 236.26 points (6 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      160.87 (for 26 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is really straightforward. Basically, the most important thing is to carefully read the problem 
statement and implement string replacing, because for finding substrings one can use built-in function.
The constraints are very low, so the most naive algorithm will pass in time.
</p>
<p>
Below is shown a pseudo-code for finding the number of different words from <code><strong>secretWords</strong></code> that occur as
substrings within some given string <code>str</code>:
<pre><code>int countSWords(String str)
  ret = 0
  for each word w from <strong>secretWords</strong>
    if w is substring of str
      ret = ret + 1
  return ret
end countSWords
</code></pre>
</p>
According to the part of problem statement "...to replace at most two letters...", it is clear that we should check for the solution when:
<ul>
<li>there are no replacements</li> 
<li>one letter is replaced</li> 
<li>two letters are replaced</li>
</ul>
Knowing this and having the method <code>countSWords</code>, we can easily write the rest of the solution:
<pre><code>ret = countSWord(<strong>mainWord</strong>) // no replacements
// one replacement
for each letter ltr of <strong>mainWord</strong>
  for each word w1 from <strong>optionalWords</strong>
    string newStr = replace ltr of <strong>mainWord</strong> with w1
    ret = max(ret, countSWords(newStr)
    
// two replacements
for each letter ltr1 of <strong>mainWord</strong>
  for each letter ltr2 of <strong>mainWord</strong> different from ltr1
    for each word w1 from <strong>optionalWords</strong>
      for each word w2 from <strong>optionalWords</strong> different from w1 // each word can be used at most once
          string newStr = replace ltr1 and ltr2 of <strong>mainWord</strong> with w1 and w2, respectively
        ret = max(ret, countSWords(newStr)
return ret
</code></pre>
        
        For fast and clean solution you can take a look at <tc-webtag:handle coderId="22675937" context="hs_algorithm"/>'s
        <a href="/tc?module=HSProblemSolution&amp;cr=22675937&amp;rd=13529&amp;pm=10042">solution</a>.
        You can also take a look at <tc-webtag:handle coderId="22737276" context="hs_algorithm"/>'s
        interesting <a href="/tc?module=HSProblemSolution&amp;cr=22737276&amp;rd=13529&amp;pm=10042">solution</a>.
        
        <br /><br />
        Note that for two fixed <code><strong>mainWord</strong></code> letters <code>ltr1</code> and <code>ltr2</code>, 
        if we consider (<code>ltr1</code>, <code>ltr2</code>) the same as (<code>ltr2</code>, <code>ltr1</code>) 
        (practically, to check only one combination of two letters) then we can't consider 
        (<code>word1</code>, <code>word2</code>) the same as (<code>word2</code>, <code>word1</code>), and vice versa.
        In case we did so, only one of these two replacements would be checked:
        <ul>
            <li><code>ltr1</code> is replaced with <code>word1</code> and <code>ltr2</code> is 
                replaced with <code>word2</code></li>
            <li><code>ltr1</code> is replaced with <code>word2</code> and <code>ltr2</code> is 
                replaced with <code>word1</code></li>
        </ul>
        But it's not correct, because we have to check both these replacements, we can't skip any of them.
        </p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9864&amp;rd=13529" name="9864">TurnOnTheLights</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9864)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524127" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      32 / 62 (51.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 32 (68.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 475.11 points (6 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      353.73 (for 22 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
            This problem was a bit easier then usual TCHS Medium. The reason behind that was a bit harder Hard problem.</p>
<p>
            Milena made a decision to do nothing complex, she chose very basic stepping. So after all, our task was
to go from given <code><strong>row</strong></code> and <code><strong>col</strong></code> in four possible directions - that gives
            four possible paths.</p>
<p>
            When we choose a path, we should make at most <code><strong>K</strong></code> steps along it. Note that this "at most" is placed
            only to tell that we don't need to worry if some <code>i</code>-th step (<code>i &le; <strong>K</strong></code>) is
            out of the floor. It is always better to make as much steps as possiblebecause each step can only turn on a 
            light, so making more steps can only increase the result. After we conclude these several facts, the only
            part that should be done is to turn on the light of each good cell at which Milena steps, to turn on the lights of its neighboring good cells and add each light bulb that just
            became turned on to the result.</p>
<p>
    For nice and clean solution you can take a look at <tc-webtag:handle coderId="22711754" context="hs_algorithm"/>'s
    <a href="/tc?module=HSProblemSolution&amp;cr=22711754&amp;rd=13529&amp;pm=9864">solution</a>.

            
            <h4>Homework</h4>
            Initially, a bit harder version was proposed. The version asked to return the number of turned on lights
            if light bulbs are turned on recursively - "If a light bulb below some cell becomes turned on, 
            lights below all neighboring cells also become turned on (and their neighbors will be turned on as well, and so on)".
            So making only one step in Example 5 is enough to turn on all the lights. You can try to solve this version
            of the problem if the maximal size of the floor is 1000x1000.
            

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9858&amp;rd=13529" name="9858">ColoringRectangles</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9858)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524127" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 62 (11.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 7 (71.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 900.78 points (14 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      716.26 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
I see several approaches for this problem. In each of them we should
calculate the visible area of each rectangle in order to choose rectangles that should be colored. After these areas are calculated, we should just color rectangles in descending order of their visible areas. If several rectangles have the same visible areas, the rectangle with the smallest index must be colored first (in order to achieve lexicographical minimality of result).
</p>
<p>
Probably, the most intuitive calculation of visible area for rectangle rect with index idx, is to start with polygon rect
and discard the part of polygon that overlaps with rectangle with index idx+1. Then new polygon should be checked againts rectangle with index idx+2, and so on. At some moment, after discarding overlapping part, from one polygon we can get two. This method can become very complex and that kind of solution is too hard for 1100.
</p>
<p>
Another way to solve it is to use some kind of "flood fill" algorithm - i.e. fix y-coordinate and make partition x_1, x_2, ..., x_m of the segment [-10000, 10000] in such way that x_(j+1)-x_j is maximal and each x, x_j &lt; x &lt; x_(j+1), belongs to only one rectangle. This kind of solution can be very interesting 
and we can discuss it at the forum. As you see, the idea is to break longer segment into 
chunks that can easily be used to calculate the visible area of a rectangle. Now, the question is how to assign a chunk to the corresponding rectangle. One way is to go by chunks and maintain for each chunk the highest index of rectangle that contains it. Another way is to pass over all rectangles, starting from one with the highest index, and assign to each rectangle all unassigned chunks that belong to it. Maybe at the moment the second way seems a bit unlogical, because it is slower than the first one and the first works very nice, but we will see that similar idea as in the second approach will be used in the final solution.
</p>
<p>
We can also find that there is an approach that is very easy for coding. We can try to represent the Cartesian plane
    as the matrix of 20000x20000 unit squares. If we have such matrix, then for each rectangle we can mark 
    its unit squares - if one unit square should be marked to belong to more than one rectangle, then we mark as
    belonging to the one with highest index. The problem with this approach is that we don't have enough memory for such matrix
    and it is too slow. However, it could be a very useful idea if the constraints were smaller.</p>

<p>
    Ok, let's summarize: the first approach is probably too complex; the third approach takes too much resources;
    the first way of the second approach is very good, but we should do that for each y, y_min &le; y &le; y_max, 
    and what if we raised constraints and set y_max - y_min = 10^9? Combining both ways gives us solution that doesn't
    not depend on how big x and y are, it depends only on the number of rectangles. It would be great if we
    can divide the plane into some chunks that are two-dimensional. In our case, the best and the most intuitive is if
    those chunks are rectangles. I will describe the solution and then explain it.</p>
Take x coordinates of all rectangles' vertical sides, let it be allx. In the same way, take y coordinates of all rectangles' horizontal sides, let it
    be ally. Sort allx, sort ally. After sorting, allx will contain coordinates x_1, x_2, ..., x_m, such that
    x_i &le; x_(i+1). The same holds for ally.
Then for each rectangle rectChunk with lower-left corner in
    (x_i, y_j) and upper-right corner in (x_(i+1), y_(j+1)), for all i, 1 &le; i &lt; m, and for all j, 1 &le; j &lt; m,
    check whether rectChunk belongs to some of the given rectangles and if it belongs, mark it as a part of rectangle
    with the highest index.</p>
<p>
Basically, the idea is to divide the plane into stripes by x coordinates and into stripes by y coordinates and then
    to combine these stripes in order to get rectangle chunks. To get it more clear, please take a look at the image below
    (it contains the rectangle chunks that are made from Example 0):
</p>
<p>
<center><img src="/i/education/tchs_srm60_img1.jpg" alt="tchs_srm60_img1.jpg" /></center></p>
    Note that two rectangle chunks do not overlap, except they can share a side. It is easy to prove because for two 
    rectangle chunks with coordinates (x_i, y_j)-(x_(i+1), y_(j+1) and (x_k, y_m)-(x_(k+1), y_(m+1)), either 
    x_(i+1)&le;x_k or x_(k+1)&le;x_i, so they can share only a segment.</p>
<p>Also, note that all rectangles are covered by these chunks. allx contains maximal and minimal x-coordinate
    of all rectangles. In the same way, ally contains maximal and minimal y-coordinate of all rectangles. 
    So, i-th y-stripe is divided by all x-stripes making chunks that cover area from x_min to x_max in the
    i-th y-stripe. Summing up all y-stripes, we get that all rectangles are covered.</p>
<p>And the last thing we should show is that some rectangle chunk rectChunk belongs to only one rectangle (except
    its area is 0, but that kind of chunk is not important in this case).
If we suppose it is not true, that means there is some 
    x-segment or y-segment that intersects rectChunk, but it is impossible because all x and y coordinates of
    all rectangles are included and chunks are made from those consecutive coordinates.</p>
<p>Having solution described and several short facts explained, it should be easy to code the solution and, the most
    important, to see why it is correct.</p>
<p>For nice and clean solution you can take a look at <tc-webtag:handle coderId="21347419" context="hs_algorithm"/>'s
    <a href="/tc?module=HSProblemSolution&amp;cr=21347419&amp;rd=13529&amp;pm=9858">solution</a>.</p>
<p>I have found <tc-webtag:handle coderId="22698470" context="hs_algorithm"/>'s 
    <a href="/tc?module=HSProblemSolution&amp;cr=22698470&amp;rd=13529&amp;pm=9858">solution</a> 
    as a very interesting one. Basically, he is using the same idea with chunks, but he is doing that
    recursivelly, sometimes checking less number of chunks that just described solution does.</p>
    
    <h4>Homework</h4>
    Can you find the maximal number of polygons that can be constructed using the very first approach?
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/boba5551_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20394568" context="algorithm" /><br />    <em>TopCoder Member</em>
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
