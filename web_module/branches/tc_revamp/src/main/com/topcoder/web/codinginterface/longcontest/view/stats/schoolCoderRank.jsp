<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@  page language="java"
    import="com.topcoder.shared.dataAccess.DataAccessConstants,
            com.topcoder.web.codinginterface.longcontest.Constants"%>
          
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<script type="text/javascript">
function submitEnter(e) {
var keycode;
if (window.event) keycode = window.event.keyCode;
else if (e) keycode = e.which;
else return true;
if (keycode == 13) {
document.f.submit();
return false;
} else return true;
}
</script>
   
</head>

<body>

        <jsp:include page="../top.jsp" >
            <jsp:param name="level1" value="long"/>
        </jsp:include>
     

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="../includes/global_left.jsp">
                        <jsp:param name="node" value="top_rated_long"/>
                    </jsp:include>
                </td>
                <!-- Left Column Ends -->

                <!-- Center Column Begins -->
                <td class="statTableSpacer" width="100%" valign="top">

        <div class="fixedWidthBody">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Top Ranked Marathon Match Competitors"/>
                </jsp:include>

                <div align="center">
                    Competitors
                     | <a href="${sessionInfo.servletPath}?module=SchoolRank" class="bcLink">Schools</a>
                     | <a href="${sessionInfo.servletPath}?module=CountryRank" class="bcLink">Countries</a>
                </div>

                <form name="f" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SchoolCoderRank"/>
                <tc-webtag:hiddenInput name="<%=Constants.SCHOOL_ID %>"/>

                <div class="pagingBox">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" />
                </div>

            <table class="stat" cellpadding="0" cellspacing="0" width="510" border="0">
               <tr><td class="title" colspan="2">Marathon Match Competitors for ${schoolName } school</td>
                </tr>
               <tr>
                  <td class="header">Handle</td>
                  <td class="headerC">Rating</td>
               </tr>
               <c:forEach items="${list}" var="row" varStatus="status">
                   <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                        <td class="value"><tc-webtag:handle coderId="${row.map['coder_id']}" context="marathon_match"/></td>                        
                        <td class="valueC">${row.map['rating']}</td>
                    </tr>   
               </c:forEach>   
            </table>
                <div class="pagingBox">
                    <tc-webtag:prevPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" /> |
                    <tc-webtag:nextPage servletPath="${sessionInfo.servletPath}" list="${list}" styleClass="bcLink" />
                </div>

                <center>
                        View &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        &#160;at a time starting with &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                        <a href="javascript:document.f.submit();" class="bcLink">&#160;[ submit ]</a>
                </center>
               
            </form>
            </div>
                </td>


         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt="" /></td>
                <!-- Gutter Ends -->
            </tr>
        </table>

        <jsp:include page="../foot.jsp" />

    </body>

</html>