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
<title>Accounting Console</title>

<xsl:call-template name="CSS"/>



</head>


<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="doSetByDate()">




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

<form name="frmAdmin" method="POST">
<input type="hidden" name="Task" value=""/>
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="searchType" value="Date"/>

<table cellspacing="0" cellpadding="0" border="0" >
  <tr>
    <td><img src="/images/spacer.gif" width="125" height="1" /></td>
    <td><img src="/images/spacer.gif" width="125" height="1" /></td>
  </tr>  
  
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" height="20" /></td>
  </tr>

  <tr>
    <td colspan="2"><img src="/images/question_acc_header.gif" /></td>
  </tr>
  
  <tr>
    <td bgcolor="#333333" colspan="2"><img src="/images/spacer.gif" width="400" height="4" /></td>
  </tr>
  
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" height="10" /></td>
  </tr>
  
  <tr>
    <td colspan="2"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Please select a search method and click retrieve.<br/></font></td>
  </tr>  
  
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" height="10" /></td>
  </tr>
</table>  
  
<table cellspacing="0" cellpadding="0" border="0" >
  <tr>
    <td><xsl:call-template name="accountingOptions"/></td>
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
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doSearch()">search</a></font></td>
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doReport()">get report file</a></font></td>
    <td align="right" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doQM()">go to maintenance</a></font></td>
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

function doSearch() {
  if (question.searchType.value=='Date') {
    if (doCheck()){
      question.Task.value = 'questionmaintenance';
      question.Command.value='searchAccounts'
      question.submit();
    }
  }else{
    question.Task.value = 'questionmaintenance';
    question.Command.value='searchAccounts'
    question.submit();
  }
}

function doCheck(){
  if (question.start.value.length==10 && question.start.value.substring(2,3)=="/" && question.start.value.substring(5,6)=="/") {
    if (question.end.value.length==10 && question.end.value.substring(2,3)=="/" && question.end.value.substring(5,6)=="/") {
      return (true);
    }else{
      alert("Please check format of [End Date].");
      return (false);
    }
  }else{
    alert("Please check format of [Start Date].");
    return (false);
  }
}

function doQM() {
   question.Task.value = 'questionmaintenance';
   question.Command.value=''
   question.submit();
}

function doReport() {
   question.Task.value = 'questionmaintenance';
   question.Command.value='createReport'
   question.submit();
}

function doSetByDate() {
  question.searchOption[0].checked = 'true';
  question.searchType.value = 'Date';
  question.start.disabled= false;
  question.end.disabled= false;
  question.coder.disabled= true;
  question.start.focus()
}

function doSetByCoder() {
  question.searchType.value = 'Coder';
  question.coder.disabled= false;
  question.start.disabled= true;
  question.end.disabled= true;
  question.coder.focus()
}
]]></SCRIPT>
</form>
  </td>
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
  
 </tr>
</table> 
</body> 
</html>
</xsl:template>
</xsl:stylesheet>
