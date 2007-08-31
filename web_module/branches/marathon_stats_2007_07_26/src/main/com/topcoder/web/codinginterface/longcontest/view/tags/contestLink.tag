<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="name" required="true"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="/longcontest/stats/?module=ViewOverview&amp;rd=${roundId}" class="bcLink">
    ${name}
</a>