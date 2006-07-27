<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tac:taconiteRoot>

<c:choose>
    <c:when test="${handleValidation.valid}">
        <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
                <div> </div>
        </tac:replaceChildren>
    </c:when>
    <c:otherwise>
        <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
            <div style="font-weight:bold;color:red;">
               <c:out value="${handleValidation.message}" />
            </div>
        </tac:replaceChildren>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${textValidation.valid && handleValidation.valid}">
        <tac:replaceChildren contextNodeID="btnSendDiv" parseOnServer="true">
                <div>
                	<A href="javascript:validate(true)" class="bodyText"><img src="/i/interface/btn_send.gif" border="0"/></A>
                </div>
        </tac:replaceChildren>
    </c:when>
    <c:otherwise>
        <tac:replaceChildren contextNodeID="btnSendDiv" parseOnServer="true">
            <div>
                	<img src="/i/interface/btn_send_disabled.gif" border="0"/>
           </div>
        </tac:replaceChildren>
    </c:otherwise>
</c:choose>
       <tac:replaceChildren contextNodeID="runJS" parseOnServer="true">
       <div>
	       	<input type="hidden" id="handleValid" name="handleValid" value="<c:out value="${handleValidation.valid}" />" />
	       	<input type="hidden" id="doSend" name="doSend" value="<c:out value="${not empty param.send}" />" />       
       </div>
       </tac:replaceChildren>

</tac:taconiteRoot>