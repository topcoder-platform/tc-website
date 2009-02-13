<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>

<c:set value="<%=request.getParameter("croppedDataBefore")%>" var="croppedDataBefore"/>
<c:set value="<%=request.getParameter("croppedDataAfter")%>" var="croppedDataAfter"/>
<c:set value="<%=request.getParameter("totalSize")%>" var="totalSize"/>
<c:set value="<%=request.getParameter("numRecords")%>" var="numRecords"/>
<c:set value="<%=request.getParameter("numPage")%>" var="numPage"/>
<c:set value="<%=request.getParameter("formName")%>" var="formName"/>


    <script type="text/javascript">
        var np = <c:out value="${numPage}"/>;
        var nr = <c:out value="${numRecords}"/>;
        var ts = <c:out value="${totalSize}"/>; 
        var myForm = <c:out value="${formName}"/>; 

        function next() {
            myForm.np.value = np + 1;
            myForm.submit();
        }
        function previous() {
            myForm.np.value = np - 1;
            myForm.submit();
        }
        function first() {
            myForm.np.value = '1';
            myForm.submit();
        }
        function last() {
            myForm.np.value = divide(ts, nr) + 1;
            myForm.submit();
        }
        function setPage(page) {
            myForm.np.value = page;
            myForm.submit();
        }
        function setSize(size) {
            myForm.np.value = '1';
            myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value = size;
            myForm.submit();
        }
        function setSizeToAll() {
            myForm.np.value = '1';
            myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value = ts;
            myForm.submit();
        }
        function divide ( numerator, denominator ) {
            var remainder = numerator % denominator;
            var quotient = ( numerator - remainder ) / denominator;
            return quotient;
        }
    </script>    

  <div class="dataArea_Above">
    <p class="pagination">
        <c:choose>
            <c:when test="${croppedDataBefore}">
                &lt;&lt; <a href="Javascript:first()" class="bcLink">First</a> |
                &lt; <a href="Javascript:previous()" class="bcLink">Prev</a>
            </c:when>
            <c:otherwise>
                <span class="disabled">
                    &lt;&lt; First |
                    &lt; Prev
                </span>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${totalSize % numRecords == 0}">
                <c:set var="totalPages" value="${totalSize / numRecords}"/>
            </c:when>
            <c:otherwise>
                <c:set var="totalPages" value="${totalSize / numRecords + 1}"/>
            </c:otherwise>
        </c:choose>
       | <c:if test="${numPage-5 > 1}">...</c:if><c:forEach begin="${numPage >= 5 ? numPage - 5 : 1}" end="${numPage+5}" step="${1}" var="i"> 
            <c:if test="${i >= 1 && i <= totalPages}">
                <c:choose>
                    <c:when test="${i == numPage}">
                        <strong>${i}</strong> 
                    </c:when>
                    <c:otherwise>
                        <a href="Javascript:setPage(${i})">${i}</a> 
                    </c:otherwise>
                </c:choose>
            </c:if>
        </c:forEach> <c:if test="${numPage+5 < totalPages}">...</c:if> |
        <c:choose>
            <c:when test="${croppedDataAfter}">
                <a href="Javascript:next()" class="bcLink">Next</a> &gt; |
                <a href="Javascript:last()" class="bcLink">Last</a> &gt;&gt;
            </c:when>
            <c:otherwise>
                <span class="disabled">
                    Next &gt; |
                    Last &gt;&gt;
                </span>
            </c:otherwise>
        </c:choose>
    </p>

    <p class="numResults">show results:
        <c:choose>
            <c:when test="${numRecords == 50}">
                <a href="Javascript:setSize(25)">25</a> | 
                <strong>50</strong> | 
                <a href="Javascript:setSize(100)">100</a> | 
                <a href="Javascript:setSizeToAll()">all</a> 
            </c:when>
            <c:when test="${numRecords == 100}">
                <a href="Javascript:setSize(25)">25</a> | 
                <a href="Javascript:setSize(50)">50</a> | 
                <strong>100</strong> | 
                <a href="Javascript:setSizeToAll()">all</a> 
            </c:when>
            <c:when test="${numRecords == totalSize}">
                <a href="Javascript:setSize(25)">25</a> | 
                <a href="Javascript:setSize(50)">50</a> | 
                <a href="Javascript:setSize(100)">100</a> | 
                <strong>all</strong> 
            </c:when>
            <c:otherwise> <!-- default is 25 -->
                <strong>25</strong> | 
                <a href="Javascript:setSize(50)">50</a> | 
                <a href="Javascript:setSize(100)">100</a> | 
                <a href="Javascript:setSizeToAll()">all</a> 
            </c:otherwise>
        </c:choose>
    </p>
   </div>
