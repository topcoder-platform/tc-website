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
    <A href="/stat?c=round_overview&er=5&rd=10777">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516060" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 363</span><br />Saturday, August 11, 2007
<br /><br />



<h2>Match summary</h2> 

 
<p> 

As the last chance to practice before the TCCC 2007 qualification rounds, SRM 363 attracted 1312 coders. The match
in Division 1 started very fast as the easy problem was quite standard. The tricky medium forced many high ranked
competitors to resubmit their solutions, which caused unexpected results in the division summary. Unfortunately, the 1000 pointer
was too hard (maybe even NP hard) to be solved by anyone (including me). On the other hand, in Division 2, the difficulty level of the problems
was almost perfect, though the easy was a bit unusual.<br />
<br />

Only 5 coders solved correctly the hard in Division 2 and they took the top five spots with <tc-webtag:handle coderId="22663612" context="algorithm"/> on top (with a quite comfortable lead) and
<tc-webtag:handle coderId="22630337" context="algorithm"/> and <tc-webtag:handle coderId="20916346" context="algorithm"/> rounding up the top three.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8058&amp;rd=10777" name="8058">MirroredClock</a></b> 

</font> 

<A href="Javascript:openProblemRating(8058)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516060" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

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

      699 / 747 (93.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      476 / 699 (68.10%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>cdart.</b> for 249.56 points (1 mins 11 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      189.72 (for 476 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

It is obvious that if a minute hand points <i>m</i> minutes past some hour, it will
point 60 – <i>m</i> past some (possibly other) hour in the mirror. But what happens with the hour hand after mirroring the clock? Let’s assume that
we have the time ”<i>h</i> : <i>m</i>”. The hour hand points exactly to an <i>h</i> hour
(when <i>m</i> is equal to 0) or a bit past an <i>h</i> hour (when <i>m</i> is positive).
What can we see in the mirror? When <i>m</i> is equal to 0, mirrored hour hand points exactly
12 – <i>h</i> hour, and it points a bit before it, otherwise. So, getting all the things
together, mirroring the time ”<i>h</i> : <i>m</i>”, we get ”12 – <i>h</i> : <i>m</i>” if m is equal to 0, and
”11 – <i>h</i> : 60 – <i>m</i>”, otherwise (note, that if an hour hand points some time before
the <i>x</i> hour, it also points some time after the <i>x</i> – 1 hour). Of course, we should
be aware not to return 12 instead of 00 and also not to return a negative hour.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7868&amp;rd=10777" name="7868">HandsShaking</a></b> 

</font> 

<A href="Javascript:openProblemRating(7868)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516060" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

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

      383 / 747 (51.27%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      200 / 383 (52.22%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>kilvdn</b> for 492.80 points (3 mins 26 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      323.00 (for 200 correct submissions) 

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

      531 / 565 (93.98%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      486 / 531 (91.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 249.24 points (1 mins 34 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      207.13 (for 486 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

With a little imagination, we will quickly see that there exists a bijection
between the set of perferct shakes for <i>n</i> businessmen and the set of valid bracket
structures of length <i>n</i>. It seems quite intuitive when we treat each businessman
as ‘(‘ or ‘)’. The problem of counting those structures can be easily solved with
dynamic programming as <i>f</i>(<i>n</i>) = (sum for all 0 < <i>i</i> <= <i>n</i>) <i>f</i>(<i>i</i> – 1) * <i>f</i>(<i>n</i> – <i>i</i> – 1).
We can also look at this in such a way (and this is probably more intuitive) that
each handshake divides the table in two, because the handshakes cannot cross. So,
we can take businessman 0, iterate over all other businessmen and each time count
recursively how many shakes are there for the rest. It leads to the same formula as above.<br />
<br />
Also, it is worth mentioning
that the number of valid bracket structures of length 2<i>n</i> is equal to the <i>n</i>-th Catalan
number (you can see the Wikipedia <a href="http://en.wikipedia.org/wiki/Catalan_number">article</a> on Catalan numbers), so using an explicit
formula for it, we can solve the problem in O(<i>n</i>) time instead of O(<i>n</i><sup>2</sup>) dynamic
programming. It’s interesting, though it’s only a theory.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7884&amp;rd=10777" name="7884">CrazyComponents</a></b> 

</font> 

<A href="Javascript:openProblemRating(7884)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516060" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

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

      16 / 747 (2.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      5 / 16 (31.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ellenjuice</b> for 798.91 points (15 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      606.65 (for 5 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Imagine that at some point of the process described in the problem, we have some component types
already installed and <i>k</i> turns to complete. Such a state is uniquely defined by the values <i>k</i>
and a boolean type for each component representing whether or not we have already installed it (they can be all represented as a bitmask).
It shouldn't be a surprise, that we can now solve the problem with dynamic programming. In each state, all the components have
an equal probability of being chosen, so we can check each possibility and compute the expected profit.
Of course, we must keep in mind that we are building our application optimally – we won’t install
a new component if we would earn more without it – and that we can’t install a component without
its requirements satisfied. So, if A[<i>k</i>][<i>mask</i>] denotes the expected profit with <i>k</i> turns left to go
and components represented by <i>mask</i> already installed, our recurrence equation would look like this:

<pre>
  A[<i>k</i>][<i>mask</i>] = (sum for all 0 <= <i>i</i> < <i>n</i>)
          1/<i>n</i> * ( max( A[<i>k</i> – 1][<i>mask OR</i> 2<sup><i>i</i></sup>], A[<i>k</i> – 1][<i>mask</i>] ) if <i>mask</i> satisfies
                     all the requirements of component <i>i</i>, and
                  A[<i>k</i> – 1][<i>mask</i>], otherwise )  ,
</pre>

where <i>n</i> is the number of available components. See the fastest <a href="/stat?c=problem_solution&rm=265894&rd=10777&pm=7884&cr=22663612">solution</a>
by <tc-webtag:handle coderId="22663612" context="algorithm"/> for a
perfect implementation of the above idea.


</p>

 
<p>
<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7869&amp;rd=10777" name="7869">MirrorNumber</a></b> 

</font> 

<A href="Javascript:openProblemRating(7869)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516060" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

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

      262 / 565 (46.37%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      121 / 262 (46.18%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 445.87 points (10 mins 9 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      272.54 (for 121 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The most obvious solution to this problem is a combinatorial one. If we had a function <i>f</i>(<i>x</i>)
that returns how many numbers between 0 and <i>x</i> are the mirror ones, then we would simply
compute an answer to the problem as <i>f</i>(<b>B</b>) – <i>f</i>(<b>A</b> – 1). Although this approach seems quite
straightforward at first, it turns out to be  very complicated to make it work correctly (you can check
<tc-webtag:handle coderId="7452866" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265859&rd=10777&pm=7869&cr=7452866">solution</a>
or <tc-webtag:handle coderId="11829284" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265859&rd=10777&pm=7869&cr=11829284">one</a> just to see how much).
The reason for this is that while it is easy to compute the number of mirror numbers of a given length, there arise
many special cases when computing how many mirror numbers there are that are not greater
than some given <i>x</i>. So, when all these special cases begin to appear, we should think how
we can solve the problem in an easier way. The main observation is that there aren’t many
mirror numbers smaller than 10<sup>18</sup> – there are exactly 3124999 of them.
We can generate them all and count how many are in a given interval. It's tricky, but simple. Sample Java implementation follows:

<pre>
  public class MirrorNumber {
    int dig[] = { 0, 1, 8, 2, 5 }, rev[] = { 0, 1, 8, 5, 2 };
    int num[] = new int[20];
    long A, B;
    int res, len;

    public void recur (int a, int b) {
        if (a < b) for (int i = (a > 0) ? 0 : 1; i < 5; i++) {
            num[a] = dig[i];
            num[b] = rev[i];
            recur(a + 1, b - 1);
        }else if (a == b) for (int i = 0; i < 3; i++) {
            num[a] = dig[i];
            recur(a + 1, b - 1);
        }else {
            long tmp = 0, mul = 1;
            for (int i = len; i >= 0; i--) {
                tmp += num[i] * mul;
                mul *= 10;
            }
            if (tmp >= A && tmp <= B) res++;
        }
    }

    public int count (String A, String B) {
        this.A = Long.parseLong(A); this.B = Long.parseLong(B);
        res = 0;
        for (len = 0; len < 18; len++) recur(0, len);
        return res;
    }
  }
</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7927&amp;rd=10777" name="7927">PackageDelivery</a></b> 

</font> 

<A href="Javascript:openProblemRating(7927)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516060" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

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

      24 / 565 (4.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      11 / 24 (45.83%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>almelv</b> for 592.02 points (28 mins 2 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      466.68 (for 11 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

When I came up with the idea for this problem (which all in all is not bad itself, I think),
I was wondering what I could do to make the problem harder. I was making it harder and harder
and finally I made it probably unsolvable. As people discovered, the detail that caused a flaw
was <b>truckCapacity</b>. Let’s assume that the truck has unlimited capacity (i.e. we can
always take all the packages at once). First, let's see that we can park the truck only in packages' destinations (and the warehouse)
and we will still be able to stay optimal (if in the optimal solution we park between some two destinations
and walk to them from the truck, we can also park in one of them and walk to the other and the solution won't change).
So, instead of a million of possible parking locations, we have just 50 - quite good.
The next observation is that in the optimal solution we can deliver packages in increasing order of destination's distance from the warehouse.
As we can pack all the packages to the truck, we will never need to come back. The only thing we need to find out
is where to park the truck (and whether we should use it at all). We can define a state as the position of the truck
and the number of packages from the beginning that we have already delivered. Now, we can easily solve the problem with dynamic
programming - at each state we can move the truck or deliver some packages on foot. Well, that was not so hard...<br /><br />
...and then I came up with the idea of limited capacity of the truck. With the same assumptions as above I defined the state
as the position of the truck, the number of packages from the beginning that we have already delivered, and the number of packages
on the truck. As it turned out, with limited capacity of the truck, the assumption of delivering packages in order is wrong. And so,
nobody knows if a correct (and fast enough) solution even exists.

</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/mateuszek_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11801002" context="algorithm"/><br />
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
