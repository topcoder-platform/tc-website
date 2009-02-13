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
		    <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas/Want&#160;to&#160;Write?&#160;</A></TD>
		</TR>    		
		</TABLE>
		</TD>
	</TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 109</B><BR/>
Wednesday, August 21, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>StringMult</B> (value 250) 
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
<B>ListOps</B> (value 500: Div-II) (value 300: Div-I)
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
<B>Treasure </B>(value 1000: Div-II)
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
<B>KnightMove</B> (value 600: Div-I)
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
<B>PartyPromo</B>  (value 900: Div-I)
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



<IMG SRC="/i/m/slavik_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slavik<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=160082" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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



