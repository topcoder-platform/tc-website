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
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Quick Stats</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<P CLASS="statText">
This chart represents the Top-25 in Challenge Success (through March 11, 2002) for Single Round Matches 1-71.
Challenge Success is a percentage based on successful challenges divided by total challenges.
</P>

<P CLASS="statText">
Note: Based on a minimum of 20 challenges
</P>
    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="6" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Challenge Success</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="18">&#160;</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="25%">Handle</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Events</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Challenges</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Success</TD>				
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Success%&#160;</TD>				
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">83.58%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">2.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">65</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">73</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">61</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">83.56%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153733" CLASS="coderTextRed">dsp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">25</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">80.00%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">4.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78.57%</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">5.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=138655" CLASS="coderTextGreen">jap4524</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">27</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">23</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78.26%</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">6.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150424" CLASS="coderTextRed">RachaelLCook</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">29</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">75.86%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=129196" CLASS="coderTextYellow">alexcchan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">37</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">75.00%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=107798" CLASS="coderTextBlue">jay_peg</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">75.00%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">9.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.58%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">38</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.51%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">11.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">27</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.07%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=129672" CLASS="coderTextRed">doeth</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">73.33%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">13.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">29</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">19</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">73.08%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159818" CLASS="coderTextYellow">kvin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71.43%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150419" CLASS="coderTextYellow">RoaminUmp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">23</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71.43%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">16.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150292" CLASS="coderTextYellow">fattom</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">27</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">19</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70.37%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">17.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">37</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70.27%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">18.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=151886" CLASS="coderTextBlue">kdby</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">23</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">16</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69.57%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">19.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=141187" CLASS="coderTextBlue">gsh</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">36</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">25</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69.44%</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">20.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">33</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">27</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69.23%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">21.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68.63%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">22.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=151059" CLASS="coderTextBlue">jthomas</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68.18%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">62</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68.00%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">24.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=147031" CLASS="coderTextBlue">gaav</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">33</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67.35%</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">25.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=139080" CLASS="coderTextYellow">bbeck13</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">25</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">16</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">66.67%</TD>
	</TR>
  <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"/></TD>
    </TR>    
</TABLE>  
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

