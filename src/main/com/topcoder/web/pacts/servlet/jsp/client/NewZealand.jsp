<?xml version="1.0"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
    <tr><td class="statText" align="center" colspan="3"><b>Statutory Declaration<br/><xsl:value-of select="/TC/Affidavit/round"/><br/></b></td></tr>
    <tr><td class="statText" valign="top" colspan="3">
        I, <xsl:value-of select="/TC/Affidavit/first_name"/>&#160;<xsl:value-of select="/TC/Affidavit/last_name"/>, of
       <xsl:value-of select="/TC/Affidavit/country_name"/>, do solemnly and sincerely declare as follows:
    </td></tr>
    <tr><td class="statText" valign="top" colspan="3">
     <ol>
     <tr><td class="statText" valign="top" colspan="3">
       <li>I am at least 18 years of age.</li>
       <li>My date of birth is <xsl:choose><xsl:when test="/TC/Affidavit/date_of_birth!=''"><xsl:value-of select="/TC/Affidavit/date_of_birth"/></xsl:when><xsl:when test="/TC/Affidavit/date_of_birth=''">______________________</xsl:when></xsl:choose>.</li>
       <li>My home telephone number is <xsl:value-of select="/TC/Affidavit/home_phone"/>.</li>
       <li>I reside at <xsl:value-of select="/TC/Affidavit/address1"/>&#160;,&#160;
          <xsl:if test="/TC/Affidavit/address2!=''"><xsl:value-of select="/TC/Affidavit/address2"/>&#160;,&#160;</xsl:if>
          <xsl:value-of select="/TC/Affidavit/city"/>,&#160;
          <xsl:if test="/TC/Affidavit/state_code!='ZZ'">&#160;<xsl:value-of select="/TC/Affidavit/state_name"/>,&#160;</xsl:if>
          <xsl:value-of select="/TC/Affidavit/zip"/>,&#160;
          <xsl:value-of select="/TC/Affidavit/country_name"/>.</li>
       <li>I am submitting this statutory declaration with the understanding that it will be relied upon to determine my eligibility to receive the prize for which my entry has been submitted in <xsl:value-of select="/TC/Affidavit/round"/> (the &quot;Contest&quot;).</li>
       <li>I hereby represent that I am 18 years of age or older and have complied with, and will continue to comply with all the rules and regulations of this Contest and that I have perpetrated no fraud or deception in entering the Contest or in claiming any prize that may be awarded to me.  I hereby represent fur ther that my performance in the Contest is a result of my efforts alone and all ideas for code or challenges submitted by me during the course of the Conte st were mine alone.</li>
       <li>Further, I represent that the following information contained in TopCoder's member database represents my personal demographic information, and that such information is true and accurate:</li>
       </td></tr>
         <tr><td class="statText" valign="top" colspan="3">
           <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">  <!--  begin demog -->
             <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
             <tr><td class="statText" valign="top" colspan="3"><b>General Information</b></td></tr>
             <tr><td class="statText" valign="top">First Name:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/first_name"/></td></tr>
             <tr><td class="statText" valign="top">Last Name:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/last_name"/></td></tr>
             <tr><td class="statText" valign="top">EMail Address:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/email"/></td></tr>
             <tr><td class="statText" valign="top">Handle:</td> <td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/handle"/></td></tr>
             <tr><td class="statText" valign="top">Street Address:</td>
               <td class="statText" valign="top" colspan="3"><xsl:value-of select="/TC/Affidavit/address1"/><br/>
                 <xsl:if test="/TC/Affidavit/address2!=''"><xsl:value-of select="/TC/Affidavit/address2"/><br/></xsl:if>
                 <xsl:value-of select="/TC/Affidavit/city"/>,
                 <xsl:if test="/TC/Affidavit/state_code!='ZZ'">&#160;<xsl:value-of select="/TC/Affidavit/state_name"/></xsl:if>&#160;
                 <xsl:value-of select="/TC/Affidavit/zip"/><br/>
                 <xsl:value-of select="/TC/Affidavit/country_name"/>
               </td>
             </tr>
             <tr><td class="statText" valign="top">Home Phone:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/home_phone"/></td></tr>
             <tr><td class="statText" valign="top">Student or Professional:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/coder_type_desc"/></td></tr>
             <xsl:if test="/TC/Affidavit/coder_type_desc='Student'">
               <tr><td class="statText" valign="top">School:</td><td class="statText" valign="top"><xsl:value-of select="/TC/Affidavit/current_school"/></td></tr>
             </xsl:if>
            </table>
          </td></tr>
          <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
          <tr><td class="statText" colspan="3"><hr/></td></tr>
          <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
          <tr><td class="statText" valign="top" colspan="3"><b>Demographics</b></td></tr>
          <tr><td class="statText" valign="top" colspan="3">
            <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
                 <xsl:for-each select="/TC/Affidavit/demographic_assignment">
                   <tr><td class="statText" align="left"><xsl:value-of select="demographic_question" />:&#160;</td>
                       <td class="statText" align="left"><xsl:value-of select="demographic_answer" /></td></tr>
                 </xsl:for-each >
            </table>
          </td></tr>
          <tr><td class="statText" width="1" colspan="3"><br/></td></tr>
           <!--  this is where demog ends  -->
         <tr><td class="statText" valign="top" colspan="3">
           <li>I also represent that neither I nor any member of my immediate family or anyone living in my household are employees of TopCoder or those involved in t he development, production (including prize suppliers), implementation or distribution of the Contest or their advertising, marketing, public relations and  promotion agencies (the &quot;Sponsors&quot;), or any of their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connecte d with this Contest, and that neither I nor any immediate family member or anyone living in my household is connected with any of the above.</li>
           <li>I understand that neither TopCoder, the Sponsors nor their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected  with this Contest will be responsible for any costs (including, without limitation, any federal, state or local taxes) I may incur in connection with this  Contest or any prize I may be awarded, including the applicable taxes associated with the benefit of a guest of my choice attending the Contest.  However,  I understand that TopCoder may withhold from any prize that may be awarded in order to comply with applicable tax laws.  I agree to sign any applicable fo rms necessary to distribute the prize as required by tax authorities.</li>
           <li>I hereby authorise TopCoder and the Sponsors to publicise the Contest results, including my handle or name.  I hereby grant to TopCoder and the Sponsors the absolute right and permission to use my name, address (city and state), testimonial statement (or statements in different words which have substantia lly the same meaning), voice, photograph and/or other likeness in any and all advertising and promotional materials, or to refrain from doing so, in any ma nner or media whatsoever, worldwide, for advertising and promotional purposes in conjunction with this and similar Contests without notice to me and withou t further compensation.  I shall have no right of approval, no claim to any compensation, and no claim arising out of the use, alteration, distortion or il lusionary effect or use in any composite form of my name, address, testimonial statement, voice, photograph or likeness.</li>
           <li>I understand that all photographs of me taken by TopCoder are owned by TopCoder and TopCoder may copyright material containing such photographs.</li>
           <li>I understand that I retain any rights to ownership in any materials posted, uploaded or otherwise sent to TopCoder or its Web site; TopCoder will not gain ownership rights to this material.  I also understand that by posting, uploading or otherwise sending any source code to TopCoder or its Web site, I gr ant (or warrant that the owner of such rights has expressly granted) to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to  use, reproduce, publish and communicate to the public such code into any form, medium or technology.  With respect to any other material posted, uploaded  or otherwise sent, I grant (or warrant that the owner of such rights has expressly granted) TopCoder the same license as pertains to source code with the a dditional license to modify, adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any form, med ium or technology.</li>
           <li>I understand and acknowledge and hereby waive and release any and all rights, demands, losses, liabilities, claims and causes of action whatsoever whic h I may now or hereafter be entitled to assert, including, but not limited to any death, injury, loss of enjoyment or other harm or loss of any nature what soever caused by, contributed to, or arising out of any prize awarded to me in this Contest.  I understand that neither TopCoder nor the Sponsors will obta in insurance on my behalf, and I am fully responsible for obtaining my own insurance, should I desire it.</li>
           <li>I understand that I will be disqualified from receiving and agree to return to TopCoder any prize which may be awarded to me if any statement made by m e in this affidavit is false and I agree to return immediately upon demand to TopCoder any prize, or at the election of TopCoder the value of such prize, w hich has been or may have been awarded to me if any statement made by me in this statutory declaration is false.  I state further that I have read the abov e publicity and liability release prior to its execution, and that I fully understand its contents.</li>
           <li>It is understood and agreed that this is a complete RELEASE and DISCHARGE of all claims and rights of the undersigned against TopCoder and the Sponsors  and that no action will be taken by or on behalf of the undersigned with respect to any such rights, it being understood that this release shall be bindin g upon the heirs, executors, and administrators of the undersigned.</li>
         </td></tr>
         </ol>
         </td></tr>
         <tr><td class="statText" valign="top" colspan="3">
           <xsl:choose>
             <xsl:when test="/TC/Affidavit/country_name='Australia'">And I make this solemn declaration by virtue of the Statutory Declarations Act 1959, and subject to the penalties provided by that Act for the making of fa lse statements in statutory declarations, conscientiously believing the statements contained in this declaration to be true in every particular. <br/><br/></xsl:when>
             <xsl:when test="/TC/Affidavit/country_name='United Kingdom'">And I make this solemn declaration conscientiously believing the statements contained in this declaration to be true and by virtue of the Statutory Declara tions Act 1835. <br/><br/>   </xsl:when>
             <xsl:when test="/TC/Affidavit/country_name='New Zealand'">And I make this solemn declaration conscientiously believing the same to be true and by virtue of the Oaths and Declarations Act 1957. <br/><br/>   </xsl:when>
           </xsl:choose>
         </td></tr>
       <tr><td class="statText" width="256" valign="top">
         <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
           <tr><td class="statText" width="256" valign="top">Declared before me at the __________________________________ this ____ day of ________________ 20__ before me:</td>
               <td class="statText" width="296" colspan="2" valign="top">       )<br/>)<br/>)     </td>
           </tr>
           <tr><td class="statText" width="256" height="40" valign="bottom">__________________________________</td><td class="statText" width="40"></td><td class="statText" width="256" height="40" valign="bottom">__________________________________</td></tr>
             <tr>
               <td class="statText" width="256" valign="top">Signature<br/>
                 <xsl:choose>
                   <xsl:when test="/TC/Affidavit/HomeCountry='Australia'">Solicitor/Justice of the Peace</xsl:when>
                   <xsl:when test="/TC/Affidavit/HomeCountry='United Kingdom'">Commissioner for Taking Oaths/Solicitor</xsl:when>
                 </xsl:choose>
               </td>
               <td class="statText" width="40"></td>
               <td class="statText" width="256" valign="top">Signature<br/>
                 <xsl:if test="/TC/Affidavit/HomeCountry='United Kingdom'">TopCoder member</xsl:if>
               </td>
             </tr>
             <tr>
               <td class="statText" width="256" height="40" valign="bottom">__________________________________</td>
               <td class="statText" width="40"></td>
               <td class="statText" width="256" height="40" valign="bottom">__________________________________</td>
             </tr>
             <tr>
               <td class="statText" width="256" valign="top">Print Name</td>
               <td class="statText" width="40"></td>
               <td class="statText" width="256" valign="top">Print Name</td>
             </tr>
           </table>
       </td></tr>
     </table>
   </xsl:template>
   </xsl:stylesheet>

