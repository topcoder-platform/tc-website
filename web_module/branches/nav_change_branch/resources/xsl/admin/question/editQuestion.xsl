<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="QuestionInput.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">


<html>
<head>
<title>Edit Questions</title>

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


  
<form name="frmAdmin" method="POST">
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="Task" value=""/>
<input type="hidden" name="AModified" value="A"/>
<input type="hidden" name="Type" value="R"/>
<input type="hidden" name="CorrectUpdate" value=""/>
<input type="hidden" name="Class" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Class"/>
	</xsl:attribute>
</input>
<input type="hidden" name="Date" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/QuestionMaintenance/Question/Timestamp"/>
	</xsl:attribute>
</input>
<input type="hidden" name="EMail" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/QuestionMaintenance/Question/Email"/>
	</xsl:attribute>
</input>
<input type="hidden" name="UserId" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/QuestionMaintenance/Question/UserId"/>
	</xsl:attribute>
</input>
<input type="hidden" name="QuestionId" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/QuestionMaintenance/Question/QuestionId"/>
	</xsl:attribute>
</input>
<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" width="619" height="20" /></td>
  </tr> 
  <tr>
    <td colspan="2">
      <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">
        <b>Question Id: </b><xsl:value-of select="/ADMIN/QuestionMaintenance/Question/QuestionId"/><br/>
      </font>
    </td>  
  </tr>
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="7" /></td>
  </tr>
  <tr>
    <td colspan="2"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99"><b>Author: </b><xsl:value-of select="/ADMIN/QuestionMaintenance/Question/Handle"/></font></td>
  </tr>
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="7" /></td>
  </tr>
  <tr>
    <td colspan="2"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99"><b>Created: </b><xsl:value-of select="/ADMIN/QuestionMaintenance/Question/Timestamp"/></font></td>
  </tr> 
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>
  <tr>
    <td colspan="2">
        <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">Enter your changes to the question.  Then click save, cancel or prepare for transfer.</font>
    </td>  
  </tr>

</table>


<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td colspan="3"><img src="/images/spacer.gif" width="619" height="20" /></td>
  </tr> 
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="1" /></td>
    <td><img src="/images/spacer.gif" width="15" height="1" /></td>
    <td><img src="/images/spacer.gif" width="445" height="1" /></td>
  </tr> 
  <tr>
    <td colspan="3">
		    <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Question:</font><br/>
      <img src="/images/spacer.gif" width="15" height="10" /><br/>
      <xsl:call-template name="questionEditInput"/>
    </td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="430" height="10" /></td>
    <td><img src="/images/spacer.gif" width="2" height="10" /></td>
    <td><img src="/images/spacer.gif" width="59" height="10" /></td>
    <td><img src="/images/spacer.gif" width="55" height="10" /></td>
  </tr>
  <tr>
    <td width="430" height="1"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Answers</font><br/></td>
    <td><img src="/images/spacer.gif" width="2" height="1" /></td>
    <td align="center" width="59" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Correct</font><br/></td>
    <td><img src="/images/spacer.gif" width="55" height="1" /></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="430" height="10" /></td>
    <td><img src="/images/spacer.gif" width="2" height="10" /></td>
    <td><img src="/images/spacer.gif" width="59" height="10" /></td>
    <td><img src="/images/spacer.gif" width="55" height="10" /></td>
  </tr>
  <xsl:choose>
    <xsl:when test="/ADMIN/Class='Submissions'">
      <xsl:for-each select="/ADMIN/QuestionMaintenance/Question/Answers/QuestionAnswer">
        <tr>
          <xsl:call-template name="answerEditInput"/>
        </tr>
        <tr>
          <td><img src="/images/spacer.gif" width="430" height="10" /></td>
          <td><img src="/images/spacer.gif" width="2" height="10" /></td>
          <td><img src="/images/spacer.gif" width="59" height="10" /></td>
          <td><img src="/images/spacer.gif" width="55" height="10" /></td>
        </tr>
      </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
      <xsl:for-each select="/ADMIN/QuestionMaintenance/Question/QuestionAnswer">
        <tr>
          <xsl:call-template name="answerEditInput"/>
        </tr>
        <tr>
          <td><img src="/images/spacer.gif" width="430" height="10" /></td>
          <td><img src="/images/spacer.gif" width="2" height="10" /></td>
          <td><img src="/images/spacer.gif" width="59" height="10" /></td>
          <td><img src="/images/spacer.gif" width="55" height="10" /></td>
        </tr>
      </xsl:for-each>
    </xsl:otherwise>
  </xsl:choose>
</table>
<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>
  <tr>
    <td><a href="JavaScript:doNext()">save</a></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>
  <tr>
    <td><a href="JavaScript:doCancel()">cancel</a></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>
  <tr>
    <td><a><xsl:attribute name="HREF">JavaScript:doQTransfer('<xsl:value-of select="QuestionId"/>')</xsl:attribute>prepare for transfer</a></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>  
  <tr>
    <td><a><xsl:attribute name="HREF">JavaScript:doReject('<xsl:value-of select="QuestionId"/>')</xsl:attribute>reject</a></td>
  </tr>

</table>

<SCRIPT TYPE="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var question=document.frmAdmin


function doNext() {
  if( doCheckAnswer() ) {
    if( doCheckCorrect() ) {
    question.Command.value = 'SaveQuestion';
    question.Task.value = 'questionmaintenance';
    question.submit();
    }
  }
}

function doCancel() {
      question.Command.value = 'CancelEdit';
		    question.Task.value = 'questionmaintenance';
      question.submit();
}

function doCorrectChange(checkedVal){
  for(i=0; i<question.Correct.length; i++){
    if(question.Correct[i].checked){
      question.CorrectVal[i].value='Y'
    }else {
      question.CorrectVal[i].value='N'
    }
  }
}
function doCheckAnswer(){
  for(i=0; i<question.Answer.length; i++){
    if(question.Answer[i].value==""){
      alert("Please enter a value for  Answer " + (i + 1) + " to continue.");question.Answer.focus();return false;
    }else {
      return true; 
    }
  }
}
function doCheckCorrect(){
  var count=0
  for(i=0; i<question.Correct.length; i++){
    if(question.Correct[i].checked){
      return true;
      break;
    }
  }
  alert("Please check a correct answer('s).");question.Correct.focus();return false;
}
function doQTransfer(Question){
question.Command.value='PrepareTransfer';
question.Task.value = 'questionmaintenance';
question.submit()
}
function doReject(id){
  if( doCheckNav() ) {
    question.Command.value='sendNotification';
    question.Task.value = 'questionmaintenance';
    question.submit()
  }
}
function doCheckNav(){
  var result=true;
  if(!confirm("This will send email notification to the coder and remove this question from the list.  Are you sure?")){result=false};
  return result;
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
