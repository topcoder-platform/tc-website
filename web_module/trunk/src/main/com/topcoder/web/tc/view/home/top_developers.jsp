<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<% ResultSetContainer coders = (ResultSetContainer)request.getAttribute("top_developers");%>

<table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr valign="middle">
        <td class="statTextBig" width="1%" nowrap="0">&#160;Top 10 Developers</td>
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
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">mathgodleo</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1955</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">2&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextBlue">TangentZ</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1928</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">3&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextRed">adic</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1819</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">4&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextYellow">aksonov</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1626</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">5&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">Altrag</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1571</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">6&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextRed">WishingBone</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1364</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">7&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">mishagam</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1304</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">8&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextRed">haha</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1291</td>
    </tr>
    <tr>
        <td align="right" class="formHandleOdd">9&#160;&#160;&#160;</td>
        <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="#" class="coderTextYellow">argolite</a></td>
        <td align="right" class="formHandleOdd" nowrap="nowrap">1152</td>
    </tr>
    <tr>
        <td align="right" class="formHandleEven">10&#160;&#160;&#160;</td>
        <td align="left" class="formHandleEven" nowrap="nowrap"><a href="#" class="coderTextYellow">pzhao</a></td>
        <td align="right" class="formHandleEven" nowrap="nowrap">1122</td>
    </tr>
</table>