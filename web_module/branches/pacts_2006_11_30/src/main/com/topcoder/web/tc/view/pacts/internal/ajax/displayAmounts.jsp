<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<c:set var="type" value="${param.payment_type_id}"/>
<c:set var="placed" value="${param.placed}"/>
<c:set var="isDesign" value="${param.is_design=='true'}"/>

<c:set var="COMPONENT_WINNING" value="<%= PactsConstants.COMPONENT_PAYMENT + "" %>" />


<taconite-root xml:space="preserve">

  
     <c:choose>
            <c:when test="${type == COMPONENT_WINNING and placed == 1 and isDesign}">
			    <taconite-replace contextNodeID="trAmount1" parseInBrowser="true">
			        <tr id="trAmount1">
			        <td><b>Total Gross Amount:</b></td>
			        <td>
			            <tc-webtag:textInput name="total_amount" size="8" editable="true" format="#########.00" />
			        </td>			 
			        </tr>   
			    </taconite-replace>
			    <taconite-replace contextNodeID="trAmount2" parseInBrowser="true">
			        <tr id="trAmount2">			    
			        <td><b>Installment Number:</b></td>
			        <td>
		             	<select name="installment_number">
		             		<option value="1">1</option>
		             		<option value="2">2</option>                             		
		               	 </select>
			        </td>			   
			        </tr> 
			    </taconite-replace>
			    <taconite-replace contextNodeID="trAmount3" parseInBrowser="true">
			    	<tr id="trAmount3">			   
				        <td nowrap="nowrap"><b>Installment Gross Amount:</b></td>				        
				        <td>
				            <tc-webtag:textInput name="gross_amount" size="8" editable="true" format="#########.00" /> (If left blank, calculated from Total Gross Amount)
				        </td>			    
				    </tr>
			    </taconite-replace>
			    <taconite-replace contextNodeID="trAmount4" parseInBrowser="true">
			        <tr id="trAmount4">
				        <td><b>Installment Net Amount:</b></td>
				        <td>
				            <tc-webtag:textInput name="net_amount" size="8" editable="true" format="#########.00" /> (if left blank, calculated from Installment Gross Amount)
				        </td>
				    </tr>
				 </taconite-replace>			    			    
            </c:when>
            <c:otherwise>
			    <taconite-replace contextNodeID="trAmount1" parseInBrowser="true">
			        <tr id="trAmount1">
				        <td><b>Gross Amount:</b></td>
				        <td>
				            <tc-webtag:textInput name="total_amount" size="8" editable="true" format="#########.00" />
				        </td>
			        </tr>   
			    </taconite-replace>
			    <taconite-replace contextNodeID="trAmount2" parseInBrowser="true">
			        <tr id="trAmount2">			    
				        <td><b>Net Amount:</b></td>
				        <td>
				            <tc-webtag:textInput name="net_amount" size="8" editable="true" format="#########.00" /> (if left blank, calculated from Gross Amount)
				        </td>
			        </tr> 
			    </taconite-replace>
			    <taconite-replace contextNodeID="trAmount3" parseInBrowser="true">
			    	<tr id="trAmount3">			   
				        <td></td>
				        <td></td>
				    </tr>
			    </taconite-replace>
			    <taconite-replace contextNodeID="trAmount4" parseInBrowser="true">
			        <tr id="trAmount4">
			        <td></td>
			        <td></td>
				    </tr>
				 </taconite-replace>			    			    
            </c:otherwise>
     </c:choose>
     
     
 </taconite-root>
 