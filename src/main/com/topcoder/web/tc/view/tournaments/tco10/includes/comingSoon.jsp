<%--
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 *
  JSP shows coming soon message for pages that are not yet finished.
 *
  JSP is included by all those pages in the minisite that are WIP.
 *
 * Author isv
 * Version 1.0
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mainContent">
    <div id="mainContentInner">
        <div>
            <c:if test="${requestScope.SHIFT_DOWN_COMING_SOON}">
                <br/>
            </c:if>
            <div class="pageContent">
                <h2 class="pageTitle">Coming Soon...</h2>

                <p>Coming soon...</p>
            </div>
            <!-- End .pageContent -->
        </div>
    </div>
    <!-- End #mainContentInner -->
</div>
<!-- End #mainContent -->
