<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<!--This template provides a textarea control for entering the Question-->
<xsl:template name="questionInput">
		<font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif"><b>* Question:</b></font><br></br>
		<textarea name="Question" Rows="5" COLS="55">
			<xsl:attribute name="value">
				<xsl:value-of select="/ADMIN/QuestionMaintenance/Question/Question"/>
			</xsl:attribute>
		</textarea>
</xsl:template>

<!--This template provides a subjectInput control for entering the Question Subject-->
<xsl:template name="subjectInput">
    <select name="Subject" size="1">
      <option value=""></option>
      <xsl:for-each select="/ADMIN/Lists/Subjects">
        <option>
          <xsl:attribute name="value"><xsl:value-of select="SubjectId"/></xsl:attribute>
          <xsl:if test="/ADMIN/Question/Subjects/SubjectId=SubjectId">
            <xsl:attribute name="selected">TRUE</xsl:attribute>
          </xsl:if>
          <xsl:value-of select="SubjectName"/>
        </option>
      </xsl:for-each>
    </select>
</xsl:template>

<!--This template provides a subjectInput control for entering the Question Type-->
<xsl:template name="typeInput">
    <select name="Type" size="1">
      <option value=""></option>
      <xsl:for-each select="/ADMIN/Lists/QuestionType">
        <option>
          <xsl:attribute name="value"><xsl:value-of select="QuestionTypeId"/></xsl:attribute>
          <xsl:if test="/ADMIN/Question/QuestionType/QuestionTypeId=QuestionTypeId">
            <xsl:attribute name="selected">TRUE</xsl:attribute>
          </xsl:if>
          <xsl:value-of select="QuestionTypeDescription"/>
        </option>
      </xsl:for-each>
    </select>
</xsl:template>

<!--This template provides a subjectInput control for entering the Question Difficulty-->
<xsl:template name="difficultylevelInput">
    <select name="Difficulty" size="1">
      <option value=""></option>
      <xsl:for-each select="/ADMIN/Lists/DifficultyLevel">
        <option>
          <xsl:attribute name="value"><xsl:value-of select="DifficultyLevelId"/></xsl:attribute>
          <xsl:if test="/ADMIN/Question/DifficultyLevel/DifficultyLevelId=DifficultyLevelId">
            <xsl:attribute name="selected">TRUE</xsl:attribute>
          </xsl:if>
          <xsl:value-of select="DifficultyLevel"/>
        </option>
      </xsl:for-each>
    </select>
</xsl:template>

<!--This template provides a categoryInput control for entering the Question Category-->
<xsl:template name="categoryInput">
    <select name="Category" onChange="doLoadSubCategory(this.selectedIndex)" size="1">
      <option value=""></option>
      <xsl:for-each select="/ADMIN/Lists/Category">
        <xsl:choose>
          <xsl:when test="/ADMIN/Question/Subjects/SubjectId=SubjectId">
            <option>
              <xsl:attribute name="value"><xsl:value-of select="CategoryId"/></xsl:attribute>
              <xsl:if test="/ADMIN/Question/Category/CategoryId=CategoryId">
                <xsl:attribute name="selected">TRUE</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="CategoryName"/>
            </option>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </select>
</xsl:template>

<!--This template provides a subCategoryInput control for entering the Question SubCategory-->
<xsl:template name="subcategoryInput">
    <select name="SubCategory" size="1">
      <option value=""></option>
        <xsl:for-each select="/ADMIN/Lists/SubCategory">
          <xsl:choose>
          <xsl:when test="/ADMIN/Question/Category/CategoryId=CategoryId">
            <option>
              <xsl:attribute name="value"><xsl:value-of select="SubCategoryId"/></xsl:attribute>
              <xsl:if test="/ADMIN/Question/SubCategory/SubCategoryId=SubCategoryId">
                <xsl:attribute name="selected">TRUE</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="SubCategoryName"/>
            </option>
          </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </select>
</xsl:template>

<!--This template provides a textarea control for entering the Question-->
<xsl:template name="keywordInput">
  <input type="TEXT" name="Keyword" size="20" MAXLENGTH="30">
    <xsl:choose>
      <xsl:when test="/ADMIN/Class='Submissions'">
            <xsl:attribute name="value"><xsl:value-of select="ADMIN/Question/QuestionKeyword"/></xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
            <xsl:attribute name="value"><xsl:value-of select="ADMIN/Question/QuestionKeyword"/></xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </input>
</xsl:template>
    
<!--This template provides a textarea control for entering the Question-->
<xsl:template name="questionEditInput">
		<textarea name="Question" Rows="5" COLS="72">
    <xsl:choose>
      <xsl:when test="/ADMIN/Class='Submissions'">
        <xsl:value-of select="ADMIN/QuestionMaintenance/Question/Question"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="ADMIN/Question/QuestionText"/>
      </xsl:otherwise>
    </xsl:choose>
		</textarea>
</xsl:template>

<!--This template provides a text control for editing an Answer-->
<xsl:template name="adminOptions">
    <br/>
    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>Keyword:</b></font>
    <input type="TEXT" name="keyword" value="">
    </input><br/>
    <HR></HR>
    
    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>Search Submissions</b></font><br/>
    <input type="radio" name="status" onclick="doUpload()" value="U" CHECKED="TRUE"><font color="#ffffff">Un-Transferred Submissions</font></input><br/>
    <input type="radio" name="status" onclick="doUpload()" value="T"><font color="#ffffff">Transferred Submissions</font></input><br/>
    <input type="radio" name="status" onclick="doUpload()" value="R"><font color="#ffffff">Rejected Submissions</font></input><br/>
    <HR></HR>
    
    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>Search Adopted</b></font><br/> 
    <input type="radio" name="status" onclick="doAdopted()" value=""><font color="#ffffff">All Adopted Questions</font></input><br/>
    <input type="radio" name="status" onclick="doAdopted()" value="Y"><font color="#ffffff">Active Questions</font></input><br/>
    <input type="radio" name="status" onclick="doAdopted()" value="N"><font color="#ffffff">Inactive Questions</font></input><br/>
    <HR></HR>
</xsl:template>

<!--This template provides a text control for entering Edit Answer-->
<xsl:template name="answerEditInput">
  <td width="430" height="1" >
    <textarea name="Answer" Rows="2" COLS="60">
      <xsl:value-of select="AnswerText"/>
    </textarea>
  </td>
  <td width="2" height="1" >
    <input type="Hidden" name="Id">
      <xsl:attribute name="value">
        <xsl:value-of select="AnswerId"/>
      </xsl:attribute>
    </input>
  </td>
  <td align="center" width="59" height="1" >
    <input type="checkbox" name="Correct" onClick="doCorrectChange()" value="Y">
      <xsl:if test="CorrectInd='Y'">
        <xsl:attribute name="CHECKED"/>
      </xsl:if>
	  	</input>
  </td>
  <td width="55" height="1" >
    <input type="Hidden" name="CorrectVal">
      <xsl:attribute name="value">
        <xsl:value-of select="CorrectInd"/>
        </xsl:attribute>
      </input>
  </td>
</xsl:template>

<!--This template provides a text control for entering Edit Answer-->
<xsl:template name="activeInput">
	<input type="checkbox" name="Active" onClick="doReload(this.checked)" value="Y">
    <xsl:choose>
      <xsl:when test="/ADMIN/Class='Submissions'">
        <xsl:if test="/ADMIN/Question/Active='Y'">
			      <xsl:attribute name="CHECKED"/>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="/ADMIN/Question/ActiveInd='Y'">
			      <xsl:attribute name="CHECKED"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
	</input>
</xsl:template>

<!--This template provides a text control for entering Answer1-->
<xsl:template name="answerInput1">
  <tr>
   <td>
    <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">* A.) </font>
		<textarea name="Answer1" Rows="2" COLS="40">
			<xsl:attribute name="value">
				<xsl:value-of select="/ADMIN/QuestionMaintenance/Question/QuestionAnswer"/>
			</xsl:attribute>
		</textarea>
    </td>
    <td align="middle">
		<input type="checkbox" name="Correct1" value="Y">
		</input>
    </td>
  </tr>
</xsl:template>

<!--This template provides a text control for entering Answer1-->
<xsl:template name="answerInput2">
  <tr>
   <td>
    <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">* B.) </font>
		<textarea name="Answer2" Rows="2" COLS="40">
			<xsl:attribute name="value">
				<xsl:value-of select="/ADMIN/QuestionMaintenance/Question/QuestionAnswer"/>
			</xsl:attribute>
		</textarea>
    </td>
    <td align="middle">
		<input type="checkbox" name="Correct2" value="Y">
		</input>
    </td>
  </tr>
</xsl:template>

<!--This template provides a text control for entering Answer1-->
<xsl:template name="answerInput3">
  <tr>
   <td>
    <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">* C.) </font>
		<textarea name="Answer3" Rows="2" COLS="40">
			<xsl:attribute name="value">
				<xsl:value-of select="/ADMIN/QuestionMaintenance/Question/QuestionAnswer"/>
			</xsl:attribute>
		</textarea>
    </td>
    <td align="middle">
		<input type="checkbox" name="Correct3" value="Y">
		</input>
    </td>
  </tr>
</xsl:template>

<!--This template provides a text control for entering Answer4-->
<xsl:template name="answerInput4">
  <tr>
   <td>
    <font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff">* D.) </font>
		<textarea name="Answer4" Rows="2" COLS="40">
			<xsl:attribute name="value">
				<xsl:value-of select="/ADMIN/QuestionMaintenance/Question/QuestionAnswer"/>
			</xsl:attribute>
		</textarea>
    </td>
    <td align="middle">
		<input type="checkbox" name="Correct4" value="Y">
		</input>
    </td>
  </tr>
</xsl:template>


<!--This template provides a text control for editing an Answer-->
<xsl:template name="accountingOptions">
  <tr>
    <td><img src="/images/spacer.gif" width="180" height="1" /></td>
    <td><img src="/images/spacer.gif" width="5" height="1" /></td>
    <td><img src="/images/spacer.gif" width="50" height="1" /></td>
    <td><img src="/images/spacer.gif" width="5" height="1" /></td>
    <td><img src="/images/spacer.gif" width="180" height="1" /></td>
  </tr>  
    
  <tr>
    <td colspan="5">
      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>View and Write Report Files</b></font>
    </td>
  </tr>
  
  <tr>
    <td colspan="5"><HR></HR></td>
  </tr>  

  <tr>
    <td colspan="5">
      <input type="radio" name="searchOption" onclick="doSetByDate()" CHECKED="TRUE"><font color="#ffffff">By Date Range  <i>date format</i> (02/15/2001)</font></input>
    </td>
  </tr>
  
  <tr>
    <td colspan="5"><img src="/images/spacer.gif" width="15" height="5" /></td>
  </tr> 
  
  <tr>
    <td><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>Start Date:</b></font></td>
    <td><img src="/images/spacer.gif" width="5" height="1" /></td>
    <td><img src="/images/spacer.gif" width="50" height="1" /></td>
    <td><img src="/images/spacer.gif" width="5" height="1" /></td>
    <td><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>End Date:</b></font></td>
  </tr>  
    
  <tr>
    <td><input type="TEXT" maxlength="10" name="start"  value=""></input></td>
    <td><img src="/images/spacer.gif" width="5" height="1" /></td>
    <td><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>thru</b></font></td>
    <td><img src="/images/spacer.gif" width="5" height="1" /></td>
    <td><input type="TEXT" maxlength="10" name="end" value=""></input></td>
  </tr>  
  
  <tr>
    <td colspan="5"><HR></HR></td>
  </tr>  
    
  <tr>
    <td colspan="5">
      <input type="radio" name="searchOption" onclick="doSetByCoder()" ><font color="#ffffff">By Coder Id</font></input>
    </td>
  </tr>
  
  <tr>
    <td colspan="5"><img src="/images/spacer.gif" width="15" height="5" /></td>
  </tr> 
  
  <tr>
    <td colspan="5"><input type="TEXT" maxlength="10" name="coder" value="" disabled="true"></input></td>
  </tr>  

</xsl:template>
</xsl:stylesheet>

