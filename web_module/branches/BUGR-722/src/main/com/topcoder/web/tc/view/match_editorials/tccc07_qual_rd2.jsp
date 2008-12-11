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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10881">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517155" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Qualification Round 2</span><br />Tuesday, August 21, 2007
<br /><br />



<h2>Match summary</h2> 

<p> 
Qualification Round 2 of TCCC07 attracted 729 competitors, so the struggle for the top 550 spots was a bit less intense than Qual Round 1
but it was still very exciting. The complexity of the problems and the amount of submissions were quite close to Qual 1, but the challenge phase proved to be
much more eventful, with 175 successful challenges.
</p>

<p>
The newcomer <tc-webtag:handle coderId="22692136" context="algorithm"/> from China took first place with an impressive 1653.14 points, thanks
to a fast solution on the hard and a bunch of challenges - five of them successful and four that weren't. Second place was also taken by a newcomer,
<tc-webtag:handle coderId="22682047" context="algorithm"/> from the Russian Federation. <tc-webtag:handle coderId="21075542" context="algorithm"/>
was only 12.79 points behind and took third place. The cutoff to advance was 201.75.
</p>

<p>
Congratulations to the 550 coders who qualified for Online Round 1, and good luck to those who are trying to do so in Qualification Round 3!
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=7557&amp;rd=10881" name="7557">AlmostPerfectNumber</a></strong> 
</font> 
<A href="Javascript:openProblemRating(7557)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517155" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      701 / 720 (97.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      598 / 701 (85.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>winy</strong> for 249.49 points (1 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      225.05 (for 598 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The solution of this problem consists of two parts. The first part is to implement the function, which returns the sum of all
proper divisors of given integer N:
</p>

<pre>
public int getSum(int N) {
    int sum = 0;
    for (int i=1; i < N; i++)
        if (N % i ==0)
            sum += i;
    return sum;
}
</pre>

<p>
The second part is to iterate through all integers from <strong>left</strong> to <strong>right</strong>, inclusive, and count the number of almost
perfect by <strong>k</strong> among them:
</p>

<pre>
public int count(int left, int right, int k) {
    int cnt = 0;
    for (int i=left; i <= right; i++)
        if (Math.abs(getSum(i) - i) <= k)
            cnt++;
    return cnt;
}
</pre>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=7552&amp;rd=10881" name="7552">EntertainingSegment</a></strong> 
</font> 
<A href="Javascript:openProblemRating(7552)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517155" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      451 / 720 (62.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      290 / 451 (64.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>hyyylr</strong> for 480.06 points (5 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      339.95 (for 290 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There are many correct solutions to this problem. I'll describe the one that is not the most efficient, but is the easiest to understand and implement.
Consider all start and finish points of radio stations ranges (let's call these points <em>critical</em>). Note that while
we travel between two neighbouring critical points, we can always hear the same set of radio stations. Therefore, if some entertaining
segment doesn't start in critical point, we can move its start to the nearest critical point from the left, and the segment will still
be entertainig. The same holds for the finish point - it can be moved to the nearest critical point from the right. This argument proves
that the optimal entertaining segment starts and finishes in some critical points, because otherwise we can always increase its length.
</p>

<p>
The established property of optimal entertaining segment allows us to solve the problem in the following three steps:
</p>

<ol>
<li>Construct the list of all critical points in increasing order: x[0] &lt; x[1] &lt; ... &lt; x[K-1].</li>
<li>For each two neighboring critical points x[i] and x[i+1] calculate the amount c[i] of radio stations, which
can be heard while travelling between these points. Note, that radio station j can be heard between
points x[i] and x[i+1], if <strong>left</strong>[j] &le; x[i] and x[i+1] &le; <strong>right</strong>[j].</li>
<li>Iterate through all possible pairs (x[i], x[j]) of critical points. For each pair, check whether the segment between
x[i] and x[j] is entertaining (it will be entertaining if each value c[i], c[i+1], ..., c[j-1] is greater or equal to
<strong>k</strong>). Select the longest among entertaining segments and return its length.</li>
</ol>

<p>Java implementation of this algorithm follows:</p>

<pre>
public int longestEntertainingSegment(int[] left, int[] right, int k) {
    // part 1
    Set<Integer> xSet = new HashSet<Integer>();
    for (int i=0; i < left.length; i++) {
        xSet.add(left[i]);
        xSet.add(right[i]);
    }
    int[] x = new int[xSet.size()];
    int K = 0;
    for (int xVal : xSet)
        x[K++] = xVal;
    Arrays.sort(x);
        
    // part 2
    int[] c = new int[K-1];
    for (int i=0; i < c.length; i++)
        for (int j=0; j < left.length; j++)
            if (left[j] <= x[i] && x[i+1] <= right[j])
                c[i]++;
                    
    // part 3
    int res = 0;
    for (int i=0; i < x.length; i++)
        for (int j=i+1; j < x.length; j++) {
            boolean ok = true;
            for (int t=i; t < j; t++)
                if (c[t] < k)
                    ok = false;
            if (ok)
                res = Math.max(res, x[j] - x[i]);
        }
            
    return res;
}
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=6381&amp;rd=10881" name="6381">BlockCounter</a></strong> 
</font> 
<A href="Javascript:openProblemRating(6381)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517155" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      181 / 720 (25.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      114 / 181 (62.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>GHY</strong> for 882.27 points (10 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      532.12 (for 114 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, we will write a recursive function that takes a compressed word as its input, and returns the triple (<em>first</em>,
<em>last</em>, <em>count</em>), where <em>first</em> is the first letter of the uncompressed form of the word, <em>last</em> is  its last
letter, and <em>count</em> is the amount of blocks in the uncompressed form of the word. The function will need to determine which
rule among three possible was applied last to compress the word and to perform some actions depending on the chosen rule.
</p>

<p>
<em>1st rule</em> is applied if the word consists of exactly one character. This case is the most trivial. If the word is "A", then
we return the triple ('A', 'A', 1), otherwise we return the triple ('B', 'B', 1).
</p>

<p>
<em>2st rule</em> is applied if the word can be represented as <em>ST</em>, where both words <em>S</em> and <em>T</em> are non-empty and contain equal
amount of opening and closing brackets (possibly, zero). In this case we need to call the function recursively for words <em>S</em> and <em>T</em>
to obtain triples (<em>first(S)</em>, <em>last(S)</em>, <em>count(S)</em>) and (<em>first(T)</em>, <em>last(T)</em>, <em>count(T)</em>). To calculate
the resulting triple (<em>first</em>, <em>last</em>, <em>count</em>), let's note that:
<ul>
<li>First letter of the uncompressed form of the word is equal to the first letter of the uncompressed form of <em>S</em>, i.e. <em>first</em> = <em>first(S)</em>.</li>
<li>Last letter of the uncompressed form of the word is equal to the last letter of the uncompressed form of <em>T</em>, i.e. <em>last</em> = <em>last(T)</em>.</li>
<li>If the <em>last(S)</em> &ne; <em>first(T)</em>, then all blocks in the uncompressed forms of <em>S</em> and <em>T</em> remain as blocks in
the uncompressed form of concatenation <em>ST</em>, i.e. <em>count</em> = <em>count(S)</em> + <em>count(T)</em>.</li>
<li>If the <em>last(S)</em> = <em>first(T)</em>, then the last block in the uncompressed form of <em>S</em> and the first block in the uncompressed
form of <em>T</em> will be merged together in one block in the uncompressed form of contatenation <em>ST</em>, i.e. <em>count</em> = <em>count(S)</em> + <em>count(T)</em> - 1.</li>
</ul>
</p>

<p><em>3rd rule</em> is applied if 1st and 2nd rules are not applicable. In this case the word has the form <em>(X,S)</em>. The resulting triple
is calculated as follows (the argumentation is similar to the argumentation for the 2nd rule):
<ul>
<li><em>first</em> = <em>first(S)</em>;</li>
<li><em>last</em> = <em>last(S)</em>;</li>
<li><em>count</em> = X * <em>count(S)</em>, if <em>first(S)</em> &ne; <em>last(S)</em>;</li>
<li><em>count</em> = X * <em>count(S)</em> - X + 1, if <em>first(S)</em> = <em>last(S)</em>.</li>
</ul>

<p>The Java implementation of this algorithm is provided below:</p>

<pre>
public class BlockCounter {
    class Triple {
        public char first, last;
        public long count;

        public Triple(char first, char last, long count) {
            this.first = first;
            this.last = last;
            this.count = count;
        }
    }

    public Triple rec(String word) {
        // case 1
        if (word.length() == 1)
            return new Triple(word.charAt(0), word.charAt(0), 1);

        // case 2
        int sum = 0;
        for (int i=0; i+1 < word.length(); i++) {
            if (word.charAt(i) == '(') sum++;
            if (word.charAt(i) == ')') sum--;
            if (sum == 0) {
                Triple a = rec(word.substring(0, i+1));
                Triple b = rec(word.substring(i+1));
                return new Triple(a.first, b.last, a.count + b.count
                                      - (a.last == b.first ? 1 : 0));
            }
        }

        // case 3
        long X = word.charAt(1) - '0';
        Triple a = rec(word.substring(3, word.length() - 1));
        return new Triple(a.first, a.last, X * a.count -
                         (a.first == a.last ? X - 1 : 0));
    }

    public long countBlocks(String word) {
        return rec(word).count;
    }
}
</pre>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
