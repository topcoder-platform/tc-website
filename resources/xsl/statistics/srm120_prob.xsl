<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
 	<TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
		<TR>
			<!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
		    <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A></TD>
		</TR>    		
		</TABLE>
		</TD>
	</TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 120</B><BR/>
Wednesday, November 13, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<FONT SIZE="+2"><B>Dialup</B></FONT><BR/>

    Used as: Division-II, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">214 / 225 (95.11%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">201 / 214 (93.93%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>dre2xl</B> for 248.72 points
        </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
  <P><FONT SIZE="-1">Reference implementation:  <B>sshakya</B></FONT></P>
<P>
<B>Implementation</B>
</P>

<P>
 Some basic string functions available in any language make this problem quite easy. For each string in the input array, use the indexOf (Java/C#) or find  method on that string to locate the first occurrence of the character 'S'. If there is an 'S', then these methods will return the 0-based index of its first occurrence. Add one to this index and add it to an accumulator. If there is no occurrence of 'S' in the string, then these methods will return -1, in which case you add the length of the string to the accumulator. Once you perform this step for each of the strings in the input array, return the value of the accumulator.
</P>

<BR/>

<FONT SIZE="+2"> <B>Auto</B></FONT><BR/>
    Used as: Division-II, Level 2:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">600</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">70 / 225 (31.11%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">24 / 70 (34.29%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>nite_owl</B> for 477.23 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
<P><FONT SIZE="-1">Reference implementation: <B>\u0043\u0042</B></FONT></P>

<P>
<B>Implementation</B>
</P>

<P>
 "He can use any item in the list either once, or not at all."
</P>

<P>
As soon as a statement like this is seen in a Division-II statement, it should become immediately apparent that the solution will consist of iterating through the integers from 0 to 2<SUP>n</SUP> - 1 inclusive and using the binary representation of each integer to represent a potential set of choices. The notion of an item that can either appear or not appear in a set corresponds precisely to a binary digit. For n items, the binary representations of all the integers between 0 and 2<SUP>n</SUP> - 1 inclusive collectively represent every possible way such a set can be formed from these items.
</P>

<P>
Now, the problem statement describes the process as split into two steps: first, obtaining the best horsepower, then adding on the best set of features with the leftover money. However, it is easy to combine these all into a single instance of the loop above. For each set we generate using the above process, we can determine its cost, how much horsepower it provides, and how many accessories it contains, all at once. We can then use these properties to determine which of these combinations is most optimal. If one combination yields more horsepower than another, then it is more optimal. If they each yield the same horsepower, then the one that yields the most accessories is more optimal. If they each yield the same horsepower and number of accessories, then the one that is cheaper is more optimal.
</P>

<P>
The reason why number of accessories takes precedence over price is because an item either contributes as horsepower or an accessory, but never both. Thus if we have two combinations that yield the same horsepower, then we will also generate two more combinations that have the accessory items switched between the two (because they are independent). Thus we only need to use cost as a tiebreaker when both horsepower and number of accessories are the same. This is why we are able to solve this problem with a single iteration over combinations.
</P>


<BR/>



<FONT SIZE="+2">
  <B>Vending</B>
</FONT>
<BR/>

    Used as: Division-II, Level 3
            :<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1000</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">63 / 225 (28%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">31 / 63 (49.21%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Lonely Stranger</B> for 800.66 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

    Used as: Division-I, Level 2
            :<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">450</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">88 / 113 (77.88%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">76 / 88 (86.36%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>ColinMacLeod</B> for 393.78 points</TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

Reference implementation: <B>venco</B><BR/>
Reference implementation: <B>slowjoe</B><BR/>

<P>
<B>Implementation</B>
</P>

<P>
 This problem is a more or less straightforward simulation, and arguably is easier than the Auto problem. All the state that needs to be stored can be stored in the parameters themselves (that is, coinCounts and drinkCounts). So we just need to process each event in turn, determine whether it corresponds to a drink being dispensed, and modify coinCounts and drinkCounts only when a drink is dispensed.
</P>

<P>
There are three requirements for a drink to be dispensed. The first, which is trivial, is that the amount of money input must be greater than or equal to the cost of a drink. The second, which is also trivial, is that there must be at least one drink available of the requested type. The third requirement is that the machine must be able to make exact change using the coins it contained before the event plus the coins that were input by the event.
</P>

<P>
This third requirement is the root of the problem. Make temporary values to represent the total number of each type of coin available in the machine after the user has inserted his coins, and compute the amount of change that must be returned. To determine whether change can be returned, and which coins should be returned to satsify the problem constraints, iterate through all the possible ways to compose the required amount using the available coins in order. Then the first working combination that is found is the one that is used.
</P>

<P>
To do this, I used two nested for loops. The outer loop iterated through possible numbers of quarters in descending order:
</P>

<PRE> for(int q = Math.min(quarters, change / 25); q &gt;= 0; q--) </PRE>

<P>
Within this loop, I did the same thing with dimes:
</P>

<PRE> for(int d = Math.min(nickels, (change - 25 * q) / 10); d &gt;= 0; d--) </PRE>

<P>
 For nickels, no loop is required, because the number of nickels needed is determined by our previous choices for the number of quarters and dimes: int n = (change - 25 * q - 10 * d) / 5. If the number of nickels required is less than or equal to the number of nickels available, then we have determined the combination of change that should be returned. So we dispense a drink (i.e., increment our return value), subtract the appropriate drink from drinkCounts, add the input coins to coinCounts, and subtract the combination of coins we chose for change from coinCounts. If we reach the end of the loop over quarters without finding any combination that forms change, then we do not dispense a drink and return the user's change (which consists of just leaving our state alone).
</P>

<P>
It should be noted that the test data for this problem contained an egregious error on my part, as it did not contain any test cases that would break solutions that employed a greedy algorithm for making change. Such an algorithm would look like:
</P>

 <PRE>int q = change / 25;
int d = (change - 25 * q) / 10;
int n = (change - 25 * q - 10 * d) / 5;</PRE>

<P>
In other words, the greedy solution is equivalent to performing only the first iteration of the outer and inner loops in the non-greedy process described above. The lack of challenge phase simply exacerbated the problem of poor test data in this case.
</P>


<FONT SIZE="+2">
  <B>Soundex</B>
</FONT>
<BR/>

    Used as: Division-I, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">300</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">98 / 113 (86.73%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">65 / 98 (66.33%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>b0b0b0b</B> for 262.94 points</TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

<FONT SIZE="-1">Reference implementation:
    <B>SnapDragon</B>
</FONT>
<BR/>
<P>
<B>Implementation</B>
</P>

<P>
 This is one of my favorite problems. Several coders may have seen Soundex encoding before, but there are many descriptions of how to do it out there. In fact, perl has a module for doing Soundex encodings, but the method it employs differs from the one specified in this problem. This specification of Soundex encoding is equivalent to that encountered in The Art of Computer Programming Vol. 3. Many descriptions of Soundex on the web leave out Step 3 (which is what makes this problem tricky).
</P>

<P>
To solve this problem I maintained two arrays. The first was just the original string, and the second was an array of integers representing Soundex codes. I then simply processed the steps carefully and in order.
</P>

<OL>
	<LI>Step 1 and 2: This step consists of removing uncoded letters and replacing letters with codes. Rather than removal or replacement, I just populated the integer array with codes for corresponding letters, because we will need the original letters for the next step. Vowels I encoded as -1, and 'H' and 'W' I encoded as 0.</LI>
	<LI>Step 3: This step consists of removing all but the first code for any chain of letters with the same code that are adjacent in the original word. My processing for this step consisted of looping over the codes array. For each code greater than 0 that I encountered, I looked ahead until I encountered the end of the array or the first code greater than 0 that was not equal to the current code or -1. Thus the right counter will point to the first character that is either a vowel or has a different code. I then set all codes between the left and right indices, exclusive, to -1 (to represent discarding them).</LI>
	<LI>Step 4: This step consists of forming the return value. In all cases, the first character is the uppercase version of the first character of the input string. Ignoring the first element of the codes array, we obtain up to three of the next codes that are greater than 0. We append character representations of these codes to the return value. If the return value's length is less than 4, we append the appropriate number of '0' characters to bring it to the proper length.</LI>
</OL>




<BR/>
<FONT SIZE="+2"><B>GradedOrder</B></FONT>
<BR/>

    Used as: Division-I, Level 3:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1000</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">13 / 113 (11.5%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">9 / 13 (69.23%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>John Dethridge</B> for 695.30 points</TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
  <FONT SIZE="-1">Reference implementation:<B>Oblok</B><BR/>
  Reference implementation:<B>dd</B>
  </FONT>

<BR/>
<P>
<B>Implementation</B>
</P>

<P>
 Problems of this sort have been seen on TopCoder several times before. It is a matter of determining what the kth value in a lexicographically sorted list will be. Thus the solution for this problem is roughly similar to that used with other lexicographical sorting problems.
</P>

<P>
The key to this problem is to be able to count terms without iterating them. In the problem statement, the formula C(m + n, n) is given for counting the number of terms in a full polynomial of m variables and degree n. The derivation of this formula will go a long way toward explaining how to solve this problem.
</P>

<P>
Note that a full polynomial of degree n contains all of the terms of a full polynomial of degree n - 1, with just the addition of all the monomials formed of degree n. Thus we have the makings of a recurrence relation. Our base case is the full polynomial of degree 0: 1. To get to the next degree i, we have to add on the number of monomials of degree i.
</P>

<P>
So how do we count the number of monomials of m variables and degree i? Well, the degree i tells us that we just have to choose from our set of variables i times to form a monomial. Since duplicates are allowed, this corresponds to the well-known combinatorical formula C(m + i - 1, i) (sometimes referred to as the multichoose function). While not really relevant to solving this problem, the formula C(m + n, n) from above is thus derived by the summation of C(m + i - 1, i) for 0 &lt;= i &lt;= n, another well-known combinatorical formula.
</P>

<P>
Since we know how to count the number of monomials there can be of m variables and degree i, we can quickly locate the degree of the kth monomial. First we count the number of monomials of degree n. If this count exceeds k, then monomial k must have degree n. Otherwise, we decrement k by the count, decrement n by 1, and repeat. This takes care of the graded part of the ordering.
</P>

<P>
Once we determine the degree of monomial k, we must determine the power of each of the variables that it is composed of. This is where the lexicographic ordering comes in. Again, we use our formula for counting monomials, only this time we use it to determine the power of each variable in the kth monomial, one variable at a time.
</P>

<P>
Suppose the degree of the monomial has to be d. First, we count how many monomials there are of degree d where the first variable is raised to the dth power. Obviously there is only one. If k &gt; 0, then the power of the first variable must be less than d. So we count how many monomials there are of degree d where the first variable is raised to the d - 1th power. This is equivalent to counting how many monomials there are of degree 1 using m - 1 variables. In fact, there are C(m - 1 + d - i - 1, d - i) monomials of m variables and degree d where the first variable is raised to the ith power.
</P>

<P>
Thus we use the same process that we used for determining the degree of the kth monomial to determine the power of the first variable. Once we determine the power, we update k and repeat the process for the next variable, until we know the power of each variable in the kth monomial. It is then a simple matter to convert these powers into a string representation of the monomial and return it.
</P>

<P>
For reference, here's an implementation of the choose function that uses only 32-bit integers (in C):
</P>

<PRE>
unsigned choose(int n, int m)
{
    unsigned result;
    int i, d;

    result = 1;
    for(i = 1; i &lt;= m; n--, i++) {
        if(!(n % i)) {
            result *= n / i;
        } else if(!(result % i)) {
            result = result / i * n;
        } else {
            d = gcd(n, i);
            result = result / (i / d) * (n / d);
        }
    }
    return result;
}

</PRE>
   
<P>
    A Java implementation would have to use long instead of unsigned, since Java lacks unsigned types, although the constraints were chosen so that this function would never need to return a value greater than Integer.MAX_VALUE.
</P>

<P>
Most solutions did not use the choose function directly, but instead implemented recurrence relations that effectively did the same thing. These solutions typically used memoization to speed things up.
</P>
          
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
