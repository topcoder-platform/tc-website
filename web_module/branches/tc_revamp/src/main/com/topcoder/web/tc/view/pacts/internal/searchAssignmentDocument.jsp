<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
				 com.topcoder.web.common.BaseProcessor,
				 java.util.HashMap" %>

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Search Assignment Document</title>
    
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
         
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

function doSearch(mustSearch, firstLoad) {
	var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=SelectAssignmentDocumentTypeReference');
    
    if (mustSearch) {
        ajaxRequest.addNamedFormElements("search_text");
        ajaxRequest.addNamedFormElements("search_list");
    }
    ajaxRequest.addNamedFormElements("assignment_document_type_id");
    
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);    
    ajaxRequest.sendRequest();
}


 function typeChanged() {
 doSearch(false, false)
}
 
 function initialize() {
    toggleDiv("loading", 0);
 }
 
 function toggleDiv(divId, state) 
{
    if(document.layers)   
    {
       document.layers[divId].visibility = state ? "show" : "hide";
    }
    else if(document.getElementById)
    {
        document.getElementById(divId).style.visibility = state ? "visible" : "hidden";
    }
    else if(document.all)
    {
        document.all[divId].style.visibility = state ? "visible" : "hidden";
    }
}

 function loading() {
    toggleDiv("loading", 1);
}

function loaded() {
    toggleDiv("loading", 0);
}

 
 </script>
    
</head>
<body onLoad="initialize()">
<div id="loading">
<p align="right">
<b><font color="#FF0000" size="+1">Loading...</font></b>
</p>
</div>


<c:set var="reference_id" value="<%= new Long((String)((HashMap) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("reference_id")) %>" />

<h1 align="center">PACTS</h1>
<h2 align="center">Search Assignment Document</h2>

<center>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center">
        <form name='f' action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
          <input type="hidden" name="module" value="ViewSearchAssignmentDocumentResult"/>
        		<table cellpadding="5" cellspacing="5" border="0">
        		<tr>
        			<td><b>Handle</b></td>
        			<td><tc-webtag:textInput name="user_handle" id="user_handle" editable="true" /></td>			
        		</tr>
        		<tr>		
        			<td><b>Type:</b></td>
        			<td>
        				<SELECT CLASS="dropdown" NAME="assignment_document_type_id" onChange="typeChanged()">
        			        <OPTION value='0' selected>Any</OPTION>
        				    <c:forEach items="${assignment_document_type_list}" var="typeItem">
        				        <OPTION value='${typeItem.id}'>
        				        	${typeItem.description}
        				        </OPTION>
        					</c:forEach>
        				</SELECT>
        			</td>
        		</tr>
                <tr id="selectReference">
                    <c:if test="${not empty reference_description}">    
                        <td><b>Reference:</b></td>      
                        <td><c:out value="${reference_description}" />
                        <c:choose>
                            <c:when test="${assignmentDocumentId > 0}">
                                <input type="hidden" name="search_list" value="${reference_id}"/>
                                <input type="button" value="change" onClick="typeChanged()" />
                            </c:when>
                            <c:otherwise>
                    	        <input type="text" name="search_text"/>
                                <input type="button" value="search" onClick="doSearch(true, false)" />
                            </c:otherwise>
                        </c:choose>
                        </td>
                    </c:if>
                </tr>
                <tr>        
                    <td><b>Submission title:</b></td>
                    <td>
            	        <tc-webtag:textInput name="submission_title" id="submission_title" editable="true" /> 
                    </td>
                </tr>
        		<tr>		
        			<td><b>Status:</b></td>
        			<td>
        				<SELECT CLASS="dropdown" NAME="assignment_document_status_id">
                            <OPTION value='0' selected>Any</OPTION>
        				    <c:forEach items="${assignment_document_status_list}" var="statusItem">
        				        <OPTION value='${statusItem.id}'>
        				        	${statusItem.description}
        				        </OPTION>
        					</c:forEach>
        				</SELECT>
        			</td>
        		</tr>
                <tr>
        	        <td><b>Expiration Date:</b></td><td>
        	        Between <tc-webtag:textInput name="expire_date_from" id="expire_date_from" size="12" editable="true" /> 
        	            <button id="trigger_expire_date_from">Set</button> and 
                        <tc-webtag:textInput name="expire_date_to" id="expire_date_to" size="12" editable="true" /> 
                        <button id="trigger_expire_date_to">Set</button>
        	        </td>            
        		</tr>		
                <tr>
        	        <td><b>Affirmed Date:</b></td><td>
        	        Between <tc-webtag:textInput name="affirmed_date_from" id="affirmed_date_from" size="12" editable="true" /> 
        	            <button id="trigger_affirmed_date_from">Set</button>  and 
                        <tc-webtag:textInput name="affirmed_date_to" id="affirmed_date_to" size="12" editable="true" /> 
                        <button id="trigger_affirmed_date_to">Set</button> 
        	        </td>            
        		</tr>		
                <tr>
                    <td><b>Create Date:</b></td><td>
                    Between <tc-webtag:textInput name="create_date_from" id="create_date_from" size="12" editable="true" /> 
                        <button id="trigger_create_date_from">Set</button> and 
                        <tc-webtag:textInput name="create_date_to" id="create_date_to" size="12" editable="true" /> 
                        <button id="trigger_create_date_to">Set</button>
                    </td>            
                </tr>       
                <tr>
                    <td><b>Modify Date:</b></td><td>
                    Between <tc-webtag:textInput name="modify_date_from" id="modify_date_from" size="12" editable="true" /> 
                        <button id="trigger_modify_date_from">Set</button>  and 
                        <tc-webtag:textInput name="modify_date_to" id="modify_date_to" size="12" editable="true" /> 
                        <button id="trigger_modify_date_to">Set</button> 
                    </td>            
                </tr>
        </table>
        
        <script language="javascript" type="text/javascript">
        Calendar.setup(
        {
         inputField  : "expire_date_from",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_expire_date_from",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "affirmed_date_from",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_affirmed_date_from",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "expire_date_to",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_expire_date_to",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "affirmed_date_to",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_affirmed_date_to",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "create_date_from",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_create_date_from",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "modify_date_from",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_modify_date_from",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "create_date_to",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_create_date_to",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        Calendar.setup(
        {
         inputField  : "modify_date_to",  
                            ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                            button      : "trigger_modify_date_to",     
                            showsTime   : false,
                            singleClick  : false,
                            cache       : true
        }
        );
        </script>
        
        <input type="Submit" value="Submit">        
        <input type="button" value="Reset" OnClick="document.f2.submit();">
        </form>
        <form name='f2' action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
            <input type="hidden" name="module" value="SearchAssignmentDocument"/>
        </form>
    </td>
  </tr>
</table>
</center>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
