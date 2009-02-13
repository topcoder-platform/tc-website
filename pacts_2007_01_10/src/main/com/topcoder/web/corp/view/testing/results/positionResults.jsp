<%@ page import="java.util.List,com.topcoder.web.corp.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.common.JSPUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>
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

<script type="text/javascript" language="Javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";

    <% String url = "/corp/testing?" + Constants.MODULE_KEY + "=PopulateProblemDetail"; %>
    window.open('<%=url%>&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
//-->
</script>

</HEAD>
<body>

<!-- Header begins -->
<%--<jsp:include page="../includes/top.jsp" />--%>
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<!-- Sort the list of results by desired column if required -->
<%
    ResultSetContainer results = (ResultSetContainer) request.getAttribute(Constants.POSITION_RESULTS_LIST);

    int startIndex = 0;

    try {
        startIndex = Integer.parseInt((String) request.getAttribute(Constants.PAGE_START_INDEX));
    } catch(Exception e) {
        startIndex = 0;
    }

    if (startIndex >= results.size() || startIndex < 0) {
        startIndex = 0;
    }

    String sortBy = (String) request.getAttribute(Constants.SORT_BY);
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <%
                            List info = (List) request.getAttribute(Constants.POSITION_INFO);
                            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) info.get(0);
                        %>
                        <p><span class=testHead>Position Results</span><br/>
                        <%=row.getStringItem("company_name")%><br/>
                        Campaign Name: <%=row.getStringItem("campaign_name")%><br/>
                        Position Name: <%=row.getStringItem("job_desc")%><br/>
                        Demographics: <a href="?<%=Constants.MODULE_KEY%>=Demographics&<%=Constants.CAMPAIGN_ID%>=<%=row.getIntItem("campaign_id")%>">view</a><br/>
                        </p>
                    </td>
                </tr>
            </table>

            <br/>

            <%
                info = (List) request.getAttribute(Constants.POSITION_RESULTS_LIST);
            %>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">Total Candidates: <b><%= info.size()%></b></td>

                    <td class="bodyText" align=right>Showing <%=startIndex + 1%>-<%=startIndex
                        + Math.min(info.size() -  startIndex,Constants.SEARCH_SCROLL_SIZE)%>:&#160;&#160;&#160;
                    <%
                        if (startIndex > 0) {
                    %>
                    <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=0&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%><%=sortBy == null ? "" : "&" + Constants.SORT_BY + "=" + sortBy%>">
                        First
                    </A>
                    |
                    <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex - Constants.SEARCH_SCROLL_SIZE%>&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%><%=sortBy == null ? "" : "&" + Constants.SORT_BY + "=" + sortBy%>">
                        Prev <%=Math.min(startIndex, Constants.SEARCH_SCROLL_SIZE)%>
                    </A>
                    <%  } %>

                    <%
                        if (startIndex + Constants.SEARCH_SCROLL_SIZE < info.size()) {
                    %>
                    | <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex + Constants.SEARCH_SCROLL_SIZE%>&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%><%=sortBy == null ? "" : "&" + Constants.SORT_BY + "=" + sortBy%>">
                        Next <%=Math.min(info.size() - startIndex - Constants.SEARCH_SCROLL_SIZE,Constants.SEARCH_SCROLL_SIZE)%>
                      </a>
                    |
                    <%
                        int end = info.size() - (info.size() % Constants.SEARCH_SCROLL_SIZE);
                    %>
                    <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=end-1%>&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%><%=sortBy == null ? "" : "&" + Constants.SORT_BY + "=" + sortBy%>">
                        Last
                      </a>
                    <%  } %>
                    </td>
                </tr>
            </table>

            <br/>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=name_sort&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            Name
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=state_sort&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            State/<br/>Province
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=country_name&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            Country
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=coder_type&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            Type
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=problem_name&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            Problem
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=status_sort&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            Status
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=problem_time&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                            Time
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=status_sort&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">
                           Test<br/>Results</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=preference&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">Preference<br/>Level</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=resume_sort&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">Resume</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=note_text&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%>">Notes</A>
                    </td>
                </tr>

                <%
                    int counter = 0;
                    String[] cssClasses = {"screeningCellOdd", "screeningCellEven"};
                    String[] swfFiles = {"/i/corp/screeningRatingOdd.swf", "/i/corp/screeningRatingEven.swf"};

                    for (int i = startIndex; i < startIndex + Constants.SEARCH_SCROLL_SIZE && i < info.size(); i++) {
                        row = (ResultSetContainer.ResultSetRow) info.get(i);
                %>

                <tr>

                    <td class='<%=cssClasses[counter % 2]%>' nowrap=nowrap>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.POPULATE_CANDIDATE_PROCESSOR%>&cid=<%=row.getStringItem("user_id")%>'>
                            <%=row.getStringItem("name")%>
                        </A>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>'>
                        <%=row.getStringItem("state")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' nowrap=nowrap>
                        <%=row.getStringItem("country_name")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <%=row.getStringItem("coder_type")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>'>
                        <A href="JavaScript:getProblemDetail('<%=row.getStringItem("session_round_id")%>,<%=row.getStringItem("problem_id")%>')">
                            <%=row.getStringItem("problem_name")%>
                        </A>
                    </td>
                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <%=row.getStringItem("component_status")%>
                    </td>
                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <%=row.getStringItem("problem_time")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=TestResults&<%=Constants.SESSION_ID%>=<%=row.getStringItem("session_id")%>'>
                            <%=row.getStringItem("problem_text")%>
                        </A>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <object
                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                        width="80"
                        height="12"
                        id="tc_card"
                        align="middle">
                        <param name="allowScriptAccess" value="sameDomain" />
                        <param name="movie"
                        value="<%=swfFiles[counter % 2]%>?preference=<%=row.getStringItem("preference")%>&sendurl=/corp/testing?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<%=row.getStringItem("user_id")%>"/>
                        <param name="menu" value="false" />
                        <param name="quality" value="high" />
                        <param name="bgcolor" value="#ffffff" />
                        <embed
                        src="<%=swfFiles[counter % 2]%>?preference=<%=row.getStringItem("preference")%>&sendurl=/corp/testing?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<%=row.getStringItem("user_id")%>"
                        menu="false"
                        quality="high"
                        bgcolor="#ffffff"
                        width="80"
                        height="12"
                        name="tc_card"
                        align="middle"
                        allowScriptAccess="sameDomain"
                        type="application/x-shockwave-flash"
                        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                        </object>
                    </td>
                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=DownloadResume&<%=Constants.USER_ID%>=<%=row.getStringItem("user_id")%>'><%=row.getStringItem("resume_text")%></A>
                    </td>
                    <td class='<%=cssClasses[counter++ % 2]%>' align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.POPULATE_CANDIDATE_PROCESSOR%>&<%=Constants.CANDIDATE_ID%>=<%=row.getStringItem("user_id")%>'>
                            <%=row.getStringItem("note_text")%>
                        </A>
                    </td>

                </tr>
                <%
                    }
                %>

            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" align=right>Showing <%=startIndex + 1%>-<%=startIndex
                        + Math.min(info.size() -  startIndex,Constants.SEARCH_SCROLL_SIZE)%>:&#160;&#160;&#160;
                    <%
                        if (startIndex > 0) {
                    %>
                    <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex - Constants.SEARCH_SCROLL_SIZE%>&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%><%=sortBy == null ? "" : "&" + Constants.SORT_BY + "=" + sortBy%>">
                        Prev <%=Math.min(startIndex, Constants.SEARCH_SCROLL_SIZE)%>
                    </A>
                    <%  } %>

                    <%
                        if (startIndex + Constants.SEARCH_SCROLL_SIZE < info.size()) {
                    %>
                    | <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex + Constants.SEARCH_SCROLL_SIZE%>&<%=Constants.JOB_POSITION_ID%>=<%=request.getAttribute(Constants.JOB_POSITION_ID)%><%=sortBy == null ? "" : "&" + Constants.SORT_BY + "=" + sortBy%>">
                        Next <%=Math.min(info.size() - startIndex - Constants.SEARCH_SCROLL_SIZE,Constants.SEARCH_SCROLL_SIZE)%>
                      </a>
                    <%  } %>
                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
