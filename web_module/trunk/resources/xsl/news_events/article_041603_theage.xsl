<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>     
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
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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
        <TD WIDTH="4" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
        <TD CLASS="bodyText" WIDTH="100%" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Press Releases - 2003</xsl:with-param>
</xsl:call-template>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
                <TR>
                    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
                    <TD CLASS="bodyText" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="400" HEIGHT="1" BORDER="0"/><br />

                        <div align="center"><img src="/i/pressroom/the_age_logo.gif" alt="The Age (Melbourne, Australia)" width="302" height="56" border="0" /></div>

                        <h2>John Dethridge Receives Award</h2>
                        <p>2002 TopCoder Invitational Winner Honored by Governor John Landy</p>
                        
                        <p><a href="http://newsstore.f2.com.au/apps/viewDocument.ac?sid=24788309&amp;sy=age&amp;kw=John+Dethridge&amp;pb=all_ffx&amp;dt=selectRange&amp;dr=1year&amp;so=relevance&amp;st=nw&amp;ss=AGE&amp;sf=all&amp;rc=10&amp;rm=200&amp;clsPage=1&amp;docID=AGE030320B42D04Q56QU" target="_blank">Read original article</a> (Paid subscription required)<br />
                        March 20, 2003<br />
                        <em>By Lucy Beaumont</em></p>

                        <p>When Zerina Lokmic arrived in Australia in 1992 as a refugee from war-torn Bosnia, she never dreamed she 
                        would one day be applauded in the Windsor Hotel ballroom.</p>

                        <p>"I came here and I didn't speak any English. In 10 years, I've done quite a lot," Ms Lokmic, 26, said yesterday 
                        after being honoured by the Rotary Club of Melbourne with a young achiever award for her medical science work.</p>

                        <p>"I can't believe that I came from this little village that is not even on the map, and here I am in Melbourne, 
                        doing great stuff and using whatever I learn for the benefit of others."</p>

                        <p>Ms Lokmic, who is combining her PhD studies with vascular engineering research at St Vincent's Hospital, 
                        was among three young Victorians recognised for their achievements yesterday.</p>

                        <p>Other award winners were Benjamin Namdarin, 22, and John Dethridge, 23.</p>

                        <p>Mr Namdarin, a final-year medical student at Melbourne University, was honoured for his medical and 
                        musical achievements.</p>

                        <p>He said his recent secondments with doctors treating Northern Territory Aboriginal communities and people 
                        in East Timor had confirmed his interest in Third World health.</p>

                        <p>"I will never again take for granted the luxuries we have here in Melbourne... roads, sanitation, clean water 
                        and education," he said.</p>

                        <p>Mr Namdarin, an accomplished violinist and chorister, said the award confirmed that perhaps he was "doing 
                        the right thing".</p>

                        <p>Mr Dethridge, who won the TopCoder international computer programming competition first prize of 
                        $US50,000 ($A84,480) last November, plans to extend and pass on his skills to the next generation of Australian
                        mathematicians and computer scientists.</p>

                        <p>"Australia has talented individuals in many fields," he said. "By recognising and capitalising on their skills, I 
                        believe we can compete against the best in the world in science and industry."</p>

                        <p>Governor John Landy, who presented the awards, said the recipients were an inspiration to young people who 
                        needed "positive role models and leaders who are not necessarily entertainers or sporting heroes".</p>

                        <p>"I think it's tremendously important to be honouring people who've achieved so much academically," he said.</p>

                        <p><br /></p>

                    </TD>
                    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>

                <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>   	
            </TABLE>
        </TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
        <TD WIDTH="4"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
        <TD WIDTH="170" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
        <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
    </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
