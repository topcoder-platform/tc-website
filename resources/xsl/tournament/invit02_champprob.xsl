<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/invit02_nav.xsl"/>   
  <xsl:import href="../includes/schedule/public_schedule_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournament</TITLE>
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
        <xsl:call-template name="public_schedule_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">schedule</xsl:with-param>
  <xsl:with-param name="title">&#160;Championship&#160;Problems&#160;&amp;&#160;Chrono&#160;Logs</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="seminav"/>
  <!-- Global Seconday Nav Ends --> 
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Problem Analysis &amp; Opinion</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<P>
Saturday, November 23, 2002
</P>

<A NAME="Choosers"></A><FONT SIZE="+2"><B>Choosers</B></FONT><BR/><FONT SIZE="-1">
    Used as: Level 1</FONT><H4>Implementation</H4><P>
With a limit of 15 choosers, there are at most 2<SUP>15</SUP> configurations of the choosers, and 15 possible locations for the ball.  This gives us a total of 15*2<SUP>15</SUP> possible states.  We can then move the ball around, according to the rules, and cache the states we reach.  Then, if we ever reach the same state twice, there is a loop, since the sequence of states is totally deterministic.  
This can be simply implemented by representing each of the states as a bitmask and using an array as a cache.
</P><P>
If the input was larger, we might run into memory limits and would have to find a different solution.  One other way to do this is to run the marble through twice, simultaneously, with one marble moving through two choosers at a time, while the other only goes through one at time.  Then, if the one going twice as fast every gets to the same state as the slow one, there is a loop somewhere.  However, this isn't neccessary.
</P>
<A NAME="Comment"></A><FONT SIZE="+2"><B>Comment</B></FONT><BR/><FONT SIZE="-1">
    Used as: Level 2</FONT><H4>Implementation</H4><P>
This is a classic string parsing problem.  You should start in a CODE state, and then scan the strings, one at a time.  If you hit "//" then you simply ignore the rest of the line.  If you hit "/*", then you ignore until you see "*/".  One thing to watch for is the case {"/*/*/"}, where the output should be {}, not {"*/"}.  It was this case that caused SnapDragon to resubmit.</P><P>
The most difficult case to handle is probably that involving double quotes.  If you are in the CODE state, and you see a double quote, you should then ignore all characters until you see another double quote.  However, there is the possibility that there will be an escaped double quote, which must not terminate the first double quote.  A few other things to watch out for are slashes at the end of strings, and slashes at the end of one string, followed by an asterisk at the beginning of the next.

</P><A NAME="Mirrors"></A><FONT SIZE="+2"><B>Mirrors</B></FONT><BR/><FONT SIZE="-1">
    Used as: Level 3</FONT><H4>Implementation</H4><P>
Computational geometry is always ugly, and tonight was certainly no exception.  This problem combined three subtasks.  You have to be able to reflect a ray when it hits a segment, find the intersection of a line and a ray, and find the distance from a line to a point.</P><P>
Once you solve all of these subproblems using some dot products and cross products and such, its not too hard to combine then, but its certainly not trivial.  You should start with the ray defined by the start input.  Then, you should find the intersection between this ray, and every mirror.  Of all the mirrors that the ray intersects, you have to find the one closest to the start, and pick it.  Then, you also have to check if the ray hits an object before it hits the mirror.  If it does, you are done, otherwise, you reflect the ray with the mirror you found, and repeat the whole process until you either hit an object, yourself, or the hit no mirrors.</P><P>
One interesting note to add is that there are classes in java.awt which have methods for finding the distance from a line to a point, and whether or not two lines intersect.  Using this can make it much easier, but unfortunately for them, all the coders used C++.
</P>


<IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          </TD>
            </TR>                  
            <!-- <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/invit02/Betting.pdf" CLASS="bodyText">Betting</A><BR/>
Level Two (500) - <A HREF="/i/invit02/Roadmap.pdf" CLASS="bodyText">Roadmap</A><BR/>
Level Three (1000) - <A HREF="/i/invit02/Omaha.pdf" CLASS="bodyText">Omaha</A><BR/>

          </TD>
            </TR> -->
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<BR/>
<P><B>CODING PHASE</B>  <BR/>            
3:00:01 PM - dgarthur opens the Level Two problem <BR/>
3:00:02 PM - SnapDragon opens the Level One problem <BR/>
3:00:02 PM - moira opens the Level One problem <BR/>
3:00:03 PM - John Dethridge opens the Level One problem <BR/>
3:06:18 PM - SnapDragon submits the Level One problem for 286.24 points (final submission)<BR/>
3:06:27 PM - SnapDragon opens the Level Two problem <BR/>
3:11:18 PM - John Dethridge submits the Level One problem for 261.45 points (final submission)<BR/>
3:11:43 PM - John Dethridge opens the Level Two problem <BR/>
3:15:08 PM - dgarthur submits the Level Two problem for 438.79 points (final submission)<BR/>
3:15:12 PM - dgarthur opens the Level One problem <BR/>
3:18:23 PM - moira submits the Level One problem for 221.34 points (final submission)<BR/>
3:18:28 PM - moira opens the Level Two problem <BR/>
3:19:29 PM - SnapDragon submits the Level Two problem for 460.80 points (not the final submission)<BR/>
3:21:56 PM - SnapDragon submits the Level Two problem for 380.00 points (final submission)<BR/>
3:22:11 PM - SnapDragon opens the Level Three problem <BR/>
3:25:17 PM - John Dethridge submits the Level Two problem for 455.08 points (final submission)<BR/>
3:25:54 PM - John Dethridge opens the Level Three problem <BR/>
3:25:59 PM - dgarthur submits the Level One problem for 264.03 points (final submission)<BR/>
3:26:08 PM - dgarthur opens the Level Three problem <BR/>
4:10:59 PM - moira submits the Level Two problem for 230.24 points (final submission)<BR/>
4:11:12 PM - moira opens the Level Three problem <BR/>
4:14:58 PM - SnapDragon submits the Level Three problem for 417.55 points (final submission)</P>

<P><B>CHALLENGE PHASE</B><BR/>
4:24:06 PM - John Dethridge challenges moira on the Level One problem successfully<BR/>
4:26:34 PM - SnapDragon challenges dgarthur on the Level Two problem successfully</P>

          </TD>
            </TR>            
                                   
          </TABLE>
          <P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>   	
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>	
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/index?t=tournament&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


