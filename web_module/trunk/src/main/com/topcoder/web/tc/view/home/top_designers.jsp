<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<% ResultSetContainer coders = (ResultSetContainer)request.getAttribute("top_designers");%>

<table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr valign="middle">
        <td class="statTextBig" width="1%" nowrap="0">&#160;Designers</td>
        <td class="statTextBig" width="15"><A href="javascript:infoWindow('/tc?&amp;module=Static&amp;d1=statistics&amp;d2=info&amp;d3=topRatedCoders')" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0"/></A></td>
        <td class="statTextBig" align="right" width="99%"><a href="/stat?c=coder_ratings" class="statTextBig">View all</a>&#160;</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
    <tr valign="middle">
        <td align="center" background="/i/graybv_lite_bg.gif" class="statText" width="10%">&#160;Rank</td>
        <td align="left" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Handle</td>
        <td align="right" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Rating</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">1&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">Pops</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">2219</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">2&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextYellow">srowen</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1972</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">3&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">TangentZ</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1928</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">4&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextYellow">Tomson</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1811</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">5&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextRed">Ken Vogel</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1760</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">6&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextYellow">aksonov</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1760</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">7&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextBlue">isv</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1703</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">8&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextBlue">giginim</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1317</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">9&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">orb</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1307</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">10&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextYellow">kyky</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1217</td>
    </tr>
</table>