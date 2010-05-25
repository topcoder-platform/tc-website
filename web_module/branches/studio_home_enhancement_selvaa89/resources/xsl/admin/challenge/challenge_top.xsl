<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>


<xsl:template name="RegSpacers">
  <tr>
    <td>
      <img src="/images/spacer.gif" alt="" width="619" height="1" border="0"/>
    </td>
  </tr>
</xsl:template>


      <!--function doFilter(id) {
    document.frmResults.filter.value = id;
    document.frmResults.Task.value = 'challenge';
    if(document.frmResults.constraintid.value == '1')
    {
        document.frmResults.Command.value = 'getChallengeList';
    } else if(document.frmResults.constraintid.value == '2')  {
        document.frmResults.Command.value = 'getProblemChallengeList';
    } else if(document.frmResults.constraintid.value == '3')  {
        document.frmResults.Command.value = 'getCoderChallengeList';
    }
    document.frmResults.submit();
  }


-->
<xsl:template name="ChallengeAllInactive">
    <font face="arial, verdana, helvetica, sans-serif" size="1" >
      <a href="JavaScript:doFilter(2)">All Challenges </a>
      <xsl:attribute name="HREF">/admin?overturn=<xsl:value-of select="ChallengeId"/>&amp;Task=challenge&amp;Command=overturnChallenge&amp;constraintid=<xsl:value-of select="/TC/CONSTRAINTID"/>&amp;results=<xsl:value-of select="/TC/CHALLENGE/Challenge/RoundId"/>&amp;roundid=<xsl:value-of select="/TC/CHALLENGE/Challenge/RoundId"/>&amp;roomid=<xsl:value-of select="/TC/CHALLENGE/Challenge/Contest/RoomId"/></xsl:attribute>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="ChallengeAllActive">
  <font face="arial, verdana, helvetica, sans-serif" size="1" >All Challenges </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SuccessfulChallengeInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" >
      <a href="JavaScript:doFilter(1)">Successful Challenges </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="SuccessfulChallengeActive">
<img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
  <font face="arial, verdana, helvetica, sans-serif" size="1" >Successful Challenges </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="UnsuccessfulChallengesInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" >
      <a href="JavaScript:doFilter(0)">Unsuccessful Challenges </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="UnsuccessfulChallengesActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1">Unsuccessful Challenges </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="NullifiedChallengesInactive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" >
      <a href="JavaScript:doFilter(92)">Nullified Challenges </a>
    </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


<xsl:template name="NullifiedChallengesActive">
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
    <font face="arial, verdana, helvetica, sans-serif" size="1" >Nullified Challenges </font>
  <img src="/images/spacer.gif" alt="" width="2" height="1" border="0"/>
</xsl:template>


</xsl:stylesheet>

