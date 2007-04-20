<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.admin.controller.request.EditEvent"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    
<script language="javascript" type="text/javascript">
 </script>  
 
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
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
function search() {
	var ajaxRequest = new AjaxRequest('/admin/?module=AjaxSearchSchool');    
    ajaxRequest.addNamedFormElements("school_search");
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);        
    ajaxRequest.sendRequest();
}

function searchAgain() {
	var ajaxRequest = new AjaxRequest('/admin/?module=AjaxSearchSchool');    
    ajaxRequest.addNamedFormElements("school_search");
    ajaxRequest.addNamedFormElements("search_again");
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);    
    
    ajaxRequest.sendRequest();
}


function setSchoolType(s) 
{
	var i
    for (i=0;i< document.f.school_type.length;i++){
       if (document.f.school_type[i].defaultValue == s) {
	       document.f.school_type[i].checked=true;
          break;
       }
    }

}


</script>
  
  <style type="text/css">
.calendar,
.calendar table { width: 250px; height: 200px; }

td {
    vertical-align: top;
}

</style>
</head>

<body onLoad="searchAgain()">
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
                <br>
        
<form name="ajaxFields">        
    <input type="hidden" name="search_again" value="1"/>
</form>

<form name="f" action="/admin/" method="post">
  <input type="hidden" name="module" value="UpdateIntroEvent"/>

<div id="loading">
<p align="right">
<b><font color="#FF0000" size="+1">Searching...</font></b>
</p>
</div>		

<center>
<table border="0" cellpadding="5" cellspacing="5">
	<tr>
		<td colspan="2">
		<h3>Introductory Event</h3>
		</td>
	</tr>


    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="error">
                <font color="#FF0000"><%=err%></font><br/>
            </tc-webtag:errorIterator>
        </td>
    </tr>
	<tr>
		<td width="20%">Event Name:</td>
		<td width="80%"><tc-webtag:textInput name="name" size="60" editable="true" /></td>
	</tr>
	<tr>
		<td>Short Event Name:</td>
		<td nowrap="nowrap"><tc-webtag:textInput name="sname" size="20" editable="true" /> (e.g. "rutgers07Tour")</td>
	</tr>
	<tr>
		<td>School:</td>
		<td>
			<table border="0">
				<tr id="schoolSearch">
					<td nowrap="nowrap">
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap">
						<tc-webtag:radioButton name="school_type" value="2" />
						Use school_id: <tc-webtag:textInput name="sid" size="6" editable="true" onKeyPress="setSchoolType(2)" />
					</td>					
				</tr>
				<tr>
					<td nowrap="nowrap">
						<tc-webtag:radioButton name="school_type" value="0"/>
						No school associated with this event.
					</td>
				</tr>
			</table>

		</td>
	</tr>
	<tr>
		<td>Forum Id:</td>
		<td><tc-webtag:textInput name="fid" size="6" editable="true" />
		<!-- 
			<table style="width: 0%">
				<tr>
					<td width="10%" nowrap="nowrap">
						<tc-webtag:radioButton name="create_forum" value="1" />
						Create forum with name:
					</td>					
					<td>
						<tc-webtag:textInput name="forum_name" size="30" editable="true" /> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap">
						<tc-webtag:radioButton name="create_forum" value="0" />
						Or enter forum_id:
					</td>					
					<td>
						
					</td>
				</tr>
			</table>
			 -->
		</td>
	</tr>
	<tr>
		<td>Timezone:</td>
        <td class="value">
            <tc-webtag:objectSelect name="tz" list="${timezones}" valueField="id" textField="description"  topText="[Select one]" topValue="-1" />
        </td>
   </tr>

	<tr>
		<td>Image:</td>
        <td class="value">
            <tc-webtag:objectSelect name="img" list="${images}" valueField="id" textField="fileName" topText="[Select one]" topValue="-1" /> 
        </td>
   </tr>
	
<c:forEach items="${config}" var="cfg" >
<c:if test="${cfg.type==1}">
	<tr>
		<td nowrap="nowrap">${cfg.description }</td>
		<td><tc-webtag:textInput name="cfg${cfg.id}" size="30" editable="true" /></td>
   </tr>
</c:if>		
</c:forEach>	

<c:if test="${hasAlgo}">
	<tr> <td>&nbsp;</td><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
		<h3>Algorithm Contest</h3>
		</td>
	</tr>

	<tr>
		<td>Registration:</td>
        <td class="value">
        	<table style="width: 0%">
	        	<tr>
	    	    	<td>from</td>
	    	    	<td nowrap="true">
	    	    		<tc-webtag:textInput name="algo_reg_start" id="algo_reg_start" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
						<button id="trigger_algo_reg_start"">Set</button>
					</td>
					<td rowspan="2" nowrap="true" style="vertical-align: middle"><tc-webtag:chkBox name="algo_tz" value="true"/>Event time zone</td>
				</tr>
				<tr>
	    	    	<td>to</td>
	    	    	<td nowrap="true">
			            <tc-webtag:textInput name="algo_reg_end" id="algo_reg_end" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
			   			<button id="trigger_algo_reg_end"">Set</button>
					</td>				    	    	
    	    	</tr>
        	</table>
					
					
			   
			
        </td>
   </tr>
	
	<tr>
		<td>Round:</td>
		<td>
			<table style="width: 0%">
				<tr>
					<td width="10%" nowrap="nowrap">
						<tc-webtag:radioButton name="use_round_sel" value="1" />
						Choose a round:
					</td>					
					<td>
						<tc-webtag:objectSelect name="round_id_sel" list="${rounds}" valueField="id" textField="shortName" topText="[Select one]" topValue="-1" /> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap">
						<tc-webtag:radioButton name="use_round_sel" value="0" />
						Or enter round_id:
					</td>					
					<td>
						<tc-webtag:textInput name="round_id" size="8" editable="true" />
					</td>
				</tr>
				
					
			</table>
		</td>
		
	</tr>
	
	<c:forEach items="${config}" var="cfg" >
	<c:if test="${cfg.type==2}">
		<tr>
			<td nowrap="nowrap">${cfg.description }</td>
			<td><tc-webtag:textInput name="cfg${cfg.id}" size="30" editable="true" /></td>
	   </tr>
	</c:if>		
	</c:forEach>	
	
		<script language="javascript" type="text/javascript">
		    <!--
		Calendar.setup(
		{
		 inputField  : "algo_reg_start",  
		                    ifFormat    : "%m/%d/%Y %H:%M",  
		                    button      : "trigger_algo_reg_start",     
		                    showsTime   : true,
		                    singleClick  : false,
		                    cache       : true
		}
		);
		
		Calendar.setup(
		{
		 inputField  : "algo_reg_end",  
		                    ifFormat    : "%m/%d/%Y %H:%M",    
		                    button      : "trigger_algo_reg_end",     
		                    showsTime   : true,
		                    singleClick  : false,
		                    cache       : true
		}
		);
		
		                -->
		</script>
	
</c:if>

<c:if test="${hasComp}">
	<tr> <td>&nbsp;</td><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3">
		<h3>Component Contest</h3>
		</td>
	</tr>
	
	<tr>
		<td>Registration:</td>
        <td class="value">
        	<table style="width: 0%">
	        	<tr>
	    	    	<td>from</td>
	    	    	<td nowrap="true">
	    	    		<tc-webtag:textInput name="comp_reg_start" id="comp_reg_start" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
						<button id="trigger_comp_reg_start"">Set</button>
					</td>
					<td rowspan="2" nowrap="true" style="vertical-align: middle"><tc-webtag:chkBox name="comp_tz" value="true"/>Event time zone</td>
				</tr>
				<tr>
	    	    	<td>to</td>
	    	    	<td nowrap="true">
			            <tc-webtag:textInput name="comp_reg_end" id="comp_reg_end" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
			   			<button id="trigger_comp_reg_end"">Set</button>
					</td>				    	    	
    	    	</tr>
        	</table>
			   
			
        </td>
   </tr>
	
	<tr>
		<td>First week:</td>
        <td class="value">
            <tc-webtag:textInput name="comp_first_week" id="comp_first_week" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
					<button id="trigger_comp_first_week"">Set</button>
		</td>	
	</tr>
	<tr>
		<td>Number of weeks:</td>
		<td><tc-webtag:textInput name="nweeks" size="4" editable="true" /></td>
	</tr>
	<tr>
		<td>Weekly Prizes</td>
		<td>
			<table style="width: 0%">
				<tr>
				</tr>
				<tr>
					<td nowrap="true">1st place</td>
					<td><tc-webtag:textInput name="prize1w" size="6" editable="true" format="###,###.00" /></td>
				</tr>
				<tr>
					<td nowrap="true">2nd place</td>
					<td><tc-webtag:textInput name="prize2w" size="6" editable="true" format="###,###.00" /></td>
				</tr>
				<tr>
					<td nowrap="true">3rd place</td>
					<td><tc-webtag:textInput name="prize3w" size="6" editable="true" format="###,###.00" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>Overall Prizes</td>
		<td>
			<table style="width: 0%">
				<tr>
				</tr>
				<tr>
					<td nowrap="true">1st place</td>
					<td><tc-webtag:textInput name="prize1ov" size="6" editable="true" format="###,###.00" /></td>
				</tr>
				<tr>
					<td nowrap="true">2nd place</td>
					<td><tc-webtag:textInput name="prize2ov" size="6" editable="true" format="###,###.00" /></td>
				</tr>
				<tr>
					<td nowrap="true">3rd place</td>
					<td><tc-webtag:textInput name="prize3ov" size="6" editable="true" format="###,###.00" /></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<c:forEach items="${config}" var="cfg" >
	<c:if test="${cfg.type==3}">
		<tr>
			<td>${cfg.description }</td>
			<td><tc-webtag:textInput name="cfg${cfg.id}" size="30" editable="true" /></td>
	   </tr>
	</c:if>		
	</c:forEach>	
	
		<script language="javascript" type="text/javascript">
		    <!--
		Calendar.setup(
		{
		 inputField  : "comp_reg_start",  
		                    ifFormat    : "%m/%d/%Y %H:%M",  
		                    button      : "trigger_comp_reg_start",     
		                    showsTime   : true,
		                    singleClick  : false,
		                    cache       : true
		}
		);
		
		Calendar.setup(
		{
		 inputField  : "comp_reg_end",  
		                    ifFormat    : "%m/%d/%Y %H:%M",    
		                    button      : "trigger_comp_reg_end",     
		                    showsTime   : true,
		                    singleClick  : false,
		                    cache       : true
		}
		);


		Calendar.setup(
		{
		 inputField  : "comp_first_week",  
		                    ifFormat    : "%m/%d/%Y %H:%M",   
		                    button      : "trigger_comp_first_week",     
		                    showsTime   : true,
		                    singleClick  : false,
		                    cache       : true
		}
		);
		
		                -->
		</script>
	
</c:if>

</table>
</center>

<input type="submit" value="Save Event">

</form>
        </td>
    </tr>
</table>


</body>
</html>
