<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="BodyLeft">
  <!-- Global Seconday Nav Ends -->
  <xsl:choose>
    <xsl:when test="/TC/LoggedIn='true'">
      <!-- Logged In Left -->
    </xsl:when>
    <xsl:otherwise>
      <!-- Logged Out Left -->
      <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top">
        <TR>
          <TD BGCOLOR="#999999" VALIGN="top">
            <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="2" VALIGN="top">
              <TR>
                <TD VALIGN="absmiddle" CLASS="moduleTitle" BGCOLOR="#666666">&#160;[ More Features ]</TD>
              </TR>
              <TR><TD VALIGN="top" BGCOLOR="#FFFFFF" CLASS="subNav">&#160;:: <A HREF="about_topcoder_benefits.html" CLASS="subNav">[TC] Employment</A></TD></TR>
              <TR><TD VALIGN="top" BGCOLOR="#FFFFFF" CLASS="subNav">&#160;:: <A HREF="about_membership_recruiting.html" CLASS="subNav">[TC] Software</A></TD></TR>
              <TR><TD VALIGN="top" BGCOLOR="#FFFFFF" CLASS="subNav">&#160;:: <A HREF="about_membership_recruiting.html" CLASS="subNav">Registration</A></TD></TR>
              <TR><TD VALIGN="top" BGCOLOR="#FFFFFF" CLASS="subNav">&#160;:: <A HREF="about_topcoder_founder.html" CLASS="subNav">Round Tables</A></TD></TR>
              <TR><TD VALIGN="top" BGCOLOR="#FFFFFF" CLASS="subNav">&#160;:: <A HREF="about_membership_statistics.html" CLASS="subNav">Schedule</A></TD></TR>
              <TR BGCOLOR="#FFFFFF">
                <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
      </TABLE>
      <!-- Logged Out Left -->
    </xsl:otherwise>
  </xsl:choose>
  <!-- Global Seconday Nav Ends -->
</xsl:template>

</xsl:stylesheet>



