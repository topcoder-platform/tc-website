<%@ page import="com.topcoder.web.ep.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>

<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>TopCoder :: Education Platform</title>
    <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script language="JavaScript" type="text/javascript" src="/js/ep/arena.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
        doSearch();
        return false;
    } else return true;
}

function doSearch() {
    var ajaxRequest = new AjaxRequest('/education?module=SchoolSearch');
    
    ajaxRequest.addNamedFormElements("sn");
    
    ajaxRequest.setPreRequest(preRequest);    
    ajaxRequest.setPostRequest(postRequest);
    ajaxRequest.sendRequest();
}

function preRequest()
{
    toggleDiv("searching", 1);
}

function postRequest()
{
    toggleDiv("searching", 0)
}
 
 function toggleDiv(divId, state) 
{
    if(document.layers)   
    {
       document.layers[divId].visibility = state ? "show" : "hide";
    }
    else if(document.getElementById)
    {
        document.getElementById(divId).style.visibility = state ? "visible" : "hidden";
    }
    else if(document.all)
    {
        document.all[divId].style.visibility = state ? "visible" : "hidden";
    }
}

 function initialize() {
    toggleDiv("searching", 0);
}
 
 </script>
</head>
<body onload="initialize()" >

<div align="center">
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;" />
        <div id="pageFrame">

            <jsp:include page="../header.jsp" />

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW" />
                    <img src="/i/ep/contentNE.png" alt="" class="NE" />
                </div>
                <div class="spacer">

                <jsp:include page="../nav.jsp" >
                    <jsp:param name="user" value="student"/>
                    <jsp:param name="node" value="home"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Select a school</h2>

        <div>
            <p>
                Please the search below to select a school:
            </p>
            <div>
                <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
                <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:textInput onKeyPress="submitEnter(event)" name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            </div>
            <p>
                Use * for a wildcard character
            </p>
            <div style="margin-bottom: 10px;">
                <a href="javascript:doSearch();"><img src="/i/ep/buttons/search.png" alt="Search" /></a>
            </div>
            <div id="searching">
                <p class="bigRed">
                    Searching...
                </p>
            </div>
        </div>
        <div id="results">&nbsp;</div>

    </div>
</div>

<%-- CONTENT ENDS --%>

                </div>
                <div class="S">
                    <img src="/i/ep/contentSW.png" alt="" class="SW" />
                    <img src="/i/ep/contentSE.png" alt="" class="SE" />
                </div>
            </div>

            <jsp:include page="../footer.jsp"/>

        </div>
        <img src="/i/ep/widtherS.png" alt="" style="display:block;" />
    </div>
</div>

</body>
</html>