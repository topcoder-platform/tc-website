<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tac:taconiteRoot>

<c:choose>
	<c:when test="${result.valid}">
        <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
                <div> </div>
        </tac:replaceChildren>
	</c:when>
	<c:otherwise>
        <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
            <div style="font-weight:bold;color:red;">
               <c:out value="${result.message}" />
            </div>
        </tac:replaceChildren>	
	</c:otherwise>
</c:choose>
       <tac:replaceChildren contextNodeID="runJS" parseOnServer="true">
           <script type="text/javascript">
               document.f.handleValid.value = <c:out value="${result.valid}" />
               if (canSend()) {
					<c:if test="${result.valid && !emtpy send}" >
                       document.f.submit();
                    </c:if>                       
               }
               showButton();
           </script>
       </tac:replaceChildren>

</tac:taconiteRoot>