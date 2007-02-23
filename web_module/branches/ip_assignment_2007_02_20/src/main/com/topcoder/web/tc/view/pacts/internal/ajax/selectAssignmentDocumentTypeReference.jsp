<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="projects" value="${requestScope.component_project_list}"/>
<c:set var="studioContests" value="${requestScope.studio_contest_list}"/>

<taconite-root xml:space="preserve">

    <taconite-replace contextNodeID="selectReference" parseInBrowser="true">
         <tr id="selectReference">
	        <td><b>Reference:</b></td>      
	        <td><c:out value="${reference_description}" />
	        <input type="text" name="searchInput"/>
            <input type="button" value="search" onClick="doSearch(false, false, false)" />
	        </td>
         </tr>
     </taconite-replace>   
 </taconite-root>
 