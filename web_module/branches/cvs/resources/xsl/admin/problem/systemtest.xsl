<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="problemtop.xsl"/>
<xsl:import href="problembottom.xsl"/>

<xsl:template match="/">
<html>
<head>
<title>System Test Information</title>
</head>

<SCRIPT type="text/javascript"><![CDATA[

function doNext() {
  if(doCheck()) {
    window.document.frmSystemTest.Command.value="systemtestnext";
    doSubmit();
  }
}
function doProblem() {
  //if(doCheck()) {
    window.document.frmSystemTest.Command.value="getProblemModifyScreen";
    doSubmit();
  //}
}
function doCancel() {
  window.document.frmSystemTest.Command.value = "cancelTestCase";
  doSubmit();
}
function doSubmit(){window.document.frmSystemTest.submit();}

function doCheck(){
  for (i = 0; i < window.document.frmSystemTest.elements.length; i++) {
    if( (window.document.frmSystemTest.elements[i].name!="Task") && 
        (window.document.frmSystemTest.elements[i].name!="LoggedIn") &&
        (window.document.frmSystemTest.elements[i].name!="Command") ) { 
      if(window.document.frmSystemTest.elements[i].value=="") {
        alert("Please enter values for all Argument Types.");
        window.document.frmSystemTest.elements[i].focus();
        return false;
      }
    }
  }
  return true;
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
                    <b>SYSTEM TEST SETUP SCREEN</b>
               </font>
             </td>
           </tr>
    </table>
    <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <FORM NAME="frmSystemTest" METHOD="POST" >
               <xsl:attribute name="ACTION">http<xsl:value-of select="/TC/PostURL"/></xsl:attribute>
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
              <tr>
                <td align="left" colspan="4">
                  <font size="3"> 
                    <b><xsl:text>Arguments: </xsl:text></b>
                  </font>
                </td>
              </tr>
             

              <xsl:for-each select="/TC/PROBLEMS/TestCase/TestCaseArgs">
              
                 <xsl:variable name="argval">
                   <xsl:choose>
                     <xsl:when test="ArgType='int' or ArgType='Integer'">Integer-</xsl:when>
                     <xsl:when test="ArgType='double' or ArgType='Double'">Double-</xsl:when>
                     <xsl:when test="ArgType='String' or ArgType='String'">String-</xsl:when>
                     <xsl:when test="ArgType='float' or ArgType='Float'">Float-</xsl:when>
                     <xsl:when test="ArgType='boolean' or ArgType='Boolean'">Boolean-</xsl:when>
                     <xsl:when test="ArgType='long' or ArgType='Long'">Long-</xsl:when>
                     <xsl:when test="ArgType='char' or ArgType='Character'">Character-</xsl:when>
                     <xsl:when test="ArgType='ArrayList'">ArrayList-</xsl:when>
                     <xsl:when test="ArgType='Matrix2D'">Matrix2D-</xsl:when>
                   </xsl:choose>
                   <xsl:number value="position()" />
                 </xsl:variable>

                <tr>
                  <td colspan="4" ><img src="/images/spacer.gif" width="200" height="15" /></td> 
                </tr>
               
 
                <xsl:choose>
                  <xsl:when test='ArrayList'>
                    <tr>
                      <td align="left" colspan="4">
                        <font size="2">
                          <b><xsl:text>ArrayList arguments:</xsl:text></b>
                        </font>
                      </td>
                    </tr>
                     


                    <xsl:for-each select="ArrayList">
                      <xsl:variable name="arrlisttype">
                        <xsl:choose>
                          <xsl:when test="ArrayListType='int' or ArrayListType='Integer'">Integer</xsl:when>
                          <xsl:when test="ArrayListType='double' or ArrayListType='Double'">Double</xsl:when>
                          <xsl:when test="ArrayListType='String' or ArrayListType='String'">String</xsl:when>
                          <xsl:when test="ArrayListType='float' or ArrayListType='Float'">Float</xsl:when>
                          <xsl:when test="ArrayListType='boolean' or ArrayListType='Boolean'">Boolean</xsl:when>
                          <xsl:when test="ArrayListType='long' or ArrayListType='Long'">Long</xsl:when>
                          <xsl:when test="ArrayListType='char' or ArrayListType='Character'">Character</xsl:when>
                        </xsl:choose>
                      </xsl:variable>

                      <xsl:variable name="pos">
                        <xsl:number value="position()" />
                      </xsl:variable>                      
                
                      <tr>
                        <td align="left" colspan="1">
                          <font size="2">
                            <xsl:value-of select="$arrlisttype"/>
                          </font>
                        </td>

                        <td align="left" colspan="2">
                          <INPUT type="text" name="arg{$argval}_{$pos}" size="30">
                             <xsl:attribute name="VALUE">
                               <xsl:value-of select="ArrayListValue"/>
                             </xsl:attribute>
                          </INPUT>
                        </td>

                        <td colspan="1">
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>

                  <xsl:when test='Matrix2D'>

                    <xsl:variable name="matrix2dtype">
                        <xsl:choose>
                          <xsl:when test="Matrix2DType='int' or Matrix2DType='Integer'">Integer</xsl:when>
                          <xsl:when test="Matrix2DType='double' or Matrix2DType='Double'">Double</xsl:when>
                          <xsl:when test="Matrix2DType='String' or Matrix2DType ='String'">String</xsl:when>
                          <xsl:when test="Matrix2DType='float' or Matrix2DType='Float'">Float</xsl:when>
                          <xsl:when test="Matrix2DType='boolean' or Matrix2DType='Boolean'">Boolean</xsl:when>
                          <xsl:when test="Matrix2DType='long' or Matrix2DType='Long'">Long</xsl:when>
                          <xsl:when test="Matrix2DType='char' or Matrix2DType='Character'">Character</xsl:when>
                        </xsl:choose>
                    </xsl:variable>


                    <tr>
                      <td align="left" colspan="4">
                        <font size="2">
                          <b><xsl:text>Matrix2D arguments:</xsl:text></b>
                        </font>
                      </td>
                    </tr>

                    <tr>
                        <td align="left" colspan="1">
                          <font size="2">
                            <xsl:text>Type - </xsl:text><xsl:value-of select="$matrix2dtype" />
                          </font>
                        </td>
                    </tr>

                    <tr>
                        <td align="left" colspan="4">
                          <font size="2">
                            <xsl:text>Please enter the row values separated by commas (no spaces). 
                            </xsl:text>
                          </font>
                        </td>
                    </tr>

 

                    <xsl:for-each select="Matrix2D">
                      <xsl:variable name="rownum">
                        <xsl:number value="position()" />
                      </xsl:variable>

                      <xsl:variable name="rowval">
                        <xsl:value-of select="Value"/>
                      </xsl:variable>


                      <tr>
                        <td align="left" colspan="1">
                          <font size="2">
                            <xsl:text>Row</xsl:text><xsl:value-of select="$rownum" />
                          </font>
                        </td>

                        <td align="left" colspan="2">
                          <INPUT type="text" name="arg{$argval}_{$rownum}" size="30" >
                             <xsl:attribute name="VALUE">
                               <xsl:value-of select="Value"/>
                             </xsl:attribute>
                          </INPUT>

                        </td>

                        <td colspan="1">
                        </td>
                      </tr>
                    </xsl:for-each>

                  </xsl:when>
                  <xsl:when test="ArgType='ArrayList'">
                   <tr>
                    <td align="left" colspan="1">
                      <font size="2">
                        <xsl:text>Empty ArrayList</xsl:text>
                      </font>
                    </td>

                    <td colspan="3">
                    </td>

                  </tr>
                  </xsl:when>
                  <xsl:when test="ArgType='Matrix2D'">
                   <tr>
                    <td align="left" colspan="1">
                      <font size="2">
                        <xsl:text>Empty Matrix2D</xsl:text>
                      </font>
                    </td>

                    <td colspan="3">
                    </td>
                  
                  </tr>
                  </xsl:when>

                  <xsl:otherwise>
                  <tr>
                    <td align="left" colspan="1">
                      <font size="2">
                        <xsl:value-of select="substring-before($argval,'-')" /> 
                      </font>
                    </td>

                    <td align="left" colspan="2">
                      <INPUT type="text" name="arg{$argval}" size="30">
                        <xsl:attribute name="VALUE">
                          <xsl:value-of select="ArgValue"/>
                        </xsl:attribute>
                      </INPUT>
                    </td>

                    <td colspan="1">
                    </td>

                  </tr>
                  </xsl:otherwise>
                </xsl:choose>  
               
              
              </xsl:for-each>

              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
                 <td colspan="2"><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>


               <tr>
                <td align="left" colspan="4">
                  <font size="3">
                    <b><xsl:text>Expected Result: </xsl:text></b>
                  </font>
                </td>
              </tr>

              <xsl:for-each select="/TC/PROBLEMS/TestCase/ExpectedResult">
                 <xsl:variable name="expval">
                   <xsl:choose>
                     <xsl:when test="ResultType='int' or ResultType='Integer'">Integer-1</xsl:when>
                     <xsl:when test="ResultType='double' or ResultType='Double'">Double-1</xsl:when>
                     <xsl:when test="ResultType='String' or ResultType='String'">String-1</xsl:when>
                     <xsl:when test="ResultType='float' or ResultType='Float'">Float-1</xsl:when>
                     <xsl:when test="ResultType='boolean' or ResultType='Boolean'">Boolean-1</xsl:when>
                     <xsl:when test="ResultType='long' or ResultType='Long'">Long-1</xsl:when>
                     <xsl:when test="ResultType='char' or ResultType='Character'">Character-1</xsl:when>
                     <xsl:when test="ResultType='ArrayList'">ArrayList-1</xsl:when>
                     <xsl:when test="ResultType='Matrix2D'">Matrix2D-1</xsl:when>
                   </xsl:choose>
                 </xsl:variable>

                 <tr>
                  <td colspan="4" ><img src="/images/spacer.gif" width="200" height="15" /></td> 
                </tr>
               
 
                <xsl:choose>
                  <xsl:when test='ArrayList'>
                    <tr>
                      <td align="left" colspan="4">
                        <font size="2">
                          <b><xsl:text>ArrayList arguments:</xsl:text></b>
                        </font>
                      </td>
                    </tr>


                    <xsl:for-each select="ArrayList">
                      <xsl:variable name="arrlisttype">
                        <xsl:choose>
                          <xsl:when test="ArrayListType='int' or ArrayListType='Integer'">Integer</xsl:when>
                          <xsl:when test="ArrayListType='double' or ArrayListType='Double'">Double</xsl:when>
                          <xsl:when test="ArrayListType='String' or ArrayListType='String'">String</xsl:when>
                          <xsl:when test="ArrayListType='float' or ArrayListType='Float'">Float</xsl:when>
                          <xsl:when test="ArrayListType='boolean' or ArrayListType='Boolean'">Boolean</xsl:when>
                          <xsl:when test="ArrayListType='long' or ArrayListType='Long'">Long</xsl:when>
                          <xsl:when test="ArrayListType='char' or ArrayListType='Character'">Character</xsl:when>
                        </xsl:choose>
                      </xsl:variable>

                      <xsl:variable name="pos">
                        <xsl:number value="position()" />
                      </xsl:variable>
                 
                      <tr>
                        <td align="left" colspan="1">
                          <font size="2">
                            <xsl:value-of select="$arrlisttype"/>
                          </font>
                        </td>

                        <td align="left" colspan="2">
                          <INPUT type="text" name="exp{$expval}_{$pos}" size="30">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="ArrayListValue"/>
                            </xsl:attribute>
                          </INPUT>
                        </td>

                        <td colspan="1">
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  
                  <xsl:when test='Matrix2D'>
                     <xsl:variable name="matrix2dtype">
                        <xsl:choose>
                          <xsl:when test="Matrix2DType='int' or Matrix2DType='Integer'">Integer</xsl:when>
                          <xsl:when test="Matrix2DType='double' or Matrix2DType='Double'">Double</xsl:when>
                          <xsl:when test="Matrix2DType='String' or Matrix2DType ='String'">String</xsl:when>
                          <xsl:when test="Matrix2DType='float' or Matrix2DType='Float'">Float</xsl:when>
                          <xsl:when test="Matrix2DType='boolean' or Matrix2DType='Boolean'">Boolean</xsl:when>
                          <xsl:when test="Matrix2DType='long' or Matrix2DType='Long'">Long</xsl:when>
                          <xsl:when test="Matrix2DType='char' or Matrix2DType='Character'">Character</xsl:when>
                        </xsl:choose>
                    </xsl:variable>

                    <tr>
                      <td align="left" colspan="4">
                        <font size="2">
                          <b><xsl:text>Matrix2D arguments:</xsl:text></b>
                        </font>
                      </td>
                    </tr>

                    <tr>
                        <td align="left" colspan="1">
                          <font size="2">
                            <xsl:text>Type - </xsl:text><xsl:value-of select="$matrix2dtype" />
                          </font>
                        </td>
                    </tr>

                    <tr>
                        <td align="left" colspan="4">
                          <font size="2">
                            <xsl:text>Please enter the row values separated by commas (no spaces).
                            </xsl:text>
                          </font>
                        </td>
                    </tr>



                    <xsl:for-each select="Matrix2D">
                      <xsl:variable name="rownum">
                        <xsl:number value="position()" />
                      </xsl:variable>

                      <xsl:variable name="rowval">
                        <xsl:value-of select="Value"/>
                      </xsl:variable>

                      <tr>
                        <td align="left" colspan="1">
                          <font size="2">
                            <xsl:text>Row</xsl:text><xsl:value-of select="$rownum" />
                          </font>
                        </td>

                        <td align="left" colspan="2">
                          <INPUT type="text" name="exp{$expval}_{$rownum}" size="30" >
                            <xsl:attribute name="VALUE">
                               <xsl:value-of select="Value"/>
                            </xsl:attribute>
                          </INPUT>
                        </td>

                        <td colspan="1">
                        </td>
                      </tr>
                    </xsl:for-each>

                  </xsl:when>
                  <xsl:otherwise>
                  <tr>
                    <td align="left" colspan="1">
                      <font size="2">
                        <xsl:value-of select="substring-before($expval,'-')" /> 
                      </font>
                    </td>

                    <td align="left" colspan="2">
                      <INPUT type="text" name="exp{$expval}" size="30">
                        <xsl:attribute name="VALUE">
                          <xsl:value-of select="ResultValue"/>
                        </xsl:attribute>
                      </INPUT>
                    </td>

                    <td colspan="1">
                    </td>

                  </tr>
                  </xsl:otherwise>
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
                <td colspan="2">
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
              <INPUT TYPE="HIDDEN" NAME="results">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/TC/PROBLEMS/TestCase/ProblemId"/>
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
