<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<% ResultSetContainer results = memberSearch.getResults();%>
          <a name="data"/>
          <table  border="0" cellspacing="0" cellpadding="5" width="510" align="center" class="bodyText">
              <tr valign="middle">
                  <td colspan="6" class="bodyText">Search Results:
                          &#160;&#160;<jsp:getProperty name="memberSearch" property="start"/>
                          to
                          <jsp:getProperty name="memberSearch" property="end"/>
                          of
                          <jsp:getProperty name="memberSearch" property="total"/>
                  </td>
              </tr>
        </table>

          <table  border="0" cellspacing="0" cellpadding="5" width="510" align="center" class="formFrame">
              <tr>
                  <td class="searchHeaders" valign="middle" width="20%">Handle</td>
                  <td class="searchHeaders" valign="middle" align="right" width="15%">Algorithm<br /> Rating</td>
                  <td class="searchHeaders" valign="middle" align="center" width="12%">Design<br />Rating</td>
                  <td class="searchHeaders" valign="middle" align="center" width="12%">Development<br />Rating</td>
                  <td class="searchHeaders" valign="middle" align="center" width="15%">State</td>
                  <td class="searchHeaders" valign="middle" align="left" width="25%">Country</td>
                  <td class="searchHeaders" valign="middle" align="center" width="12%">Rated<br />Events</td>
                  <td class="searchHeaders" valign="middle" align="center" width="12%">Last<br />Event</td>
                  <%--<td class="searchHeaders" valign="middle" align="center" width="12%">School</td>--%>
              </tr>

              <%boolean even = false;%>
              <rsc:iterator list="<%=results%>" id="resultRow">
              <tr>
                  <td align="left" class="formHandleEven" valign="top" nowrap>
                      <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context="algorithm" darkBG="false"/>
                  </td>
                  <td class="formHandleEven" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="rating"/>&#160;&#160;</td>
                  <td class="formHandleEven" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="design_rating" format="#" ifNull="Unrated"/>&#160;&#160;</td>
                  <td class="formHandleEven" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="dev_rating" format="#" ifNull="Unrated"/>&#160;&#160;</td>
                  <td class="formHandleEven" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
                  <td class="formHandleEven" valign="middle" align="left" nowrap><rsc:item row="<%=resultRow%>" name="country_name"/></td>
                  <td class="formHandleEven" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="num_ratings"/>&#160;&#160;&#160;&#160;&#160;&#160;</td>
                  <td class="formHandleEven" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
                  <%--<td class="formHandleEven" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="school_name" ifNull="N/A"/></td>--%>
              </tr>
              <%even=!even;%>
              </rsc:iterator>
        </table>

          <table  border="0" cellspacing="0" cellpadding="5" width="510" align="center" class="bodyText">
              <tr valign="middle">
                  <td class="bodyText" colspan="6" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bodyText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bodyText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                  </td>
              </tr>
          </table>
