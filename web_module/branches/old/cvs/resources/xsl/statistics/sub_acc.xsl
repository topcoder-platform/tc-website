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

<P CLASS="statText">Top-25 Overall (Through March 11, 2002)</P>

<P CLASS="statText">
This chart ranks the top-25 in Submission Accuracy for Single Round Matches 1-71.
Submission Accuracy is measured by dividing the number 
of correct submissions by the number of total submissions by a member.
</P>

<P CLASS="statText">Note: Based on a minimum of 50 submissions</P>
    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="6" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Submission Accuracy</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="18">&#160;</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="20%" HEIGHT="18">Handle</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%" HEIGHT="18">Events</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%" HEIGHT="18">Submissions</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%" HEIGHT="18">Correct</TD>		
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%" HEIGHT="18">Accuracy</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">65</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">194</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">164</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">84.54%</TD>		
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">2.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">129</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">108</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">83.72%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">110</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">92</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">83.64%</TD>		
	</TR>
	<TR>	     
 		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">4.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">111</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">91</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">81.98%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">5.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">152</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">123</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">80.92%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">6.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153733" CLASS="coderTextRed">dsp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">103</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">81</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78.64%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150424" CLASS="coderTextRed">RachaelLCook</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">107</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">84</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78.50%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">8.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">88</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78.41%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">9.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">38</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">73</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78.08%</TD>		
	</TR>
	<TR>         
 		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=129196" CLASS="coderTextYellow">alexcchan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">37</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">98</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">76</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">77.55%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">11.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextYellow">po</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">62</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">77.42%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">36</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">102</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">77.55%</TD>		
	</TR>
	<TR>         
 		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">36</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">102</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">77.55%</TD>		
	</TR>
	<TR>         
 		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153902" CLASS="coderTextRed">evd</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">33</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">97</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">76.29%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">15.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=160378" CLASS="coderTextYellow">pieffe</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">19</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">38</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">76.00%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">16.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">154</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">117</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">75.97%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">17.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=151041" CLASS="coderTextYellow">andyb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">75.47%</TD>		
	</TR>
	<TR>         
 		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">18.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=129063" CLASS="coderTextBlue">mktong</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">79</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.68%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">19.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158658" CLASS="coderTextYellow">razorback</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">25</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.58%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">20.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">152</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">113</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.34%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">21.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156592" CLASS="coderTextRed">benetin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">100</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">74.00%</TD>		
	</TR>
	<TR>         
 		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">22.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158333" CLASS="coderTextRed">dvickrey</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">75</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">73.33%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150758" CLASS="coderTextYellow">Psion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">23</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">42</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">72.41%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">24.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">148</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">107</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">72.30%</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">25.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109933" CLASS="coderTextYellow">falcon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">72</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">72.22%</TD>		
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

