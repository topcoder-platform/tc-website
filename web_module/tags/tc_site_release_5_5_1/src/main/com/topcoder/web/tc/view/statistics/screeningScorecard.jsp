<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD><TITLE>Sample Design Review Scorecard</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Expires content=-1>
<link type="text/css" rel="stylesheet" href="http://software.topcoder.com/includes/tcs_style.css"/>
<jsp:include page="../../script.jsp" />
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<style><!--
.whiteBkgnd 
{
	font-size: 12px;
	font-weight: bold;
	font-style: normal;
	color: #000;
	font-variant: normal;
	background-color: #FFF;
	padding: 5px;
}
.blackBkgnd {
	font-size: 12px;
	font-weight: bold;
	font-style: normal;
	color: #FFF;
	font-variant: normal;
	background-color: #000;
	padding: 5px;
}
//-->
</style>

</HEAD>
<body class="body" marginheight="0" marginwidth="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody><tr valign="middle">

<!-- Gutter 1 begins -->
    <TD width=15><IMG height=10 alt="" 
      src="http://www.topcoder.com/i/clear.gif" 
      width=15 border=0> </TD>
<!-- Gutter 1 ends -->
<!-- Middle Column begins -->
        <td width="100%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr valign="top">
                    <td class="normal"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="15" width="100"></td>
                </tr>
            </tbody></table>

<!-- Content begins -->
<script>
    function set(form, what, qIdx, rIdx) {
        form.action.value = what;
        form.questionIndex.value = qIdx;
        form.responseIndex.value = rIdx;
    }
</script>

<!-- Start Title -->			
<input name="org.apache.struts.taglib.html.TOKEN" value="b3c5b68a275e87c4f542d744d98d3791" type="hidden">
    <input value="10250456" name="id" type="hidden">
    <input value="286907" name="rid" type="hidden">
    <input value="8471701" name="sid" type="hidden">
    <input value="admin" name="action" type="hidden">
    <input value="-1" name="questionIndex" type="hidden">
    <input value="-1" name="responseIndex" type="hidden">
    
	<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
    <form name="screeningScorecardForm" method="post" action="/review/saveScreeningScorecard.do"></form><tbody><tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td align="left" width="5%">
						
                    
						<img src="http://software.topcoder.com/images/icon_development.gif" alt="" height="62" width="66">

					</td>
                    <td width="5%">



					</td>
					<td class="tableHeader" nowrap="nowrap" width="40%">
				        <strong>Component Name</strong> 
    			        version
    			        1.0
					</td>
					<td class="breadcrumb" align="right" valign="bottom" width="50%"></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="1" width="1"></td>
				</tr>
			</tbody></table>
			
			<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
				<tbody><tr>
					<td class="blackBkgnd" colspan="2">
                        Development Screening Scorecard 
						- Submission 000000000</td>
				</tr>
				<tr>
					<td colspan="2" class="forumTextOdd">For
the Development Checklist, mark each deliverable as Yes, it exists; No,
it does not exist; N/A, this deliverable was not required. For the
Development Review, provide a score for each statement according to the
dropdown answers.</td>
				</tr>
			</tbody></table>
						
			
			
<!-- Start Text -->

	
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td class="whiteBkgnd">Development Checklist</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Development Checklist</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 0</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Log File from successful execution of unit test cases. (Review the /log directory)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[0].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Source Code exists and compiles successfully. (Execute 'ant compile' / 'nant compile')
</p><p class="scorecardQuestion">This may require additional packages as defined in the Component Specification.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[1].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Unit Test cases exist and compile successfully. (Execute 'ant_compile_tests' / 'nantnant compile_tests')</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[2].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Component
and unit test source code contain reasonably complete documentation
(Java: Javadoc style / .NET: XML). Documentation may be missing from
some places, but this should not be a widespread issue.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[3].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td class="whiteBkgnd">Development Review</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Documentation</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 20</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">All public methods are clearly commented.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 34</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[4].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[4].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[4].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',4,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',4,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Required tags are included.
</p><p class="scorecardQuestion">Java: @author, @param, @return, @throws and @version
</p><p class="scorecardQuestion">.NET: &lt;param&gt;, &lt;summary&gt;, &lt;returns&gt; and &lt;value&gt;</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 33</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[5].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[5].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[5].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',5,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',5,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Copyright tag is populated: Copyright © 2003, TopCoder, Inc. All rights reserved</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 33</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[6].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[6].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',6,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',6,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Standards</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 10</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Adheres to coding standards.
</p><p class="scorecardQuestion">Java: http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html
</p><p class="scorecardQuestion">.NET: http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 50</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[7].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[7].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[7].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',7,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',7,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Code uses a 4 space indentation (not a tab)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 50</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[8].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[8].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[8].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',8,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',8,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Design Adaptation</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 10</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">All class definitions found in the class diagram are accurately represented in the source code</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 34</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[9].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[9].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[9].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',9,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',9,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">All method definitions found in the class diagram are accurately represented in the source code</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 33</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[10].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[10].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[10].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',10,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',10,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">All variable definitions found in the class diagram are accurately represented in the source code</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 33</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[11].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[11].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[11].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',11,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',11,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Compatibility</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 5</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">For Java Submissions:
</p><p class="scorecardQuestion">Submission compiles against required targets.  (Execute 'ant compile_targets')
</p><p class="scorecardQuestion">This will require modification of the java_1_3_bootclasspath found in build.xml</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 5</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[12].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[12].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[12].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',12,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',12,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Test Cases</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 40</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Unit test cases exists for all public methods in the design.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 90</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[13].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[13].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[13].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',13,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',13,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">For Java Submissions:
</p><p class="scorecardQuestion">The UnitTests source file calls each unit test.
</p><p class="scorecardQuestion">.NET Submissions should receive a 4.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 10</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[14].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[14].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[14].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',14,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',14,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Test Case Results</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 35</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">The submission passes the unit tests submitted by the developer.  Disregard all other tests.  (Execute 'ant test' / 'nant test')</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 100</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
						 Pass: <input name="questions[15].totalPass" size="4" value="60" class="registerForm" type="text"><br>
						 Total: <input name="questions[15].totalTests" size="4" value="60" class="registerForm" type="text">
	
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[15].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[15].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',15,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',15,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Anonymity</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 5</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">The submission does not contain any information identifying the developer.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[16].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[16].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[16].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',16,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',16,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Overall</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 75</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">This submission is worthy of being reviewed.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 100</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[16].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[16].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[16].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',16,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',16,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td class="whiteBkgnd">Logs</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Logs</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 0</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Paste the 'compile' log below</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[17].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[17].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[17].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',17,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',17,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Paste the 'compile_tests' log below</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[18].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[18].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[18].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',18,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',18,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Paste the 'compile_targets' log below</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[19].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[19].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[19].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',19,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',19,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Paste the 'test' log below</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[20].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
					</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="3">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[20].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[20].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="set(this.form,'delete',20,0)" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="set(this.form,'add',20,0)" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	
			
		
		
	</td></tr>
</tbody></table>
				

<!-- Content ends-->
        
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr><td height="15"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="15" width="10"></td></tr>
            </tbody></table>
        </td>
<!--Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="10" width="15"></td>
<!-- Gutter 2 ends -->

    </tr>
</tbody></table>

</body></html>