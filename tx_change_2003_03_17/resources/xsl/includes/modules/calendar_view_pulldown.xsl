<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar_view_pulldown">
  <BR/><BR/>
<DIV ALIGN="right"><form name="selectform">
<!--<select name="quickstat" size="1" class="dropdown" onchange="goTo(this)">-->
<select name="quickstat" size="1" class="dropdown" onchange="window.location='/index?t=schedule&amp;c='+this.options[this.selectedIndex].value">
              <OPTION value="SELECTED">Choose Monthly View</OPTION>
             <!-- <OPTION>2002:</OPTION>           
              <OPTION Value="#">January</OPTION>              
              <OPTION>&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;&#151;</OPTION>  -->
              <OPTION VALUE="jan_03">--- 2003 ---</OPTION>
              <OPTION VALUE="jan_03">January</OPTION>
              <OPTION VALUE="feb_03">February</OPTION>              
              <OPTION VALUE="mar_03">March</OPTION>
              <OPTION VALUE="apr_03">April</OPTION> 
              <OPTION VALUE="may_03">May</OPTION>
              <OPTION VALUE=""></OPTION>                           
              <OPTION VALUE="jan_02">--- 2002 ---</OPTION>              
              <OPTION VALUE="jan_02">January</OPTION>                            
              <OPTION VALUE="feb_02">February</OPTION>
              <OPTION VALUE="mar_02">March</OPTION>
              <OPTION VALUE="apr_02">April</OPTION>
              <OPTION VALUE="may_02">May</OPTION>
              <OPTION VALUE="june_02">June</OPTION>
              <OPTION VALUE="july_02">July</OPTION>
              <OPTION VALUE="aug_02">August</OPTION>
              <OPTION VALUE="sept_02">September</OPTION>
              <OPTION VALUE="oct_02">October</OPTION>
              <OPTION VALUE="nov_02">November</OPTION>
              <OPTION VALUE="dec_02">December</OPTION>                                                                                  
<!--              <OPTION VALUE="dec_02">December</OPTION> -->
</select>
</form></DIV>
  </xsl:template>
</xsl:stylesheet>
