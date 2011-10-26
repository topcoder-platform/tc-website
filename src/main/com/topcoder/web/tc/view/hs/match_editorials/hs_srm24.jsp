<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10076&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506046" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 24</span><br>Monday, December 18, 2006
<br><br>

<h2>Match summary</h2> 
<p> 
With 150 great high-school coders competing, this HS SRM was an exciting event. The competition started with a high number of fast submissions on the easy problem and, by the end of the coding phase, a reasonable number of medium and hard submissions were in. The challenge phase proved to be quite eventful, with many easy submissions coming down. As the dust settled, <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> finished on top by a wide margin, with the highest scores on the medium and hard and a great challenge phase. <tc-webtag:handle coderId="22285847" context="hs_algorithm"/> finished second and turned red in the process. In third came <tc-webtag:handle coderId="22263204" context="hs_algorithm"/>, who delivered an impressive performance in the challenge phase that made up for his resubmission of the hard. <tc-webtag:handle coderId="20812309" context="hs_algorithm"/> and <tc-webtag:handle coderId="22647753" context="hs_algorithm"/> rounded out the top five. Congratulations to all the participants!
</p> 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7272&amp;rd=10076" name="7272">AnswerEvaluation</a></b> 
</font> 
<A href="Javascript:openProblemRating(7272)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506046" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      141 / 150 (94.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      84 / 141 (59.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>MB__</b> for 248.22 points (2 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      209.01 (for 84 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Most of the coders who failed this problem misinterpreted the statement and incorrectly counted occurrences of a keyword as substrings of words from the answer. Unfortunately, none of the examples helped to clarify this matter. In situations like this, if you are not sure about an aspect of the problem statement you shouldn't hesitate to ask the admins for clarifications.
<br />
<br />
A solution to this problem could start by splitting the answer into a list of words. This step is not really necessary but can greatly simplify the rest of the solution. In C++, this could be done with <i>istringstreams</i>. In Java and C# one could use the method <i>split</i>. 
<br /><br />
Next we have two approaches to choose from. The first one, which is more elegant and less error-prone, is to loop over all keywords and search for them in the list of words built from the answer. When we find a keyword present in the list, we add its score to the result. See <tc-webtag:handle coderId="20093875" context="hs_algorithm"/>’s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=20093875&rd=10076&pm=7272">solution</a> for a clean C++ implementation, <tc-webtag:handle coderId="22652504" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22652504&rd=10076&pm=7272">solution</a> for a Java one.
<br /><br />
The second approach was to iterate over the words in the answer and look for them in the keyword list. In this solution one has to make sure that a keyword's score is not added with each of its occurrences in the word list. For a C# example of this approach see <tc-webtag:handle coderId="22630493" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22630493&rd=10076&pm=7272">solution</a>.
<br />
<br />

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7271&amp;rd=10076" name="7271">AnagramCompletion</a></b> 
</font> 
<A href="Javascript:openProblemRating(7271)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506046" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      96 / 150 (64.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      76 / 96 (79.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 522.17 points (6 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      361.41 (for 76 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

There are two parts to this problem. First we need to find the letters to place in each word’s empty spots. Then we have to find the order in which these letters must be placed and handle the tie-breaking rules.

<br />
<br />
For the first part, notice that if two words are anagrams, the number of occurrences of one letter in the first word is equal to the number of occurrences of this letter in the second word. For example, in the anagrams "BACACA" and "CAABAC" the letter 'A' appears three times in both words while the letter 'B' appears once in each. So, if we find that the letter 'L' appears three times in <b>word1</b> and only once in <b>word2</b>, we have to place two more 'L's in the second word. In this way we can find the number of appearances of each letter in the desired anagrams. However, empty spots may still remain in both words. Since we are asked to break ties alphabetically, we will fill these empty spots with the letter 'A'. As an example, consider the words ".AC.A.B.BC" and "B..D.BB.A.":
<ul>
<li>'A' appears two times in the first word and one time in the second word, so it must appear one more time in <b>word2</b>
<li>'B' must appear one more time in <b>word1</b>
<li>'C' must appear two times in <b>word2</b>
<li>'D' must appear once in <b>word1</b>
</ul>
So, in two of the four empty spots in <b>word1</b> we must place the letters 'B' and 'D'. Similarly, we know three of the letters that must be placed in the empty spots in <b>word2</b>. We are left with two empty spots in both words that we will fill with the letter 'A'. To conclude, the four empty spots in the first word will be filled with the letters 'A', 'A', 'B' and 'D', while the second word will be filled with 'A', 'A', 'A', 'C', 'C'.
<br /><br />
Now that we know the letters we must place in the empty spots we must determine how to handle the tie-breaking rules. This step is easy: we scan each word from left to right and fill each spot with the alphabetically smallest letter available. In the example above, we will complete the first anagram by filling the first two empty spots with the letter 'A' and the last two with the letters 'B' and 'D' (in this order). We do the same for the second word, and we return the strings "AACAABBDBC" and "BAADABBCAC".
<br />
<br />
For a clean implementation of this approach see <tc-webtag:handle coderId="22375930" context="hs_algorithm"/>'s <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22375930&rd=10076&pm=7271">solution</a>.
<br /><br />
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7270&amp;rd=10076" name="7270">SwampyLands</a></b> 
</font> 
<A href="Javascript:openProblemRating(7270)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506046" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      21 / 150 (14.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 21 (61.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 873.81 points (11 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      546.59 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

With its geometric nature, this problem at first seems really tough. However, observing that the sides of the rectangles representing swampy lands are parallel to the axes simplifies the problem significantly.
<br />
<br />
A first approach would be to treat the farm as a large grid, with a grid cell corresponding to a square region with the side equal to one unit. The cell at column x from row y would correspond to the square with the lower right corner at (x, y) and the upper left corner at (x+1, y+1). Then we mark each grid cell corresponding to a unit square contained in some rectangle piece of a swampy land, obtaining a binary matrix (with entries 0 or 1). Since we are not given any bounds for the farm, this looks like a matrix with an infinite number of rows and columns. However, we are only interested in the submatrix containing the given swampy lands, since all other entries will be unmarked (or 0). We will also keep two exterior rows and columns with unmarked entries for delimiting an exterior region. Having this matrix we can use a <a href="<tc-webtag:linkTracking link="http://en.wikipedia.org/wiki/Flood_fill"/>" refer="hs_srm24"/>flood-fill</a>  algorithm to find the surrounded regions. There are two approaches. The more elegant one starts from the exterior region and finds all cells connected to it. The remaining unmarked cells are part of surrounded regions, so we add their area to the final result. A second approach would be to iterate over all unmarked cells and see if they are connected to the exterior. If not, we add their area to our result. Reference implementations for both versions are given in the last paragraph.

<br /><br />
This looks easy, doesn’t it? However, we have not finished yet. A look at the constraints suggests that our grid may be too large to fit in the memory limit and the algorithm will take too much time to execute. To handle this we will resort to a trick that may prove useful in other problems, and compress grid cells of the same type to a single grid cell. What does this mean? Take a look at the picture below:
<br />
<br />
<img src="/i/srm/tchs_srm_24.png" alt="SwampyLands3" border="0" />
<br /><br />
All cells contained in the colored regions can be considered of the same type. Since no rectangle from the input intersects those regions, if one cell from a region is surrounded, all cells from the same region are surrounded. All cells contained in a region are either swampy, surrounded or exterior. After compressing the regions in the picture above into grid cells, we have a new, much smaller grid.
<br />
<br />
If we let N denote the number of rectangular pieces of swampy land, this grid will have at most 2N+1 rows and at most 2N+1 columns. This easily fits in the memory limit, and the flood fill algorithm is fast enough.
<br /><br />
In his <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22661405&rd=10076&pm=7270">solution</a>, <tc-webtag:handle coderId="22661405" context="hs_algorithm" /> implemented the flood fill algorithm recursively. Other coders used breadth first search, as <tc-webtag:handle coderId="22285847" context="hs_algorithm"/> did in his <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=22285847&rd=10076&pm=7270">solution</a>. <tc-webtag:handle coderId="15600321" context="hs_algorithm"/> used the second approach mentioned above (code <a href="http://www.topcoder.com/tc?module=HSProblemSolution&cr=15600321&rd=10076&pm=7270">here</a>).
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/_efer__big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8593420" context="algorithm"/><br />    <em>TopCoder Member</em>
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
