<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>    
  <xsl:template match="/">
    <HTML>
      <HEAD>     
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#CCCCCC" WIDTH="80%">
	<TR>
		<TD><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Affidavit</xsl:with-param>
</xsl:call-template>
     </TD>
	</TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="80%">
  <TR>
    <TD BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>  
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P CLASS="statText" ALIGN="center">
<A CLASS="statText" TARGET="_top" HREF="/?t=affidavit&amp;c=list">Click here to return to affidavit list.</A>  |  <A CLASS="statText" TARGET="_top"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Click here to update your profile</A>
</P>
<P CLASS="statText">
To print the affidavit click on the affidavit frame below and use one of the following commands:<BR/>
PC hold down the Control key and press "P" on your keyboard<BR/>
MAC hold down the Command key and press "P" on your keyboard<BR/>
</P>
<P><BR/></P>
<P><BR/></P>
     </TD>
     <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>     
	</TR>	
	<!-- <TR>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="5" CLASS="statText" VALIGN="middle" HEIGHT="20"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>		
	</TR> -->
</TABLE>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
