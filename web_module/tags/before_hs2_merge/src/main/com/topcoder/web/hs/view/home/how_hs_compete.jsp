<jsp:useBean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />
<jsp:setProperty name="NavZone" property="Level0" value="how_hs_compete" />
<jsp:setProperty name="NavZone" property="Level1" value="" />

<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="../includes/css.jsp" />
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
        <jsp:include page="../includes/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_bg.gif" BGCOLOR="#FFFFFF">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0"  WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_hscompete.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="4096">&nbsp;
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
            <TD VALIGN="top" CLASS="bodyText">
            <!--Body starts Here-->
        <P><B> What schools can participate?</B></P>

<P>All high schools in Connecticut are eligible to participate in TopCoder High School.  Consistent with the CIAC, the high schools are categorized based on their conference size (i.e. Class S, M, L or LL).  </P>

<P><B>How are teams assembled?</B></P>

<P>One coach from each high school assembles a group of students to compete.  Any number of students may compete for a school, but only the top 3 students for a particular high school contribute to that high school's score in a round.  </P>

<P><B>How are scores determined?</B></P>

<P>The score of a high school for a particular round is the sum of the finishing positions of that high school's top 3 students for that round.  For example, if Glastonbury High School has 5 students that compete in round 1, and they place 3, 14, 26, 50, and 87 respectively, the score for that team for round 1 is 43.  The winning high school for a particular round is the high school with the lowest score.  </P>

<P><B>Can a school with less than 3 students on a team still compete?</B></P>

<P>Yes.  A high school may have less then 3 students competing, but their scores do not count towards the score for their high school.  These students are permitted to compete for fun.</P>
  
<P><B>How do schools advance to the playoffs?</B></P>

<P>The regular season will consist of 8 regular matches.  In order to be invited to the playoffs, a high school must have competed in at least 6 "scored" rounds.  This means that they must have had at least 6 rounds in which they had at least 3 students competing.  The highest ranked schools at the end of the regular season will be invited to the playoffs.  A high school's rank will be determined by the average of that high school's best 6 scores.   </P>
<P><BR/></P>                         
            <!-- Body Ends Here-->            
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
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_right.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="" BGCOLOR="#001934" VALIGN="top" > <BR/>
<IMG SRC="/i/hs/right_top_3dots.gif" WIDTH="86" HEIGHT="41" ALT="" BORDER="0" >
<BR/>
<jsp:include page="../includes/right_resources.jsp" />
     </TD>		
	</TR>
</TABLE>
</TD></TR></TABLE>
<jsp:include page="../includes/foot.jsp" />
</BODY>
</HTML>
