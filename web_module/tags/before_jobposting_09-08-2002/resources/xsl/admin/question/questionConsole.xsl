<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="QuestionInput.xsl"/>
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">

<html>
<head>
<title>Question Console</title>

<xsl:call-template name="CSS"/>



</head>


<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" >




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
  
    <td width="100%" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>

 </tr> 

<tr>
 <td valign="top">
  
  
    <table width="156" cellpadding="0" cellspacing="0" border="0">


    
    

<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
    <xsl:call-template name="QuestionMaint_LI"/>
  </xsl:when>
  <xsl:otherwise>  
    <xsl:call-template name="QuestionMaint_LO"/>
  </xsl:otherwise>
</xsl:choose>
      <tr>
       <td valign="top">
    
<xsl:call-template name="LeftSideNavBarForm"/>

        
       </td>
      </tr>
      
      <tr>
       <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
      </tr>
      
    </table>
  
  </td>

  <td valign="top">
  


  
<FORM NAME="frmAdmin" METHOD="POST">
<INPUT TYPE="hidden" NAME="Task" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE="Upload"/>
<INPUT TYPE="HIDDEN" NAME="Direction" VALUE="next"/>
<INPUT TYPE="HIDDEN" NAME="RowVal" VALUE="1"/>


<table cellspacing="0" cellpadding="0" border="0" >
  <tr>
    <td><img src="/images/spacer.gif" width="125" height="1" /></td>
    <td><img src="/images/spacer.gif" width="125" height="1" /></td>
  </tr>  
  
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" height="20" /></td>
  </tr>

  <tr>
    <td colspan="2"><img src="/images/quest_maint.gif" /></td>
  </tr>
  
  <tr>
    <td bgcolor="#333333" colspan="2"><img src="/images/spacer.gif" width="400" height="4" /></td>
  </tr>
  
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" height="10" /></td>
  </tr>
  
  <tr>
    <td colspan="2"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">It may be useful to enter a keyword for searching.  Select a task from the<br/></font></td>
  </tr>  

  <tr>
    <td colspan="2"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">options and click the retrieve link.  Searches can be performed on new<br/></font></td>
  </tr> 

  <tr>
    <td colspan="2"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Question Submissions or previously Adopted Questions.<br/></font></td>
  </tr> 
  
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" height="10" /></td>
  </tr>
</table>  

<table cellspacing="0" cellpadding="0" border="0" >
  <tr>
    <td><xsl:call-template name="adminOptions"/></td>
  </tr> 
  <tr>
    <td colspan="5"><img src="/images/spacer.gif" height="10" /></td>
  </tr>
</table>  


<table cellspacing="0" cellpadding="0" border="0" >

  <tr>
    <td><img src="/images/spacer.gif" width="125" height="30" /></td>
    <td><img src="/images/spacer.gif" width="125" height="30" /></td>
    <td><img src="/images/spacer.gif" width="125" height="30" /></td>
  </tr>  
  
  <tr>
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doRetrieve()">retrieve records</a></font></td>
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doAdd()">add new record</a></font></td>
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doAccounting()">go to accounting</a></font></td>
  </tr>

  <tr>
    <td colspan="3"><img src="/images/spacer.gif" height="7" /></td>
  </tr>


</table>

<SCRIPT TYPE="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var question=document.frmAdmin

function doRetrieve() {
   question.Task.value = 'questionmaintenance';
   question.submit();
}
function doAdopted() {
   question.Task.value = 'questionmaintenance';
   question.Command.value='Adopted';
   
}
function doUpload() {
   question.Task.value = 'questionmaintenance';
   question.Command.value='Upload';
}
function doAdd() {
   question.Task.value = 'questionmaintenance';
   question.Command.value='AddQuestion'
   question.submit();
}
function doReset() {
	if (question.Command.value=='AddQuestion') {
     question.Task.value = 'questionmaintenance';
   		question.reset();
	}
}
function setFocus() {
  question.Keyword.focus()
}
function doAccounting() {
   question.Task.value = 'questionmaintenance';
   question.Command.value='accountingSearch'
   question.submit();
}
]]></SCRIPT>



</FORM>
     
  </td>
  
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
  
 </tr>
</table> 


</body> 


</html>
</xsl:template>
</xsl:stylesheet>
