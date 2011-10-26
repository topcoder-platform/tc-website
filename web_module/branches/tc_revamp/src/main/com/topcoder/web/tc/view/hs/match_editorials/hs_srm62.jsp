<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 61 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&rd=13531&snid=3&er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="524575" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 62</span><br />Saturday, November 22, 2008
<br /><br />
<h2>Match summary</h2> 

<p> 
In this TCHS match 132 participants took part, 100 out of them 
correctly solved the easy problem, 72 correctly solved the medium one and
42 correctly solved the hard one. First place went to 
<a href="/tc?module=MemberProfile&amp;cr=22714443&amp;tab=hs" class="coderTextYellow">lyrically</a> from Japan,
<a href="/tc?module=MemberProfile&amp;cr=22698470&amp;tab=hs" class="coderTextYellow">gnocuil</a> (China) 
and <a href="/tc?module=MemberProfile&amp;cr=11972352&amp;tab=hs" class="coderTextYellow">Zuza</a> (Croatia) were second and third respectively. 
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7731&amp;rd=13531" name="7731">TeamSelection</a></b> 
</font> 
<A href="Javascript:openProblemRating(7731)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      112 / 125 (89.60%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      100 / 112 (89.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 249.28 points (1 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      227.50 (for 100 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The easiest way to solve this problem was just to brute force over all
triples of students, check whether they can work together in a team and
to pick the team with the maximal possible summary rating. Such an approach
needs O(n^3) operations where n is the number of students. Such a solution
easily fits into timelimit because n &le; 50.
</p>

<p>
Java implementation of this approach can look as follows.
</p>

<p>
<pre>public class TeamSelection {
    public int selectBestTeam(int[] rating, String[] compatibility) {
		int n = rating.length;
		int ans = -1;
		for (int i = 0; i < n; i++) {
			for (int j = i + 1; j < n; j++) {
				for (int k = j + 1; k < n; k++) {
					if (compatibility[i].charAt(j) == 'Y' && 
					    compatibility[j].charAt(k) == 'Y' && 
					    compatibility[k].charAt(i) == 'Y') {
						int cur = rating[i] + rating[j] + rating[k];
						ans = Math.max(ans, cur);	
					}
				}
			}
		}
		return ans;
	}
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7591&amp;rd=13531" name="7591">NumberFormatter</a></b> 
</font> 
<A href="Javascript:openProblemRating(7591)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      110 / 125 (88.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      72 / 110 (65.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>DaViDeX</b> for 492.46 points (3 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      398.22 (for 72 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
As in most implementation problems to solve this problem one needs only to 
implement everything from the statement carefully. First of all, you
need to split the number into integer and fractional parts. This can be done
using string manipulation functions which are included into standard library
of programming language.
</p>

<p>                                                                       
After it one need to format the integer as described in the statement. To do it
you need to process characters fror right to left and insert space after each
character which number is divisible by three (characters are numbered from
right to left with integer numbers starting with one). This step should carefully
implemented to not insert the space before the first character of integer part. 
Some of coders had made such a mistake and they failed system test or were challenged  (for example,
on test case "123" their programs returned " 123" instead of "123").
</p>
<p>
Java implementation of this approach can look as follows.
</p>
<p>
<pre>
public class NumberFormatter {
	
	private String insertSpaces(String s) {
		String res = "";
		int len = s.length();
		for (int i = 1; i <= len; i++) {
			res = ("" + s.charAt(len - i)) + res;
			if (i % 3 == 0) {
				res = " " + res;
			}
		}
		return res.trim();
	}

	public String format(String number) {
		int commaPos = number.indexOf(',');
		if (commaPos == -1) {
			return insertSpaces(number);
		} else {
			return insertSpaces(number.substring(0, commaPos)) + '.' + number.substring(commaPos + 1);
		}
	}
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8002&amp;rd=13531" name="8002">DecreasingNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8002)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524575" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      68 / 125 (54.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      42 / 68 (61.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>niyaznigmatul</b> for 988.30 points (3 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      625.95 (for 42 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
<p>
First of all let's note that a one-to-one correpondance
between decreasing numbers and non-empty subsets of set of digits {0..9} exists. 
All digits in a decreasing number are different (so they form a subset) and exactly
one decreasing number can be formed from each subset (you need arrange elements of it
in a decreasing order). So there exists only 2^10 - 1 = 1023 decreasing numbers. They
can be easily generated. After it one need to sort them increasingly and return
the answer for the problem.
</p>
<p>
Java implementation of this approach can look as follows.
</p>
<p>
<pre>
public class DecreasingNumbers {
	ArrayList&lt;Long&gt; list; 
	void go(int pos, String s) {
		if (pos == -1) {
			if (s.length() > 0) {
				list.add(Long.parseLong(s));
			}
			return;
		}
		go(pos - 1, s + pos);
		go(pos - 1, s);
	}
	public long getNth(int n) {
		list = new ArrayList&lt;Long&gt;();
		go(9, "");
		Collections.sort(list);
		if (n >= list.size()) {
			return -1;
		}
		return list.get(n);
	}	
}
</pre>
</p>






<div class="authorPhoto">
    <img src="/i/m/FedorTsarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21691199" context="algorithm" /><br />    <em>TopCoder Member</em>
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
