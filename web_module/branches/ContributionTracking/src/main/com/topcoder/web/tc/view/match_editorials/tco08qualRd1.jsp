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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
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
    <A href="/stat?c=round_overview&er=5&rd=12007">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519414" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Qualification Round 1</span><br />Tuesday, February 5, 2008
<br /><br />



<h2>Match summary</h2>

<p>
Formula One has got its light signals, Soccer World Cup has the first whistle, 
for Olympic Games there is a great opening ceremony. The Algorithm competition
of TCO 2008
was launched in a less spectacular way: by a small gray window stating that the coding
phase has started. But even if the start wasn't that spectacular, 
the battle that soon started was as fierce as in any of the other competitions. 
</p>

<p>
The problemset offered many ways to qualify: Solving a tricky 250, implementing
an almost-textbook dynamic programming in the 600, or finding a working approach for 
the 900... And last but not least, there was the opportunity to gain easy points
from challenges, especially on the easy submissions.
</p>

<p>
An interesting consequence of a less-traditional easy problem:
After a quarter of an hour, the top 20 was populated by coders of all colors.
(And there didn't seem to be much corelation between their colors and the 
correctness of their solutions.)
The most significant event in the coding phase was
<tc-webtag:handle coderId="14927744" context="algorithm"/>'s
great time on the hard problem. This gave him a comforting lead at the 
beginning of the challenge phase.
</p>

<p>
But things were about to change.
<tc-webtag:handle coderId="22653739" context="algorithm"/>'s 275 points from challenges
gave him the first place, and 
<tc-webtag:handle coderId="14927744" context="algorithm"/> had to settle for second.
Third place went to 
<tc-webtag:handle coderId="22690742" context="algorithm"/>.
</p>

<p>
Congratulations to all the advancers, and let the best ones advance in the remaining two
qualification rounds!
</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8595&amp;rd=12007" name="8595">MonstersAndBunnies</a></b>

</font>

<A href="Javascript:openProblemRating(8595)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519414" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      815 / 1014 (80.37%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      268 / 815 (32.88%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>bcloud</b> for 244.60 points (4 mins 14 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      161.90 (for 268 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Notation: Let <code>C(N,K)</code> be the number of ways in which we can choose <code>K</code> out 
of <code>N</code> objects.
We can compute <code>C(N,K)</code> as <code>N! / ( K! * (N-K)! )</code>.
</p>

<h4>Monsters only</h4>

<p>
First, let's solve an easier version of the problem &ndash; for now, we will 
try to solve the situation where there are no bunnies.
</p>

<p>
The first important thing is to notice that in each meeting either 0 or 2 monsters die.
This means that the parity of monsters never changes.
If the initial number of 
monsters is odd, it will always be odd, and thus it can never decrease to zero.
In other words, if the initial number of monsters is odd, we can not win.
</p>

<p>
Furthermore, we can make the following observation: If there are M monsters and me,
there are <code>C(M+1,2)</code>
possibilities for the first meeting. In M of these, we meet a monster
and die. In the remaining <code>C(M,2)</code>, two monsters meet and die, and we are left with M-2
monsters.
</p>

<p>
Let <code>p(M)</code> be the probability that we win the game if there are currently M&ge;2 monsters
in the town. We just explained the following formula:
</p>

<pre>
p(M) = ( C(M,2) / C(M+1,2) ) * p(M-2)
</pre>

<p>
Together with the initial conditions <code>p(0)=1</code> and <code>p(1)=0</code>
this gives us a solution that runs in time
O(M).
</p>

<h4>Constant time solution</h4>

<p>
Using the above formula, we can compute:
</p>

<pre>
P(2) = C(2,2) / C(3,2) = 1/3
P(4) = (C(4,2) / C(5,2)) * P(2) = 6/10 * 1/3 = 3/5 * 1/3 = 1/5
P(6) = (C(6,2) / C(7,2)) * P(4) = 15/21 * 1/5 = 5/7 * 1/5 = 1/7
</pre>

<p>
We start to see a pattern emerging: <code>p(2K)=1/(2K+1)</code>.
This can easily be proved using mathematical induction.
Instead, we will show a combinatorial argument.
</p>

<p>
Consider a game where the number of monsters is 2K.
We will make two slight modifications to our game rules:
</p>

<ul>
<li>When you meet a monster, you kill each other.</li>
<li>If you die, the game continues until there is only one monster left.</li>
</ul>

<p>
Clearly, these changes don't affect your chance of survival. However, 
they have an important consequence: They make the game symmetric.
Each of the 2K+1 players (that is, 2K monsters + us) 
has got an equal probability of being the last one alive.
And this probability clearly has to be 1/(2K+1).
</p>

<h4>What about the bunnies?</h4>

<p>
Imagine that you have a fair 6-sided dice. 
Consider the following algorithm: "Repeatedly throw the dice until 
you get either a 1, or a 6."
Clearly, the probability of ending with a 1 is the same as the probability
of ending with a 6.
</p>

<p>
Now, what would happen if the dice were biased? For example, let prob(1)=1/13
and prob(6)=3/13. How will this affect the final outcome of our algorithm?
</p>

<p>
Note that we don't even need to know how probable each of the outcomes 2, 3, 4, and 5
is. What matters is that in each throw the outcome 6 is three times more likely than
the outcome 1. If we make many throws, we will get approximately three times as many 6s
as 1s. Thus, for example, if we executed our algorithm 400 times, we can expect 300 runs to end
with a 6, and only 100 to end with a 1.
</p>

<p><i>
This reasoning can be formalized using conditional probability. The probability of our algorithm
returning 6 is the probability of a throw returning 6, given that we know it returned (6 or 1).
This probability can be computed as prob(6) / (prob(1)+prob(6)).
</i></p>

<p>
The moral of the story: The outcome of our algorithm only depends on the ratio prob(1):prob(6).
</p>

<h4>Okay, but what about the bunnies?</h4>

<p>
The bunnies don't influence monster count in any way.
We can simply ignore all meetings that involve bunnies, 
just as in the above experiment we ignored outcomes 2, 3, 4, and 5, and only focused on 1s and 6s.
</p>

<p>
More precisely, we have a town with monsters and possibly some bunnies. We will generate the
meetings <i>(throw the dice)</i>, until we get an important meeting that does not involve a bunny 
<i>(the throw ends with a 1 or a 6)</i>.
Now there are two possible outcomes: either we meet a monster and lose 
<i>(the algorithm returns 1)</i>, 
or two monsters meet and we win <i>(the algorithm returns 6)</i>.
</p>

<p>
We can make the same argument as before: The probability that in the important meeting
two monsters meet <i>(the algorithm
returns a 6)</i> depends only on the ratio of probabilities prob(two monsters meet):prob(you meet a
monster).
</p>

<p>
The two probabilites in question can be expressed as:
</p>

<pre>
prob(two monsters meet)  = C(M,2) / C(M+B+1,2)
prob(you meet a monster) =      M / C(M+B+1,2)
</pre>

<p>
And thus their ratio is always the same, <code>C(M,2):M</code>. 
</p>

<p>
This means that if we completely ignore the bunnies, and only focus on the meetings that involve
us and the monsters, we will get the correct result.
</p>

<p>
(A good way of looking at the bunnies: We and the monsters are playing the game. The bunnies just
roam around and get into our way, but they don't influence our game in the same way ducks that fly
above the town don't influence it.)
</p>

<p>
(Yet another way of getting the right intuition on bunnies: Consider the modified rules
that make the game symmetric. 
The bunnies can't help you, and they also can't help the monsters,
simply because of the symmetry.
If there was an argument that shows, say, "if there are
more bunnies, you have a higher chance to win", the same argument could be used to show
"if there are more bunnies, the k-th monster has a higher chance to win", and that is 
not possible.)
</p>

<h4>Summary</h4>

<p>
We just explained that for all values of B and even values of M the answer is 1/(M+1), and 
for all other inputs the answer is 0.
</p>

<h4>Dynamic programming</h4>

<p>
Finally, we would like to note that the entire task was solvable without the above analysis,
just by rewriting the problem statement as a recursive formula, and then use dynamic programming
to evaluate it. The code for such a solution follows.
</p>

<pre>
  double fullDP(int M, int B) {
    double[][] prob = new double[M+1][B+1];
    for (int m=0; m&lt;=M; m++)
      for (int b=0; b&lt;=B; b++) {
        if (m==0) { prob[m][b]=1.0; continue; }
        int allEvents = (m+b+1)*(m+b)/2;
        int MMEvents = m*(m-1)/2;   double MMProb = 1.0*MMEvents/allEvents;
        int MBEvents = m*b;         double MBProb = 1.0*MBEvents/allEvents;
        int BBEvents = b*(b-1)/2;   double BBProb = 1.0*BBEvents/allEvents;
        int HMEvents = m;           double HMProb = 1.0*HMEvents/allEvents;
        int HBEvents = b;           double HBProb = 1.0*HBEvents/allEvents;
        double pp = 0.0;
        if (m&gt;=2) pp += MMProb * prob[m-2][b]; // two monsters meet and die
        if (b&gt;=1) pp += MBProb * prob[m][b-1]; // a monster kills a bunny
        if (b==0) {
          prob[m][b] = pp;
        } else {
          // we meet a bunny, examine whether killing it is better than
          // letting it go, and pick the better possibility
          prob[m][b] = Math.max( (1-BBProb)*(pp + HBProb*prob[m][b-1]) , (1-BBProb-HBProb)*pp );
        }
      }
    return prob[M][B];
  }
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8596&amp;rd=12007" name="8596">PrimeSums</a></b>

</font>

<A href="Javascript:openProblemRating(8596)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519414" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      339 / 1014 (33.43%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      143 / 339 (42.18%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>antimatter</b> for 573.35 points (6 mins 10 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      390.08 (for 143 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This task could be split into two separate questions: <br/>
1. "How many sub-bags of the given bag have weight W?" <br/>
2. "Is W a prime number?"</br>
</p>

<p>
The bag has at most 50 elements, and they don't exceed 10,000. Thus the values W 
for which we need to answer these questions lie in the range from 0 to 500,000. 
</p>

<h4>Prime numbers</h4>

<p>
Checking whether a number is prime can be done by a trivial algorithm: The number
N is prime if it is greater than 1, and no number between 2 and sqrt(N), inclusive,
divides N.
</p>

<p>
There are also more efficient methods. One particularly suitable and easy to implement
is the <a target="_blank" href="http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes">Sieve of Eratosthenes</a>.
</p>

<h4>Subset counts</h4>

<p>
This part of the problem was an exercise in knapsack-style dynamic programming.
</p>

<p>
First, let's show how to solve the problem for sets, i.e., in the case when all input
values are distinct.
</p>

<p>
Let N(X,W) be the number of subsets that only use first X elements from the input, and 
have weight W.
</p>

<p>
Clearly, N(0,0)=1, and N(0,W)=0 for any positive W.
</p>

<p>
Now, how to compute N(X,W) for a positive X?
</p>

<p>
We can split all the subsets counted by N(X,W) into two kinds: those that don't contain the X-th element,
and those that do. For the first kind, the count of such subsets is clearly N(X-1,W).
For the second kind, take a look at how the rest of the set can look like. It may only contain
some of the first X-1 elements, and its weight has to be W-(weight of the X-th element).
Thus the number of subsets of the second type is N(X-1,W-weight(X)).
</p>

<p>
In this simple case, all the values N(X,W) can be computed at the same time using the following
pseudocode:
</p>

<pre>
set N(0,0)=1
for all w from 1 to maxW: set N(0,w)=0
for all x from 1 to maxX:
   for all w from 0 to maxW:
      N(x,w) = N(x-1,w)
      if (weight(x) &le; w): N(x,w) += N(x-1,w-weight(x))
</pre>

<h4>Handling duplicates</h4>

<p>
In the general case we need to make sure we don't count identical sub-bags more than once.
To achieve this, we will simply process all equal values at the same time.
This means that the recurrence relation won't have 2 cases (take element X or not?),
but multiple cases (take element X how many times?).
</p>

<h4>Fitting it all into memory</h4>

<p>
The entire array needed to store the values N(x,w) would not fit into the memory limit.
Luckily, we have two circumstances speaking in our favor: First, we only need the values N(maxX,*).
Second, to compute the values N(X,*) we only need the values N(X-1,*). This means that we can
only remember two rows of the table at any time.
</p>

<p>
Java code follows.
</p>

<pre>
  int SUM;
  boolean[] isPrime;
  long[][] ways;

  public long getCount(int[] bag) {
    SUM=0;
    for (int i=0; i&lt;bag.length; i++) SUM += bag[i];
    Arrays.sort(bag);

    // do the sieve
    isPrime = new boolean[SUM+1];
    Arrays.fill(isPrime,true);
    isPrime[0]=isPrime[1]=false;
    for (int i=2; i*i&lt;=SUM; i++)
      if (isPrime[i])
        for (int j=i*i; j&lt;=SUM; j+=i) isPrime[j]=false;

    ways = new long[2][SUM+1];
    Arrays.fill(ways[0],0);
    Arrays.fill(ways[1],0);
    ways[0][0] = 1;

    int last=0, next=1;
    for (int i=0; i&lt;bag.length; i++) {
      if (i&gt;0) if (bag[i]==bag[i-1]) continue; // skip duplicates
      // count duplicity
      int cnt=1;
      while (i+cnt &lt; bag.length) if (bag[i+cnt]==bag[i]) cnt++; else break;
      // fill in new values
      for (int s=0; s&lt;=SUM; s++) {
        ways[next][s] = ways[last][s];
        for (int t=1; t&lt;=cnt; t++) if (s-t*bag[i] &gt;= 0) ways[next][s] += ways[last][s-t*bag[i]];
      }
      // prepare next step
      last=1-last; next=1-next;
    }

    long result = 0;
    for (int i=0; i&lt;=SUM; i++) if (isPrime[i]) result += ways[last][i];

    return result;
  }

</pre>

<h4>Footnote</h4>

<p>
There is at least one asymptotically better algorithm than this one. Can you find one?
(Hint: There is a better way how to handle the duplicates.)
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8600&amp;rd=12007" name="8600">MagicFingerprint</a></b>

</font>

<A href="Javascript:openProblemRating(8600)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519414" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      900

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      69 / 1014 (6.80%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      34 / 69 (49.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>blackmath</b> for 738.74 points (13 mins 55 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      500.91 (for 34 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
There were two possible approaches, and they can be labeled "filter and precompute", and "generate".
</p>

<h4>Filtering</h4>

<p>
If implemented efficiently, the magic fingerprint method is pretty fast, and any reasonably fast computer
can process all numbers up to 1 billion in a matter of a few minutes. Well, but the time limit is just two
seconds... What can we do to help?
</p>

<p>
The answer is: let your computer do most of the work. For example, pre-compute the answer for inputs
of the type [k*10^6,(k+1)*10^6). You will get around 1,000 values. Store these in your program as an
array of integer constants. Now, if you get a large input, it surely contains many of these ranges. 
Just add together all their counts. Now you only need to compute magic fingerprints for a few elements
at the beginning and at the end of the given range.
</p>

<p>
A similar approach was used in
<tc-webtag:handle coderId="14927744" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=268831&rd=12007&pm=8600&cr=14927744">fastest solution</a>.
</p>

<h4>Generating</h4>

<p>
Clearly, the number N is lucky if and only if magic(N) is lucky. So far, we used one direction:
given N, compute magic(N). However, a more efficient way is to do it backwards: given magic(N),
determine all possible N.
</p>

<p>
This isn't too hard. For example, suppose that magic(N)=8111. How many five-digit Ns are there?
We can generate them recursively. We start by trying the first digit 1. Then the second digit has to
be 9, the third has to be 8. We have two choices for the fourth digit: the first one leads to the
numbers 19876 and 19878, the second one yields the number 19898. And so on. (In this case, leading
digits 8 and 9 will bring some more solutions.)
</p>

<p>
We can now use breadth-first search to generate all lucky numbers less than a billion: Start with
the number 7, and for each number X we process, find all N&le;10^9 such that magic(N)=X, and add
them into the queue to be processed.
</p>

<p>
Java code that generates all lucky numbers follows.
</p>

<pre>
  Set&lt;Integer&gt; lucky;
  Queue&lt;Integer&gt; process;
  int[] digits;
  int digitCount;
  int[] newDigits;

  void generate(int where) {
    if (where==-1) {
      int current = 0;
      for (int d=digitCount; d&gt;=0; d--) {
        current *= 10;
        current += newDigits[d];
      }
      if (!lucky.contains(current)) {
        lucky.add(current);
        process.add(current);
      }
    } else {
      newDigits[where] = newDigits[where+1] + digits[where];
      if (newDigits[where]&gt;=0 &amp;&amp; newDigits[where]&lt;=9) generate(where-1);
      newDigits[where] = newDigits[where+1] - digits[where];
      if (newDigits[where]&gt;=0 &amp;&amp; newDigits[where]&lt;=9) generate(where-1);
    }
  }

  public int countLuckyNumbers(int A, int B) {
    lucky = new HashSet&lt;Integer&gt;();
    process = new LinkedList&lt;Integer&gt;();
    digits = new int[12];
    newDigits = new int[12];

    lucky.add(7);
    process.add(7);
    while (!process.isEmpty()) {
      int current = process.remove();
      digitCount = 0;
      while (current &gt; 0) { digits[digitCount++] = (int)current%10; current /= 10; }
      while (digitCount&lt;=8) {
        for (int i=1; i&lt;10; i++) {
          newDigits[digitCount]=i;
          generate(digitCount-1);
        }
        digits[ digitCount++ ] = 0;
      }
    }
    int result = 0;
    for (Integer x : lucky) {
      if (A&lt;=x &amp;&amp; x&lt;=B) result++;
      System.out.println(x);
    }
    return result;
  }

</pre>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
