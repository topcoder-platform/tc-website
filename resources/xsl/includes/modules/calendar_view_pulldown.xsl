<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar_view_pulldown">
            <select name="quickstat" size="1" class="dropdown" onchange="window.location='/index?t=schedule&amp;c='+this.options[this.selectedIndex].value">
              <option value="" selected="selected">Choose Monthly View</option>
              <option value="">--- 2004 ---</option>
              <option value="apr_04">April</option> 
              <option value="mar_04">March</option>
              <option value="feb_04">February</option>              
              <option value="jan_04">January</option>
              <option value="">--- 2003 ---</option>
              <option value="dec_03">December</option>                                                                                  
              <option value="nov_03">November</option>
              <option value="oct_03">October</option>
              <option value="sep_03">September</option>
              <option value="aug_03">August</option>
              <option value="jul_03">July</option>
              <option value="jun_03">June</option>
              <option value="may_03">May</option>
              <option value="apr_03">April</option> 
              <option value=""></option>                           
            </select>
  </xsl:template>
</xsl:stylesheet>
