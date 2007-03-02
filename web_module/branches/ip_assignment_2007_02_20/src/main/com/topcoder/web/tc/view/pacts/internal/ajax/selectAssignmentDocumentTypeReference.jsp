<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="search_list" value="${requestScope.search_list}"/>
<c:set var="search_list" value="${requestScope.reference_description}"/>
<c:set var="search_list" value="${requestScope.field_text}"/>
<c:set var="search_list" value="${requestScope.field_valule}"/>
<c:set var="reference_id" value="${requestScope.reference_id}"/>

<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="selectReference" parseInBrowser="true">
        <c:if test="${empty search_list}">           
            <tr id="selectReference">
                <td><b>Reference:</b></td>      
                <td><c:out value="${reference_description}" />
                    <input type="text" name="searchInput"/>
                    <input type="button" value="search" onClick="doSearch(false, false)" />
                </td>
            </tr>
        </c:if>
        <c:if test="${not empty search_list}">                   
            <tr id="selectReference">
                <td><b>Reference:</b></td>      
                <td><c:out value="${reference_description}" />
                     <tc-webtag:rscSelect name="search_list" list="${search_list}" 
                         fieldText="${field_text}" fieldValue="${field_valule}" selectedValue="${reference_id}"                                             
                         useTopValue="false" />
                     <input type="button" value="do another search" onClick="typeChanged()" />
                </td>
            </tr>
        </c:if>                                  
     </taconite-replace>   
 </taconite-root>
 