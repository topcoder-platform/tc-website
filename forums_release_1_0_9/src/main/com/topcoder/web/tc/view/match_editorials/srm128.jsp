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
<tc-webtag:forumLink forumID="505555" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 128</span><br>Monday, January 6, 2003
<br><br>

<H1> 
The Problems 
</H1> 

<font size="+2"><b>CommonDigits</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505555" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />


    Used as: Division-II, Level 1:
   <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">180 / 219  (82.19%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">132 / 180  (73.33%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>konsept</b> for 245.66 points 
                </td>
      </tr>
    </table>
  </blockquote>

  
<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>

<h4>Implementation</h4>
<P>
As the statistics show, most people found this problem pretty doable.  Coders were asked to return the digit value that occurred most frequently, breaking ties by favoring higher order digits.  Java users could use code like this:
</P>

<P>
<PRE>
   String temp = ""+inputInt;    
immediately gaining access to the digits of the input integer.  
C++ users could use sprintf:
   char temp[20];
   sprintf(temp,"%d",inputInt);
or stringstreams:
   stringstream ss;
   ss&lt;&lt;inputInt;
   string temp = ss.str();
</PRE>
to the same effect.  Once all the digits were in a string-like structure, a simple loop construct that tallied digit counts, and broke ties based on left-most position would suffice.
</P>


<font size="+2"><b>PermutationCycles</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505555" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2:<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">107 / 219  (48.86%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">86 / 107  (80.37%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>gali</b> for 529.64 points
                </td>
      </tr>
    </table>
  </blockquote>

<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>

<BR/>
<h4>Implementation</h4>

<P>
Although slightly harder than the Easy problem, many quickly figured out what was necessary to solve the Medium.  
Coders were given n distinct integers between 1 and n inclusive, jumbled up in an arbitrary order.  
This ordering represented a permutation of the given integers.  For example:
</P>


<PRE>
int inputArray[] = {3,5,4,1,2}; ,
means if you had the integers {1,2,3,4,5} after applying the 
given permutation you would have the 
integers {3,5,4,1,2}.  In other words, 1 maps to 3, 2 maps to 5, 3 maps to 4, 
4 maps to 1, and 5 maps to 2.
</PRE>

<P>The problem asked for how many disjoint cycles were required to represent the given permutation.  
The definition of a disjoint cycle comes out of Abstract Algebra, specifically from the theory of 
Permutation Groups.  Basically, start with a number between 1 and n.  Then figure out what it maps to.  
Then figure out what that number maps to.  Continue this process until you reach the number you began with.  
For example, say we start with 1 in the example above.  Then 1 maps to 3, 3 maps to 4, and 4 maps to 1.  
This means there is a cycle denoted by (1, 3, 4).  Another disjoint cycle (disjoint meaning, it doesn't 
share any numbers with the previous cycle) is (2, 5).   Since we have accounted for all of the 5 numbers 
there is a total of 2 disjoint cycles.  Java code to implement this reasoning works as follows:
</P>
<PRE>
int count = 0;
boolean[] marked = new boolean[inputArray.length]; //for marking used numbers
for (int i = 0; i &lt; marked.length; i++) {   //make sure to account for all numbers
   if (marked[i]) continue;      //we already accounted for this number
   int j = i;    //temp used to store the value we are starting at
   count++;
   while (mark[j]) {
      mark[j] = true;
      j = inputArray[i] -1;    //  '-1' needed since array values are 1-based
            //  and we need 0-based indexing
} 
}
return count;
</PRE>

<P>
In my opinion Abstract Algebra is one of the most entertaining fields in math.  If you want to take 
an interesting course in a university setting, or acquire a challenging hobby Algebra may be just what 
you are looking for (unless you cringe at the sight of anything math related).
</P>

<font size="+2"><b>Indentation</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505555" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 3:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1100</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">31 / 219  (14.16%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">5 / 31  (16.13%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>coshx</B> for 571.10 points  
                </td>
      </tr>
    </table>
  </blockquote>

 

    Used as: Division-I, Level 2:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">93 / 119  (78.15%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">35 / 93  (37.63%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>venco</B> for 448.47 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>

<BR/>
<h4>Implementation</h4>

<P>
This problem, purely in terms of coding time, was arguably the hardest problem of the round.  
Coders were asked to determine how many blocks were present in a given piece of code.  To make 
things harder comments denoted by '#' symbols, and line-joining operations denoted by '##' symbols 
could appear just about anywhere in the input.  The basic plan is to first rid the code of the annoying 
comments and line-joins, and then worry about the block structuring.  The former is performed by 
condensing the input into one huge string (lines delimited by some unused character) and looping 
through it, or looping through the characters each element of the input one at a time.  
</P>

<P>
With the input void of comments and line-joins you can now check the block structure.  The 
important facts to realize are: 1) Blank lines should be ignored, 2) The only thing that matters on 
each line is where the first significant character is located, 3) Further indented lines start new 
blocks, and 4) Less indented lines close all open further indented blocks and must match the 
indentation of a previously open block.  A simple way to implement this "block-counter" is to 
use a stack that holds the indentations of each line, and a counter to hold the number of blocks 
encountered.  Process each line as follows: If the indentation value of the current line is greater 
than the top of the stack, push its value on the stack and increment your totalNumBlock counter.  
If it is less than the top of the stack, keep popping values off the stack until you find a value 
equal to the current indentation.  If you never find such a value return -1.  When you are done 
processing all of the lines return the value of totalNumBlock
</P>

<font size="+2"><b>Scytale</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505555" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 1:
    <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">117 / 119  (98.32%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">114 / 117  (97.44%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>antimatter</B> for 248.92 points  
                </td>
      </tr>
    </table>
  </blockquote>

<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>
 

<BR/>
<h4>Implementation</h4>
<P>
Most division 1 coders raced through this problem, a number of whom submitted solutions before 3 minutes had elapsed.  The gist of the problem is, n strings have been concatenated together one character at a time.  To get the ith string out of the scrambled mess you simply extract all characters whose position mod n is 0.  The problem gave you the scrambled string and the number of original strings (circumference in the problem) and asked for all the original strings.  Java code that implements this logic is:
</P>

<PRE>
String[] ret = new String[n];  //Decoded strings to be returned
   java.util.Arrays.fill(ret,"");   //Initialize array to contain empty strings
for (int i = 0; i &lt; codedMessage.length(); i++)  //Loop over encoded string
ret[i%n]+=codedMessage.charAt(i); //Place char on the appropriate string
   return ret;  //Return the decoded strings
</PRE>


<font size="+2"><b>SkewDecimal</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505555" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 3
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">950</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">27 / 119  (22.69%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">17 / 27  (62.96%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>WishingBone</B> for 694.52 points  
                </td>
      </tr>
    </table>
  </blockquote>

<P>
Reference implementation: <B>brett1479</B> (practice room)
</P>
<BR/>
<h4>Implementation</h4>

<P>
This problem didn't require a lot of code, but its underlying concept was less than obvious.  
Participants were asked to implement skew-decimal multiplication.  A positive number written 
in skew-decimal format is composed of the digits '0'-'9' and 'X' such that: 1) There are no 
leading zeros, and 2) Once an 'X' occurs in the number all following digits (if any) must be 
zeros.  The problem also stated the recurrence relation that correlates the positive integers 
with the skew-decimal numbers:
</P>

<PRE>
Integer 1 corresponds to Skew 1
Integer N corresponds to (Skew N-1) + 1
</PRE>

<P>
Incrementing a skew-decimal number is slightly weird.  If the number contains an 'X', 
incrementing the number means changing the 'X' to a '0' and incrementing the number to 
its left (noting the special case that '9'+1 = 'X').  If the number doesn't contain an 'X' 
increment its rightmost digit.  For example, (Skew 1X0)+1=Skew 200  and (Skew 99)+1=9X .  
The trick to this problem is realizing how much each digit in the skew-decimal number is worth.  
Notice that you must increment a particular digit 10 times to get it to change from 0 to 'X'.  
Then you must increment the entire number once to change the newly created 'X' to '0' thus 
incrementing the next higher digit.  Consider the following examples:
</P>
<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText"><b>Skew Number</b></td>
        <td style="background: #eee;" class="bodyText"><b>Integer Value</b></td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">X</td>
        <td style="background: #eee;" class="bodyText">10</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">10</td>
        <td style="background: #eee;" class="bodyText">11</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">1X</td>
        <td style="background: #eee;" class="bodyText">21</td>
      </tr>      
      <tr>
        <td style="background: #eee;" class="bodyText">20</td>
        <td style="background: #eee;" class="bodyText">22</td>
      </tr>       
      <tr>
        <td style="background: #eee;" class="bodyText">X0</td>
        <td style="background: #eee;" class="bodyText">110</td>
      </tr>      
      <tr>
        <td style="background: #eee;" class="bodyText">100</td>
        <td style="background: #eee;" class="bodyText">111</td>
      </tr> 
      <tr>
        <td style="background: #eee;" class="bodyText">200</td>
        <td style="background: #eee;" class="bodyText">222</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">X00</td>
        <td style="background: #eee;" class="bodyText">1110</td>
      </tr>      
      <tr>
        <td style="background: #eee;" class="bodyText">1000</td>
        <td style="background: #eee;" class="bodyText">1111</td>
      </tr>      
    </table>
  </blockquote>

<P>
Noticing a pattern in the above table we can see that the digit values from right to left 
(least order to highest order) are thus: 1,11,111,1111,11111,...   Using this fact it is then easy to 
convert each skew-decimal number to a long, multiply the longs together, and convert 
the long back to a skew-decimal value.
</P>

<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

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
