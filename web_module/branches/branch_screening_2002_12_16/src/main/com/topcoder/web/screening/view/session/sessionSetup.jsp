<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Session Setup</TITLE>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript"><!--
function showEmail() {
    var size = "top=2,left=2,width=600,height=549,status=0";
    var name="graph";
    var id = document.sessionSetupForm.userId.options[sessionSetupForm.userId.selectedIndex].value;
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PreviewEmail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.CANDIDATE_ID%>='+id,name,size);
    return;
  }

function submitProfile() {
    document.sessionSetupForm.rp.value=<%=Constants.CREATE_PROFILE_PROCESSOR%>
    document.sessionSetupForm.submit()
}

function submitCandidate() {
    document.sessionSetupForm.rp.value=<%=Constants.CREATE_CANDIDATE_PROCESSOR%>
    document.sessionSetupForm.submit()
}

function submitSession() {
    document.sessionSetupForm.rp.value=<%=Constants.UPDATE_SESSION_PROCESSOR%>
    document.sessionSetupForm.submit()
}
//--></SCRIPT>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><img src="/i/ev/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Create a New Session</B></FONT>
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P><BR>
<jsp:useBean id="sessionInfo" type="com.topcoder.web.screening.model.SessionInfo" scope="session" />
<screen:form name="sessionSetupForm" action="<%=Constants.CONTROLLER_URL%>" method="POST">
        <input type="HIDDEN" name="rp" value="" >
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Test Profile</b>&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select value ="profileId">
                <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getProfileList()%>">
                <% if(sessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
              	<option value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="name" /></option>
                <% } else { %>
              	<option value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option>
                <% } %>
                </screen:resultSetRowIterator>
              </select>
              </TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<a name="profile" /><a href="javascript:submitProfile()">Create a New Test Profile</a></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Candidate</b>&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select name="userId">
                <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getCandidateList()%>">
                <% if(sessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
              	<option value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="handle" /></option>
                <% } else { %>
              	<option value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />"><screen:resultSetItem row="<%=row%>" name="handle" /></option>
                <% } %>
                </screen:resultSetRowIterator>
              </select>
              </TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<a name="candidate" /><a href="javascript:submitCandidate()">Add a Candidate</a></TD>
           </TR>
           <TR>
              <TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD><TD COLSPAN="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR>
              <TD COLSPAN="3" CLASS="bodyText" HEIGHT="15" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Begin Time</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Month&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select name="beginMonth">
              	<option>January</option>
              	<option>February</option>
              	<option>March</option>
              	<option>April</option>
              	<option>May</option>
              	<option>June</option>
              	<option>July</option>
              	<option>August</option>
              	<option>September</option>
              	<option>October</option>
              	<option>November</option>
              	<option>December</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Day&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select name="beginDay">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Year&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select name="beginYear">
              	<option>2003</option>
              	<option>2004</option>
              	<option>2005</option>
              	<option>2006</option>
              	<option>2007</option>
              	<option>2008</option>
              	<option>2009</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Hour&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select name="beginHour">
              	<option value="0">12AM</option>
              	<option value="1">1AM</option>
                <option value="2">2AM</option>
              	<option value="3">3AM</option>
                <option value="4">4AM</option>
                <option value="5">5AM</option>
              	<option value="6">6AM</option>
                <option value="7">7AM</option>
                <option value="8">8AM</option>
              	<option value="9">9AM</option>
                <option value="10">10AM</option>
              	<option value="11">11AM</option>
                <option value="12">12PM</option>
              	<option value="13">1PM</option>
                <option value="14">2PM</option>
              	<option value="15">3PM</option>
                <option value="16">4PM</option>
                <option value="17">5PM</option>
              	<option value="18">6PM</option>
                <option value="19">7PM</option>
                <option value="20">8PM</option>
              	<option value="21">9PM</option>
                <option value="22">10PM</option>
              	<option value="23">11PM</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD COLSPAN="3"><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="3" CLASS="bodyText" HEIGHT="15" VALIGN="middle" BGCOLOR="#CCCCCC"><b>End Time</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Month&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select name="endMonth">
              	<option value="1">January</option>
              	<option value="2">February</option>
              	<option value="3">March</option>
              	<option value="4">April</option>
              	<option value="5">May</option>
              	<option value="6">June</option>
              	<option value="7">July</option>
              	<option value="8">August</option>
              	<option value="9">September</option>
              	<option value="10">October</option>
              	<option value="11">November</option>
              	<option value="12">December</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Day&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select value ="endDay">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Year&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select value ="endYear">
              	<option>2003</option>
              	<option>2004</option>
              	<option>2005</option>
              	<option>2006</option>
              	<option>2007</option>
              	<option>2008</option>
              	<option>2009</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Hour&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <select name="endHour">
              	<option value="0">12AM</option>
              	<option value="1">1AM</option>
                <option value="2">2AM</option>
              	<option value="3">3AM</option>
                <option value="4">4AM</option>
                <option value="5">5AM</option>
              	<option value="6">6AM</option>
                <option value="7">7AM</option>
                <option value="8">8AM</option>
              	<option value="9">9AM</option>
                <option value="10">10AM</option>
              	<option value="11">11AM</option>
                <option value="12">12PM</option>
              	<option value="13">1PM</option>
                <option value="14">2PM</option>
              	<option value="15">3PM</option>
                <option value="16">4PM</option>
                <option value="17">5PM</option>
              	<option value="18">6PM</option>
                <option value="19">7PM</option>
                <option value="20">8PM</option>
              	<option value="21">9PM</option>
                <option value="22">10PM</option>
              	<option value="23">11PM</option>
              </select>
              </TD>
           </TR>
           <TR>
              <TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD><TD COLSPAN="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="90%">
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send candidate email reminder&#160;<input type="checkbox" name="candidateEmail" value="true">&#160;</TD>
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send me email reminder&#160;<input type="checkbox" name="repEmail" value="true">&#160;</TD>
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">To preview the email template <A HREF="JavaScript:showEmail()" CLASS="bodyText">click here</A>.</TD>
	        </TR>
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center"><a name="save" /><A HREF="javascript:submitSession()" CLASS="bodyText" >Save</A></TD>
           </TR>
         </TABLE>
</screen:form>
<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><img src="/i/ev/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
