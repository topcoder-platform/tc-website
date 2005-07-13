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

<title>TopCoder | Statistics</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
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
                <xsl:with-param name="title">&#160;TC Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />

<!--body contextual links-->
                        <table border="0" cellspacing="1" cellpadding="3" width="100%">
                            <tr valign="middle">
                                <td bgcolor="#43515E" class="moduleTitle" colspan="2">MATCH EDITORIAL LINKS:</td>
                            </tr>
                          
                            <tr valign="middle">
                                <td class="bodyText" align="center" bgcolor="#CCCCCC"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyGeneric">Archive</a></td>
                                <td class="bodyText" align="center" bgcolor="#CCCCCC"><a href="mailto:editorial@topcoder.com" class="bodyGeneric">Comments/Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
                   
                        <img src="/i/clear.gif" alt="" width="1" height="6" border="0" /><br />
                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
                                        
                        <p><strong>Single Round Match 148</strong><br />
                      Wednesday, May 28, 2003</p>
										
                        <h2>Match summary</h2>
                        
                        <p>SRM 148 went off without a hitch.  The division one set featured a deceivingly hard 1100 point problem that stumped most of the coders.  <b>SnapDragon</b>, who won the match, finished the first two problems before most 
coders finished the first.  He successfully finished every problem quicker than all other coders.  <b>SnapDragon</b> was on pace to complete the entire round in 30 minutes until he ran into the 1100 point problem.  
Numerous other coders also sped through the first two, later to be stopped in their tracks by the hard.  Once the challenge phase ended very few 1100 submissions still remained.  In division two, a new coder by the name 
<b>bogklug</b> scored 1733.52 winning his division by a wide margin.  Division two coders did remarkably well on a relatively difficult set lending credence to the theory that their average ability is increasing steadily.</p>

<P><B>Problem Set Analysis &amp; Opinion</B></P>

<font size="+2"><b>DivDigits</b></font><br />
Used as: Division Two - Level One:
<blockquote>
<table cellspacing="2" cellpadding="3">
<tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">197 / 211  (93.36%) </td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">165 / 197 (83.76%)</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Sleeve</b> for 249.49 points</td></tr>
</table>
</blockquote>
<p>
The key to this problem is to first represent the input integer as a string.  Once that is complete, loop through each character and test for divisibility.  Just be sure not to try 0, 
since your divisibility check may throw an exception.
</p>
<font size="+2"><b>CeyKaps</b></font><br />
Used as: Division Two - Level Two:
<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">600</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">161 / 211  (76.30%) </td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">143 / 161  (88.82%)</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>MadProgrammer</b> for 589.08 points</td></tr>
</table>
</blockquote>
<p>
This problem resembles a topic in algebra called permutation groups.  The permutation in this problem has been represented as a series of key swaps.  
There is actually a theorem of algebra that says any permutation can be represented as a list of swaps.  Anyways, lets look at one possible set of swaps, and use that analysis to come up with 
an algorithm.  Lets say the key that was produced as output was an 'A' and the swaps were "A:B","C:D","B:C","C:D","A:E".  This means the key that produces the letter 'A' initially had an 'A' cap.  
That 'A'-cap became a 'B'-cap after the first swap.  The second swap did not affect it.  The third swap changed that 'B'-cap to a 'C'-cap.  The fourth changed the 'C'-cap to a 'D'-cap.  T
he last didn't affect it.  Thus, the cap that ended on the 'A'-key was the 'D'-cap so the user hit 'D' to produce the 'A'.  Repeating this process on each output letter produces the return value.  
Java code to do this looks like:
<pre>
public String decipher(String typed, String[] switches) {
	String hmm = "";
	for (int i =0; i &lt;typed.length(); i++) {
		char curr = typed.charAt(i);
		for (int k = 0; k &lt; switches.length; k++) {
			if (switches[k].charAt(0)==curr) 
				curr=switches[k].charAt(2);
			else if (switches[k].charAt(2)==curr) 
				curr=switches[k].charAt(0);
		} hmm+=curr;
	} return hmm;
}
</pre>
</p>
<font size="+2"><b>MNS</b></font><br />
Used as: Division Two - Level Three:
<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">52 / 211  (24.64%) </td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">36 / 52 (69.23%)</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>bogklug</b> for 940.69 points</td></tr>
</table>
</blockquote>
<p>

</p>
Used as: Division One - Level Two:
<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">450</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">114 / 151  (75.50%) </td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">95 / 114 (83.33%)</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 447.54 points</td></tr>
</table>
</blockquote>
<p>
Given the numbers, simply try all permutations and check each to see if it is valid.  Validity amounts to checking whether the row sums and column sums are equivalent.  
To remove duplicates you can either use a set data structure that will check automatically, or you can divide out to remove potential duplicates.  For example, if the number 
3 occurred 4 times, dividing by 4! removes all duplicates associated with swapped 3's.  To actually generate the permutations, a recursive algorithm that tries each order 
does the trick.  C++ coders can use the built in next_permutation function for a similar effect.  As an alternate method, Java users can implement an iterative next 
permutation function much like the one found in the C++ library.  Such an implementation follows: 
<pre>
//Members of vals must be distinct
//Based on C++ next_permutation function
int[] nextperm(int[] vals) {
	int i =  vals.length-1;
	while (true) {
		int ii =  i;
		i--;
		if (vals[i] &lt; vals[ii]) {
			int j = vals.length;
			while (vals[i] >= vals[--j]);
				int temp = vals[i];  //Swap
				vals[i] = vals[j]; 
				vals[j] = temp;
			int begin = ii, end = vals.length-1;
			while (end>begin) {
					int stemp = vals[end];	//Swap
					vals[end] = vals[begin]; 
					vals[begin] = stemp;
				end--; begin++;
			}	
			return vals;
		} else if (vals[i] == vals[0]) {
			int begin = 0, end = vals.length-1;
			while (end>begin) {
					int stemp = vals[end];	//Swap
					vals[end] = vals[begin]; 
					vals[begin] = stemp;
				end--; begin++;
			}	
			return vals;
		}
	}
}
</pre>

Since nextperm only works on lists of numbers without duplicates we will use a sort of hack to get it to work.  Generate an array containing the numbers 0-8.  Permute that array to get all 
permutations.  Use the permuted list of numbers at any one point as the ordering to impose on the actual list that may contain duplicates.
</p><font size="+2"><b>Circlegame</b></font><br />
Used as: Division One - Level One:
<blockquote>
<table cellspacing="2" cellpadding="3">
<tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">143 / 151  (94.70%) </td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">104 / 143 (72.73%)</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 243.96 points</td></tr>
</table>
</blockquote>
<p>
Given a set of cards, and two operations, your code should repeat those operations until a state has been reached where the operations cannot be performed.  
You could try to perform as many operations as possible on each iteration, but that may complicate the code.  Easier is to do perform 1 operation each time, 
and just start all over again.  This basically consists of:  Search for a 'K', if you find it remove it and start all over, if not search for a consecutive 13 pair, 
remove it, and start all over.  Repeat till you can't find any more.
</p>
<font size="+2"><b>NumberGuessing</b></font><br />
Used as: Division One - Level Three:
<blockquote>
<table cellspacing="2" cellpadding="3">
<tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1100</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">12 / 151  (7.95%) </td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">5 / 12 (41.67%)</td></tr>
<tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 496.57 points</td></tr>
</table>
</blockquote>
<p>
At first glance, you realize the problem is going to be some sort of recursion.  Each player that follows you is going to employ a similar strategy on a smaller data set.  
Even the constraints sort of screamed recursion (range^numLeft&lt;1000000).  The way I see it, there were two tricks that drastically increase the difficulty of this problem.  
The first is, running time.  Even with the constraints, a pure bf solution will probably time out.  In addition, data must be passed backwards and forwards through the 
recursion adding another element of difficulty.  That said, there are also many rounding issues to deal with when comparing various guesses.<br/>
<br/>
The recursion splits into two cases: Someone guesses after you, or you are the last one to guess.  If you are the last one to guess, then you should have a list of everyone else's guesses.  Lets say the following line represents the range of numbers, with X's representing previous guesses:<pre>
------X--------X-------X-----X-X-----</pre>
The key insight is that the number of places you have to check is very limited.  I will mark these places with O's:<pre>
-----OXO-------XO------XO----XOXO----</pre>
In other words, the only places to check are right after all previous guesses, or right before the first guess.  Simply take the one that produces that best score.  As for the other case, you will guess all possible places that haven't been guessed already, and then recursively call the next guy.  Once that call returns, you will have a list of future guesses parameterized by your current guess.  Evaluate your score on each possibility and return the best, lowest one.<br/>
<br/>
Now comes the score evaluation part.  Lets you are looking at a range between two guesses like:<pre>
-------X-------X----------
          here</pre>
The score of any choice in that range is the number of spots between the X's plus 1 divided by 2.  Here it would come out to (7+1)/2 = 4.  On the other hand lets say your guess falls on an end:<pre>
-------X-------X----------
 here</pre>
In this case compute the same calculation as before from where you are, to the next closest guess.  Then add to that all of the spots before you.  For example:<pre>
------O----X--------...</pre>
Lets say your guess is the O and the X represents the closest guess.  Including where you guessed, there are 5 spots from the O to the the X that should be calculated as above ( (5+1)/2 = 3).  Then there are the 6 spots before you that just get added on.  (3+6=9).  So the score for this guess is 9.
</p>

                            
                        
                      

                        <img src="/i/m/brett1479_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br />
                        <div class="smallText"><em>TopCoder Member</em></div><br clear="all" />
                        

                    </td>
                </tr>
            </table>
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
