<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--This template provides a textarea control for entering Comments | Questions-->
<xsl:template name="commentInput">
		<TEXTAREA NAME="Comment" Rows="5" COLS="60">
		</TEXTAREA>
</xsl:template>

<!--This template provides a text control for entering email-->
<xsl:template name="emailInput">
		<INPUT TYPE="Text" NAME="Email" SIZE="35" MAXLENGTH="40">
      <xsl:attribute name="VALUE"><xsl:value-of select="/TC/CONTACTMAIL/Email"/></xsl:attribute>
		</INPUT>
</xsl:template>

<!--This template provides a text control for entering email-->
<xsl:template name="otherInput">
		<INPUT TYPE="Text" NAME="Other" SIZE="35" MAXLENGTH="40">
		</INPUT>
</xsl:template>

<!--This template provides a subjectInput control for ContactMail-->
<xsl:template name="subjectInput">
    <SELECT NAME="Subject" SIZE="1">
      <xsl:for-each select="/TC/CONTACTMAIL/Subjects/ContactSubjects">
        <OPTION>
          <xsl:attribute name="VALUE"><xsl:value-of select="ContactSubjectId"/></xsl:attribute>
          <xsl:if test="/TC/CONTACTMAIL/ContactSubjectId=ContactSubjectId">
            <xsl:attribute name="SELECTED"/>
          </xsl:if>
          <xsl:value-of select="SubjectDesc"/>
        </OPTION>
      </xsl:for-each>
    </SELECT>
</xsl:template>
</xsl:stylesheet>
