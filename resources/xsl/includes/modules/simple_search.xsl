<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="simple_search">
            <table border="0" cellspacing="0" cellpadding="0" width="180">
                <tr><td class="moduleTitle" bgcolor="#990000" height="23"><img src="/i/header_member_search.gif" alt="Member Search" width="180" height="23" border="0" /></td></tr>            
            </table>

            <table border="0" cellspacing="0" cellpadding="1" width="180" bgcolor="#990000">
                <tr valign="middle"><form name="simpleSearchForm" method="get" action="/tc">
                    <td class="data" width="2"><img src="/i/clear.gif" width="2" height="1" border="0"/></td>
                    <td class="statTextBig">
                        <input type="hidden" name="module" value="SimpleSearch" />
                        <input type="text" name="hn" value="Handle:" size="12" maxlength="15" onFocus="javascript: if (document.simpleSearchForm.hn.value=='Handle:') document.simpleSearchForm.hn.value = '';" onBlur="javascript: if (document.simpleSearchForm.hn.value == '') document.simpleSearchForm.hn.value = 'Handle:';" />
                    </td>
                    <td class="statTextBig"><A href="javascript:void document.simpleSearchForm.submit();"><img src="/i/button_go_member_search.gif" alt="Go" width="24" height="18" vspace="3" border="0" /></A></td>
                    <td width="99%"><img src="/i/clear.gif" alt="" width="5" height="5" border="0" /></td>
                    </form>
                </tr>

                <tr><td class="statTextBig" colspan="3"><img src="/i/clear.gif" width="5" height="5" border="0"/><br />&#160;&#160;<A href="/tc?module=ViewAdvanced" class="statText">&gt; Advanced Search</A></td></tr>
            </table>
                          
            <table border="0" cellspacing="0" cellpadding="0" width="180">
                <tr><td background="/i/member_search_bottom.gif" bgcolor="#CC0000" height="11"><img src="/i/clear.gif" alt="" width="10" height="11" border="0" /></td></tr>            
            </table>

  </xsl:template>
</xsl:stylesheet>

