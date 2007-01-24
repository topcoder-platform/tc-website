<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

<script language="javascript" type="text/javascript">
function getIdx() {
    for (var i = 0; i < document.schoolForm.school.length; i++) {
    	if (document.schoolForm.school.options[i].selected) {
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

	document.mergeForm.srcName.value=document.schoolForm.school.options[idx].text;
	document.mergeForm.s1.value=document.schoolForm.school.options[idx].value;

}

function chooseDest() {
    var idx = getIdx();
    if (idx < 0) {
    	alert("Please select a school");
    	return;
    }

	document.mergeForm.destName.value=document.schoolForm.school.options[idx].text;
	document.mergeForm.s2.value=document.schoolForm.school.options[idx].value;

}

function schoolDoubleClick() {
	if (document.mergeForm.s1.value=="") chooseSrc();
	else chooseDest();
}

</script>

</head>
<body>
<jsp:include page="top.jsp" />

<table>
	<tr valign="top">
		<td><jsp:include page="left.jsp" /></td>
		<td>
		<table>
			<tr>
				<td>
					<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get" name="f">
                        <input type="hidden" name="module" value="CleanSchools"/>
                        
                     <table>
                     	<tr>
                     		<td width="150">School type:</td>
                     		<td>
                     			<tc-webtag:radioButton name="type" value="<%=com.topcoder.web.common.model.SchoolType.HIGH_SCHOOL + "" %>" /> High School<br>
				                <tc-webtag:radioButton name="type" value="<%=com.topcoder.web.common.model.SchoolType.COLLEGE + "" %>" /> College
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
				       		<td>Display rows:</td>
				       		<td>
				       			from <tc-webtag:textInput name="sr" size="3"/> to <tc-webtag:textInput name="nr" size="3"/>
				       		</td>
				       	</tr>
				       	<tr>
				       		<td colspan="2">
								<input type="submit" value="search">
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
				<form action="#" name="schoolForm">
				<select multiple size="15" style="width: 600px;" name="school" ondblclick="schoolDoubleClick()">					
                        <c:forEach items="${requestScope.schools}" var="result">
                           <option value="result[1].id">[${result[1].address.country.name}] ${result[1].name}(${result[0]})</option>
                        </c:forEach>
				</select>
				</form>
				</td>
			</tr>
			<tr>
				<td>

						<a href="javascript:chooseSrc()">choose as source school</a> <br>
						<a href="javascript:chooseDest()">choose as destination school</a><br>
				
					<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get" name="mergeForm">
                        <input type="hidden" name="module" value="MergeSchools"/>
<input type="text" name="srcName" onClick="blur()" size="100"> <br>
  <input type="text" name="destName" onClick="blur()"  size="100"><br>
<input type="hidden" name="s1" value="">
<input type="hidden" name="s2" value="">
<input type="submit" value="Merge">
</form>

				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
