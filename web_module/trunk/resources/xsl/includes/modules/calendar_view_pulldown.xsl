<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar_view_pulldown">
            <div align="right"><form name="selectform">
            <select name="quickstat" size="1" class="dropdown" onchange="window.location='/index?t=schedule&amp;c='+this.options[this.selectedIndex].value">
              <option value="apr_03" selected="selected">Choose Monthly View</option>
              <option value="apr_03">--- 2003 ---</option>
              <option value="jul_03">July</option>
              <option value="jun_03">June</option>
              <option value="may_03">May</option>
              <option value="apr_03">April</option> 
              <option value="mar_03">March</option>
              <option value="feb_03">February</option>              
              <option value="jan_03">January</option>
              <option value=""></option>                           
              <option value="dec_02">--- 2002 ---</option>              
              <option value="dec_02">December</option>                                                                                  
              <option value="nov_02">November</option>
              <option value="oct_02">October</option>
              <option value="sept_02">September</option>
              <option value="aug_02">August</option>
              <option value="july_02">July</option>
            </select>
            </form></div>
  </xsl:template>
</xsl:stylesheet>
