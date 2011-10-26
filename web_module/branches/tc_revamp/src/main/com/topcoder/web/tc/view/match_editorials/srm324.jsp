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
    <A href="/stat?c=round_overview&er=5&rd=10004">Match Overview</A><br>
    <tc-webtag:forumLink forumID="505999" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 324</span><br>Wednesday, October 25, 2006
<br><br>

<h2>Match summary</h2> 

<p>
This SRM, being the last start before the upcoming GCJ finals, attracted a lot of strong coders, including 6 (out of the total 10) targeteers. 
The expected battle didn't happen because of <tc-webtag:handle coderId="10574855" context="algorithm"/>, who needed only a bit more than 12 minutes to submit all 3 problems.
In addition to getting another spot among <a href="http://www.topcoder.com/stat?&c=highest_totals&dn=1">the all-time highest total scores</a>, <tc-webtag:handle coderId="10574855" context="algorithm"/> regained the top line in the Algorithm Ranking. 
In Div 2, newcomer <tc-webtag:handle coderId="22655534" context="algorithm"/> won the round by a solid margin over more experienced members <tc-webtag:handle coderId="19968150" context="algorithm"/>, <tc-webtag:handle coderId="21926605" context="algorithm"/>, <tc-webtag:handle coderId="15211879" context="algorithm"/> and <tc-webtag:handle coderId="22652765" context="algorithm"/>,  all of whom were close in the race for the second place.
<p/>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6808&amp;rd=10004" name="6808">Alliteration</a></b> 
</font>
<A href="Javascript:openProblemRating(6808)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505999" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> 
Used as: Division Two - Level One: 
<blockquote><table cellspacing="2"> 
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
      436 / 474 (91.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      296 / 436 (67.89%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ystar</b> for 249.84 points (0 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.31 (for 296 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The most difficult part of this problem is to avoid counting the same alliteration twice. For example, the input {"A", "ate", "apple"} contains only 1 alliteration, though two pairs of consecutive words ("A" + "ate", and "ate" + "apple") start from the same letter. To implement this, we can count all such pairs of words in which both words start from the same letter, but the word directly before this pair started from another letter. With this trick we avoid counting the same alliteration multiple times. Java implementation of this approach follows:

<pre>
public int count(String[] words) {
   int res = 0;
   for (int i = 0; i < words.length - 1; i++) {
      if (Character.toLowerCase(words[i].charAt(0)) == Character.toLowerCase(words[i + 1].charAt(0)) &&
      (i == 0 || Character.toLowerCase(words[i].charAt(0)) != Character.toLowerCase(words[i - 1].charAt(0))))
        res++;
    }
    return res;
}
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6767&amp;rd=10004" name="6767">PalindromeDecoding</a></b>  </font> <A href="Javascript:openProblemRating(6767)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505999" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> 
Used as: Division Two - Level Two: 
<blockquote><table cellspacing="2"> 
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
      390 / 474 (82.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      365 / 390 (93.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dymu</b> for 498.47 points (1 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      395.93 (for 365 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: 
<blockquote><table cellspacing="2"> 
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
      414 / 419 (98.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      408 / 414 (98.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kalinov</b> for 249.16 points (1 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.94 (for 408 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
To solve this problem you just need to carefully implement the algorithm described in the statement. 
The basic step you need to implement here is inserting a reversed string into another string at some position. 
For example, if you need to insert the reversed string <b>t</b> at position <b>i</b> of string <b>s</b>, you can:
<li>Create string <b>a</b>, equal to the substring of string <b>s</b> between positions 0 and <b>i</b>.</li>
<li>Iterating through string <b>t</b> in inversed order (from the last character to the first), add all characters of <b>t</b> to <b>a</b>.</li>
<li>Concatenate string <b>a</b> with the tail of string <b>s</b> (starting at position <b>i</b>).<br>
  <br>
The complete solution of this problem consists of several string conversions, using the indices from the input:</li>

<pre>
public String decode(String code, int[] position, int[] length) {		
	String ans = code;
	for (int i = 0; i < position.length; i++) {
		String res = ans.substring(0, position[i] + length[i]);
		for (int j = length[i] - 1; j >= 0; j--) 
			res += ans.charAt(position[i] + j);
		ans = res + ans.substring(position[i] + length[i]);
	}
	return ans;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6811&amp;rd=10004" name="6811">ProductBundling</a></b>
</font>
<A href="Javascript:openProblemRating(6811)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505999" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> 
Used as: Division Two - Level Three: 
<blockquote><table cellspacing="2"> 
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
      254 / 474 (53.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 254 (78.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hhllnnnn</b> for 957.83 points (6 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      694.53 (for 200 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The main trick in this problem is to switch the input from "customer-based" to "product-based".
The input is given to us as an array of strings, where the i-th character in the j-th string is '1' when the i-th product was bought by the j-th customer. Lets transpose the input, so each product will correspond to a string, with the i-th character of this string being '1' only the i-th customer bought the corresponding product.
Building a string for each product from the input, we receive a new array of strings, with the length of each strings being equal to the number of elements in the input, and the number of new strings being equal to the length of each element of the input.
For example, if the input is {"1010",  "1100"} (example 1 from the problem), the new array will be {"11", "01", "10", "00"}.
</p>
<p>
Now let's check when two products can be put into one bundle. As the statement says, product A and product B (which correspond to strings S<sub>A</sub> and S<sub>B</sub>) can be put into one bundle if every customer bought neither of them or both of them. That is, if the i-th character of S<sub>A</sub> is '1', then the i-th character of S<sub>B</sub> must be '1' too. Similarly, if the i-th character of S<sub>A</sub> is '0', the i-th character of S<sub>B</sub> also must be '0'. In other words, products A and B can be put into one bundle only if strings S<sub>A</sub> and S<sub>B</sub> are equal. If any number of products correspond to the same string, then all of them can be put into one big bundle. Also, if two products correspond to different strings, they can never be put in the same bundle. 
Therefore, the number of different bundles is the same as the number of different strings in the new array:
<pre>
public int howManyBundles(String[] data) {
	HashSet&lt;String> ret = new HashSet();
	for (int a = 0; a < data[0].length(); a++) {
		String temp = "";
		for (int b = 0; b < data.length; b++) 
			temp += data[b].charAt(a);
		ret.add(temp);
	}
	return ret.size();
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6807&amp;rd=10004" name="6807">TournamentPlan</a></b> </font> <A href="Javascript:openProblemRating(6807)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505999" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> 
Used as: Division One - Level Two: 
<blockquote><table cellspacing="2"> 
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
      375 / 419 (89.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      263 / 375 (70.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krzysan</b> for 495.69 points (2 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      398.16 (for 263 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Consider a more general problem, where each competitor is assigned some cost Ci, and travelling a unit of distance costs him Ci dollars. We are to find the minimal cost necessary to play the tournament (you can see that initial problem is a special case of this general problem, where all costs are equal to 1).
</p>
<p>
By induction on the number of competitors n, we will prove that there exists an optimal solution where all games are played at the same intersection. 
<li>Induction start is with n = 2, and is trivial - cause for 2 competitors there is only 1 game.</li>
<li> Assume we proved the hypothesis for all numbers 2.. (n - 1), and now are going to prove this for some n > 2 competitors.
  <br>
  <br>
Consider the two competitors A and B playing the first game. After they played their game, they both have to play against the same opponents, so they continue on the same path. This can be seen as that A and B are substituted by one competitor with a weight which is the sum of the weights of A and B and a starting location, which is the location of the game between A and B. Now we have n-1 competitors left. By the induction hypothesis we know there exists an optimal solution, where all games are played at one intersection. Since the triangle inequality holds for the manhattan distance, A and B can go to that intersection immediately and play their game there.</li>
<br/>

We proved that all games of the tournament can be played at the same intersection, now we need to find the exact location of this intersection. Consider an intersection located at street X, with K players starting at streets with numbers less than X, and L competitors starting at streets with numbers bigger than or equal to X. If we move the intersection to the street with number (X - 1), the total distance travelled by the competitors will decrease by (K - L) (obviously, the distance will increase if L > K), and it will decrease by (K - L) with each street until numbers K and L will change (this happens when we move to a street where one of the competitors starts). 
</p>
<p>
Similarly, if the number M of the competitors who start at streets with numbers greater than X will be greater than the number of the competitors who start at streets with numbers less than or equal to X, we can decrease the total distance by moving the intersection towards streets with higher numbers. 
Therefore, the optimal intersection (where the competitors travel the smallest distance) is located at a street where one of the competitors starts, and it can not be moved in either direction - so, the optimal intersection is located at the median street.
Since the same thoughts can be applied to avenues as well, we know all the games are played at the intersection of the median avenue and the median street, and the solution for the problem becomes amazingly short:
<pre>
public int getTravelDistance(int[] street, int[] avenue) {
	int n = street.length;
	Arrays.sort(street);
	Arrays.sort(avenue);
	int distance = 0;
	for (int i = 0; i < street.length; i++)
		distance += Math.abs(street[i] - street[n/2]) + Math.abs(avenue[i] - avenue[n/2]);
	return distance;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6766&amp;rd=10004" name="6766">PalindromeEncoding</a></b>
</font>
<A href="Javascript:openProblemRating(6766)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505999" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> 
Used as: Division One - Level Three: 
<blockquote><table cellspacing="2"> 
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
      141 / 419 (33.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      36 / 141 (25.53%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 968.90 points (5 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      502.67 (for 36 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
The solution to this problem is amazingly short -- the difficult part is to find the correct algorithm and prove that it will work (of course, the latter is not necessary as long as you trust your intuition). We will find the optimal encoding in 2 steps.

<ul>
  <li>If the sequence starts from several equal characters, we can safely reduce them one by one to have only 1 such character, and the optimal encoding will not change -- for example, we can reduce "<b>11</b>11010110" -> "<i>1</i><b>11</b>010110" ->... -> "<i>1</i>010110". (Here, the <b>bold</b> characters represent the part which is going to be transformed, and the <i>italic</i> chars represent the result of the transformation). Why? Lets look how these leading characters can be used. If some of them are used as the right part of some palindrome, this means that the whole palindrome consists of the same characters (because there are not different characters left to them), and encoding it will not be better than just reducing all the leading characters one by one. 
Now consider the left part of the palindrome ("1<b>11000011</b>0" -> "1<i>1100</i>0").
Due to the rules of encoding, the right part of the encoded palindrome immediately disappears. Therefore, we can reduce the corresponding characters in the right part, then encode the updated right part ("<b>111</b>0000110" -> "<i>1</i>0000<b>11</b>0" -> "10000<i>1</i>0" -> "<b>100001</b>0" -> "<i>100</i>0") and these changes will not affect any of the future encodings on the sequence.
</li>
  <li>
After the first transformation we have a sequence that starts from several different characters ("1010..." or "0101..."). 
This sequence can be split in two parts. In the first part, every pair of consecutive characters is different ("01010..."), and this part is as long as possible (so, it continues until we either find a pair of equal characters or the input sequence ends). As soon as we find a pair of two consecutive equal characters, everything starting from the second character of this pair can be removed using palindrome encoding. Also, neither character of the first part can be removed. To remove any character of this part we need to find an even-length palindrome -- in such a palindrome, the middle 2 characters will be equal, which isn't the case for the first part of the sequence.</li>
</ul>

To prove that everything except the first part can be deleted, lets see the following algorithm. First, in the second part, reduce any sub-sequence of consecutive equal characters to just one such character. 
For example, if the sequence is "01011000110100111", then the first part is "0101" and the second is "1000110100111", which must be reduced to "1<b>00011</b>01<b>00111</b>" -> "1<i>01</i>01<i>01</i>".
After this action, the sequence will be of the following form (the first part is <b>bold</b>):
<pre>
<b>1010...01</b>1010...10
or 
<b>1010...01</b>1010...101
</pre>
The final transformations are similar in both these cases -- we reduce "10"s from the right part one by one, ("1010...<b>0110</b>10...10" -> "1010...<b>0110</b>10" -> "1010...<b>0110</b>" -> "1010...01"). If two '1's are left at the right end, we reduce the second of them ("1010...10<b>11</b>" -> "1010...101"). 
</li>
</p>
<p>
<tc-webtag:handle coderId="10574855" context="algorithm"/>'s C# solution follows:
<pre>
public int getLength(string s) {
	while (s.Length > 1) {
		if (s[0] != s[1])
			break;
		s = s.Substring(1);
	}
	for (int i = 1; i < s.Length; ++i)
		if (s[i] == s[i - 1]) {
			s = s.Substring(0, i);
			break;
		}
	return s.Length;
} 
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
