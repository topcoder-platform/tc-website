<%@ page import="com.topcoder.web.corp.common.Constants,
                com.topcoder.shared.dataAccess.DataAccessConstants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<jsp:usebean id="searchResults" class="com.topcoder.web.corp.model.SearchModel" scope="request" />

<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    
    window.open('/corp/testing/?module=PopulateProblemDetail&roundProblemId='+id,name,cmd);
    return;
  }
</SCRIPT>

        <table  border="0" cellspacing="0" cellpadding="5" width="600" align="center" class="bodyText">
              <tr valign="middle">
                  <td colspan="6" class="bodyText" align=center>Search Results:##to##of <%= searchResults.getTotal()%>
                  </td>
              </tr>
        </table>

          <table  border="0" cellspacing="0" cellpadding="5" width="600" align="center" class="screeningFrame">
          <% ResultSetContainer results = searchResults.getResults();%>
              
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
              <rsc:iterator list="<%=results%>" id="resultRow">
              <tr>
                  <td class="screeningCellOdd" nowrap=nowrap><A href="/corp/testing/?module=PopulateCandidate&referrer=SearchResults&cid=<rsc:item row="<%=resultRow%>" name="user_id"/>"><rsc:item row="<%=resultRow%>" name="name"/></A></td>
                  <td class="screeningCellOdd"><A href="mailto:<rsc:item row="<%=resultRow%>" name="email_address"/>"><rsc:item row="<%=resultRow%>" name="email_address"/></A></td>
                  <td class="screeningCellOdd" align=center><rsc:item row="<%=resultRow%>" name="state"/></td>
                  <td class="screeningCellOdd" align=center><rsc:item row="<%=resultRow%>" name="country_name"/></td>
                  <td class="screeningCellOdd" align=center><rsc:item row="<%=resultRow%>" name="coder_type"/></td>
                  <td class="screeningCellOdd" align=center><rsc:item row="<%=resultRow%>" name="job"/></td>
                  <td class="screeningCellOdd" align=center><A href="javascript:getProblemDetail('<rsc:item row="<%=resultRow%>" name="session_round_id"/>,<rsc:item row="<%=resultRow%>" name="problem_id"/>');"><rsc:item row="<%=resultRow%>" name="problem_name"/></A></td>
                  <td class="screeningCellOdd" align=center><rsc:item row="<%=resultRow%>" name="start_date"/></td>
                  <td class="screeningCellOdd" align=center><rsc:item row="<%=resultRow%>" name="problem_time"/></td>
                  <td class="screeningCellOdd" align=center>
                    <object
                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                    codebase="http://fpdownload.macromedia.com"
                    document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                    width="80"
                    height="12"
                    id="tc_card"
                    align="middle">');
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="movie"
                    value="/i/corp/screeningRatingOdd.swf"/>
                    <param name="menu" value="false" />
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="preference" value="3" />
                    <param name="link" value="/corp/testing/?module=UpdatePreference&userId=<%=request.getUserPrincipal().getName()%>&cid=<rsc:item row="<%=resultRow%>" name="user_id"/>" />
                    <embed
                    src="/i/corp/screeningRatingOdd.swf"
                    menu="false"
                    quality="high"
                    bgcolor="#ffffff"
                    width="80"
                    height="12"
                    name="tc_card"
                    align="middle"
                    preference="3"
                    link="/corp/testing/?module=UpdatePreference&userId=7267401&cid=9102106" 
                    allowScriptAccess="sameDomain"
                    type="application/x-shockwave-flash"
                    pluginspage="http://www.macromedia.com/go/getflashplayer" />
                    </object>
                  </td>
                  <td class="screeningCellOdd" align=center><A href="">view</A></td>
                  <td class="screeningCellOdd" align=center><A href="">view</A></td>
              </tr>
              </rsc:iterator>
        </table>

          <table  border="0" cellspacing="0" cellpadding="0" width="600" align="center" class="screeningFrameNB">
              <tr valign="middle">
                  <td class="screeningCellOdd" align="center"><A href="">prev</a>&#160;&#160;|&#160;&#160;<A href="">next</A></td>
              </tr>
          </table>