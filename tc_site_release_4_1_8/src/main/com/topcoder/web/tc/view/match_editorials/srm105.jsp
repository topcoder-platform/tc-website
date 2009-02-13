<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505522" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 105</span><br>Wednesday, July 24, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<P>
<B>StringSet</B> (Value 250)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505522" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 1:
</P>

<P>
Submission Rate - 185/204 (90.69%) <BR/>
Success Rate - 165/185 (89.19%) <BR/>
High Score - <B>Liam</B> for 247.44 points<BR/> 
</P>

<P>
<B>Implementation</B>
</P>

<P>
This problem consists of building and maintaining a set (or rather the complement of a set). Since the alphabet consists of 26 letters (which, even more conveniently, are represented by a contiguous range of ASCII values), we only need a boolean array of length 26. For each letter we encounter, we mark its corresponding index in the boolean array (which is found by subtracting the value 'A' from the character). 
</P>

<P>
After we have iterated through all of the characters, we build a string by iterating through the alphabet in order. For each unmarked index in the array, we append the letter that corresponds to that index (found by adding the value 'A' to the index) to the string. After we traverse the entire alphabet we return the string. 
</P>


<P>
<B>Stream</B> (Value 550)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505522" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2:
</P>

<P>
Submission Rate - 123/204 (60.29%) <BR/>
Success Rate - 75/123 (60.98%) <BR/>
High Score - <B>FrodoB</B> for 448.12 points<BR/>
</P>

 
<P>
Used as: Division-I, Level 1: (Value 250)
</P>

<P>
Submission Rate - 121/127 (95.28%) <BR/>
Success Rate - 107/121 (88.43%) <BR/>
High Score - <B>zoidal</B> for 239.35 points <BR/>
Reference implementation: <B>FrodoB</B> <BR/>
</P>

<P>
<B>Implementation</B>
</P>

<P>
One needs to be able to perform two complementary tasks in order to do this problem: decompose an integer into its component bits, and compose an integer from a sequence of bits. 
</P>

<UL>
   <LI><P> <B>Decomposition</B> <BR/>
   There are two ways to do this. If one is using Java, one can simply call the <pre>Integer.toBinaryString</pre> method to get a String representation of the bits (which everyone should know how to manipulate). Be sure to pad the beginning of the strings with as many zeros as are necessary to make the string exactly 32 characters in length. </P>   
   <P>Another method is to use the bitwise operators to extract bits. The expression value &amp; (1 &lt;&lt; n) is non-zero only if the <pre>n th</pre> bit of value is 1. Note that the order of bits in the stream is the <I>opposite</I> of the order of bits in an integer. Bit 0, as obtained by the expression just given, is the <I>last</I> bit in the bit stream. </P></LI>
   <LI><P> <B>Composition</B> <BR/>
   Again there are two methods. If one is using Java, one can use the <pre>Integer.parseInt</pre>  method with a radix of 2 to convert a string of ones and zeros into an integer. If one is using bitwise operators, then the expression value &#124;= (1 &lt;&lt; n) will set the <pre>n th</pre> bit to 1. One could also shift the value one bit to the left and then set the <pre>0 th</pre> bit using the next bit in the stream, for each bit in the stream (e.g., value &lt;&lt;= 1; value &#124;= bit;). </P></LI>
</UL>

<P>
With these tools in hand, the problem is easy. It is just a matter of following directions and being careful about padding. 
</P>

<P>
<B>GridLocks</B> (Value 900)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505522" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 3:
</P>


<P>
Submission Rate - 56/204 (27.45%) <BR/>
Success Rate - 7/56 (12.5%) <BR/>
High Score - <B>pernick</B> for 648.04 points <BR/>
Reference implementation: <B>Pernick</B> <BR/>
</P>

<P>
<B>Implementation</B>
</P>

<P>
Determining if any cell in the grid is "surrounded" consists of a familiar depth-first search (e.g., a flood fill). One can either do a DFS starting at the cell in question, or one can do a flood-fill from all of the edge cells (thus marking all the non-surrounded cells of a certain type at once). 
</P>

<P>
<B>PowerPlant </B>(Value 500)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505522" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Division-I, Level 2:
</P>


<P>
Submission Rate - 89/127 (70.08%) <BR/>
Success Rate - 50/89 (56.18%) <BR/>
High Score - <B>SnapDragon</B> for 471.96 points <BR/>
Reference implementation: <B>WishingBone</B> <BR/>
</P>

<P>
<B>Implementation</B>
</P>

<P>
Our initial approach to solving this problem might consist of a depth-first search. We start on the first day, where we only have one choice for power output. On the next day (assuming the next day is not the last day), we may have as many as three different choices for power output, dependent upon the power output chosen for the previous day. While this method would work, there might be as many as 3 <sup>48</sup>  possible choices -- far too many to compute in 8 seconds. 
</P>

<P>
An alternate approach is dynamic programming. Suppose that for any particular day, we know every output level that we can possibly have that satisfies all constraints for all the previous days, and for each such output level we know the minimum output level over all the days up to and including that particular day. Then from this information we can compute the same information for the next day. 
</P>

<P>
For each possible output level, we know we can either add 100, subtract 100, or leave as is. For each of these actions, we can determine whether the output level will be too low for the next day (or, for the last day, if the output level is not the right one at all). At the same time we maintain our minimum output level for each output level. All we need is an array of pairs of integers (or a pair of arrays of integers) for each day. 
</P>

<P>
<B>Parliament </B> (Value 1000)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505522" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3:
</P>


<P>
Submission Rate - 17/127 (13.39%) <BR/>
Success Rate - 3/17 (17.65%) <BR/>
High Score - <B>SnapDragon</B> for 544.10 points <BR/>
Reference implementation: <B>SnapDragon</B> <BR/>
</P>


<P>
<B>Implementation</B>
</P>

<P>
From the statistics it is apparent that this was a devilishly difficult problem. However, once the solution is seen, it seems much simpler. 
</P>

<P>
For each party we maintain a list of coalitions such that the sequence for each coalition ends with the given party. Each coalition can be represented as a simple bit-set (e.g., an n-bit integer for n parties). Initially each party's list of coalitions consists of a single set containing only that party. We then incrementally grow each coalition until we cannot increase the size of any coalitions. 
</P>

<P>
Suppose we wish to grow a coalition that ends with party X. We iterate through each party Y that X sympathizes with. We create a new set by adding Y to the original set. If none of the parties in this new set dislike each other, and this new set is not the same as any of the sets currently in Y's list of coalitions, then we add the new set as a new coalition in Y's list. For determining whether any parties in the set dislike each other, we can precompute all the impossible sets in advance, by iterating through all the n-bit integers (e.g., O(2<sup>n</sup>n<sup>2</sup>), which is reasonable for n &lt;= 15). 
</P>

<P>
Once we can make no more new, unique coalitions, we return the size of the largest one we constructed. We can update this value as we build the coalitions, eliminating the need to iterate through all our constructed coalitions before we return. 
</P>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
    <TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160;</TD>
      <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">COMMENTS</TD>
   </TR>                                   
</TABLE>

<P>
Hey I noticed in the overview of problem set 105 that you guys mention 
creating an array of booleans for a-z and using that to solve the problem.  
Well I had a bit of an easier way. 
</P>

<pre>
#include &lt;string&gt;
#include &lt;vector&gt;

using namespace std; 

class StringSet 
{ 
public: 
   string compliment(vector&lt;string&gt; input) 
   { 
      string output = ""; 
      for(int x = 'A'; x &lt;= 'Z'; x++) 
      { 
         bool found = false; 
         for(int y = 0; y &lt; input.size(); y++) 
         { 
            if(input[y].find((char)x) != string::npos) 
               found = true; 
         } 
         if(!found) 
            output += (char)x; 
      } 
  
      return(output);    
   }
   
}; </pre>

<P>
Now, I'm not professing to be the best coder in the world, but 
I just happened to think it out this way, and I think it's better, 
but I could be wrong.  It makes use of the string find algorithm. 
</P>

<P>
<tc-webtag:handle coderId="292601" context="algorithm"/>
</P>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>

