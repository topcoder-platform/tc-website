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
<tc-webtag:forumLink forumID="505534" message="Discuss this match" /></div>
<span class="bodySubtitle">2002 TopCoder Invitational<br>Online Round #1, Part 2</span><BR/>Friday, October 11, 2002
<br><br>

<H1> The Problems </H1> 

<font size="+2"><b>Whisper</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505534" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">300 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">295/324 (91.05%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">154/295 (52.20%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>eduar09</b> for 289.89 points 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
        221.85 
        </td>
      </tr>      
    </table>
    <P>169 out of 323 coders who opened Whisper, received 0 points.</P>
    </blockquote>
<P><B>Implementation</B><BR/>
The problem was straightforward enough for Level 1 problem and solution should involve no complicated algorithms or recursion (well unless one would did something very complicated and unnecessary). Nevertheless the problem had only about 50% success rate, which is attributed to the number of special cases one should consider when solving this problem.</P>

<P>The first thing to do to solve this problem is to return &quot;not as whisper&quot; if first 5 characters are not equal to &quot;/msg &quot;. Actually it would be a good idea to convert entire string to lower case before you do anything. 
Most of the fast and successful solutions chose the following tactics to solve the problem: 
Create a new string = &quot;/msg &quot; + name + &quot; &quot; and check if the message starts with this string. If it does, check if name used to create this string is longer than the best so far and memorized it if it is longer. When you have finished checking all the names, the &quot;best so far&quot; variable would be empty of no solutions are found or would have the longest name of the person to send the message to.
</P>

 

<font size="+2"><b>Execution</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505534" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
 Used as: Level 2<BR/>
 <blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">183/324 (56.50%)
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">107/183 (58.47%)
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>SnapDragon</b> for 499.13 points 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
        317.76  
        </td>
      </tr>
    </table>
  </blockquote>
  <P>208 out of 315 coders who opened Execution, received 0 points.</P>
  <P>Reference implementation: slavik (practice room)</P>
  
<P><B>Implementation</B><BR/>
I think the hardest part to solve this problem was to correctly parse the input. I think the best way to go about doing it is to append entire string array into a single string and then work with it. The grammar of the input was enforced by the problem statement so it would be enough to only look for specific characters inside the string like 'B','(','{','}'.
</P>
<P>
The recursive function shall be build to take a string and return a number of iterations inside this string.<BR/>
Start going through the string char by char and do the following:<BR/>
   Maintain the state of the scope:</P>
    <PRE>
      Set initial scope to 0<BR/>
      if '{' found, increment scope state<BR/>
      if '}' found, decrement scope state<BR/>
   if scope==0 (it means you are NOT inside the nested loop)<BR/>
    do the following:<BR/>
      if 'B' found count++;<BR/>
      if '(' found, read number of iterations inside the<BR/>
        loop into a temp variable &quot;last_loop&quot;<BR/>
      if '{' found, start_loop = current postion<BR/>
      if '}' found, count += last_loop * call to<BR/>
         myself(new string(start_loop , current position) )<BR/>
   Return &quot;count&quot; when entire string is parsed. <BR/>
    To solve this problem correctly one should realize<BR/>
    that a number inside a &quot;for&quot; structure is a 64 bit integer.<BR/>
    For C++ coders I have seen 3 approaches on how to read this number:<BR/>
   1. sscanf( str.c_str(), &quot;%lld&quot;, &amp;y ); (by SnapDragon)<BR/>
   2. atoll(str.c_str())<BR/>
   3. Create a for loop to build a 64 bit number digit by digit.
    </PRE>
<font size="+2"><b>Decimal</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505534" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 3<BR/>
 <blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">900 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">54/324 (16.67%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">33/54 (61.11%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>SnapDragon</b> for 845.10 points 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
        622.13  
        </td>
      </tr>      
    </table>
  </blockquote>
  <P>198 out of 231 coders who opened Logical, received 0 points.</P>
  <P>Reference implementation: SnapDragon </P> 
<P><B>Implementation</B><BR/></P>
<P>
The solution to this problem is straightforward once you know what to look for. To solve this problem we should remember how we were taught to dive two numbers in elementary school: 
<OL>
<LI>Dived two numbers by finding the whole part and a reminder (The whole part can be ignored for the purpose of this problem.</LI>
<LI>Go to Step 1 with new dividend = reminder multiplied by 10.</LI>
</OL>
</P>
<P>To find the repeating sequence we just have to keep track of the reminders. Once you have found a reminder, which you have seen before, the sequence will repeat itself indefinitely.</P>
<P>Check how many divisions were done between two identical reminders and see if this number falls into lower and upper bound.</P>
<BR/>

<p>
<img src="/i/m/slavik_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="160082" context="algorithm"/><br />
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
