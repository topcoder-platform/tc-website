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
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="previewEmail";
    var id = document.sessionSetupForm.cid.options[document.sessionSetupForm.cid.selectedIndex].value;
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PreviewEmail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.CANDIDATE_ID%>='+id,name,cmd);
    return;
  }

function submitProfile() {
    document.sessionSetupForm.rp.value="<%=Constants.CREATE_PROFILE_PROCESSOR%>";
    document.sessionSetupForm.submit();
}

function submitCandidate() {
    document.sessionSetupForm.rp.value="<%=Constants.CREATE_CANDIDATE_PROCESSOR%>";
    document.sessionSetupForm.submit();
}

function submitSession() {
    document.sessionSetupForm.rp.value="<%=Constants.CONFIRM_SESSION_PROCESSOR%>";
    document.sessionSetupForm.submit();
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
              <select name ="profileId">
                <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getProfileList()%>">
                <% if(sessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
                <option value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="name" /></option>
                <% } else { %>
                <option value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option>
                <% } %>
                </screen:resultSetRowIterator>
              </select>
              </TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<a name="profile" /><a href="JavaScript:submitProfile()">Create a New Test Profile</a></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Candidate</b>&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select name="cid">
                <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getCandidateList()%>">
                <% if(sessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
                <option value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="handle" /></option>
                <% } else { %>
                <option value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />"><screen:resultSetItem row="<%=row%>" name="handle" /></option>
                <% } %>
                </screen:resultSetRowIterator>
              </select>
              </TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<a name="candidate" /><a href="JavaScript:submitCandidate()">Add a Candidate</a></TD>
           </TR>
           <TR>
              <TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD><TD COLSPAN="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR>
              <TD COLSPAN="3" CLASS="bodyText" HEIGHT="15" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Begin Time</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Month&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:month name="beginMonth" selected="<%=sessionInfo.getBeginMonth()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="beginMonth" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Day&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:day name="beginDay" selected="<%=sessionInfo.getBeginDay()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="beginDay" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Year&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:year name="beginYear" selected="<%=sessionInfo.getBeginYear()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="beginYear" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Hour&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:hour name="beginHour" selected="<%=sessionInfo.getBeginHour()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="beginHour" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="3"><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="3" CLASS="bodyText" HEIGHT="15" VALIGN="middle" BGCOLOR="#CCCCCC"><b>End Time</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Month&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:month name="endMonth" selected="<%=sessionInfo.getEndMonth()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="endMonth" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Day&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:day name="endDay" selected="<%=sessionInfo.getEndDay()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="endDay" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Year&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <screen:year name="endYear" selected="<%=sessionInfo.getEndYear()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="endYear" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Hour&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">
              <screen:hour name="endHour" selected="<%=sessionInfo.getEndHour()%>" />
              </TD>
              <TD CLASS="errorText" ALIGN="left" VALIGN="middle"><screen:errors name="endHour" /></TD>
           </TR>
           <TR>
              <TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD><TD COLSPAN="2" class="errorText" align="left" valign="middle"><screen:errors name="dateCompare" /></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="90%">
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
          <TR>
           <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send candidate email reminder&#160;<input type="checkbox" name="candidateEmail" value="YES">&#160;</TD>
          </TR>
          <TR>
           <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send me email reminder&#160;<input type="checkbox" name="repEmail" value="YES">&#160;</TD>
          </TR>
          <TR>
           <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">To preview the email template <A HREF="JavaScript:showEmail()" CLASS="bodyText">click here</A>.</TD>
          </TR>
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center"><a name="save" /><A HREF="JavaScript:submitSession()" CLASS="bodyText" >Confirm</A></TD>
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
