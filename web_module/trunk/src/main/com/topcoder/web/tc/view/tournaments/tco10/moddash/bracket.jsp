<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY); %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>

<tco10:pageSetup title="TCO 10 : Mod Dash Bracket" area="moddash" menu="advancers" subMenu="bracket"/>

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
                    <h2 class="pageTitle">Congratulations Mod Dash Finalists!</h2><!-- page title -->
                           <table cellpadding="0" cellspacing="0"><!-- Start table list -->
                                <tr>
                                    <th class="first" ><span class="left"></span>&nbsp;</th><!-- table left top corner -->
                                    <th class="last"><span class="right">&nbsp;</span></th><!-- table right top corner -->
                            </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22650894" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="16096823" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22771277" context="<%=HandleTag.ASSEMBLY%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22651137" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22692261" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22724890" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22774655" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="22746428" context="<%=HandleTag.ALGORITHM%>" darkBG="true" /></td>
                              </tr>
                            <tr class="last">
                                  <td colspan="2"><tc-webtag:handle coderId="15604762" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" /></td>
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
