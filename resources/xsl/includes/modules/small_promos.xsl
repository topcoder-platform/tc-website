<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="small_promos">

<SCRIPT LANGUAGE="JavaScript"><![CDATA[
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
		var words = navigator.plugins["Shockwave Flash"].description.split(" ");
	    for (var i = 0; i < words.length; ++i)
	    {
		if (isNaN(parseInt(words[i])))
		continue;
		var MM_PluginVersion = words[i];
	    }
	MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
}
else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
   && (navigator.appVersion.indexOf("Win") != -1)) {
	document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n'); //FS hide this from IE4.5 Mac by splitting the tag
	document.write('on error resume next \n');
	document.write('MM_FlashCanPlay = ( IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
	document.write('</SCR' + 'IPT\> \n');
}
//-->
]]></SCRIPT>

            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="42" align="center">

                <SCRIPT language="JavaScript"><![CDATA[
                <!--
                     if (MM_FlashCanPlay){
                             document.write('<object type="application/x-shockwave-flash" data="/i/promos/software_dev_promo.swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="170" height=120 border="0" salign="Top" id="myFlash" >');
                             document.write('<PARAM NAME=movie VALUE="/i/promos/software_dev_promo.swf?currentTotal=<rsc:item row="<%=info%>" name="amount" format="0.00"/>">');
                             document.write('<PARAM NAME=quality VALUE="high">');
                             document.write('<PARAM NAME=bgcolor VALUE="#FFFFFF">');
                             document.write('<embed src="/i/promos/software_dev_promo.swf?currentTotal=<rsc:item row="<%=info%>" name="amount" format="0.00"/>&flashContentURL=flash_content/flash_content.html&altContentURL=upgrade_flash/upgrade_flash.html&contentVersion=6&contentMajorRevision=0&contentMinorRevision=79&allowFlashAutoInstall=false" quality=high width=170 height=120 border="0" salign="Top" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" name="myFlash" swLiveConnect="true" ></embed>');
                             document.write('</object>');
                     }
                     // -->
                  ]]></SCRIPT>

                            <SCRIPT LANGUAGE="JavaScript"><![CDATA[
                            <!--
                            if (!MM_FlashCanPlay){
                               document.write('<A href="/?&amp;t=development&amp;c=index" target="_top"><IMG src="/i/promos/development_promo_third.gif" width="170" height="120" border="0" alt="Earn cash while using your skills." /></A>');
                            }
                            // -->
                            ]]></SCRIPT>

                    </td>
                    <td width="10"><IMG src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="42" align="center"><A href="/tc?module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_overview"  target="_top"><IMG src="/i/promos/crpf_promo_third.gif" alt="crpf starts november 11" width="170" height="120" border="0"/></A></td>
                    <td width="10"><IMG src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="42" align="center"><A href="/pl/?&amp;module=Static&amp;d1=google&amp;d2=google_highlights"  target="_blank"><img src="/i/promos/google_promo_third.gif" alt="Google Code Jam 2003" width="170" height="120" border="0" /></A></td>
                </tr>
            </table>

  </xsl:template>
</xsl:stylesheet>
