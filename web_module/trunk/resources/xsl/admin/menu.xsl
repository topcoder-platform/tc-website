<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<xsl:template name="Menu">
  <br/>
  <STYLE TYPE="text/css"><![CDATA[
  <!--
    li { text-decoration: none; font-size:10px; font-weight:normal }
   -->
  ]]></STYLE>
  <table>
    <tr>
      <td><img src="/i/spacer.gif" width="175" height="1"/></td>
      <td><img src="/i/spacer.gif" width="175" height="1"/></td>
      <td><img src="/i/spacer.gif" width="175" height="1"/></td>
      <td><img src="/i/spacer.gif" width="175" height="1"/></td>
    </tr>
    <tr>
      <td>
        <u>Coder&#160;&#160;</u> 
      </td>
      <td>
        <u>Util</u> 
      </td>
      <td></td>
    </tr>
    <tr> 
      <td valign="top">
        <ul>
          <li><a href="/admin?Task=contest&amp;Command=getContestMenuScreen">Contests</a></li>
          <li><a href="/admin?Task=problems&amp;Command=getProblemInfo">Problems</a></li>
          <li><a href="/admin?Task=challenge&amp;Command=getRoundMenu">Challenge</a></li>
          <li><a href="/admin?Task=systemtestcasereport&amp;Command=getRoundMenu">System Test Case Report</a></li>
          <li>News</li>
          <li><a href="/admin?Task=test&amp;Command=getRoundMenu">Test1</a></li>
          <li><a href="/admin?Task=compilation&amp;Command=get_rounds">Compilation</a></li>
        </ul>
      </td>
      <td valign="top">
        <ul>
          <li><a href="/admin?Task=request">Requests</a></li>
          <li>
            Cache
            <ul>
              <li><a href="/admin?Task=cache&amp;args=xsl">XSL</a></li>
              <li><a href="/admin?Task=cache&amp;args=data">DataCache</a></li>
              <li><a href="/admin?Task=cache&amp;args=xsl&amp;args=data">Both</a></li>
            </ul>
          </li>
          <li><a href="/admin?Task=contact_mail&amp;Command=getEmailList">Contact Mail</a></li>
        </ul>
      </td>
    </tr>
  </table>
  <br/>
  <br/>
</xsl:template>


</xsl:stylesheet>
