<%@ include file="nocache.jsp" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<%@ page import="com.topcoder.web.reg.servlet.*" %>
<jsp:useBean id="Registration" scope="session" class="com.topcoder.web.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.ejb.AuthenticationServices.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />
<jsp:setProperty name="Registration" property="Step" value="<%=Registration.STEP_2%>" />
<tc:getProperty id="coderType" name="Registration" property="CoderType" />
  <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
  <form action="<%=response.encodeURL(Controller.ALIAS)%>" method="post" name="frmReg" >
<SCRIPT type="text/javascript">
var reg;
var focusSet=false;
function checkInputs(){
  for(i=0;i<reg.elements.length;i++){
    var q = reg.elements[i];
    if(
      (q.type=="select-one"
      ||q.type=="select-multiple")
      &&q.name.substring(0,<%=Registration.DEMO_PREFIX.length()%>)=="<%=Registration.DEMO_PREFIX%>"
    ){
      qName=lookupText(q.name.substring(<%=Registration.DEMO_PREFIX.length()%>));
      if(
        qName!=""
        && (
          (q.type=="select-one"&&q.selectedIndex==0)
          ||(q.type=="select-multiple"&&q.selectedIndex==-1)
        )
      ){
        alert("Please choose a value for '"+brToSlashN(qName)+"'.");
        q.focus();
        return false;
      }
    }
  }
  return true;
}
function lookupText(qId){
  for(j=0;j<reg.elements.length;j++){
    var e = reg.elements[j];
    if(
      e.type=="hidden"
      &&e.name.substring(0,<%=Registration.DESC_PREFIX.length()%>)=="<%=Registration.DESC_PREFIX%>"
      &&e.name.substring(<%=Registration.DESC_PREFIX.length()%>)==qId
    ){
      return e.value;
    }
  }
  return "";
}
function brToSlashN(text) {
  text.replace(/<br\/>/i, "\n");
  return text;
}
</SCRIPT>
    <SCRIPT type="text/javascript">reg=window.document.frmReg;</SCRIPT>
    <input type="hidden" name="<%=Controller.TASK%>" value="Registration">  
<% if (Registration.isRegister()) { %>
    <%-- move this to <head></head> --%>
    <script type="text/javascript">
    var <%=Registration.REFERRAL_OTHER%>Prompt=new Object();
    <%for (int i=0;i<Registration.REFERRAL_ID.length;i++) {%>
    <%=Registration.REFERRAL_OTHER%>Prompt.prompt<%=Registration.REFERRAL_ID[i]%> = '<%=Registration.getReferralOtherPrompt(Registration.REFERRAL_ID[i])%>';
    <%}%>
    </script>
  <tr valign="middle">
    <td class="statText" width="150" align="right" valign="middle">
      <img src="/i/clear.gif" width="150" height="2" border="0">
    </td>
    <td colspan="2" class="statText"  align="left" valign="middle"><b>How did you learn about TopCoder?</b></td>
  </tr>
    <tr valign="middle">
        <td></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ReferralError" /></td>
    </tr>
  <tr>
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td colspan="2" class="statText" align="left" valign="middle">
        <tc:getProperty id="referral" name="Registration" property="Referral" />
        <%
        String referralSelectOnChange;
        if (Registration.getReferral().equals(Integer.toString(Registration.CAMPUS_JOB_FAIR_REFERRAL)))
            referralSelectOnChange = "this.form.submit();";
        else
            referralSelectOnChange = "if (this.options[this.selectedIndex].value=='"+Registration.CAMPUS_JOB_FAIR_REFERRAL+"') this.form.submit(); else this.form."+Registration.REFERRAL_OTHER+".value="+Registration.REFERRAL_OTHER+"Prompt['prompt'+this.options[this.selectedIndex].value];";
        %>
        <tc:referralSelect name="<%=Registration.REFERRAL%>" class="dropdown" optional="<%=new Boolean(Registration.getDemographicDecline()).toString()%>" selectedValue="<%=referral%>" onChange="<%=referralSelectOnChange%>" />
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="3" class="statText" valign="middle" background="/i/steel_bluebv_bg.gif" height="18">&nbsp;<b>Details</b></td>
  </tr>
<% if (Registration.getReferral().equals(Integer.toString(Registration.CAMPUS_JOB_FAIR_REFERRAL))) {%>
    <tr>
        <td></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ReferralSchoolStateError" /></td>
    </tr>
  <tr>


        <tc:getProperty id="referralSchoolState" name="Registration" property="ReferralSchoolState" />
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif">Job Fair School State&nbsp;</td>
    <td colspan="2" class="statText" align="left" valign="middle">
        <%
        //String currentReferralSchoolState = request.getParameter(Registration.REFERRAL_SCHOOL_STATE)==null?(referralSchoolState.length()==0?Registration.getStateName(Registration.getState()):referralSchoolState):request.getParameter(Registration.REFERRAL_SCHOOL_STATE);    
        String currentReferralSchoolState = null;
        String currentReferralSchoolStateName = null;
        if ( request.getParameter(Registration.REFERRAL_SCHOOL_STATE)==null ) {
          if ( referralSchoolState.length()==0 ) {
            currentReferralSchoolState = Registration.getState();
            currentReferralSchoolStateName = Registration.getStateName(currentReferralSchoolState);
          } else {
            currentReferralSchoolState = referralSchoolState;
            currentReferralSchoolStateName = Registration.getStateName(currentReferralSchoolState);
          }
        } else {
          currentReferralSchoolState = request.getParameter(Registration.REFERRAL_SCHOOL_STATE);
          currentReferralSchoolStateName = Registration.getStateName(currentReferralSchoolState);
        }
        %>
        <tc:stateSelect name="<%=Registration.REFERRAL_SCHOOL_STATE%>" class="dropdown" onChange="this.form.submit();" selectedValue="<%=currentReferralSchoolState%>" /></td>
  </tr>
    <tr>
        <td></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ReferralOtherError" /></td>
    </tr>
  <tr>
        <tc:getProperty id="referralSchool" name="Registration" property="ReferralOther" />
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif">Job Fair School&nbsp;</td>
    <td colspan="2" class="statText" align="left" valign="middle">
        <tc:schoolSelect name="<%=Registration.REFERRAL_OTHER%>" class="dropdown" state="<%=currentReferralSchoolState%>" selectedValue="<%=referralSchool%>" /></td>
  </tr>
<% } else { %>
    <tr>
        <td></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ReferralOtherError" /></td>
    </tr>
  <tr>
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>&nbsp;</b></td>
    <td colspan="2" class="statText" align="left" valign="middle">&nbsp;<input type="text" name="<%=Registration.REFERRAL_OTHER%>" value ="<jsp:getProperty name="Registration" property="ReferralOther" />" size="30" maxlength="30" onFocus="if (this.value==<%=Registration.REFERRAL_OTHER%>Prompt['prompt'+this.form.<%=Registration.REFERRAL%>.options[this.form.<%=Registration.REFERRAL%>.selectedIndex].value]) this.value='';"><br></td>
  </tr>
<% } %>
  <tr valign="middle">
    <td colspan="3" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td colspan="3" class="statText" valign="middle" background="/i/steel_bluebv_bg.gif" height="18">Demographics&nbsp;</td>
  </tr>  
<% } // if (Registration.isRegister()) %>







<%if (coderType.equalsIgnoreCase(Registration.CODER_TYPE_STUDENT)) {%>
  <tr valign="middle">
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td>
    <td colspan="2" class="statText"  align="right" valign="middle"><hr noshadow size="1" color="#666666"></td>
  </tr>
  <tr valign="middle">
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td>
    <td colspan="2" class="statText"  align="left" valign="middle">Please provide the following school information<br>Page will refresh with schools based upon the state you select.</td>
  </tr>
    <tr>
        <td></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="SchoolStateError" /></td>
    </tr>
  <tr>
        <tc:getProperty id="schoolState" name="Registration" property="SchoolState" />
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif">School State&nbsp;</td>
    <td colspan="2" class="statText" align="left" valign="middle">
        <%
        //String currentSchoolState = request.getParameter(Registration.SCHOOL_STATE)==null?(schoolState.length()==0?Registration.getStateName(Registration.getState()):schoolState):request.getParameter(Registration.SCHOOL_STATE);    
        String currentSchoolState = "";
        String currentSchoolStateName = "";
        if ( request.getParameter(Registration.SCHOOL_STATE)==null ) {
          if ( schoolState.length()==0 ) {
            currentSchoolState = Registration.getState(); 
            currentSchoolStateName = Registration.getStateName(currentSchoolState);
          } else {
            currentSchoolState = schoolState;
            currentSchoolStateName = Registration.getStateName(currentSchoolState);
          }
        } else {
          currentSchoolState = request.getParameter(Registration.SCHOOL_STATE);    
          currentSchoolStateName = Registration.getStateName(currentSchoolState); 
        }
        %>
        <tc:stateSelect name="<%=Registration.SCHOOL_STATE%>" class="dropdown" onChange="this.form.submit();" selectedValue="<%=currentSchoolState%>" />
    </td>
  </tr>
    <tr>
        <td></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="SchoolError" /></td>
    </tr>
  <tr>
        <tc:getProperty id="school" name="Registration" property="School" />
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif">School&nbsp;</td>
    <td colspan="2" class="statText" align="left" valign="middle">
        <tc:schoolSelect name="<%=Registration.SCHOOL%>" class="dropdown" state="<%=currentSchoolStateName%>" selectedValue="<%=school%>" />
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
  </tr>

<%}%>



<tc:demographic coderType="<%=coderType%>" optional="<%=new Boolean(Registration.getDemographicDecline()).toString()%>" selectedValues="<%=Registration.getDemographics()%>" class="dropdown">
  <tr>
    <td></td><td colspan="2" class="errorText" align="left" valign="middle"><%=Registration.getDemographicError(demographicQuestionId)%></td>
  </tr>

  <tr>
    <td class="statText" align="right" valign="middle" background="/i/steel_gray_bg.gif" nowrap=""><%=demographicQuestion%>&nbsp;</td>
    <td colspan="2" class="statText" align="left" valign="middle"><%=demographicAnswer%>&#160;<%=demographicDescription%></td>
  </tr>
  <tr valign="middle">
    <td colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
  </tr>
</tc:demographic>


    <tr align="right" valign="middle">
      <td colspan="3"><br/></td>
    </tr>
    <tr align="right" valign="middle">
        <td align="right" valign="middle" class="statText"><input type="button" name="backButton" value="&lt; back ]" onclick="location='<%=response.encodeURL("index.jsp")%>';"></td>
        <td colspan="2" align="left" valign="middle" class="statText"><input type="button" name="continueButton" onClick="if(checkInputs())reg.submit();" value="[ continue &gt;"></td>
    </tr>   
  </table>
  </td>
  </form>
