<jsp:include page="nocache.jsp" />
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.reg.servlet.*" %>
<jsp:useBean id="Registration" scope="session" class="com.topcoder.web.tc.controller.legacy.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.common.web.data.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />
<tc:getProperty id="coderType" name="Registration" property="CoderType" />

            <img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"><br>
            <form action="<%=response.encodeURL(Controller.ALIAS)%>" method="post" name="frmReg" >
              <input type="hidden" name="<%=Controller.STEP%>" value="<%=Registration.STEP_2%>" />

            <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">

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
        alert("Please choose a value for '"+qName.replace(/<br\/>/i, "\n")+"'.");
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

                <tr><td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Referral</td></tr>
                
                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="ReferralError" /></td>
                </tr>
                
                <tr valign="middle">
                    <td class="registerLabel">How did you learn about TopCoder?</td>
                    <td class="statText">
                   
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

<% if (Registration.getReferral().equals(Integer.toString(Registration.CAMPUS_JOB_FAIR_REFERRAL))) {%>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="ReferralSchoolStateError" /></td>
                </tr>

                <tr>
                <tc:getProperty id="referralSchoolState" name="Registration" property="ReferralSchoolState" />
                    <td class="registerLabel">Job Fair School State&nbsp;</td>
                    <td class="statText" align="left" valign="middle">
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
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="ReferralOtherError" /></td>
                </tr>
  
                <tr>
                <tc:getProperty id="referralSchool" name="Registration" property="ReferralOther" />
                    <td class="registerLabel">Job Fair School</td>
                    <td class="statText">
                <tc:schoolSelect name="<%=Registration.REFERRAL_OTHER%>" class="dropdown" state="<%=currentReferralSchoolState%>" selectedValue="<%=referralSchool%>" /></td>
                </tr>

<% } else { %>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="ReferralOtherError" /></td>
                </tr>
  
                <tr>
                    <td class="registerLabel">Details</td>
                    <td class="statText">&nbsp;<input type="text" name="<%=Registration.REFERRAL_OTHER%>" value ="<jsp:getProperty name="Registration" property="ReferralOther" />" size="30" maxlength="30" onFocus="if (this.value==<%=Registration.REFERRAL_OTHER%>Prompt['prompt'+this.form.<%=Registration.REFERRAL%>.options[this.form.<%=Registration.REFERRAL%>.selectedIndex].value]) this.value='';"><br></td>
                </tr>

<% } %>

                <tr valign="middle">
                    <td colspan="2" class="statText">&nbsp;</td>
                </tr>
  
                <tr valign="middle">
                    <td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Demographics</td>
                </tr>  

<% } // if (Registration.isRegister()) %>

<%if (coderType.equalsIgnoreCase(Registration.CODER_TYPE_STUDENT)) {%>

                <tr>
                    <td></td>
                    <td class="errorText"></td>
                </tr>
  
                <tr valign="middle">
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText">Please provide the following school information<br>Page will refresh with schools based upon the state you select.</td>
                </tr>
    
                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="SchoolStateError" /></td>
                </tr>
  
                <tr>
                    <tc:getProperty id="schoolState" name="Registration" property="SchoolState" />
                    <td class="registerLabel">School State</td>
                    <td class="statText">
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
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="SchoolError" /></td>
                </tr>
  
                <tr>
                    <tc:getProperty id="school" name="Registration" property="School" />
                    <td class="registerLabel">School</td>
                    <td class="statText"><tc:schoolSelect name="<%=Registration.SCHOOL%>" class="dropdown" state="<%=currentSchoolStateName%>" selectedValue="<%=school%>" /></td>
                </tr>
  
                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="GpaError" /></td>
                </tr>
                
                <tr>
                    <td class="registerLabel">GPA&nbsp;</td>
                    <td class="statText"><input type="text" name="<%=Registration.GPA%>" value ="<jsp:getProperty name="Registration" property="Gpa" />" size="5" maxlength="5"></td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="GpaScaleError" /></td>
                </tr>

                <tr>
                    <td class="registerLabel">GPA Scale</td>
                    <td class="statText">
                        <SELECT NAME="<%=Registration.GPA_SCALE%>">
                            <OPTION value=""></OPTION>
                            <OPTION value="4.00"<%=!Registration.getGpaScale().equals("")&&Float.parseFloat(Registration.getGpaScale())==4?" selected=\"true\"":""%>>4</OPTION>
                            <OPTION value="5.00"<%=!Registration.getGpaScale().equals("")&&Float.parseFloat(Registration.getGpaScale())==5?" selected=\"true\"":""%>>5</OPTION>
                        </SELECT>
                    </td>
                </tr>

<%}%>

                <tc:demographic coderType="<%=coderType%>" optional="<%=new Boolean(Registration.getDemographicDecline()).toString()%>" selectedValues="<%=Registration.getDemographics()%>" class="dropdown">
  
                <tr>
                    <td></td>
                    <td class="errorText"><%=Registration.getDemographicError(demographicQuestionId)%></td>
                </tr>

                <tr>
                    <td class="registerLabel" nowrap=""><%=demographicQuestion%>&nbsp;</td>
                    <td class="statText"><%=demographicAnswer%>&#160;<%=demographicDescription%></td>
                </tr>
  
                </tc:demographic>

                <tr valign="middle"><td colspan="2"><br/></td></tr>
            
                <tr valign="middle">
                    <td align="center" class="statText" colspan="2">
                        <input type="button" name="backButton" value="back" onclick="location='<%=response.encodeURL("index.jsp")%>';">&nbsp;&nbsp;
                        <input type="button" name="continueButton" onClick="if(checkInputs())reg.submit();" value="continue">
                    </td>
                </tr>   
            </table>
            
            </form>

