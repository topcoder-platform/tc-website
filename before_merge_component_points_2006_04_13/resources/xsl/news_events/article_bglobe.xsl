<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Press Room</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="180" VALIGN="top">
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
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Articles</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
          <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>
						<TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="2" HEIGHT="18">&#160;</TD></TR>
            <TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2001</TD></TR> 
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/bostonglobe.jpg" ALT="" WIDTH="364" HEIGHT="71" BORDER="0"/></DIV><BR/><BR/>
            The new rules<BR/>
            By Scott Kirsner<BR/><BR/>
            The high-tech job market is operating by a new set of rules in these tighter times.<BR/><BR/>
            Employers can take their time in sorting through a group of candidates, making sure they find the one with the most relevant experience and the 
            best fit with their corporate culture. On-the-spot offers are no longer commonplace, but low-balling is.<BR/><BR/>
            Candidates have to "sing and dance and do a lot more to distinguish [themselves]," says Barrett Hinckley, founder of Bullhorn, a South Boston 
            company that develops software for staffing firms. "You have to show that you're a true performer, someone who really brings value to an 
            organization," adds Russ Campanello, the chief people officer at NerveWire, a technology consulting firm in Newton.<BR/><BR/>
            A plain vanilla resume constructed in Microsoft Word, as a job-hunting tool, is so 1999. You want to land a gig in 2001? You need to prove 
            your mettle and showcase your past results.<BR/><BR/>
            "The tendency in engineering is to list [a technology skill] on your resume that you've read a little bit about," says John Caffrey, vice 
            president of human resources at Sitara Networks in Waltham. "Now, you have to have proven experience, very deep experience."<BR/><BR/>
            Witness the TopCoder 2001 Invitational, a competition for programmers that kicks off this Wednesday. Entrants write software in Java or C++ to 
            solve particular problems -- like keeping track of statistics over the course of a baseball game. They can challenge each others' entries, 
            looking for errors. There's a time limit.<BR/><BR/>
            "It's like an SAT test combined with `The Weakest Link,"' says Jack Hughes, TopCoder's founder. "It's almost a sport." The 16 most skilled 
            programmers, decided in three online rounds, will compete for $250,000 in cash prizes at Foxwoods Casino this November.<BR/><BR/>
            Prior to TopCoder, programmers differentiated themselves by earning certifications in various languages, applications, and operating systems. 
            Now, they're competing head-to-head for bragging rights -- and the prime jobs.<BR/><BR/>
            "Standard certification never gave you a relative measure," says Hughes, who before starting TopCoder sold the Web development company Tallan 
            to CMGI. "Employers have learned their lesson and become more selective and discriminating. They're hiring more for quality than quantity right 
            now, and I hope TopCoder plays into that."<BR/><BR/>
            Human resources executives acknowledge that their hiring practices have changed dramatically. At Sitara, in 1999 and 2000, the networking 
            company typically was looking to fill 40 or 50 jobs at any given time. These days, Caffrey says, it's more common for him to have just four 
            or five openings.<BR/><BR/>
            "A year or two ago, it was so hard to find people that we would compromise our requirements because we needed [someone] in the position," he 
            explains. "We were more willing to train them, more willing to groom them." But now "there are an awful lot of candidates in the market," 
            Caffrey says. "That gives us an opportunity to be much more selective, and make sure that we [are hiring] folks who have all the skills we're 
            looking for. It raises the bar."<BR/><BR/>
            "The dark, dirty secret of the dot-com bubble was that there was a lot of bad hiring," says Campanello at NerveWire. "We were in the scramble, 
            but we tried to keep our standards high. We hire people who don't just talk about delivering stuff, but can actually show that they've 
            delivered stuff." Candidates at NerveWire might be asked to teach a class or seminar, so that their presentation skills can be evaluated, or 
            walk through an actual project that they've completed at a past job.<BR/><BR/>
            Large well-established tech companies like EMC Corp. are seeing an increase in the overall number of applicants. Erin Motameni, vice president 
            of worldwide staffing at the Hopkinton-based data storage company, expects to pore over roughly 260,000 resumes this year; an average year 
            brings 200,000.<BR/><BR/>
            Instead of submitting resumes that simply list dates, titles, and job responsibilities, the smartest candidates will create multimedia 
            extravaganzas on the Web or on CD-ROM.<BR/><BR/>
            Bullhorn Staffing, a product launched in March, is emblematic of this new direction. It enables staffing firms to build "enhanced profiles" 
            for the candidates they're trying to place in jobs. A profile can include not just the traditional work and educational history, but 
            screenshots of Web sites the candidate has designed, PowerPoint presentations he has delivered at industry conferences, streaming video and 
            photographs, and clips of articles he has written or been quoted in.<BR/><BR/>
            "If better tools are available, then the better people will find and use those tools to differentiate themselves," says Hinckley, the 
            founder of Bullhorn.<BR/><BR/>
            Motameni at EMC says the "A players" of the technology world are still getting snapped up at a quick clip, especially engineers and salespeople. 
            But NerveWire's Campanello argues that many people held high-level positions in the dot-com era that they didn't really deserve, and he expects 
            to see them settle for less impressive titles and lower salaries when they take their next jobs.<BR/><BR/>
            "During the gold rush, a lot of people got jobs that they'll never be able to get again," Campanello says.<BR/><BR/>
            That could be the case with one techie I spoke with last week. Laid off in May, Matt Harris had been the vice president of engineering at a 
            Boston-area Net start-up. "There's a real lack of senior engineering job opportunities [right now]," he explained. "There are plenty of 
            [lower-level] project manager jobs, but I've been a project manager before."<BR/><BR/>
            After serving as a director and then a vice president, concentrating on lofty strategic issues, he wasn't eager to drop back down the ladder. 
            Harris called me from a construction site in Foxborough, where he was doing carpentry work on new homes.<BR/><BR/>
            "This may be a new path for me," he said. "I'm not sure I need to go back to the corporate world."<BR/><BR/>
            Those who do seek new jobs in the corporate world will find themselves competing in all sorts of unusual ways. With TopCoder organizing 
            invitational tournaments for software developers at Foxwoods, the SysAdmin Triathlon and BizDev Olympics may not be far off.<BR/><BR/>
            Sign me up for the Columnists' 10K. I'm tanned, rested, and ready to type my heart out.<BR/><BR/>
            Scott Kirsner is a Boston freelance writer and a contributing editor at Wired and Fast Company magazines. He can be reached by 
            e-mail at kirsner@att.net<BR/><BR/>
            </TD></TR>                                                                 
          </TABLE>
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
    <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
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
