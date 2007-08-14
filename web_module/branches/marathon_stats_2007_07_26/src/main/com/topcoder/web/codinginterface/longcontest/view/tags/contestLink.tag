<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="roundTypeId" required="true" type="java.lang.Integer" %>
<%@ attribute name="roundName" required="true"  %>
<%@ attribute name="contestName" required="true"  %>
<%@ attribute name="styleClass" required="false" %>


<a href="?module=ViewStandings&rd="${roundId}" class="bcLink">

${contestName }- ${roundName} , ${roundTypeId }
</a>
