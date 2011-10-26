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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505867" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 301</span><br>Tuesday, May 9, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This was the first competition after the TopCoder Open finals. Some of the TCO finalists tried for a rematch, while the coders who hadn't made it to Vegas finally got the chance to compete after almost two weeks.
</p>
<p>
In division 1, the problem set seemed a little strange one: it began with a 250 that was not that easy, followed by a simple straightforward 450 in the medium spot, and then a really difficult and tricky 1,000 pointer. The final positions were not clear until the end of the system tests, with more than 25 submissions of the hard problem failing at that point. The challenge phase also proved crucial, with lots of points gained that substantially affected final scores.</p>
<p> misof won the competition with good performances in medium and hard problems, a not-so-bad one in the easy one, and the help of two successful challenges. A little more than 50 points behind him, the TCO champion Petr showed that he always has the resources for a comeback. After resubmitting the first problem and finishing the coding phase out of the top 10 &mdash; something he is not used to  &mdash; Peter got 5 successful challenges, and just one unsuccessful one, to secure second place. Finishing a little more than 200 points behind them was a pack of 5 other experienced red coders. AdrianKuegel, fuwenjie, tmyklebu, andrewzta and John Dethridge completed the exclusive top 7 that correctly solved the hard problem. </p>
<p>
In division 2 things were similar, with only 2 coders correctly completing the hard problem to get the first two spots, without getting the medium, and the rest trying to correctly get the tricky medium after quickly solving a pretty simple easy one.<br/>
it4.kp finished with the victory thanks to his fast solution of the easy one and the highest-scoring surviving hard solution. The rookie cae, with the other correct submission on the hard problem, easily took second place over another first-timer, DeatH FaNG, who managed to get the bronze with the fastest submission on the medium and a pretty quick easy one.
</p>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6224&amp;rd=9822" name="6224">InsertionSortCount</a></b> 
</font> 
<A href="Javascript:openProblemRating(6224)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505867" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      313 / 348 (89.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      256 / 313 (81.79%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Patriot</b> for 249.23 points (1 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.39 (for 256 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>The simplest to think approach to solve this problem was to simulate the algorithm (translating the pseudo-code given in the problem statement to your favorite language), simply adding a counter for keeping the number of moves updated and return it at the end.</p>
<p>But, as in most cases, there is an easier, less error-prone and shorter and therefore faster to code implementation. If you can come up with it fast enough, the difference in coding will even be worth the time lost when thinking it.</p>
<p>The first thing we have to ask ourselves when looking at this problem is: When is a number going to be moved? If we solve that, the implementation will be straightforward. There are two ways to look at it that leads to the same final code:</p>
<p> 1. When inserting ith number, which numbers will move?<br/>
2. When is jth number going to be moved?</p>
<p>The answer to the first question is exactly the number of elements greater than the ith element that appear before it, because they are going to be in R by the time the ith element is added to it</p>
<p>The answer to the second question is once for each smaller number that is inserted after it. The elements that come before can't move it, because it is not even in R yet, and the greater elements that come after in the input are not going to move it, because they are inserted in R after it.</p>
<p>Both answers give us the final idea: The number of moves is the number of pairs (i,j) i&lt;j such as A[i]&gt;A[j]. Implementation for this is really simple:</p>
<pre>
int r=0;
for(int j=0;j&lt;n;j++)for(int i=0;i&lt;j;i++) if (A[i]&gt;A[j]) r++;
return r;
</pre>
<p>For more about Insertion Sort and other sorting algorithms you can read the <a href="/tc?module=Static&d1=tutorials&d2=sorting">sorting tutorial</a>.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6172&amp;rd=9822" name="6172">IndicatorMotionReverse</a></b> 
</font> 
<A href="Javascript:openProblemRating(6172)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505867" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      152 / 348 (43.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 152 (16.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>rajkon</b> for 298.58 points (27 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      221.86 (for 25 correct submissions) 
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
      311 / 347 (89.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192 / 311 (61.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Kawigi</b> for 222.82 points (10 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      151.63 (for 192 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>For participants who took part on SRM 298 or tried the division 2 easy problem for that contest in the practice room, this one may have sound familiar. Actually, what we have here is the calculation of the inverse function of the one asked in that problem. But this case was a little trickier.</p>
<p>The first thing to note here is that given the actual state and the following one, there is exactly one instruction that can make that conversion (each one of the four instructions gives a different next state in all cases), so the sequence of plain instructions (without the repetition counter) is unique and can be easily calculated by iterating the states and having a nextState function that given two characters returns the instruction needed. This function can be implemented with a bunch of if's, a precalculated table or making use of the order that states have and their relation with the instructions. For details about this, check SRM 298 editorial for the division 2 easy problem.</p>
<p>With that sequence calculated, all we need is the shortest and lexicographically first program taking reptitions. Of course we will have all consecutive appearances of the same instruction together to have a shorter program. If there are n&gt;99, we have to split between several instructions as in example 4, so we proceed as follows: We need at least n/99 (rounded up) instructions, so we will have exactly that amount to keep the program as short as possible. Since the first one is the one that counts for the lexicographic comparisson, we'll make that instruction the one with less number of repetitions (because smaller numbers come first lexicographically than bigger ones). Seeing all this, is clear that all but the first of the generated instructions will have a 99 as counter, and the first one will have exactly the rest (which may also be 99 if the number of repetitions is an exact multiple of 99).</p>
<p>When all this is done, the only thing needed at the was to check if the return program has more than 100 characters and adjust the length according to the problem statement.</p>
<p>See Kawigi's <a href="/stat?c=problem_solution&rm=248572&rd=9822&pm=6172&cr=8416646">solution</a> for a clean implementation.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6221&amp;rd=9822" name="6221">CorrectingParenthesization</a></b> 
</font> 
<A href="Javascript:openProblemRating(6221)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505867" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      72 / 348 (20.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 72 (2.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>it4.kp</b> for 690.55 points (21 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      677.07 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>What we have here is a classical dynammic programming problem. When seeing just one string as input and some counting as output, usually DP is the way to go. In division 2, maybe some coders are not that used to it, but this problem is classical and may be one excellent chance to learn how to apply it, because the idea and implementation is quite clear.
In the rules for making a well formed string given in the problem statement a string is "built" based on other smaller strings. This already has a smell to a recursive function. Also, since every rule use substrings (consecutive sets of characters included in the string to be formed) and a string has O(n<sup>2</sup>) substrings (for an introduction to the big O notation, check the <a href="/tc?module=Static&d1=tutorials&d2=complexity1">algorithm complexity tutorial</a>), this function has a very restricted domain (50x50=2500 at most), so memoization in a table will be quite possible.</p>
<p>First let's try to see whether s is a well formed string and that will lead us to the solution. Let's call f(i,j) to the functiont that says wether the substring that starts in ith character of s and ends in the jth character is a well formed string for each i,j.<br/>
if i&gt;j, f(i,j) = true, because we are representing the empty string. Otherwise:<br/>
f(i,j) = ( f(i+1,j-1) AND enc(s[i],s[j]) ) OR there is a k, i&lt;k&lt;j such as f(i,k) AND f(k+1,j)<br/>
where enc(c,d) will be true only when c is an opening character and d a matching closing one. This is easy to implement as a recursive function, but what we need is the number of characters to correct. All we need to see is that, for each case in the above specification, we can check how many characters are needed to change to accomplish it. In the first case, it depends on s[i] and s[j], can be 0 if they match, 1 if they don't but at least one of them "points" to the inside, so changing the other will make them match, or 2 if both are pointing outside. In the other cases, is simply f(i,k) + f(k+1,j). So we take the minimum between this options and we are done. Also note that you always need (j-i+1) even, because an odd string is never a correct parenthesization. Implementation in C++ follows:</p>
<pre>
int mem[51][51];
string s;
int enc(char c, char d) {
   string p="([{)]}";
   if (p.find(c)/3&gt;0 && p.find(d)/3&lt;1) return 2;
   if (p.find(c)%3==p.find(d)%3 && c!=d) return 0;
   return 1;
}
int calc(int i, int j) {
   if (i&gt;j) return 0;
   if (mem[i][j]&gt;=0) return mem[i][j];
   int r=calc(i+1,j-1)+enc(s[i],s[j]); //enc returns 0, 1 or 2 as stated above
   for(int k=i+1;k&lt;j;k+=2) r = min(r,calc(i,k)+calc(k+1,j));
   mem[i][j]=r;
   return mem[i][j];
}
int getMinChanges(string s) {
   this-&gt;s=s;
   for(int i=0;i&lt;s.size();++i)for(int j=0;j&lt;s.size();++j) mem[i][j]=-1;
   return calc(0,s.size()-1);
}
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6222&amp;rd=9822" name="6222">EscapingJail</a></b> 
</font> 
<A href="Javascript:openProblemRating(6222)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505867" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297 / 347 (85.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      226 / 297 (76.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 444.87 points (3 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      368.54 (for 226 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>Here we have prisoners and chains between them, and, if familiarized with graphs, this is the first thing that comes in mind when looking a scenario like this one. We can model the problem by having a graph with a node for each prisoner and an edge for each chain labeled with the length of the chain. There will be no edge between nodes representing unchained prisioners.</p>
<p>Now, the next step is to know what limits the maximum distance two prisoners can achieve. It should be clear from the first example that is not necessarily the length of the chain between them, because the sum of lengths of a "chain path" from one to the other could be shorter. This thought says it all: What limits their distance is a path of chains from one to the other. Of course it will be the shorter of all paths between a pair the one that have the upper bound we are looking for.</p>
<p>To find such shortest path in a graph there are several algorithms, but the one that fits better here is <a href="http://en.wikipedia.org/wiki/Floyd-Warshall_algorithm">Floyd-Warshall</a> all pairs shortest path algorith. Firstly, because we need the shortest path between all pairs to find the best one, and secondly, because it is the easiest and shortest to implement. With all the shortest paths (ie. upeer bounds) calculated, we simply iterate over all pairs to find the longest and return it. If there is a pair of prisoners that does not have any path connecting them (represented by a path of "infinite" length in the simpler implementation of Floyd-Warshall), it means they can achieve any distance, so we return -1.</p>
<p>For a simple implementation of this see reid's <a href="/stat?c=problem_solution&rm=248580&rd=9822&pm=6222&cr=260835">solution</a>.</p>
<p>More formally, what this problem is asking to find the diameter of a graph, which is exactly the longest of all shortest paths between all pairs of vertices. For articles about this and other subjects in graph theory, check <a href=http://mathworld.wolfram.com/GraphDiameter.html>http://mathworld.wolfram.com/GraphDiameter.html</a>.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6210&amp;rd=9822" name="6210">ContextFreeGrammars</a></b> 
</font> 
<A href="Javascript:openProblemRating(6210)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505867" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      36 / 347 (10.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 36 (19.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>misof</b> for 662.35 points (22 mins 54 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      509.11 (for 7 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>This problem was a really difficult one, only 7 coders manage to correctly solving it, all experienced red coders with over 2500 rating points.</p>
<p>There were two approaches that i know of to solve it, one that is pure dynammic programming with a couple of "happy ideas" and another one (that misof told me after the end of the match) making use of language theory. I will explain the first approach because theory background is not needed to understand it and add some comments on the second approach at the end.</p>
<p>This approach consists, as most dynammic programming, in defining a recursive function possible to memoize in a table, that solves the problem. If you are familiarized with DP, and you should in order to take this problem, you know that once you get the recursive function in order, all the rest is just carefull dumb programming.</p>
<p>As string parsing usually does, what we need is a function over all the substrings of <b>word</b>. Since every substring can be defined with a start and end index (i will call them i and j), we have less than 35x35=1225 substrings to cover. We have plenty of space left for more parameters. When seeing the trees on the examples, the option comes to mind. If we add a char <b>seed</b> as an aditional parameter we have our function.</p>
<p>f(i,j,c), then, will say the number of parsing trees that the substring between i and j has using c as a seed. Of course, f(0,n-1,<b>seed</b>) it's the final answer to the problem, where n is the size of <b>word</b>. Also, f has a domain of size 35x35x26=31850, which is perfectly fine for the memory limits.</p>
<p>
So, how to recursively define f(i,j,c)? Let's call s to the substring of <b>word</b> that goes from index i to index j. First, we have to try using all rules that have c in its left side. For each of this rules, r, we need to "break" s into little substrings to assign to each letter in the right side expression of r. We are actually matching s into r, with uppercase letters acting as variables and lowercase letters as constants. Of course, if r is made only with a couple of nonterminals, for example, the number of possible partitions (ie. ways to match it) is clearly exponential, and we will run out of time. But this part sounds a lot like another well known dynammic programming problem, partition a string into substrings and do something with them. Since what we have to do with each part is independent, we can just mantain an index on s (or the right side of r) and do it recursively.</p>
<p>This leads to the definition of a new function g(i,j,r,p) where r is a rule of <b>rules</b> (after correctly parsing it into all rules without pipes) and p is a position on it. At first glance it will seem the domain for this function is 35x35x500x35 aproximately, because there can be close to 500 rules and the limit on the length of each rule is 35 (rules that have an expression with more than 35 letters are clearly useless). But, the number of positions over all rules can never be greater than 2500, because that's the maximum number of total characters of <b>rules</b>, so the domain of this function is actually bounded by 35x35x2500=3062500, which is small enough to fit in topcoder memory limits. So to memorize g we will use a 3 dimensional array with the first two dimensions having size 35 for i and j, and the other one having size 2500 to memoize r and p together.</p>
<p>For details on how to map r and p to a number, see the code below. You can also do this part by having two dimensions and variable size arrays.</p>
<p>Now, we define f and g in terms of smaller versions of themselves:
<pre>
f(i,j,c) = sum over all rules r that have c as left side of g(i,j,r,0)
g(i,j,r,p) {
   if (p&gt;=size of r) {
      if (i&gt;j) return 1 else return 0
   }
   if (i&gt;j) return 0
   let RS be the string on the right side of the rule r
   if (RS[p] is lowercase) {
      if (RS[p] == <b>word</b>[i]) return g(i+1,j,r,p+1) //advance to next letter
      else return 0 //failed match
   } else {
      //we decide which substring starting in i
      //we assign to the current nonterminal RS[p]
      res = 0
      for k from i to j, inclusive:
         res = res + f(i,k,RS[p]) * g(k+1,j,r,p+1)
      return res
   }
}
</pre>
<p>If we memorize the results of this two functions, we'll be on our way. The total number of calls to the first function is it's domain size 31850 multiplied by the length of one run, that is bounded for the maximum number of rules 500, in total, in the order of 31850x500=15925000 total operations are made to calculate all calls of f.</p>
<p>The cost of calculating all calls of g are bounded in a similar way by 3062500x35=107187500, taking into account the generosity on the rule bounds, is not bad.</p>
<p>If we get rid of f and try to use only g, the running time of each call will grow because we wont be memoizing the repetition of sums over each letter, and we'll go over the time limit.</p>
<p>Now that we have functions that do the work and run in time, all we have to do is do the boring part of writing the C++/Java/VB/C# code and parse that annoying input. I won't get into details on how to do this because there are several ways in each of the languages, all with advantages and disadvantages.</p>
<p>To have a little summary of the "happy ideas" used, there were basically three:<br/>
1. The most basic one, use DP and indexes to represent substrings and add some extra parameters needed to count parsing trees.<br/>
2. Use two mutually dependent functions, neither one of them is ok by itself.<br/>
3. Memorize g correctly, to get it to fit in memory limits. Multiplying the range on each parameter is sometimes an upper-bound too high.</p>
<p>I will copy-paste my original solution in Java now, even though it's a little long, because it's the easier to follow with this editorial (because both were written by the same person). You are more than welcome to check the code from the 7 coders that correctly solved the problem and see their implementations. Some are clear enough to look at, and a couple are just-to-be-written-not-read code. I think many of them use the approach presented in this editorial, even though they do not have the two functions presented here defined right there, but the background idea is there.</p>
<pre>
char w[]; //word
int offset[]; //to map r,p into a number
int endR[], iniR[]; //init and end of the rules with each letter in the left side
char expr[][]; //expressions of each rule
static int maxRules = 600;
static int maxChars = 26;
static int maxCharsRules = 46;
static int maxPosRules = maxCharsRules*50;
static long LIMIT = 1000000000;
   
boolean term(char c) {
   return c&gt;='a' && c&lt;='z';
}

long memoRP[][][];
long cRP(int i, int j, int r, int p) { //the g function in the above description
   char[] e=expr[r];
   if (i==j && p==e.length) return 1;
   if (i&gt;=j || p&gt;=e.length) return 0;
   int h=offset[r]+p;
   if (memoRP[i][j-1][h]&gt;=0) return memoRP[i][j-1][h];
   long ret=0;
   char c=e[p];
   if (term(c)) {
      if (c==w[i]) ret=cRP(i+1,j,r,p+1);
   } else {
      int hc=c-'A';
      int lim = j-e.length+p+1;
      for(int k=i+1;k&lt;=lim;++k) {
         ret += cS(i,k,hc)*cRP(k,j,r,p+1);
         if (ret&gt;LIMIT) {
            ret=LIMIT+1;
            break;
         }
      }
   }
   return memoRP[i][j-1][h]=ret;
}

long memoS[][][];
long cS(int i, int j, int h) { //the f function in the above description
   if (memoS[i][j-1][h]&gt;=0) return memoS[i][j-1][h];
   long ret=0;
   for(int r=iniR[h];r&lt;endR[h];++r) {
      ret += cRP(i,j,r,0);
      if (ret&gt;LIMIT) {
         ret=LIMIT+1;
         break;
      }
   }
   return memoS[i][j-1][h]=ret;
}

public int countParsingTrees(String[] rules, char seed, String word) {
   Arrays.sort(rules);
   offset = new int[maxRules];
   w=word.toCharArray();
   memoRP=new long[w.length][w.length][maxPosRules];
   for(int i=0;i&lt;w.length;++i)
   for(int j=0;j&lt;w.length;++j)
   for(int k=0;k&lt;maxPosRules;++k) memoRP[i][j][k]=-1;
   memoS=new long[w.length][w.length][maxChars];
   for(int i=0;i&lt;w.length;++i)
   for(int j=0;j&lt;w.length;++j)
   for(int k=0;k&lt;maxChars;++k) memoS[i][j][k]=-1;
   iniR=new int[maxChars];
   for(int i=0;i&lt;maxChars;++i) iniR[i]=100000;
   endR=new int[maxChars];
   expr=new char[maxRules][maxCharsRules];
   int nr=0;
   for(String rs : rules) { //parsing time!
      int h=rs.charAt(0)-'A';
      iniR[h]=Math.min(iniR[h],nr);
      String[] p = rs.substring(6,rs.length()).split(" \\| ");
      for(String e : p) {
         expr[nr]=e.toCharArray();
         offset[nr+1]=offset[nr]+e.length();
         ++nr;
      }
      endR[h]=Math.max(endR[h],nr);
   }
   int r=(int)cS(0,w.length,seed-'A');
   return r&lt;=LIMIT?r:-1;
}
</pre>
<p>
A few words about the other approach i talked about. The idea required a little language theory and knowledge of Context Free Grammars and the <a href="http://en.wikipedia.org/wiki/Chomsky_normal_form">chomsky normal form</a>. Since there's an efficient algorithm to convert any grammar to a chomsky normal form equivalent one, we can first do that transformation. As you can see, in chomsky normal form there is no need for the g function we discussed previously, because f can be directly implemented with a single loop that makes the partition between the only 2 nonterminals, if that's the case of that rule. This bound of 2 nonterminals gives us a bound of at most j-i partitions, instead of an exponential explosion, and eliminates the need for the g function. For an implementation with this idea see misof's <a href="/stat?c=problem_solution&rm=248574&rd=9822&pm=6210&cr=8357090">solution</a>.
</p><div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
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
