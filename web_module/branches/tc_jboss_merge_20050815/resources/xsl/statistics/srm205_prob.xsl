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

<title>Single Round Match 205 Statistics at TopCoder</title>

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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 205</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Saturday, July 31, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
This match had a few surprises. Seven coders managed to get all three problems correct, which is not surprising. But of the top nine rated coders entering the match only one, <b>Yarin</b>, managed to make it into that group. The second through seventh place finishers were all reds with their circles less than half-filled or yellows! Quite a few rating points moved  between the top finishers in this match. <b>Yarin</b>, with the help of 50 challenge points, barely slipped past <b>gepa</b> by only 4 points for the win. Coming in a comparatively distant third (actually only 128 behind) was <b>gawry</b> a yellow! One more performance like that and he won't be yellow anymore. <b>gawry</b>'s +200 point rating gain also doesn't hurt Poland's country rating. <b>gepa</b>'s 140 point  gain helps out Germany's country rating, while <b>Yarin</b> continues to spearhead team Sweden, and his 85 point rating gain to 3141 propels him into fourth place in the current top coders in algorithm competition list. Congratulations <b>Yarin</b>. (Wanna join team "Turks and Caios Islands"?)
</p>
<p>
Division II was won impressively by <strong>-_-</strong>(China) with a 1508 point debut match (including 4 successful challenges for 200 points) to give an initial rating of 1800. <b>therealmoose</b>(USA) takes second (which I can tell you has nothing to do with paying the writer $1000 a few days ago for a laptop! Except maybe that giving me money brings good TopCoding luck, I suggest everyone try it! I understand the larger the sum, the more effective it is). <b>FunkFreaker</b>(Finland) takes third in another impressive debut performance which yields an initial rating of 1659. Four division-II coders managed to get all three problems correct, with <b>drexelmcs01</b>(USA) taking fourth.
</p>
<p>
This match had one of the highest similarities between Div-I and Div-II problems seen recently. Two problems were shared between the divisions: HexagonalSums and SpamDetector (as 600/250 in Div-I and 1100/500 in Div-II). Another similarity was the Div-I 1000 point problem, LongPipes, and the shared HexagonalSums problem which were both knapsack problem variations. But the two problems were very different requiring completely different techniques.  LongPipes shared more similarity with <b>Yarin</b>'s "Knapsack" the now legendary 0-1 knapsack problem in SRM-140, which no one was able to solve in time. But they too were completely different problems requiring different solutions. Even <b>Yarin</b> wrote a fresh solution to LongPipes from scratch during this SRM without referring back to his old problem. I will have more to say about the differences between these two problems below in the problem writeup. And unfortunately last minute simplifications the SpamDectector left it being pretty much identical to the CheatCodes problem of SRM 154, that was a mistake I was unaware of. Average was a deliberate reuse of an old problem. So this SRM doesn't win any prizes for originality.
</p><p>
Of all the NP-complete problems, the knapsack problem is clearly my favorite. So simple to state, so hard to solve. And variants are popular as SRM problems, although usually they are small enough to use direct brute force, or constrained in such a way so that the pseudo-polynomial time knapsack algorithm (brought to you by dynamic programming) works in reasonable time.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=818&amp;rd=5851" name="818">Average
</a></b>
</font>
<A href="Javascript:openProblemRating(818)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      171 / 177 (96.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      163 / 171 (95.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Minilek</b> for 249.11 points (1 mins 41 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      227.18 (for 163 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
There are two passes involved in this problem. On the first pass you calculate the average. On the second pass you compare to see which scores are below the average. The only trick is to do the comparison properly so that rounding or floating point equality issues don't arise. The easiest way to do this is to multiply all the scores by the number of scores. Now all the averages will come out perfect integers. This works because <i>a&lt;b implies a*n&lt;b*n for n&gt;0</i> and <i> a*n+b*n</i> for integers <i>a and b</i> is always exactly divisible by <i>n</i>.
</p>
<pre>
int average, total = 0 , c = 0 , n = math.length ;
for(i=0;i&lt;n;i++)
   total += (math[i] + verbal[i]) * n  ;
average = total / n ;
for(i=0;i&lt;n;i++)
   if ( (math[i] + verbal[i]) * n &lt; average )
      c++ ;
return c ;
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2229&amp;rd=5851" name="2229">SpamDetector</a></b>
</font>
<A href="Javascript:openProblemRating(2229)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      104 / 177 (58.76%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      51 / 104 (49.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>therealmoose</b> for 475.47 points (6 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      287.23 (for 51 correct submissions)
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
      145 / 150 (96.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      105 / 145 (72.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Enogipe</b> for 242.90 points (4 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      181.59 (for 105 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
In SpamDetector my goal was to write a fairly straightforward string manipulation problem that could not be solved by just calling string library routines. I wanted some kind of loop actually twiddling characters. I wasn't successful in this as the least string intensive, and most library intensive, solution to this problem is probably the one used by <b>Enogipe</b>, who completed the solution the fastest. After converting to lower case, take the "keywords" and transform them by sticking in a bunch of '+' characters into something like "k+e+w+o+r+d+s+". This can now be used as a pattern in the Java regular expression matching method of the String class. Although <b>Enogpipe</b> reasonably used a loop and StringBuffer to build the pattern, a complete master of inappropriate(?) library overuse might have done:
</p>
<pre>
for(c=i=0;i&lt;subjectLine.split(" +").length;i++)
   for(j=0;j&lt;keywords.length;j++)
     if(subjectLine.toLowerCase().split(" +")[i].matches(
          keywords[i].toLowerCase().replaceAll(".","$0+")))
        { c++; break;}
return c ;
</pre>
<p>
But that borders on Perl code. One must note that the two loops here must be nested in the given order, reversing them does not work, and the "break" out of the inner loop is also necessary. There is also a subtle issue here. The regular expression matcher only works here because of the constraint that keywords can not have more than two identical characters in a row. Otherwise a pattern of 24 "a+"'s followed by a "b" matching against a string of 50 "a"'s will time out as the matcher backtracks through a whole lot of different possible match prefixes. A really smart matcher based on simulating a non-deterministic finite state machine will work, but not one that translates the pattern into a deterministic finite state machine. The Java matcher times out.  The work around here is to remove the intermediate '+' characters between identical letters.
Using replaceAll("(.)\\1*","$0+") instead works too. If you understand that without referring to the Java API then you.matches("geek") in a good way. This "no triple letters" constraint was included because this was supposed to be an easy problem in which you should not have to worry about (or even consider the possibility of) library routines timing out.
</p>
<p>
There are many other ways to do the matching for this problem. One straightforward (pun intended) method is to start two pointers one at the beginning of the pattern and one at the beginning of the subject word. If the two characters match, advance both pointers, else if the subject word character matches the previous pattern character then advance the subject word pointer, else no match. If you make it to the end of both strings you have a match. The nice thing about this solution, which uses only elementary operations, is that each match clearly runs in linear time in every case. The solution I put in the Div-I practice room as "writer" does it yet another completely different way, which takes advantage of the no triple letters constraint.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2921&amp;rd=5851" name="2921">HexagonalSums</a></b>
</font>
<A href="Javascript:openProblemRating(2921)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      34 / 177 (19.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 34 (29.41%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>joegunrok</b> for 827.36 points (17 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      579.87 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>

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
      97 / 150 (64.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      73 / 97 (75.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 516.49 points (11 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      360.31 (for 73 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
When I saw mention of Legendre's proof of all integers above 1719 being expressible as the sum of four hexagonal numbers, I could not help but think "this obscure, useless bit of number theory trivia is just crying out to be built into SRM problem." Plus it is really a knapsack problem with the constraint that no solution has more than 6 elements and a guarantee that a solution always exists. It is different than most knapsack problems we see in SRMs in that the number of items to choose from is quite high (there are 707 hexagonal numbers less than a million and you have to consider using each hexagonal number up to 5 times) but the constraints make the problem very doable.</p><p>
The first step is to generate the hexagonal numbers. The very first google hit on "hexagonal numbers" leads you to a page where Legendre's proof is mentioned and gives the formula for the nth hexagonal number as n*(n2-1), using 1-based indexing. Otherwise it is pretty easy to see that hex(0)=1 and hex(n)=hex(n-1)+4n+1 when using 0-based indexing and that is sufficient to quickly generate a table of as many hexagonal numbers as you need. Or, since it is a two dimensional figure, it is reasonable to expect that the number of points is a quadratic function. Knowing that one can generate Legendre polynomials from 3 data points to directly give the formula. Which is a bit of overkill, but it does give me an excuse for mentioning Legendre a couple more times.
</p><p>
Many ways exist to attack this problem. If you don't know about all the range limits mentioned in the problem (those hints were there for a reason) but had an idea that the answers were always small, then you might try something like a progressive deepening search. Is it a equal to a hexagonal number, is it equal to the sum of two hexagonal numbers, is it equal to the sum of three hexagonal numbers, etc. It turns out this works just fine. But if you started out by checking all combinations of 6 or fewer hexagonal numbers, you are going to have problems because there are a lot of hexagonal numbers less than a million. The pseudo-polynomial time knapsack algorithm is even just a bit too slow for this problem because there are so many hexagonal numbers, and each hexagonal number might be used multiple times in a sum.
</p>
<p>
When you are looking for combinations of a most N items, it is more efficient to use N-1 nested loops and some kind of hash table or
tree look up for the Nth item, instead of using N nested loops (or recursive calls). This one level of optimization is quite sufficient for this problem. And if you know that a particular sum exists and has at most N terms once you finish searching for N-1 terms you are done. There is no reason to continue on to verify that there is indeed an N term solution.
</p>
<p>  Since I gave so many hints, this is the sort of solution I expected to people to write  if you included all the optimizations:
This code is actually O(sqrt(n) log n), wow! Because for large sums you never get past the <tt>if (sum>146858) return 3 ; </tt>You could be much sloppier and still be fast enough. For an even faster, but somewhat silly, solution, see the "writer" solution in the practice room for Div-I.
</p>
<pre>
hex[0]=n=1;
while(hex[n-1]&lt;=sum )
   {
   if ( hex[n-1]==sum ) return 1 ;
   hex[n]=hex[n-1]+4*n+1;
   n++ ;
   }
if ( search (sum , 2, 0) ) return 2 ;
if ( sum > 146858) return 3 ;
if ( search (sum, 3, 0) ) return 3 ;
if ( sum > 130 ) return 4 ;
if ( search (sum, 4, 0) ) return 4 ;
if ( sum > 26 ) return 5 ;
if ( search (sum, 5, 0) ) return 5 ;
return 6;

boolean search ( int goal , int terms , int smallest)
{
if ( goal &lt; 0 ) return false ;
if ( terms > 2 )
   for ( i = smallest ; hex[i] &lt;= goal / terms ; i ++ )
      if ( search ( goal-hex[i] , terms-1 , i ) )
         return true ;
else
   for ( i = 0 ; hex[i] &lt;= goal / terms ; i ++ )
      if ( Arrays.binarySearch (hex, goal-hex[i]) >= 0 )
         return true ;
return false ;
</pre>




<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2226&amp;rd=5851" name="2226">LongPipes</a></b>
</font>
<A href="Javascript:openProblemRating(2226)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      26 / 150 (17.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      8 / 26 (30.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gepa</b> for 721.54 points (19 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      617.22 (for 8 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
LongPipes is a plain vanilla knapsack problem. The range of the values is to large too use the pseudo-polynomial algorithm. The number of items is too big to enumerate all the possible combinations. We know it is an NP-complete problem so there is not going to be a polynomial time algorithm that we can use. We must somehow reduce the exponent, 38, down to a more reasonable value, such as 19. This can be done with a standard algorithmic technique, divide-and-conquer. Divide-and-conquer is basic idea behind many popular algorithms and meta-algorithms such as dynamic programming. Can you somehow divide the problem into pieces, do some separate processing on the pieces, and then combine the results in a way that is less work than attacking the whole problem directly? For many problems you can do this recursively and the speed up is dramatic. For the knapsack problem it is pretty much only possible to apply this technique once, for one big speedup.
</p>
<p>
The trick, oh excuse me, I mean algorithmic technique, is to divide the items into two groups. Then calculate the all the combinations of items from the first group. We need to know the sum of the lengths of the pipe segments in the combination, let's call this the "SUM," and the number of pipe segments in the combination, let's call this "NUM." Store the SUM and the NUM of each combination in a convenient data structure, such as a hash table or balanced tree, using the SUM as the key and NUM as the value. When you store each combination's info in the data structure, first check if there is already a combination with the same SUM in the data structure. If so keep only one of them, one with the smaller NUM. This data structure will have at most a half a million entries. Be sure to include the empty combination with NUM=0 and SUM=0.
</p>
<p>
Now we move to the second group of items. Calculate the SUM and NUM of all of the combinations of items from the second group (again being sure to include the empty combination SUM=0, NUM=0). For each combination, calculate how much more you need (desiredLength - SUM). If this number is positive, do a lookup in the data structure using this positive number as the key. If there is an element in the data structure with that SUM then we have found a combination of the correct SUM which may be partly in the first group and partly in the second group. Save NUM + the NUM from the data structure if it is the minimum found so far. Once you have gone through all the combinations of items in the second group, return the best NUM-1 (remember we are asked for the number of welds not the number of segments) or -1 if nothing was found.
</p><p>
In the following code, load(), processes the first group into the HashMap, map. Then search() generates the combinations of the second group and queries the HashMap to find exact fits. An optimized combination generator is shown in both load() and search(). The size of the hashtable is limited to 2^18 as a performance tuning measure.
</p>
<pre>
int minumumWelds( String [] segments, String desiredLength) ;
{
int n = segments.length;
int n1 = n / 2 ;  if ( n1 &gt; 18 ) n1 = 18 ;
int n2 = n - n1 ;
long len = Long.parseLong(desiredLength.replaceAll("\\.","")) ;
HashMap map ;
load(segments,n1);
search(segments,len,n1,n2) ;
if ( best &lt; 1000 ) return best-1 ;
return -1 ;
}

void load(String[] segs , int sz )
{
long [] seg = new long [sz] ;
for(i=0;i&lt;sz;i++) seg[i]=Long.parseLong(segs[i].replaceAll("\\.",""));
int n1 = sz/2 ; n2 = sz-n1 ; e1=1&lt;l&lt;n1 ; e2=1&lt;&lt;n2 ;
long[]a1=new long[e1] ; long[]a2=new long[e2] ;
int []c1=new int [e1] ; int []c2=new int [e2] ;
for(i=0;i&lt;e1;i++) for(b=1,j=0;j&lt;n1;j++,b+=b)
   if((b&amp;i)!=0) { a1[i]+=seg[j] ; c1[i]++; }
for(i=0;i&lt;e2;i++) for(b=1,j=0;j&lt;n2;j++,b+=b)
   if((b&amp;i)!=0) { a2[i]+=seg[j+n1] ; c2[i]++; }

for(i1=0;i1&lt;e1;i1++)
   for(i2=0;i2&lt;e2;i2++)
      { int num = c1[i1]+c2[i2] ;
      Long SUM = new Long (a1[i1]+a2[i2] ) ;
      Long NUM = new Integer (num) ;
      Integer val = map.get(SUM) ;
         if ( val == null || val.integerValue()&gt;num )
             map.put(SUM,NUM) ;
      }
}
void search load(String[] segs , long len, int off, int sz )
{
long [] seg = new long [sz] ;
for(i=0;i&lt;sz;i++) seg[i]=Long.parseLong(segs[i+off].replaceAll("\\.",""));
int n1 = sz/2 ; n2 = sz-n1 ; e1=1&lt;&lt;n1 ; e2=1&lt;&lt;n2 ;
long[]a1=new long[e1] ; long[]a2=new long[e2] ;
int []c1=new int [e1] ; int []c2=new int [e2] ;
for(i=0;i&lt;e1;i++) for(b=1,j=0;j&lt;n1;j++,b+=b)
   if((b&amp;i)!=0) { a1[i]+=seg[j] ; c1[i]++; }
for(i=0;i&lt;e2;i++) for(b=1,j=0;j&lt;n2;j++,b+=b)
   if((b&amp;i)!=0) { a2[i]+=seg[j+n1] ; c2[i]++; }

for(i1=0;i1&lt;e1;i1++)
   for(i2=0;i2&lt;e2;i2++)
      { int num = c1[i1]+c2[i2] ;
      Long SUM = new Long (len-a1[i1]-a2[i2] ) ;
      Integer val = map.get(SUM) ;
         if ( val != null || val.integerValue()+num&lt;best )
             best = val.integerValue()+num ;
      }
}
</pre><p>
Possible Optimizations:<ul><li>
Storing into the data structure is usually slower than querying the data structure. When dividing up the items it is probably faster if
the group that goes in the data structure is one or two items smaller than the other group.</li><li>
The pipe lengths, expressed in millimeters, fit easily into a 64 bit integer. This avoids any floating point equality testing problems and is probably the preferred representation for this problem. </li><li>
A custom built hash table or tree using the primitive types as keys and values (instead of objects like the library classes HashMap) will be faster in Java (but wasn't necessary for this problem). Using a simple array with Arrays.sort() and Arrays.binarySearch() is even fast enough.
</li><li>
When there are lots of items, like 20, a calculation like:</li><li>
<pre>
     for(b=1,i=0;i&lt;n;i++,b+=b) { SUM=NUM=0 ;
        if((b&amp;combo)!=0)
          { SUM+=length[i] ; NUM++ ; } }
</pre>
to calculate the SUM and NUM for every combination does a lot of operations in the inner loop. The whole process for N items is O(N*2^N). It is possible to reduce this to O(2^N) by structuring the calculation recursively, or by applying the divide-and-conquer trick again. The above code uses the divide-and-conquer trick. </li><li>
Encoding the SUM and NUM into a single 64 bit integer, storing them in a simple array, sorting and removing duplicate and non-minimal NUMs, and then using a binary search in the array is also a sufficiently fast method.
</li></ul></p>
<p>
Now about the similarity of this problem to <b>Yarin</b>'s Knapsack problem from SRM 140.
Some coders expressed the opinion that the two problems were in fact the same, or exactly the same algorithm would solve them both. This is not the case and a better understanding of the different types of knapsack problem should clear this up.
<ul><li>
The easiest version of the knapsack problem is the decision problem, does an exact fitting solution exist? return true or false. Even this simplest version is NP-complete.
</li><li>
Then there is the normal knapsack problem, find and return any exact fitting solution if one exists. This problem is the same complexity as the decision problem, but is a tiny bit more complex to code.
</li><li>
Then there is the knapsack with optimizing some parameter, find and return the sum of some parameter over the items in the exact fitting solution which maximizes (or minimizes) the sum of that parameter over each item in the knapsack. LongPipes is in this class with the optimization being minimizing the number of items, so the parameter associated with each item is the constant, one. This algorithm takes more memory, as the parameter sums must be stored, but is the same time complexity as the normal knapsack problem.
</li><li>
Then there is the approximate knapsack problem. Now an exact fit of items into the knapsack is not required. If no exact fit exists then return the combination of items which comes closest to filling the knapsack, without being too large. This problem a bit harder because a hash table
can not be used. Something like a Java TreeMap is required, adding a factor of N to the time complexity (the log of the size of the tree).
</li><li>
Finally there is the 0-1 knapsack problem. An exact fit is not required and the best fit is also not required. The goal now is to optimize the sum of some parameter of the items, while just making sure the knapsack capacity is not exceeded. <b>Yarin</b>'s Knapsack problem is in this class, and the optimization is to maximize the sum of an additional parameter (independent of the sizes) called the "value" of the item.
</li></ul>
</p><p>
Now all of these problems benefit from the divide-and-conquer technique. In all the algorithms except the 0-1 knapsack problem, the items are divided into two groups. All of the combinations of the items in one group are calculated and stored. Then as each combination from the second group is generated a single query is made into the data structure holding the results from the first group. The inner loop processing for these problems is trivial.
</p><p>
In the algorithm for the 0-1 knapsack problem you first divide the items into two groups, then all the combinations of each group are stored in two data structures, possibly just arrays. The two arrays are then sorted and a merging process is used to find the maximum combination subject to the size constraint. The process is much more complex than making a single query into an indexed data structure. I don't know that the time complexity of this step is, but I strongly suspect that it is worse than n log n, where n is the size of the arrays.
</p><p>
So even though both problems use "divide in half" and "generate all the combinations of each half" stages, the rest of the algorithms are quite different. The LongPipes algorithm is much easier and faster and thus allows a maximum problem size of 38. Knapsack allowed a maximum problem size of 34. So if you had a working Knapsack program you probably could not use it to solve LongPipes problems of size 38 without timing out.
So a working solution for LongPipes must be different than a solution for Knapsack.
</p>

                     <p>
                     <img src="/i/m/Rustyoldman_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=282718"><strong>Rustyoldman</strong></a><br />
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
