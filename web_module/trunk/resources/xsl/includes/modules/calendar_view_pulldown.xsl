<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar_view_pulldown">
  <BR/><BR/>
<DIV ALIGN="right"><form name="selectform">
<!--<select name="quickstat" size="1" class="dropdown" onchange="goTo(this)">-->
<select name="quickstat" size="1" class="dropdown" onchange="window.location='/index?t=schedule&amp;c='+this.options[this.selectedIndex].value">
              <OPTION value="SELECTED">&#160;Choose Monthly View</OPTION>
             <!-- <OPTION>2002:</OPTION>           
              <OPTION Value="#">&#160;January</OPTION>              
              <OPTION>&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;</OPTION>  -->
              <OPTION VALUE="jan_02">&#160;January</OPTION>                            
              <OPTION VALUE="feb_02">&#160;February</OPTION>
              <OPTION VALUE="mar_02">&#160;March</OPTION>
              <OPTION VALUE="apr_02">&#160;April</OPTION>
              <OPTION VALUE="may_02">&#160;May</OPTION>
              <OPTION VALUE="june_02">&#160;June</OPTION>
              <OPTION VALUE="july_02">&#160;July</OPTION>
              <OPTION VALUE="aug_02">&#160;August</OPTION>
              <OPTION VALUE="sept_02">&#160;September</OPTION>
              <OPTION VALUE="oct_02">&#160;October</OPTION>
              <OPTION VALUE="nov_02">&#160;November</OPTION>
<!--              <OPTION VALUE="dec_02">&#160;December</OPTION> -->
</select>
</form></DIV>
  </xsl:template>
</xsl:stylesheet>


