<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>AFFIDAVIT OF ELIGIBILITY/LIABILITY &amp; PUBLICITY RELEASE</TITLE>
 </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<div STYLE="width: 700px; margin: 15px 15px 15px 15px">
<xsl:choose>
<xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='United States'">
  <P>

  <CENTER>
  AFFIDAVIT OF ELIGIBILITY<BR/>
  and<BR/>
  LIABILITY AND PUBLICITY RELEASE<BR/>
  <BR/>
  <BR/>
  2004 TopCoder Collegiate Challenge, sponsored by Yahoo!&#174;<BR/>
  Coding Tournament<BR/>
  <BR/>
  <BR/>
  </CENTER>
  I, <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/>, residing at
  &#160;
  <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address1"/>&#160;
  <xsl:if test="/TC/AFFIDAVIT/Affidavit/Info/address2!=''">
    <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address2"/>&#160;
  </xsl:if>
  <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/city"/>,
  <xsl:if test="/TC/AFFIDAVIT/Affidavit/Info/state_code!='ZZ'">
    <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/state_code"/>&#160;
  </xsl:if>
  <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/zip"/>&#160;
  <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/country_name"/>
  &#160;hereby state:  I am at least 18 years of age.  I am matriculated full-time at <xsl:value-of select="/TC/AFFIDAVIT/Member/Profile/school_name"/>, which is an accredited
      college or university.  My date of birth is _________________________.
      <BR/><BR/>
    I am submitting this affidavit with the understanding that it will be relied upon to determine my eligibility to
    receive the prize for which my entry has been submitted in the 2004 TopCoder Collegiate Challenge Algorithm
    Competition (the "Contest").
      <BR/><BR/>
    I hereby represent that I have complied with, and will continue to comply with, all the rules and regulations
      of this Contest and that I have perpetrated no fraud or deception in entering the Contest or in claiming any
      prize that may be awarded to me. I hereby represent further that my performance in the Contest is a result
      of my efforts alone and all ideas for code or challenges submitted by me during the course of the Contest
      were mine alone.
      <BR/><BR/>
    Further, I represent that the following information contained in TopCoder's member database represents my
      personal, identifying information, and that such information is true, accurate and comprehensive:

  <BR/>

  <HR/>
  Demographic Information<BR/>
  <BR/>

  <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD>
        Coder Type
      </TD>
      <TD>
        &#160;&#160;<xsl:value-of select="/TC/AFFIDAVIT/Member/Profile/coder_type_desc"/>
      </TD>
    </TR>
  <xsl:for-each select="/TC/AFFIDAVIT/Demographics/Demographic">
    <TR>
      <TD>
        <xsl:value-of select="demographic_question_text"/>
      </TD>
      <TD>
        &#160;&#160;<xsl:value-of select="demographic_answer_text"/><BR/>
      </TD>
    </TR>
  </xsl:for-each>
  </TABLE>

  <HR/>

  <BR/>
      I also represent that neither I nor any member of my immediate family, nor anyone living in my household, is an employee of TopCoder, Inc. ("TopCoder") or any entity that is involved in the development, production (including prize suppliers), implementation or distribution of the Contest or their advertising, marketing, public relations and promotion agencies (the "Sponsors"), or any of their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest, and that neither I nor any immediate family member nor anyone living in my household is connected with any of the above.
      <BR/>
       <BR/>
      I understand that neither TopCoder, the Sponsors nor their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest will be responsible for any costs (including, without limitation, any federal, state or local taxes) I may incur in connection with this Contest or any prize I may be awarded. However, I understand that TopCoder may make withholdings from any prize that I may be awarded in order to comply with applicable tax laws. I agree to sign any applicable forms necessary to distribute the prize as required by tax authorities.
      <BR/>
       <BR/>
      I hereby authorize TopCoder and the Sponsors to publicize the Contest results, including my handle or name. I hereby grant to TopCoder and the Sponsors the absolute right and permission to use my name, address (city and state), testimonial statement (or statements in different words which have substantially the same meaning), voice, photograph and/or other likeness in any and all advertising and promotional materials, or to refrain from doing so, in any manner or media whatsoever, worldwide, for advertising and promotional purposes in conjunction with this and similar Contests without notice to me and without further compensation. I shall have no right of approval, no claim to any compensation, and no claim arising out of the use, alteration, distortion or illusionary effect or use in any composite form of my name, address, testimonial statement, voice, photograph or likeness.
      <BR/>
       <BR/>
      I understand that TopCoder owns all photographs of me taken by TopCoder and TopCoder may copyright material containing such photographs.
      <BR/>
       <BR/>
      I hereby agree that if I am contacted by a third-party regarding employment opportunities and/or media interest as a result of my participation in the Contest, I will promptly notify TopCoder of such contact and will cooperate with TopCoder's efforts to reach the contacting party.  Furthermore, I represent that no third-party exclusively represents me regarding employment opportunities.
      <BR/>
       <BR/>
      I understand that I retain any rights to ownership in any materials posted, uploaded or otherwise sent to TopCoder or its Web site; TopCoder will not gain ownership rights to this material. I also understand that by posting, uploading or otherwise sending any source code to TopCoder or its Web site, I grant (or warrant that the owner of such rights has expressly granted) to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such code into any form, medium or technology. With respect to any other material posted, uploaded or otherwise sent, I grant (or warrant that the owner of such rights has expressly granted) TopCoder the same license as pertains to source code with the additional license to modify, adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any form, medium or technology.
      <BR/>
       <BR/>
      I understand and acknowledge and hereby waive and release any and all rights, demands, losses, liabilities, claims and causes of action whatsoever which I may now or hereafter be entitled to assert, including, but not limited to, any death, injury, loss of enjoyment or other harm or loss of any nature whatsoever caused by, contributed to, or arising out of any prize awarded to me in this Contest. I understand that neither TopCoder nor the Sponsors will obtain insurance on my behalf, and I am fully responsible for obtaining my own insurance, should I desire it.
      <BR/>
       <BR/>
      I understand that I will be disqualified from receiving and agree to return to TopCoder any prize which may be awarded to me if any statement made by me in this affidavit is false and I agree to return immediately upon demand to TopCoder any prize, or at the election of TopCoder the value of such prize, which has been or may have been awarded to me if any statement made by me in this affidavit is false. I state further that I have read the above publicity and liability release prior to its execution, and that I fully understand its contents.
      <BR/>
       <BR/>
      It is understood and agreed that this is a complete RELEASE and DISCHARGE of all claims and rights of the undersigned against TopCoder and the Sponsors and that no action will be taken by or on behalf of the undersigned with respect to any such rights, it being understood that this release shall be binding upon the heirs, executors, and administrators of the undersigned.
  <BR/>
   <BR/>
  <BR/>
  <TABLE>
    <TR>
      <TD>_____________________________</TD>
    </TR>
    <TR>
      <TD>(Signature of <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/>)</TD>
    </TR>
  </TABLE>

  <xsl:if test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    <BR/>
    STATE OF&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;)
    <BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;)
    &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ss.:
    <BR/>
    COUNTY OF&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;)
    <BR/>
    <BR/>
    On this ___ day of ________, 2004, before me, ____________________, (notary name) personally appeared ____________________ (name of contestant) to me personally known, who, being by me duly sworn, did depose and say that he/she signed the foregoing instrument and he/she acknowledged the same to be his/her free act and deed.
    <BR/>
    <BR/>
    <BR/>


    <TABLE WIDTH="80%">
      <TR>
        <TD ALIGN="right">
          _____________________________
        </TD>
      </TR>
      <TR>
        <TD ALIGN="right">
          NOTARY PUBLIC&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
        </TD>
      </TR>
    </TABLE>
  </xsl:if>

  </P>

</xsl:when>
<xsl:otherwise>

<P>

<xsl:choose>
    <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='India'">'
        <center>
            [TO BE EXECUTED ON A STAMP PAPER OF TWENTY FIVE RUPEES]<br/><br/>
            AFFIDAVIT OF ELIGIBILITY AND LIABILITY AND PUBLICITY RELEASE<br/>
            <BR/>
            <BR/>
            2004 TopCoder Collegiate Challenge, sponsored by Yahoo!&#174;<BR/>
            Coding Tournament<BR/>
            <BR/>
            <BR/>
        </center>
        <BR/>
        <BR/>
            I, <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/>, aged ___ [insert age],
            son/daughter of _____________ [insert father's name], residing
            at <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address1"/>&#160;
            <xsl:if test="/TC/AFFIDAVIT/Affidavit/Info/address2!=''">
              <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address2"/>&#160;
            </xsl:if>
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/city"/>,
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/zip"/>&#160;
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/country_name"/> do hereby solemnly affirm and state
            as follows:
    </xsl:when>
    <xsl:otherwise>
        <CENTER>
        STATUTORY DECLARATION<BR/>
        <BR/>
        <BR/>
          2004 TopCoder Collegiate Challenge, sponsored by Yahoo!&#174;<BR/>
          Coding Tournament<BR/>
        <BR/>
        <BR/>
        </CENTER>
        <BR/>
        <BR/>
        I, <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/>, residing at
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address1"/>&#160;
            <xsl:if test="/TC/AFFIDAVIT/Affidavit/Info/address2!=''">
              <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address2"/>&#160;
            </xsl:if>
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/city"/>,
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/zip"/>&#160;
            <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/country_name"/>
        , do solemnly and sincerely declare as follows:
    </xsl:otherwise>
</xsl:choose>
<BR/>
<BR/>
<BR/>
<OL>
  <LI>I am at least 18 years of age.</LI>
  <LI>My date of birth is ___________.</LI>
  <LI>My home telephone number is <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/home_phone"/>.</LI>
  <LI>I reside at
    <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address1"/>&#160;
    <xsl:if test="/TC/AFFIDAVIT/Affidavit/Info/address2!=''">
      <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/address2"/>&#160;
    </xsl:if>
    <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/city"/>,
    <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/zip"/>&#160;
    <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/country_name"/>.
  </LI>
    <LI>
    I am matriculated full-time at
      <xsl:value-of select="/TC/AFFIDAVIT/Member/Profile/school_name"/>, which is an accredited college or university.
    </LI>
  <LI>I am submitting this statutory declaration with the understanding that it will be relied upon to determine my eligibility to receive the prize for which my entry has been submitted in the 2004 TopCoder Collegiate Challenge, sponsored by Yahoo!&#174; Coding Tournament (the "Contest").</LI>
  <LI>I hereby represent that I am 18 years of age or older, and I have complied with, and will continue to comply with, all the rules and regulations of this Contest and that I have perpetrated no fraud or deception in entering the Contest or in claiming any prize that may be awarded to me.  I hereby represent further that my performance in the Contest is a result of my efforts alone and all ideas for code or challenges submitted by me during the course of the Contest were mine alone.</LI>
  <LI>Further, I represent that the following information contained in TopCoder's member database represents my personal, identifying information, and that such information is true, accurate and comprehensive:</LI>
  <HR/>
  Demographic Information<BR/>
  <BR/>

  <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD>
        Coder Type
      </TD>
      <TD>
        &#160;&#160;<xsl:value-of select="/TC/AFFIDAVIT/Member/Profile/coder_type_desc"/>
      </TD>
    </TR>
    <xsl:if test="/TC/AFFIDAVIT/Member/Profile/coder_type_desc='Student'">
      <TR>
        <TD>
          School
        </TD>
        <TD>
          &#160;&#160;<xsl:value-of select="/TC/AFFIDAVIT/Member/Profile/school_name"/>
        </TD>
      </TR>
    </xsl:if>
  <xsl:for-each select="/TC/AFFIDAVIT/Demographics/Demographic">
    <TR>
      <TD>
        <xsl:value-of select="demographic_question_text"/>
      </TD>
      <TD>
        &#160;&#160;<xsl:value-of select="demographic_answer_text"/><BR/>
      </TD>
    </TR>
  </xsl:for-each>
  </TABLE>

  <HR/>
    <LI>I also represent that neither I nor any member of my immediate family, nor anyone living in my household, is an employee of TopCoder, Inc. ("TopCoder") or any entity that is involved in the development, production (including prize suppliers), implementation or distribution of the Contest or their advertising, marketing, public relations and promotion agencies (the "Sponsors"), or any of their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest, and that neither I nor any immediate family member nor anyone living in my household is connected with any of the above.</LI>
    <LI>I understand that neither TopCoder, the Sponsors nor their parent corporations, subsidiaries, affiliates, agents, assigns, etc. or any entity connected with this Contest will be responsible for any costs (including, without limitation, any federal, state or local taxes) I may incur in connection with this Contest or any prize I may be awarded. However, I understand that TopCoder may make withholdings from any prize that I may be awarded in order to comply with applicable tax laws. I agree to sign any applicable forms necessary to distribute the prize as required by tax authorities.</LI>
    <LI>I hereby authorize TopCoder and the Sponsors to publicize the Contest results, including my handle or name. I hereby grant to TopCoder and the Sponsors the absolute right and permission to use my name, address (city and state), testimonial statement (or statements in different words which have substantially the same meaning), voice, photograph and/or other likeness in any and all advertising and promotional materials, or to refrain from doing so, in any manner or media whatsoever, worldwide, for advertising and promotional purposes in conjunction with this and similar Contests without notice to me and without further compensation. I shall have no right of approval, no claim to any compensation, and no claim arising out of the use, alteration, distortion or illusionary effect or use in any composite form of my name, address, testimonial statement, voice, photograph or likeness.</LI>
    <LI>I understand that TopCoder owns all photographs of me taken by TopCoder and TopCoder may copyright material containing such photographs.</LI>
    <LI>I hereby agree that if I am contacted by a third-party regarding employment opportunities and/or media interest as a result of my participation in the Contest, I will promptly notify TopCoder of such contact and will cooperate with TopCoder's efforts to reach the contacting party.  Furthermore, I represent that no third-party exclusively represents me regarding employment opportunities.</LI>
    <LI>I understand that I retain any rights to ownership in any materials posted, uploaded or otherwise sent to TopCoder or its Web site; TopCoder will not gain ownership rights to this material. I also understand that by posting, uploading or otherwise sending any source code to TopCoder or its Web site, I grant (or warrant that the owner of such rights has expressly granted) to TopCoder a perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such code into any form, medium or technology. With respect to any other material posted, uploaded or otherwise sent, I grant (or warrant that the owner of such rights has expressly granted) TopCoder the same license as pertains to source code with the additional license to modify, adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any form, medium or technology.</LI>
    <LI>I understand and acknowledge and hereby waive and release any and all rights, demands, losses, liabilities, claims and causes of action whatsoever which I may now or hereafter be entitled to assert, including, but not limited to, any death, injury, loss of enjoyment or other harm or loss of any nature whatsoever caused by, contributed to, or arising out of any prize awarded to me in this Contest. I understand that neither TopCoder nor the Sponsors will obtain insurance on my behalf, and I am fully responsible for obtaining my own insurance, should I desire it.</LI>
    <LI>I understand that I will be disqualified from receiving and agree to return to TopCoder any prize which may be awarded to me if any statement made by me in this affidavit is false and I agree to return immediately upon demand to TopCoder any prize, or at the election of TopCoder the value of such prize, which has been or may have been awarded to me if any statement made by me in this affidavit is false. I state further that I have read the above publicity and liability release prior to its execution, and that I fully understand its contents.</LI>
    <LI>It is understood and agreed that this is a complete RELEASE and DISCHARGE of all claims and rights of the undersigned against TopCoder and the Sponsors and that no action will be taken by or on behalf of the undersigned with respect to any such rights, it being understood that this release shall be binding upon the heirs, executors, and administrators of the undersigned.</LI>
  </OL>
  <BR/>



<xsl:choose>
<xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='China'">
  And I make this solemn declaration conscientiously believing the statements contained in this declaration to be true.
  <BR/>
  <BR/>
  <xsl:choose>
  <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
    <TABLE WIDTH="500" BORDER="0">
      <TR>
        <TD>Declared before me at the _______________  this ___________ day of _____________ 2004 before me:</TD>
        <TD>)<BR/>)<BR/>)<BR/></TD>
        <TD></TD>
      </TR>
      <TR>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Public Notary<BR/><BR/>__________________________________<BR/>Print Name</TD>
        <TD></TD>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
      </TR>
    </TABLE>
  </xsl:when>
  <xsl:otherwise>
    <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:when>
<xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='Australia'">
  And I make this solemn declaration by virtue of the Statutory Declarations Act 1959, and subject to the penalties provided by that Act for the making of false statements in statutory declarations, conscientiously believing the statements contained in this declaration to be true in every particular.
  <BR/>
  <BR/>
  <xsl:choose>
  <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
    <TABLE WIDTH="500" BORDER="0">
      <TR>
        <TD>Declared before me at the _______________  this ___________ day of _____________ 2004 before me:</TD>
        <TD>)<BR/>)<BR/>)<BR/></TD>
        <TD></TD>
      </TR>
      <TR>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Solicitor/Justice of the Peace<BR/><BR/>__________________________________<BR/>Print Name</TD>
        <TD></TD>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
      </TR>
    </TABLE>
  </xsl:when>
  <xsl:otherwise>
    <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:when>
<xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='Canada'">
  And I make this solemn declaration conscientiously believing the statements contained in this declaration to be true in every particular, and knowing that it is of the same force and effect as if made under oath.
  <BR/>
  <BR/>
  <xsl:choose>
  <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
    <TABLE WIDTH="500" BORDER="0">
      <TR>
        <TD>Declared before me at the _______________  this ___________ day of _____________ 2004 before me:</TD>
        <TD>)<BR/>)<BR/>)<BR/></TD>
        <TD></TD>
      </TR>
      <TR>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Commissioner for Taking Affidavits / Oaths <BR/><BR/>__________________________________<BR/>Print Name</TD>
        <TD></TD>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
      </TR>
    </TABLE>
  </xsl:when>
  <xsl:otherwise>
    <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:when>
<xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='Sweden'">
  And I make this solemn declaration conscientiously believing the statements contained in this declaration to be true.
  <BR/>
  <BR/>
  <xsl:choose>
  <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
    <TABLE WIDTH="500" BORDER="0">
      <TR>
        <TD>Declared before me at the _______________  this ___________ day of _____________ 2004 before me:</TD>
        <TD>)<BR/>)<BR/>)<BR/></TD>
        <TD></TD>
      </TR>
      <TR>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Notaris Publicus <BR/><BR/>__________________________________<BR/>Print Name</TD>
        <TD></TD>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
      </TR>
    </TABLE>
  </xsl:when>
  <xsl:otherwise>
    <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:when>
    <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='New Zealand'">
      And I make this solemn declaration conscientiously believing the same to be true and by virtue of the Oaths and Declarations Act 1957.
      <BR/>
      <BR/>
      <xsl:choose>
      <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
        <TABLE WIDTH="500" BORDER="0">
          <TR>
            <TD>Declared before me at the _______________  this ___________ day of _____________ 20__    before me:</TD>
            <TD>)<BR/>)<BR/>)<BR/></TD>
            <TD></TD>
          </TR>
          <TR>
            <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Solicitor/Justice of the Peace <BR/><BR/>__________________________________<BR/>Print Name</TD>
            <TD></TD>
            <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
          </TR>
        </TABLE>
      </xsl:when>
      <xsl:otherwise>
        <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
      </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/country_name='India'">
      All that is stated above is true to the best of my knowledge, information and belief.
      <BR/>
      <BR/>
      <xsl:choose>
      <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
        <TABLE WIDTH="500" BORDER="0">
          <TR>
            <TD>Declared before me at the _______________  this ___________ day of _____________ 20__    before me:</TD>
            <TD>)<BR/>)<BR/>)<BR/></TD>
            <TD></TD>
          </TR>
          <TR>
            <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Notary <BR/><BR/>__________________________________<BR/>Print Name</TD>
            <TD></TD>
            <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
          </TR>
        </TABLE>
      </xsl:when>
      <xsl:otherwise>
        <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
      </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
<xsl:otherwise>
  And I make this solemn declaration conscientiously believing the statements contained in this declaration to be true.
  <BR/>
  <BR/>
  <xsl:choose>
  <xsl:when test="/TC/AFFIDAVIT/Affidavit/Info/has_notarized_affidavit=0">
    <TABLE WIDTH="500" BORDER="0">
      <TR>
        <TD>Declared before me at the _______________  this ___________ day of _____________ 2004 before me:</TD>
        <TD>)<BR/>)<BR/>)<BR/></TD>
        <TD></TD>
      </TR>
      <TR>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: Notary Public (or its equivalent) <BR/><BR/>__________________________________<BR/>Print Name</TD>
        <TD></TD>
        <TD VALIGN="top"><BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/></TD>
      </TR>
    </TABLE>
  </xsl:when>
  <xsl:otherwise>
    <BR/>__________________________________<BR/>Signature: <xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/>&#160;<xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/><BR/>
  </xsl:otherwise>
  </xsl:choose>

  </xsl:otherwise>
</xsl:choose>

</P>

</xsl:otherwise>
</xsl:choose>

</div>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
