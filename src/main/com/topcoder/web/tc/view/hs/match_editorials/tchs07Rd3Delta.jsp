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
    <A href="/tc?module=HSRoundOverview&rd=10721&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514495" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 3 Delta</span><br>Monday, March 26, 2007
<br><br>

<h2>Match summary</h2> 

As the TCHS 2007 online rounds were close to the end, students from the Delta region were
given a chance to prove that they deserved a trip to Purdue in May. Each of the 15 participating students
only needed to get a positive score to qualify, and 14 of them were successful. They
were led by <tc-webtag:handle coderId="22285847" context="hs_algorithm"/> from
The First Middle School of Wuhu. With the help of six successful challenges,
<tc-webtag:handle coderId="22285847" context="hs_algorithm"/> was able to overcome
<tc-webtag:handle coderId="20812309" context="hs_algorithm"/>,
from Affiliated Middle School to Anhui Normal University,
who came in second, and <tc-webtag:handle coderId="22630769" context="hs_algorithm"/>,
from Zhongshan No. 1 Middle School, came in third.
<br /><br /> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7558&amp;rd=10721" name="7558">AdvertisingAgency</a></b> 

</font> 

<A href="Javascript:openProblemRating(7558)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      14 / 15 (93.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      14 / 14 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tranquilliser</b> for 249.25 points (1 mins 33 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      246.00 (for 14 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem was straightforward -- for each request we can find out whether it will be accepted or
rejected, and count the number of rejected requests. The request is rejected if some request
before it has the same billboard number. The code follows:

<pre>
    public int numberOfRejections(int[] requests) {
        int r = 0;
        for (int i = 0; i < requests.length; i++) {
            boolean ok = true;
            for (int j = 0; j < i; j++) {
                if (requests[i] == requests[j]) {
                    ok = false;
                    break;
                }
            }
            if (!ok) {
                r++;
            }
        }
        return r;
    }
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7553&amp;rd=10721" name="7553">DigramAnalysis</a></b> 

</font> 

<A href="Javascript:openProblemRating(7553)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      14 / 15 (93.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      5 / 14 (35.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Loner</b> for 476.43 points (6 mins 22 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      454.98 (for 5 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


The solution to this problem is quite technical.
For each word let us find all the digrams that occur in it. After that for each digram let us count the
number of words it occurs in. Finally we select the digram that occurs in most words.
<br /><br />

One interesting moment was not stated in the statement directly, but should have been derived
from it. Let all the words in the input text have length equal to 1. In this case no digram appears in
any word &mdash; it appears in zero words, that is. In this case digram "aa" is the earliest lexicographically
digram among equally frequent (or, more exactly, infrequent) digrams, so it must be returned.
<br /><br />

The code follows:

<pre>
    public String mostFrequent(String[] chunks) {
        String text = "";
        for (String ch : chunks) {
            text += ch;
        }

        Map<String, Integer> freq = new TreeMap<String, Integer>();

        String[] words = text.split("[ ]+", -1);
        for (String w : words) {
            Set&lt;String> ss = new HashSet&lt;String>();
            for (int i = 0; i &lt; w.length() - 1; i++) {
                String dig = "" + w.charAt(i) + w.charAt(i + 1);
                ss.add(dig);
            }
            for (String dig : ss) {
                if (!freq.containsKey(dig)) {
                    freq.put(dig, 0);
                }
                freq.put(dig, freq.get(dig) + 1);
            }
        }

        String ans = "aa";
        int best = 0;
        for (String dig : freq.keySet()) {
            if (freq.get(dig) > best) {
                ans = dig;
                best = freq.get(dig);
            }
        }

        return ans;
    }
</pre>

Note that extensive use of library data structures could make this problem a bit easier.
Coders who do not feel comfortable with using library data structures are encouraged
to review the  
<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm Tutorials</a>
section to power up their skills, as well as their programming language library tutorials.
<br /><br />
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7308&amp;rd=10721" name="7308">MoreBlack</a></b> 

</font> 

<A href="Javascript:openProblemRating(7308)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      11 / 15 (73.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      9 / 11 (81.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 955.31 points (6 mins 12 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      652.45 (for 9 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


Before reading this writeup the reader is recommended to make himself familiar
with the basic terminology on graphs. 
The <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1">Graph & Data Structures</a> tutorial is a good place to start with, and
you should also review the <a href="http://en.wikipedia.org/wiki/Graph_%28mathematics%29">Graph</a> Wikipedia article.
<br /><br />

Let us consider the given board as a graph, with the existing squares as vertices. Connect two vertices by an edge
if the corresponding squares have a common border. The constructed graph is clearly bipartite. The requirement
that no two existing squares with a common side should have the same color means that we must color
one part of the graph white and another part black. Since the number of black squares must
be maximized, the larger part must be colored black, and the smaller one must be colored white.
<br /><br />

Note that we can color each connected component separately. Let us find
connected components, each of which is a bipartite graph by itself. For each component we determine 
which part is greater, and color it black.
<br /><br />

There is one more optimization criteria &mdash; the answer must be lexicographically minimal.
The only case when we have a choice as to which part to color black is when parts in a component have the same
number of squares. To get the lexicographically smallest solution let us scan the board line after line,
identifying connected components. If we find the new component with parts of the same size, 
we color black the square that was scanned first in the component.
<br /><br />
 




<div class="authorPhoto">
    <img src="/i/m/andrewzta_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11829284" context="algorithm"/><br />    <em>TopCoder Member</em>
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
