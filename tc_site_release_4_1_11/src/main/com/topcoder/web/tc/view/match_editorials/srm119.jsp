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
<tc-webtag:forumLink forumID="505541" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 119</span><br>Thursday, November 7, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<FONT SIZE="+2"><B>CoinFlip</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505541" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">200</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">217 / 230 (94.35%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">150 / 217 (69.12%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Wombat80</B> for 197.77 points
        </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
  <P><FONT SIZE="-1">Reference implementation:  <B>sophisticate</B></FONT></P>
<P>
<B>Implementation</B>
</P>

<P>
Simulation problems just don't get any easier than this. The task is to locate the smallest even index in the string (counting from zero) where the character at that index differs from the character following it. This is as easy as counting by twos from 0 to one less than the string length (because we'll need the next character as well). If we locate the first such index, return two plus the index: add one to switch from 0-based indexing to 1-based indexing, and add one again to count the second flip of the pair. If there is no such index, return -1. It's all just a matter of watching the string bounds and careful conversion of indices. 
</P>

<BR/>

<FONT SIZE="+2"> <B>Russian</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505541" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">450</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">190 / 230 (82.61%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">169 / 190 (88.95%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>(OO)</B> for 440.57 points 
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
<P><FONT SIZE="-1">Reference implementation: <B>(OO)</B></FONT></P>

<P>
<B>Implementation</B>
</P>

<P>
The next Division-II problem was hardly more difficult than the first. The task for this problem is basically to apply a simple filter to the strings given in an input list. This filter removes all strings which contain characters not in the set ABCEHKMOPTXY034, which in itself is another filtering problem. 
</P>

<P>
The easiest way to solve the nested filtering problem is to define a string containing the characters in the set above. Then, for each character in a particular string, use String.indexOf or string.find or strchr or something similar to locate that character in the string containing valid characters. If it is not in the string of valid characters, then the word should be filtered out. 
</P>

<P>
Thus, the problem can be solved with two nested for loops, the inner loop implementing the filter in the above paragraph, and the outer loop adding indices for words that pass the inner filter to a list, implementing the outer filter. For some languages, this list will need to be converted to a constant-sized array, but this is a trivial matter. 
</P>


<FONT SIZE="+2"><B>Pebbles</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505541" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 3:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1050</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">82 / 230 (35.65%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">50 / 82 (60.98%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Wombat80</B> for 900.99 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

    Used as: Division-I, Level 2:
  <BLOCKQUOTE>
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
        <TD CLASS="bodyText" STYLE="background: #eee;">69 / 96 (71.88%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">59 / 69 (85.51%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>SnapDragon</B> for 428.91 points</TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

<P>
<B>Implementation</B>
</P>

<P>
To solve this problem, one needs to be able to generate subsequent pile configurations, convert each pile configuration to some canonical form, and build some sort of data structure to map previous configurations to their round numbers. 
</P>

<P>
Generating subsequent pile configurations is rather easy. Simply make one new pile, containing as many pebbles as there are piles in the previous configuration. Then subtract one pebble from each pile in the previous configuration. These configurations can be stored in arrays with a maximum size of the total number of pebbles in all the piles (which is constant for the entire simulation). The transformation of one pile to the next can be done in-place. 
</P>

<P>
The method of converting a pile configuration to a canonical form (so that it can be compared to previous configurations) is also quite simple, and can be fairly arbitrary. I sorted piles by their sizes, then generated a string that contained the decimal representations of the pile sizes, each separated by commas. The primary criteria for a good canonical form is: 
</P>

<OL>
   <LI>For all pairs of configurations, if one is the same as the other, then testing the canonical forms of the pair for equality should return true </LI>
   <LI>Testing for equality between two canonical forms should be reasonably fast</LI>
   <LI>The size of the canonical form should be reasonably small</LI>
</OL>

<P>
I haven't given much thought to analysis of the complexity of this problem, so I have no quantification for points (2) and (3) above, but it seems as though there is a lot of room for what is "reasonable." 
</P>

<P>
For the mapping of configurations to their round numbers, simply use the canonical form of a configuration as a key for storing and retrieving round numbers in some sort of map. For Java/C#, a HashMap is a good choice, while in C++ a map is sufficient. These implementations allow for quick lookup to determine if the current configuration matches any previous configuration, and make it easy to store each configuration you generate for comparison to later rounds. When a configuration is generated that is already represented as a key in the map, simply return the value that the canonical form of the configuration maps to. 
</P>

<FONT SIZE="+2"><B>answer</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505541" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">350</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">66 / 96 (68.75%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">44 / 66 (66.67%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>kv</B> for 339.25 points</TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

<FONT SIZE="-1">Reference implementation: <B>venco</B></FONT>
<BR/>
<P>
<B>Implementation</B>
</P>

<P>
This problem was rather hard for a Level 1 problem, and if the statistics are any indication, it was more difficult than the Level 2 problem described above. 
</P>

<P>
For each choice of an answer as a lie (including the choice of no answer as a lie), determine what the outcome would be. For each such assumption, iterate through the questions and answers. Initially we assume that any number may be the chosen number. For each question/answer, if the answer is the one we are currently assuming to be a lie, we just flip its logic. Now, each answer eliminates certain numbers from being the chosen number. If the answer is truthful and is "YES" (or a lie and "NO"), then it means each of the numbers not in the question set are disqualified from being the answer. Otherwise, each of the numbers in the question set are disqualified. If, after the end of this process, all numbers have been eliminated, then we know that this choice of a lie generates a contradiction and we move on to the next choice of a lie. If, however, there is exactly one number not eliminated, we add it to a set of possible outcomes. Otherwise, if there are multiple numbers left, then we immediately return "NOT ENOUGH INFO". 
</P>

<P>
If we iterate through all choices of lies and do not encounter any ambiguities, then we examine the set of possible outcomes that we generated. If there are multiple numbers in this set, then the solution is ambiguous, and we return "NOT ENOUGH INFO". If there are no numbers in this set, then there was a contradiction for every single choice of a lie, and we return "CONTRADICTION". Otherwise there is exactly one number in the set, and it is the answer that we return. 
</P>

<FONT SIZE="+2"><B>convert</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505541" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
        <TD CLASS="bodyText" STYLE="background: #eee;">7 / 96 (7.29%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">2 / 7 (28.57%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>ddv</B> for 363.99 points</TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
  <FONT SIZE="-1">Reference implementation:<B>ddv</B><BR/>
  Reference implementation:<B>SnapDragon</B>
  </FONT>

<BR/>
<P>
<B>Implementation</B>
</P>

<P>
The solution to this problem is "simply" to parse the input string in all possible ways in a depth-first manner and return the outcome. However, the parsing rules make the solution a little messy. The solution isn't so difficult to conceptualize, but its implementation and description can be quite a mess (as will be demonstrated by my following attempt at an explanation). 
</P>

<P>
For each location we get to in the string, we have some sort of history, specifying assignments to each letter encountered before this location. Each assignment consists of either 1 or 5 and a power, and these can be stored in a tuple. Now, we are parsing from left to right, so we do not know the actual powers for each letter until we get to the end of the string. We only need to know the relative powers, however, so we can simply start counting powers at some arbitrary number. 
</P>

<P>
When we are at a particular location, we look ahead to the next character. If we've already given it an assignment in our history, then we keep that assignment. If it was assigned a 1, we look to see if the next character is the same as it. If so, we parse all the following characters that are the same, and obtain the representation for 2 or 3 multiplied by that character's power. We can then simply append this value to a string that we are building as we parse and move on to the next character. If the next character following that first character did not match, however, then there are two possibilities. If the following character is in the history, then its assigned value will determine how we continue parsing. If it is a 5 with a power the same as the first character's, then we append a 4 to our string, skip that next character, and continue parsing with the one following it. If it is a 1 with power one greater than the first character's, then we append a 9 to our string, skip that next character, and continue parsing with the one following it. Otherwise, we have an inconsitency, meaning some previous assignment was invalid, and we return. If the next character is not in the history, then we tentatively assign it 5 and the first character's power (if that assignment is not already taken), and continue with the character following it, and we tentatively assign it 10 with one plus the first character's power (if that assignment is not already taken), and continue with the character following it, and then we simply accept the first character as a 1 and continue parsing with the next character (that is, we try parsing it using all three possibilities). 
</P>

<P>
If the character is a 5, we check if the next character is assigned a 1 (and if unassigned, we try it as a 1), in a process similar to that above. If the next character is unassigned, we can also try taking the 5 by itself and continuing with the next character. 
</P>

<P>
If we encounter an unassigned character, we tentatively assign it 1 and 5 with the highest power that can be associated with each number without repeating a previous assignment. For each of these possible assignments we then parse as described in the previous paragraphs (which were quite a mouthful). Whenever we reach the end of the input string without inconsistencies, we will have generated a number that is a possible interpretation of the input string. We simply maintain the best interpretation as we go along. 
</P>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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
