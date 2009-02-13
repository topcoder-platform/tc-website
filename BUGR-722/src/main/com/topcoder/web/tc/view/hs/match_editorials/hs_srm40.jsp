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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10784&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516566" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 40</span><br>Wednesday, September 26, 2007
<br><br>


<h2>Match summary</h2> 

<p>
The match started very quickly, with the experienced coders rattling off the straightforward easy problem in no time at all. A greedy medium problem was up next. This had a relatively intuitive solution, but one that required a bit of thought to show that it was correct. A deceptively tricky hard problem rounded out the set. At the end of coding, <tc-webtag:handle
coderId="22656813" context="hs_algorithm"/> was in the lead, with <tc-webtag:handle
coderId="22655725" context="hs_algorithm"/> second and <tc-webtag:handle
coderId="22212467" context="hs_algorithm"/> third. A last minute resubmission on the hard had left top seed <tc-webtag:handle
coderId="20812309" context="hs_algorithm"/> in seventh place, but he had clearly noticed that the hard problem was trickier than it first looked. The challenge phase proved relatively uneventful, with only eight successful challenges overall -- four of them going to <tc-webtag:handle
coderId="20812309" context="hs_algorithm"/> -- but the system tests were brutal on the remaining hard submissions, taking down all but a single one.
</p>
<p>
After the dust had settled, <tc-webtag:handle
coderId="22661554" context="hs_algorithm"/> was left at the top of the table with the only correct submission on the hard. His four successful challenges gave <tc-webtag:handle
coderId="20812309" context="hs_algorithm"/> second place and <tc-webtag:handle
coderId="22659963" context="hs_algorithm"/> took third place with an excellent performance in his TCHS debut.   

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8055&amp;rd=10784" name="8055">Secretary</a></b> 

</font> 

<A href="Javascript:openProblemRating(8055)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516566" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      67 / 70 (95.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      61 / 67 (91.04%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>_sunrise</b> for 248.81 points (1 mins 58 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      214.92 (for 61 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This question simply requires you to follow the instructions given and determine a way to sort the files based on the reverse of the supplied string. The easiest way to do this is probably to implement a custom comparator and use a library sort function. C++ code follows:
<pre>
class ReverseSorter{
public:
  bool operator() (string s1,string s2) const {
    reverse(s1.begin(),s1.end());
    reverse(s2.begin(),s2.end());
    return s1&lt;s2;
  }
};

class Secretary{
public:
  vector &lt;string&gt; wrongOrdering(vector &lt;string&gt; files){
    sort(files.begin(),files.end(),ReverseSorter());
    return files[0];
  }
};
</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8054&amp;rd=10784" name="8054">LibraryWorker</a></b> 

</font> 

<A href="Javascript:openProblemRating(8054)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516566" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      43 / 70 (61.43%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      33 / 43 (76.74%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 483.86 points (5 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      318.13 (for 33 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The first thing to notice about this problem is that it can be split into two halves, because you always have to pass the pile of books in order to get from the negative shelves to the positive shelves. Therefore, there is no point in carrying negative books when replacing books on the positive shelves and vice-versa, since you're going to walk past the pile on the way to replace them anyway, so you may as well pick them up at that point.
</p>
<p>
Once the problem is split into positive and negative books, we can analyze each subset separately. We need to make a sequence of trips, each time replacing some subset of the books with the size of the subset no larger than N. Assume for the moment that we have to return to the pile of books after we've finished, as this makes every trip the same. The distance required to replace a subset is twice the distance to the furthest shelf in the subset. This is because you pass all the other shelves on the way, so no extra walking is required. This leads to the following greedy solution: replace the N furthest books in a single trip, then the next N furthest, etc, until there are no books left to replace. Note that the order that you make these trips doesn't matter, just the subset of books that you take on the trips.
</p>
<p>
Proof that this greedy solution is correct is straightforward: Imagine a solution where this is not the case, and some book out of the furthest N is taken on some other trip. If we swap the books around to be as in our greedy solution, then the length of this second trip will decrease, while the length of the first trip will always just be the length of the furthest book, so the sum of the trips decreases.
</p><p>
The only thing left to consider is that on the last trip, the distance will only be half as far, since we don't have to return to position 0. Since the order of the trips doesn't matter, we can simply pick the longest one to be the last one.
</p>
<p>
C++ code follows:</p>
<pre>class LibraryWorker{
public:
  int replaceBooks(vector &lt;int&gt; books,int N){
    vector &lt;int&gt; pos,neg;
    int mx=0;
    for (int i=0;i&lt;books.size();i++)
      if (books[i]&gt;=0){
        mx = max(mx,books[i]);
        pos.push_back(books[i]);
      } else {
        mx = max(mx,-books[i]);
        neg.push_back(-books[i]);
      }
    int ret=0;
    for (int i=pos.size()-1;i&gt;=0;i-=N)
      ret+=2*pos[i];
    for (int i=neg.size()-1;i&gt;=0;i-=N)
      ret+=2*neg[i];
    return ret-mx;
  }
};
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7791&amp;rd=10784" name="7791">Shapes</a></b> 

</font> 

<A href="Javascript:openProblemRating(7791)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516566" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      9 / 70 (12.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 9 (11.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>szsz</b> for 420.90 points (51 mins 54 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      420.90 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The low constraints on this question allow it to be solved via backtracking, but arriving at a working solution requires a little ingenuity. The most naive solution (whereby each shape in turn is tried in every possible position in the square) times out, but with a few optimizations this very simple method could actually be made to pass quite comfortably. As with many backtracking methods, the trick to getting it fast enough is to make sure that invalid cases are detected early and the search tree is pruned as soon as this happens. The most obvious invalid case is where the total number of squares in the shape does not add up to <b>L</b><sup>2</sup> and we can detect this and return "CHEAT" straight away. A second required optimization is to place the shapes that are most likely to invalidate the solution (i.e., the larger shapes) first, as this will lead to early pruning. For example, sorting the shapes by the number of possible positions that they could be placed leads to a solution that passes even the hardest tests with plenty of time to spare.
</p>
<p>
However, this naive method is problematic since it is very difficult to estimate the worst-case time complexity. It might pass on the examples, but it's hard to feel confident that there isn't a really nasty case that breaks it. Another issue that caught many coders out is that the lexicographically first solution cannot be determined greedily, so all valid solutions would have to be generated to determine the correct one to be returned. Many coders returned the first answer they came to, which would give an incorrect answer on cases such as:
</p>
<pre>2233
2233
4455
4451</pre>
<p>
Fortunately, a much more efficient solution exists, which has guaranteed time complexity. The key to this method is noting that in a valid solution, all squares must be filled. We therefore step through the squares in order and try to use some unplaced shape to fill the current square. Using this method, for each unfilled square and each shape, there is only one position that the shape could possibly fit (we'll see this in a moment), so we only have to try that particular position and see if the shape fits. The number of different cases to try is therefore given by the number of ways we can order the shapes, and each case potentially requires every square of the solution to be tested. The time complexity of the method is therefore O(<b>N</b>! * <b>L</b><sup>2</sup>), where <b>N</b> is the number of shapes. For the parameters in the question, this evaluates to about 12,000 operations, so even with an inefficient implementation, this method will pass easily. This was the method used in the only correct submission by <tc-webtag:handle
coderId="22661554" context="hs_algorithm"/>.
</p><p>
Overall the solution is as follows: consider the grid squares in row-major order. If the current square has already been filled by a shape, then move on to the next one, otherwise try each unused shape in the current position. Since we know that any previous rows have been filled, and any previous columns in the current row have been filled, we must position our shape such that the current square is filled, but no square in the shape extends above the current row, and no square extends back along the current row (since all these squares are already full). There is only one position that gives the shape these properties and that is where the first square in the shape (considering it in row-major order) fills the current square. We can therefore try the shape in that position and check that it doesn't extend outside the boundary or intersect any other shapes. If it fits, then we generate the new board and recurse from there.
</p><p>
If we manage to fill the entire square with no shapes left over, then we have a valid solution. Because the shapes are considered from lowest index to highest index and the squares are filled in row-major order, the first valid solution will also be the lexicographically first, so we can return the first complete square we come to.
<p>
C++ code follows:</p>
<pre>class Shapes{
public:
  vector &lt;pair &lt;int,int &gt; &gt; shapes[5];

  vector &lt;string&gt; reconstructSquare(int L,vector &lt;string&gt; s1,vector &lt;string&gt; s2
                     ,vector &lt;string&gt; s3,vector &lt;string&gt; s4,vector &lt;string&gt; s5){
    
    // First we need to parse the shapes to a more useful format
    vector &lt;vector &lt;string&gt; &gt; allShapes;
    allShapes.push_back(s1);
    allShapes.push_back(s2);
    allShapes.push_back(s3);
    allShapes.push_back(s4);
    allShapes.push_back(s5);

    for (int shape=0;shape&lt;5;shape++)
        for (int i=0;i&lt;allShapes[shape].size();i++)
          for (int j=0;j&lt;allShapes[shape][i].size();j++)
            if (allShapes[shape][i][j]=='#')
              shapes[shape].push_back(make_pair(i,j));

    vector &lt;string&gt; board(L,string(L,' '));

    if (rec(0,0,0,board,L)) return board;

    return vector &lt;string&gt; (1,"CHEAT");
  }


  bool rec(int i, int j, int bm, vector &lt;string&gt; &amp; board, int L){

// If we're at the end of the board and have used all the shapes, we're done
    if (i==L) return bm==31;

// If therehere is already a shape in this square, keep recursing
    if (board[i][j]!=' ') 
      return rec(i+(j+1)/L, (j+1)%L, bm, board, L);

// Try adding each shape that we haven't yet used
    for (int shape=0;shape&lt;5;shape++)
      if ((bm & (1 &lt;&lt; shape)) == 0){
        int k;
        for (k=0;k&lt;shapes[shape].size();k++){
          int si = i + shapes[shape][k].first - shapes[shape][0].first;
          int sj = j + shapes[shape][k].second - shapes[shape][0].second;
          if (si&gt;=0 && sj&gt;=0 && si&lt;L && sj&lt;L && board[si][sj]==' ')
            board[si][sj] = shape+'1';
          else
            break;
        }
// If we managed to add the whole shape, then recurse with the new board
        if (k==shapes[shape].size()
            && rec(i+(j+1)/L, (j+1)%L, bm | (1 &lt;&lt; shape), board, L))
          return true;

// Restore the board to its previous state
        for (k--;k&gt;=0;k--) {
          int si = i + shapes[shape][k].first - shapes[shape][0].first;
          int sj = j + shapes[shape][k].second - shapes[shape][0].second;
          board[si][sj]=' ';
        }
      }
    return false;
  }
};</pre>
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/StevieT_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21911760" context="algorithm"/><br />    <em>TopCoder Member</em>
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
