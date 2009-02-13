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
<title>Questions</title>

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
<input type="hidden" name="LoadQuestionId" value=""/>
<input type="hidden" name="Direction"/>
<input type="hidden" name="RowVal" value="15"/>
<input type="hidden" name="Class">
	<xsl:attribute name="value">
		<xsl:value-of select="ADMIN/Class"/>
	</xsl:attribute>
</input>
<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td colspan="2"><img src="/images/spacer.gif" width="619" height="20" /></td>
  </tr> 
  <tr>
    <td><img src="/images/spacer.gif" width="369" height="1" /></td>
    <td><img src="/images/spacer.gif" width="150" height="1" /></td>
  </tr>  
  <tr>
    <td>
      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
        <xsl:comment>----------------------Questions Header Logic----------------------------</xsl:comment>
        <xsl:choose>
          <xsl:when test="/ADMIN/Status='U'">
            <b>Un-Transferred Submissions Retrieval</b><br/>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">To edit and/or transfer a question click on its Id.</font>
          </xsl:when>
          <xsl:when test="/ADMIN/Status='T'">
            <b>Transferred Submissions Retrieval</b><br/>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">These questiona have already been transferred.</font>
          </xsl:when>
          <xsl:when test="/ADMIN/Status='R'">
            <b>Rejected Submissions Retrieval</b><br/>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">These questions have been rejected.</font>
          </xsl:when>  
          <xsl:when test="/ADMIN/Status=''">
            <b>All Adopted Questions</b><br/>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">To edit a question click on its Id.<br/></font>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#999999">In-Active Questions appear in grey.</font>
          </xsl:when>
          <xsl:when test="/ADMIN/Status='Y'">
            <b>Active Adopted Questions</b><br/>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">To edit a question click on its Id.</font>
          </xsl:when>
          <xsl:when test="/ADMIN/Status='N'">
            <b>In-Active Adopted Questions</b><br/>
            <img src="/images/spacer.gif" width="369" height="10" /><br/>
            <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">To edit a question click on its Id.</font>
          </xsl:when>
        </xsl:choose>
      </font>
    </td>
    <td align="middle">
      <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">
        <xsl:choose>
          <xsl:when test="/ADMIN/Class='Submissions'">
            <xsl:if test="/ADMIN/PreviousLink='true'">
              <a><xsl:attribute name="href">JavaScript:doSubPrevious()</xsl:attribute>&lt;&lt;previous </a>
            </xsl:if>
            <xsl:if test="/ADMIN/NextLink='true'">
              <a><xsl:attribute name="href">JavaScript:doSubNext()</xsl:attribute> next&gt;&gt;</a>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="/ADMIN/PreviousLink='true'">
              <a><xsl:attribute name="href">JavaScript:doAdoptPrevious()</xsl:attribute>&lt;&lt;previous </a>
            </xsl:if>
            <xsl:if test="/ADMIN/NextLink='true'">
              <a><xsl:attribute name="href">JavaScript:doAdoptNext()</xsl:attribute> next&gt;&gt;</a>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </font><br/>
      <img src="/images/spacer.gif" width="150" height="10" /><br/>
      <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a><xsl:attribute name="href">JavaScript:doSearch()</xsl:attribute>new search</a></font>
    </td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="40" height="10" /></td>
    <td><img src="/images/spacer.gif" width="10" height="10" /></td>
    <td><img src="/images/spacer.gif" width="400" height="10" /></td>
    <td><img src="/images/spacer.gif" width="5" height="10" /></td>
    <td><img src="/images/spacer.gif" width="40" height="10" /></td>
    <td><img src="/images/spacer.gif" width="10" height="10" /></td>
    <td><img src="/images/spacer.gif" width="45" height="10" /></td>
  </tr>   
    <tr>
      <td colspan="7">
      
          <table width="619" cellspacing="0" cellpadding="0" border="0">
            <td><img src="/images/tlc_g.gif" width="4" height="4" alt="" /></td>
            <td bgcolor="#333333"><img src="/images/spacer.gif" width="611" height="4" alt="" /></td>
            <td><img src="/images/trc_g.gif" width="4" height="4" alt="" /></td>
          </table>
      
      </td>
    </tr>
  <tr>
    <td align="right" bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Id</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="left" bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Question</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="right" bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Submitted</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="right" bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Coder</b></font></td>
  </tr>   
    <tr>
      <td colspan="7" bgcolor="#333333"><img src="/images/spacer.gif" width="1" height="2" alt="" /></td>
    </tr>
    
    <tr>
      <td colspan="7"><img src="/images/spacer.gif" width="1" height="10" alt="" /></td>
    </tr>
  <xsl:for-each select="/ADMIN/Questions/Question">
    <tr>
      <xsl:choose>
        <xsl:when test="/ADMIN/Class='Submissions'">
          <td align="right" valign="top">
            <xsl:if test="/ADMIN/Status='U'">
              <a><xsl:attribute name="href">JavaScript:doLoad('<xsl:value-of select="QuestionId"/>')</xsl:attribute><xsl:value-of select="QuestionId"/></a>
            </xsl:if>
            <xsl:if test="/ADMIN/Status='T'">
              <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><xsl:value-of select="QuestionId"/></font>
            </xsl:if>
            <xsl:if test="/ADMIN/Status='R'">
              <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><xsl:value-of select="QuestionId"/></font>
            </xsl:if>
          </td>
          <td><img src="/images/spacer.gif" width="10" height="1" /></td>
          <td valign="top"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="Question"/></font></td>
          <td><img src="/images/spacer.gif" width="5" height="1" /></td>
          <td align="right" valign="top"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="Timestamp"/></font></td>
          <td><img src="/images/spacer.gif" width="10" height="1" /></td>
          <td align="right" valign="top"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="UserId"/></font></td>
        </xsl:when>
        <xsl:otherwise>
          <td align="right" valign="top"><a><xsl:attribute name="href">JavaScript:doLoad('<xsl:value-of select="QuestionId"/>')</xsl:attribute><xsl:value-of select="QuestionId"/></a></td>
          <td><img src="/images/spacer.gif" width="10" height="1" /></td>
          <td valign="top">
            <xsl:if test="ActiveInd='Y'">
              <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="QuestionText"/></font>
            </xsl:if>
            <xsl:if test="ActiveInd='N'">
              <font face="arial, helvetica, verdana, sans-serif" size="2" color="#999999"><xsl:value-of select="QuestionText"/></font>
            </xsl:if>
          </td>   
          <td><img src="/images/spacer.gif" width="10" height="1" /></td>
          <td align="right" valign="top"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="CreatedDate"/></font></td>
          <td><img src="/images/spacer.gif" width="10" height="1" /></td>
          <td align="right" valign="top"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><xsl:value-of select="CoderId"/></font></td>
        </xsl:otherwise>
      </xsl:choose>  
    </tr>
  <tr>
    <td colspan="7"><img src="/images/spacer.gif" width="619" height="15" /></td>
  </tr> 
  </xsl:for-each>
    <tr bgcolor="#333333">
      <td colspan="7"><img src="/images/spacer.gif" width="1" height="2" alt="" /></td>
    </tr>
    
    <tr>
      <td colspan="7">
      
          <table width="619" cellspacing="0" cellpadding="0" border="0">
            <td><img src="/images/blc_g.gif" width="4" height="4" alt="" /></td>
            <td bgcolor="#333333"><img src="/images/spacer.gif" width="611" height="4" alt="" /></td>
            <td><img src="/images/brc_g.gif" width="4" height="4" alt="" /></td>
          </table>
      
      </td>
    </tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="20" /></td>
    <td><img src="/images/spacer.gif" width="15" height="20" /></td>
    <td><img src="/images/spacer.gif" width="400" height="20" /></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="1" /></td>
    <td><img src="/images/spacer.gif" width="15" height="1" /></td>
    <xsl:choose>
      <xsl:when test="/ADMIN/RecordCount>'0'">
        <td align="middle"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">viewing (<xsl:value-of select="/ADMIN/StartRecord"/>-<xsl:value-of select="/ADMIN/EndRecord"/>)  of  <xsl:value-of select="/ADMIN/RecordCount"/></font></td>
      </xsl:when>
      <xsl:otherwise>
        <td align="middle"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a><xsl:attribute name="href">JavaScript:doSearch()</xsl:attribute>no records found..please try another search</a></font></td>
      </xsl:otherwise>
    </xsl:choose>   
  </tr> 
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="10" /></td>
    <td><img src="/images/spacer.gif" width="15" height="10" /></td>
    <td><img src="/images/spacer.gif" width="445" height="10" /></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="1" /></td>
    <td><img src="/images/spacer.gif" width="15" height="1" /></td>
    <td align="middle">
      <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">
        <xsl:choose>
          <xsl:when test="/ADMIN/Class='Submissions'">
            <xsl:if test="/ADMIN/PreviousLink='true'">
              <a><xsl:attribute name="href">JavaScript:doSubPrevious()</xsl:attribute>&lt;&lt;previous </a>
            </xsl:if>
            <xsl:if test="/ADMIN/NextLink='true'">
              <a><xsl:attribute name="href">JavaScript:doSubNext()</xsl:attribute> next&gt;&gt;</a>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="/ADMIN/PreviousLink='true'">
              <a><xsl:attribute name="href">JavaScript:doAdoptPrevious()</xsl:attribute>&lt;&lt;previous </a>
            </xsl:if>
            <xsl:if test="/ADMIN/NextLink='true'">
              <a><xsl:attribute name="href">JavaScript:doAdoptNext()</xsl:attribute> next&gt;&gt;</a>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </font>
    </td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="10" /></td>
    <td><img src="/images/spacer.gif" width="15" height="10" /></td>
    <td><img src="/images/spacer.gif" width="445" height="10" /></td>
  </tr>
  <xsl:if test="/ADMIN/RecordCount>'0'">
  <tr>
    <td><img src="/images/spacer.gif" width="59" height="1" /></td>
    <td><img src="/images/spacer.gif" width="15" height="1" /></td>
    <td align="middle"><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a><xsl:attribute name="href">JavaScript:doSearch()</xsl:attribute>new search</a></font></td>
  </tr>
  </xsl:if>
</table>
<SCRIPT type="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var question=document.frmAdmin

function doLoad(QuestionNumber){
question.Command.value='LoadQuestion';
question.LoadQuestionId.value=QuestionNumber;
question.Task.value = 'questionmaintenance';
question.submit();
}
function doSearch(){
question.Command.value='';
question.Task.value = 'questionmaintenance';
question.submit();
}

function doAdoptNext(){
question.Command.value='MoreAdopted';
question.Direction.value='next';
question.Task.value = 'questionmaintenance';
question.submit();
}

function doAdoptPrevious(){
question.Command.value='MoreAdopted';
question.Direction.value='previous';
question.Task.value = 'questionmaintenance';
question.submit();
}

function doSubNext(){
question.Command.value='MoreSubmissions';
question.Direction.value='next';
question.Task.value = 'questionmaintenance';
question.submit();
}

function doSubPrevious(){
question.Command.value='MoreSubmissions';
question.Direction.value='previous';
question.Task.value = 'questionmaintenance';
question.submit();
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
