<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />
<% ResultSetContainer results = memberSearch.getResults();%>

<html>

<head>

<title>Member Search Results at TopCoder</title>

<jsp:include page="../script.jsp"/>

<script language="JavaScript"><!--
  function next() {
    document.simpleSearch.<%=DataAccessConstants.START_RANK%>.value=<%=results.getStartRow()+Constants.SEARCH_SCROLL_SIZE%>;
    document.simpleSearch.<%=DataAccessConstants.END_RANK%>.value=<%=results.getEndRow()+Constants.SEARCH_SCROLL_SIZE%>;
    document.simpleSearch.submit();
  }
  function previous() {
    document.simpleSearch.<%=DataAccessConstants.START_RANK%>.value=<%=results.getStartRow()-Constants.SEARCH_SCROLL_SIZE%>;
    document.simpleSearch.<%=DataAccessConstants.END_RANK%>.value=<%=results.getEndRow()-Constants.SEARCH_SCROLL_SIZE%>;
    document.simpleSearch.submit();
  }
//--></script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%">
            <jsp:include page="../body_top.jsp" >
                <jsp:param name="image" value="statistics"/>
                <jsp:param name="image1" value="steelblue"/>
                <jsp:param name="title" value="Member Search Results"/>
            </jsp:include>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
              <tr valign="top">
                  <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                      <form name="simpleSearch" method="get">
                      <input type="hidden" name="module" value="SimpleSearch"/>
                      <input type="hidden" name=<%=DataAccessConstants.START_RANK%> value=""/>
                      <input type="hidden" name=<%=DataAccessConstants.END_RANK%> value=""/>
                      <input type="hidden" name=<%=Constants.HANDLE%> value="<jsp:getProperty name="memberSearch" property="handle"/>"/>
          <table border="0" cellspacing="0" cellpadding="3" width="100%">
              <tr valign="middle">
                  <td background="/i/steel_gray_bg.gif" colspan="8" class="statTextBig">Search Results:
                          &#160;&#160;<jsp:getProperty name="memberSearch" property="start"/>
                          to
                          <jsp:getProperty name="memberSearch" property="end"/>
                          of
                          <jsp:getProperty name="memberSearch" property="total"/>
                  </td>
              </tr>

              <tr valign="middle">
                  <td class="statText" height="16" colspan="8" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                  </td>
              </tr>

              <tr>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" height="18" width="20%">Handle</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="10%">Rating</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="center" width="5%">State</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="center" width="10%">Country</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="20%"># of Rated Events</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="30%">Last Date Competed</td>
                  <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
              </tr>

              <rsc:iterator list="<%=results%>" id="resultRow">
              <tr>
                  <td class="statText" valign="middle" height="13">
                      <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="user_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                  </td>
                  <td class="statText" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="rating"/></td>
                  <td class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
                  <td class="statText" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="state_code"/></td>
                  <td class="statText" valign="middle" align="center"><rsc:item row="<%=resultRow%>" name="country_name"/></td>
                  <td class="statText" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="num_ratings"/></td>
                  <td class="statText" valign="middle" align="right"><rsc:item row="<%=resultRow%>" name="last_competed" format="MM.dd.yyyy" ifNull="N/A"/></td>
                  <td class="statText" valign="middle" align="right" width="3"><img src="/i/clear.gif" alt="" width="3" height="1" border="0"/></td>
              </tr>
              </rsc:iterator>

              <tr><td colspan="8"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>

              <tr valign="middle">
                  <td class="statText" height="16" colspan="8" align="center">
                    <%=(results.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(results.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"&gt;&gt; next")%>
                  </td>
              </tr>

              <tr><td colspan="8"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
          </table>
          </form>
                  </td>
              </tr>
            </table>
        </td>


<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>


