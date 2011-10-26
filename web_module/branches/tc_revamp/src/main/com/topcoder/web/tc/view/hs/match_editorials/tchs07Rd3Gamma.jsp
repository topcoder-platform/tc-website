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
    <A href="/tc?module=HSRoundOverview&rd=10720&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514495" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 3 Gamma</span><br>Monday, March 19, 2007
<br><br>



<h2>Match summary</h2> 

Students from the Gamma region were the first to get into TCHS 2007 tournament, and they were first to qualify for the
onsite event. Round 3 was the first round in Gamma that could actually leave somebody with a positive
score behind, as 35 students competed for 25 onsite spots.
<br /><br />

This time the problems were a bit harder than in previous rounds, although the easy problem proved to
be really easy with everyone submitting it and only one solution failing. However, the medium and
hard problems gave students the opportunity to show their skills and prove that they deserved an
onsite spot at Purdue later this spring.
<br /><br />

The leading position on the scoreboard was occupied by <tc-webtag:handle coderId="19931322" context="hs_algorithm"/>
from UPML. He was followed by 
<tc-webtag:handle coderId="21468741" context="hs_algorithm"/> and
<tc-webtag:handle coderId="21111148" context="hs_algorithm"/> (in this order)
from Saint-Petersburg Phys-Math Lyceum #30. Another interesting fact
is that nobody managed to get a positive score during the challenge phase.
Although several coders actually had successful challenges, all of them managed to 
get at least twice as many unsuccessful ones.
<br /><br />

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7555&amp;rd=10720" name="7555">BrokenKeyboardRepair</a></b> 

</font> 

<A href="Javascript:openProblemRating(7555)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
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

      34 / 34 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      33 / 34 (97.06%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Curiouser</b> for 249.72 points (0 mins 57 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      246.37 (for 33 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

The problem could be actually restated as follows: find the number of different letters in a word.
A straightforward approach here is successful.
For each letter in a word check whether it occurred before, and if it did not, increase the answer by one.
The code follows.

<pre>
    public int minimalNumberOfKeys(String word) {
        int r = 0;
        for (int i = 0; i < word.length(); i++) {
            boolean first = true;
            for (int j = 0; j < i; j++) {
                if (word.charAt(i) == word.charAt(j)) {
                    first = false;
                }
            }
            if (first) {
                r++;
            }
        }
        return r;
    }
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7556&amp;rd=10720" name="7556">ColorfulDisks</a></b> 

</font> 

<A href="Javascript:openProblemRating(7556)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
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

      29 / 34 (85.29%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      25 / 29 (86.21%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Burunduk2</b> for 477.06 points (6 mins 17 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      333.09 (for 25 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


For each radius let us create a set of all colors such that a disk with this radius exists. 
After we build a pyramid, exactly one disk of each size will be visible from above, so we 
need to find all colors that appear in each of the sets. The code follows.

<pre>
    public String[] singleColor(String[] disks) {
        int n = disks.length;
        Set&lt;String> colors = new TreeSet&lt;String>();
        Map&lt;Integer, Set&lt;String>> cbyr = new HashMap&lt;Integer, Set&lt;String>>();
        for (int i = 0; i &lt; n; i++) {
            Scanner s = new Scanner(disks[i]);
            String color = s.next();
            int r = s.nextInt();
            colors.add(color);
            if (!cbyr.containsKey(r)) {
                cbyr.put(r, new HashSet&lt;String>());
            }
            cbyr.get(r).add(color);
        }

        ArrayList&lt;String> a = new ArrayList&lt;String>();
        for (String s : colors) {
            boolean ok = true;
            for (int r : cbyr.keySet()) {
                if (!cbyr.get(r).contains(s)) {
                    ok = false;
                }
            }
            if (ok) {
                a.add(s);
            }
        }
        return a.toArray(new String[a.size()]);
    }
</pre>

Note that extensive use of library data structures could make this problem a bit easier.
Coders who do not feel comfortable with using library data structures should check out TopCoder's 
<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm Tutorials</a>
section to power up their skills, as well as their programming language library tutorials.
<br /><br />

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7496&amp;rd=10720" name="7496">Provinces</a></b> 

</font> 

<A href="Javascript:openProblemRating(7496)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
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

      10 / 34 (29.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      8 / 10 (80.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>reiten</b> for 688.39 points (21 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      520.60 (for 8 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


First, note that if a province contains cities with numbers x and y, it contains all cities
with numbers between x and y as well. Indeed, if it's not the case, and the city z such
that x &lt; z &lt; y belongs to another province, one can get from x to z and from z to y
by main roads. This contradicts the constraint in the problem statement which says
that there must be no provinces A and B such that we can get both from A to B and from B to A.
<br /><br />

Therefore each province must contain a continuous range of cities. Since all provinces
must have the same number of cities, the number of provinces must be a divisor of n.
Therefore the division to provinces is uniquely identified by a single number
k of provinces, and k must divide n.
<br /><br />

Let us see what can prevent us from constructing k provinces.
Clearly the roads that go from a city x with a smaller number to a city y with a greater number
do not play any role, since we can get from x to y by main roads.
Therefore we must only consider roads from x to y such that x &gt; y.
For each city y let us find the number m[y] &mdash; the greatest number of the city such
that there is the road from it to y. 
<br /><br />

Let us consider the division of cities to k provinces, and number provinces
from 1 to k in such a way that provinces with smaller numbers contain cities
with smaller numbers. So the first province would contain cities 1, 2, ..., n/k, the
second one would contain n/k+1, n/k+2, ..., 2n/k, etc.
<br /><br />

If the division is invalid,
there must be two provinces A and B such that both paths from A to B
and from B to A exist. Let A &lt; B,
consider the path from B to A, and take the first road on it that goes
from a province with greater number to a province with smaller number.
Let this road go from city x to city y. From definition of m[y] we
deduce that x &le; m[y]. Therefore if the division to provinces
is invalid, there exists a city y such that m[y] belongs to a province
other than that of y.
Conversely, if there exists such a city, the division to provinces is
invalid since these two provinces would contradict the problem statement. 
<br />
<br />

Therefore it is necessary and satisfactory for
the division to be valid that for all cities m[x] belongs to the same
province as x.
The code follows.

<pre>
    public int maximalNumber(int n, String[] roads) {
        String r = "";
        for (String s : roads) {
            r += s;
        }
        Scanner s = new Scanner(r);
        s.useDelimiter("[ ,]+");

        int[] m = new int[n];
        for (int i = 0; i < n; i++) {
            m[i] = i;
        }
        while (s.hasNextInt()) {
            int a = s.nextInt() - 1;
            int b = s.nextInt() - 1;
            if (a > b) {
                m[b] = Math.max(m[b], a);
            }
        }

        int best = 1;
        for (int d = 1; d <= n; d++) {
            if (n % d != 0) {
                continue;
            }
            boolean ok = true;
            for (int i = 0; i < n; i++) {
                int j = (i + d) / d * d;
                if (m[i] >= j) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                best = n / d;
                break;
            }
        }
        return best;
    }
</pre> 





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
