<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>


    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>


</head>

<body>

<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="register"/>
</jsp:include>
   <div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
        <div class="secondary-body" id="register">

<%--
                <div class="linkBox"><aolicq:forumLink forumID="${contest.forumId}"/></div>

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
                    &gt; ${contest.name}
                </div>
--%>

                <h2>Contest Registration</h2>

                <div align="center">
                   <p> Please read through the following terms, check off <strong>"I agree"</strong>, and click Submit when you're done.</p>
                    
                    <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>


                        <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>

                        <br /><br />
                        <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                        <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                    <br/></tc-webtag:errorIterator></span>
                        <input type="checkbox" name="<%=Constants.TERMS_AGREE%>"/>I agree
                        <br /><br />
                        <input type="image" src="/i/events/aolicq/interface/btnSubmit.png" />
                        <br /><br />


                    </form>
                </div>


        </div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>