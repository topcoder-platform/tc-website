<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <c:if test="${not empty projects}">                   
            <tr id="selectReference">
                <td><b>Reference:</b></td>      
                <td><c:out value="${reference_description}" />
                     <tc-webtag:rscSelect name="search_list" list="${search_list}" 
                         fieldText="${field_text}" fieldValue="${field_valule}" selectedValue="${param.reference_id}"                                             
                         useTopValue="false" />
                     <input type="button" value="do another search" onClick="typeChanged()" />
                </td>
            </tr>
        </c:if>                                  
     </taconite-replace>   
 </taconite-root>
 