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
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Match Editorial Archive - 2003</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>March</B></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;03.05.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2003 TCCC Regional Semi. - <A HREF="/index?t=statistics&amp;c=tccc03_reg_semi_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>

        <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>February</B></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.26.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2003 TCCC Regional Quart. - <A HREF="/index?t=statistics&amp;c=tccc03_reg_quart_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.25.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 136 - <A HREF="/index?t=statistics&amp;c=srm136_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.22.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2003 TCCC Round 1 Int. - <A HREF="/index?t=statistics&amp;c=tccc03_int_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.20.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2003 TCCC Round 1 W/MW - <A HREF="/index?t=statistics&amp;c=tccc03_wmw_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.18.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2003 TCCC Round 1 NE/SE - <A HREF="/index?t=statistics&amp;c=tccc03_nese_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.11.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 135 - <A HREF="/index?t=statistics&amp;c=srm135_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.08.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 134 - <A HREF="/index?t=statistics&amp;c=srm134_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.05.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 133 - <A HREF="/index?t=statistics&amp;c=srm133_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.01.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 132 - <A HREF="/index?t=statistics&amp;c=srm132_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>

        <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>January</B></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.30.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 131 - <A HREF="/index?t=statistics&amp;c=srm131_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.25.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 130 - <A HREF="/index?t=statistics&amp;c=srm130_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.14.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 129 - <A HREF="/index?t=statistics&amp;c=srm129_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.06.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 128 - <A HREF="/index?t=statistics&amp;c=srm128_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.02.03</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 127 - <A HREF="/index?t=statistics&amp;c=srm127_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>				
</TABLE>
<BR/><BR/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Match Editorial Archive - 2002</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>December</B></TD></TR>
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.23.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 126 - <A HREF="/index?t=statistics&amp;c=srm126_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>				
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.16.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 125 - <A HREF="/index?t=statistics&amp;c=srm125_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.12.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 124 - <A HREF="/index?t=statistics&amp;c=srm124_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		     
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.10.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 123 - <A HREF="/index?t=statistics&amp;c=srm123_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.04.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 122 - <A HREF="/index?t=statistics&amp;c=srm122_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	
	
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>November</B></TD></TR>     
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.26.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 121 - <A HREF="/index?t=statistics&amp;c=srm121_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	        
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.23.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Championship - <A HREF="/index?t=tournaments&amp;c=invit02_champprob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	        
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.22.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Room #4 - <A HREF="/index?t=tournaments&amp;c=invit02_semiprob4" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	  
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.22.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Room #3 - <A HREF="/index?t=tournaments&amp;c=invit02_semiprob3" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	  
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.22.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Room #2 - <A HREF="/index?t=tournaments&amp;c=invit02_semiprob2" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	          
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.22.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Room #1 - <A HREF="/index?t=tournaments&amp;c=invit02_semiprob1" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	        
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.13.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 120 - <A HREF="/index?t=statistics&amp;c=srm120_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	
        <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.07.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 119 - <A HREF="/index?t=statistics&amp;c=srm119_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>            
    	<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>October</B></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.30.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Round #4 - <A HREF="/index?t=statistics&amp;c=invit02_r4_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.29.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 118 - <A HREF="/index?t=statistics&amp;c=srm118_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.23.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Round #3 - <A HREF="/index?t=statistics&amp;c=invit02_r3_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.21.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 117 - <A HREF="/index?t=statistics&amp;c=srm117_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.16.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Round #2 - <A HREF="/index?t=statistics&amp;c=invit02_r2_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.15.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 116 - <A HREF="/index?t=statistics&amp;c=srm116_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.10.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Round #1 (part 2) - <A HREF="/index?t=statistics&amp;c=invit02_r1b_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.08.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;2002 Invitational Round #1 (part 1) - <A HREF="/index?t=statistics&amp;c=invit02_r1a_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>
				
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>September</B></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.30.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 115 - <A HREF="/index?t=statistics&amp;c=srm115_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.24.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 114 - <A HREF="/index?t=statistics&amp;c=srm114_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.10.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 113 - <A HREF="/index?t=statistics&amp;c=srm113_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.09.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 112 - <A HREF="/index?t=statistics&amp;c=srm112_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.04.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 111 - <A HREF="/index?t=statistics&amp;c=srm111_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>August</B></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.27.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 110 - <A HREF="/index?t=statistics&amp;c=srm110_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.21.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 109 - <A HREF="/index?t=statistics&amp;c=srm109_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.12.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 108 - <A HREF="/index?t=statistics&amp;c=srm108_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.07.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 107 - <A HREF="/index?t=statistics&amp;c=srm107_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>	
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.01.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 106 - <A HREF="/index?t=statistics&amp;c=srm106_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		
		
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>July</B></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.24.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 105 - <A HREF="/index?t=statistics&amp;c=srm105_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.16.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 104 - <A HREF="/index?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">Problem Set &amp; Analysis</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.10.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 103 - <A HREF="/index?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm103_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.01.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 102 - <A HREF="/index?t=statistics&amp;c=srm102_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm102_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm102_prob" CLASS="bodyGeneric">Problem Set</A><!-- | <A HREF="/index?t=statistics&amp;c=srm102_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A> --></TD></TR>		

		
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>June</B></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.26.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 101 - <A HREF="/index?t=statistics&amp;c=srm101_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm101_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm101_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm101_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.24.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 100 - <A HREF="/index?t=statistics&amp;c=srm100_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm100_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm100_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.19.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 98 - <A HREF="/index?t=statistics&amp;c=srm98_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm98_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm98_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>				
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.12.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 97 - <A HREF="/index?t=statistics&amp;c=srm97_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm97_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm97_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm97_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.11.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 96 - <A HREF="/index?t=statistics&amp;c=srm96_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm96_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm96_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.05.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 95 - <A HREF="/index?t=statistics&amp;c=srm95_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm95_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm95_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.03.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 94 - <A HREF="/index?t=statistics&amp;c=srm94_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm94_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm94_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>		
				
		
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>May</B></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.30.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 93 - <A HREF="/index?t=statistics&amp;c=srm93_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm93_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm93_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm93_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.29.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 92 - <A HREF="/index?t=statistics&amp;c=srm92_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm92_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm92_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.22.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 91 - <A HREF="/index?t=statistics&amp;c=srm91_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm91_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm91_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm91_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.21.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 90 - <A HREF="/index?t=statistics&amp;c=srm90_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm90_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm90_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.18.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 89 - <A HREF="/index?t=statistics&amp;c=srm89_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm89_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm89_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm89_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>	
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.15.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 88 - <A HREF="/index?t=statistics&amp;c=srm88_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm88_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm88_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm88_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>	
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.09.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 87 - <A HREF="/index?t=statistics&amp;c=srm87_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm87_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm87_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm87_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.08.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 86 - <A HREF="/index?t=statistics&amp;c=srm86_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm86_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm86_prob" CLASS="bodyGeneric">Problem Set</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.01.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 85 - <A HREF="/index?t=statistics&amp;c=srm85_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm85_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm85_prob" CLASS="bodyGeneric">Problem Set</A> | <A HREF="/index?t=statistics&amp;c=srm85_lessons" CLASS="bodyGeneric">Lessons&#160;Learned</A></TD></TR>


		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>April</B></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.30.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 84 - <A HREF="/index?t=statistics&amp;c=srm84_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm84_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm84_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.27.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 83 - <A HREF="/index?t=statistics&amp;c=srm83_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm83_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm83_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.24.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 82 - Coder Point of View editorials not available for this match.</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.22.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 81 - This match was rescheduled to Saturday, April 27th as SRM 83</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.15.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 80 - <A HREF="/index?t=statistics&amp;c=srm80_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm80_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm80_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.10.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 79 - <A HREF="/index?t=statistics&amp;c=srm79_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm79_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm79_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.09.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 78 - <A HREF="/index?t=statistics&amp;c=srm78_room1" CLASS="bodyGeneric">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm78_rookie" CLASS="bodyGeneric">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm78_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD COLSPAN="2" ALIGN="left" CLASS="bodyGeneric"><BR/><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Are you a member interested in writing a review?</A></TD></TR>
            </TABLE>
          <P><BR/></P>					</TD>
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
