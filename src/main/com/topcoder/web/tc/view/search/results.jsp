<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>

<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />

<% ResultSetContainer results = memberSearch.getResults();%>


<table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
  <tr valign="top">
      <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
          <form name="simpleSearch" method="get">


          <input type="hidden" name="t" value="search"/>
          <input type="hidden" name="c" value="simple_search"/>
          <input type="hidden" name="next" value=""/>



          <table border="0" cellspacing="0" cellpadding="3" width="100%">
              <tr valign="middle">
                  <td background="/i/steel_gray_bg.gif" colspan="7" class="statTextBig">Search Results:
                          &#160;&#160;<%=results.getStartRow()%>
                          to
                          <%=results.getEndRow()%>
                  </td>
              </tr>

              <tr valign="middle">
                  <td class="statText" height="16" colspan="7" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:document.simpleSearch.next.value='false';Javascript:document.simpleSearch.submit()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:document.simpleSearch.next.value='true';Javascript:document.simpleSearch.submit()\" class=\"statText\">next &gt;&gt;</a>":"&gt;&gt; next")%>
                  </td>
              </tr>

              <tr>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" height="18" width="20%">Handle</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="10%">Rating</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="center" width="5%">State</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="30%"># of Rated Events</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="30%">Last Date Competed</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
              </tr>

              <rsc:iterator list="<%=results%>" id="resultRow">
              <tr>
                  <td class="statText" valign="middle" height="13">
                      <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="user_id"/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                  </td>
                  <td class="statText" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="rating"/></td>
                  <td class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                  <td class="statText" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
                  <td class="statText" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
                  <td class="statText" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
                  <td class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
              </tr>
              </rsc:iterator>

              <tr><td colspan="7"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

              <tr valign="middle">
                  <td class="statText" height="16" colspan="7" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:document.simpleSearch.next.value='false';Javascript:document.simpleSearch.submit()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:document.simpleSearch.next.value='true';Javascript:document.simpleSearch.submit()\" class=\"statText\">next &gt;&gt;</a>":"&gt;&gt; next")%>
                  </td>
              </tr>

              <tr><td colspan="7"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
          </table>
          </form>
      </td>
  </tr>
</table>