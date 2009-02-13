<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.common.BaseServlet" %>
<%@ taglib uri="screening.tld" prefix="screen" %>

<HTML>
<HEAD>
<title>Topcoder | Technical Assessment Program Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

<SCRIPT language="JavaScript"><!--
function back() {
    history.back();
}
//--></SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes
              && navigator.mimeTypes["application/x-shockwave-flash"])
            ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
  var words = navigator.plugins["Shockwave Flash"].description.split(" ");
  for (var i = 0; i < words.length; ++i) {
    if (isNaN(parseInt(words[i])))
      continue;
    var MM_PluginVersion = words[i];
  }
  MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
} else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
           && (navigator.appVersion.indexOf("Win") != -1)) {
  document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');
  document.write('on error resume next \n');
  document.write('MM_FlashCanPlay = ( IsObject(CreateObject');
  document.write('("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
  document.write('</SCR' + 'IPT\> \n');
}
//-->
</SCRIPT>

</HEAD>
<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" scope="request" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% if (candidateInfo.isNew()) { %>
  <body onLoad="document.candidateSetupForm.emailAddress.focus()">
<% } else { %>
  <body>
<% } %>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="50%">
                <tr valign="top">
                    <td class="bodyText">

                        <% if("PopulateSession".equals(candidateInfo.getReferrer())) { %>
                          <h1 class="testHead">Create a New Session -
                        <%} else if("BuildCandidateList".equals(candidateInfo.getReferrer())) {%>
                          <h1 class="testHead">Candidate List -
                        <%}%>
                        <FONT COLOR="#000000">
                          <%if(candidateInfo.isNew()) { %>
                            Set up a Candidate
                          <%} else {%>
                            Candidate Info
                          <%}%>
                        </FONT>
                        </h1>
                    </td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="50%">
                <tr><screen:form name="candidateSetupForm" action="<%=sessionInfo.getServletPath()%>" method="GET">
                    <INPUT type="hidden" name="<%=Constants.MODULE_KEY%>" value="UpdateCandidate" />
                    <INPUT type="hidden" name="referrer" value="<jsp:getProperty name="candidateInfo" property="referrer" />" />
                    <td width="100%"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="3" width="50%" class="testFrame">
                <tr>
                    <td class="testTableTitle" colspan="3">Candidate</td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Email Address:</td>
                        <% if (candidateInfo.isNew()) { %>
                    <td class="testTableOdd"><input type="text" name="emailAddress" size="30" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                        <% } else { %>
                    <td class="testTableOdd"><jsp:getProperty name="candidateInfo" property="userName" /></td>
                        <% } %>
                    <td class="errorTextOdd"><screen:errors id="err" name="emailAddress" ><%=err%></screen:errors></td>
                </tr>

                    <% if (!candidateInfo.isNew()) { %>
                <tr>
                    <td class="testTableSubtitleEven">Password:</td>
                    <td class="testTableEven"><jsp:getProperty name="candidateInfo" property="password" /></td>
                    <td class="errorTextEven" align="left" valign="middle"></td>
                </tr>

                        <tr>
                            <td class="testTableSubtitleOdd" align=right>Preference Level:</td>
                            <td class="testTableOdd" valign=middle>
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
                    document.write(' <object ');
                    document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
                    document.write(' codebase="http://fpdownload.macromedia.com" ');
                    document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' id="tc_card" ');
                    document.write(' align="middle">');
                    document.write(' <param name="allowScriptAccess" value="sameDomain" />');
                    document.write(' <param name="movie" ');
                    document.write(' value="/i/corp/screeningRatingEven.swf?preference=<jsp:getProperty name="candidateInfo" property="preference" />&sendurl=/corp/testing/?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<jsp:getProperty name="candidateInfo" property="userId" />"/>');
                    document.write(' <param name="menu" value="false" />');
                    document.write(' <param name="quality" value="high" />');
                    document.write(' <param name="bgcolor" value="#ffffff" />');
                    document.write(' <embed ');
                    document.write(' src="/i/corp/screeningRatingEven.swf?preference=<jsp:getProperty name="candidateInfo" property="preference" />&sendurl=/corp/testing/?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<jsp:getProperty name="candidateInfo" property="userId" />" ');
                    document.write(' menu="false" ');
                    document.write(' quality="high" ');
                    document.write(' bgcolor="#ffffff" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' name="tc_card" ');
                    document.write(' align="middle" ');
                    document.write(' allowScriptAccess="sameDomain" ');
                    document.write(' type="application/x-shockwave-flash" ');
                    document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
                    document.write(' </object> ');
}
// -->
</SCRIPT>
                            </td>
                            <td class="errorTextOdd" align="left" valign="middle"></td>
                        </tr>
                    <% } %>



                <tr><td colspan="3"><img src="/i/corp/clear.gif" width="1" height="10" border="0" /></td></tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="50%">

                <% if (candidateInfo.isNew()) { %>
                 <tr><td><div align="center"><p class="button"><a href="JavaScript:document.candidateSetupForm.submit()" class="button">Save</a></p></div></td></tr>
                    <% } %>
            </table>

            </screen:form>

            <p></p>
            <%if(!candidateInfo.isNew()) { %>
            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr>
                    <td width="70%" class="testTableTitleSmall">Notes</td>
                    <td width="15%" align="center" class="testTableTitleSmall">Author</td>
                    <td width="15%" align="center" class="testTableTitleSmall">Date Created</td>
                </tr>

                <% if (candidateInfo.getNoteList().isEmpty()) { %>
                  <td colspan="3" align="center" class="testTableOdd">There are currently no notes for this candidate.</td>
                <% } else { boolean even = true; %>
                <screen:resultSetRowIterator id="row" list="<%=candidateInfo.getNoteList()%>">
                <tr>
                    <td <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><%=StringUtils.htmlEncode((String)row.getItem("text").getResultData())%></td>
                    <td align="center" <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><screen:resultSetItem row="<%=row%>" name="created_by" /></td>
                    <td align="center" <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><strong><screen:resultSetItem row="<%=row%>" name="create_date" /></strong></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
                <% } %>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="NoteCreate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="button">Add Note</screen:servletLink></p></div></td>
                </form></tr>
            </table>

            <p><br></p>
            <% } %>


        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
