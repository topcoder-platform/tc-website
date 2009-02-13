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
<title>Confirm Questions</title>

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
<input type="hidden" name="Command" value="ModifyAnswer"/>
<input type="hidden" name="Task" value=""/>
<input type="hidden" name="EditAnswerId" value=""/>
<input type="hidden" name="ActiveCheck" value=""/>
<input type="hidden" name="Date" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Question/CreatedDate"/>
	</xsl:attribute>
</input>
<input type="hidden" name="EMail" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Question/EMail"/>
	</xsl:attribute>
</input>
<input type="hidden" name="UserId" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Question/CoderId"/>
	</xsl:attribute>
</input>
<input type="hidden" name="QuestionId" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Question/QuestionId"/>
	</xsl:attribute>
</input>
<input type="hidden" name="Active" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="/ADMIN/Question/ActiveInd"/>
	</xsl:attribute>
</input>
<input type="hidden" name="CorrectVal" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Question/QuestionAnswer/CorrectInd"/>
	</xsl:attribute>
</input>
<input type="hidden" name="Class" value="">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Class"/>
	</xsl:attribute>
</input>
<xsl:for-each select="/ADMIN/Lists/Category">
  <input type="hidden" name="C_CategoryId" value="">
    <xsl:attribute name="value">
      <xsl:value-of select="CategoryId"/>
    </xsl:attribute>
  </input>
</xsl:for-each>
<xsl:for-each select="/ADMIN/Lists/Category">
  <input type="hidden" name="C_SubjectId" value="">
    <xsl:attribute name="value">
      <xsl:value-of select="SubjectId"/>
    </xsl:attribute>
  </input>
</xsl:for-each>
<xsl:for-each select="/ADMIN/Lists/SubCategory">
  <input type="hidden" name="S_SubCategoryId" value="">
    <xsl:attribute name="value">
      <xsl:value-of select="SubCategoryId"/>
    </xsl:attribute>
  </input>
</xsl:for-each>
<xsl:for-each select="/ADMIN/Lists/SubCategory">
  <input type="hidden" name="S_CategoryId" value="">
    <xsl:attribute name="value">
      <xsl:value-of select="CategoryId"/>
    </xsl:attribute>
  </input>
</xsl:for-each>
<xsl:for-each select="/ADMIN/Lists/SubCategory">
  <input type="hidden" name="S_SubCategoryName" value="">
    <xsl:attribute name="value">
      <xsl:value-of select="SubCategoryName"/>
    </xsl:attribute>
  </input>
</xsl:for-each>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" width="619" height="20" /></td>
  </tr> 
  
  <xsl:choose>
  <xsl:when test="/ADMIN/Class='Submissions'">
  <tr>
    <td colspan="2">
      <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">
        <b>Question Id: </b><xsl:value-of select="/ADMIN/Question/QuestionId"/><br/>
      </font>
    </td>  
  </tr>
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="7" /></td>
  </tr>
  <tr>
    <td colspan="2"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99"><b>Author: </b><xsl:value-of select="/ADMIN/Question/Handle"/></font></td>
  </tr>
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="7" /></td>
  </tr>
  <tr>
    <td colspan="2"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99"><b>Created: </b><xsl:value-of select="/ADMIN/Question/CreatedDate"/></font></td>
  </tr> 
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>
  <tr>
    <td colspan="2">
        <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">Please supply the additional information for this question before clicking transfer.</font>
    </td>  
  </tr>
  </xsl:when>
  <xsl:otherwise>
  <tr>
    <td colspan="2">
      <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">
        <b>Question Id: </b><xsl:value-of select="/ADMIN/Question/QuestionId"/><br/>
      </font>
    </td>  
  </tr>
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="7" /></td>
  </tr>
  <tr>
    <td colspan="2"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99"><b>Author: </b><xsl:value-of select="/ADMIN/Question/Handle"/></font></td>
  </tr>
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="7" /></td>
  </tr>
  <tr>
    <td colspan="2"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99"><b>Created: </b><xsl:value-of select="/ADMIN/Question/CreatedDate"/></font></td>
  </tr> 
  <tr colspan="2">
    <td><img src="/images/spacer.gif" width="619" height="10" /></td>
  </tr>
  <tr>
    <td colspan="2">
        <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">Enter your changes to the question.  Then click Save or Cancel.</font>
    </td>  
  </tr>
  </xsl:otherwise>
  </xsl:choose>
</table>
<table cellspacing="0" cellpadding="0" border="0" width="619" >

  <tr>
    <td><img src="/images/spacer.gif" width="70" height="20" /></td>
    <td><img src="/images/spacer.gif" width="210" height="20" /></td>
    <td><img src="/images/spacer.gif" width="70" height="20" /></td>
    <td colspan="3"><img src="/images/spacer.gif" width="220" height="20" /></td>
  </tr> 
  <tr>
    <td align="left" width="70" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Subject:</font></td>
    <td align="left" width="210" height="1" ><xsl:call-template name="subjectInput"/></td>
    <td align="left" width="70" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Keyword:</font></td>
    <td colspan="3" align="left" width="220" height="1" ><xsl:call-template name="keywordInput"/></td>
  </tr> 

  <tr>
    <td><img src="/images/spacer.gif" width="70" height="20" /></td>
    <td><img src="/images/spacer.gif" width="210" height="20" /></td>
    <td><img src="/images/spacer.gif" width="100" height="20" /></td>
    <td colspan="3"><img src="/images/spacer.gif" width="220" height="20" /></td>
  </tr> 
  <tr>
    <td align="left" width="70" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Category:</font></td>
    <td align="left" width="210" height="1" ><xsl:call-template name="categoryInput"/></td>
    <td align="left" width="70" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Subcategory:</font></td>
    <td colspan="3" align="left" width="220" height="1" ><xsl:call-template name="subcategoryInput"/></td>
  </tr> 

  <tr>
    <td><img src="/images/spacer.gif" width="70" height="20" /></td>
    <td><img src="/images/spacer.gif" width="210" height="20" /></td>
    <td><img src="/images/spacer.gif" width="100" height="20" /></td>
    <td><img src="/images/spacer.gif" width="100" height="20" /></td>
    <td><img src="/images/spacer.gif" width="25" height="20" /></td>
    <td><img src="/images/spacer.gif" width="25" height="20" /></td>
  </tr> 
  <tr>
    <td align="left" width="70" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Type:</font></td>
    <td align="left" width="210" height="1" ><xsl:call-template name="typeInput"/></td>
    <td align="left" width="100" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Difficulty:</font></td>
    <td align="left" width="100" height="1" ><xsl:call-template name="difficultylevelInput"/></td>
    <td align="left" width="25" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Active:</font></td>
    <td align="left" width="25" height="1" ><xsl:call-template name="activeInput"/></td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="619" height="20" /></td>
  </tr> 
  <xsl:choose>
    <xsl:when test="/ADMIN/Class='Submissions'">
      <tr>
        <td>
		        <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Question:</font><br/>
          <img src="/images/spacer.gif" width="15" height="10" /><br/>
          <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="/ADMIN/Question/QuestionText"/></font>
        </td>
      </tr>
    </xsl:when> 
    <xsl:otherwise>
      <tr>
        <td>
		        <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Question:</font><br/>
          <img src="/images/spacer.gif" width="15" height="10" /><br/>
          <xsl:call-template name="questionEditInput"/>
        </td>
      </tr>
    </xsl:otherwise>
    </xsl:choose>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <xsl:choose>
    <xsl:when test="/ADMIN/Class!='Submissions'">
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
          <xsl:for-each select="/ADMIN/Question/QuestionAnswer">
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
  </xsl:choose>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <xsl:choose>
    <xsl:when test="/ADMIN/Class='Submissions'">
      <tr>
        <td><img src="/images/spacer.gif" width="430" height="10" /></td>
        <td><img src="/images/spacer.gif" width="2" height="10" /></td>
        <td><img src="/images/spacer.gif" width="59" height="10" /></td>
        <td><img src="/images/spacer.gif" width="55" height="10" /></td>
      </tr>
      <tr>
        <td width="430" height="1"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Answers</font></td>
        <td><img src="/images/spacer.gif" width="2" height="1" /></td>
        <td align="center" width="59" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ccff99">Correct</font></td>
        <td><img src="/images/spacer.gif" width="55" height="1" /></td>
      </tr>
      <tr>
        <td><img src="/images/spacer.gif" width="430" height="10" /></td>
        <td><img src="/images/spacer.gif" width="2" height="10" /></td>
        <td><img src="/images/spacer.gif" width="59" height="10" /></td>
        <td><img src="/images/spacer.gif" width="55" height="10" /></td>
      </tr>
      <xsl:for-each select="/ADMIN/Question/QuestionAnswer">
      <tr>
        <td valign="top" align="left" width="430" height="1"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="AnswerText"/></font></td>
        <td><img src="/images/spacer.gif" width="2" height="1" /></td>
        <td valign="top" align="center" width="59" height="1" ><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">
          <xsl:choose>
            <xsl:when test="CorrectInd='Y'">
              Yes
            </xsl:when>
            <xsl:when test="CorrectInd='N'">
              No
            </xsl:when>
          </xsl:choose>
        </font></td>
        <td><img src="/images/spacer.gif" width="55" height="10" /></td>
      </tr>
      <td colspan="4"><img src="/images/spacer.gif" width="1" height="10" /></td>
      </xsl:for-each>        
    </xsl:when>
  </xsl:choose>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <xsl:choose>
    <xsl:when test="/ADMIN/Class='Submissions'">
      <tr>
        <td><img src="/images/spacer.gif" width="619" height="10" /></td>
      </tr>
      <tr>
        <td><a><xsl:attribute name="HREF">JavaScript:doTransfer('<xsl:value-of select="QuestionId"/>')</xsl:attribute>transfer</a></td>
      </tr> 
      <tr>
       <td><img src="/images/spacer.gif" width="619" height="10" /></td>
      </tr>
      <tr>
        <td><a href="JavaScript:doCancel()">cancel</a></td>
      </tr>
    </xsl:when>
    <xsl:otherwise>
      <tr>
        <td><img src="/images/spacer.gif" width="619" height="10" /></td>
      </tr>
      <tr>
        <td><a href="JavaScript:doSave()">save</a></td>
      </tr>
      <tr>
       <td><img src="/images/spacer.gif" width="619" height="10" /></td>
      </tr>
      <tr>
        <td><a href="JavaScript:doCancel()">cancel</a></td>
      </tr>
    </xsl:otherwise>
  </xsl:choose>
</table>
<SCRIPT TYPE="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var question=document.frmAdmin

function doCorrectChange(checkedVal){
  for(i=0; i<question.Correct.length; i++){
    if(question.Correct[i].checked){
      question.CorrectVal[i].value="Y"
    }else {
      question.CorrectVal[i].value="N"
    }
  }
}

function doTransfer(QuestionId) {
  if (doValCheck2()) {
    if (doCheckNav()) {
      question.Command.value = 'TransferQuestion';
      question.Task.value = 'questionmaintenance';
      question.submit();
    }
  }
}

function doCheckNav(){
  var result=true;
  if(!confirm("This will send email notification to the coder and transfer this question to production.  Are you sure?")){result=false};
  return result;
}

function doValCheck() {
  if(question.Question.value=="") {alert("Please enter a Question to continue.");question.Question.focus();return false;}
  if(question.Keyword.value=="") {alert("Please enter a Keyword to continue.");question.Keyword.focus();return false;}
  if(question.Subject.value==0) {alert("Please enter a Subject to continue.");question.Subject.focus();return false;}
  if(question.Type.value==0) {alert("Please enter a Type to continue.");question.Answer4.focus();return false;}  
  if(question.Difficulty.value==0) {alert("Please enter a Difficulty Level to continue.");question.Difficulty.focus();return false;}  
  if(question.Category.value==0) {alert("Please enter a Category to continue.");question.Category.focus();return false;}  
  if(question.SubCategory.value==0) {alert("Please enter a SubCategory to continue.");question.SubCategory.focus();return false;}
  return true; 
}

function doValCheck2() {
  if(question.Keyword.value=="") {alert("Please enter a Keyword to continue.");question.Keyword.focus();return false;}
  if(question.Subject.value==0) {alert("Please enter a Subject to continue.");question.Subject.focus();return false;}
  if(question.Type.value==0) {alert("Please enter a Type to continue.");question.Answer4.focus();return false;}  
  if(question.Difficulty.value==0) {alert("Please enter a Difficulty Level to continue.");question.Difficulty.focus();return false;}  
  if(question.Category.value==0) {alert("Please enter a Category to continue.");question.Category.focus();return false;}  
  if(question.SubCategory.value==0) {alert("Please enter a SubCategory to continue.");question.SubCategory.focus();return false;}      
  return true; 
}

function doCancel(QuestionId){
question.Command.value='CancelEdit'
question.Task.value = 'questionmaintenance';
question.submit()
}

function doSave() {
  doCorrectChange();
  if( doCheckAnswer() ) {
    if( doCheckCorrect() ) {
      if( doValCheck() ) {
          question.Command.value = 'SaveQuestion';
          question.Task.value = 'questionmaintenance';
          question.submit();
      }
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
  for(i=0; i<question.Correct.length; i++){
    if(question.Correct[i].checked){
      return true;
      break;
    }
  }
  alert("Please check a correct answer(s).");question.Correct.focus();return false;
}


function doReload(checkedVal){
    if(checkedVal==true){
      question.ActiveCheck.value = "Y"
    }else {
      question.ActiveCheck.value = "N"
    }
}

function doLoadSubCategory(idx){
var CategoryArray = new Array(question.C_CategoryId, question.C_SubjectId)
var SubCategoryArray = new Array(question.S_SubCategoryId, question.S_CategoryId, question.S_SubCategoryName)
  if (question.Category.selected=true) {
    var categoryId = question.Category.options[idx].value;
    var subcategoryId = question.SubCategory.selectedIndex;
    question.SubCategory.options.length=0;
    for(i=0; i<question.S_SubCategoryId.length;i++){
      if((SubCategoryArray[1][i].value)==categoryId){
        question.SubCategory.options[question.SubCategory.options.length] = new Option(SubCategoryArray[2][i].value,SubCategoryArray[0][i].value,false,false);
          if ((SubCategoryArray[0][i].value)==subcategoryId){
            question.SubCategory.options[i].selected=true;
          }else {
            question.SubCategory.selectedIndex=-1
          }
      }
    }
  }
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
