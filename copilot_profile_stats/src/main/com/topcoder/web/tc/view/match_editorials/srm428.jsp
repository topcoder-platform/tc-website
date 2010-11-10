<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 428 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13515">Match Overview</a><br />
    <tc-webtag:forumLink forumID="524728" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 427</span><br />Tuesday, December 2, 2008
<br /><br />


<h2>Match summary</h2> 

<p>

This SRM featured the 4th problemset written by 

<tc-webtag:handle coderId="13351270" context="algorithm"/>, this time all problems were about strings.

In Div-1 coders were proposed a straightforward easy, a strong medium and a very tough hard

problems. However, the number of really hard cases in the Hard was small and it was possible

to precompute the answers for them. Among those who went this way, 4 coders were able to solve

the Hard problem, what allowed them to take first 4 places even despite the fact that two

of them didn't solve the Medium. Match victory went to 

<tc-webtag:handle coderId="19849563" context="algorithm"/> who solved all 3 problems and

made the fastest submission on 1000-pointer overall. The second place was taken by 

<tc-webtag:handle coderId="251074" context="algorithm"/>, who also

solved all problems. 

<tc-webtag:handle coderId="11919691" context="algorithm"/> rounded up the Top-3 and 

<tc-webtag:handle coderId="10597114" context="algorithm"/> took 4th place, they both didn't

even submit the medium problem.

</p>

<p>

In Div-II the set was significantly easier. The first three places were taken by 

<tc-webtag:handle coderId="22716354" context="algorithm"/>, 

<tc-webtag:handle coderId="22681392" context="algorithm"/>

and 

<tc-webtag:handle coderId="21372851" context="algorithm"/>, solving all 3 problems. 

<tc-webtag:handle coderId="22697421" context="algorithm"/>, author of the fastest 1000-pointer, finally occupied only 16th position, because

his submission on the medium was successfully challenged.

</p>

 

<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10182&amp;rd=13519" name="10182">ThePalindrome</a></b> 

</font> 

<A href="Javascript:openProblemRating(10182)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524728" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      630 / 758 (83.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      453 / 630 (71.90%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>mbr1</b> for 247.63 points (2 mins 47 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      187.26 (for 453 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

First, note that the answer in this problem is not large. If we append to <b>s</b> all its characters in reverse order,

the resulted string will be a palindrome, so the answer does not exceed twice the length of <b>s</b>. Therefore, for each i

between 0 and length of <b>s</b> we need to answer the following question: does it possible to append i characters to the

end of <b>s</b> to obtain a palindrome? The answer for our problem is simply (the smallest among appropriate i's) +

(the length of <b>s</b>).

</p>

<p>

If want to append i characters to make a palindrome, there's actually no any choice in what exactly characters to append.

The last appended character must be the same as the first character of <b>s</b> (otherwise it won't be a palindrome for

sure), the last but one appended character must be the same as the second character of <b>s</b>, and so on. In other words,

we should append the first i characters of <b>s</b> in reverse order. Of course, after these characters are added, the result

is still not guaranteed to be a palindrome, so this needs to be additionally checked.

</p>

<p>

This approach can be implemented in Java as follows:

</p>

<pre>

public class ThePalindrome {

  boolean isPalin(String s) {

    for (int i=0; i&lt;s.length(); i++)

      if (s.charAt(i) != s.charAt(s.length()-i-1))

        return false;

    return true;

  }



  public int find(String s) {

    for (int i=0; ; i++) {

      String tmp=s;

      for (int j=i-1; j&gt;=0; j--)

        tmp += s.charAt(j);

      if (isPalin(tmp))

        return i + s.length();

    }

  }

}

</pre>

<p>

<i>Excercise (not of DII-Easy level).</i> The described solution of the problem has a complexity of O(n^2)

and works very fast when n &le; 50. Find a solution for this problem that will work

for n &le; 100,000 (it should have a complexity of O(n * log n) or even O(n)).

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10180&amp;rd=13519" name="10180">TheLuckyString</a></b> 

</font> 

<A href="Javascript:openProblemRating(10180)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524728" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      314 / 758 (41.42%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      200 / 314 (63.69%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>samsam</b> for 496.57 points (2 mins 21 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      381.42 (for 200 correct submissions) 

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

      586 / 624 (93.91%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      535 / 586 (91.30%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>JongMan</b> for 249.56 points (1 mins 11 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      218.62 (for 535 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Since <b>s</b> contains at most 10 characters, there are at most 10!=3,628,800 ways to permute its letters. This

is not too much, so nothing

prevents us from checking all strings that can be obtained by permuting the characters of <b>s</b> and calculate how

many of them are lucky. The most natural way to implement this is using recursion. Our recursive method will try to assign

characters of <b>s</b> to positions 0, 1, ..., L-1, in order (where L is the length of <b>s</b>), in all possible ways,

and so that they form a lucky string. It takes two parameters - integer <i>pos</i> is a position we are

currently filling and character <i>prev</i> is the character we've put onto the previous position. There's also a

global array <i>have</i> of 26 integers, where <i>have</i>[i] is how many i-th (in alphabet) letters we currently

have. For each letter <i>c</i> in alphabet such that we <i>have</i> this letter and it is different

than <i>prev</i>, we try to put this letter on position <i>pos</i> (we can't put the letter <i>prev</i> on position <i>pos</i>

because we want to generate only lucky strings). To do this, we decrease the number of occurrences of the letter <i>c</i> in <i>have</i>

by 1, recursively call the method with parameters <i>pos</i> + 1 and <i>c</i>, and than restore the state of <i>have</i>

by increasing the number of occurrences for <i>c</i> by 1. If in some call <i>pos</i> = L, it means that we've just generated one

more lucky string, so we increase some global counter <i>cnt</i> by 1. The search is initiated by a call with parameters <i>pos</i>=0

and <i>prev</i>=' ' (or some other character that is not a letter - to indicate that every character can be put at position 0).

The answer is the value of counter <i>cnt</i> after the method has completed its work.

</p>

<p>

The actual code appears to be shorter than its explanation given in the previous paragraph. Java implementation follows.

</p>

<pre>

public class TheLuckyString {

  int[] have = new int[26];

  int cnt = 0, L;



  void solve(int pos, char prev) {

    if (pos == L) {

      cnt++;

      return;

    }

    for (char c = 'a'; c &lt;= 'z'; c++)

      if (prev != c && have[c - 'a'] > 0) {

        have[c - 'a']--;

        solve(pos + 1, c);

        have[c - 'a']++;

      }

  }



  public int count(String s) {

    L = s.length();

    for (int i=0; i &lt; L; i++)

      have[s.charAt(i) - 'a']++;

    solve(0, ' ');

    return cnt;

  }

}

</pre>

<p>

<i>Excercise.</i> The described solution works in O(L!). Can you come with something significantly faster? What

about polynomial solution? (Hint: <font color="white">this problem is very similar to a DI-Hard problem from a recent SRM; you can

just adapt solutions for that problem to get fast solutions for this one</font>).

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10183&amp;rd=13519" name="10183">TheDictionary</a></b> 

</font> 

<A href="Javascript:openProblemRating(10183)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524728" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      115 / 758 (15.17%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      22 / 115 (19.13%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>sky58</b> for 760.85 points (17 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      532.96 (for 22 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The first question we should answer when solving this problem is how many strings overall are in the dictionary made by Brus?

To generate any such string, we must first choose <b>n</b> positions for letters 'a'

among <b>n</b>+<b>m</b> available positions, and than to put <b>m</b> letters 'z' onto

<b>m</b> positions that are not chosen. So the number of possible strings is the same as the number of ways

to choose positions for letters 'a', which is clearly equal to C(<b>n</b>+<b>m</b>, <b>n</b>) = (<b>n</b> + <b>m</b>)! /

(<b>n</b>! * <b>m</b>!). If <b>k</b> &gt; C(<b>n</b>+<b>m</b>, <b>n</b>), we can simply return an empty string.

</p>

<p>

Otherwise, let's break all strings into two groups - those that start from 'a' and those that start from 'z'. Obviously,

all strings in the first group are alphabetically smaller than strings from the second group. If we ignore the first character

(which is anyway fixed within each group), then each string in the first group contains <b>n</b>-1 'a's and <b>m</b> 'z's,

therefore it contains overall C1 = C(<b>n</b>+<b>m</b>-1, <b>n</b>-1) strings. Using this number, we can determine the first

character of the <b>k</b>-th string in the dictionary. If <b>k</b> &le; C1, this string falls within the first group and

therefore starts from 'a'. Otherwise, if <b>k</b> &gt; C1, the string falls within the second group and starts from 'z'.

We can also determine the index of the <b>k</b>-th string within its group. If it's in the first group, this index is still

<b>k</b>, otherwise the index is <b>k</b>-C1 (we must subtract all strings from the first group).

</p>

<p>

Note that if we ignore the first character in each group, the rest will look exactly like the initial dictionary, but with

different parameters <b>n</b> and <b>m</b>. The first group is a dictionary for n' = <b>n</b>-1 and m' = <b>m</b>, and

the second group is a dictionary for n' = <b>n</b> and m' = <b>m</b> - 1. Since we know the index of our string within

its group and the group is again a dictionary, we can apply the same argument from the previous paragraph to determine

the second character of the string. Repeating the process <b>n</b> + <b>m</b> times will allow us to get all the characters.

</p>

<p>

In order to calculate the values of C it's useful to apply the recurrence C(a, b) = C(a-1, b) + C(a-1, b-1). There's also

the following difficulty - the values of C can be very large, for example C(200, 100) is a number containing 59 decimal

digits. However, the only operations we need to perform with the values of C is to compare them with <b>k</b> and to subtract

them from <b>k</b> in cases when <b>k</b> is larger. From this point of view, there's no any difference between the number

containing 59 decimal digits and, say, number 1,000,000,001 (because the values of <b>k</b> are always no

more than 1,000,000,000). So to get rid of this difficulty, we can modify the recurrence as follows: C(a, b) = min(C(a-1, b) +

C(a-1, b-1), 1,000,000,001).

</p>

<p>

Java implementation of this approach is given below.

</p>

<pre>

public class TheDictionary {

  public String find(int n, int m, int k) {

    int[][] C = new int[201][201];

    C[0][0] = 1;

    for (int i=1; i&lt;=200; i++) {

      C[i][0] = 1;

      C[i][i] = 1;

      for (int j=1; j&lt;i; j++)

        C[i][j] = Math.min(C[i-1][j] + C[i-1][j-1], 1000000001);

    }



    if (C[n+m][m] &lt; k) return "";



    String s = "";

    int L = n + m;

    for (int i=0; i&lt;L; i++) {

      if (n>0 && C[n+m-1][m] >= k) {

        s += "a";

        n--;

      } else {

        s += "z";

        k -= C[n+m-1][m];

        m--;

      }

    }



    return s;

  }

}

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10184&amp;rd=13519" name="10184">TheLongPalindrome</a></b> 

</font> 

<A href="Javascript:openProblemRating(10184)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524728" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      107 / 624 (17.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      74 / 107 (69.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 413.22 points (13 mins 37 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      253.18 (for 74 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Let's denote the number of strings (not necessarily palindromes) of length L containing at most C distinct characters

as F(L, C), and the number of palindromes of length L containing at most <b>k</b> distinct characters

as G(L). We need to find S = G(1) + G(2) + ... + G(<b>n</b>)). Note that any palindrome of even length L is uniquely determined

by its first L/2 characters (the rest is just the inverse of these characters), so for even L we have G(L) = F(L/2, <b>k</b>).

Similarly, for odd L any palindrome is determined by its first (L+1)/2 characters, so G(L) = (F(L+1)/2, <b>k</b>) for odd L.

If we apply these formulas to the expression for S, we get S = 2 * (F(1, <b>k</b>) + F(2, <b>k</b>) + ... + F(<b>n</b>/2, <b>k</b>))

for even <b>n</b> and S = 2 * (F(1, <b>k</b>) + F(2, <b>k</b>) + ... + F((<b>n</b>-1)/2, <b>k</b>)) + F((<b>n</b>+1)/2, <b>k</b>).

</p>

<p>

Let's define FF(L, C) as the number of strings of length L containing <i>exactly</i> C distinct characters. It's easy

to see that F(L, C) = FF(L, 1) + FF(L, 2) + ... + FF(L, C). Our goal is to find a recurrence for FF.

Note that there are two ways to get a string of length L with exactly C distinct characters. We can take a string

of length L-1 containing exactly C distinct characters (there are FF(L-1, C) such strings) and append any of its C

characters to it. Alternatively, we can take a string of length L-1 containing exactly C-1 distinct characters

(there are FF(L-1, C-1) such strings) and append to this string any of 26 - (C - 1) = 27 - C characters, that 

are not in it. So we get the following recurrence: FF(L, C) = C * FF(L-1, C) + (27 - C) * FF(L-1, C-1).

</p>

<p>

Using this recurrence, we can calculate all values of FF, than all values of F and than, finally, S. It sounds good,

but, unfortunately, is too slow. To speed things up, let's use matrices. Introduce the following sequence of vectors

V:

</p>

<pre>

    V(L) = [FF(L, 0) FF(L, 1) ... FF(L, 25) FF(L, 26)]

</pre>

<p>

Now let's build a 27x27 matrix A such that V(L) = V(L-1) * A. This equation means that FF(L, C) is obtained as a scalar

product of V(L-1) and C-th (0-based) column of A. Therefore, C-th column of A must contain exactly two non-zero elements:

A<sub>C-1, C</sub> = 27 - C and A<sub>C, C</sub> = C. Overall, matrix A must look like this:

</p>

<pre>

        [ 0  26 0  0  ... 0  0  0  ]

        [ 0  1  25 0  ... 0  0  0  ]

        [ 0  0  2  24 ... 0  0  0  ]

        [ 0  0  0  3  ... 0  0  0  ]

    A = [ ........................ ]

        [ ........................ ]

        [ ........................ ]

        [ 0  0  0  0  ... 24 2  0  ]

        [ 0  0  0  0  ... 0  25 1  ]

        [ 0  0  0  0  ... 0  0  26 ]

</pre>

<p>

Using the equation V(L) = V(L-1) * A several times, we get V(L) = V(L-1) * A = (V(L-2) * A) * A = V(L-2) * A^2 = ...

= V(0) * A^L, where V(0) = [1 0 0 ... 0 0]. Remember that for even <b>n</b>'s we have

S = 2 * (F(1, <b>k</b>) + F(2, <b>k</b>) + ... + F(<b>n</b>/2, <b>k</b>)).

As F(L, <b>k</b>) is the sum of first <b>k</b>+1 elements of V(L),

to calculate S it's enough to know the sum V(1) + V(2) + ... + V(<b>n</b>/2) = V(0) * (A^1 + A^2 + ... + A^{<b>n</b>/2}).

Similarly, for odd <b>n</b> we need to know the sum V(0) * (A^1 + A^2 + ... + A^{(<b>n</b>-1)/2}) and the value

V(0) * A^{(<b>n</b>+1)/2}.

</p>

<p>

So, in order to solve the problem we now need only to be able to calculate A^p and A^1+A^2+...+A^p fast enough, where

p is an arbitrary integer. Both subproblems are kind of classic and occur time to time in SRMs. Directly using properties

A^{2q} = (A^q)^2 and A^{2q+1} = A^{2q} * A depending on parity of p, we can implement recursive function that

calculates A^p using O(log p) matrix multiplications. Similarly, using properties A^1+A^2+...+A^{2q} = (E+A^{q})*(A^1+A^2+...+A^{q})

and A^1+A^2+...+A^{2q+1} = (A^1+A^2+...+A^{2q}) + A^{2q+1}, we can calculate A^1+A^2+...+A^p using O(log^2 p) matrix

multiplications.

</p>

<p>

Check <tc-webtag:handle coderId="10574855" context="algorithm"/>'s fastest

<a href="http://www.topcoder.com/stat?c=problem_solution&cr=10574855&rd=13519&pm=10184">submission</a>

on this problem for a clean implementation of this approach.

</p>

<p><i>Exercises</i></p>

<ol>

<li>Describe how one can calculate the sum A^1 + A^2 + ... + A^p using only O(log p) matrix multiplications,

thus getting an O(<b>k</b>^3 * log p) solution on this problem.</li>

<li>Find a solution for this problem that has an assymptotical complexity of O(<b>k</b>^2 * log p).</li>

</ol>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10185&amp;rd=13519" name="10185">TheStringGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(10185)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524728" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      14 / 624 (2.24%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      4 / 14 (28.57%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 592.46 points (28 mins 0 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      522.75 (for 4 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem looks like a usual 2 players combinatorial game. If you have never solved similar problems, please

first read the following

<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=algorithmGames">tutorial</a>. We can start

by implementing a recursive memoized function that calculates the outcome for every possible string than

can occur in the game. The pseudocode for this function looks as follows:

</p>

<pre>

Outcome solve(String s)

  If solve was already called for s

    Then just return the outcome from memo



  Generate the list M of possible moves from s



  If M is empty

    Result := (Draw)

  Otherwise 

    Create empty list of outcomes L

    For each string ss in M

      Add solve(ss) into L



    If there is at least one defeat in L

    Then

      Let X be the number of moves in the fastest of all defeats in L

      Result := (Victory in X+1 moves)

    Otherwise

      If there is at least one draw in L

        Result := (Draw)

      Otherwise

        Let X be the number of moves in the slowest of all victories in L

        Result := (Defeat in X+1 moves)



  Add Result to memo for string s

  Return Result

End

</pre>

<p>

It's not hard to implement this pseudocode in your favorite programming language, but there is one problem.

The number of reachable game states from a starting position is 3^N, where N is the number of 'X' characters

in the input string. This is because each 'X' character can be further replaced by 'O' or 'L', so there are

3 possibilities for each 'X' position. In the worst possible case it's 3^16 = 43,046,721, what is too many.

During the match, all 4 coders who solved this problem used the following workaround. If the number of 'X's

doesn't exceed 14, the number of states is at most 3^14 = 4,782,969 and well written C++ solution

can solve these cases in time. And the number of cases when there are 15 or 16 'X' characters is very small.

There are actually 34 such cases: X[15], X[16], X[i]OX[15-i], X[i]LX[15-i], 1 &le; i &le; 15, where X[cnt] denotes

cnt 'X' characters in a row. For each of these cases you can compute the answer on your computer by using the same

method and waiting, say, 5, 10 or even 20 seconds. Than you can just insert these 34 answers into your code.

For example, see the following

<a href="http://www.topcoder.com/stat?c=problem_solution&rm=299525&rd=13519&pm=10185&cr=19849563">submission</a> by

<tc-webtag:handle coderId="19849563" context="algorithm"/>.

</p>

<p>

Of course, it would much more interesting to solve the problem without precomputation and in a slower language like

Java. To do this, let's generalize the game a bit. Suppose that game state consists of not one, but possibly

several strings. In one move, a player should choose one of the strings and make a move there. As only

some player makes "LOL" within some string, he becomes a winner.

</p>

<p>

Let's give several simple facts that allow to reduce the number of states significantly:

</p>

<ol>

<li>In a generalized game, the order of game strings doesn't matter.</li>

<li>We can reverse any game string and the answer will not change. This is because "LOL" is a palindrome.</li>

<li>If A and B are any game strings, then the answer for the string A + "L" + B is the same as the answer for

the generalized game with 2 strings: A + "L" and "L" + B. The reason is that "LOL" can only formed within the string

A + "L" or within the string "L" + B.</li>

<li>If A and B are any game strings, then the answer for the string A + "OO" + B is the same as the answer for

the generalized game with 2 strings: A and B. If the number of "O"s separating A and B is more than 2, this fact

still holds. Note, however, that it's not true for just one "O".</li>

<li>The answer for the string "O" + A is the same as for the string A. The answer for the string B + "O" is the same

as for the string B.</li>

<li>The answer for the string "LXO" + A is the same as for the string "XO" + A. The answer for the string B + "OXL"

is the same as for the string B + "OX".</li>

<li>Suppose that for some string there's no way for "LOL" to appear after any moves. An example of such string is

"XLLX". Since the actual moves within this string are irrelevant, we no longer need to know the exact string

in order to proceed the game, it's enough just to know the number of "X"s in this string. In case of generalized game,

it's enough to know the total number of "X"s in all such strings. Let's call these 'X' characters <i>free</i>.</li>

</ol>

<p>

Using these facts, we can define the state as an integer, that gives the number of free 'X' characters, and

an array of strings, that gives all game strings. In addition, the state will satisfy to the following properties:

</p>

<ol>

<li>The array of strings is sorted in non-descending order. Each string is lexicographically less (or the same)

as its reversal.</li>

<li>For any string in the array: it doesn't start from "O" or "LXO"; it doesn't end with "O" or "OXL"; it doesn't

contain occurrences of "OO"; it doesn't contain letters 'L' except, possibly, its first and its last characters.</li>

<li>For any string in the array, it's possible for "LOL" to appear within this string after some moves.

In particular, it means that the length of the string is at least 3.</li>

</ol>

</li>

<p>

These optimizations reduce the number of states significantly, but still there are pretty many states and

the work done per one state is increased. Fortunately, most of the states are such that it's possible to win just

in 1 move (let's call these states <i>fast winning</i>). Since generating the list of moves from a given state is a very expensive operation, it makes sense

to modify things a bit in such way that solve is never called for a fast winning state.

Note that fast winning states are very easy to detect: these are exactly the states where at least one game string

contains an occurrence of "XOL", "LXL" or "LOX".

Our modification works as follows: we just do not include fast winning states onto the list of moves M.

As moving into a fast winning state leads to immediate defeat, we should make such move only if there are no other choices,

therefore this modification is correct. The only other thing that needs to be changed is a treatment of case

when M is empty. If there are no "X" characters in game strings, it's still a draw, otherwise it means that any

move leads to a fast winning state, so it's actually a defeat in 2 moves.

</p>

<p>

After fast winning states are eliminated, the number of considered states becomes quite small. For the worst case of

X[16] the number of states is just 19,657. As I've already mentioned, we need to do pretty much of work per state,

so the runtime of this approach is still quite slow, but it fits within the limit of 2 seconds. For a possible

implementation, you can check my commented Java solution in practice room for this SRM. It passes the worst case of X[16]

in 1.4 seconds.

</p></div>

<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
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
