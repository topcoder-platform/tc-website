<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.controller.request.membercontact.Helper,
                 com.topcoder.web.tc.controller.request.membercontact.MemberContact,
                 com.topcoder.web.tc.controller.request.membercontact.SendMail"
        %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>Member Contact</title>

<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript" src="/js/tcdhtml.js"></script>
<script type="text/javascript">

    <c:set value="<%=MemberContact.CAN_RECEIVE%>" var="canReceive"/>

    function isIncludeMailChecked() {
        for (i = 0; i < document.f.<%= SendMail.ATTACH %>.length; i++) {
            if (document.f.attach[i].checked)
                return true;
        }
        return false;
    }

    function canSend() {
        return document.f.<%= SendMail.TEXT %>.value != "" &&
                <c:if test="${cf:containsMapKey(requestScope, canReceive)}" >
               isIncludeMailChecked() &&
                </c:if>
               document.f.handleValid.value == "true";
    }

    function validateLocal(showErrors) {
        valid = false;
    <c:if test="${cf:containsMapKey(requestScope, canReceive)}" >
        if (isIncludeMailChecked()) {
            updateDivOrSpan(document, "attachValidation", "&nbsp;");
            valid = true;
        } else {
            if (showErrors) {
                updateDivOrSpan(document, "attachValidation", "Please select Yes or No.");
            }
        }
    </c:if>
        if (document.f.<%= SendMail.TEXT %>.value != "") {
            updateDivOrSpan(document, "textValidation", "&nbsp;");
            valid = true;
        } else {
            if (showErrors) {
                updateDivOrSpan(document, "textValidation", "The message body is empty.");
            }
        }
        return valid;
    }


    function validateHandle(send) {
        var ajaxRequest = new AjaxRequest('/tc?module=ValidateHandle');
        ajaxRequest.addFormElementsById("<%= SendMail.TO_HANDLE %>");
        if (send) {
            ajaxRequest.setPostRequest(afterRequest);
        } else {
            ajaxRequest.setPostRequest(doNothing);
        }
        ajaxRequest.sendRequest();
    }

    function send() {
        if (validateLocal(true)) {
            validateHandle(true)
        }
    }

    function afterRequest()
    {
        if (canSend() && document.f.doSend.value == "true") {
            document.f.submit();
        }
    }

    function doNothing()
    {
    }


    function keyPress(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            document.f.<%= SendMail.TEXT %>.focus();
            return false;
        } else return true;
    }

    function init() {
        document.f.<%= SendMail.TO_HANDLE %>.focus();
    }

</script>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body onLoad="init()">

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">

<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value=""/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
    <div class="fixedWidthBody">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="member_contact"/>
            <jsp:param name="title" value="Send a Message"/>
        </jsp:include>

        The Member Contact area allows you to send emails to other TopCoder members.
        <br><br>
        To block specific TopCoder members from contacting you, go to the <a href='/tc?module=BlackList'>black list</a>
        page.
        <br>
        <c:if test="${cf:containsMapKey(requestScope, canReceive)}">
            To enable other rated TopCoder members to contact you, <a href='/tc?module=MemberContactEnable'>click
            here</a>
            <br>
        </c:if>
        <br>
        <span class="bodySubtitle">Send a message:</span><br>

        <c:set value="<%=Helper.NOT_RATED%>" var="notRated"/>
        <c:set value="<%=Helper.BANNED%>" var="banned"/>
        <c:choose>
            <c:when test="${cf:containsMapKey(requestScope, notRated)}">
        <span class="bigRed">
           You must be a rated member to contact other members.
        </span>
            </c:when>
            <c:when test="${cf:containsMapKey(requestScope, banned)}">
        <span class="bigRed">
           You are not allowed to contact other members.
        </span>
            </c:when>
            <c:otherwise>

                <form name='f' action='/tc?module=SendMail' method='post'>

                    <input type="hidden" id="<%= SendMail.SEND %>" name="<%= SendMail.SEND %>" value="true"/>

                    <div id="validationHandle">&nbsp;</div>
                    To:&nbsp;<input type='text' name='<%= SendMail.TO_HANDLE %>' id='<%= SendMail.TO_HANDLE %>' size='12' onBlur='validateHandle(false)' onkeypress='return keyPress(event);' value='<c:out value="${param.th}" />'/>
                    <br><span class="smallText">(Enter TopCoder handle only, one per message)</span>

                    <div>
                        <span id="textValidation" class="bigRed">&nbsp;</span>
                    </div>
                    <textarea name='<%= SendMail.TEXT %>' id='<%= SendMail.TEXT %>' onKeyUp='validateLocal(false)' onBlur='validateLocal(false)' cols='50' rows='10'></textarea>
                    <br/><br/>
                    <c:if test="${cf:containsMapKey(requestScope, canReceive)}">
                        <strong>Wait a second!</strong> You're sending a message but you don't have member contacting
                        enabled. This member won't have any way to respond to you.
                        <br/><br/>
                        Would you like to attach your email address to the message?
                        <br/>
                        <span id="attachValidation" class="bigRed">&nbsp;</span><br/>
                        <input type="radio" name="<%= SendMail.ATTACH %>" value="Yes" onChange='validateLocal(false)'>
                        Yes
                        <br/>
                        <input type="radio" name="<%= SendMail.ATTACH %>" value="No" onChange='validateLocal(false)'> No
                        <br/><br/>
                    </c:if>

                    <input type='checkbox' name='<%= SendMail.SEND_COPY %>'/>Send a copy to the email address in my
                    TopCoder profile.
                    <br/><br/>

                    <div id="btnSendDiv">
                        <A href="javascript:send()" class="button" style="width: 70px;" onfocus="this.blur();">Send</A>
                    </div>

                    <div id="runJS">
                        <input type="hidden" id="handleValid" name="handleValid" value="false"/>
                        <input type="hidden" id="doSend" name="doSend" value="false"/>
                    </div>
                </form>

            </c:otherwise>
        </c:choose>
        <br><br>
        <strong>NOTE:</strong> All messages sent to TopCoder members from the Member Contact area will be logged and may
        be occasionally reviewed.
        Using the member contact function for any commercial purposes is strictly prohibited. Any TopCoder member who
        deems a member
        contact message from another TopCoder member to be inappropriate is encouraged to report this activity at
        <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
        <br><br><br>
    </div>


</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="about"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
