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
    <A href="/stat?c=round_overview&er=5&rd=10007">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506002" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 327</span><br>Wednesday, November 22, 2006
<br><br>

<h2>Match summary</h2> 

<P>After winning the TCCC '06, <tc-webtag:handle coderId="10574855" 
context="algorithm"/> took his hand at writing the problems for SRM 327. 
Unfortunately he stumbled onto a trap that has befallen other algorithm 
greats before. When writing a problem set you must realize that the target 
audience are mortals. It would have taken a legendary coder to solve all 
three division 1 problems. Both the easy and medium problems were at an 
above average difficulty, which would leave few coders with enough time to 
even attempt the hard. In fact only <tc-webtag:handle coderId="10157606" 
context="algorithm"/> and <tc-webtag:handle coderId="15094447" 
context="algorithm"/> were able to solve the 600 point problem, and only 
<tc-webtag:handle coderId="10157606" context="algorithm"/> was able to solve 
two problems. Thus most of the top scoring coders relied on the challenge 
phase; luckily there were many challenges for the taking, as the submission 
accuracy was very low. Unfortunately none of the 9 submissions to the hard 
problem were able to account for all the beautiful subtleties of the 
problem.
</P>
<P>Division 2 was a bit more stable as several coders were able to solve all 
three problems, including a rather difficult medium. In the end 
<tc-webtag:handle coderId="22401911" context="algorithm"/> was able to edge 
out newcomer <tc-webtag:handle coderId="22654728" context="algorithm"/> due 
to the -25 points from a failed challenge.</P>
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6872&amp;rd=10007" name="6872">FunnyFence</a></b> 
</font> 
<A href="Javascript:openProblemRating(6872)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506002" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      451 / 499 (90.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      384 / 451 (85.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>CoreDumped</b> for 248.29 points (2 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      211.67 (for 384 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
FunnyFence is a simple problem, which asks you to find the largest fence 
in a string. Coming up with an algorithm to solve the problem isn't too 
difficult, but while implementing it you must pay careful attention to avoid 
fencepost errors.
<br /><br />
Typically, to avoid bugs creeping into your implementation, you should 
code up the simplest algorithm you can think of that won't timeout. If you are afraid that the simple solution will timeout, you 
can then make small optimizations until your algorithm is fast enough.
<br /><br />
For example, the simple algorithm for FunnyFence is to go through every 
substring and test it to see if it is a fence. To do each test you can loop 
through each character in the substring and make sure that it is different 
from the one right before it. This will end up looking something like:

<pre>
    smallest=infinity;
    for(start=0 ; start&lt;s.length ; start++)
        for(end=start+1 ; end&le;length ; end++)
            sub = s.subString(start,end)
            if( isFence(sub) )
              smallest = max( smallest, sub.length)
</pre>
isFence() returns true if the substring is indeed a fence. Since 
there are O(n<sup>2</sup>) substrings we will call isFence() a total of 
O(n<sup>2</sup>) times. Each call to isFence() could take up to O(n) time, 
since it examines each character in the substring, so overall this algorithm 
is O(n<sup>3</sup>). Since n is at most 50, we have plenty of time to do the 
O(n<sup>3</sup>) operations.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6600&amp;rd=10007" name="6600">IQTest</a></b> 
</font> 
<A href="Javascript:openProblemRating(6600)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506002" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      323 / 499 (64.73%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 323 (14.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cax</b> for 450.86 points (9 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      320.26 (for 47 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
IQTest would be much simpler if they gave us the values of <b>a</b> and 
<b>b</b> to use -- since they didn't, it is up to our intelligence to determine 
what they are.
<br /><br />
Let's look at the simplest example first. The simplest example is example 
3; there is only one value in the sequence and it is 
<b>previous<sub>0</sub></b> = 0. I can think of many ways to finish this 
sequence. The simplest are {0,0,0...} and {0,1,2,3...}, but there are many, 
many more. In fact any sequence with only one element will have an infinite 
number of ways to continue it.
<br /><br />
Now let's look at the general case. A sequence with at least two 
elements, namely <b>previous<sub>0</sub></b> and 
<b>previous<sub>1</sub></b>. Because of the constraint, if the sequence is 
not buggy, then they must satisfy the constraint: 
<b>previous<sub>1</sub></b> = <b>a</b>*<b>previous<sub>0</sub></b> + 
<b>b</b>. This is one equation with two unknowns (we don't know <b>a</b> or 
<b>b</b>). Since it is a linear equation, we have no hope of solving it for 
both of these variables. But if we knew one of the unknowns, then we could 
solve for the other ones. Well, we can't just magically know <b>a</b>'s 
value, but we can do the next best thing: loop over all possible values for 
<b>a</b> and check for a good value.
<br /><br />
To do this we must answer 3 questions:
<ol>
  <li>What are the possible values for <b>a</b>?</li>
  <li>How do we check if a particular value is good?</li>
  <li>What do we do if multiple values are good?</li>
</ol>
And the three answers are:
<ol>
  <li>It turns out that <b>a</b> can be at most 200 (and  at least -200). 
The trouble is that figuring this out requires a little bit of math. 
Luckily you don't need to know that 200 is the bound, as long as you pick a 
large enough value. The first time I solved this problem I just picked 
1,000,000 as my bound. I used that because it is a large value that I knew 
wouldn't have my program timeout. If you are unsure you can time your 
program with different bounds, or try to do the math to figure out the bound 
exactly.  </li>
  <li>To check if a particular value of <b>a</b> is good you must first 
calculate <b>b</b>. This can be done with the above equation and the first 
two values of our sequence. Since we found <b>b</b>, now you must go through 
each consecutive pair of values in the sequence and see if they satisfy the 
similar constraint: <br />
<b>previous<sub>i</sub></b> = 
<b>a</b>*<b>previous<sub>i-1</sub></b> + <b>b</b><br />
  If this check holds for each i, then you can use the last value in the 
sequence to figure out what the next value must be.  </li>
  <li>Since we are looping through every possible <b>a</b> you should expect 
that many will not pass the check. If we are lucky, only one will 
pass the check -- if so, we can just return the result it produces. If none 
pass the check, then surely there must be a BUG in the sequence given to us. 
Finally, what if multiple <b>a</b>'s pass the check? You might think that 
this means that the sequence is AMBIGUOUS, but that isn't the case. The 
sequence is only ambiguous if the results produced by different <b>a</b>'s 
disagree (and the only way this will happen is if the sequence is of length 
2 and both elements are the same).</li>
</ol>
The other way to approach the problem would be to use the first 3 terms 
of the sequence to give you two linear equations with two unknowns. You can 
solve these to find <b>a</b> and <b>b</b>. But with this solution the two 
term sequence is a special case that many coders didn't handle correctly. 
You must also handle the special case where there are an infinite number of 
solutions, which is similar to the two term sequence case.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6871&amp;rd=10007" name="6871">NiceOrUgly</a></b> 
</font> 
<A href="Javascript:openProblemRating(6871)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506002" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      135 / 499 (27.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 135 (6.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>blmarket</b> for 630.68 points (20 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      483.01 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
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
      327 / 366 (89.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      109 / 327 (33.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>abikbaev</b> for 274.25 points (8 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      185.67 (for 109 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Before getting into the details of the solution I want to introduce some 
terminology that should help:
<ol>
  <li>A string is <i>ugly</i> if it meets the definition in the problem 
statement, even if the string still has question marks within it. '?'s will 
count as neither vowels nor consonants.</li>
  <li>A string is <i>homely</i> if there is some way to change all of the 
question marks to letters in such a way that the resulting string is 
ugly.</li>
  <li>A string is <i>nice</i> if it is not ugly and it contains no question 
marks.</li>
  <li>A string is <i>decent</i> if there is some way to change all of the 
question marks to letters in such a way that the resulting string is 
nice.</li>
</ol>
There are at least two ways to approach this problem. The one I would 
recommend you take during an actual SRM is to use Dynamic Programming. Once 
you see the state, it isn't too bad to code up a solution with memoization. 
One way to represent the state is by the triple: 
&lt;index,vowels,consonants&gt; where <b>index</b> is the location in the 
string that you are currently at, <b>vowels</b> is the number of vowels that 
directly precede location <b>index</b> and <b>consonants</b> is the number 
of consonants that directly precede location <b>index</b>.
<br /><br />
Now you need to memoization functions -- one that determines if a string 
is homely and one that determines if it is decent. The recurrence relation 
just updates the state in a natural way depending upon what the character at 
<b>index</b> is. If the character is a '?' then you make two recursive 
calls, one if that character were to become a vowel and one if that 
character were to become a consonant. The base cases are if the state 
indicates that the string is ugly (namely, if <b>vowels</b> is 3 or if 
<b>consonants</b> is 5) or if you get to the end of the string and know that 
it is not ugly.
<br /><br />
The dynamic programming solution is nice, but you probably had a feeling 
that this problem could be solved in a simpler manner. Yes, there is indeed 
a greedy solution which is simple to code, but as with many greedy solutions 
it is not so easy to prove that it works.
<br /><br />
As with the dynamic programming solution, you will need two methods, one 
to determine if the string is homely and one to determine if the string is 
decent. In addition you should have another method that determines if the 
string is ugly (note that my definition of ugly explicitly tells how to 
treat question marks).
<br /><br />
<b>isUgly()</b>: Loop over all substrings of size 3, and if any one is 
 made entirely of vowels then the string is ugly. Similarly if any 
substring of length 5 is composed entirely out of consonants then the string 
is ugly.
<br /><br />
<b>isHomely()</b>: If a string is homely then when every question mark is 
changed to a character, the resulting string is ugly. The string must either 
be ugly due to vowels or consonants. If the string is ugly due to vowels, 
then every character in the incriminating substring that was a question mark 
was turned into a vowel. Similarly if the string is ugly due to consonants, 
then every character in the incriminating substring that was a question mark 
was turned into a consonant. Thus first change all question marks into 
vowels. If the resulting string is ugly, then the original string is homely. 
Next change all the question marks into consonants. If the resulting 
substring is ugly then the original substring is homely. These two checks 
are sufficient to determine if the string is homely.
<br /><br />
<b>isDecent()</b>: This method is quite a bit more complicated. Think of 
the string "AA?AACCCC?". The first question mark can be changed into a 
consonant, but not a vowel. The second question mark can be changed into a 
vowel but not a consonant. If there is a question mark such that changing it 
to a vowel makes the string ugly, then you must change that question mark to 
a consonant. If there is any question mark such that changing it to a 
consonant makes the string ugly then you must change it to a vowel. 
<b>isDecent</b> keeps looping through the string looking for such a question 
mark and changing any it finds until there are none left. After it changes 
any question mark it also does a check to make sure the resulting string 
isn't ugly, if so then it cannot be decent.
<br /><br />
At some point this process must stop. The magic is that when this process 
does stop without having turned the string into an ugly string, the string 
must be decent (note that the string might still have question marks within 
it).
<br /><br />
For example, look at the string: "A?BBB?A?BBB?A". None of the question 
marks are forced to be either a vowel or a consonant, so <b>isDecent</b> 
would not have changed any of them. How can we change the string into a nice 
one? Look at the leftmost question mark. Since we aren't forced to change it 
to a vowel or consonant, we can pick either, it doesn't matter which we 
choose. So lets pick consonant. Now the string is "AXBBB?A?BBB?A". Changing 
one question mark may result in other question marks being forced. The key 
is noticing that if a question mark becomes forced, then it <i>must</i> be 
the leftmost remaining question mark. Further it must be forced to be the 
opposite of the previous changed question mark. Changing this question mark 
may force another one, and so each leftmost question mark may force the one 
to the right of it, like dominoes falling, with each change switching between 
vowel and consonant. At some point we must come to the last question mark. 
Since at the beginning of this process each question mark could be changed 
either way, and each force only prevents them from one option, the changes 
we are making are all consistent, so the resulting string won't be ugly.
<br /><br />
To put the solution together just make calls to isHomely() and isDecent() 
and if both are true then return "42". If just isHomely is true, then all 
resulting strings must be "UGLY" and otherwise they must all be "NICE".
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6832&amp;rd=10007" name="6832">QuadraticEquations</a></b> 
</font> 
<A href="Javascript:openProblemRating(6832)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506002" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      18 / 366 (4.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 18 (11.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>halyavin</b> for 273.13 points (44 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      256.03 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Think of your favorite algebra teacher. She often has to create tests to 
give to her students to make sure they know how to solve quadratic 
equations. Wouldn't it be nice if she had a program in which she could input a solution and generate many quadratic equations with that solution? (Of course it might not be the best test if all of 
the questions have the same answer). QuadraticEquations problem is much like 
such a program, in fact the solution I'll present could be modified to 
actually give the quadratics.
<br /><br />
To solve this problem effectively relies on a key insight. Since you want to create the quadratic from the polynomial you must do the 
opposite of what the students do when they solve a quadratic equation -- they 
solve the equation by factoring the quadratic, so we must do the opposite of 
factoring. Multiplication is the key.
<br /><br />
It turns out there are two main cases, and it's easier to solve each 
independently. Before I introduce the cases I'm going to make one slight 
note, instead of having the solution:
<br /><br />
(x+ y*sqrt(d) )/z
<br /><br />
We can set y = y<sup>2</sup> * d to reduce the number of corner cases and 
have the solution:
<br /><br />
(x + sqrt(y) )/z
<br /><br />
Now the two cases depend on whether or not y is a perfect square.
<br /><br />
<b>Case 1: Y is not a perfect square</b><br />
The quadratic formula tells us that a quadratic equations have two 
solutions, and the difference between the solutions is the sign of the 
square root of the determinant. Since Y is not a perfect square, sqrt(Y) is 
not rational, so this must be the square root of the determinant. Namely the 
other solution to the formula must be:
<br /><br />
(x - sqrt(Y)) /z 
<br /><br />
Since we know both solutions, and our algebra teacher instilled in us 
the knowledge that each factor must be of the form (t-solution), we now know 
both factors of the quadratic. However, there might also be some other 
constant factor. To find each equation we can find one equation and then 
reduce the coefficients by the greatest common factor. This will give us the
smallest equation. Then we can keep on multiplying by integers until one of 
the coefficients becomes too large to get the rest. The first equation we 
get will just be the product of our two factors:
<br /><br />
[t - (x + sqrt(Y)) /z] * [t + (x - sqrt(Y)) /z]
<br /><br />
And this just so happens to come out to:
<br /><br />
z<sup>2</sup> t<sup>2</sup> -2xz t + x<sup>2</sup>y
<br /><br />
<b>Case 2: Y is a perfect square</b><br />
In this case set x= x+sqrt(y), since sqrt(y) is an integer. Thus the 
solution is x/z, which is a rational number. Let p/q be this rational number 
written in lowest terms with q positive. Since p/q is a root, (qt-p) is a 
factor of a*t<sup>2</sup>+b*t+c. Let (ut-v) be the other factor. The problem 
is we don't know what u and v are. I shall first show that u and v are 
integers.
<br /><br />
Let's let a quadratic with p/q as the solution be: a t<sup>2</sup> + bt + 
c, so we get the following equations:
<br /><br />
at<sup>2</sup> + bt + c = (qt-p) (ut-v) = qu t<sup>2</sup> - (pu + qv)t + 
pv
<br /><br />
Thus a= qu, b= -(pu+qv), and c=pv.
<br /><br />
So if we can show that a is divisible by q, then we would know that u is 
an integer. Likewise if we can show that c is divisible by p then v is an 
integer. Luckily we can show this by using the fact that p/q is a 
solution:
<br /><br />
a(p/q)<sup>2</sup> + b(p/q) + c = 0
<br /><br />
ap<sup>2</sup>/q<sup>2</sup> + bp/q + c = 0
<br /><br />
ap<sup>2</sup> + bpq + cq<sup>2</sup> = 0
<br /><br />
If we look at this equation modulo q, then we get ap<sup>2</sup> = 0 (mod 
q). Since p and q are relatively prime this implies that a = 0 (mod q) which 
is the same as saying that q divides a. Likewise, looking at the equation 
modulo p, we get that p divides c. So now we know that u and v are integers, 
but we still do not know their values.
<br /><br />
As is common in such situations, if we don't know two variables we can 
loop over one variable and solve for the other. To figure out which variable 
to loop over we can use the above equations. Since -k &le; a &le; k it must 
be the case that -k/q &le; u &le; k/q. This gives us some reasonable values 
to loop over, so we will try every possible value of u. Now we must count 
how many v's are possible given this particular value of u.
<br /><br />
The constraint that -k &le; c &le; k means that -k &le; pv &le; k. So it 
must be the case that <u>abs(v) &le; abs(k/p).</u>
<br /><br />
Similarly we get a constraint from -k &le; b &le; k. This time we get -k 
&le; -pu-qv &le; k.
<br /><br />
That puts bounds on v such that: <u>(-k+pu)/q &le; v &le; (k+pu)/q</u>.
<br /><br />
The two underlined equations describe all possible v's, and these are the 
only constraints, so finding the intersection of these two intervals will 
give you the number of solutions for a particular value of u.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6834&amp;rd=10007" name="6834">PostfixRLE</a></b> 
</font> 
<A href="Javascript:openProblemRating(6834)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506002" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      9 / 366 (2.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 9 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>null</b> for null points (NONE) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is quite involved. You are given a postfix expression and 
asked to optimize it according to RLE-size. To do this optimization you may 
make free use of associativity and commutivity. The solution to this problem 
can be done in phases. The first phase is to parse the expression into a 
more suitable form, namely a syntax tree. Next we must modify the syntax 
tree to take into account associativity. Finally we take into account 
commutivity to get the optimal size.
<br /><br />
<b>Step 1: Building the syntax tree</b><br />
<div style="float:left;"><img src="/i/srm/srm327/firstdraft.png" alt="firstdraft" /></div>
A syntax tree has a node for each character in the input. If the 
character is a variable, then it will be a leaf in the tree. If the 
character is an operator, then it will become an intermediate node in the 
tree, with its operands as its children. The picture is of the syntax tree 
for the expression "bcb+*ab+**".
<br /><br />
The problem statement gave a hint about how to construct the parse tree. 
Create a "stack calculator" program, loop through each character and, if it 
is a letter, create a new leaf node and push that on the stack. If it is 
an operator, then create a new intermediate node, pop off two nodes from the 
stack, and add the two nodes as children to the new node. For a well-formed 
postfix expression you should never have to pop from an empty stack and the 
stack will have exactly one node on it at the end. Note the difference 
between this algorithm and that for evaluating the expression: here we are 
placing nodes of a tree onto the stack, not the values of intermediate 
expressions.
<br clear="all" />
<br />
<b>Step 2: Modifying the syntax tree to account for associativity</b><br />
<div style="float:left;"><img src="/i/srm/srm327/associativity.png" alt="associativity" /></div>
What does associativity mean in a syntax tree? If you take a look at the 
previous tree, you could apply associativity between the red and blue *'s. 
The left child of the red * is (b*(a+b)); the children of the blue * are b 
and (c+b). Associativity says that we must multiply these three 
sub-expressions together, but it does not matter which of the two 
multiplications we do first.
<br />
<br />
We can express this by merging the two * nodes into one node that has 
three children. If the operation is not commutative then we must be careful 
to not change the order of the sub-expressions. So we must go through the 
entire tree and if any operator node has a child which is the same 
operation, then we merge the two nodes. Doing this to the above example 
yields the image to the left.
<br clear="all" />
<br />
<b>Step 3: Account for commutivity and finding the optimal size</b><br />
Associativity says the order of the operators doesn't make a difference. 
Commutativity, on the other hand, says the order of the operands doesn't 
make a difference. This means that we can order the four subtrees "b", 
"ab+", "b", and "cb+" into an order which yields the smallest overall size. 
To do this we are going to be somewhat greedy. I will assume that each of 
the subtrees has already been processed, so we know the resulting size of 
each subtree. Thus this algorithm is working from the bottom up through the 
syntax tree.
<br />
<br />
The first thing to note is that we would like to have all 3 
multiplications be right next to each other in the final expression. This 
means that we will compute the 4 subtrees first, so that when evaluating the 
expression stack will have 4 values on it when it starts to do the 
multiplications. So in general the postfix form of a node will be: 
"&lt;subtree&gt;&lt;subtree&gt;&lt;subtree&gt;&lt;operator&gt;&lt;operator&gt;".
<br /><br />
This means the resulting RLE size will be the sum of the sizes for the 
subtrees + 1. Well, almost, but not quite -- if the first character to start a 
subtree is also the last character to end the subtree before it, we get a 
savings of exactly 1. So now we must optimize the amount of savings.
<br />
<br />
The start of every subtree must be a variable (if not, then to evaluate 
it your first action would be to pop from an empty stack). If the root of a 
subtree is an operator, then the last character in the sub-expression must 
also be that operator. If the subtree is just a variable then it begins and 
end with that letter.
<br /><br />
This allows us to put the sub-expressions into two different sets: the 
variables and the operations. In the example above we have 2 variables "b" 
and "b" and two operations "ab+" and "cb+". Now we must figure out how to 
order the variables and operations. One simple observation is that if you 
have two variables that are the same character, then you should always put 
them next to each other. This yields a savings of 1, which is the most you 
can get from any placing. Also note this doesn't prevent 
any future placings, since after combining the variables they have exactly 
the same starting and ending letters. So we can combine "b" and "b" into 
"bb", or equivalently we can assume there is just one "b".
<br />
<br />
We don't get a savings by putting two different variables together, 
because they are different characters. And we don't get any savings by 
putting two operations together, because they end with operators. Thus we 
must combine operators with variables. Yes, you guessed it; those are two 
disjoint sets with which we must make as many pairings as possible: <A 
Href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=maxFlow2">Maximum 
Bipartite Matching</A>. 
<br />
<br />
There's one slight problem now. In order to do the matching, we must know 
what variables are valid starting points for the sub-expressions. Since we 
are doing this recursively, in a bottom up fashion, I will assume each 
sub-expression tells us which variables it can start, but we must figure out 
with which variables the entire expression can start. For example, the 
sub-expression "ab+" knows it can start with either a or b, and the 
sub-expression "cb+" knows it can start with either b or c.
<br />
<br />
For the example, we have the sub-expressions "b", "cb+" and "ab+" (I 
removed the other "b" because it will always be matched with the first "b"). 
If we match the "b" with "ab+" then we can start the entire expression with 
the "cb+" so c is a possible starting variable. If we match the "b" with 
"cb+" then we can start the entire expression with "ab+" so a is a possible 
starting variable. Or we can start the entire expression with the "b" that 
we are using to do the match. So, in general, we can start the entire 
expression with either any of the single variable sub-trees, or any valid 
starting variable of an <i>unmatched</i> operation sub-trees.
<br />
<br />
The tricky part is making sure the operation is unmatched. How can we verify 
this is the case? The simplest way is to just run the bipartite matching 
routine without including a particular operation. If the size of the 
matching obtained from this call is the same as that obtained by allowing 
every operation to participate, then we know that this particular operation 
can be left unmatched. So loop through each operation and, if you don't need 
to match it, then add all its valid starting variables to the list of 
starting variables of the entire expression.
<br />
<br />
<b>Conclusion</b><br />
This was a very nice problem that touches on many different aspects of 
programming. Speaking to <tc-webtag:handle coderId="272072" 
context="algorithm"/> in the practice room, he had this to say: "This 
problem has it all: a greedy algorithm you have to intuit, a tricky parsing 
problem, <i>and</i> a max flow with additional queries."
</p>



<div class="authorPhoto">
    <img src="/i/m/Ryan_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="284007" context="algorithm"/><br />
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
