<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="name" required="true"  %>
<%@ attribute name="styleClass" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="/longcontest/?module=ViewStandings&amp;rd=${roundId}" class="${empty styleClass? "bcLink" : styleClass}">
    ${name}
</a>