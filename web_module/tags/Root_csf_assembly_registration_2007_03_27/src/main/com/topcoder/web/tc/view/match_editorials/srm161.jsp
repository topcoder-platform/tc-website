<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505597" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 161</span><br>Thursday, August 28, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<P>SRM 161 had a familiar script. Division 1 coders rushed through the easy and 
medium problems to be faced with a ferocious hard. SnapDragon, the first coder 
to finish, entered the challenge round in first, only a few points ahead of 
second place Tomek. In the closing minutes of the challenge round, SnapDragon 
successfully challenged Tomek pushing him well into first. He had sighted a 
nasty precision error that claimed most of the Division 1 submissions. Once 
systests had completed all but one submission of the Division 1 hard failed. As 
a result, SnapDragon beat all competitors by a large margin, solidifying his 
position as the highest rated coder ever. In Division 2, Javaholic finished all 
of the problems well before anyone else, but his medium failed systests allowing 
Chaotica to take the top spot. </P>
<H1>The Problems </H1>
<P></P><FONT size="+2"><B>CardCount</B> 
</FONT><A href="Javascript:openProblemRating(1800)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505597" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">250 </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">152 / 162 (93.83%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">125 / 152 (82.24%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>duner</B> for 246.67 
        points (3 mins 18 secs) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Average Score</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">206.61 (for 125 correct 
        submissions) </TD></TR></TBODY></TABLE></BLOCKQUOTE>
<P>When possible, it's nice to have the solution's structure mimic what's 
actually occurring in the problem. Here we have that luxury. First set up the 
variable you will be returning (String[], vector&lt;STRING&gt;,...). Then loop through 
the deck, as a dealer would, and deal one to each player. The only extra bit of 
information, is to check whether to deal another round. Java code follows: 
<br /><br />
</P>
<PRE>public String[] dealHands(int numPlayers, String deck) {
    String[] players = new String[numPlayers];
    java.util.Arrays.fill(players,""); //null Strings are annoying
    for (int left = deck.length(); left &gt;= numPlayers; ) 
   for (int i = 0; i &lt; numPlayers; i++, left--) 
       players[i]+=deck.charAt(deck.length()-left);
    return players;
}
</PRE>An alternate way would use modulus: <PRE>public String[] dealHands(int numPlayers, String deck) {
    String[] players = new String[numPlayers];
    java.util.Arrays.fill(players,""); //null Strings are still annoying
    for (int i = 0; i &lt; deck.length(); i++) {
   if (i%numPlayers==0 &amp;&amp; deck.length()-i&lt;numPlayers) break; 
   players[i%numPlayers]+=deck.charAt(i); 
    }
    return players;
}
</PRE>
<P></P><FONT size="+2"><B>StringTrain</B> 
</FONT><A href="Javascript:openProblemRating(1801)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505597" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level 
Two: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">500 </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">106 / 162 (65.43%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">70 / 106 (66.04%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>isv</B> for 428.34 points 
        (12 mins 2 secs) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Average Score</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">272.22 (for 70 correct 
        submissions) </TD></TR></TBODY></TABLE></BLOCKQUOTE>
<P>In this problem, we basically just follow directions. Initially we setup a 
string Train, upon which our processing will occur. Then we loop through the 
remaining strings, and look for matches. The big gotcha is that all matched 
prefixes/suffixes must be proper (not empty, not everything). At the end, we 
remove all but the last occurrence of each letter with a single loop. Java code 
follows: 
</P>
<PRE>public String buildTrain(String[] cars) {
    String Train = cars[0]; //Setup Train
    for (int index = 1; index &lt; cars.length; index++) {
   for (int startSuffix = 1; startSuffix &lt; Train.length(); startSuffix++) {
       String suffix = Train.substring(startSuffix);
       if (cars[index].startsWith(suffix) &amp;&amp; suffix.length() != cars[index].length()) {
      Train += cars[index].substring(suffix.length());
      break; //stop looking for suffix
       }
   }
    }
    String ret = ""; //For returning
    for (int charPos = Train.length()-1; charPos &gt;= 0; charPos--) {
   char current = Train.charAt(charPos);
   if (ret.indexOf(current)==-1) ret = current+ret;
    }
    return Train.length()+" "+ret;
}
</PRE>
<P></P><FONT size="+2"><B>TennisRallies</B> 
</FONT><A href="Javascript:openProblemRating(1802)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505597" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - 
Level Three: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">1000 </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">29 / 162 (17.90%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">19 / 29 (65.52%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Javaholic</B> for 881.15 
        points (10 mins 44 secs) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Average Score</B> </TD>
      <TD class="bodyText" style="BACKGROUND: #eee">628.18 (for 19 correct 
        submissions) </TD></TR></TBODY></TABLE></BLOCKQUOTE>Used as: Division One - 
Level Two: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
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
      103 / 124 (83.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      88 / 103 (85.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 464.13 points (8 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      317.94 (for 88 correct submissions)
    </td>
  </tr>
    </TBODY>
  </TABLE>
</BLOCKQUOTE>
<P>
This is a classic brute force problem. We have a space of possible solutions, 
namely all strings of 'c's and 'd's of a given length. We have to count all 
those that satisfy certain conditions. The method I advocate, due to its 
simplicity, is called generate-and-test. As it sounds, we will generate all 
potential strings, and test each for viability. To help explain the details of 
this process, I will illustrate two distinct methods that produce the correct 
results. In the first method, we use binary strings to represent possible stroke 
sequences. 1 will represent 'c', and 0 will represent 'd'. This works, since 
every sequence corresponds to exactly one binary string. For example, 
"cdcdcccddd" will correspond to "1010111000". The reason we introduce binary 
strings in the first place, is since we can loop through them in a very natural 
manner. Java code follows: 
</P>
<PRE>public int howMany(int numLength, String[] forbidden, int allowed) {
    int ret = 0; //to be returned
    for (int gen = 0; gen &lt; (1&lt;&lt;numLength); gen++) {  //Generate 000... through 111...
   char[] buffer = new char[numLength];
   for (int digitMask = 1,j=0; digitMask &lt; (1&lt;&lt;numLength); digitMask *= 2,j++) { //loop through bits
       if ( (digitMask &amp; gen) != 0 ) buffer[j]= 'c';  //test mask against binary string
       else buffer[j]= 'd';
   }
   String correspond = new String(buffer);
   int countForb = 0; //counts forbidden sequences
   for (int charPos = 0; charPos &lt; correspond.length(); charPos++) 
       for (int forbIndex = 0; forbIndex &lt; forbidden.length; forbIndex++) 
      if (correspond.startsWith(forbidden[forbIndex],charPos)) countForb++;
   if (countForb &lt; allowed) ret++;
    }
    return ret;
}
</PRE>Notice how digitMask will assume the values 1,10,100,1000,... in sequence. 
Using the bitwise-and operation, digitMask allows me to test whether a given bit 
is 1 in gen. After correspond has been built, I loop through looking for 
substrings that match elements of forbidden. My final if statement tests for 
whether the string has few enough forbidden sequences. Also, the char[] buffer 
was used to avoid building a lot of Strings. Even with that slight optimization, 
this method just barely runs in time (approx. 6 seconds on some test cases). 
<br /><br />In the second method, we search through the possible strings in a 
recursive fashion. Among other things, this allows us to eliminate groups of bad 
strings early on. Java code follows: 
<PRE>public int howMany(int numLength, String[] forbidden, int allowed) {
   return rec(0,numLength,"",allowed, forbidden);
}

int rec(int index, int numLength, String curr, int allowed, String[] forbidden) {
    if (index == numLength) return 1; //Base case
    int ret = 0;  //to be returned
    for (char stroke = 'c'; stroke&lt;='d'; stroke++) {
   int newAllowed = allowed;
      String newCurr = curr+stroke;
   for (int forbIndex = 0; forbIndex &lt; forbidden.length; forbIndex++) {
       if (newCurr.endsWith(forbidden[forbIndex])) newAllowed++;
   }
   if (newAllowed &lt;= 0) continue;
   ret+=rec(index+1, numLength, newCurr, newAllowed, forbidden);
    } 
    return ret;
}
</PRE>
The recursive function rec tries each possible character ('c' or 'd') for 
each position. It is also optimized to look for forbidden sequences at each 
recursion level. This way a generated string with a bad prefix will be ignored 
early on, thus accelerating the process. Understanding the recursive method may 
require more thought for some. When I think about how this function works, I 
consider how it behaves on a given index. Basically, when rec is called and 
index is k, it considers strings that have either 'c' or 'd' in position k. The 
concept lurking between the lines of code states that all strings can be divided 
in to 2 groups. Strings with 'c' in position k, and strings with 'd' in position 
k. 
<P></P><FONT size="+2"><B>IsHomomorphism</B> 
</FONT><A href="Javascript:openProblemRating(1807)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505597" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - 
Level One: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      119 / 124 (95.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      117 / 119 (98.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 294.29 points (3 mins 58 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      244.68 (for 117 correct submissions)
    </td>
  </tr>

    </TBODY>
  </TABLE>
</BLOCKQUOTE>
<P>Once you figure out what the problem is asking, this one is really quick. 
When you want to compute the results of @, the first operation, use the source 
matrix. When you want to compute the results of ~, the second operation, use the 
target matrix. Java code follows: <PRE>public String[] numBad(String[] source, String[] target, int[] mapping) {
    ArrayList al = new ArrayList();
    for (int a = 0; a &lt; source.length; a++) 
   for (int b = 0; b &lt; source.length; b++) 
       if (mapping[source[a].charAt(b)-'0'] != target[mapping[a]].charAt(mapping[b])-'0') 
      al.add("("+a+","+b+")");
    return (String[])al.toArray(new String[0]);
}
</PRE>
</P>
<P></P><FONT size="+2"><B>PermutationValues</B> 
</FONT><A href="Javascript:openProblemRating(1752)"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505597" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - 
Level Three: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
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
      6 / 124 (4.84%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1 / 6 (16.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 545.81 points (32 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      545.81 (for 1 correct submission)
    </td>
  </tr>

    </TBODY>
  </TABLE>
</BLOCKQUOTE>
<P>The key to this problem is that 64-bit data types really aren't that big. 20! 
is the largest factorial you can fit in a signed 64-bit integral type. The moral 
of the story is, you only need to look at the last 20 set of numbers when 
considering the permutation, all others are fixed. The first thing we do is 
check whether lexPos is greater than the total number of permutations. This can 
only occur if the total quantity of numbers is at most 20, and lexPos is large. 
If this is the case, we compute its remainder mod (total quantity)!. Next we 
factorially decompose lexPos. I'll show you an example. Let's say lexPos is 47. 
We can represent it as 1321, where the place values are 4!,3!,2!, and 1! 
respectively. In other words, 1321 would be evaluated as 1*4!+3*3!+2*2!+1*1!=47. 
<br /><br />Once we have such a decomposition, we can quickly evaluate the lexPosth 
permutation. For example, lets say we have the set of numbers 1,2,3,4,5. Every 
time we change the first value to be one higher, we advance the lexicographic 
position by 4!. This is clear when we realize that 2,1,3,4,5 will come after any 
permutation that begins with 1. There are exactly 4! of these. Continuing on 
with each digit, we can calculate the entire set of permuted values. If we 
wanted the permutation corresponding to a lexPos of 47 we would get 2, 5, 3, 4, 
1. More explicitly, we started with 1,2,3,4,5. Then:</P>
<OL>
  <LI>Took 2. We are now left with 1,3,4,5. </LI>
  <LI>Took 5. We are now left with 1,3,4. </LI>
  <LI>Took 4. We are now left with 1,4. </LI>
  <LI>Took 3. We are now left with 1. </LI>
  <LI>Took 1. </LI>
</OL>
<p>Notice how the values we took correspond to the factorial 
decomposition of 47. Had the numbers been split across multiple ranges, we could 
just think of them as (1,2,3,4,5...) and then convert back to their actual 
values at the end. The only other trick to this problem was working with 64-bit 
values. Since lows[] and highs[] were 32-bit values, it was easy to make a 
mistake calculating a range size. For example, 'long a = highs[i]-lows[i]+1' 
would fail due to 32-bit overflow if highs[i] and lows[i] were far enough apart.</p>

<div class="authorPhoto">
    <img src="/i/m/brett1479_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
