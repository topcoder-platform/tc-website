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
<tc-webtag:forumLink forumID="505554" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 127</span><br>Thursday, January 2, 2003
<br><br>

<H1> 
The Problems 
</H1> 

<font size="+2"><b>PackingObjects</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505554" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
        <td style="background: #eee;" class="bodyText">170 / 187 / (90.91%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">120 / 170 (70.59%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>guagua</b> for 243.85 points 
                </td>
      </tr>
    </table>
  </blockquote>
<P>
61 out of 281 coders who opened PackingObjects, received 0 points.
</P>
  


<h4>Implementation</h4>
<P>
The problem is very straightforward. Simply, go through the list of all the boxes 
and see if a given object can fit inside. If "Yes" then compare the box area to the best so far.

</P>

<P>
Reference implementation: <B>slavik</B> (practice room)
 
</P>

<font size="+2"><b>SpeedDial</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505554" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
        <td style="background: #eee;" class="bodyText">130 / 187 (69.50%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">84 / 130 (64.62%) </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Dimkadimon</b> for 437.25 points
                </td>
      </tr>
    </table>
  </blockquote>

<P>
90 out of 174 coders who opened SpeedDial, received 0 points.
</P>

<BR/>
<h4>Implementation</h4>


<PRE>
int cmp(pair&lt;int,int&gt; a,pair&lt;int,int&gt; b) {
   return (a.first-2)*a.second &gt; (b.first-2)*b.second;
}

int get_size(int a) {
   char temp[20];
   sprintf(temp,"%d",a);
   return strlen(temp);
}

int assignNumbers(vector &lt;int&gt; a, vector &lt;int&gt; b, int c) {
   vector&lt;pair&lt;int,int&gt; &gt; numbers;
   for (int i=0;i&lt;a.size();i++) numbers.push_back(make_pair(get_size(a[i]),b[i]));   
   sort(numbers.begin(),numbers.end(),cmp);
   int total=0;
   for (int k=0;k&lt;numbers.size();k++) {
      if (k&gt;=c) total+=numbers[k].second*numbers[k].first;
      else      total+=numbers[k].second*2;
   }
   return total;
}

</PRE>

<P>To solve this problem we have to figure out how many numbers can be saved by using speed dial versus if the number is dialed the regular way. To solve this problem we can insert all the numbers into an array (where every member would have a size of the number and number of times this number is dialed). Then we can sort this array by number of key presses saved if this number is speed dialed. Number if key presses saved = (length of the phone number - 2) * number of times this phone numbers is dialed.
Finally we shall go through the sorted array and calculate the total number of key presses needed to dial all the numbers using the given amount of speed dial slots.
</P>

<font size="+2"><b>TCSchedule</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505554" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 3:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1050</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">13 / 187 (6.95%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">2 / 13 (15.38%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>Dr. Gluk</B> for 508.97 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
129 out of 131 coders who opened TCSchedule, received 0 points. 
</P>
 

    Used as: Division-I, Level 1:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">300</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">40 / 93 (43.01%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">20 / 40 (50.00%) </td>
      </tr>
      <!-- <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>ambrose</B> for 429.52 points  
                </td>
      </tr> -->
    </table>
  </blockquote>
<P>
72 out of 92 coders who opened TCSchedule, received 0 points.
</P>

<BR/>
<h4>Implementation</h4>

<P>
The problem was much harder then it suppose to be for the Div 1 Level I problem (well, it was pretty hard for Div 2 Level III either) according to the round results. The problem statement had some useless and confusing information, which took coders some time to parse through and understand the problem 
Once the problem is understood it is not that hard to come up with a brute force algorithm to solve it:
</P>

<P>
I have solved this problem using a recursive function which would try all possible combinations of valid day schedules:
<OL>
   <LI> Make sure your wake up time is always between 7 and 14.</LI>
   <LI> If there is a real life even you must wake up at a given time or before that time otherwise entire branch of recursion is not valid. </LI>
   <LI> Try to stay up from 15 to 17 hours and see what happens in every case.</LI> 
   <LI> if you have to go bad two hours after the competition starts you can participate in it.</LI>
</OL>
</P>

<P>
Dynamic programming could be used for this problem if current day and current woke up time are used as a key to 
get maximum number of competitions. If the number of competitions so far is less than the previous try 
(on the same day and the same wake up time) disregards this recursion branch.
</P>

<PRE>
int best=0;
void do_it(int so_far,int cur,int index,vector &lt;int&gt; &amp;a, vector &lt;int&gt; &amp;b) {
   if (cur&lt;7 || cur&gt;14) return;
   if (index==a.size()) 
      if (so_far>best) best=so_far;
      return ;
   }
   if (a[index]!=-1 &amp;&amp; cur&gt;a[index]) return;
   for (int i=15;i&lt;=17;i++) {
      int wake_up=(cur+i+8)%24;
      int go_to_bad=(cur+i)%24;
      if (b[index]!=-1 &amp;&amp; go_to_bad>=b[index]+2 &amp;&amp; go_to_bad!=23) 
         do_it(so_far+1,wake_up,index+1,a,b);
      else 
         do_it(so_far,wake_up,index+1,a,b);
   }
}
int howMany(vector &lt;int&gt; a, vector &lt;int&gt; b) {
for (int i=7;i&lt;=14;i++) do_it(0,i,0,a,b);
   return best;
}
</PRE>

<font size="+2"><b>Tetramino</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505554" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 2:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">650</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">18 / 93 (19.35%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">6 / 18 (33.33%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>Jms137</B> for 395.45 points  
                </td>
      </tr>
    </table>
  </blockquote>

70 out of 76 coders who opened Tetramino, received 0 points.
<P>
Reference implementation: <B>jms137</B>
</P>
 

<BR/>
<h4>Implementation</h4>
<P>
The problem is straightforward and easy to understand. On the other hand, implementation would require a lot of typing and special case handling.
</P>
<P>
There 19 possible shapes which can be generated from 7 given pieces (when using rotations). I think it would be a good idea to create an array of all 19 pieces represented as bitmap or as integer arrays and then try to fit them into the play field (using all possible x,y coordinates of the play field). Once the empty place is found (and given piece is fully inside the playfield) make sure there is something that would hold the piece in place (not empty field right below the piece). Then make sure all the spaces above the found position (1,2,3 or 4 columns depending on the piece) are empty (that would allow the piece drop).
Once the position is found, calculate the number of filled rows and compare this number to the best so far.
</P>

<font size="+2"><b>ColorCount</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505554" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 3:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1000</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">2 / 93 (2.15%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">1 / 2 (50%)</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b> (and only score)
        </td>
        <td style="background: #eee;" class="bodyText">
<B>niteneb</B> for 778.96 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
48 out of 49 coders who opened ColorCount, received 0 points.
</P>
Reference implementation: <B>niteneb</B>
<BR/>
<h4>Implementation</h4>

<P>
I wish the max size of the field was something like a thousand then the problem would be easily solved using a huge array representing all the pixels in the field. But in that case the problem would not be a Div I Hard problem.
</P>

<P>
To actually implement this problem the following approach shall be taken: 
</P>

<P>
Build two set of coordinates x and y. Those sets shall contain all unique x and y coordinates of all the given shapes.
All those points will divide the entire field into rectangles which might have different colors assigned to them.
For this problem the maximum number of unique x coordinates is 100 and the maximum number of unique y coordinates is 100. So the maximum number of rectangles, which might have different color is bounded by 100*100=10000.
</P>

<P>
To simplify this problem all the given shapes might be represented as rectangles:
Pixels is a rectangle with width=1 and height=1<BR/>
Horizontal line is a rectangle with height=1<BR/>
Vertical line is a rectangle with width=1<BR/>
</P>

<P>
Now we have to go through all shapes again and assign a color to one or to many rectangles (there are a maximum 10000 different rectangle which can be created and we know all the coordinates for them)
</P>

<P>
Let M=sizeof(x coordinate set)<BR/>
Let N=sizeof(y coordinate set)<BR/>
</P>

<P>
Let c[M][N] is a list of colors assigned to every possible rectangle rectangle.
Once the Fill command is given the DFS (Depth First Search) algorithm shall be used to color all the adjacent rectangles.
</P>

<P>
Once we passed through all commands again we have a list of adjacent rectangles with different colors assigned to them. 
</P>

<P>
Now we have to pass through all those rectangles and calculate the number of different pixels for each color.
</P>

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
