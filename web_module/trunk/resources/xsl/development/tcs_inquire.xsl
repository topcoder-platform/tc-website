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
        <TITLE>TopCoder :: Development</TITLE>
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
        <xsl:call-template name="global_left"/>
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
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>






<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" HEIGHT="69%">
  <TR>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <FORM name="frmSend" method="POST" action="/">
              <INPUT TYPE="hidden" NAME="t" VALUE="development"/>
              <INPUT TYPE="hidden" NAME="c" VALUE="tcs_send"/>
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
                  <TD></TD>
                  <td align="left" valign="top" class="statText">
                    <TEXTAREA NAME="TermDesc" ROWS="10" COLS="80" READONLY="true" CLASS="bodyText" WRAP="VIRTUAL">
ACCEPTANCE OF TERMS OF WORK

By inquiring about the opportunity to design and/or develop a software component listed on this Web site, you are indicating your agreement to these Terms of Work ("Terms"). If you do not agree to these Terms, please click on "I Do Not Accept These Terms" or exit the site now.  

We may revise these Terms at any time without prior notice and such revisions will be effective upon posting. Please read these Terms thoroughly each time you inquire about designing and/or developing a software component as the Terms may change periodically.

DESIGN AND DEVELOPMENT TERMS
By indicating your interest in designing or developing a component for TopCoder, you represent to TopCoder the following:
1.	You are a rated TopCoder member
2.	You are at least 18 years of age
3.	You are either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment, or (iv) a non-U.S. citizen working in your country of residence.
4.	You will abide by the Terms of Use of both TopCoder's and TopCoder Software's websites at www.topcoder.com and www.topcodersoftware.com, respectively.
5.	You acknowledge that you have read and agree to the TopCoder Software Development Methodology posted at www.topcoder.com/?&amp;t=development&amp;c=index.
6.	No impediment exists to you participating in design and/or development projects posted on the TopCoder website, and your participation in such projects will not interfere with your performance of any other agreement or obligation which has been or will be made with any third party.
7.      You agree to use your own independently developed code, and shall not copy or include code from any other party, including publicly available "open source" code that is or may be subject to licensing restrictions, without TopCoder Software's prior written consent.

OWNERSHIP AND RIGHTS
You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property rights, in and to the information posted on the TopCoder website.  If TopCoder selects your design or development solution as the "winning" design or development solution, you will be compensated for your work.  As consideration for the winning design or development solution, you agree to irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, the winning design or development solution, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder.  If TopCoder does not select your design or development solution as the "winning" design or development solution, you retain any and all rights to ownership of such material submitted to TopCoder.  TopCoder will not gain ownership of this material.  However, by submitting any design documents or source code to TopCoder, you hereby grant us a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such documents or source code for commercial and/or non-commercial use.  

You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely and exclusively to TopCoder from the time of their creation.  To the extent any such work of authorship may not be deemed to be a work made for hire, you agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work.
You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed by your authorized agent.
Nothing in this Agreement shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel or otherwise, except as expressly set forth herein.

CONFIDENTIAL INFORMATION
You acknowledge the confidential and proprietary nature of the information you obtain from TopCoder regarding design specifications and functionality and/or development solutions, including, but not limited to, scope documents and source code.  You also acknowledge the confidential and proprietary nature of the information contained in the project postings on our Web site.  You also agree (i) to hold such information in confidence and to take all reasonable precautions to protect such confidential information (including, without limitation, all precautions you may employ with respect to your own confidential materials), (ii) not to divulge any such confidential information to any third person; and (iii) not to make any use whatsoever of such confidential information except as expressly authorized in this Agreement.

INDEMNIFICATION AND RELEASE
By submitting design documents and/or source code in response to projects posted on our Web site, you agree to indemnify us and any parent, subsidiary or affiliated entities, our officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of our Web site and/or the materials gained from our Web site or directly from TopCoder, including any material (including third party material) that you post on our Web site or in any news forums and any services or products available through our Web site. In addition, you hereby release us and any parent, subsidiary or affiliated entities, our officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at our Web site. You hereby agree to waive all laws that may limit the efficacy of such releases.

DISCLAIMER
THE MATERIALS AND SERVICES ON OUR WEB SITE ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. WE DO NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT THIS WEB SITE OR THE SERVER(S) THAT MAKES OUR WEB SITE AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT OUR SITE, SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. WE DO NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF OUR COMPETITIONS, AND WE DISCLAIM ANY RESPONSIBILITY FOR REDUCED PERFORMANCE IN COMPETITIONS DUE TO SUCH PROBLEMS. WE DO NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF OUR WEB SITE WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.

Documents, graphics and other materials appearing at our Web site may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk.

LIMITATION OF LIABILITY
TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE THIS WEB SITE, (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, THIS WEB SITE, (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER.
 
CHOICE OF LAW AND FORUM
This agreement is governed by the laws of the Commonwealth of Massachusetts. You hereby agree to submit to the exclusive jurisdiction of the courts of the Commonwealth of Massachusetts. To the extent that applicable laws have mandatory application to this agreement or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of this Web site and participation in projects posted on this Web site are unauthorized in any jurisdiction that does not give full effect to all provisions of these Terms. 

SEVERABILITY AND ENFORCEABILITY
If any provision or portion of these Terms is held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Terms. 

TERMINATION/EXCLUSION
We reserve the right, in our sole discretion, to revoke any and all privileges associated with accessing and/or participating in the projects posted on our Web site, and to take any other action we deem appropriate including but not limited to terminating or suspending your use of www.topcoder.com and/or www.topcodersoftware.com for no reason or any reason whatsoever, including improper use of this site or failure to comply with these Terms. 

GENERAL
We may assign, novate or subcontract any or all of our rights and obligations under these terms and conditions at any time. 

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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_dev_right"/>        
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

