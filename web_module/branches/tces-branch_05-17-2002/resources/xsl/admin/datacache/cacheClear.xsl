<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>


<html>
<head>
<title>Cache Clear</title>

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
    <xsl:call-template name="Cache_LI"/>
  </xsl:when>
  <xsl:otherwise>  
    <xsl:call-template name="Cache_LO"/>
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
  


  
<FORM NAME="frmDataCache" METHOD="POST">
<INPUT TYPE="hidden" NAME="Task" VALUE=""/>
<INPUT TYPE="HIDDEN" NAME="Command" VALUE="Upload"/>

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

    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99"><b>Data Cache</b></font><br/> 
    <input type="radio" name="status" onclick="doClearCache()" value=""><font color="#ffffff">All Cached Data</font></input><br/>
    <input type="radio" name="status" onclick="doClearCache()" value="Contests"><font color="#ffffff">Contests</font></input><br/>
    <input type="radio" name="status" onclick="doClearCache()" value="Schools"><font color="#ffffff">Schools</font></input><br/>
    <input type="radio" name="status" onclick="doClearCache()" value="Countries"><font color="#ffffff">Countries</font></input><br/>
    <input type="radio" name="status" onclick="doClearCache()" value="States"><font color="#ffffff">States</font></input><br/>
  
</table>

<table cellspacing="0" cellpadding="0" border="0" >

  <tr>
    <td><img src="/images/spacer.gif" width="125" height="30" /></td>
    <td><img src="/images/spacer.gif" width="125" height="30" /></td>
  </tr>  
  
  <tr>
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doRetrieve()">retrieve records</a></font></td>
    <td><font face="arial, helvetica, verdana, sans-serif" size="2" color="#ffffff"><a href="JavaScript:doAdd()">add new record</a></font></td>
  </tr>

  <tr>
    <td solspan="2"><img src="/images/spacer.gif" height="7" /></td>
  </tr>


</table>

<SCRIPT TYPE="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var cache=document.frmDataCache

function doClearCache(cmd) {
   cache.Task.value = 'data_cache';
   cache.Command.value=cmd;
   cache.submit();
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
