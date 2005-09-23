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

                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

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

                <form name="frmSend" method="POST" action="/">
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

				<input type="hidden" name="projectId">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/projectId"/></xsl:attribute>
                </input>

                <input type="hidden" name="To">
                    <xsl:attribute name="VALUE">service@topcodersoftware.com</xsl:attribute>
                </input>
                
                <input type="hidden" name="numSurveyQs">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/numSurveyQs"/></xsl:attribute>
                </input>

                <h2><xsl:value-of select="/TC/DEVELOPMENT/ProjectName"/></h2>

                <img src="/i/clear.gif" alt="" width="10" height="3" border="0"/><br/>
                
                Survey Questions
                <xsl:for-each select="/TC/DEVELOPMENT/Questions/Question">
	                <p>
	                <xsl:variable name="qStyleId">
	                	<xsl:value-of select="question_style_id"/>
	                </xsl:variable>
	               	<xsl:variable name="widgetType">
				    	<xsl:choose>
				    		<xsl:when test="$qStyleId = '1'">radio</xsl:when>
							<xsl:when test="$qStyleId = '2'">checkbox</xsl:when>
				   		</xsl:choose>
				   	</xsl:variable>
	               	<xsl:variable name="qId">
						<xsl:value-of select="comp_reg_question_id"/>
					</xsl:variable>
					<xsl:variable name="widgetName" select="concat('q',$qId)"/>
					
					<xsl:value-of select="question_text"/><br/>
					<xsl:for-each select="/TC/DEVELOPMENT/Answers/Answer">
						<xsl:variable name="aqId">
							<xsl:value-of select="comp_reg_question_id"/>
						</xsl:variable>
						<xsl:variable name="aId">
							<xsl:value-of select="comp_reg_answer_id"/>
						</xsl:variable>
						<xsl:variable name="widgetId" select="concat(concat($widgetName,'a'),$aId)"/>
						
						<xsl:if test="$qStyleId &lt;= '2'">
							<xsl:if test="$qId = $aqId">
								<input name="{$widgetName}" value="{$aId}" id="{$widgetId}" type="{$widgetType}"/> 
								<label for="{$widgetId}"><xsl:value-of select="answer_text"/></label><br/>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$qStyleId &gt; '2'">
							<textarea name="{$widgetName}" rows="5" cols="50"/>
						</xsl:if>
					</xsl:for-each>
	                </p>
				</xsl:for-each>
                
                <p>Terms &amp; Conditions<br/>
                <img src="/i/clear.gif" alt="" width="10" height="3" border="0"/><br/>
                <textarea name="TermDesc" rows="10" cols="60" readonly="true" class="bodyText" wrap="VIRTUAL">
ACCEPTANCE OF TERMS OF WORK

By inquiring about the opportunity to design and/or develop a software component and/or application listed on TopCoder's web site(s), you are indicating your agreement to these Terms of Work ("Terms"). If you do not agree to these Terms, please click on "I Do Not Accept These Terms" or exit the site now.

TopCoder may revise these Terms at any time without prior notice and such revisions will be effective upon posting. Please read these Terms thoroughly each time you inquire about designing and/or developing a software component and/or application as the Terms may change periodically.

DESIGN AND DEVELOPMENT TERMS
By indicating your interest in designing or developing a software component and/or application for TopCoder, you represent to TopCoder the following:
1.    You are at least 18 years of age.
2.    You are either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) a non-U.S. resident authorized to perform services as an independent contractor.
3.    You will abide by the Terms of Use of both TopCoder's and TopCoder Software's websites at www.topcoder.com and www.topcodersoftware.com, respectively.
4.    You acknowledge that you have read and agree to the TopCoder Software Application Development Methodology posted at www.topcoder.com/?&amp;t=development&amp;c=app_meth .
5.    You acknowledge that you have read and agree to the TopCoder Software Component Development Methodology posted at www.topcoder.com/?&amp;t=development&amp;c=comp_meth .
6.    You hereby agree to design and/or develop the software component and/or application in accordance with the Requirement Specification document posted with each component/application on TopCoder's website(s).
7.    No impediment exists to you participating in design and/or development projects posted on TopCoder's website(s), and your participation in such projects will not interfere with your performance of, or breach, any other agreement or obligation which has been or will be made with any third party, including but not limited to your employer (if applicable).
8.    You agree to use your own independently developed code, and shall not copy or include code from any other party, including publicly available "open source" code that is or may be subject to licensing restrictions.

OWNERSHIP AND RIGHTS
You hereby acknowledge and agree that TopCoder owns, solely and exclusively, all right, title and interest, including all intellectual property rights, in and to the information posted on TopCoder's website(s).  If TopCoder compensates you for your design or development solution, then you agree to irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest you have, may have or acquire in, such design or development solution, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder.  If TopCoder does not compensate you for your design or development solution, then you retain any and all rights to ownership of such material submitted to TopCoder.  TopCoder will not gain ownership of this material.  However, by submitting any design documents, source code or any other material to TopCoder, you hereby grant us a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such documents, materials or source code for commercial and/or non-commercial use.

You further agree that any and all works of authorship created, authored or developed by you hereunder which TopCoder compensates you for shall be deemed to be "works made for hire" within the meaning of the United States Copyright Law and, as such, all rights therein including copyright shall belong solely and exclusively to TopCoder from the time of their creation.  To the extent any such work of authorship may not be deemed to be a work made for hire, you agree to, and do hereby, irrevocably and unconditionally transfer and assign to TopCoder all right, title and interest including copyright in and to such work.

You agree that if TopCoder is unable because of your unavailability, or for any other reason, to secure your signature to apply for or to pursue any application for any United States or foreign patents, mask work, copyright or trademark registrations covering the assignments to TopCoder above, then you hereby irrevocably designate and appoint TopCoder and its duly authorized officers and agents as your agent and attorney in fact, to act for and in your behalf and stead to execute and file any such applications and to do all other lawfully permitted acts to further the prosecution and issuance of patents, copyright, mask work and trademark registrations thereon with the same legal force and effect as if executed by your authorized agent.
Nothing in this Agreement shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets), by implication, estoppel or otherwise, except as expressly set forth herein.

CONFIDENTIAL INFORMATION
You acknowledge the confidential and proprietary nature of the information you obtain from TopCoder regarding design specifications and functionality and/or development solutions, including, but not limited to, scope documents and source code.  You also acknowledge the confidential and proprietary nature of the information contained in the project postings and in the customer and developer forums on TopCoder's website(s).  You also agree (i) to hold such information in confidence and to take all reasonable precautions to protect such confidential information (including, without limitation, all precautions you may employ with respect to your own confidential materials), (ii) not to divulge any such confidential information to any third person; and (iii) not to make any use whatsoever of such confidential information except as expressly authorized in these Terms.

INDEMNIFICATION AND RELEASE
By submitting design documents and/or source code in response to projects posted on TopCoder's website(s) and/or otherwise participating in forum and newsgroup discussions on TopCoder's customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of TopCoder's website(s) and/or the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that you post on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's website(s). You hereby agree to waive all laws that may limit the efficacy of such releases.

DISCLAIMER
THE MATERIALS AND SERVICES ON TOPCODER'S WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODER'S WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODER'S WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODER'S WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.

Documents, graphics and other materials appearing at TopCoder's website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk.

LIMITATION OF LIABILITY
TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE IT'S WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, IT'S WEBSITES, (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER.

CHOICE OF LAW AND FORUM
These Terms are governed by the laws of the Commonwealth of Massachusetts. You hereby agree to submit to the exclusive jurisdiction of the courts of the Commonwealth of Massachusetts. To the extent that applicable laws have mandatory application to these Terms or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoder's website(s) and participation in projects posted on TopCoder's website(s) are unauthorized in any jurisdiction that does not give full effect to all provisions of these Terms.

SEVERABILITY AND ENFORCEABILITY
If any provision or portion of these Terms is held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Terms.

TERMINATION/EXCLUSION
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with accessing and/or participating in the projects posted on its website(s), and to take any other action it deems appropriate including but not limited to terminating or suspending your use of www.topcoder.com and/or www.topcodersoftware.com for no reason or any reason whatsoever, including improper use of its website(s) or failure to comply with these Terms or the Terms of Use of TopCoder's websites, which are incorporated herein by reference.

GENERAL
TopCoder may assign, novate or subcontract any or all of its rights and obligations under these Terms at any time.

If you have any questions regarding these Terms, contact us at service@topcodersoftware.com.

</textarea></p>

                <p>Agree to Terms <input type="checkbox" name="terms"/></p>

                <p>Comments<br />
                <img src="/i/clear.gif" alt="" width="10" height="3" border="0"/><br/>
                <textarea name="Comment" rows="5" cols="50"/></p>

                <p><br/></p>

                <p align="center"><strong><A href="Javascript:submitForm();">Submit Inquiry</A> &gt;&gt;</strong></p>

              <script type="text/javascript"><![CDATA[
              	function checkAnswers(q) {
              		var myOption = -1;
              		for (i=0; i<q.length; i++) {
						if (q[i].checked) {
							myOption = i;
              			}
              		}
              		return myOption;
              	}
              
                function submitForm() {
                  var answered=new Array();
                  for(i=0; i<document.frmSend.elements.length; i++) {
                  	if (document.frmSend.elements[i].name.charAt(0) == 'q') {
                  		if ((document.frmSend.elements[i].type == 'radio' || document.frmSend.elements[i].type == 'checkbox') &&
                  			document.frmSend.elements[i].checked) {
	                  		var found = false;
							for (int j=0; j<answered.length; j++) {
								if (answered[j] == document.frmSend.elements[i].name) found = true;
							}
							if (!found) {answered.push(document.frmSend.elements[i].name);}
						} else {answered.push(document.frmSend.elements[i].name);}
                  	}
                  }
                  if (!document.frmSend.terms.checked) 
					{alert("Please read and agree to terms to apply for this project.");}
				  else if (answered.length < document.frmSend.numSurveyQs)
				  	{alert("Please answer all survey questions.");}
			      else {alert("Submit");}
                  return;
                }
              ]]></script>

            </form>
<!--				  else {document.frmSend.submit();}-->
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

