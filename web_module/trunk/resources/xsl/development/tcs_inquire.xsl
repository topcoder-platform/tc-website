<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <title>TopCoder | Development</title>
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
  <TR valign="top">
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
    <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>






<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" HEIGHT="69%">
  <TR>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <FORM name="frmSend" method="POST" action="/?&amp;t=development">
              <INPUT TYPE="hidden" NAME="t" VALUE="development"/>
              <INPUT TYPE="hidden" NAME="c" VALUE="tcs_send"/>
              
              <INPUT TYPE="hidden" NAME="comp">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/comp"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="phase">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/phase"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="version">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/version"/></xsl:attribute>
              </INPUT>
              
              <INPUT TYPE="hidden" NAME="date">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/date"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="Project">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/Project"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="handle">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/handle"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="To">
                <xsl:attribute name="VALUE">service@topcodersoftware.com</xsl:attribute>
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
                  <TD></TD>
                  <td align="left" valign="top" class="statText">
                    <TEXTAREA NAME="TermDesc" ROWS="10" COLS="80" READONLY="true" CLASS="bodyText" WRAP="VIRTUAL">
OWNERSHIP AND RIGHTS
You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property rights, in and to the information posted on the TopCoder website.  If TopCoder selects your design or development solution as a "winning" design or development solution (meaning your submissions scored in first, second or third place), you will receive a monetary award.  As consideration for your winning design or development solution and for your monetary award, you agree to irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, the winning design or development solution, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder.  If your submission is not declared a winning design or development solution, you retain any and all rights to ownership of such material submitted to TopCoder.  TopCoder will not gain ownership of this material.  However, by submitting any design documents or source code to TopCoder, you hereby grant us a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such documents or source code for commercial and/or non-commercial use.  Such license shall not include the right to resell the design or development submission. 

You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely and exclusively to TopCoder from the time of their creation.  To the extent any such work of authorship may not be deemed to be a work made for hire, you agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work.

You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed by your authorized agent.

Nothing in this Agreement shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel or otherwise, except as expressly set forth herein.

If you have any questions regarding these Terms, contact us at service@topcoder.com.

                    </TEXTAREA>
                  </td>
                </tr>
                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" /></td></tr>
                <tr>
                  <td align="right" valign="top" class="statText">
                    Agree to Terms:&#160;&#160;
                  </td>
                  <td align="left" valign="top">
                    <INPUT TYPE="checkbox" NAME="terms"/>
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

<!--
                     <A CLASS="statTextBig" HREF="Javascript:if(document.frmSend.terms){document.frmSend.submit();}else{alert('You must agree to the terms to apply for this project.');}">
-->
                     <A CLASS="statTextBig" HREF="Javascript:submitForm();">
                       <b>Click here to submit &gt;&gt;</b>
                     </A>
                  </td>
                </tr>
              </table>
              
              <SCRIPT type="text/javascript"><![CDATA[
                function submitForm() {
                  if (document.frmSend.terms.checked) {document.frmSend.submit();}
                  else {alert("Please read and agree to terms to apply for this project.");}
                  return;
                }
              ]]></SCRIPT>
            </FORM>

    </TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>









    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
        <td width="244" bgcolor="#001B35">
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_dev_right"/>        
<!-- Right Column Include Ends -->        
        </td>
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

