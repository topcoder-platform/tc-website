<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Room 3 Problem Anaylsis</title>

<jsp:include page="../../../script.jsp" />

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="..//includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="room3"/>
</jsp:include>

            <p class="terciary">
                <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room3">Play-by-Play</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room3_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;Problem Analysis
            </p>

            <h2>Problem Set Analysis &amp; Opinion</h2>

            <a href="/tc?module=MemberProfile&cr=273217"><img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" align="left" /></a>
            <p>by <a href="/tc?module=MemberProfile&cr=273217">schveiguy</a>, <br/>
            <em>TopCoder Member</em><br />
            Thursday, December 4, 2003<br/><br/></p>

            <h3>MakeUnique<br/>
            <span class="bodyText">Used as: Division 1 - Level 1:</span></h3>

<p>
Given a string of characters, this problem asks you to remove characters from
the string such that the remaining characters are unique in the string, are in
alphabetical order, and represent all the characters from the original string.
The removed characters are replaced with '.' characters.  On top of that, there
are a couple of tiebreaker rules which take this problem out of linear greedy
algorithm range.
</p>

<p>
However, we can define a greedy algorithm which finds the best sequence of
characters given the position of the character that it ends with.  Such an
algorithm requires O(n<sup>2</sup>) time, and runs just fine for 50 characters.
The first step in any algorithm is to find out which characters need to be
represented.  This is done by either adding all the characters to a set, or by
sorting the characters and removing duplicates.
</p>

<p>
For the greedy algorithm, we choose any character in the original string which
contains the last character in the set.  Then we work backwards through the
string, picking the first instance of the next lowest character to find.  The
reason you know you can pick the first instance is because it satisfies the
rule that you want the string which is most tightly packed, and finding later
characters first also ensures that the string is lexicographically smallest.
For example, in the string <tt>"ABBC"</tt>, we want the second 'B' because
<tt>"A.BC"</tt> is lexicographically smaller than <tt>"AB.C"</tt>.  Finally,
once the best for each starting position is found, we can compare the sizes and
pick the string with the smallest overall size.  If we start picking the
initial character from the end, and move towards the front, we don't even need
to worry about lexicographically comparing them.  Here is some C++ code which
does the trick:
</p>
<pre>
string eliminated(string original)
{
  set&lt;char&gt; sc(original.begin(), original.end());
  sc.insert('.') // sentinel
  vector&lt;char&gt; chars(sc.begin(), sc.end());
  int best = 1000;
  string bstring;
  for(int i = original.length() - 1; i &gt;= 0; i--) // starting position
  {
    string ans(original.length() - i - 1, '.');
    int next = chars.size() - 1, last;
    for(int j = i; j &gt;= 0; j--) // current position
      if(original[j] == chars[next])
      {
        last = j;
        ans = chars[next] + ans;
        next--;
      }
      else
        ans = '.' + ans;
    if(next == 0)
    {
      if(i - last &lt; best)
      {
        bstring = ans;
        best = i - last;
      }
    }
  }
  return bstring;
}
</pre>

<p>
In addition to greedy, there are some complicated memoization algorithms which
also work (my first attempt used this), or you could even use DP.
</p>

            <h3>NoMo<br/>
            <span class="bodyText">Used as: Division 1 - Level 2:</span></h3>

Ahh, the age old question -- how much can the momentum of a football game
affect the outcome.  Given the ordering of scores in a game, we can easily
calculate an m-factor for that game.  The m-factor is determined by number of
sequential scores by the same team minus the number of times the scoring
shifted sides.  However, we are given the difficult task of calculating the
m-factor for all permutations of the scorings.  The problem claims that you
must count each individual scoring as a unique event, which means there are n!
permutations.  Given that the worst case has 25 characters, that becomes 25!
permutations -- way too many to count them all.  However, with some
combinatorical math, we can prove that we only have to worry about C(n, m)
scoring patterns, where m is the number of scores by team A.  Observe that for
any pattern of length n, which has m scores by team A, there are exactly m A
characters, and exactly (n - m) B characters.  If we treat each of these scores
as unique scores, then there are exactly m! ways to arrange the A characters to
get this pattern, and exactly (n - m)! ways to arrange the B characters to get
this pattern.  Therefore, we are going to form every possible pattern of A's
and B's exactly m!(n-m)! times.  If we factor this out of the numerator of the
average equation, we get:
</p>
<pre>
          m!(n-m)!S
Average = ---------
              N!
</pre>

<p>
where S is the sum of all the m-factors from the unique patterns of A's and B's.  If we remove m!(n-m)! from the top and bottom of the fraction, it now becomes:
</p>

<pre>
                S
Average = --------------
                N!
             --------
             m!(n-m)!
</pre>

<p>
Which we now recognize as the choice formula.  What this means is that we only
have to calculate the values for the C(n, m) patterns, and this is doable
without any memoization or DP.  The recursive function tries adding an A, and
then tries adding a B, only if the number of A's or B's doesn't exceed the
maximum.  Given the last character added, it can determine whether to add or
subtract one from the running total.  A simple recursive solution follows (in
Java):
</p>

<pre>
long go(int na, int nb, int last, int f)
{
  if(na &lt; 0 || nb &lt; 0)
    return 0;
  if(na + nb == 0)
    return f;
  return
    go(na - 1, nb, 0, f + (last == 0 ? 1 : -1)) +
    go(na, nb - 1, 1, f + (last == 1 ? 1 : -1));
}

public double momentum(String game)
{
  int na = 0, nb = 0;
  int N = game.length();
  for(int i = 0; i &lt; N; i++)
  {
    if(game.charAt(i) == 'A')
      na++;
    else
      nb++;
  }

  double den = 1; // den = C(N, na)
  for(long i = N; i &gt; Math.max(na, nb); i--)
    den *= i;
  for(long i = Math.min(na, nb); i &gt; 0; i--)
    den /= i;

  int f = 0;
  for(int i = 1; i &lt; N; i++)
    if(game.charAt(i) == game.charAt(i - 1))
      f++;
    else
      f--;

  return f - go(na, nb, -1, 1) / den;
}
</pre>


            <h3>Equity<br/>
            <span class="bodyText">Used as: Division 1 - Level 3:</span></h3>

<p>
Another classic delimma, how do you fairly distribute candy.  Many a mother has
pondered this same riddle, and yet here we create a truly fair program which
can solve it.  It really scares me when I see such a short description for a
level 3 problem, since usually it means there is more than meets the eye to
solving it.  Indeed, once you see the limits, you are likely to claim
impossibility.  Brute force cannot possibly solve this, as for a given
set of n candy bars and p people, there are O(n^3) ways of dividing them, and
O((n^3)^p) ways of distributing them. However, we have one saving grace which makes a greedy
solution almost look trivial -- the ways you can divide candy are all
relatively prime.  You'll see why this is important later, but first, let's
review the greedy solution.
</p>

<p>
Looking at it logically, we first can figure out the possible "lengths" of
candy we could give a single person, given an infinite amount of candy.  Of
course, it is possible to give the person 0, 1/3, and 1/2.  If we go from 1/3,
we can add 1/2 to get 5/6, and 1/3 to get 2/3.  If we do everything in terms of
sixths, under one bar, we can have 0/6, 2/6, 3/6, 4/6, and 5/6.  At this
point, we could add a whole bar to each of these to get 6/6, 8/6, 9/6, 10/6,
and 11/6.  To get 7/6, we can add 1/3 (2/6) to 5/6.  Basically, this means it
is possible to get any multiple of 1/6 <i>except</i> 1/6.  So trivially, the
lowest non-zero inequity we can get is 1/6, unless some people get nothing, in
which case it is 1/3.  This doesn't prove that every person who gets a certain
length gets the same makeup of bars, but let's assume this is true.  This
leaves us with two cases. The case where not everyone gets candy is trivial --
split all bars into thirds.  The second case results in an inequity of either
1/6 or 0, and is not so trivial.  To think about the problem eaiser, we divide
all the bars into sixths.  Then, we distribute them round-robin until we run
out of sixths.  At this point, some people may have 1/6 more than the others.
</p>

<p>
We can define a function f(x) which will return the way to give a person x/6
bars of candy in as few pieces as possible, using the cuts allowed.  The way I
wrote this method is to first give as many halves as possible.  If the
resulting value was 1/6 away from the target, remove one half.  Now, for every
set of 2 halves, we can replace this with a whole bar.  finally, add enough
thirds to make the final value.
</p>

<p>
So the final answer is to call f(x) for each of the people you gave x/6 bars,
and add that to the result.  Simple multiplication, division and the mod
operator makes this solution run in constant time.
</p>

<p>
But how do we know that we did not end up illegally splitting a bar into sixths
in order to get the final solution?  The reason it works is because all of the
divisions are relatively prime.  We already know that the number of sixths used
adds up to the number of bars needed, and we only ever used divisions that were
approved to make up each portion.  Because of the relative primeness, It's
impossible to split the bar in unapproved ways.  For example, we cannot take
1/2 out of a bar, and also 1/3 out of the same bar, because it would leave 1/6,
which we didn't count as a piece anywhere.  If the problem allowed splitting
into quarters, then we would need to be more careful.  You could illegally take
two quarter bars and a half bar from the same bar, and end up with an incorrect
answer.
</p>

<p>
The complete correct code which runs in constant time follows:
</p>

<pre>
int f(int t)
{
  int npieces = t / 3; // count halves
  int total = npieces * 3;
  if(total + 1 == t)
  {
    total -= 3;
    npieces--;
  }
  npieces = npieces / 2 + npieces % 2; // convert to wholes
  while(total &lt; t) // add thirds
  {
    total += 2;
    npieces++;
  }
  return npieces;
}

public int minPieces(int n, int k)
{
  k *= 6;
  if(n * 2 &gt; k)
    return k / 2;

  int all = k / n;
  k %= n;

  return f(all + 1) * k + f(all) * (n - k);
}
</pre>

            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
