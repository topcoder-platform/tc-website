<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
        <xsl:call-template name="public_stats_left"/>
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
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <!-- <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm96_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR> -->
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 96</B><BR/>
June 11, 2002</P>
<P><B>Rookie Review</B></P>
<b>Coding Phase</b>
<p>
            The rookies in this match put in a relatively strong performance.
        </p>
<p>
            In Rooms 63 and 66 each, four rookies submitted solutions for all three problems.
            Rooms 64 and 65 were each initially dominated by a single coder.
            And in Room 67 an impressive five rookies submitted solutions to all the problems.
            With 15 rookies submitting all three problems, the odds were very good that at least
            one of these rookies would get them all right.  The winner of the rookie rooms this
            match would surely be one of the following coders.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ul>
            Room 63:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288231&amp;rd=4200&amp;rm=5914">skelter</a>
                    - 1433.92</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288584&amp;rd=4200&amp;rm=5914">LunaticFringe</a>
                    - 1382.06</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288819&amp;rd=4200&amp;rm=5914">Number3</a>
                    - 1227.96</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288849&amp;rd=4200&amp;rm=5914">johnnyoh</a>
                    - 1037.69</li>
  </ol>
            Room 64:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287269&amp;rd=4200&amp;rm=5915">legakis</a>
                    - 1515.66</li>
  </ol>
            Room 65:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=154090&amp;rd=4200&amp;rm=5916">merolish</a>
                    - 1141.55</li>
  </ol>
            Room 66:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287979&amp;rd=4200&amp;rm=5917">Oblok</a>
                    - 1440.51</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287568&amp;rd=4200&amp;rm=5917">tjq</a>
                    - 1268.16</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=155482&amp;rd=4200&amp;rm=5917">whobot</a>
                    - 1184.75</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=156946&amp;rd=4200&amp;rm=5917">lopman</a>
                    - 1136.72</li>
  </ol>
            Room 67:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=286951&amp;rd=4200&amp;rm=5918">RobertLu</a>
                    - 1455.16</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288788&amp;rd=4200&amp;rm=5918">Wronkyn</a>
                    - 1416.29</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=270980&amp;rd=4200&amp;rm=5918">tidus</a>
                    - 1296.25</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288003&amp;rd=4200&amp;rm=5918">reyes</a>
                    - 1286.05</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287149&amp;rd=4200&amp;rm=5918">dr_dad</a>
                    - 1258.94</li>
  </ol>
</ul>
<b>Challenge Phase</b>
<p>
            <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288584&amp;rd=4200&amp;rm=5914">LunaticFringe</a> knocked <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288231&amp;rd=4200&amp;rm=5914">skelter</a> out of the running with a challenge
            against <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288231&amp;rd=4200&amp;rm=5914">skelter</a>'s Level 3 submission, with a test case straight out of the examples section
            of the problem description.  <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288584&amp;rd=4200&amp;rm=5914">LunaticFringe</a> squandered this 50 point bonus, however, by fruitlessly
            challenging <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288849&amp;rd=4200&amp;rm=5914">johnnyoh</a>'s Level 3 submission with the same test case.
        </p>
<p>
            In Room 66, <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287979&amp;rd=4200&amp;rm=5917">Oblok</a> lost 50 points by unsuccessfully challenging <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287568&amp;rd=4200&amp;rm=5917">tjq</a>'s Level 3 submission.
            <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287979&amp;rd=4200&amp;rm=5917">Oblok</a> then regained these 50 points by successfully challenging <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=156434&amp;rd=4200&amp;rm=5917">JadeMonkey</a>'s Level 1 submission,
            which failed to place an upper bound on the number of times the reverse-addition process is repeated.
            <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287568&amp;rd=4200&amp;rm=5917">tjq</a> lost 50 points with an unsuccessful challenge of <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287997&amp;rd=4200&amp;rm=5917">vfaller</a>'s Level 1 submission.
            <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=156946&amp;rd=4200&amp;rm=5917">lopman</a> also lost 50 points, unsuccessfully challenging <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=155482&amp;rd=4200&amp;rm=5917">whobot</a>'s Level 1 submission.
        </p>
<p>
            In Room 67, <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=286951&amp;rd=4200&amp;rm=5918">RobertLu</a> lost 50 points by unsuccessfully challenging <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288003&amp;rd=4200&amp;rm=5918">reyes</a>'s Level 2 submission.
            He then earned those points back by successfully challenging <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287149&amp;rd=4200&amp;rm=5918">dr_dad</a>'s Level 2 submission, effectively knocking
            <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287149&amp;rd=4200&amp;rm=5918">dr_dad</a> out of the running.
        </p>
<p>
            In the end, the Challenge Result did not shake things up very much.  A couple of coders dropped out of the running, and one lost
            50 points, but other than that the rankings did not change much.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ul>
            Room 63:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288584&amp;rd=4200&amp;rm=5914">LunaticFringe</a>
                    - 1382.06</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288819&amp;rd=4200&amp;rm=5914">Number3</a>
                    - 1227.96</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288849&amp;rd=4200&amp;rm=5914">johnnyoh</a>
                    - 1037.69</li>
  </ol>
            Room 64:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287269&amp;rd=4200&amp;rm=5915">legakis</a>
                    - 1515.66</li>
  </ol>
            Room 65:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=154090&amp;rd=4200&amp;rm=5916">merolish</a>
                    - 1141.55</li>
  </ol>
            Room 66:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287979&amp;rd=4200&amp;rm=5917">Oblok</a>
                    - 1440.51</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287568&amp;rd=4200&amp;rm=5917">tjq</a>
                    - 1218.16</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=155482&amp;rd=4200&amp;rm=5917">whobot</a>
                    - 1184.75</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=156946&amp;rd=4200&amp;rm=5917">lopman</a>
                    - 1086.72</li>
  </ol>
            Room 67:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=286951&amp;rd=4200&amp;rm=5918">RobertLu</a>
                    - 1455.16</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288788&amp;rd=4200&amp;rm=5918">Wronkyn</a>
                    - 1416.29</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=270980&amp;rd=4200&amp;rm=5918">tidus</a>
                    - 1296.25</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288003&amp;rd=4200&amp;rm=5918">reyes</a>
                    - 1286.05</li>
  </ol>
</ul>
<b>System Test Phase</b>
<p>
            In Room 63, <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288849&amp;rd=4200&amp;rm=5914">johnnyoh</a> suffered most from the system tests, losing his Level 2 and Level 3 submissions.
            The other leaders in Room 63 were untouched.
        </p>
<p>
            In Room 65, <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=154090&amp;rd=4200&amp;rm=5916">merolish</a> lost his Level 3 submission.  His points earned from the Level 1 and Level 2 problems
            were sufficient to hold on to the lead in Room 65, but gave him no hope of winning across all the rookie rooms.
        </p>
<p>
            In Room 66, <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=156946&amp;rd=4200&amp;rm=5917">lopman</a> and <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=155482&amp;rd=4200&amp;rm=5917">whobot</a> were victims.  <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=156946&amp;rd=4200&amp;rm=5917">lopman</a> lost Level 2 and Level 3
            submissions, while <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=155482&amp;rd=4200&amp;rm=5917">whobot</a> only lost his Level 2 submission.
        </p>
<p>
            <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=286951&amp;rd=4200&amp;rm=5918">RobertLu</a> lost his lead of Room 67 by failing on his Level 2 submission.
            Also to lose points was <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=270980&amp;rd=4200&amp;rm=5918">tidus</a>, whose Level 3 submission failed to pass the tests.
        </p>
<b>Final Results</b>
<ul>
            Room 63:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288584&amp;rd=4200&amp;rm=5914">LunaticFringe</a>
                    - 1382.06</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288819&amp;rd=4200&amp;rm=5914">Number3</a>
                    - 1227.96</li>
  </ol>
            Room 64:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287269&amp;rd=4200&amp;rm=5915">legakis</a>
                    - 1515.66</li>
  </ol>
            Room 66:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287979&amp;rd=4200&amp;rm=5917">Oblok</a>
                    - 1440.51</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287568&amp;rd=4200&amp;rm=5917">tjq</a>
                    - 1218.16</li>
  </ol>
            Room 67:
            <ol>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288788&amp;rd=4200&amp;rm=5918">Wronkyn</a>
                    - 1416.29</li>
    <li>
      <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288003&amp;rd=4200&amp;rm=5918">reyes</a>
                    - 1286.05</li>
  </ol>
</ul>
<p>
                    The leaders shown above each turned in very impressive performances in SRM 98.
                    Such a high number of high scores are rarely seen, as not many rookies can complete
                    the entire problem set.  None could match <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287269&amp;rd=4200&amp;rm=5915">legakis</a>'s excellent performance,
                    finishing with 1515.66 points, all earned during the Coding Phase.  This was the third highest
                    score in all of Division 2.  Congratulations to <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287269&amp;rd=4200&amp;rm=5915">legakis</a>, as well as
                    <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288584&amp;rd=4200&amp;rm=5914">LunaticFringe</a>, <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=287979&amp;rd=4200&amp;rm=5917">Oblok</a>, and <a class="bodyGeneric" href="http://www.topcoder.com/stat?c=coder_room_stats&amp;cr=288788&amp;rd=4200&amp;rm=5918">Wronkyn</a>, who each
                    obtained yellow ratings after their first night of competition.
                </p>



<!-- <P>
At the time of this writing, it was not known to ZorbaTHut that jello (the
rookie winner) was disqualified from the match and future competitions for
cheating. Jello's results will not be found in the match results.
</P> -->

<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
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
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_rookie','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
<!-- <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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


