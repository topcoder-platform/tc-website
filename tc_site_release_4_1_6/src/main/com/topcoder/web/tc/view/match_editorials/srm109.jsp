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
<tc-webtag:forumLink forumID="505526" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 109</span><br>Wednesday, August 21, 2002

<H1> 
The Problems 
</H1> 

<P>
<B>StringMult</B> (value 250)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505526" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
</P>


<P>
Used as: Division-II, Level 1
</P>

<P>
Submission Rate - 174/184 (94.57%) <BR/>
Success Rate - 163/174 (93.68%) <BR/>
High Score - javaisthe_unwin for 247.92 points<BR/>
Avg. Points   - 219.42944<BR/>
</P>


<P>
<B>Implementation</B><BR/>
To solve this problem you just need to build a loop from 0 up to absolute multiplier and every iteration add another instance of a string to the resulting string (resulting string should be set empty before the loop to account for 0 multiplier). If multiplier is negative reverse the result.
</P>

<P>
<B>ListOps</B> (value 500: Div-II) (value 300: Div-I)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505526" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
Used as: Division-II, Level 2
</P>

<P>
Submission Rate - 133/184 (72.28%) <BR/>
Success Rate - 76/133 (57.14%) <BR/>
High Score - javaisthe_unwin for 486.66 points<BR/>
Easy Avg. Points   - 299.80264<BR/>
</P>

<P>
Used as: Division-I, Level 1
</P>

<P>
Submission Rate - 96/99 (77.78%) <BR/>
Success Rate - 77/96 (80.20%) <BR/>
High Score - ZorbaTHut for 292.16 points<BR/>
Avg. Points   - 229.38962<BR/>
</P>


<P>
<B>Implementation</B><BR/>
One of the ways to solve this problem is to illuminate all duplicates from the list of numbers and build all possible pairs in the following nested loops:
</P>

<PRE>
for (int i=0;i&lt;num.size()-1;i++) {
   for (int k=i+1;i&lt;num.size();i++) {
   int a = num[i];
   int b = num[k];
   ....
   ....
}
}
</PRE>
<P>
The only thing left to do is to see if any of the following operations: a+b, a*b, a-b, b-a, a/b and b/a would result with number in the original list:
</P>

<P>
There are two special cases in this problem: division by 0 and division with reminder not equal to 0.
</P>

Here is a possible solution for a/b case:
<PRE>
if (b!=0 &amp;&amp; a%b==0 &amp;&amp; num.find(a/b)!=num.end() ) {
   count++;
   continue;
}
</PRE>

<P>
Reference implementation: <B>slavik</B>
</P>


<P>
<B>Treasure </B>(value 1000: Div-II)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505526" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
Used as: Division II, Level 3
</P>


<P>
Submission Rate - 52/184 (28.26%) <BR/>
Success Rate - 35/133 (67.31%) <BR/>
High Score - javaisthe_unwin for 941.84 points<BR/>
Avg. Points   - 591.77<BR/>
</P>



<P>
This problem can be solved by using a brute force search. The max number of iterations is 3^10 = 59049, so we do not have to worry about timing out. When the last position is reached insert the coordinates into the set. Return the set size as a result. (
</P>

<PRE>
void do_it(int index,int x,int y) { 
      if (index==dir.size()) { // base case when last point is reached
         sols.insert(make_pair(x,y)); 
         return; 
      } 
      char c = dir[index]; 
      if (find(all(inc),index)!=inc.end()) {  // if map has a mistake at this location:
         if (c!='U') do_it(index+1,x,y+1); 
         if (c!='D') do_it(index+1,x,y-1); 
         if (c!='L') do_it(index+1,x-1,y); 
         if (c!='R') do_it(index+1,x+1,y); 
      } 
      else { // if map has no mistake at this location
         switch(c) { 
         case 'U': do_it(index+1,x,y+1);break; 
         case 'D': do_it(index+1,x,y-1);break; 
         case 'L': do_it(index+1,x-1,y);break; 
         case 'R': do_it(index+1,x+1,y);break; 
         } 
      } 
} 
</PRE>

<P>
Dynamic programming can be used to speed the process up by is not necessary:
</P>

<PRE>
...
char temp[20]; 
sprintf(temp,"%d_%d_%d",x,y,index); 
if (dp.find(temp)!=dp.end()) return; 
dp[temp]=1; 
...
</PRE>

<P>
Reference implementation: <B>slavik</B>
</P>

<P>
<B>KnightMove</B> (value 600: Div-I)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505526" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
Used as: Division I, Level 2
</P>

<P>
Submission Rate - 81/99 (81.82%) <BR/>
Success Rate - 77/81 (95.06%) <BR/>
High Score - RobertLu for 582.77 points<BR/>
Avg. Points   - 442.08<BR/>
</P>

<P>
<B>Implementation</B><BR/>
To solve this problem you have to find the shortest distance from the original square to every square on the board. The Knight should keep unraveling until it cannot find any square on the board which he has not visited or until he cannot find any shorter distance to any of the squares on the board. The simple way to keep track of the visited squares and distances to all of them from the origin is to create a two dimensional array of size 100:100 and initialize all values to infinity. 
</P>

<P>
Start traveling from origin and travel in all 8 possible destinations:
</P>

<P>
The easy way to implement traveling to build a two dimensional array with all possible movements:
</P>


<PRE>int off[8][2]={ {1,2},{1,-2},{2,1},{2,-1},{-1,2},{-1,-2},{-2,1},{-2,-1} };</PRE>

Now we just have to make sure the Knight is not outside of the board:

<PRE>
struct node{
        int x,y,d;
};
...
node t,c;
...
for(i=0;i&lt;8;i++) {
   t=c;
   t.x+=off[i][0]; t.y+=off[i][1]; t.d++;
   if (t.x &gt;= 0 &amp;&amp; t.x &lt; N &amp;&amp; t.y &gt;= 0 &amp;&amp; t.y &lt; N &amp;&amp; t.d &lt; dis[t.x][t.y]) {
      dis[t.x][t.y]=t.d;
      qu.push_back(t);
   }
}
</PRE>

Reference implementation: <B>along</B>



<P>
<B>PartyPromo</B>  (value 900: Div-I)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505526" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
Used as: Division-I, Level 3
</P>


<P>
Submission Rate - 43/99 (81.82%) <BR/>
Success Rate - 15/43 (34.88%) <BR/>
High Score - jonmac for 737.32 points<BR/>
Avg. Points   - 580.2<BR/>
</P>


<P>
<B>Implementation</B><BR/>
The first thing you have to do to solve this problem is to build and adjacency matrix of all promoters who knows each other directly or through common friends. 
</P>

<P>
The hard part is to include all "friend of a friend" into the matrix. This task can be done by exhaustive search:
</P>
<PRE>
for( k = 0; k &lt; a.size(); k++ ) 
   for( i = 0; i &lt; a.size(); i++ ) 
      for( j = 0; j &lt; a.size(); j++ ) 
         adj[ i ][ j ] |= ( adj[ i ][ k ] &amp;&amp; adj[ k ][ j ] ); 
</PRE>

<P>
Now we have all people divided into groups where you one group can have as small as 1 person ior as many as all promoters.
</P>

<P>
Now we have to find the maximum number of people for each group of promoters. This task can be accomplished by building a dynamic array of all possible cash values from 0 to amount of money allocated:
</P>

<PRE>
for( j = 0; j &lt; grp.size(); j++ ) { 
   int promoter = group[ j ]; 
   int cost = a[ promoter ]; 
   for( k = d; k &gt;= cost; k-- ) 
      cshi[ k ] = max( cshi[ k ], cshi[ k - cst ] + people[ promoter ] ); 
   } 
   ...
}
</PRE>

<P>
Reference implementation: <B>jonmac</B>
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
