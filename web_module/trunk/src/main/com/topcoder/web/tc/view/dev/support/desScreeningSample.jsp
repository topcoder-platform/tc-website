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
<input name="id" value="10067147" type="hidden">
    <input value="296145" name="rid" type="hidden">
    <input value="275071" name="sid" type="hidden">
    <input value="admin" name="action" type="hidden">
    <input value="-1" name="questionIndex" type="hidden">
    <input value="-1" name="responseIndex" type="hidden">
    
	<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
    <form name="screeningScorecardForm" method="post" action="/review/saveScreeningScorecard.do"></form>
    <tbody><tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td align="left" width="5%">
						<img src="http://software.topcoder.com/images/icon_design.gif" alt="" height="62" width="66">
					</td>
                    <td width="5%">
					</td>
					<td class="tableHeader" nowrap="nowrap" width="40%">
				        <strong>Component Name</strong> 
    			        version
    			        1.0
					</td>
					<td class="breadcrumb" align="right" valign="bottom" width="50%">
						
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="1" width="1"></td>
				</tr>
			</tbody></table>
			
			<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
				<tbody><tr>
					<td class="blackBkgnd" colspan="2">
                        Design Screening Scorecard 
						- Submission 10073005</td>
				</tr>
				<tr>
					<td colspan="2" class="forumTextOdd">For
the Design Checklist, mark each deliverable as Yes, it exists; No, it
does not exist; N/A, this deliverable was not required. For the Design
Review, provide a score for each statement according to the dropdown
answers.</td>
				</tr>
			</tbody></table>
						
			
			
<!-- Start Text -->

	
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td class="whiteBkgnd">Minimum Requirements Checklist</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Minimum Requirements Checklist</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 0</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Diagrams exist in a .zuml file that can be opened using Poseidon.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[0].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">A Class Diagram exists in the .zuml file.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[1].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Use-Case Diagram(s) exist(s) in the .zuml file.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[2].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Sequence Diagram(s) exist(s) in the .zuml file.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[3].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Component Specification exists.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[4].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">If
algorithms are required in section 1.3 of the Requirements
Specification, are algorithms defined in section 1.3 of the Component
Specification?
</p><p class="scorecardQuestion">If algorithms are not required, disregard this question.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 1</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[5].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
					</td>
			    </tr>
	
    	
		    </tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
		
	

	
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td class="whiteBkgnd">Design Review</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Class Definition</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 30</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Provides a descriptive overview of class usage in the Documentation tab of Poseidon</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 10</p></td>
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
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Where applicable sub-packages have been created to separate functionality.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 10</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[7].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Class scope properly matches class usage. (i.e. objects defined as public packages)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 20</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[8].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Proper and effective use of inheritance and abstraction.  The Component is designed to be extended</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 20</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[9].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Interfaces are used appropriately.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 20</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[10].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Suitable constructors are defined for the component.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 10</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[11].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Class modifiers such as final, static, abstract are appropriately used where applicable.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 10</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[12].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[12].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Variable Definition</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 10</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Variable scope is correctly defined (i.e. the variables are well encapsulated.)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 33</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[13].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Type assignments are defined with respect to both efficiency and flexibility as pertains to this component.
</p><p class="scorecardQuestion">(i.e. generic objects may be used to increase component flexibility at the cost of efficiency.)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 34</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[14].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Variable details (scope, type, name, description) are defined in the 'Documentation' tab of Poseidon.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 33</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[15].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[15].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Method Definition</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 15</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Method scope is correctly defined (i.e. Not everything is public.)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 15</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[17].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">All exceptions are properly handled and thrown.  Custom exceptions must be displayed in the diagram.
</p><p class="scorecardQuestion">(If exceptions are not detailed in the Class Diagram, they must be detailed in the Component Specification.)</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 15</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[18].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Modifiers are properly used where applicable.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 14</p></td>
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[19].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Return types are appropriately defined.
</p><p class="scorecardQuestion">(i.e. instead of returning a Boolean for success/failure, an Exception is thrown).</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 14</p></td>
			    	<td class="forumTextOdd" valign="top" width="1%">
	
	
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
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[20].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Method arguments are appropriately defined (i.e. instead of passing in 10+ arguments an object is passed in).</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 14</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[21].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[21].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">The required API as stated in the requirements specification is available.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 14</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[22].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[22].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Method details (scope, type, name, description) are defined in the 'Documentation' tab of Poseidon.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 14</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[23].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[23].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Diagrams</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 35</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">The Use Case Diagrams reflect the functionality as outlined in the Requirements Specification.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 50</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[24].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[24].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Anonymity</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 10</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">The submission does not contain any information identifying the designer.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 100</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[25].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[25].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Diagrams</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 35</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">At
least one Sequence Diagram exists for each concrete Use Case in the Use
Case Diagrams. Each Sequence Diagram should have the same name as the
Use Case it defines.</p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 50</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[26].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[26].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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
		
	

	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
					
			    <tbody><tr>
			    	<td class="forumTitle" width="90%">
			    	    <strong>Overall</strong></td>
			    	<td class="forumTitle" nowrap="nowrap"><strong>Weight: 50</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="90%"><p class="scorecardQuestion">Is this submission worthy of being reviewed.  </p></td>
			    	<td class="forumTextOdd" nowrap="nowrap"><p class="scorecardQuestion">Weight: 100</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[27].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
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
				        		    <select name="questions[27].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%"> 
							        		
				        		    
				        		    <input name="submit" value="Add" class="submitButton" type="submit">
							        		        
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