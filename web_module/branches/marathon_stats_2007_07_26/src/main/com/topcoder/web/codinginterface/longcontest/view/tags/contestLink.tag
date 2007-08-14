<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="roundTypeId" required="true" type="java.lang.Integer" %>
<%@ attribute name="roundName" required="true"  %>
<%@ attribute name="contestName" required="true"  %>
<%@ attribute name="styleClass" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>


<a href="?module=ViewStandings&rd=${roundId}" class="bcLink">
<mm:contest roundName="${roundName}" contestName="${contestName}" roundTypeId="${roundTypeId }" />
</a>

