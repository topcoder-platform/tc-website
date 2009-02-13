<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>    
  <xsl:import href="../includes/contacts/public_contacts_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: The Arena</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->				
        <xsl:call-template name="public_contacts_left"/>
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
  <xsl:with-param name="image">arena</xsl:with-param>
  <xsl:with-param name="title">&#160;Arena Applet Plugins</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>					
					
<P CLASS="statText">
<A HREF="/contest/classes/Editor_Plugin_How_To.htm" CLASS="statText"> Click here for documentation on how to create your own >></A>
</P>

<P CLASS="statText">
Plugin Name: RonProc<BR/>
Description: A plugin to extract test cases enabling automated solution testing.<BR/>
Author: b0b0b0b<BR/>
Date: 6/13/2002<BR/>
Instructions: <A HREF="/contest/classes/RonProc.htm" CLASS="statText">Documentation >></A><BR/>
Upgrade Release Notes: <A HREF="/contest/classes/RonProc_1_0_0.htm" CLASS="statText">Release Notes >></A><BR/>
Version: 1.00<BR/>
Source: <A HREF="/contest/classes/RonProc.java" CLASS="statText">Source &gt;&gt;</A><BR/>
EntryPoint: codeprocessor.EntryPoint (case sensitive)<BR/>
ClassPath: CodeProcessor.jar; FileEdit.jar; ProblemParser.jar<BR/>
<A HREF="/contest/classes/RonProc.jar" CLASS="statText">RonProc.jar Plugin &gt;&gt;</A><BR/>
</P>

<P CLASS="statText">
Plugin Name: ProblemParser<BR/>
Description: A plugin to parse the problem statement.<BR/>
Author: kyky<BR/>
Date: 6/11/2002<BR/>
Instructions: <A HREF="/contest/classes/ProblemParser.htm" CLASS="statText">Documentation >></A><BR/>
Upgrade Release Notes: <A HREF="/contest/classes/ProblemParser_1_0_0a.htm" CLASS="statText">Release Notes >></A><BR/>
Version: 1.00a<BR/>
Source: <A HREF="/contest/classes/src.zip" CLASS="statText">Source &gt;&gt;</A><BR/>
EntryPoint: codeprocessor.EntryPoint (case sensitive)<BR/>
ClassPath: CodeProcessor.jar; FileEdit.jar; ProblemParser.jar<BR/>
<A HREF="/contest/classes/ProblemParser.jar" CLASS="statText">ProblemParser.jar Plugin &gt;&gt;</A><BR/>
</P>


<P CLASS="statText">
Plugin Name: CodeProcessor<BR/>
Description: Plugin that will allow you to write pre/post processing source code scripts for use with other editor plugins<BR/>
Author: Pops<BR/>
Date: 5/23/2002<BR/>
Instructions: <A HREF="/contest/classes/CodeProcessor.htm" CLASS="statText">Documentation >></A><BR/>
Upgrade Release Notes: <A HREF="/contest/classes/CodeProcessor_Upgrade_1_1_5.htm" CLASS="statText">Release Notes >></A><BR/>
Version: 1.1.5<BR/>
EntryPoint: codeprocessor.EntryPoint (case sensitive)<BR/>
ClassPath: CodeProcessor.jar<BR/>
<A HREF="/contest/classes/CodeProcessor.jar" CLASS="statText">CodeProcessor.jar Plugin >></A><BR/>
</P>


<P CLASS="statText">
Plugin Name: PopsEdit<BR/>
Description: Feature rich editor that has all the features Pops needs<BR/>
Author: Pops<BR/>
Date: 6/4/2002<BR/>
Instructions: <A HREF="/contest/classes/PopsEdit.htm" CLASS="statText">Documentation >></A><BR/>
Upgrade Release Notes: <A HREF="/contest/classes/PopsEdit_Upgrade_2_7.htm" CLASS="statText">Release Notes >></A><BR/>
Version: 2.7<BR/>
EntryPoint: popsedit.EntryPoint (case sensitive)<BR/>
ClassPath: PopsEdit.jar<BR/>
<A HREF="/contest/classes/PopsEdit.jar" CLASS="statText">PopsEdit.jar Applet Plugin >></A><BR/>
</P>


<P CLASS="statText">
Plugin Name: FileEdit<BR/>
Description: Plugin that will read/write the problem information to an external file. This allows you to use your favorite editor/IDE to code the solutions to the problems.<BR/>
Author: Pops<BR/>
Date: 5/14/2002<BR/>
Instructions: <A HREF="/contest/classes/FileEdit.htm" CLASS="statText">Documentation >></A><BR/>
Upgrade Release Notes: <A HREF="/contest/classes/FileEdit_Upgrade_2_6.htm" CLASS="statText">Release Notes >></A><BR/>
Version: 2.6<BR/>
Plugin Entry Point: fileedit.EntryPoint<BR/>
Plugin ClassPath: FileEdit.jar<BR/>
<A HREF="/contest/classes/FileEdit.jar" CLASS="statText">FileEdit.jar Applet Plugin >></A><BR/>
</P>

					<P><br/></P>
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

