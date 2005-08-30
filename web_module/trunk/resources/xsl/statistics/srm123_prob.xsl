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
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
          <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A></TD>
      </TR>          
      </TABLE>
      </TD>
   </TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 123</B><BR/>
Tuesday, December 10, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<font size="+2">
  <b>Etiquette</b>
</font>
<BR/>

    Used as: Division-II, Level 1
            :<blockquote>
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
        <td style="background: #eee;" class="bodyText">214 / 233 / (91.84%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">171 / 214 (79.91%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>yotaku</b> for 247.32 points 
                </td>
      </tr>
    </table>
  </blockquote>
  
<P>
Reference implementation: <B>yotaku</B> 
</P>
 
 
<P>
60 out of 231 coders, who opened Etiquette, received 0 points.
</P>


<h4>Implementation</h4>
<P>
The problem was very straightforward. It was easy as it had to be for a Div-II, Level 1 problem.
</P>

<P>
<PRE>To solve the problem go through entire string and do the following for every char:
if current char is 'L' set LadyfirstState=true;
if current char is 'G' and LadyfirstState is true then increment badGentelment count;
if current char is space LadyfirstState=false;</PRE>
</P>

<P>
Return badGentelment after a loop is completed.
</P>

<p>&#160;</p>

<font size="+2">
  <b>TypingJob</b>
</font>
<BR/>

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
        <td style="background: #eee;" class="bodyText">117 / 233 (50.21%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">40 / 117 (34.19%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Adrian Kuegel</b> for 521.77 points 
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:<b>slavik</b> (practice room)

<P>
180 out of 220 coders, who opened TypingJob, received 0 points.
</P>

<BR/>
<h4>Implementation</h4>
<P>
The brute force can be used to solve this problem because we have 3 assistants and a maximum of 
10 jobs to be assigned to them. The worst-case scenario would take 3^10 = 59049 iterations. 
</P>

<P>
To actually solve this problem a recursive function can be built to assign every job to one of the 3 assistants. Once all jobs are assigned, take the maximum time for one of the three assistants to do the job and compare it to the best so far. 
</P>

<PRE>
void do_it(int index,int q1,int q2,int q3) {
   if (index=a.size()) {
      int current= q1&gt;q2 ? q1
      if (q3&gt;current) current=q3;
      if (current&lt;best) best=current;
      return;
   }
   do_it(index+1,q1+a[index],q2,q3);
   do_it(index+1,q1,q2+a[index],q3);
   do_it(index+1,q1,q2,q3+a[index]);
}

This approach could be optimized in the following ways: 
If time for one of the assistants is more then current best, exit from the function. 
Always assign job 1 to assistant one 
(it would reduce number of iterations to 3^9=19683).
</PRE>

<P>None of the optimizations are necessary because the problem would work 
fine without them. There are other ways to solve this problem but they would probably involve more typing.
</P>


<p>&#160;</p>

<font size="+2">
  <b>TeaCoffee</b>
</font>
<BR/>

    Used as: Division-II, Level 3
            :<blockquote>
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
        <td style="background: #eee;" class="bodyText">87 / 233 (37.33%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">55 / 87 (63.22%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>vietchau</B>  for 767.64 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
143 out of 198 coders who opened TeaCoffee, received 0 points. 
</P>
 

    Used as: Division-I, Level 2
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">98 / 114 (85.96%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">78 / 98 (79.59%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>SnapDragon</B> for 429.52 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
32 out of 110 coders who opened TeaCoffee, received 0 points.
</P>
 
Reference implementation:
    <b>Yarin</b>
<BR/>
<h4>Implementation</h4>
<P>
This problem is a simulation problem where you just follow the rules to get a result. The most difficult part was probably the parsing of input. Most of the C++ coders already have tokenizers implemented and Java coders can always use the standard StringTokenizer class. There are two common ways to keep track of friends: to build an adjacency matrix or to create a vector of vectors. Most of the Div-I coders preferred building a vector of vectors to make the implementation easier and shorter. Once we have all inputs parsed and placed into easy-to-access data structures, the only thing left is to build a simulation which would work like this: Create a loop of 52 iterations and do the following for every iteration: If all people had the same drink last week (or the first time) the solution is found, return current week index. Create another list of drinks that people are having this week according to rules of the simulation. Set last week's list of drinks to the current week's list of drinks and go to the next iteration.
</P>

<P>
Return -1 if we went through all 52 iterations and no solution was found.
</P>

<p>&#160;</p>

<font size="+2">
  <b>Cactus</b>
</font>
<BR/>
    Used as: Division-I, Level 1
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">350</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">45 / 114 (39.47%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">37 / 45 (82.22%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>nullspace</B>  for 332.43 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
75 out of 112 coders who opened Cactus, received 0 points. 
</P>
 
Reference implementation:
    <b>Yarin</b>
<BR/>
<h4>Implementation</h4>
<P>
This problem seems to be more difficult then its 350 point value because only 37 out of 114 were able to solve this problem correctly. Almost all successful solutions had the same approach to this problem: build four nested loops, where each one of them would iterate the number of cactuses of each color (or combination of colors). For this solution to work one must keep track of the maximum and minimum amount of money spent to buy the current number of cactuses. For the rare cactuses (red with a white) assume the price is 3500 for the first one and is incremented by 1 for each following cactus. Once the inner loop is reached and the minimum amount of money spent for the current number of cactuses is less then allocated money and the maximum amount of money spent for the current number of cactuses is greater or equal to the allocated money, we have a unique combination of colors we shall count.
</P>

<p>&#160;</p>

<font size="+2">
  <b>BestCircle</b>
</font>
<BR/>
    Used as: Division-I, Level 3
            :<blockquote>
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
        <td style="background: #eee;" class="bodyText">35 / 114 (30.70%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">5 / 33 (14.29%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>SnapDragon</B> for 778.96 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
85 out of 90 coders who opened BestCircle, received 0 points.
</P>
Reference implementation: <B>SnapDragon</B>
<BR/>
<h4>Implementation</h4>

<P>
The number of points (circle centers) for this problem is unlimited (because the center of the circle can be a pair of double numbers). So there is no way to brute force the solution for this problem. To solve this problem we just have to carefully choose the points we try:  
</P>

<OL>
   <LI> All given points in the field shall be considered as circle center.</LI>
   <LI> Let's consider all circle centers with the following coordinates: For every two given points, a and b, the circle center shall be x=(a.x+b.x)/2 and y=(a.y+b.y)/2;</LI>
   <LI> Let's consider all circle centers with the following coordinates: For every three given points, a, b and c, create a triangle bounded by a, b and c and find the center of this triangle. To find the center of this triangle we need to find an intersection of two lines perpendicular to the two slopes of the triangle and crossing corresponding slopes of the triangle in the middle.</LI>
</OL>
<P>
The worst case scenario for this solution is 50 + 50*50 + 50*50*50 = 127,550 (circle centers) and should not time out.
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


