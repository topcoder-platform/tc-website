<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/dev/public_dev_left.xsl"/>
  <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Development</TITLE>
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
        <xsl:call-template name="public_dev_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>






<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" HEIGHT="69%">
  <TR>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <FORM name="frmSend" method="POST" action="/">
              <INPUT TYPE="hidden" NAME="t" VALUE="development"/>
              <INPUT TYPE="hidden" NAME="c" VALUE="send"/>
              <INPUT TYPE="hidden" NAME="Project">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/Project"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="To">
                <xsl:attribute name="VALUE">development@topcoder.com</xsl:attribute>
              </INPUT>
              <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" /></td></tr>
                <tr>
                  <td align="right" valign="top" class="statText">Project:&#160;&#160;</td>
                  <td align="left" valign="top" class="statText">
                      <b><xsl:value-of select="/TC/DEVELOPMENT/ProjectName"/></b><br/><br/>
                  </td>
                </tr>
                <tr>
                  <td align="right" valign="top" class="statText">
                    Experience:&#160;&#160;
                  </td>
                  <td align="left" valign="top">
                    <TEXTAREA NAME="Experience" Rows="5" COLS="40"/>
                  </td>
                </tr>
                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" /></td></tr>
                <tr>
                  <td align="right" valign="top" class="statText">
                    Hours per Week &#160;&#160;<br/>Available for Project: &#160;&#160;
                  </td>
                  <td align="left" valign="top">
                    <SELECT NAME="WorkWeek" SIZE="1">
                      <OPTION VALUE="0-10">0 - 10</OPTION>
                      <OPTION VALUE="10-20">10 - 20</OPTION>
                      <OPTION VALUE="20-30">20 - 30</OPTION>
                      <OPTION VALUE="30-40">30 - 40</OPTION>
                      <OPTION VALUE="40+">40+</OPTION>
                    </SELECT>
                  </td>
                </tr>
                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" /></td></tr>
                <tr>
                  <td align="right" valign="top" class="statText">
                    Comment: &#160;&#160;
                  </td>
                  <td align="left" valign="top">
                    <TEXTAREA NAME="Comment" Rows="5" COLS="40"/>
                  </td>
                </tr>
                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" /></td></tr>
                <tr>
                  <td/>
                  <td class="bodyText">

                     <a class="statTextBig" href="Javascript:document.frmSend.submit()">
                       <b>Click here to submit &gt;&gt;</b>
                     </a>
                  </td>
                </tr>
              </table>

            </FORM>

    </TD>
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
			<xsl:call-template name="public_dev_right" />        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

