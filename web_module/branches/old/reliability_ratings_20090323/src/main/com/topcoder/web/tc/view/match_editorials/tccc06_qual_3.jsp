<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<style type="text/css">
    .code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }

</style>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
<td width="180" id="onLeft">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="506103" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Qualification Round 3</span><br>September 12, 2006
<br><br>

<h2>Match summary</h2> 

 

<p>
Chinese coders dominated this round, getting four spots in the top 6. <tc-webtag:handle coderId="22645938" context="algorithm"/> got the top spot by more than
350 points. <tc-webtag:handle coderId="10241917" context="algorithm"/> was second, closely followed by <tc-webtag:handle coderId="7368306" context="algorithm"/> and <tc-webtag:handle coderId="10596762" context="algorithm"/>. <tc-webtag:handle coderId="10411856" context="algorithm"/> was fifth,  only 3 points ahead of <tc-webtag:handle coderId="21288270" context="algorithm"/> in sixth place.
</p>
<p>
The top 450 coders got their tickets to Online rounds, completing the list of 1500 qualifiers.
Good luck to all of them on the way to San Diego!
</p>

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6719&amp;rd=10095" name="6719">UsingStats</a></b> 

</font> 

<A href="Javascript:openProblemRating(6719)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      486 / 510 (95.29%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      445 / 486 (91.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>vishaliiita</b> for 249.24 points (1 mins 34 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      221.65 (for 445 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution can be split in two parts - computing the missing element and finding the median of the resulting set. 
The missing element can be found using the value of the mean. 
If the input array contains N elements, then the sum of all elements of the array with the missing element must be equal to (N + 1) * <b>mean</b> (since the mean is the sum of all elements divided by the number of elements).
</p>
<p>
When we found the missing element, we add it to the array, sort the resulting array and return the middle element (Java implementation of this algorithm follows):
<pre>
    public int getMedian(int[] vals, int mean) {
        int N = vals.length + 1;
        int[] v = new int[N];
        int sum = 0;
        for (int i = 0; i < N - 1; i++) 
    sum += (v[i] = vals[i]);
        v[N - 1] = N * mean - sum;
        Arrays.sort(v);
        return v[N / 2];
    }
</pre>

</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6682&amp;rd=10095" name="6682">CheckersBoard</a></b> 

</font> 

<A href="Javascript:openProblemRating(6682)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      368 / 510 (72.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      110 / 368 (29.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Barlennan</b> for 465.90 points (7 mins 48 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      334.42 (for 110 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem only required an implementation of the approach described in the statement, though the coding could be made much easier by several tricks.
To solve this problem, we count the number of black and white moves separately and return the sum of these values.
Since white and black pieces move in different directions, we reverse the board before computing the answer for white pieces:
<pre>
    public int numMoves(String[] board) {
        String[] s = new String[8];
        for (int i = 0; i < 8; i++) s[i] = board[7 - i];
        return count(board, 'B') + count(s, 'W'); // see the implementation of method <b>count</b> later
    }
</pre>
</p>
<p>
To compute the number of moves for any color, we just iterate through all cells of the board. 
For any cell, which is occupied by a piece of the proper color, we check if it can slide or jump. We check two diagonal directions, for each of them checking if the piece can jump or slide in this direction.
To simplify coding, we create an additional method isEqual, which checks whether the specified cell is occupied by the specifed piece (or empty).
Also, this method will check for the cell being inside the board's bounds, to free us from checking this at every line of the code.
Having this method, the implementation becomes easy:

<pre>
    boolean isEqual(String[] data, int r, int c, int ch) {
        return (r >= 0 && c >= 0 && r < 8 && c < 8 && data[r].charAt(c) == ch);
    }
    int count(String[] data, char our) {
        int slide = 0;
        int jump = 0;
        for (int i = 0; i < 8; i++)
            for (int j = 0; j < 8; j++)
                if (data[i].charAt(j) == our) {
                    if (isEqual(data, i + 1, j - 1, ' '))
                        slide++;
                    if (isEqual(data, i + 1, j + 1, ' '))
                        slide++;
                    if (isEqual(data, i + 1, j - 1, 'W' + 'B' - our) && isEqual(data, i + 2, j - 2, ' '))
                        jump++;
                    if (isEqual(data, i + 1, j + 1, 'W' + 'B' - our) && isEqual(data, i + 2, j + 2, ' '))
                        jump++;
                }
        return (jump == 0) ? slide : jump;
    }
</pre>
</p>


 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6163&amp;rd=10095" name="6163">MixedUpPrimes</a></b> 

</font> 

<A href="Javascript:openProblemRating(6163)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506103" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      70 / 510 (13.73%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      21 / 70 (30.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>kmd-10</b> for 829.68 points (13 mins 27 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      543.74 (for 21 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The very first thing to do when solving this problem is to implement the test for primality:
<pre>
    boolean isPrime(int p) {
        if (p == 2)
            return true;
        if (p % 2 == 0 || p < 3)
            return false;
        for (int i = 3; i * i <= p; i += 2)
            if (p % i == 0)
                return false;
        return true;
    }
</pre>
</p>
<p>
Since the input array contains only six elements, we can build all possible numbers which can be constructed using the input values. 
To do this, we implement a recursive method that returns the set of numbers which can be constructed using some subset of the input values.
This method will try to split the input into two subsets in all possible ways. 
For each such split, we recursively run our method on both subsets, combining the results we get (i.e., applying all possible arithmetic operations).
We aggregate all values for all splits into one big set, which will be returned from the method:
<pre>
    set<int> generate(int mask) {
        set<int> res;
        if ((mask & (mask - 1)) == 0) { // if the 
            for (int i = 0; i < N; i++)
                if (mask & (1 << i)) {
                    res.insert(data[i]);
                    return res;
                }
        }
        for (int t = 1; t < mask; t++)
            if ((t | mask) == mask && t <= mask - t) {
                set<int> r1 = generate(t);
                set<int> r2 = generate(mask - t);
                for (set<int>::iterator it1 = r1.begin(); r1.end() != it1; it1++)
        for (set<int>::iterator it2 = r2.begin(); r2.end() != it2; it2++)
            int a = *it1;
            int b = *it2;
                        res.insert(a + b);
                        res.insert(a - b);
                        res.insert(b - a);
                        res.insert(a * b);
                        if (b != 0) 
        res.insert(a / b);
                        if (a != 0) 
        res.insert(b / a);
                    }
            }
        return res;
    }
</pre>
</p>
<p>
First we run method generate on the whole input set to receive set S, then we check each number in S for primality, finding the smallest and the biggest of them.
See <a href="http://www.topcoder.com/stat?c=problem_solution&rm=249664&rd=10095&pm=6163&cr=7368306">Matei's solution</a>
for a complete implementation of this approach.
</p>


<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
