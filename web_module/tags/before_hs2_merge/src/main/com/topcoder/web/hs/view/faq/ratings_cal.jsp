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
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_faq.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
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
            <TD HEIGHT="100%" CLASS="bodyText">
            <!--Body starts here-->
<BR><BR><B>New ratings are calculated as follows:</B><BR><BR>
                After each competition, each coder who attended the competition is re-rated according
                the following algorithm.  Keep in mind that only coders who shared the same problem set are rated against one another.  The average rating of everyone in the competition is calculated:
                <BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/avg.gif" WIDTH="167" HEIGHT="58" ALT="average rating"><BR><BR>
                Where NumCoders is the number of coders in the competition and Rating is the 
                rating without the volatility of the coder in the competition before the competition.
                <BR><BR><B>The competition factor is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/cf.gif" WIDTH="356" HEIGHT="62" ALT="competition factor"><BR><BR>
                Where Volatility is the volatility of the coder in the competition before the competition.
                <BR><BR><B>The skill of the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/skill.gif" WIDTH="138" HEIGHT="34" ALT="skill"><BR><BR>
                Where Rating is the coder's rating before the competition.
                <BR><BR><B>The deviation of the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/dev.gif" WIDTH="141" HEIGHT="34" ALT="deviation"><BR><BR>
                Where Volatility is the volatility of the coder before the competition.
                <BR><BR>
                The probability of the coder getting a higher score than another coder in the 
                competition (WPi for i from 1 to NumCoders) is estimated.  See below for the 'Estimation Algorithm'.
                The expected rank of the coder is calculated:
                <BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/er.gif" WIDTH="118" HEIGHT="39" ALT="expected rank"><BR><BR><B>The expected performance of the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/ep.gif" WIDTH="170" HEIGHT="34" ALT="expected performance"><BR><BR>
                Where <IMG BORDER="0" SRC="/i/hs/rating/phi.gif" WIDTH="11" HEIGHT="11" ALT="inverse standard normal">  
                is the inverse of the standard normal function.
                <BR><BR><B>The actual performance of each coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/ap.gif" WIDTH="170" HEIGHT="34" ALT="expected performance"><BR><BR>
                Where ARank is the actual rank of the coder in the competition based on score 
                (1 for first place, NumCoders forlast).  If the coder tied with another coder, 
                the rank is the average of the positions covered by the tied coders.
                <BR><BR><B>The performed as rating of the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/pa.gif" WIDTH="286" HEIGHT="14" ALT="performed as"><BR><BR><B>The weight of the competition for the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/wt.gif" WIDTH="223" HEIGHT="37" ALT="weight of the competition"><BR><BR>
                Where TimesPlayed is the number of times the coder has been rated before.
                <BR><BR>
                To stabilize the higher rated members, the Weight of members whose rating is 
                between 2000 and 2500 is decreased 10% and the Weight of members whose rating 
                is over 2500 is decreased 20%.
                <BR><BR><B>A cap is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/cap.gif" WIDTH="186" HEIGHT="37" ALT="cap"><BR><BR><B>The new volatility of the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/nv.gif" WIDTH="421" HEIGHT="46" ALT="new volatility"><BR><BR><B>The new rating of the coder is calculated:</B><BR><BR><IMG BORDER="0" ALIGN="center" SRC="/i/hs/rating/nr.gif" WIDTH="253" HEIGHT="37" ALT="new rating"><BR><BR>
                If |NewRating - Rating| &gt; Cap the NewRating is adjusted so it is at most Cap different than Rating.
                <BR><BR><HR><BR><BR><B>Estimation Algorithm:</B><BR><BR>
Estimating the probability a coder gets a higher score than another coder is done by looking at either coder's 
expected performance rating on a range of good to bad days.  Each coder's performance is modeled as a
normal distribution with a mean (the rating) and standard deviation (the volatility).  Using this model, a coder's
performance can be turned into a percentage using the normal distribution, so that 50% represents expected
performance and 25% represents better three days out of four, etc.  Then, to estimate the probability that the
coder beats coder i, the range from 0% to 100% is broken into 1% blocks, and the midpoint is taken of each
block and the corresponding performance is computed.  The win probability is the number of blocks where the
midpoint favors coder i.  If it's a tie, the block is split between both coders.   
                <BR><BR>
Here is the psuedo-code function to estimate the probability of coder A beating coder B
(<SPAN STYLE="font-family:Symbol;">f</SPAN> is the inverse of the
standard normal function):
                <BR><BR>
WinProbability( SkillA, DeviationA, SkillB, DeviationB)
                <BR>
         Set count, a, b to 0.
                <BR>
         Set fa = SkillA + f((a + .5)/100)*DeviationA
                <BR>
         Set fb = SkillB + f((b + .5)/100)*DeviationB
                <BR>
         While (a&lt;100)
                <BR>
 &nbsp;&nbsp;        If fa&lt;fb:
                <BR>
 &nbsp;&nbsp;&nbsp;&nbsp;         Add 100-b to count
                <BR>
  &nbsp;&nbsp;&nbsp;&nbsp;        Increment a
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp; Set fa = SkillA + f((a + .5)/100)*DeviationA
                <BR>
&nbsp;&nbsp;         If fa == fb:
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;          Add 100-b-.5 to count
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;          Increment a
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;          Increment b
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;         Set fa = SkillA + f((a + .5)/100)*DeviationA
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;         Set fb = SkillB + f((b + .5)/100)*DeviationB
                <BR>
&nbsp;&nbsp;         If fa&gt;fb:
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;            Increment b
                <BR>
&nbsp;&nbsp;&nbsp;&nbsp;            Set fb = SkillB + f((b + .5)/100)*DeviationB
                <BR>
            Return count  (count is the win probability)
                <BR><P><BR></P>
              <!--Body Ends Here-->
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
        <TD WIDTH="" BGCOLOR="#001934" VALIGN="top">        
<IMG SRC="/i/hs/right_top_3dots.gif" WIDTH="86" HEIGHT="41" ALT="" BORDER="0" >
<BR/>
<jsp:include page="../includes/right_resources.jsp" /></TD>		
	</TR>
</TABLE>
</TD></TR></TABLE>
<jsp:include page="../includes/foot.jsp" />
</BODY>
</HTML>
