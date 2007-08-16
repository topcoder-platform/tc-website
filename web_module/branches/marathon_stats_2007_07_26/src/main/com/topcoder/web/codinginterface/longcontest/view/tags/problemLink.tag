<%@ attribute name="roundId" required="true"  %>
<%@ attribute name="problemId" required="true"%>
<%@ attribute name="problemName" required="true"  %>
<%@ attribute name="styleClass" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<a href="/longcotest/?module=ViewProblemStatement&rd=${roundId}&pm=${problemId}" class='${empty styleClass? "bcLink" : styleClass } '>
    ${problemName }
</a>
