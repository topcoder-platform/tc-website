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

<title>Single Round Match 255 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 255</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Thursday, July 28, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>In Division 1, after some time spent working on the easy problem, most coders divided into two distinct groups. The first group opened the medium problem (600 points) next, while the second went for the hard (800 points). At first glance the second group seemed to have the better approach, but many of the hard problem solutions turned out to be wrong. bladerunner took the 1st place with the help of 7 successful challenges, lovro was 2nd and Savior finished in 3rd. sabbir_yousuf become yellow by taking the 4th place. Interestingly, dexter_bg gained 297 rating points without any problem passed.
</p>
<p>In Division 2, the top performer was Protean, followed by crem and xaep. More than 70 coders finished with all three problems correct.</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4659&amp;rd=7228" name="4659">SequenceOfNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(4659)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      278 / 308 (90.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      264 / 278 (94.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>DamnEcuadorian</b> for 249.50 points (1 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      215.27 (for 264 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>We can convert all elements of the given string array to integers and put them into some 
numerical array. After that we can sort new numerical array in a usual way and 
convert its back to the string array.
</p>
<pre>
	int[] tmp = new int[sequence.length];
	for(int i = 0; i &lt; sequence.length; i++)
		tmp[i] = Integer.parseInt(sequence[i]);
	Arrays.sort(ret);
	for(int i = 0; i &lt; sequence.length; i++)
		sequence[i]=""+tmp[i];
</pre>
<p>Another way to solve this problem is to use a sort function which receives 
a comparing function (called 'comparator') as an argument.</p>
<pre>
	Arrays.sort(sequence,
		    new Comparator&lt;String>() {
	    		public int compare(String a, String b) {
					return new Integer(a).compareTo(new Integer(b));
	    		}
	        });

</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4483&amp;rd=7228" name="4483">WordCompositionGame</a></b>
</font>
<A href="Javascript:openProblemRating(4483)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      264 / 308 (85.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      246 / 264 (93.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agray</b> for 488.25 points (4 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      389.23 (for 246 correct submissions)
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
      242 / 246 (98.37%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      236 / 242 (97.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 249.20 points (1 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      228.72 (for 236 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
First, we can count how many times each word appears in the player lists. This information can 
be stored in associative array (like hash map). After that we can iterate over the words of each 
player and calculate his score. Here is <b>antimatter</b> C++ solution who have made this problem in 1.5 
minutes.</p>
<pre>
	string score(vector &lt;string&gt; a, vector &lt;string&gt; b, vector &lt;string&gt; c) {
		map&lt;string,int&gt; C;
		for (int i = 0; i &lt; a.si; i++) C[a[i]]++;
		for (int i = 0; i &lt; b.si; i++) C[b[i]]++;
		for (int i = 0; i &lt; c.si; i++) C[c[i]]++;
		int AA=0,BB=0,CC=0;
		for (int i = 0; i &lt; a.si; i++) AA += 4-C[a[i]];
		for (int i = 0; i &lt; b.si; i++) BB += 4-C[b[i]];
		for (int i = 0; i &lt; c.si; i++) CC += 4-C[c[i]];
		char buf[100];
		sprintf(buf, "%d/%d/%d", AA,BB,CC);
		return string(buf);
	}

</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4622&amp;rd=7228" name="4622">KthElement</a></b>
</font>
<A href="Javascript:openProblemRating(4622)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      155 / 308 (50.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      75 / 155 (48.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>xaep</b> for 854.77 points (12 mins 8 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      545.36 (for 75 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>The example 2 hints how to solve this problem. Function F(N) can take a very few values within the
problem limitations. So the sequence X will be repeated in first 10-25 elements and we can 
find its period. If we know that sequence X has a period of length L starting from 
the index i (i &gt; K) the X<sub>K</sub> will be the same as the element with the index 
<i>(K-i) mod L + i</i>. Here is a sample Java code.</p>
<pre>
	Map&lt;Integer, Integer&gt; seen = new HashMap();
	List&lt;Integer&gt; sequence = new ArrayList&lt;Integer&gt;();
	int X = 0;
	for (int i = 0;; i++) {
		if (seen.containsKey(X)) {
			if (i &gt; K) 
				return sequence.get(K);
			int L = i - seen.get(X);
			int ind = seen.get(X);
			return sequence.get(ind + (K-ind) % L);
		}
		seen.put(X,i);
		sequence.add(X);
		X = A*F(X)+B;
	}

</pre>;


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4473&amp;rd=7228" name="4473">PluCodeGenerator</a></b>
</font>
<A href="Javascript:openProblemRating(4473)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      59 / 246 (23.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      46 / 59 (77.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>loopy</b> for 507.11 points (12 mins 38 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      314.39 (for 46 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>It is quite easy to write solution that iterates from 1 to N-1 and checks each number if it is
a valid PLU code. This solution works much slower than required 2 seconds, but it is
acceptable to generate all answers and hardcode each 100000th answer into array inside a solution source.
After that we can start counting invalid PLU codes not from 1 but form the index that closer 
to N.</p>
<p>Another (more honest) way to solve this problem is a dynamic programming. 
Let function A[d1,d2,L,N] be a number of invalid PLU codes of length L that less or equal N. Moreover 
this function allows PLU code to start from the '0' digit and considers PLU codes started from d2 as 
invalid if d1=d2. Let n0 be a first digit of N and N1 be a number N without a first digit. </p>
<p>Now A[d1,d2,L,N] can be calculated using following algorithm (pseudocode):</p>
<pre>
A[d1,d2,L,N] = 0;
for(char ch='0'; ch&lt;n0; ch++)
	A[d1,d2,L,N] += (d1==d2 &amp;&amp; d2==ch) ? 10<sup>L-1</sup> : A[d2,ch,L-1,10<sup>L-1</sup>-1];
A[d1,d2,L,N] += (d1==d2 &amp;&amp; d2==n0) ? N1+1 : A[d2,n0,L-1,N1];

</pre>
<p>Using this folmula it is clear how to solve the task.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4527&amp;rd=7228" name="4527">OddDigitable</a></b>
</font>
<A href="Javascript:openProblemRating(4527)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      800
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      125 / 246 (50.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      10 / 125 (8.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Savior</b> for 738.94 points (8 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      625.64 (for 10 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>How are the odd-digitable numbers produced? There are five one-digit odd-digitable numbers. To 
produce the odd-digitable number of length L (L &gt; 1) we should get the odd-digitable number of length L-1, 
multiply it by 10 and add one of the one-digit odd-digitable numbers.</p>
<p>Let put all one-digit odd-digitable numbers into the queue, then put all odd-digitable numbers
produced from 1, all odd-digitable numbers produced from 3 and so on. This way we'll get all 
odd-digitable numbers in the increasing order. Finally, take all numbers in the queue modulo N.</p> 
<p>There are no sense to put duplicates into the queue because they will generate the same numbers, so 
we'll skip produced numbers which are already in the queue. Here is the sample Java code.</p>
<pre>
	List&lt;Integer&gt; al = new ArrayList(); 
	List&lt;String&gt; as = new ArrayList();
	boolean[] mark = new boolean[N];
	al.add(0); 
	as.add(""); 
	for (int i = 0; i &lt; al.size(); i++) {
		int c = al.get(i);
		if (c == M &amp;&amp; i &gt; 0) return as.get(i);
		for (int j = 1; j &lt;= 9; j+=2) {
			int x = (c*10+j)%N;
			if (mark[x]) continue;
			mark[(c*10+j)%N] = true;
			al.add(x);
			as.add(as.get(i)+j);
		}
	} 
	return "-1";

</pre>



                <p>
                <img src="/i/m/Andrew_Lazarev_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=7485898"><strong>Andrew_Lazarev</strong></a><br />
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
