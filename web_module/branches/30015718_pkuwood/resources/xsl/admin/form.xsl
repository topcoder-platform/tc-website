<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="NavForm">
  <SCRIPT type="text/javascript"><![CDATA[
  var dirty=false;
  function submitNav(task, command){
    if (doCheckNav()) {
      document.frmNav.Task.value=task;
      document.frmNav.Command.value=command;
      nav=window.navigator;
      document.frmNav.action = "http"+document.frmNav.formActionURL.value
      document.frmNav.target="_top";
      document.frmNav.submit();
    }
  }
  function doCheckNav(){
    var result = true
    if(dirty){
      if (!confirm("Information will NOT be saved.  Are you sure?")){result = false}
    }
    return result;
  }
  ]]></SCRIPT>
  <form name="frmNav" method="POST" action="formActionURL">
    <input type="hidden" name="formActionURL">
      <xsl:attribute name="VALUE"><xsl:value-of select="/TC/AdminURL"/></xsl:attribute>
    </input>
    <input type="hidden" name="Task" VALUE=""/>
    <input type="hidden" name="Command" VALUE=""/>
  </form>
</xsl:template>


</xsl:stylesheet>



