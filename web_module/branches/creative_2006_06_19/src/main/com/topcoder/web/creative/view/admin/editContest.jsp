<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ page import="com.topcoder.web.creative.model.ContestProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Creative</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>

</head>

<body>
<jsp:include page="../creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="adminLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
<div class="contentInner">

<h1>Edit Contest Details</h1>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminEditContest"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_NAME%>">${err}
                    <br/></tc-webtag:errorIterator></span>
    Contest Name: <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
</p>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME%>">${err}
                    <br/></tc-webtag:errorIterator></span>
    Contest Start: <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/>
    <button id="trigger<%=Constants.START_TIME%>">Set</button>
</p>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME%>">${err}
                    <br/></tc-webtag:errorIterator></span>

    Contest End: <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/>
    <button id="trigger<%=Constants.END_TIME%>">Set</button>
</p>


<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "<%=Constants.START_TIME%>",         // ID of the input field
                    ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
                    button      : "trigger<%=Constants.START_TIME%>",       // ID of the button
                    showsTime   : true,
                    singleClick  : false,
                    cache       : true
                }
                        );
                Calendar.setup(
                {
                    inputField  : "<%=Constants.END_TIME%>",         // ID of the input field
                    ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
                    button      : "trigger<%=Constants.END_TIME%>",      // ID of the button
                    showsTime    : true,
                    singleClick  : false,
                    cache       : true
                }
                        );
                -->
</script>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.CONTEST_OVERVIEW_TEXT%>" var="overviewText"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${overviewText}">${err}
                    <br/></tc-webtag:errorIterator></span>
    Contest Overview: <tc-webtag:textArea name="${overviewText}" rows="8" cols="80"/>
</p>


<script language="javascript" type="text/javascript">
    <!--
var defaultOverview= "This is the default overview text.  We need to come up with a real default text.";
var overviewText = getValue("document.editForm", "${overviewText}");
                       if ( overviewText==null || overviewText.length==0) {
                         putValue("document.editForm", "${overviewText}", defaultOverview);
                        }
                -->
</script>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.PRIZE_DESCRIPTION%>" var="prizeDesc"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeDesc}">${err}
                    <br/></tc-webtag:errorIterator></span>
    Prize Description: <tc-webtag:textArea name="${prizeDesc}" rows="8" cols="80"/>
</p>

<script language="javascript" type="text/javascript">
    <!--
var defaultPrizeDesc= "TopCoder Studio will compensate the member with the first place submission, as selected "+
"by the client.  The payment will be distributed in one full installment once the final vector-based version of " +
"the winning submission has been received by TopCoder Studio.";
var prizeDesc = getValue("document.editForm", "${prizeDesc}");
                       if ( prizeDesc==null || prizeDesc.length==0) {
                         putValue("document.editForm", "${prizeDesc}", defaultPrizeDesc);
                        }
                -->
</script>


<c:set value="<%=Constants.PRIZE_PLACE%>" var="prizePlace"/>
<c:forEach begin="1" end="${prizeCount}" var="curr">
    <c:set value="${prizePlace+curr}" var="prizeParam"/>
    <p>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeParam}">${err}
                        <br/></tc-webtag:errorIterator></span>

        Prize ${curr}: <tc-webtag:textInput name="${prizeParam}"/>
    </p>

</c:forEach>

<p>
    <button name="submit" value="submit" type="submit">Submit</button>
</p>
</form>

<jsp:include page="../creativeFoot.jsp"/>
</div>

</div>
</body>
</html>