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
    <html>

<head>
        <xsl:call-template name="Preload"/>      
<title>Inquire about the <xsl:value-of select="/TC/DEVELOPMENT/Project"/> project at TopCoder Software Development</title>
        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <TD WIDTH="180" valign="top">
            <xsl:call-template name="global_left"/>
        </TD>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">development</xsl:with-param>
                <xsl:with-param name="title">&#160;Inquiry</xsl:with-param>
            </xsl:call-template>

            <img src="/i/clear.gif" alt="" width="240" height="20" border="0"/><br/>
            
                <form name="frmSend" method="POST" action="/?t=development">
                <input type="hidden" name="t" value="development"/>
                <input type="hidden" name="c" value="tcs_send"/>
              
                <input type="hidden" name="comp">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/comp"/></xsl:attribute>
                </input>
              
                <input type="hidden" name="phase">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/phase"/></xsl:attribute>
                </input>
              
                <input type="hidden" name="version">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/version"/></xsl:attribute>
                </input>
              
                <input type="hidden" name="date">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/date"/></xsl:attribute>
                </input>
              
                <input type="hidden" name="Project">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/Project"/></xsl:attribute>
                </input>
              
                <input type="hidden" name="handle">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/handle"/></xsl:attribute>
                </input>
              
                <input type="hidden" name="To">
                    <xsl:attribute name="VALUE">service@topcodersoftware.com</xsl:attribute>
                </input>
            
                <h2><xsl:value-of select="/TC/DEVELOPMENT/ProjectName"/></h2>
               
               <img src="/i/clear.gif" alt="" width="10" height="3" border="0"/><br/>
                Terms &amp; Conditions<br/>
                <img src="/i/clear.gif" alt="" width="10" height="3" border="0"/><br/>
                <textarea name="TermDesc" rows="10" cols="60" readonly="true" class="bodyText" wrap="VIRTUAL">
OWNERSHIP AND RIGHTS
You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property rights, in and to the information posted on the TopCoder website.  If TopCoder selects your design or development solution as a "winning" design or development solution (meaning your submissions scored in first, second or third place), you will receive a monetary award.  As consideration for your winning design or development solution and for your monetary award, you agree to irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, the winning design or development solution, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder.  If your submission is not declared a winning design or development solution and you are not compensated for your solution, you retain any and all rights to ownership of such material submitted to TopCoder.  TopCoder will not gain ownership of this material.  However, by submitting any design documents or source code to TopCoder, you hereby grant us a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such documents or source code for commercial and/or non-commercial use.  Such license shall not include the right to resell the design or development submission. 

You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely and exclusively to TopCoder from the time of their creation.  To the extent any such work of authorship may not be deemed to be a work made for hire, you agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work.

You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed by your authorized agent.

Nothing in this Agreement shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel or otherwise, except as expressly set forth herein.

If you have any questions regarding these Terms, contact us at service@topcoder.com.</textarea>

                <p>Agree to Terms <input type="checkbox" name="terms"/></p>
                
                <p>Comments<br />
                <img src="/i/clear.gif" alt="" width="10" height="3" border="0"/><br/>
                <textarea name="Comment" rows="5" cols="50"/></p>
                
                <p><br/></p>

                <p align="center"><strong><A href="Javascript:submitForm();">Submit Inquiry</A> &gt;&gt;</strong></p>
              
              <script type="text/javascript"><![CDATA[
                function submitForm() {
                  if (document.frmSend.terms.checked) {document.frmSend.submit();}
                  else {alert("Please read and agree to terms to apply for this project.");}
                  return;
                }
              ]]></script>
            
            </form>

            <p><br/></p>
            
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right"/>        
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

