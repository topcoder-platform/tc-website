<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>2002 Invitational Questionaire</TITLE>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<CENTER>2002 TopCoder Invitational<BR/>
<BR/>
Programmer Questionnaire</CENTER><BR/>
<BR/>
<BR/>
<BR/>
<B><U>Career Questions</U></B><BR/><BR/>
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="t" VALUE="affidavit"/>
        <INPUT TYPE="hidden" NAME="c" VALUE="submit_questions"/>
        <INPUT TYPE="hidden" NAME="q1" VALUE="What is your perception of the current job market for software developers/engineers?"/>
        &#160;&#160;1.&#160;&#160;
        What is your perception of the current job market for software developers/engineers? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a1"></TEXTAREA>
        <BR/><BR/><BR/>
        <INPUT TYPE="hidden" NAME="q2" VALUE=" What is your perception of a reasonable starting salary for a strong developer/engineer?"/>
        &#160;&#160;2.&#160;&#160;
         What is your perception of a reasonable starting salary for a strong developer/engineer? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a2"></TEXTAREA>
        <BR/><BR/><BR/>
    </FORM>

      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
