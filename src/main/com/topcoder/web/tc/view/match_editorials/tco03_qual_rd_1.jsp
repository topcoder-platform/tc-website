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
<tc-webtag:forumLink forumID="505603" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Open <br> Qualification Round 1</span><BR/>Tuesday, October 7, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p> 
The first competition of the 2003 TopCoder Open sponsored by Intel<sup>&#174;</sup> came off pretty smoothly, with 3 relatively easy problems and 621 competitors.  In fact, 140 out of the 621 people solved all 3 successfully.  In order to advance to the next round of the TCO, you needed to get at least 590 points tonight, which amounted to solving the easy and medium problems pretty quickly (in around 25 minutes).  In this competition, the strategy pioneered by dmwright of skipping the medium problem might have made sense for some coders, since solving the easy and hard problem all but guaranteed you would make the cut.  Only 3 out of 157 coders who solved both the easy and the hard did not have enough points to advance from those two problems alone.
<br/><br/>
Two relative new comers, mathijs and snewman, took first and second, respectively, each in his second competition.  snewman was leading the round going into the challenge phase, but mathijs was able to find two bits of bad code, and gained 100 points, edging out snewman by a meager 14 points.  wleite rounded out the top three, 32 points behind mathijs.  The top three rated coders going into this match - ambrose, zoidal and Joe - all ended up advancing with respectable scores, so no surprises there.
</p> 
  
<H1> The Problems </H1> 

<font size="+2"><b>MissingLetters</b></font> 
<A href="Javascript:openProblemRating(1610)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505603" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      589 / 629 (93.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      541 / 589 (91.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>coachbudka</b> for 249.56 points (1 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      221.79 (for 541 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
There are a couple of ways to go about this problem.  If you know a little bit about your language's string library, you can do something like this (shown here in Java):
<pre>
   public String getMissingLetters(String sentence){
      String s = sentence.toUpperCase();
      String ret = "";
      for(char c = 'A'; c&lt;='Z'; c++){
         if(s.indexOf(c)==-1)ret+=c;
      }
      return ret;
   }
</pre>
Without the indexOf() and the toUpperCase() function, you could always initialize a boolean array with 26 elements, each of which represents whether or not a character is present.  It would go like this (in C++ this time):

<pre>
   string getMissingLetters(string sentence){
      bool present[26] = {};
      for(int i = 0; i&lt;sentence.size(); i++){
         if(sentence[i] &gt;='A' &amp;&amp; sentence[i] &lt;= 'Z'){
            present[sentence[i]-'A'] = true;
         }else if(sentence[i] &gt;='a' &amp;&amp; sentence[i] &lt;= 'z'){
            present[sentence[i]-'a'] = true;
         }
      }
      string ret;
      for(int i = 0; i&lt;26; i++){
         if(!present[i]){
            ret.push_back((char)(i+'A'));
         }
      }
      return ret;
   }
</pre>
</p> 

<font size="+2"><b>Inserter</b></font> 
<A href="Javascript:openProblemRating(927)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505603" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      488 / 629 (77.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      387 / 488 (79.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>RaginAzn</b> for 471.30 points (7 mins 5 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      316.96 (for 387 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Again, familiarity with the string operations in your language makes this problem a lot easier.  For each element of commands, you first tokenize the command into two strings - &lt;insert&gt; and &lt;before&gt; - and an integer, &lt;index&gt;.  Then, you should go through the working string (which starts out as original) and find the proper occurrence of &lt;before&gt;.  This can be done best with the indexOf method in Java (find() in C++).  In Java, finding the position of the correct occurrence of &lt;before&gt; goes like this:
<pre>
<font color="blue">//initialize the index of the occurrence to -1 so that we search 
//from character 0 the first time</font>
   int pos = -1;
<font color="blue">//loop up to <b>index</b> times, each time finding the next 
//occurrence of <b>before</b></font>
   for(int j = 0; j &lt; index; j++)
   {
<font color="blue">//set pos to the position of the next occurrence of <b>before</b>,
//starting one character after the current position</font>
      pos = original.indexOf(before, pos+1);
<font color="blue">//if pos is -1, there are no more occurrences, so break out of 
//the loop</font>
      if(pos==-1)break;
   }
<font color="blue">//here, pos is either the position of the correct occurrence of 
//<b>before</b>, or else it is -1</font>
</pre>
Once you've found the proper position to do the insert, you can easily add &lt;insert&gt;, like this:
<pre>
   if(pos!=-1)
      original=original.substring(0,pos)+insert+original.substring(pos);
</pre>

That's pretty much it, you just run through all of the commands, tokenize them, do the insert, and then return the modified original string at the end:
<pre>
   public String insert(String[] commands, String original)
   {
      for(int i = 0; i&lt;commands.length;i++)
      { 
         StringTokenizer st = new StringTokenizer(commands[i],"#");
         String insert = st.nextToken();
         st.nextToken();
         String before = st.nextToken();
         int index = Integer.parseInt(st.nextToken().substring(1));
         int pos = -1;
         for(int j = 0; j &lt; index; j++)
         {
            pos = original.indexOf(before, pos+1);
            if(pos==-1)break;
         }
         if(pos!=-1)
            original=original.substring(0,pos)+insert+original.substring(pos);
      }
      return original;
   }
</pre>
</p> 

<font size="+2"><b>Rooms</b></font> 
<A href="Javascript:openProblemRating(1095)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505603" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231 / 629 (36.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      160 / 231 (69.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>snewman</b> for 876.36 points (8 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      560.26 (for 160 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was a weakly disguised non-deterministic finite automaton (NFA), a data structure commonly used in a number of algorithms.  
Regular expressions, in particular, make heavy use of NFAs.  In this problem, you have a "maze", and there are a number of "time steps" each of 
which corresponds to a single letter, and tells you which "doors" are open between which "rooms".  The maze is analogous to an NFA, the letters 
represent the input to the NFA, the rooms represent states, and the doors represent state transitions.  If you want to read a little more about NFAs, 
you can probably find out all you ever wanted to know with your favorite search engine.  
On to the problem:
<br/><br/>
We start with a boolean array, each of whose elements represents whether or not we can be in a certain room.  We initialize all values to false, and then set the element corresponding to start to true.  Then, we look at each character in doors, starting from the first.  We then initialize another boolean array, each of whose elements represents whether or not we can be in a certain room at the next time step.  Now, for each room that we could be in at the previous time step, we see which rooms we can go to at the current time step, given the current letter.  We then set the corresponding elements of our boolean array, and move on to the next character of doors.  So, we can come up with the following pseudocode to calculate which rooms we can be in after all :
<pre>
bool pos[lengthOf(rooms)];
pos[start] = true;
foreach character c in doors
   bool next[lengthOf(rooms)];
   for i = 0 to lengthOf(rooms)-1
      if(pos[i])
         for j = 0 to lengthOf(rooms)-1
            if(door from i to j is open on c)
               next[j] = true;
            end if
         end for
      end if
   end for
end for
//return an int array each of whose elements is one a 'true' in pos
</pre>
Translating this into code is a bit of work, but the parsing is relatively straightforward, and there aren't really any special tricky cases to worry about.

</p> 

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
