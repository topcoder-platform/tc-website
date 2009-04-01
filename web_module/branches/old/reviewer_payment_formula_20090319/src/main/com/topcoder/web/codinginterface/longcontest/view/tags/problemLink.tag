<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="problemId" required="true"%>
<%@ attribute name="problemName" required="true"  %>
<%@ attribute name="styleClass" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<a href="/longcontest/?module=ViewProblemStatement&amp;rd=${roundId}&amp;pm=${problemId}" class='${empty styleClass? "bcLink" : styleClass } '>
    ${problemName }
</a>
