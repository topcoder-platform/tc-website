<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>

<jsp:useBean id="sessionInfo"
	class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-16">
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
  <style type="text/css">
.calendar,
.calendar table { width: 250px; height: 200px; }
</style>

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

function search() {
	document.f.module.value = "CleanSchools";
	document.f.module.method = "get";
	document.f.submit();
}

function merge() {
	document.f.module.value = "MergeSchools";
	document.f.module.method = "post";
	document.f.submit();
}

var sr = <c:out value="${requestScope[defaults]['sr']}"/>;
var nr = <c:out value="${requestScope[defaults]['nr']}"/>;

function next() {
    document.f.sr.value = sr + nr;
    search();
}
function previous() {
   document.f.sr.value = sr - nr;
   search();
}

</script>

</head>
<body>
<jsp:include page="top.jsp" />
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get" name="f">
<input type="hidden" name="module" value=""/>
<input type="hidden" name="s1" value="">
<input type="hidden" name="s2" value="">

<table cellpading="5" cellspacing="5">
	<tr valign="top">
		<td><jsp:include page="left.jsp" /></td>
		<td>
		<table>
			<tr>
				<td>
                        
                     <table cellpading="5" cellspacing="5">
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
                     			<tc-webtag:radioButton name="c" value="1" />Country, School Name<br>
				                <tc-webtag:radioButton name="s" value="2" />School Name (will show schools with unkown address)<br>
                			</td>
                		</tr>
				       <tr>
				       		<td>Rows:</td>
				       		<td>
				       			starting at <tc-webtag:textInput name="sr" size="3"/> display <tc-webtag:textInput name="nr" size="3"/> rows.<br>
				       			
				       			<c:if test="${requestScope[defaults]['sr'] > 1}">
				       				<a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
				       			</c:if>
                                <c:if test="${requestScope.displayNext}">
				       				<a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>				       			
				       				</c:if>
				       		</td>
				       	</tr>
				       	<tr>
				       		<td colspan="2">
								<input type="button" value="search" onClick="search()">
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
				<select multiple size="15" style="width: 600px;" name="school" ondblclick="schoolDoubleClick()">					
                        <c:forEach items="${requestScope.schools}" var="result">
                           <option value="${result[1].id}">[${result[1].address.country.name}] ${result[1].name} (${result[0]})</option>
                        </c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>
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
							<input type="button" value="Merge" onClick="merge()"></td>
						</tr>
					</table>


				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
