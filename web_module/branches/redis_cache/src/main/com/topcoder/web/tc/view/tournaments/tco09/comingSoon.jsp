<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows coming soon message for pages that are not yet finished.
 *
 * This JSP is included by all those pages in the minisite that are WIP.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getParameter("shiftDown")%>" var="shiftDown"/>
<div class="mainContent">
    <div id="mainContentInner">
        <div>
            <c:if test="${not empty shiftDown}">
                <br />
            </c:if>
            <div class="pageContent">
                <h2 class="title">Coming Soon...</h2>
                <p>The 2009 TopCoder Open website will constantly be changing throughout the event.  We will be updating leader boards, sharing advancers, uploading pictures, and some of the best videos from the <a href="http://www.youtube.com/user/TopCoderOpen2009">TCO09 channel.</a></p>
                <p>Some of your favorite admins will be also be blogging throughout the event with important information.  So be sure to add the TCO09 website to your speed dial and check back often!</p>
            </div><!-- End .pageContent -->
        </div>
    </div><!-- End #mainContentInner -->
</div><!-- End #mainContent -->
