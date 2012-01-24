<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>

<jsp:useBean id="sessionInfo"
	class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
  <style type="text/css">
.calendar,
.calendar table { width: 250px; height: 200px; }
</style>

<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>

<script language="javascript" type="text/javascript">

function getIdx() {
    for (var i = 0; i < document.f.school.length; i++) {
    	if (document.f.school.options[i].selected) {
    		return i;
    	}
    }
    return -1;
}

function chooseSrc() {
    var idx = getIdx();
    if (idx < 0) {
    	alert("Please select a school");
    	return;
    }

	document.f.srcName.value=document.f.school.options[idx].text;
	document.f.s1.value=document.f.school.options[idx].value;

}

function chooseDest() {
    var idx = getIdx();
    if (idx < 0) {
    	alert("Please select a school");
    	return;
    }

	document.f.destName.value=document.f.school.options[idx].text;
	document.f.s2.value=document.f.school.options[idx].value;

}

function schoolDoubleClick() {
	if (document.f.s1.value=="") chooseSrc();
	else chooseDest();
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

function postSearch() {
	loaded();
    toggleDiv("divMerge", 1);
}

function postMerge() {
	loaded();
	document.f.s1.value="";
	document.f.s2.value="";
	document.f.destName.value="";	
	document.f.srcName.value="";	
}

function doSearch() {
	var ajaxRequest = new AjaxRequest('/admin?module=SearchSchools');
    
    ajaxRequest.addNamedFormElements("type");
    ajaxRequest.addNamedFormElements("cc");    
    ajaxRequest.addNamedFormElements("date");    
    ajaxRequest.addNamedFormElements("order");    
    ajaxRequest.addNamedFormElements("name");
    ajaxRequest.setPostRequest(postSearch);
    ajaxRequest.setPreRequest(loading);    
    ajaxRequest.sendRequest();
}

function doMerge() {
    if (document.f.s1.value=="" || document.f.s2.value=="") {
    	alert("Please select source and destination schools for the merge");
    	return;
    }
    if (document.f.s1.value==document.f.s2.value) {
    	alert("Source and destination schools must be different");
    	return;
    }
	var ajaxRequest = new AjaxRequest('/admin?module=MergeSchools');
    
    ajaxRequest.addNamedFormElements("s1");
    ajaxRequest.addNamedFormElements("s2");
    ajaxRequest.addNamedFormElements("ua");
    ajaxRequest.addNamedFormElements("type");
    ajaxRequest.addNamedFormElements("cc");    
    ajaxRequest.addNamedFormElements("date");    
    ajaxRequest.addNamedFormElements("order");    
    ajaxRequest.addNamedFormElements("name");
    ajaxRequest.setPostRequest(postMerge);
    ajaxRequest.setPreRequest(loading);    
    ajaxRequest.sendRequest();
}


</script>

</head>
<body onLoad="loaded(); toggleDiv('divMerge', 0);">
<jsp:include page="top.jsp" />
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get" name="f">
<input type="hidden" name="module" value=""/>
<input type="hidden" name="s1" value="">
<input type="hidden" name="s2" value="">
<div id="loading">
<p align="right">
<b><font color="#FF0000" size="+1">Loading...</font></b>
</p>
</div>

<table cellpading="5" cellspacing="5">
	<tr valign="top">
		<td><jsp:include page="left.jsp" /></td>
		<td>
		<table cellpading="20" cellspacing="20">
			<tr>
				<td>
                        <div id="errorDiv">
                        </div>
                        
                     <table cellpading="20" cellspacing="20">
                     	<tr>
                     		<td width="150">School type:</td>
                     		<td>
                     			<tc-webtag:radioButton name="type" value="<%=com.topcoder.web.common.model.SchoolType.HIGH_SCHOOL + "" %>" /> High School<br>
				                <tc-webtag:radioButton name="type" value="<%=com.topcoder.web.common.model.SchoolType.COLLEGE + "" %>" /> College<br>
				                <tc-webtag:radioButton name="type" value="-1" />Any (HS/College/Unknown)
                			</td>
                		</tr>
                		<tr> 
                			<td>Country: </td>
                			<td>
				            	<tc-webtag:objectSelect name="cc" list="${countries}" valueField="code" textField="name" topValue="" topText="[-- Any Country --]" useTopValue="true" />
				            <td>
				       </tr>
				       <tr>
				       		<td>School added after:</td>
				       		<td>
				       			<tc-webtag:textInput name="date" id="date" size="12" editable="true"/><button id="trigger_date">Set</button>      
				       		</td>
				       	</tr>
                     	<tr>
                     		<td width="150">Order by:</td>
                     		<td>
                     			<tc-webtag:radioButton name="order" value="c" />Country, School Name<br>
				                <tc-webtag:radioButton name="order" value="s" />School Name (will show schools with unkown address)<br>
                			</td>
                		</tr>
				       <tr>
				       		<td>School Name:</td>
				       		<td>
				       			<tc-webtag:textInput name="name" size="30" editable="true"/>
				       		</td>
				       	</tr>
				       	<tr>
				       		<td colspan="2">
								<input type="button" value="search" onClick="doSearch()">
				       		</td>
				       	</tr>
				       </table>
				<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "date",  
                    ifFormat    : "%m/%d/%Y",    
                    button      : "trigger_date",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
                -->
</script>
				
				</form>
				</td>
			</tr>
			<tr>
				<td>
				
				<div id="searchResults">
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div id="divMerge">
				Double click in the source school first and then in the destination school or use the links below.<br>

						<a href="javascript:chooseSrc()">choose as source school</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:chooseDest()">choose as destination school</a><br>
				
                       
                      <table>
                      	<tr>
							<td>Merge</td>
							<td><input type="text" name="srcName" onClick="blur()" size="80"> </td>
						</tr>
						<tr>
							<td>into</td>
							<td><input type="text" name="destName" onClick="blur()"  size="80"></td>
						</tr>
						<tr>
							<td colspan="2">
							<tc-webtag:chkBox name="ua" value="true"/>Update destination address_id if needed
							<input type="button" value="Merge" onClick="doMerge()"></td>
						</tr>
					</table>
					</div>


				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
