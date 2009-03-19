<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<script type="text/javascript" src="/js/taconite-client.js"></script>
	<script type="text/javascript" src="/js/taconite-parser.js"></script>
  <script type="text/javascript">
  
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
function link() {
	var ajaxRequest = new AjaxRequest('/admin/?module=LinkProjectContest');    
    ajaxRequest.addNamedFormElements("pj");
    ajaxRequest.addNamedFormElements("cid");
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);        
    ajaxRequest.sendRequest();
}

function unlink() {
	var ajaxRequest = new AjaxRequest('/admin/?module=UnlinkProjectContest');    
    ajaxRequest.addNamedFormElements("rmv");
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);        
    ajaxRequest.sendRequest();
}

function checkAll(check) {
    var elements = document.f.elements;
    for (i=0; i<document.f.elements.length; i++) {
      if (document.f.elements[i].type=="checkbox"  && document.f.elements[i].name=="pj") {
        document.f.elements[i].checked = (check==true);
      }
    }
  }
</script>
 
  
</head>

<body onLoad="loaded()">
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
        
<div id="loading">
<p align="right">
<b><font color="#FF0000" size="+1">Working...</font></b>
</p>
</div>		
        
        <c:choose>
        	<c:when test="${catid == 1}">
        		Design | <a href="/admin/?module=ProjectContestSetup&catid=2">Developoment</a>
        	</c:when>
        	<c:when test="${catid == 2}">
        		<a href="/admin/?module=ProjectContestSetup&catid=1">Design</a> | Developoment
        	</c:when>
        </c:choose>
        <br>
        <br>
        <a href="Javascript:checkAll(true)">check all</a> -
 <a href="Javascript:checkAll(false)">uncheck all</a> <br>
<br><br>
<form name="f" action="#">
        	<table>
        		<tr class="header">
        			<td>&nbsp;</td>
        			<td>Project name</td>
        			<td>Reg. Start</td>
        			<td>Reg. End</td>        			
        			<td>Associated contests</td>
        		</tr>
        	
        	<c:forEach items="${projects}" var="project" varStatus="i">
        		<c:if test="${project.eligibilityOpen}">
	        		<tr class='${i.index % 2 == 0? "even" : "odd" }' style="font : small">
	        			<td><input type="checkbox" name="pj" value="${project.id}"/></td>
	        			<td>${project.projectName } ${project.projectVersion }</td>
	        			<td><tc-webtag:format object="${project.registrationPhase.scheduledStartTime}" format="MM.dd.yyyy" /></td>
	        			<td><tc-webtag:format object="${project.registrationPhase.scheduledEndTime}" format="MM.dd.yyyy" /></td>
				    	<td id="ct${project.id}">
	        				<c:forEach items="${project.contests }" var="contest" varStatus="status">	     
	        				    <input type="checkbox" name="rmv" value="${project.id}:${contest.id}"/>   				
	        					${contest.name }
	        					<c:if test="${not status.last }"><br></c:if>
	        				</c:forEach>
	        			</td>
	        		</tr>
        		</c:if>
        	</c:forEach>
        	</table>
<br><br>
<table>
	<tr>
		<td>
            <tc-webtag:objectSelect name="cid" list="${contests}" valueField="id" textField="name"  useTopValue="false"/>
			<input type="button" value="Link" onclick="link()">
		</td>
		<td align="right">
			<input type="button" value="Unlink selected" onclick="unlink()">
		</td>
	</tr>
</table>	
		

			<br>
			<br>
			
        </td>
    </tr>    
</table>
</form>
</body>
</html>
