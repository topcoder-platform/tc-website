<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:import href="../../bottom.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:template match="/">
<html>

<head>
<title>Contact Mail Response</title>

<xsl:call-template name="CSS"/>

</head>

<SCRIPT TYPE="text/Javascript"><![CDATA[
  function doSubmit() {
   document.frmResults.rounddescription.value = document.frmResults.descriptioninput.value;
   document.frmResults.roundid.value = document.frmResults.roundidentification.value;
   for(j=0; j<frmResults.elements.length; j++) {
     if(frmResults.elements[j].name == "operationbutton") { 
       if (document.frmResults.elements[j].checked==true) {
         document.frmResults.operation.value =  document.frmResults.elements[j].value;
       }
     } else if(frmResults.elements[j].name ==  "groupbybutton") {
       if (document.frmResults.elements[j].checked==true) {
         document.frmResults.groupby.value =  document.frmResults.elements[j].value;
       }
     }
   }
   if (document.frmResults.dryrunbutton.checked) {
     document.frmResults.dryrun.value = 'true';
   } else  {
     document.frmResults.dryrun.value = 'false';
   }
   document.frmResults.submit();
  }
]]></SCRIPT>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/ADMIN/LoggedIn='true'">
          <xsl:call-template name="TopLoggedIn"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TopLoggedOut"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="619" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
  </tr> 
  <tr>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/ADMIN/LoggedIn='true'">
            <xsl:call-template name="CoderGroups_LI"/>
          </xsl:when>
        </xsl:choose>
        <tr>
          <td valign="top">
            <xsl:call-template name="LeftSideNavBarForm"/>
         </td>
        </tr>
      </table>
    </td>
    <td valign="top">
      <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
            </font>
            <FORM NAME="frmResults" METHOD="POST">
               <xsl:attribute name="ACTION">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
            <table width="619" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                  <font face="arial, verdana, helvetica, sans-serif" size="3" color="#ff0000">
                       <b>CONTEST INFORMATION</b>
                  </font>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="419" height="15" /></td>
              </tr>
              <tr>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Contest Id: </xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:value-of select="/ADMIN/CODERGROUPS/Contest/ContestId"/>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="419" height="15" /></td>
              </tr>
              <tr>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Contest Name: </xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <xsl:value-of select="/ADMIN/CODERGROUPS/Contest/ContestName"/>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="419" height="15" /></td>
              </tr>
              <tr>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Start Date: </xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="substring(/ADMIN/CODERGROUPS/Contest/ContestStart, 0, 11)"/>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="419" height="15" /></td>
              </tr>
              <tr>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>End Date: </xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="substring(/ADMIN/CODERGROUPS/Contest/ContestEnd, 0, 11)"/>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="419" height="15" /></td>
              </tr>
              <tr>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Group Id: </xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="/ADMIN/CODERGROUPS/Contest/Group/GroupId"/>
                  </font>
                </td>
              </tr>
           </table>
           <table width="619" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                       <td><img src="/images/spacer.gif" width="200" height="15" /></td>
                       <td><img src="/images/spacer.gif" width="419" height="15" /></td>
              </tr>
              <tr>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ff0000">
                    <b><xsl:text>Round Id</xsl:text></b>
                  </font>
                 </td>
                <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ff0000">
                    <b><xsl:text>Description</xsl:text></b>
                  </font>
                 </td>
             </tr>
            <xsl:comment>~~~~~~~~~  Start of Round Table  ~~~~~~~~~</xsl:comment>
            <xsl:for-each select="/ADMIN/CODERGROUPS/Contest/Round">
               <xsl:if test="/ADMIN/CODERGROUPS/Contest/ContestId=ContestId">
               <tr>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="RoundId"/>
                  </font>
                </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                     <xsl:value-of select="RoundDesc"/>
                  </font>
                </td>
               </tr>
               </xsl:if>
             </xsl:for-each>

           </table>
           <table width="600" cellpadding="0" cellspacing="0" border="0" >
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
	               <td colspan="2" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="2"> 
                  <font face="arial, verdana, helvetica, sans-serif" size="3" color="#ff0000">
                    <b>ROUND SETUP</b>
                  </font>
                </td>
              </tr>
              <tr>
                <td align="left"> 
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Enter Round Id:</xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                  <INPUT type="text" name="roundidentification"></INPUT>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>
              <tr>
                <td align="left"> 
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Enter Name of the Round:</xsl:text></b>
                  </font>
                 </td>
                 <td align="left">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                  <INPUT type="text" name="descriptioninput"></INPUT>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="2"> 
                  <font face="arial, verdana, helvetica, sans-serif" size="3" color="#ff0000">
                    <b>ROOM SETUP</b>
                  </font>
                </td>
              </tr>
              <tr>
                <td width="600" align="left" colspan="2">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <INPUT TYPE="radio" NAME="operationbutton" VALUE="Qualification">
                    <xsl:text>Set up rooms from qualification information</xsl:text>
                    </INPUT>
                  </font>
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <INPUT TYPE="radio" NAME="operationbutton" VALUE="Round">
                    <xsl:text>Set up rooms from previous round information</xsl:text>
                    </INPUT>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="1" width="150">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <INPUT TYPE="radio" NAME="groupbybutton" VALUE="1">
                    <xsl:text>Use Contest Id</xsl:text>
                    </INPUT>
                  </font>
                </td>
              </tr>
              <tr>
                <td align="left" colspan="1" width="150">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <INPUT TYPE="radio" NAME="groupbybutton" VALUE="2">
                    <xsl:text>Use Group Id</xsl:text>
                    </INPUT>
                  </font>
                </td>
              </tr>
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <INPUT TYPE="radio" NAME="groupbybutton" VALUE="3">
                    <xsl:text>Region</xsl:text>
                    </INPUT>
                    <td align="left" colspan="1" width="75">
                      <INPUT type="text" name="region"></INPUT>
                    </td>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="2">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                    <INPUT TYPE="checkbox" NAME="dryrunbutton" VALUE="true">
                    <b><xsl:text>Dry Run</xsl:text></b>
                    </INPUT>
                  </font>
                </td>
              </tr>
              <tr>
	               <td><img src="/images/spacer.gif" width="200" height="15" /></td>
	               <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="center" >
                  <a href="JavaScript:doSubmit()">
                    <img src="/images/submit_button.gif" width="70" height="19" border="0"/> 
                  </a>
                </td>
              </tr>
              </table>
              <INPUT TYPE="HIDDEN" NAME="Task" VALUE="codergroups"/>
              <INPUT TYPE="HIDDEN" NAME="Command"  VALUE="submitResponse"/>
              <INPUT TYPE="HIDDEN" NAME="results"  VALUE="submit"/>
              <INPUT TYPE="HIDDEN" NAME="rounddescription" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="roundid" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="groupby" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="operation" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="dryrun" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="region" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                <xsl:attribute name="VALUE"><xsl:value-of select="/ADMIN/LoggedIn"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="contestid">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CODERGROUPS/Contest/ContestId"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="groupid">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CODERGROUPS/Contest/Group/GroupId"/>
                </xsl:attribute>
              </INPUT>
            </FORM>
      </table>
      <br/><br/>
    </td>
  </tr>
</table>


</body>

</html>
</xsl:template>
</xsl:stylesheet>
