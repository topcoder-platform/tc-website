<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<% ResultSetContainer results = memberSearch.getResults();%>
          <a name="data"/>
          <table border="0" cellspacing="0" cellpadding="4" width="510" align="center" class="formFrame">
              <tr valign="middle">
                  <td colspan="8" class="bodyText">Search Results:
                          &#160;&#160;<jsp:getProperty name="memberSearch" property="start"/>
                          to
                          <jsp:getProperty name="memberSearch" property="end"/>
                          of
                          <jsp:getProperty name="memberSearch" property="total"/>
                  </td>
              </tr>

              <tr valign="middle">
                  <td class="bodyText" height="16" colspan="8" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bodyText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bodyText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                  </td>
              </tr>

              <tr>
                  <td class="header" valign="middle" height="18" width="20%">Handle</td>
                  <td class="header" valign="middle" align="right" width="10%">Rating</td>
                  <td class="header" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                  <td class="header" valign="middle" align="center" width="5%">State</td>
                  <td class="header" valign="middle" align="center" width="10%">Country</td>
                  <td class="header" valign="middle" align="right" width="20%">Rated Events</td>
                  <td class="header" valign="middle" align="right" width="30%">Last Competition</td>
                  <td class="header" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
              </tr>

              <%boolean even = false;%>
              <rsc:iterator list="<%=results%>" id="resultRow">
              <tr>
                  <td class="<%=even?"formHandleOdd":"formHandleEven"%>" valign="middle" height="13">
                      <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="user_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                  </td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="rating"/></td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="country_name"/></td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
                  <td class="<%=even?"formTextOdd":"formTextEven"%>" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
              </tr>
              <%even=!even;%>
              </rsc:iterator>

              <tr><td colspan="8"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

              <tr valign="middle">
                  <td class="bodyText" height="16" colspan="8" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bodyText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bodyText\">next &gt;&gt;</a>":"&gt;&gt; next")%>
                  </td>
              </tr>

              <tr><td colspan="8"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
          </table>
