<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 182 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#FFFFFF">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 182</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Saturday, February 7, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p>
A level one problem with some nasty boundary cases and a devious level two problem made this SRM a tough one for 
many Division 1 participants. Coding phase saw <b>nicka81</b> jump into an early lead with exceptionally fast 
submissions on the two harder problems. He had to resubmit the hard, however, which allowed <b>jshute</b> to pass him. Not surprisingly, <b>John Dethridge</b> and <b>tomek</b> were close behind, but <b>John Dethridge</b> made an
unsuccessful challenge  and then declared his 1000 point submission to be incorrect. His 1000 point submission did not 
actually fail, but his 250 point submission did, and when the dust settled, the top three finishers were <b>jshute</b>, 
<b>tomek</b>, and <b>lars</b>. Congratulations are also due to <b>Per</b>, who finished 5th in his Division 1 debut. 
Very impressive! Division 2 participants had a slightlier easier time of it, and two newcomers, <b>Tomy</b> and 
<b>snowing</b>, finished first and second, each with over 1500 points.
</p>

<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>IBEvaluator</b> 
</font> 
<A href="Javascript:openProblemRating(2306)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      215 / 240 (89.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 215 (93.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>joelu</b> for 294.55 points (3 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      242.39 (for 200 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
As can be seen from this problem's success rate, it was fairly straightforward for its 300 point value. First, 
we need to count how many predictions are off by each value (either positive or negative). This can be
done in a single loop.
</p>

<pre>
    int[] result = new int[7];
    int i;
    for (i = 0; i &lt; predictedGrades.length; i++)
    {
        int gradeDiff = Math.abs( predictedGrades[i] - actualGrades[i] );
        result[gradeDiff]++;
    }
</pre>

Next, we need to convert these counts into percentages. We first divide each count by the total number of predictions 
so as to get a fraction between 0 and 1, and we then multiply through by 100. To be safe, we could use floating point
arithmetic for this, but if you do the division last, integer arithmetic works too.

<pre>
    for (i = 0; i &lt; 7; i++)
        result[i] = (result[i]*100) / predictedGrades.length;
</pre>

<font size="+2"> 
<b>SlayingDeer</b> 
</font> 
<A href="Javascript:openProblemRating(2308)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      171 / 240 (71.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 171 (43.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nobody3</b> for 461.48 points (8 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      317.02 (for 75 correct submissions) 
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
      177 / 184 (96.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      118 / 177 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ploh</b> for 243.26 points (4 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.36 (for 118 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem caused problems for many, but if it is approached in the right way, it can be done quickly and 
painlessly. Suppose we just simulate the chase one minute at a time. Every minute, Running
Wild will move forward A meters while the deer will either move forward B meters or will hold still. To figure
out which case it is, remember that the deer moves the first 30 minutes in each 45 minute span. This means it
will be moving if and only if (time % 45) is between 0 and 29 inclusive, which we can easily check.
</p>

<p>
The next problem is to determine when Running Wild's task is impossible. One approach here is to note that every
45 minutes, Running Wild gains 45*A - 30*B meters on the deer. If this quantity is positive, it is at least
15, so Running Wild will make up the maximum of 100,000 meters in around 45*100,000/15 = 300,000 minutes. If the
quantity is not positive, then Running Wild makes up no ground after 45 minutes, so there is no need to search
after that. Thus, we can simply stop the simulation after, say, 500,000 minutes and declare the task impossible.
These ideas can be implemented as shown below.
</p>

<pre>
    int getTime(int A, int B, int C)
    {
        for (int time = 0; time &lt; 500000; time++)
        {
            if (C &lt;= 0)
                return time;
            if (time % 45 &lt; 30) 
                C += B;
            C -= A;
        }
        return -1;
    }
</pre>

<p>
Indeed, the fastest submission, from <b>ploh</b>, used almost precisely this method. It was easy to overlook
certain things, however, and a number of submissions were incorrect in both divisions. Some of the more common errors
were:
<ul>
  <li> Not recognizing as impossible the case when Running Wild and the deer are exactly even over 45 minutes.</li>
  <li> Replacing 500,000 with a constant that is too small.</li>
  <li> Failing the case where Running Wild catches the deer after a multiple of 45 minutes due to faulty mathematics
       or an incorrect boundary condition.</li>
</ul>
</p> 

<font size="+2"> 
<b>RSABreaker</b> 
</font> 
<A href="Javascript:openProblemRating(2310)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      51 / 240 (21.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      35 / 51 (68.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vkanade</b> for 882.93 points (10 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      607.11 (for 35 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem may have seemed intimidating at first, but it breaks up into several smaller parts that are actually
quite manageable. To decrypt b, we need to come up with a valid private key. The first step in doing that is
computing m. Since n is fairly small, we can do this by iterating over every positive integer less than n, and
checking whether that integer shares a prime factor with n, or equivalently, whether its greatest common divisor
with n is 1. Fortunately, this can be done both both concisely and efficiently using the
<a href = "http://www.cut-the-knot.org/blue/Euclid.shtml">Euclidean algorithm</a>.
</p>

<pre>
    int gcd(int a, int b)
    {
        if (b == 0) 
            return a;
        else
            return gcd(b, a%b);
    }

    int computeM(int n)
    {
        int count = 0;
        for (int i = 1; i &lt; n; i++)
        if (gcd(i,n) == 1)
            count++;
        return count;
    }
</pre>

<p>
For those unfamiliar with the Euclidean algorithm, the greatest common divisor of a and b can also be computed by 
looping from 1 to a, and finding the largest integer that divides both a and b. Regardless, the next step is to find e 
such that e*d - 1 is a multiple of m. Again, since n is not very large, this can be done with a loop.
</p>
<pre>
    int d = 1;
    while ( (d*e) % m != 1) 
        d++;
</pre>

<p>
Finally, we need to determine the remainder when b^d is divided by n. Unfortunately, since d can be as large as 1000,
we cannot just go ahead and compute b^d without overflowing. On the other hand, with a little bit of thought, you can
convince yourself that (x * y) % n is equal to ( (x%n) * y) % n. Thus, suppose we calculate b^d in yet another loop 
by multiplying repeatedly by b, but we take the answer modulo n at each step. This will not overflow since we will 
never be left with a number larger than 1000 at the end of a step, and it will generate the correct answer as observed
above.
</p>

<pre>
    int a = 1;
    for (int i = 0; i &lt; d; i++)
        a = (a*b) % n;
</pre>

<p>
This is enough to solve the problem, but one might ask if the method could be sped up. It turns out that the Euclidean
algorithm can be used to compute d from e extremely fast. Also, given d, we can compute a very quickly by repeatedely 
squaring modulo n. On the other hand, it is much more difficult to compute m quickly. In fact, n is usually chosen to be the product of two distinct primes p and q. In that case, m = (p-1)*(q-1), and finding m becomes equivalent to factoring 
n. For precisely this reason, finding efficient factoring algorithms has become one of the biggest problems in computer 
science, and fortunately for cryptography, it is still unsolved! RSA encryption is an interesting and important subject,
and if you want to know more, you can start <a href="http://mathworld.wolfram.com/RSAEncryption.html">here</a>.
</p>

<font size="+2"> 
<b>LunchScheduler</b> 
</font> 
<A href="Javascript:openProblemRating(2309)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      50 / 184 (27.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      29 / 50 (58.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>jshute</b> for 519.76 points (11 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      362.59 (for 29 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
As pointed out in the last match editorial, small constraints like M.length &lt; 10 are a good indication that you 
should use brute force. With this problem, however, it was not clear for many people how to go about doing this. 
Specifically, what are all the possibilities that we need to iterate through? The first thing to notice is that 
the order in which people arrive and leave is all that really matters. If you stop and think about it, this tells us 
whether each pair of people could have shaken hands, as well as the largest number of people in the cafe at the same 
time. Unfortunately, if you try all permutations of arrival and departure times, you are looking at no less than 9!*9! 
possibilities, which is too high.
</p>

<p>
On the other hand, suppose we fix the order in which people arrive. Then, a member cannot leave before everyone arrives
who he needs to shake hands with. On the other hand, there is no reason why any member needs to stay longer than that. 
Thus, departure orders that minimize overlap can easily be determined once the arrival order is fixed. Pseudo-code
that solves the problem based on this observation is shown below.
</p>

<pre>
    k = infinity;
    Iterate through each start ordering
    {
        thisOrderingOverlap = 0;
        Loop time from 0 to M.length-1
        {
            thisTimeOverlap = 1;
            Loop through all members i arriving before time
            {
                memberHasNotLeft = false;
                Loop through all members j not arriving before time
                {
                    if (member i shakes member j's hand)
                        memberHasNotLeft = true;
                }
                if (memberHasNotLeft)
                    thisTimeOverlap++;
            }
            thisOrderingOverlap = max(thisOrderingOverlap, thisTimeOverlap);
        }
        k = min(k, thisOrderingOverlap);
    }
</pre>

<p>
In C++, iterating through each possible ordering can be done with
<a href="http://www.sgi.com/tech/stl/next_permutation.html">next_permutation</a>. If you do not know about next_permutation, or your language does not have a similar function, it can also be done recursively.
</p>

<pre>
    void generateOrderings(int[] ordering, boolean[] used, int position)
    {
        if (position &gt;= NumElements)
            doSomethingWithOrdering(ordering);
        else
        {
            for (int i = 0; i &lt; numElements; i++)
            if (!used[i])
            {
                ordering[position] = i;
                used[i] = true;
                generateOrderings(ordering, used, position+1);
                used[i] = false;
            }
        }
    }
</pre>

<p>
For a more concise (obfuscated) version, be sure to check out <b>John Dethridge</b>'s solution.
</p>

<p>
To some extent, this algorithm can actually be improved upon. Suppose a set of members S has already arrived at the 
cafe. Then, members in S should still be in the cafe when the next member arrives if and only if they need to shake 
hands with someone who has not arrived yet. After that, we can determine the maximum overlap recursively by trying every 
possibility for the next member to arrive. With memoization, this gives a solution that runs in 2^n time instead of n! 
time. For more details, check out the writer solution in the practice room. It is doubtful that too many improvements 
exist beyond that, however, since the problem is actually NP-complete. If you interpret the matrix as the adjacency 
matrix for a graph, the problem becomes that of computing path-width, which is of <a href = "http://citeseer.nj.nec.com/bodlaender93efficient.html">surprising importance</a> in graph theory and theoretical computer science.
</p>

<font size="+2"> 
<b>PairwiseSums</b> 
</font> 
<A href="Javascript:openProblemRating(595)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      27 / 184 (14.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 27 (59.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>AdrianKuegel</b> for 700.84 points (20 mins 29 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      564.54 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
At first glance, this problem may seem to resemble a previous TopCoder problem involving pairwise differences, but the
solution does not carry over very well. Here, we need to reconstruct a list of up to fifty elements given its
pairwise sums, and an exponential solution will simply not be fast enough.
</p>

<p>
We will build A up from smallest element to largest. Suppose A and P are integer lists such that P gives the pairwise 
sums for A, where A[0] &lt;= A[1] &lt;= A[2] &lt;= ... and P[0] &lt;= P[1] &lt;= P[2] &lt;= ... . Given P, we wish to 
find A. It is difficult to get started, but suppose that we already know A[0]. Then, since P[0] is the smallest 
element in P, it can only arise as A[0] + A[1]. Similarly, P[1] must equal A[0] + A[2]. Therefore, if we know A[0], we 
can compute A[1] and A[2].
</p>

<p>
After that, however, this pattern breaks down. P[2] could either be A[0] + A[3] or A[1] + A[2] and without prior
knowledge, we cannot know which one it is. Fortunately, we do have prior knowledge! If we know A[0], we can compute A[1] 
and A[2] as described above, and then remove A[1] + A[2] from P. The next smallest element is then guaranteed to be
A[0] + A[3], which allows us to find A[3]. Similarly, if we know A[0], A[1], A[2], and A[3], we can remove A[i]+A[j], 
0 &lt;= i &lt; j &lt;= 3, from P. The next smallest element of P will be A[0]+A[4], which allows us to compute A[4].
Repeating in this way, we can find all of A without ever backtracking. Pseudocode is shown below.
</p>

<pre>
    int[] completeA(int smallestElementInA, int[] P)
    {
        int[] A = new int[];
        A.insert(smallestElementInA);

        // Keep looking until we can account for all of P

        while (P.length &gt; 0)
        {
            // Figure out the next element

            int nextSmallestPairwiseSum = P[0];
            int nextElementInA = nextSmallestPairwiseSum - smallestElementInA;

            // Check off used elements, returning [] on a contradiction

            for (int i = 0; i &lt; A.length; i++)
            if (P.contains(nextElementInA + A[i]))
                P.remove(nextElementInA + A[i]);
            else
                return new int[];  

            // Add the new element

            A.insert(nextElementInA);
        }
        return A;
    }
</pre>

<p>
Thus, once we know A[0], we can compute the rest of A. For this problem, we can now simply try every possibility for
A[0]. We are given A contains only non-negative integers, and A[1] &gt;= A[0], so A[0] must be an integer between 0 and 
P[0]/2 inclusive. Since P[0] &lt;= 1000, this means we will have to try at most 501 values, which will still be fast
enough. 
</p>

<p>
This can actually be made to work in a more general setting as well. Recall that we can find A[0] + A[1] and
A[0] + A[2] regardless of A[0], as these are just P[0] and P[1]. Then, since A[0] = ( (A[0]+A[1]) + (A[0]+A[2]) - 
(A[1]+A[2]) ) / 2, we can compute A[0] from A[1]+A[2]. On the other hand, this is just an element of P, and it must 
actually be quite early in the list. Thus, we can iterate through all of these values to find A[0] without making any 
extra assumptions about the values in A.
</p>



                        <p>
                        <img src="/i/m/dgarthur_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=262936"><strong>dgarthur</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
