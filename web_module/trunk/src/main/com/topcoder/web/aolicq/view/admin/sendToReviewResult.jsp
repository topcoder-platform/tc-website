<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
</head>

<body>

 
<jsp:include page="../topNav.jsp">
	<jsp:param name="active_page" value="home"/>
</jsp:include>

 <!-- Body Starts Here -->	    

<div id="wrapper">
<jsp:include page="../aolicqTop.jsp"/>
      <%-- Front Page Body Content --%>  
        <div id="left-content">
        <div class="secondary-body">
                        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">Contests</a>
                    &gt;
                    <a href="${sessionInfo.servletPath}?module=ViewContest&amp;<%=Constants.CONTEST_ID%>=${contest.id}">${contest.name}</a>
                    &gt; Submissions
                </div>

                Success, ${count} submissions loaded into online review.


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../tcFoot.jsp"/>

    </div>
</body>
</html>