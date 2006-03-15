<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="demography.xsl"/>

  <xsl:template name="Tourney">

  <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" align="center" colspan="3">
          <b>
            AFFIDAVIT OF ELIGIBILITY<br/>
            and<br/>
            LIABILITY AND PUBLIC RELEASE<br/>
          </b>
      </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" align="center" colspan="3">
          <b><xsl:value-of select="/TC/Affidavit/ContestName"/></b>
      </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/><br/></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I, <xsl:value-of select="/TC/Affidavit/FirstName"/>&#160;<xsl:value-of select="/TC/Affidavit/LastName"/>,
hereby state: I am at least 18 years of age.  I am matriculated full-time at <xsl:value-of select="/TC/Affidavit/CurrentSchool"/>, which is an accredited U.S. college or university.  My date of birth is ________________.
      </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I am submitting this affidavit with the understanding that it will be relied upon to determine my eligibility to receive the prize for which my entry has been submitted in the <xsl:value-of select="/TC/Affidavit/ContestName"/> (the &quot;Contest&quot;).
      </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I hereby represent that I am 18 years of age or older, that I am matriculated full-time at an accredited U.S. college or university, and that I have complied with, and will continue to comply with, all the rules and regulations of this Contest and that I have perpetrated no fraud or deception in entering the Contest or in claiming any prize that may be awarded to me.  I hereby represent further that my performance in the Contest is a result of my efforts alone and all ideas for code or challenges submitted by me during the course of the Contest were mine alone.
      </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
Further, I represent that the following information contained in TopCoder's member database represents my personal, identifying information, and that such information is true, accurate and comprehensive:
      </td>
    </tr>
<xsl:call-template name="Demog"/>
    <tr>
      <td class="bodyText" colspan="3"><hr /></td>
    </tr>
   
    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I also represent that neither I nor any member of my immediate family or anyone living in my household are employees of TopCoder Inc. ("TopCoder") or Sun Microsystems, Inc., or those involved in the development, production (including prize suppliers), implementation or distribution of the Contest or their advertising, marketing, public relations and promotion agencies (the "Sponsors"), or any of their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest, and that neither I nor any immediate family member or anyone living in my household is connected with any of the above.
      </td>
    </tr>
 
    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I understand that neither TopCoder, the Sponsors nor their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest will be responsible for any costs (including, without limitation, any federal, state or local taxes) I may incur in connection with this Contest or any prize I may be awarded, including the applicable taxes associated with the benefit of a guest of my choice attending the Contest.  However, I understand that TopCoder may make withholdings from any prize that I may be awarded in order to comply with applicable tax laws.  I agree to sign any applicable forms necessary to distribute the prize as required by tax authorities.
      </td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I hereby authorize TopCoder and the Sponsors to publicize the Contest results, including my handle or name.  I hereby grant to TopCoder and the Sponsors the absolute right and permission to use my name, address (city and state), testimonial statement (or statements in different words which have substantially the same meaning), voice, photograph and/or other likeness in any and all advertising and promotional materials, or to refrain from doing so, in any manner or media whatsoever, worldwide, for advertising and promotional purposes in conjunction with this and similar Contests without notice to me and without further compensation.  I shall have no right of approval, no claim to any compensation, and no claim arising out of the use, alteration, distortion or illusionary effect or use in any composite form of my name, address, testimonial statement, voice, photograph or likeness.
      </td>
    </tr>

    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
If I am contacted by a third-party regarding employment opportunities and/or media interest as a result of my participation in the contest, I agree to promptly notify TopCoder of such contact.
      </td>
    </tr>


    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I understand that all photographs of me taken by TopCoder are owned by TopCoder and TopCoder may copyright material containing such photographs.
      </td>
    </tr>

    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I understand that I retain any rights to ownership in any materials posted, uploaded or otherwise sent to TopCoder or its Web site; TopCoder will not gain ownership rights to this material.  I also understand that by posting, uploading or otherwise sending any source code to TopCoder or its Web site, I grant (or warrant that the owner of such rights has expressly granted) to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such code into any form, medium or technology. With respect to any other material posted, uploaded or otherwise sent, I grant (or warrant that the owner of such rights has expressly granted) TopCoder the same license as pertains to source code with the additional license to modify, adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any form, medium or technology.
      </td>
    </tr>

    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I understand and acknowledge and hereby waive and release any and all rights, demands, losses, liabilities, claims and causes of action whatsoever which I 
may now or hereafter be entitled to assert, including, but not limited to, any death, injury, loss of enjoyment or other harm or loss of any nature whatsoever caused by, contributed to, or arising out of any prize awarded to me in this Contest.  I understand that neither TopCoder nor the Sponsors will obtain insurance on my behalf, and I am fully responsible for obtaining my own insurance, should I desire it.
      </td>
    </tr>

    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
I understand that I will be disqualified from receiving and agree to return to TopCoder any prize which may be awarded to me if any statement made by me in
 this affidavit is false and I agree to return immediately upon demand to TopCoder any prize, or at the election of TopCoder the value of such prize, which
 has been or may have been awarded to me if any statement made by me in this affidavit is false.  I state further that I have read the above publicity and 
liability release prior to its execution, and that I fully understand its contents.
      </td>
    </tr>

    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
It is understood and agreed that this is a complete RELEASE and DISCHARGE of all claims and rights of the undersigned against TopCoder and the Sponsors
 and that no action will be taken by or on behalf of the undersigned with respect to any such rights, it being understood that this release shall be binding upon the heirs, executors, and administrators of the undersigned.
      </td>
    </tr>

    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">


        <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">

          <tr>
            <td class="bodyText">_____________________________</td>
            <td class="bodyText">Name:</td>
            <td class="bodyText">_____________________________</td>
          </tr>
          <tr>
            <td class="bodyText">(Signature of <xsl:value-of select="/TC/Affidavit/FirstName"/>&#160;<xsl:value-of select="/TC/Affidavit/LastName"/>)</td>
            <td class="bodyText"></td>
            <td class="bodyText">(Please print)</td>
          </tr>
          <tr>
            <td class="bodyText" colspan="3">
              
                <br/><br/>* Note: this affidavit only requires notarization if you have never had a TopCoder affidavit notarized in the past.
<br/><br/>
              
            </td>
          </tr>

        </table>

        <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
          <tr>
            <td class="bodyText" width="187" valign="top">
              
              <p>STATE OF</p>
              
            </td>
            <td class="bodyText" width="120" valign="top">
              
              <p>)</p>
              
            </td>
            <td class="bodyText" width="331" valign="top">
              
              <p>&#160;</p>
              
            </td>
          </tr>
          <tr>
            <td class="bodyText" width="187" valign="top">
              
              <p>&#160;</p>
              
            </td>
            <td class="bodyText" width="120" valign="top">
              
              <p>)</p>
              
            </td>
            <td class="bodyText" width="331" valign="top">
              
              <p>ss.:</p>
              
            </td>
         </tr>
         <tr>
           <td class="bodyText" width="187" valign="top">
             
             <p>COUNTY OF</p>
              
           </td>
           <td class="bodyText" width="120" valign="top">
             
             <p>)</p>
              
           </td>
           <td class="bodyText" width="331" valign="top">
             
             <p>&#160;</p>
              
           </td>
         </tr>
       </table>


      </td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
On this ___ day of ________, 2002, before me, __________________, (notary name) personally appeared ________________________________ (name of contestant) to me personally known, who, being by me duly sworn, did depose and say that he/she signed the foregoing instrument and he/she acknowledged the same to be his/her free act and deed.
      </td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3">
        <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
          <tr>
           <td class="bodyText" width="187" valign="top"/>
           <td class="bodyText" width="120" valign="top"/>
           <td class="bodyText" width="331" valign="top">
_____________________________<br/>
NOTARY PUBLIC
           </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



  </xsl:template>
</xsl:stylesheet>
