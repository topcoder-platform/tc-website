<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY); %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>

<tco10:pageSetup title="TCO 10 : Algorithm Competition Bracket" area="algorithm" menu="advancers" subMenu="bracket"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                    <h2 class="pageTitle">Congratulations Algorithm Semifinalists!</h2><!-- page title -->
                           <table cellpadding="0" cellspacing="0"><!-- Start table list -->
                                <tr>
                                    <th class="first" ><span class="left"></span>Semifinalists - Round 1 </th>
                                    <!-- table left top corner -->
                                    <th class="last"><span class="right">&nbsp;</span></th><!-- table right top corner -->
                            	</tr>
                            	<tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="10574855" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="251074" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22074135" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22629087" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="13351270" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22664173" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22051338" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22664457" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="261024" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="7428266" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22685656" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22696552" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                          </table>
                          <br />
                           <table cellpadding="0" cellspacing="0"><!-- Start table list -->
                                <tr>
                                    <th class="first" ><span class="left"></span>Semifinalists - Round 2 </th>
                                    <!-- table left top corner -->
                                    <th class="last"><span class="right">&nbsp;</span></th><!-- table right top corner -->
                            	</tr>
                            	<tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="19849563" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22692969" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                 </tr>
                                <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22689544" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="14886245" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22674179" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="10019533" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="21931437" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="7394165" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="20275376" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="22677785" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="7433858" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                                  <tr class="last">
                                      <td colspan="2"><tc-webtag:handle coderId="15152215" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                                  </tr>
                          </table>
                </div></div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
