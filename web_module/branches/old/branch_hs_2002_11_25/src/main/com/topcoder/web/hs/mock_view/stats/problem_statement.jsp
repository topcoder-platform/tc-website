<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="/hs/includes/global/css.jsp" />
<jsp:include page="/hs/includes/global/top_javascript.jsp" />
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/hs/includes/global/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="/hs/includes/stats/left_nav_stats.jsp" />
<jsp:include page="/hs/includes/global/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_stats_bg.gif" BGCOLOR="#001934">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"  WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_stats.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="100%">&nbsp;
             </TD></TR>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
        <TR>
            <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                </TABLE>
            </TD>
            <TD class="statText">
            <!-- Start Body-->
                      <P><B><Font COLOR="cccccc" SIZE="2">NOTE:  The information provided on this page is for 
demonstration purposes only</Font></B></P>      
<P><B>Problem Statement</B></P>


         <!-- BEGIN BODY -->
         	 
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
           <TR>
             <TD   VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top"   WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR/>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD  COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   
                     <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="7" HEIGHT="18">&#160;Problem Statement for Choosers</TD>
                   
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="left">
                      
              		<table><tr><td colspan="2" CLASS="statText"><h3>Problem Statement</h3></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td CLASS="statText">This problem involves an elaborate marble maze game.  The maze is composed of choosers that look like this:<pre>
        Right Oriented                     Left Oriented
           |       |                         |       |                     
           |       |                         |       |
           |       |                         |       |
          / \       \                       /       / \
         /   \       \                     /       /   \
        /     \       \                   /       /     \
       /       O       \                 /       O       \
      /       / \       \               /       / \       \
     /       /   \       \             /       /   \       \            </pre>
A marble is put in the top of the chooser.  The bar in the middle of the chooser determines whether the marble will leave to the left or the right.  After a marble passes through the chooser the bar moves.  For example, if a marble enters the right oriented chooser pictured above, it would leave toward the right but, the next marble to pass through would leave toward the left.  The exact opposite would hold true for the left oriented chooser pictured above.  We can make a game by networking a bunch of choosers together using tubes.  For example:<BR/></br>
game = {&quot;L 1 2&quot;,&quot;R 2 0&quot;,&quot;L X X&quot;}<BR/></br>
This means that chooser 0 begins oriented to the left. Its left path leads to chooser 1, and its right path leads to chooser 2.  Chooser 1 begins oriented to the right. Its left path leads to chooser 2, and its right path leads to chooser 0.  Chooser 2 begins oriented to the left.  Its left and right path both leave the game.  If I place a marble in chooser 0 it will pass through 4 choosers before leaving the game (namely 0 then 1 then 0 then 2).  Given a network of choosers, and a chooser that we drop the marble into, determine how many choosers the marble will pass through before leaving the game.  If it will never leave return -1.<BR/></br>
<BR/></br>
Create a class Choosers that contains the method length, which takes a String[] game, and an int chooser, and returns an int representing how many choosers the marble will pass through before leaving the game.  Return -1 if it will never leave.</td></tr><tr><td colspan="2">&#160;</td></tr><tr><td colspan="2" CLASS="statText"><h3>Definition</h3></td></tr><tr><td CLASS="statText">&#160;&#160;&#160;&#160;</td><td CLASS="statText"><table><tr><td CLASS="statText">Class:</td><td CLASS="statText">Choosers</td></tr><tr><td CLASS="statText">Method:</td><td CLASS="statText">length</td></tr><tr><td CLASS="statText">Parameters:</td><td CLASS="statText">String[], int</td></tr><tr><td CLASS="statText">Returns:</td><td CLASS="statText">int</td></tr><tr><td CLASS="statText">Method signature:</td><td CLASS="statText">int length(String[] game, int start)</td></tr><tr><td colspan="2" CLASS="statText">(be sure your method is public)</td></tr></table></td></tr><tr><td CLASS="statText">&#160;&#160;&#160;&#160;</td></tr><tr><td CLASS="statText"></td></tr><tr><td colspan="2">&#160;</td></tr><tr><td colspan="2" CLASS="statText"><h3>Constraints</h3></td></tr><tr><td align="center" valign="top" CLASS="statText">-</td><td CLASS="statText"><b>game</b> will contain between 1 and 15 elements, inclusive.</td></tr><tr><td align="center" valign="top">-</td><td CLASS="statText">Each element of <b>game</b> will be formatted as &quot;&lt;dir&gt; &lt;left&gt; &lt;right&gt;&quot; with no extra, leading or trailing spaces, or extra leading 0's.</td></tr><tr><td align="center" valign="top">-</td><td CLASS="statText">&lt;dir&gt; is either 'L' or 'R'</td></tr><tr><td align="center" valign="top">-</td><td CLASS="statText">&lt;left&gt; and &lt;right&gt; are each either the character 'X' or integers between 0 and the length of game - 1, inclusive.</td></tr><tr><td colspan="2" CLASS="statText">&#160;</td></tr><tr><td colspan="2" CLASS="statText"><h3>Examples</h3></td></tr><tr><td align="center" nowrap="true" CLASS="statText">0)</td><td CLASS="statText"></td></tr><tr><td CLASS="statText">&#160;&#160;&#160;&#160;</td><td CLASS="statText"><table><tr><td CLASS="statText"><table><tr><td CLASS="statText"><pre>{&quot;L 1 2&quot;,&quot;R 2 0&quot;,&quot;L X X&quot;}</pre></td></tr><tr><td CLASS="statText"><pre>0</pre></td></tr></table></td></tr><tr><td CLASS="statText"><pre>Returns: 4</pre></td></tr><tr><td CLASS="statText"><table><tr><td colspan="2" CLASS="statText">The marble goes from 0 to 1 to 0 to 2 and then leaves.</td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true" CLASS="statText">1)</td><td CLASS="statText"></td></tr><tr><td CLASS="statText">&#160;&#160;&#160;&#160;</td><td CLASS="statText"><table><tr><td CLASS="statText"><table><tr><td CLASS="statText"><pre>{&quot;L 1 2&quot;,&quot;R 2 0&quot;,&quot;L X X&quot;}</pre></td></tr><tr><td CLASS="statText"><pre>2</pre></td></tr></table></td></tr><tr><td CLASS="statText"><pre>Returns: 1</pre></td></tr><tr><td CLASS="statText"><table><tr><td colspan="2" CLASS="statText">The marble leaves immediately.</td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true" CLASS="statText">2)</td><td CLASS="statText"></td></tr><tr><td CLASS="statText">&#160;&#160;&#160;&#160;</td><td CLASS="statText"><table><tr><td CLASS="statText"><table><tr><td CLASS="statText"><pre>{&quot;L 0 0&quot;}</pre></td></tr><tr><td CLASS="statText"><pre>0</pre></td></tr></table></td></tr><tr><td CLASS="statText"><pre>Returns: -1</pre></td></tr><tr><td CLASS="statText"><table><tr><td colspan="2" CLASS="statText">Clearly, the marble never leaves.</td></tr></table></td></tr></table></td></tr></table><hr><p CLASS="statText">This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited.  (c)2002, TopCoder, Inc.  All rights reserved.  </p>
                      
                   </TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>
               </TABLE>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
      
         
            <!-- End Body-->
           </TD>
             <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                </TABLE>  
            </TD>
           </TR>
          </TABLE>       
         </TD>
        </TR>

       </TABLE>
        </TD>
        <TD  BGCOLOR="#001934" VALIGN="top">&nbsp;&nbsp;</TD>	
        <TD  BGCOLOR="#001934" VALIGN="top">&nbsp;&nbsp;</TD>	
        <TD  BGCOLOR="#001934" VALIGN="top">&nbsp;&nbsp;</TD>		
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="/hs/includes/global/foot.jsp" />
</BODY>
</HTML>
