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

<title>TCO04 Online Round 1 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCO04 Online Round 1 Problem Set</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">September 11, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>

 

<p>

What is it called when you gather the best coders in the world at a single event?  If you didn't
already know the answer, it's called the TopCoder Open, and we are already in the thick of it.
Online Round 1 further prunes the entry list, funneling 500 competitors into 200 slots.  For some,
Round 1 is a chance to surprise the crowds, gain a few ratings points, and be inducted into
TopCoder's elite.  For others, it is purely strategic.  Several reds use the round to survey their 
opponents, and determine which competitors will prove most troublesome in the future.  <b>tomek</b>
used Round 1 to remind everyone else who won last year.  He whisked away the title in the
waning seconds of the challenge round... and don't think he didn't plan it that way.<br/>

</p>

 
<p>

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=2971&amp;rd=5878" name="2971">BadMazeStrategy</a></b>

</font>

<A href="Javascript:openProblemRating(2971)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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

      417 / 447 (93.29%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      265 / 417 (63.55%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>SnapDragon</b> for 246.01 points (3 mins 37 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      181.49 (for 265 correct submissions)

    </td>

  </tr>

</table></blockquote>

 

<p>

Unlike most traversal problems encountered on TC, this one allowed movement along diagonals.  That
didn't seem to bother most coders.  The only added difficulty here was loop detection.  Many of the
solutions I saw had a large boolean matrix that marked off (row,col,direction) triplets.  If such a
triplet occurred again, a loop has been detected.  An alternate method would be to count steps.  If
you end up taking more than 50*50*8 steps, you know you are in a loop (basically the pigeonhole
principle applied to the previously described matrix).<br/>
<br/>
This step counting method sparked a discussion between <b>radeye</b> and myself, that later spread to Chat Room 1, the
round table, and even this write-up.  The challenge was: "Build a 50 x 50 maze that requires the
largest number of steps to reach the destination."  <b>Eryx</b> and <b>ChristopherH</b> have some elegant solutions.
</p>
 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=1995&amp;rd=5878" name="1995">BadParser</a></b>

</font>

<A href="Javascript:openProblemRating(1995)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      650

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      258 / 447 (57.72%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      202 / 258 (78.29%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>nicka81</b> for 612.09 points (7 mins 9 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      430.68 (for 202 correct submissions)

    </td>

  </tr>

</table></blockquote>

 

<p>

In BadParser you are given a binary tree, whose only guarantee is that an inorder traversal will
produce the original expression.  Unsurprisingly, the first thing done by most solutions was to
inorder traverse the given tree.  Once the original expression was obtained, parse it correctly to
obtain the result.  All worries about tree structure, overflow, and division by 0 were eliminated 
by the constraints.  Since there were no parentheses in the expression, my parser greedily looks for
the first occurrence of a '/' or a '*'.  Otherwise, it settles for the first '+' or '-'.  Then it
applies the operation to its neighboring operands, thus simplifying the expression.  This process is
repeated until only a single value remains, namely the result.  Java code follows:
<pre>
String ops = "*+-/";

//inorder traversal modified to add helpful spaces
String inorder(String[] tree, int node) {
    if (ops.indexOf(tree[node].charAt(0))!=-1) {
	String[] toks = tree[node].split(" ");
	String ret = inorder(tree,Integer.parseInt(toks[1]));
	ret += " "+toks[0]+" ";
	return ret + inorder(tree,Integer.parseInt(toks[2]));
    } else return tree[node];		
}

//Executed after the inorder traversal
int eval(String expr) {
    if (expr.indexOf(' ')==-1) return Integer.parseInt(expr);
    ArrayList al = new ArrayList( Arrays.asList(expr.split(" ")) );
    while (true) {
	if (al.size() == 1) return Integer.parseInt(al.get(0)+"");
	int high = al.indexOf("*");
	if (high &lt; 0 || (al.indexOf("/") &gt; -1 &amp;&amp; al.indexOf("/") &lt; high)) 
	    high = al.indexOf("/");
	if (high == -1) high = 1;
	String B = al.remove(high+1)+"", OP = al.remove(high)+"", A = al.remove(high-1)+"";
	int a = Integer.parseInt(A), b = Integer.parseInt(B), c = 0;
	if (OP.equals("*")) c = a*b;
	if (OP.equals("+")) c = a+b;
	if (OP.equals("-")) c = a-b;
	if (OP.equals("/")) c = a/b;
	al.add(high-1,c+"");
    }
}
</pre>
</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=1998&amp;rd=5878" name="1998">Find3Cheaters</a></b>

</font>

<A href="Javascript:openProblemRating(1998)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      750

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      170 / 447 (38.03%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      114 / 170 (67.06%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>SnapDragon</b> for 735.14 points (4 mins 3 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      569.33 (for 114 correct submissions)

    </td>

  </tr>

</table></blockquote>

 

<p>

The longest common subsequence (LCS) problem occurs in nearly every undergraduate algorithms text.  To
depart from the norm, this problem asks for the shortest common supersequence (SCS).  Had there only been
2 strings, LCS and SCS have the same solution.  In the 3-string case, a new method is required to
solve SCS.  Given 3 strings, the recursive solution I wrote computes the result by considering what
characters can possibly begin a shortest common supersequence.  After choosing a
character, we are left we a smaller version of the same problem.  The algorithm tries all potential
characters (the only characters worth trying are at the front of the input strings), 
and uses memoization for speed.  Java code follows:
<pre>
int cache[][][];
String a, b, c;

//returns SCS for a.substring(pa),b.substring(pb),c.substring(pc)
int shortRec(int pa, int pb, int pc) {
    if (cache[pa][pb][pc] != -1) return cache[pa][pb][pc];
    int A = a.length(), B = b.length(), C = c.length();
    if ( pa == A &amp;&amp; pb == B &amp;&amp; pc == C ) return 0;
    int best = 1000000;
    //here i = 1 means I put the first char from String a in the supersequence
    //j and k denote the same things for Strings b and c respectively
    for (int i = 0; i &lt;= 1; i++) 
	for (int j = 0; j &lt;= 1; j++) 
	    for (int k = 0; k &lt;=1; k++) {
		if (i+j+k == 0) continue;
		if (pa + i &gt; A || pb + j &gt; B || pc + k &gt; C) continue;
		if (i &gt; 0 &amp;&amp; j &gt; 0 &amp;&amp; a.charAt(pa) != b.charAt(pb)) continue;
		if (i &gt; 0 &amp;&amp; k &gt; 0 &amp;&amp; a.charAt(pa) != c.charAt(pc)) continue;
		if (k &gt; 0 &amp;&amp; j &gt; 0 &amp;&amp; c.charAt(pc) != b.charAt(pb)) continue;
		best = Math.min(best,1+shortRec(pa+i,pb+j,pc+k));
	    } return cache[pa][pb][pc] = best;
}

public int shortest(String a, String b, String c) {
    this.a = a; this.b = b; this.c = c;
    cache = new int[a.length()+1][b.length()+1][c.length()+1];
    for (int i = 0; i &lt; cache.length; i++) 
	for (int j = 0; j &lt; cache[i].length; j++)
	    for (int k = 0; k &lt; cache[i][j].length; k++) cache[i][j][k] = -1;
    return shortRec(0,0,0);
}
</pre>

</p>


                        <p>
                        <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br />
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
