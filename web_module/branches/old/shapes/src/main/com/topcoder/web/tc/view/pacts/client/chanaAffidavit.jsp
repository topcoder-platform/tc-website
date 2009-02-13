<?xml version="1.0"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
      <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
      <tr><td class="statText" align="center" colspan="3"><b>Statutory Declaration</b><br/></td></tr>
      <tr><td class="statText" width="1" colspan="3"><br/></td>
      </tr><tr>
      <td class="statText" align="center" colspan="3"><b><xsl:value-of select="/TC/Affidavit/round"/></b></td></tr>
      <tr><td class="statText" width="1" colspan="3"><br/><br/></td></tr>
      <tr><td class="statText" colspan="3"> I <xsl:value-of select="/TC/Affidavit/first_name"/>&#160;<xsl:value-of select="/TC/Affidavit/last_name"/>,&#160;of&#160;<xsl:value-of select="/TC/Affidavit/address1"/>&#160;,&#160;<xsl:if test="/TC/Affidavit/address2!=''"><xsl:value-of select="/TC/Affidavit/address2"/>&#160;,&#160;</xsl:if><xsl:value-of select="/TC/Affidavit/city"/>,&#160;<xsl:if test="/TC/Affidavit/state_code!='ZZ'">&#160;<xsl:value-of select="/TC/Affidavit/state_name"/>,</xsl:if>&#160;<xsl:value-of select="/TC/Affidavit/zip"/>,&#160;<xsl:value-of select="/TC/Affidavit/country_name"/>&#160;do solemnly and sincerely declare as follows:</td></tr>
      <tr><td class="statText" >
        1.	I am at least 18 years of age.<br/><br/>
        2.	My date of birth is <xsl:choose><xsl:when test="/TC/Affidavit/date_of_birth!=''"><xsl:value-of select="/TC/Affidavit/date_of_birth"/>       </xsl:when>  <xsl:when test="/TC/Affidavit/date_of_birth=''">______________________</xsl:when> </xsl:choose>.<br/><br/>
        3.	My home telephone number is <xsl:value-of select="/TC/Affidavit/home_phone"/>.<br/><br/>
        4.	I reside at <xsl:value-of select="/TC/Affidavit/address1"/>&#160;,&#160;<xsl:if test="/TC/Affidavit/address2!=''"><xsl:value-of select="/TC/Affidavit/address2"/>&#160;,&#160;</xsl:if><xsl:value-of select="/TC/Affidavit/city"/>,&#160;<xsl:if test="/TC/Affidavit/state_name!=''">&#160;<xsl:value-of select="/TC/Affidavit/state_name"/>,</xsl:if>&#160;<xsl:value-of select="/TC/Affidavit/zip"/>,&#160;<xsl:value-of select="/TC/Affidavit/country_name"/>.<br/><br/>
        5.	I am submitting this statutory declaration with the understanding that it will be relied upon to determine my eligibility to receive the prize for which my entry has been submitted in the <xsl:value-of select="/TC/Affidavit/round"/>(the "Contest").<br/><br/>
        6.	I hereby represent that I am 18 years of age or older and have complied with, and will continue to comply with all the rules and regulations of this Contest and that I have perpetrated no fraud or deception in entering the Contest or in claiming any prize that may be awarded to me.  I hereby represent further that my performance in the Contest is a result of my efforts alone and all ideas for code or challenges submitted by me during the course of the Contest were mine alone.<br/><br/>
        7.	Further, I represent that the following information contained in TopCoder's member database represents my personal demographic information, and that such information is true and accurate:<br/><br/>
        <!--  begin demog -->
        <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
          <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
          <tr><td class="statText" valign="top" colspan="3"><b>General Information</b></td></tr>
          <tr><td class="statText" valign="top" colspan="3"></td></tr>
            <tr><td class="statText" valign="top">First Name:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/first_name"/></td></tr>
            <tr><td class="statText" valign="top">Middle Name:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/middle_name"/></td></tr>
            <tr><td class="statText" valign="top">Last Name:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/last_name"/></td></tr>
            <tr><td class="statText" valign="top">EMail Address:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/email"/></td></tr>
            <tr><td class="statText" valign="top">Handle:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/handle"/></td></tr>
            <tr><td class="statText" valign="top">Street Address:</td><td class="statText" valign="top" colspan="3"><xsl:value-of select="/TC/Affidavit/address1"/><br/><xsl:if test="/TC/Affidavit/address2!=''"><xsl:value-of select="/TC/Affidavit/address2"/><br/></xsl:if><xsl:value-of select="/TC/Affidavit/city"/>,&#160;<xsl:if test="/TC/Affidavit/state_name!=''">&#160;<xsl:value-of select="/TC/Affidavit/state_name"/></xsl:if>&#160;<xsl:value-of select="/TC/Affidavit/zip"/><br/><xsl:value-of select="/TC/Affidavit/country_name"/></td></tr>
            <tr><td class="statText" valign="top">Home Phone:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/home_phone"/></td></tr>
            <tr><td class="statText" valign="top">Work Phone:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/work_phone"/></td></tr>
            <tr><td class="statText" valign="top">Student or Professional:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/coder_type_desc"/></td></tr>
            <xsl:if test="/TC/Affidavit/coder_type_desc='Student'">
               <tr><td class="statText" valign="top">School:</td><td class="statText" valign="top"><!-- xsl:value-of select="/TC/Affidavit/current_school"/ --></td></tr>
            </xsl:if>
          </table>
          <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
          <tr><td class="statText" colspan="3"><br/></td></tr>
          <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
          <tr><td class="statText" valign="top" colspan="3"><b>Demographics</b>       </td>     </tr>
          <tr><td class="statText" valign="top" colspan="3">
          <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
            <xsl:for-each select="/TC/Affidavit/demographic_assignment">
              <tr><td class="statText" align="left"><xsl:value-of select="demographic_question" />:</td><td class="statText" align="left"><xsl:value-of select="demographic_answer" /></td></tr>
            </xsl:for-each>
          </table>
          </td></tr>
        <tr><td class="statText" valign="top" colspan="3"><br/>8.	I also represent that neither I nor any member of my immediate family or anyone living in my household are employees of TopCoder or those involved in the development, production (including prize suppliers), implementation or distribution of the Contest or their advertising, marketing, public relations and promotion agencies (the "Sponsors"), or any of their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest, and that neither I nor any immediate family member or anyone living in my household is connected with any of the above.<br/><br/>
        9.	I understand that neither TopCoder, the Sponsors nor their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest will be responsible for any costs (including, without limitation, any federal, state or local taxes) I may incur in connection with this Contest or any prize I may be awarded, including the applicable taxes associated with the benefit of a guest of my choice attending the Contest. However, I understand that TopCoder may withhold from any prize that may be awarded in order to comply with applicable tax laws.  I agree to sign any applicable forms necessary to distribute the prize as required by tax authorities.<br/><br/>
        10.	I hereby authorise TopCoder and the Sponsors to publicise the Contest results, including my handle or name.  I hereby grant to TopCoder and the Sponsors the absolute right and permission to use my name, address (city and state), testimonial statement (or statements in different words which have substantially the same meaning), voice, photograph and/or other likeness in any and all advertising and promotional materials, or to refrain from doing so, in any manner or media whatsoever, worldwide, for advertising and promotional purposes in conjunction with this and similar Contests without notice to me and without further compensation.  I shall have no right of approval, no claim to any compensation, and no claim arising out of the use, alteration, distortion or illusionary effect or use in any composite form of my name, address, testimonial statement, voice, photograph or likeness.<br/><br/>
        11.	I understand that all photographs of me taken by TopCoder are owned by TopCoder and TopCoder may copyright material containing such photographs.<br/><br/>
        12.	I understand that I retain any rights to ownership in any materials posted, uploaded or otherwise sent to TopCoder or its Web site by me; TopCoder will not gain ownership rights to this material.  I also understand that by posting, uploading or otherwise sending any source code to TopCoder or its Web site, I grant (or warrant that the owner of such rights has expressly granted) to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce, publish and communicate to the public such code into any form, medium or technology.  With respect to any other material posted, uploaded or otherwise sent, I grant (or warrant that the owner of such rights has expressly granted) TopCoder the same license as pertains to source code with the additional license to modify, adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any form, medium or technology.<br/><br/>
        13. I understand and acknowledge and hereby waive and release any and all rights, demands, losses, liabilities, claims and causes of action whatsoever, to the fullest extent permissible pursuant to applicable law, which I may now or hereafter be entitled to assert, including, but not limited to any death, injury (unless caused by TopCoder’s gross negligence), loss of enjoyment or other harm or loss of any nature whatsoever caused by, contributed to, or arising out of any prize awarded to me in this Contest.  I understand that neither TopCoder nor the Sponsors will obtain insurance on my behalf, and I am fully responsible for obtaining my own insurance, should I desire it.<br/><br/>
        14.	I understand that I will be disqualified from receiving and agree to return to TopCoder any prize which may be awarded to me if any statement made by me in this affidavit is false and I agree to return immediately upon demand to TopCoder any prize, or at the election of TopCoder the value of such prize, which has been or may have been awarded to me if any statement made by me in this statutory declaration is false.  I state further that I have read the above publicity and liability release prior to its execution, and that I fully understand its contents.<br/><br/>
        15.	It is understood and agreed that this is a complete RELEASE and DISCHARGE of all claims and rights of the undersigned against TopCoder and the Sponsors (except as expressly provided above) and that no action will be taken by or on behalf of the undersigned with respect to any such rights, it being understood that this release shall be binding upon the heirs, executors, and administrators of the undersigned.<br/><br/>
        16.	The undersigned hereby agrees that this Statutory Declaration shall be governed by the laws of the Commonwealth of Massachusetts and that the courts of the Commonwealth of Massachusetts shall have the exclusive jurisdiction over any and all claims, disputes and legal actions arising from or in connection with this Statutory Declaration.<br/><br/>
     <br/>
     And I make this solemn declaration conscientiously believing the statements contained in this declaration to be true.
     <br/><br/>
     </td></tr>

    <tr><td class="statText" valign="top" colspan="3"><br/>
    <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
      <tr><td class="statText" width="256" valign="top">         Declared before me at the __________________________________ this ____ day of ________________ 20__ before me:     </td><td class="statText" width="296" colspan="2" valign="top">       )<br/>)<br/>)     </td>   </tr>
      <tr><td class="statText" width="256" height="40" valign="bottom">       __________________________________     </td>     <td class="statText" width="40">     </td>     <td class="statText" width="256" height="40" valign="bottom">       __________________________________     </td>   </tr>
      <tr>     <td class="statText" width="256" valign="top">       Signature<br/>       Public Notary     </td>     <td class="statText" width="40">     </td>     <td class="statText" width="256" valign="top">       Signature     </td>   </tr>    <tr>     <td class="statText" width="256" height="40" valign="bottom">       __________________________________     </td>     <td class="statText" width="40">     </td>     <td class="statText" width="256" height="40" valign="bottom">       __________________________________     </td>   </tr>     <tr>     <td class="statText" width="256" valign="top">       Print Name     </td>     <td class="statText" width="40">     </td>     <td class="statText" width="256" valign="top">       Print Name     </td>   </tr>
    </table>
    </td></tr>
 </td></tr>

    </table>
   </xsl:template>
   </xsl:stylesheet>

