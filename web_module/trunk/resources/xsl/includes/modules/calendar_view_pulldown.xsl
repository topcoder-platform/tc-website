<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="calendar_view_pulldown">
            <select name="quickstat" size="1" class="dropdown" onchange="window.location='/index?t=schedule&amp;c='+this.options[this.selectedIndex].value">
              <option value="" selected="selected">Choose Monthly View</option>
              <option value="jan_05">--- 2005 ---</option>
              <option value="jul_05">July</option>
              <option value="jun_05">June</option> 
              <option value="may_05">May</option> 
              <option value="apr_05">April</option> 
              <option value="mar_05">March</option>              
              <option value="feb_05">February</option>              
              <option value="jan_05">January</option>
              <option value="index">--- 2004 ---</option>
              <option value="dec_04">December</option>                                                                                  
              <option value="nov_04">November</option>
              <option value="oct_04">October</option>
              <option value="sep_04">September</option>
              <option value="aug_04">August</option>
              <option value=""></option>                           
            </select>
  </xsl:template>
</xsl:stylesheet>
