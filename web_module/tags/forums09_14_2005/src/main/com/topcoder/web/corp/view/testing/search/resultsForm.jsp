<%@ page import="com.topcoder.web.corp.common.Constants,
                com.topcoder.shared.dataAccess.DataAccessConstants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<jsp:useBean id="searchResults" class="com.topcoder.web.corp.model.SearchModel" scope="request" />

<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";

    window.open('/corp/testing?module=PopulateProblemDetail&roundProblemId='+id,name,cmd);
    return;
  }
</SCRIPT>
<% ResultSetContainer results = searchResults.getResults();%>
<script language="JavaScript"><!--
  function next() {
    document.searchForm.<%=DataAccessConstants.START_RANK%>.value=<%=results.getStartRow()+Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.<%=DataAccessConstants.END_RANK%>.value=<%=results.getEndRow()+Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.submit();
  }
  function previous() {
    document.searchForm.<%=DataAccessConstants.START_RANK%>.value=<%=results.getStartRow()-Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.<%=DataAccessConstants.END_RANK%>.value=<%=results.getEndRow()-Constants.SEARCH_SCROLL_SIZE%>;
    document.searchForm.submit();
  }
//--></script>

        <table  border="0" cellspacing="0" cellpadding="5" width="700" align="center" class="bodyText">
              <tr valign="middle">
                  <td colspan="6" class="bodyText" align=center>Search Results:<%=searchResults.getStart()%> to <%=searchResults.getEnd()%> of <%= searchResults.getTotal()%>
                  </td>
              </tr>
        </table>

          <table  border="0" cellspacing="0" cellpadding="5" width="700" align="center" class="screeningFrame">


              <tr>
                  <td class="screeningHeader" valign="middle" width="50%">Name</td>
                  <td class="screeningHeader" valign="middle">Email</td>
                  <td class="screeningHeader" valign="middle" align=center>State /<br/>Province</td>
                  <td class="screeningHeader" valign="middle" align=center>Country</td>
                  <td class="screeningHeader" valign="middle" align=center>Type</td>
                  <td class="screeningHeader" valign="middle" align=center>Position</td>
                  <td class="screeningHeader" valign="middle" align=center>Problem</td>
                  <td class="screeningHeader" valign="middle" align=center>Date</td>
                  <td class="screeningHeader" valign="middle" align=center>Time</td>
                  <td class="screeningHeader" valign="middle" align=center>Preference<br/>Level</td>
                  <td class="screeningHeader" valign="middle" align=center>Notes</td>
                  <td class="screeningHeader" valign="middle" align=center>Results</td>
              </tr>
                <%
                    int counter = 0;
                    String[] cssClasses = {"screeningCellOdd", "screeningCellEven"};
                    String[] swfFiles = {"/i/corp/screeningRatingOdd.swf", "/i/corp/screeningRatingEven.swf"};
                %>

              <rsc:iterator list="<%=results%>" id="resultRow">
              <tr>
                  <td class="<%=cssClasses[counter % 2]%>" nowrap=nowrap><A href="/corp/testing?module=PopulateCandidate&referrer=SearchResults&cid=<rsc:item row="<%=resultRow%>" name="user_id"/>"><rsc:item row="<%=resultRow%>" name="name"/></A></td>
                  <td class="<%=cssClasses[counter % 2]%>"><A href="mailto:<rsc:item row="<%=resultRow%>" name="email_address"/>"><rsc:item row="<%=resultRow%>" name="email_address"/></A></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center><rsc:item row="<%=resultRow%>" name="state"/></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center><rsc:item row="<%=resultRow%>" name="country_name"/></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center><rsc:item row="<%=resultRow%>" name="coder_type"/></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center nowrap=nowrap><rsc:item row="<%=resultRow%>" name="job"/></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center><A href="javascript:getProblemDetail('<rsc:item row="<%=resultRow%>" name="session_round_id"/>,<rsc:item row="<%=resultRow%>" name="problem_id"/>');"><rsc:item row="<%=resultRow%>" name="problem_name"/></A></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center nowrap=nowrap><rsc:item row="<%=resultRow%>" format="MM/dd/yyyy z" name="start_date" timeZone="timezone_desc"/></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center><rsc:item row="<%=resultRow%>" name="problem_time"/></td>
                  <td class="<%=cssClasses[counter % 2]%>" align=center>
                    <object
                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                    codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                    width="80"
                    height="12"
                    id="tc_card"
                    align="middle">
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="movie"
                    value="<%=swfFiles[counter % 2]%>?preference=<rsc:item row="<%=resultRow%>" name="preference"/>&sendurl=/corp/testing?module=UpdatePreference&userId=<%=searchResults.getUserId()%>&cid=<rsc:item row="<%=resultRow%>" name="user_id"/>"/>
                    <param name="menu" value="false" />
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <embed
                    src="<%=swfFiles[counter % 2]%>?preference=<rsc:item row="<%=resultRow%>" name="preference"/>&sendurl=/corp/testing?module=UpdatePreference&userId=<%=searchResults.getUserId()%>&cid=<rsc:item row="<%=resultRow%>" name="user_id"/>"
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
                  <td class="<%=cssClasses[counter % 2]%>" align=center><A href="/corp/testing?module=PopulateCandidate&referrer=SearchResults&cid=<rsc:item row="<%=resultRow%>" name="user_id"/>"><rsc:item row="<%=resultRow%>" name="note_text"/></A></td>
                  <td class="<%=cssClasses[counter++ % 2]%>" align=center><A href="/corp/testing?module=TestResults&referrer=SearchResults&sid=<rsc:item row="<%=resultRow%>" name="session_id"/>"><rsc:item row="<%=resultRow%>" name="problem_text"/></A></td>
              </tr>
              </rsc:iterator>
        </table>

          <table  border="0" cellspacing="0" cellpadding="0" width="700" align="center" class="screeningFrameNB">
              <tr valign="middle">
                  <td class="screeningCellOdd" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" >&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" >next &gt;&gt;</a>":"next &gt;&gt;")%>
                  </td>
              </tr>
          </table>