<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:import href="../../bottom.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="problemtop.xsl"/>
<xsl:import href="problembottom.xsl"/>

<xsl:template match="/">
<html>

<head>
<title>Special Case Information</title>

<xsl:call-template name="CSS"/>

</head>

<SCRIPT type="text/javascript"><![CDATA[


function doNext() {
  if(doCheck()) {
    window.document.frmSpecialCase.Command.value="fromspecialcase";
    doSubmit();
  }
}
function doSystemTest() {
  if(doCheck()) {
    window.document.frmSpecialCase.Command.value="problemnext";
    doSubmit();
  }
}
function doProblem(){
  window.document.frmSpecialCase.Command.value="getProblemModifyScreen";
  doSubmit();
}
function doCancel() {
  window.document.frmSpecialCase.Command.value = "cancelTestCase";
  doSubmit();
}
function doSubmit(){window.document.frmSpecialCase.submit();}

function doCheck(){
  for(i = 0; i<window.document.frmSpecialCase.elements.length; i++) {
    elementName = window.document.frmSpecialCase.elements[i].name;
    checkName = elementName.substring(0,3);
    if( (checkName == "arg") || (checkName == "exp") ) {
      if(!doElement(elementName, i)) {
        return false;
      }
    }
    
  }

  return true;
}

function doElement(elementName, i) {
    checkName = elementName.substring(3,6);

    if(checkName == "sel") {
      if(window.document.frmSpecialCase.elements[i].length != 0) {
        paramTypeString = "";
        paramTypeValue = "";
        for(j = 0; j<window.document.frmSpecialCase.elements[i].length; j++) {
          if(j != 0) {
            paramTypeString = paramTypeString + ",";
          }
          paramTypeValue = window.document.frmSpecialCase.elements[i].options[j].value;
          paramTypeString = paramTypeString + paramTypeValue;
        }
        window.document.frmSpecialCase.elements[i+1].value = paramTypeString;
      }
    }

    else if( (checkName == "row") || (checkName == "dat") ) {
      rowdatVal = window.document.frmSpecialCase.elements[i].value;
      if(rowdatVal=="") {
        alert("Please enter all Matrix2D values.");
        window.document.frmSpecialCase.elements[i].focus();
        return false;
      }
      else {
        window.document.frmSpecialCase.elements[i].value = rowdatVal;
      }
    }
    
    return true;

}


function doParamMove(select, col, othercol) 
{
  sl = document.frmSpecialCase[col].selectedIndex;
  ocl = document.frmSpecialCase[othercol].length;
  cl = document.frmSpecialCase[col].length;
  if (sl != -1 && document.frmSpecialCase[col].options[sl].value > "") {
    pText = document.frmSpecialCase[col].options[sl].text;
    pValue = document.frmSpecialCase[col].options[sl].value;
    if (document.frmSpecialCase[col].options[sl].value > "" && select == 0) {
      var arrFbox = new Array();
      var arrLookup = new Array();
      var i;
      for (i = 0; i < document.frmSpecialCase[othercol].options.length; i++) {
        arrLookup[document.frmSpecialCase[othercol].options[i].text] = document.frmSpecialCase[othercol].options[i].value;
      }
      var fLength = 0;
      for(i = 0; i < document.frmSpecialCase[col].options.length; i++) {
        arrLookup[document.frmSpecialCase[col].options[i].text] = document.frmSpecialCase[col].options[i].value;
        if (document.frmSpecialCase[col].options[i].selected && document.frmSpecialCase[col].options[i].value != "") {
        } 
        else {
          arrFbox[fLength] = document.frmSpecialCase[col].options[i].text;
          fLength++;
        }
        
      }
      document.frmSpecialCase[col].length = 0;
      var c;
      for(c = 0; c < arrFbox.length; c++) {
        var no = new Option();
        no.value = arrLookup[arrFbox[c]];
        no.text = arrFbox[c];
        document.frmSpecialCase[col].options[c] = no;
      }
    } else if (document.frmSpecialCase[col].options[sl].value > "" && select == 1) {
      op = new Option();
      op.value = pValue;
      op.text = pText;
      document.frmSpecialCase[othercol].options[ocl] = op;
    }
  } else {
    alert("Please select a parameter type");
  }
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
    <td valign="top">
    <table width="619" cellpadding="0" cellspacing="0" border="0"  >
           <tr>
              <td align="center" valign="top" colspan="2">
               <font face="arial, verdana, helvetica, sans-serif" size="3" color="#ff0000">
                    <b>Special Case Screen</b>
               </font>
             </td>
           </tr>
    </table>
    <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <FORM NAME="frmSpecialCase" METHOD="POST" >
               <xsl:attribute name="ACTION">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
               <tr>
                 <td valign="top" height="1"><img src="/images/spacer.gif" width="619" height="1" /></td>
               </tr>
               <tr>
                  <td>
                       <xsl:call-template name="ProblemInformationInactive"/>
                       <xsl:call-template name="SystemTestInformationActive"/>
                   </td>
                </tr>
 
           <table width="600" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                 <td colspan="4"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>
              
              <!-- Loop to locate the ArgType Values -->
              <xsl:for-each select="/ADMIN/PROBLEMS/TestCase/TestCaseArgs">
              
              
              
              <xsl:choose>
                <xsl:when test="ArgType='ArrayList'">
                
                <tr>
                  <td align="left" colspan="1">
                    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                      <b><xsl:text>Parameter Types: </xsl:text></b>
                    </font>
                  </td>
                </tr>
                
                 <xsl:variable name="argval">
                   <xsl:choose>
                     <xsl:when test="ArgType='ArrayList'">ArrayList-</xsl:when>
                   </xsl:choose>
                   <xsl:number value="position()" />
                 </xsl:variable>
                 
                 <tr>
              
                 <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:value-of select="substring-before($argval,'-')" />
                  </font>
                 </td>
                 <td align="left" colspan="1">
                  <SELECT NAME="pararg{$argval}" SIZE="7">
                    <xsl:for-each select="/ADMIN/PROBLEMS/DataType">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="DataTypeID"/></xsl:attribute>
                   <!--
                        <xsl:if test="/TC/REGISTRATION/User/UserTypeDetails/Coder/State/StateCode=StateCode">
                          <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                        </xsl:if>
                    -->
                        <xsl:value-of select="DataTypeName"/>
                      </OPTION>
                    </xsl:for-each>
                  </SELECT>
                 </td>
             
                 <td align="left" colspan="1">
                  <SELECT NAME="argsel{$argval}" SIZE="7" MULTIPLE="true">
                  </SELECT>
                 </td>
                 
                 <INPUT TYPE="HIDDEN" NAME="arghid{$argval}" VALUE=""/>
                
                 <td colspan="1">
                 </td>
                 
                 </tr>
              
              
                 <tr>
              
                 <td colspan="1">
                 </td>
                
                 <td colspan="1">
                  <br/>
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>Select  </xsl:text>
                  </font>
                  <a href="JavaScript:doParamMove('1','pararg{$argval}','argsel{$argval}')">
                    <img src="/images/forward_arrow.gif" alt="Select" width="16" height="16" border="0" />
                  </a>

                 </td>
                
                 <td colspan="1">
                  <br/>
                  <a href="JavaScript:doParamMove('0','argsel{$argval}','pararg{$argval}')">
                    <img src="/images/back_arrow.gif" alt="Deselect" width="16" height="16" border="0" />
                  </a>
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
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
                    <td colspan="4" ><img src="/images/spacer.gif" width="600" height="15" /></td>
                 </tr>

                </xsl:when>
                
                
                <xsl:when test="ArgType='Matrix2D'">
                
                <tr>
                  <td align="left" colspan="1">
                    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                      <b><xsl:text>Parameter Types: </xsl:text></b>
                    </font>
                  </td>
                </tr>
                
                  <xsl:variable name="mval">
                    <xsl:choose>
                      <xsl:when test="ArgType='Matrix2D'">Matrix2D-</xsl:when>
                    </xsl:choose>
                    <xsl:number value="position()" />
                  </xsl:variable>
                  
                  <tr>
                    <td align="left" colspan="1">
                      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                        <xsl:text>Matrix2D</xsl:text>
                      </font>
                    </td>
                  </tr>
                  <tr>
                    <td align="left" colspan="1">
                      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                        <xsl:text>How many rows?</xsl:text>
                      </font>
                    </td>
                                    
                    <td align="left" colspan="1">
                      <INPUT type="text" name="argrow{$mval}" size="10" maxlength="10"/>
                    </td>
                    
                    <td align="left" colspan="1">
                      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                        <xsl:text>Data Type:</xsl:text>
                      </font>
                    </td>
                    
                    <td align="left" colspan="1">
                      <SELECT NAME="argdat{$mval}" SIZE="1">
                        <OPTION VALUE=""></OPTION>
                          <xsl:for-each select="/ADMIN/PROBLEMS/DataType">
                            <OPTION>
                              <xsl:attribute name="VALUE">
                                <xsl:value-of select="DataTypeID"/>
                              </xsl:attribute>
                   <!--
                              <xsl:if test="/TC/REGISTRATION/User/UserTypeDetails/Coder/State/StateCode=StateCode">
                                <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                              </xsl:if>
                    -->
                              <xsl:value-of select="DataTypeName"/>
                            </OPTION>
                          </xsl:for-each>
                      </SELECT>
                    </td>

                  </tr>
                </xsl:when>
              </xsl:choose>
              </xsl:for-each>
              
              <tr>
                 <td colspan="4" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              <tr>
                <td colspan="4" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              
              
              <!-- Loop to locate the Expected Result Values -->
              <xsl:for-each select="/ADMIN/PROBLEMS/TestCase/ExpectedResult">
              
              <xsl:choose>
                <xsl:when test="ResultType='ArrayList'">
                
                <tr>
                  <td align="left" colspan="1">
                    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                      <b><xsl:text>Expected Result Types: </xsl:text></b>
                    </font>
                  </td>
                </tr>
                
                 <xsl:variable name="expval">
                   <xsl:choose>
                     <xsl:when test="ResultType='ArrayList'">ArrayList-</xsl:when>
                   </xsl:choose>
                   <xsl:number value="position()" />
                 </xsl:variable>
                 
                 <tr>
              
                 <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:value-of select="substring-before($expval,'-')" />
                  </font>
                 </td>
                 <td align="left" colspan="1">
                  <SELECT NAME="parexp{$expval}" SIZE="7">
                    <xsl:for-each select="/ADMIN/PROBLEMS/DataType">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="DataTypeID"/></xsl:attribute>
                   <!--
                        <xsl:if test="/TC/REGISTRATION/User/UserTypeDetails/Coder/State/StateCode=StateCode">
                          <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                        </xsl:if>
                    -->
                        <xsl:value-of select="DataTypeName"/>
                      </OPTION>
                    </xsl:for-each>
                  </SELECT>
                 </td>
             
                 <td align="left" colspan="1">
                  <SELECT NAME="expsel{$expval}" SIZE="7" MULTIPLE="true">
                  </SELECT>
                 </td>
                 
                 <INPUT TYPE="HIDDEN" NAME="exphid{$expval}" VALUE=""/>
                
                 <td colspan="1">
                 </td>
                 
                 </tr>
              
              
                 <tr>
              
                 <td colspan="1">
                 </td>
                
                 <td colspan="1">
                  <br/>
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>Select  </xsl:text>
                  </font>
                  <a href="JavaScript:doParamMove('1','parexp{$expval}','expsel{$expval}')">
                    <img src="/images/forward_arrow.gif" alt="Select" width="16" height="16" border="0" />
                  </a>

                 </td>
                
                 <td colspan="1">
                  <br/>
                  <a href="JavaScript:doParamMove('0','expsel{$expval}','parexp{$expval}')">
                    <img src="/images/back_arrow.gif" alt="Deselect" width="16" height="16" border="0" />
                  </a>
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
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
                    <td colspan="4" ><img src="/images/spacer.gif" width="600" height="15" /></td>
                 </tr>

                </xsl:when>
                
                
                <xsl:when test="ResultType='Matrix2D'">
                
                <tr>
                  <td align="left" colspan="1">
                    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                      <b><xsl:text>Expected Result Types: </xsl:text></b>
                    </font>
                  </td>
                </tr>
                
                  <xsl:variable name="mval">
                    <xsl:choose>
                      <xsl:when test="ResultType='Matrix2D'">Matrix2D-</xsl:when>
                    </xsl:choose>
                    <xsl:number value="position()" />
                  </xsl:variable>
                  
                  <tr>
                    <td align="left" colspan="1">
                      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                        <xsl:text>Matrix2D</xsl:text>
                      </font>
                    </td>
                  </tr>
                  <tr>
                    <td align="left" colspan="1">
                      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                        <xsl:text>How many rows?</xsl:text>
                      </font>
                    </td>
                                    
                    <td align="left" colspan="1">
                      <INPUT type="text" name="exprow{$mval}" size="10" maxlength="10"/>
                    </td>
                    
                    <td align="left" colspan="1">
                      <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                        <xsl:text>Data Type:</xsl:text>
                      </font>
                    </td>
                    
                    <td align="left" colspan="1">
                      <SELECT NAME="expdat{$mval}" SIZE="1">
                        <OPTION VALUE=""></OPTION>
                          <xsl:for-each select="/ADMIN/PROBLEMS/DataType">
                            <OPTION>
                              <xsl:attribute name="VALUE">
                                <xsl:value-of select="DataTypeID"/>
                              </xsl:attribute>
                   <!--
                              <xsl:if test="/TC/REGISTRATION/User/UserTypeDetails/Coder/State/StateCode=StateCode">
                                <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                              </xsl:if>
                    -->
                              <xsl:value-of select="DataTypeName"/>
                            </OPTION>
                          </xsl:for-each>
                      </SELECT>
                    </td>                    
                

                  </tr>
                </xsl:when>
              </xsl:choose>
              </xsl:for-each>

              <tr>
                 <td colspan="4" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
                 <td colspan="2"><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
              <tr>
                <td align="center" colspan="2">
                   <xsl:call-template name="NextButton"/>
                   <xsl:call-template name="CancelButton"/>
                </td>
                <td colspan="1">
                </td>
             
              </tr>
              
              
           </table>
              <INPUT TYPE="HIDDEN" NAME="Task" VALUE="problems"/>
              <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                <xsl:attribute name="VALUE"><xsl:value-of select="/ADMIN/LoggedIn"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="results">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/PROBLEMS/TestCase/ProblemId"/>
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
