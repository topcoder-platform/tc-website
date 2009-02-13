<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="quick_stats_pulldown">
    <tr><form name="selectform"><td class="quickstatText">
        <select name="quickstat" size="1" class="dropdown" onchange="goTo(this)">
        <OPTION value="SELECTED"> Select a Stat: </OPTION>
        <OPTION value="alltimewin">&#160;All-Time Wins</OPTION>
        <OPTION value="winningdebuts">&#160;Winning Debuts</OPTION>
        <OPTION value="impressivedebuts">&#160;Impressive Debuts</OPTION>
        <OPTION value="hightesttotal">&#160;Highest Total</OPTION>
        <OPTION value="ratingpointgain">&#160;Rating Point Gain</OPTION>	
        <OPTION value="consecwins">&#160;Consecutive Wins</OPTION>
        <OPTION value="submissionaccuracy">&#160;Submission Accuracy</OPTION>
        <OPTION value="challengesuccess">&#160;Challenge Success</OPTION>
      </select>
        </td></form></tr>
  </xsl:template>
</xsl:stylesheet>
