<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="problemtop.xsl"/>
<xsl:import href="problembottom.xsl"/>
<xsl:template match="/">
<html>

<head>
<title>Problem Information</title>
<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8"></META>
</head>

<SCRIPT type="text/javascript"><![CDATA[

function doUpdate() {
  if(doCheck("problemsave")) {
    doSubmit();
  }
}
function doNext() {
  if(doCheck("problemnext")) {
    doSubmit();
  }
}
function doSystemTest() {
  //if(window.document.frmProblem.modified.value="true") {
    //window.document.frmProblem.Command.value = 'getSysTestMenu';
    //doSubmit();
  //}
  //else 
  if(doCheck("problemnext")) {
    doSubmit();
  }
}
function doCancel() {
  window.document.frmProblem.Command.value = 'getProblemInfo';
  doSubmit();
}


function doSubmit(){window.document.frmProblem.submit();}

function doCheck(cmd){
  if(window.document.frmProblem.classname.value==""){alert("Please enter a Class Name.");window.document.frmProblem.classname.focus();return false;}
  if(window.document.frmProblem.methodname.value==""){alert("Please enter a Method Name.");window.document.frmProblem.methodname.focus();return false;}
  if(window.document.frmProblem.resulttype.value==""){alert("Please enter a Result Type.");window.document.frmProblem.resulttype.focus();return false;}
  if(window.document.frmProblem.problemtext.value==""){alert("Please enter a Problem Text.");window.document.frmProblem.problemtext.focus();return false;}
  if(window.document.frmProblem.difflevel.value==""){alert("Please choose a Difficulty Level.");window.document.frmProblem.difflevel.focus();return false;}
  //if(window.document.frmProblem.selectedparamtypes.value==""){alert("Please enter Parameter Types.");window.document.frmProblem.paramdatatypes.focus();return false;}
  if(window.document.frmProblem.selectedparamtypes.length=="") {
    alert("Please enter Parameter Types.");
    window.document.frmProblem.paramdatatypes.focus();
    return false;
  }
  else {
    paramTypeString = "";
    paramTypeValue = "";
    for(i = 0; i<window.document.frmProblem.selectedparamtypes.length; i++) {
      if(i != 0) {
        paramTypeString = paramTypeString + ",";
      }
      paramTypeValue = window.document.frmProblem.selectedparamtypes.options[i].value;
      paramTypeString = paramTypeString + paramTypeValue;
    }
    window.document.frmProblem.paramtypes.value = paramTypeString;
    window.document.frmProblem.Command.value = cmd; 
  }
  return true;
}


function doParamMove(select, col, othercol) 
{
  sl = document.frmProblem[col].selectedIndex;
  ocl = document.frmProblem[othercol].length;
  cl = document.frmProblem[col].length;
  if (sl != -1 && document.frmProblem[col].options[sl].value > "") {
    pText = document.frmProblem[col].options[sl].text;
    pValue = document.frmProblem[col].options[sl].value;
    if (document.frmProblem[col].options[sl].value > "" && select == 0) { 
      var arrFbox = new Array();
      var arrLookup = new Array();
      var i;
      for (i = 0; i < document.frmProblem[othercol].options.length; i++) {
        arrLookup[document.frmProblem[othercol].options[i].text] = document.frmProblem[othercol].options[i].value;
      }
      var fLength = 0;
      for(i = 0; i < document.frmProblem[col].options.length; i++) {
        arrLookup[document.frmProblem[col].options[i].text] = document.frmProblem[col].options[i].value;
        if (document.frmProblem[col].options[i].selected && document.frmProblem[col].options[i].value != "") {
        } 
        else {
          arrFbox[fLength] = document.frmProblem[col].options[i].text;
          fLength++;
        }
        
      }
      document.frmProblem[col].length = 0;
      var c;
      for(c = 0; c < arrFbox.length; c++) {
        var no = new Option();
        no.value = arrLookup[arrFbox[c]];
        no.text = arrFbox[c];
        document.frmProblem[col].options[c] = no;
      }
    } else if (document.frmProblem[col].options[sl].value > "" && select == 1) {
      op = new Option();
      op.value = pValue;
      op.text = pText;
      document.frmProblem[othercol].options[ocl] = op;
    }
  } else {
    alert("Please select a parameter type");
  }
}



]]></SCRIPT>

<body bgcolor="#ffffff" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="loaded=true">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<!--
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/TC/LoggedIn='true'">
          <xsl:call-template name="TopLoggedIn"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TopLoggedOut"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="619" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
  </tr> 
-->
  <tr>
<!--
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/TC/LoggedIn='true'">
            <xsl:call-template name="Problems_LI"/>
          </xsl:when>
        </xsl:choose>
        <tr>
          <td valign="top">
            <xsl:call-template name="LeftSideNavBarForm"/>
         </td>
        </tr>
      </table>
    </td>
-->
    <td valign="top">
    <table width="619" cellpadding="0" cellspacing="0" border="0"  >
           <tr>
              <td align="center" valign="top" colspan="2">
               <font size="3">
                    <b>PROBLEM SETUP SCREEN</b>
               </font>
             </td>
           </tr>
    </table>
    <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <FORM NAME="frmProblem" METHOD="POST" >
               <xsl:attribute name="ACTION">http<xsl:value-of select="/TC/AdminURL"/></xsl:attribute>
               <tr>
                 <td valign="top" height="1"><img src="/images/spacer.gif" width="619" height="1" /></td>
               </tr>
               <tr>
                  <td>
                       <xsl:call-template name="ProblemInformationActive"/>
                       <xsl:call-template name="SystemTestInformationInactive"/>
                   </td>
                </tr>
 
           <table width="600" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                 <td colspan="4"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="1">
                  <font size="2">
                    <b><xsl:text>Class Name: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="2">
                  <INPUT type="text" name="classname" size="30" maxlength="32">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/TC/PROBLEMS/Problem/ClassName"/>
                    </xsl:attribute>
                  </INPUT>
                </td>
                <td colspan="1">
                </td>
              </tr>
              <tr>
                <td align="left" colspan="1">
                  <font size="2">
                    <b><xsl:text>Method Name: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="2">
                  <INPUT type="text" name="methodname" size="30" maxlength="32">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/TC/PROBLEMS/Problem/MethodName"/>
                    </xsl:attribute>
                  </INPUT> 
                </td>
                <td colspan="1">
                </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font size="2"> 
                    <b><xsl:text>Result Type: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="2">
                  <SELECT NAME="resulttype" SIZE="1">
                    <OPTION VALUE=""></OPTION>
                    <xsl:for-each select="/TC/PROBLEMS/DataType">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="DataTypeID"/></xsl:attribute>
                        <xsl:if test="DataTypeID=/TC/PROBLEMS/Problem/ResultTypeId">
                          <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="DataTypeName"/>
                      </OPTION>
                    </xsl:for-each>
                  </SELECT>
                </td>
                <td colspan="1">
                </td>
              </tr>


              <tr>
                <td align="left" colspan="1">
                  <font size="2">
                    <b><xsl:text>Problem Text: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="2">
                  <textarea name="problemtext" rows="30" cols="90" wrap="physical">
                    <xsl:value-of select="/TC/PROBLEMS/Problem/ProblemText"/>
                  </textarea>
                </td>
                <td colspan="1">
                </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font size="2">
                    <b><xsl:text>Difficulty Level: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="2">
                  <SELECT NAME="difflevel" SIZE="1"> 
                    <OPTION VALUE=""></OPTION>
                    <xsl:for-each select="/TC/PROBLEMS/Difficulty">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="DifficultyId"/></xsl:attribute>
                          <xsl:if test="DifficultyId=/TC/PROBLEMS/Problem/DifficultyID">
                            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                          </xsl:if>
                        <xsl:value-of select="DifficultyLevel"/>
                      </OPTION>
                    </xsl:for-each>
                  </SELECT>
                </td>
                <td colspan="1">
                </td>
              </tr>
              
              <tr>
                <td align="left" colspan="1">
                  <font size="2">
                    <b><xsl:text>Parameter Types: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <SELECT NAME="paramdatatypes" SIZE="7" MULTIPLE="true">
                    <xsl:for-each select="/TC/PROBLEMS/DataType">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="DataTypeID"/></xsl:attribute>
                        <xsl:value-of select="DataTypeName"/>
                      </OPTION>
                    </xsl:for-each>
                  </SELECT>
                </td>
             
                <td align="left" colspan="1">
                  <SELECT NAME="selectedparamtypes" SIZE="7" MULTIPLE="true">
                    <xsl:for-each select="/TC/PROBLEMS/Problem/PARAMTYPES/ParamType">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="."/></xsl:attribute>
                        <xsl:value-of select="."/>
                      </OPTION>
                    </xsl:for-each>
 
                  </SELECT>
                </td>
                
                <td colspan="1">
                </td>
                
              </tr>
              
              <tr>
              
                <td colspan="1">
                </td>
                
                <td colspan="1">
                  <br/>
                  <font size="2">
                    <xsl:text>Select   </xsl:text>
                  </font>
                  <a href="JavaScript:doParamMove('1','paramdatatypes','selectedparamtypes')">
                    <img src="/images/forward_arrow.gif" alt="Select" width="16" height="16" border="0" />
                  </a>
                </td>
                
                <td colspan="1">
                  <br/>
                  <a href="JavaScript:doParamMove('0','selectedparamtypes','paramdatatypes')">
                    <img src="/images/back_arrow.gif" alt="Deselect" width="16" height="16" border="0" />
                  </a>
                  <font size="2">
                    <xsl:text>  Deselect</xsl:text>
                  </font>

                </td>
                
                <td colspan="1">
                </td>  
  
              </tr>

              <tr>
                 <td colspan="4" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
                 <td colspan="2"><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                 <td colspan="1">
                   <font size="2">
                    <b><xsl:text>Environments  </xsl:text></b>
                   </font>
                 </td>
              </tr>

               <tr>
                 <td colspan="1">
                   <font size="2">
                    <xsl:text>Dev  </xsl:text>
                   </font>
                 </td>
                 <td colspan="1">
                   <INPUT TYPE="checkbox" NAME="DEV" VALUE="Y">
                     <xsl:attribute name="CHECKED"/>
                   </INPUT>
                 </td>
              </tr>
               <tr>
                 <td colspan="1">
                   <font size="2">
                    <xsl:text>QA  </xsl:text>
                   </font>
                 </td>
                 <td colspan="1">
                   <INPUT TYPE="checkbox" NAME="QA" VALUE="Y">
                     <xsl:attribute name="CHECKED"/>
                   </INPUT>
                 </td>
              </tr>
               <tr>
                 <td colspan="1">
                   <font size="2">
                    <xsl:text>PROD  </xsl:text>
                   </font>
                 </td>
                 <td colspan="1">
                   <INPUT TYPE="checkbox" NAME="PROD" VALUE="Y">
                     <xsl:attribute name="CHECKED"/>
                   </INPUT>
                 </td>
              </tr>

              <tr>
                <td colspan="1">
                </td>
                <td align="center" colspan="1">
                   <xsl:call-template name="NextButton"/>
                   <xsl:call-template name="UpdateButton"/>
                   <xsl:call-template name="CancelButton"/>
                </td>
                <td colspan="1">
                </td>
             
              </tr>
              
              
           </table>
              <INPUT TYPE="HIDDEN" NAME="Task" VALUE="problems"/>
<!--
              <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
              </INPUT>
-->
              <INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="paramtypes" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="modified">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/TC/PROBLEMS/Problem/Modified"/>
                </xsl:attribute>
              </INPUT>

              </FORM>
           </table>
         
	   
	 
    </td>
  </tr>

</table>

</body>

</html>
</xsl:template>
</xsl:stylesheet>
