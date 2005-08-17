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
.blackBkgnd
{
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
    <form name="reviewScorecardForm" method="post" action="/review/saveReviewScorecard.do"></form>
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
    				    1.0</td>
					<td class="breadcrumb" align="right" valign="bottom" width="50%">
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="http://www.topcoder.com/i/clear.gif" alt="" border="0" height="1" width="1"></td>
				</tr>
			</tbody></table>
			
			<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
				<tbody><tr>
					<td class="blackBkgnd" colspan="2">
					    Design Review Scorecard 
					    - Submission 
					    10073005</td>				
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
					<td class="whiteBkgnd">Requirements Section</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Requirements
Section
The answers to the questions should be limited to how the design meets
the requirements (both business and technical) as described in the
requirements document AND the forums for the component. </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 275
                                    </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Response
                                    </strong>
                                </td>
                            </tr>
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The
design addresses all the requirements as specified in the requirements
documents and the forum. The reviewer should be able to take each point
in the requirements document and find the associated implementation in
the design. The reviewer should ignore the quality aspects of the
implementation at this point, and only verify whether a requirement is
addressed or not. Other questions of the scorecard give you an
opportunity to express your concerns about the quality of the design.
The reviewer should read the component forum prior to doing this to
ensure that any modifications or additions to the requirements are
taken into account. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">&#8216;Core&#8217; requirements will be defined as
those requirements that are essential to component&#8217;s intent (i.e. the
component either cannot fulfill its goal or cannot provide value added
service to the customer without those requirements).
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 50
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[0].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[0].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The component specification includes a clear and easily grasped explanation of any algorithms used in the design.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should judge whether the
algorithms are complete, accurate and contain enough information for
the developer to properly implement. Please note that this review
question should judge the correctness of the algorithm and how well the
designer relates the algorithm &#8211; the grammar and spelling should NOT be
included in this question.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The component specification
is missing a description for any of the algorithms used in the design
or external research is required to understand how to implement any of
the algorithms. </p><p class="scorecardQuestion">Rating 2 &#8211; The component
specification includes all the algorithms. However, the description is
hard to understand or contains errors, misunderstandings or is
generally written in a style that is hard to understand &#8211; generally
requiring many readings to fully grasp the algorithm. The developer may
need external research to fully understand the algorithm.
</p><p class="scorecardQuestion">Rating 3 &#8211; The component
specification includes all the algorithms. The description is fairly
clear with, at most, minor errors and includes everything needed by the
developer to implement without any external research.
</p><p class="scorecardQuestion"> Rating 4 &#8211; The component
specification includes all the algorithms. The description is clear,
contains no errors and can be understood from a single reading.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 20
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[1].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[1].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The use cases cover all the business requirements as stated in the requirements document.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should be able to take
each requirement and find a use case covering that requirement (a
single use case can cover more than one requirement). Care must be
taken to ensure that the use cases are not too high-level or too
low-level. If the designer included additional functionality beyond the
requirements, that functionality must be covered by use cases also.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; A majority of the requirements are not covered by the use cases.
</p><p class="scorecardQuestion">Rating 2 &#8211; A majority of the
requirements are covered but some are missing and/or the use cases are
too high (or low) level in detail.
</p><p class="scorecardQuestion">Rating 3 &#8211; All the requirements are covered at a proper level of detail.  
</p><p class="scorecardQuestion">Rating 4 &#8211; All the requirements are
covered at a proper level of detail and the designer made proper use of
inherited/associations/extend/include semantics.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 15
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[2].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[2].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The sequence diagrams cover all the use cases.
</p><p class="scorecardQuestion">The reviewer should be able to take
each use case and find a sequence diagram that covers it. Please note
that this question allows a cascade effect with the prior question &#8211;
any missing use cases will likely have missing sequence diagrams as
well.
</p><p class="scorecardQuestion">Rating 1 &#8211; A majority of the use cases are not covered by the sequence diagrams or a majority of the use cases are missing.
</p><p class="scorecardQuestion">Rating 2 &#8211; A minority of use cases are missing their sequence diagrams or a minority of use cases are missing.
</p><p class="scorecardQuestion">Rating 3 &#8211; All the use cases are covered (and none were missing), however, a single sequence diagram covers multiple use cases.
</p><p class="scorecardQuestion">Rating 4 &#8211; All the use cases are
covered (and none were missing) and there is a one to one relationship
between use cases and sequence diagrams.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 15
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[3].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[3].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
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
		
	

	
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td class="whiteBkgnd">Approach Section</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Approach
Section
The answers to the questions should be limited to how good the
designer&#8217;s approach to designing the component was (in knowing design
standards, creating an easy to use component that is flexible and
extendable).</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 200</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The
design incorporates standard design patterns and methodologies where
applicable (e.g. Model-View-Controller, Factory Pattern, Object
Oriented design principles, follows J2EE specs).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should determine a few
things: Are the patterns/methodologies used 'forced' (i.e. is there
good justification for using the pattern or did the designer force the
pattern into the design to say they used that pattern). Are the
patterns/methodologies implemented correctly (this does not mean
completely &#8211; the design may justify a partial implementation)? Did the
designer show an understanding of the pattern/methodology? Did the
designer recognize and document all the patterns used? </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; A pattern/methodology was
inappropriately used that could cause problems either in implementing
the component or in implementing future enhancements to the component. </p><p class="scorecardQuestion">Rating 2 &#8211; An appropriate
pattern/methodology was used but the designer showed a lack of
understanding in the implementation of it. A pattern/methodology should
have been used but was not or a pattern/methodology was 'forced'.
</p><p class="scorecardQuestion">Rating 3 &#8211; Appropriate patterns
and/or methodologies were used but the designer missed some in the
component specification (either missed completely or incorrectly
labeled). </p><p class="scorecardQuestion">Rating 4 &#8211; Appropriate patterns
and/or methodologies were used and were identified correctly in the
component specification. The reviewer should also assign this rating if
the design, appropriately, does not need any patterns/methodologies.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 15
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[4].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[4].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[4].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                            
                
                <!--
                    
                  -->
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The design accounts for incorporating future enhancements and/or features beyond the requirements.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should consider what
enhancement/features the next version of the component will likely be
or what types of enhancements a client of the component will likely
request. The reviewer should then review the future enhancements that
the designer included in the component specification for their vision
of what the next likely enhancements are. The reviewer should also
consider how tightly coupled the classes were or what assumptions the
design was built upon when considering how &#8216;substantial&#8217; the
modifications would be. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The component would need a
complete redesign to accommodate reasonable enhancements within the
general scope of this component. </p><p class="scorecardQuestion">Rating 2 &#8211; The design could
accommodate reasonable enhancements within the general scope of this
component, but doing so would require substantial changes to the
design. </p><p class="scorecardQuestion">Rating 3 &#8211; The design could
accommodate reasonable enhancements within the general scope of this
component with multiple simple changes. </p><p class="scorecardQuestion">Rating 4 &#8211; The design could easily accommodate reasonable enhancements to the component.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 15
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[5].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[5].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[5].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                            
                
                <!--
                    
                  -->
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The component makes effective use of the TopCoder component catalog.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should review the
components recommended in the requirements documentation. The designer
will need to provide justification (either in the component
specification or in the component forum) if they choose not to use the
recommendations. The reviewer should also review the TopCoder catalog
for any components that could potentially be used in the component
design. The reviewer should not be critical of the designer's use,
assumptions or lack of details for components that are being proposed
in the design or are currently in the design/development stage - as
long as the designer has included verbiage in the component
specification stating that the design may need to change based on the
final 'look' of the dependent component. Please note that any
components being proposed or changed by this design is dependent upon
permission from the PM.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The design did not use any of the recommended components and did not give sufficient justification as to why.
</p><p class="scorecardQuestion">Rating 2 &#8211; The design used at least
one of the recommended components but not all and did not give any
justification as to why. Likewise, assign this rating if the designer
missed using likely components, used any other component incorrectly,
or provided flawed justification as to why a component should not be
used. </p><p class="scorecardQuestion">Rating 3 &#8211; The design used all the
recommended components correctly but missed using other components that
would make the design easier to implement without changing its overall
approach. </p><p class="scorecardQuestion">Rating 4 &#8211; The design used all
recommended and likely components that fit the designer&#8217;s approach
correctly. Likewise, assign this rating if components were
appropriately not used.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 25
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[6].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[6].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                            
                
                <!--
                    
                  -->
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The component presents an easy-to-use API for the application to use. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at the demo
section of the component specification to see the designer's vision of
how the component will be used. The reviewer should then analyze how
the API addresses the requirements and how easy it is to use the API to
accomplish the requirements. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The API demonstrates an
obvious lack of consistency, cohesion, or is generally hard to use.
Tasks (as defined by the requirements) take multiple API calls to
accomplish what should be done atomically. </p><p class="scorecardQuestion">Rating 2 &#8211; The API is not
immediately obvious; one cannot understand how to accomplish the
required tasks by looking at the class diagram and reading the demo
section (provide the name(s) of the requirement task(s) not easily
performed using the API). </p><p class="scorecardQuestion">Rating 3 &#8211; The API is obvious (by
looking at the class diagram and the demo section) but could have been
made simpler or more powerful/flexible (provide specific modifications
to the API that would make it easier to use). </p><p class="scorecardQuestion">Rating 4 &#8211; The API is consistent,
powerful, flexible, and is easy to understand. The design of the API is
driven by a single concept, making the API easy to learn. The common
tasks (as defined by the requirements) are easy to perform using the
API.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 25
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[7].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[7].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[7].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The design addresses whether the component is thread safe or not.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should review the
component specification to see if the designer addresses the thread
safety of the component. Please note that this does not mean the
components must be thread safe &#8211; it simply means whether the designer
has justified why it is or isn't thread safe. If the component is
deemed thread safe, the designer should have documented their approach
to thread safety in order to determine if the approach is sound. If the
component is deemed not to be thread safe, the designer should document
any reasons why the component is not thread safe.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; There is no mention of whether the component is thread safe or not.
</p><p class="scorecardQuestion">Rating 2 &#8211; The designer mentions thread safety but fails to provide the reasoning
</p><p class="scorecardQuestion">Rating 3 &#8211; The designer mentions thread safety but is incorrect in the reasoning
</p><p class="scorecardQuestion">Rating 4 &#8211; The designer mentions thread safety and provides correct arguments to back it up.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[8].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[8].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The classes are well scoped.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should determine whether
the classes in the design attempt has too large of a scope (it tries to
do too many tasks) or has too small of a scope (the task was broken
down into too many classes). A good clue to a violation of this is
whether the name of the class adequately encompasses the API of the
class. If so, then the class is probably properly scoped (unless the
name is too generic or too high-level). </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Multiple unrelated groups
of related classes violate scope and must be refactored into smaller or
larger classes. Describe in your comments the purpose of refactoring
for each class or a group of related classes, and state its tangible
benefits to the design.
</p><p class="scorecardQuestion">Rating 2 &#8211; A single group of related
classes violates scope and must be refactored into smaller or larger
classes. Describe in your comments the purpose of refactoring, and
state its tangible benefits to the design.
</p><p class="scorecardQuestion">Rating 3 &#8211; The classes seem fine but
at least one class could potentially benefit from being refactored.
Describe in your comments the proposed refactoring, and explain what
makes the refactored solution preferable to the designer&#8217;s solution.
</p><p class="scorecardQuestion">Rating 4 &#8211; All classes are scoped well.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 10
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[9].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[9].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[9].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                               
                        </tbody></table>
                        <!-- spacer  -->                              
                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="normal">
                                    <img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1">
                                </td>
                            </tr>
                        </tbody></table>
                    
                
                <!--
                    
                  -->

                    
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="whiteBkgnd">
                                    Design Section
                                </td>
                            </tr>
                        </tbody></table>
                    
                    
                        <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
                            <tbody><tr>
                                <td class="forumTitle" width="80%">
                                    <strong>
The answers to the questions should be limited to design fundamentals
(how well the design was executed). </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 175
                                    </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Response
                                    </strong>
                                </td>
                            </tr>
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">Sub-packages have been defined to separate functionality into maintainable units. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should make a
determination whether classes in the design could be grouped into
separate packages. This category generally applies to complex
components or components that allow for functionality to be plugged in
(where the functionality should justifiably exist in a separate
package). Note: for pluggable components, the interface,
implementations and any related abstract bases should be grouped within
the package.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The component is
sufficiently complex or uses pluggable classes that can justifiably be
separated into sub-packages and was not.
</p><p class="scorecardQuestion">Rating 2 &#8211; The designer separated
some classes into separate sub-packages but either missed some classes
or missed other sub-packages that could be justified.
</p><p class="scorecardQuestion">Rating 3 &#8211; The designer created an
unnecessary sub-package or the component could potentially benefit from
an additional sub-package (however this can not be justified).
</p><p class="scorecardQuestion">Rating 4 &#8211; The designer appropriately used sub-packages or the design did not need any sub-packages.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 15
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[10].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[10].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Modifiers
(final, abstract, synchronized, property, virtual, overrides, etc.) and
scope (private, package, public, etc.) been appropriately used in the
design in the classes/methods/variables.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Have internally used classes (to the
component) been defined incorrectly as public? Has a public class
improperly exposed protected or private members? Are abstract classes
abstract? It is strongly advised that variables have a private scope
(not even protected) and only be accessible via getter/setter methods
(exception would be C#'s property variables). C# reviewers should note
that Poseidon does not have the proper choices to fully represent the
C# modifiers and therefore should not be marked down if the designer
either uses the closest java modifier OR specifies it in the
documentation tab. Additionally, the effect of the final, virtual and
other similar modifiers on class extendibility should be considered in
this question (rather than the future enhancements question).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The designer demonstrates
obvious lack of understanding. For example, by making everything public
or by making something private that should be public.
</p><p class="scorecardQuestion">Rating 2 &#8211; The design misidentifies a majority of the modifiers or scope.
</p><p class="scorecardQuestion">Rating 3 &#8211; The designer misidentifies a minority of modifiers or scope.
</p><p class="scorecardQuestion">Rating 4 &#8211; The designer identifies the modifiers/scope appropriately.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[11].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[11].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Custom exceptions been appropriately defined and do not cover multiple, unrelated reasons.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Has the designer appropriately reused
existing system exceptions and appropriately defined custom exceptions
for the rest? The reviewer should also imagine they were using this
component in an application. If a custom exception is thrown, does it
give enough information to the application to react appropriately?
Example: an inappropriate custom exception would be some high level
exception that is thrown for multiple, unrelated, reasons. Please note
that TopCoder Software has decided that null arguments are represented
by the null specific exception (NullPointerException and
ArgumentNullException) and not the more generic
IllegalArgumentException.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Appropriate custom
exceptions were not defined or a single generic exception is used
throughout the component for every custom reason.
</p><p class="scorecardQuestion">Rating 2 &#8211; Appropriate custom
exceptions were defined but for multiple, unrelated reasons or system
exceptions were reused inappropriately (this does not include the above
null argument exception note).
</p><p class="scorecardQuestion">Rating 3 &#8211; Custom exceptions were
used appropriately for multiple, related reasons but do not give
specific reason details beyond the included text or the design
inappropriately identified a null argument exception.
</p><p class="scorecardQuestion">Rating 4 &#8211; Custom exceptions were
used appropriately and give reason details beyond simple text. Custom
exceptions were used appropriately and for a single specific reason
alone. Custom exceptions were not appropriate for this design.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[12].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[12].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Type assignments have been used appropriately for method arguments, variables and return types.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Are the type assignments correct and
what you'd expect? Are the Collection interfaces used appropriately? If
an actual array is used, is there justification why a Collection
interface is not used? An issue to check for: if the return type is a
Collection &#8211; make sure it's a clone (or similar) of the internal
Collection to avoid exposing an internally protected field. Please note
that TopCoder Software has made determination to prefer collection
interfaces to arrays in all instances except where justified
(presumably because of performance or overhead reasons and where either
standard implementations or custom implementations would not provide
the characteristics needed).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Are a majority of types
used incorrectly (not including array to collection stuff). That is, a
string used where an integer should be etc.
</p><p class="scorecardQuestion">Rating 2 &#8211; At least one type is used incorrectly (same limitation as Rating 1).
</p><p class="scorecardQuestion">Rating 3 &#8211; The types are appropriate and arrays are used where collections should have been.
</p><p class="scorecardQuestion">Rating 4 &#8211; The types are appropriate
and the collection interfaces are used where appropriate (i.e. arrays
are used when justified).</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 15
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[13].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[13].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The relationships between classes within the component and between the
component and external entities (other components, system classes) have
been appropriately defined.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Are all relationships shown? Are the
relationship attributes assigned appropriately (ordered, unordered,
aggregate, composite, etc.)? Do they contain proper labels? Two ways of
doing associations are appropriate: </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">a) Define a variable for the association, draw the association and label it with the variable. 
</p><p class="scorecardQuestion">b) Define the association and label it with a variable name &#8211; no variable needs to be shown for the relationship in the class. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Please note that extends/implement
associations do not need the realization/generalization stereotypes
assigned to them since the type of relationship inherently defines
that.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Interfaces can have associations from
them if that association is part of the contract as stated by either
the interface signature or by the documentation. Those associations
then need not be duplicated in each implementation. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; A majority (&gt;49%) of
relationships between internal classes and/or external TopCoder
components are missing from the class diagrams, or more than 90% of
relationships are missing attribute information. </p><p class="scorecardQuestion">Rating 2 &#8211; A minority (<=49%) of relationships between internal classes and/or external TopCoder components are missing from the class diagrams, or system classes are missing.</p>
<p class="scorecardQuestion">Rating 3 &#8211; Class diagrams show all relationships between internal classes and external entities (both TopCoder components and system classes). A small  number of the association attributes (<10%) are either missing or incorrect.</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 25
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[14].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[14].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[14].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The classes, methods and variables are named appropriately.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Does the name provide a hint as to
what the function of the entity is? Does the name follow system
language and TopCoder standards (capitalization, underscores, etc.)?
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The name of one or more
entities is totally misleading or incorrect for the entity&#8217;s function.
Note: the designer may challenge this if they can give sufficient
justification as to why the name is appropriate. Only &#8216;public&#8217; names
should be eligible for this rating.
</p><p class="scorecardQuestion">Rating 2 &#8211; One or more names violate
either system language or TopCoder standards. Only &#8216;public&#8217; names
should be eligible for this rating.
</p><p class="scorecardQuestion">Rating 3 &#8211; All names follow the
system language and TopCoder standards, and the names cover the
functionality of the entities; however another name may more fully
describe the functionality. All names (private or public) are eligible
for this rating.
</p><p class="scorecardQuestion">Rating 4 &#8211; All names follow the
system language and TopCoder standards and fully describe the
functionality of the entity. All names (private or public) are eligible
for this rating.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Please note that &#8216;public&#8217; is defined as:
</p><p class="scorecardQuestion"> - Public or protected class names
</p><p class="scorecardQuestion"> - Public variables or protected variables on public or protected classes
</p><p class="scorecardQuestion"> - Public methods or protected methods on public or protected classes</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[15].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[15].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The design made proper use of the language&#8217;s features.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Does the designer duplicate
functionality that is already provided by the language? Are properties,
delegates, interfaces, inheritance, networking, etc. used
appropriately? </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Language features are consistently ignored. 
</p><p class="scorecardQuestion">Rating 2 &#8211; Language features are inconsistently ignored or consistently misused. 
</p><p class="scorecardQuestion">Rating 3 &#8211; Language features are incorporated consistently and occasionally misused or abused. 
</p><p class="scorecardQuestion">Rating 4 &#8211; Language features are used correctly.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 15
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[16].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[16].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[16].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                               
                        </tbody></table>
                        <!-- spacer  -->                              
                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="normal">
                                    <img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1">
                                </td>
                            </tr>
                        </tbody></table>
                    
                
                <!--
                    
                  -->

                    
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="whiteBkgnd">
                                    Documentation Section
                                </td>
                            </tr>
                        </tbody></table>
                    
                    
                        <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
                            <tbody><tr>
                                <td class="forumTitle" width="80%">
                                    <strong>
The answers to the questions should be limited to how well the design was documented. This largely means how easy will it be to take the design and develop it.
<br><br>
This documentation is for the component developer, not the component users. It is not javadoc on how to use the method. It should contain helpful information to the developer on how to write the method and what are its constraints.
<br><br>
Please note that the reviewer should assign a 4 if any section is not applicable to the design. 
<br><br>
Reviewers should disregard whether the designer used HTML tags, properly line wrapped or even if the document is not well formed (ie HTML errors) in the documentation tab(s).  The documentation is for the developer only and will not be used for presentation purposes.
</strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 225
                                    </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Response
                                    </strong>
                                </td>
                            </tr>
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The
class documentation in the 'Documentation' tab of Poseidon provides a
high-level description of the class, its role in the overall design and
all relevant information to the developer.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
a component developer standpoint and not an application developer
standpoint. This is not javadoc on how to use the class. This should
contain helpful information to the developer on how to develop the
class and if the class is mutable or not.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Documentation is consistently missing or consistently unhelpful.
</p><p class="scorecardQuestion">Rating 2 &#8211; Documentation is missing in at least one class or consistently provides little help to the developer.
</p><p class="scorecardQuestion">Rating 3 &#8211; Documentation is complete
and adequate to develop the component but requires the designer to
answer additional questions by the developer.
</p><p class="scorecardQuestion">Rating 4 &#8211; Documentation is complete
and provides full details to the developer (the developer will likely
not require any additional information from the designer).</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 15
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[17].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[17].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The method documentation in the 'Documentation' tab of Poseidon provides a
detailed description of the method's scope, the parameters (including
what is considered valid or not), return type (range, nulls, etc.) and
any exceptions that may be thrown.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
a component developer standpoint and not an application developer
standpoint. This is not javadoc on how to use the method. This should
contain helpful information to the developer on how to develop the
method and what constraints the method will have. The designer does not
have to provide physical examples of arguments. The designer does not
have to explicitly say what is considered valid if this information is
already contained in the documentation (whether it&#8217;s in the tags or in
the free form text). The designer should not be required (nor even
recommended) to duplicate the valid/invalid information and exception
information in both the documentation tags and free form text if it&#8217;s
clearly denoted in one or the other. However, it is recommended that
complex validation (such as a regex pattern) be explained in only the
free form text. Likewise, the reviewer should assume that any variable
(null, empty string, int range, etc) is valid/invalid if not
specifically denoted as an invalid/valid by the exceptions text or
other free form information. Also note that the designer does not need
to specify &#8216;raised signals&#8217; in Poseidon if the exception has been
clearly denoted in the documentation tags or free form text.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Documentation is consistently missing or unhelpful.
</p><p class="scorecardQuestion">Rating 2 &#8211; Documentation is missing in at least one method documentation or consistently provides little help to the developer.
</p><p class="scorecardQuestion">Rating 3 &#8211; Documentation is complete
and adequate to develop the component but requires the designer to
answer additional questions by the developer.
</p><p class="scorecardQuestion">Rating 4 &#8211; Documentation is complete
and provides full details to the developer (the developer will likely
not require any additional information from the designer).</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 25
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[18].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[18].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The
variable documentation in the 'Documentation' tab of Poseidon provides
a detailed description of the variable's scope, intended usage and
potential range of values.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
a component developer standpoint and not an application developer
standpoint. This is not javadoc on how to use the variable. This should
contain helpful information to the developer on how to use the variable
and what constraints (null, range, etc.) the variable will have. The
designer should mention if the value is mutable, is set in the
constructor and potentially where it will be modified and/or used. An
initial value is not required unless appropriate for the variable
(where it&#8217;s a constant or needs to be initially set to a certain value
to ensure properly operation of the class [with proper documentation to
denote why]).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Documentation is consistently missing or unhelpful.
</p><p class="scorecardQuestion">Rating 2 &#8211; Documentation is missing in
at least one variable documentation or consistently provides little
help to the developer.
</p><p class="scorecardQuestion">Rating 3 &#8211; Documentation is complete
and adequate to develop the component but requires the designer to
answer additional questions by the developer.
</p><p class="scorecardQuestion">Rating 4 &#8211; Documentation is complete
and provides full details to the developer (the developer will likely
not require any additional information from the designer).</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[19].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[19].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The sequence diagrams provide sufficient detail for the developer to understand the interactions between classes.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The sequence diagrams should demonstrate to an adequate degree what interactions occur as a result of a method call.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Sequence diagrams do not
show sufficient details useful to a developer (e.g. they show the API
call from the application but nothing beyond that).
</p><p class="scorecardQuestion">Rating 2 &#8211; The sequence diagrams show some interaction but not enough to be able to develop from.
</p><p class="scorecardQuestion">Rating 3 &#8211; The sequence diagrams show enough detail to give the developer an idea of what occurs on the method call.
</p><p class="scorecardQuestion">Rating 4 &#8211; The sequence diagrams
clearly show the detail of what occurs on the method call and
potentially provides helpful notes on things that cannot be displayed
visually in the diagram.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 15
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[20].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[20].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[20].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                            
                
                            <tr>
                                <td class="forumTextOdd" width="80%">
<p class="scorecardQuestion">The component specification contains a comprehensive demo section.</p>
<p class="scorecardQuestion">Is the demo section complete (does it demonstrate each requirement)? Was it written in a way that 'promotes' the component (i.e. clear, demonstrates flexibility, etc.)? </p>
<p class="scorecardQuestion">The reviewer should keep in mind that the demo is not a reference implementation.  The demo should only give the reader a quick, short demonstration of the major functionality of the component and should not include every method call.  "Major functionality" would be defined as the requirements specified in the requirements documentation.</p>
<p class="scorecardQuestion">The demo section only needs to be compilable in relation to the component’s API and any other TCS component API that is exposed.  All other functionality (application provided methods, classes, objects, etc) shown can be assumed if commented properly and can include pseudo code if dealing with non-component API methods.  Examples of this would be:</p>
<p class="scorecardQuestion">a) "ACMEInterface appACME = some application provided object"</p>
<p class="scorecardQuestion">b) "Date todayPlusOne = todays date plus 1 day"</p>
<p class="scorecardQuestion">External setup information does not need to be included in the demo as long as comments provide enough information to understand what setup the demo relied on.</p>
<p class="scorecardQuestion">The output of the demo only needs to be shown (if possible) when absolutely relevant to the functionality of the component (ie the component’s job is to output something specific).  Logging or processing output does not need to be shown.</p>
<p class="scorecardQuestion">Rating 1 - Demo section is missing or the existing demo section contains non-compilable errors (just view it to make sure it looks correct). </p>
<p class="scorecardQuestion">Rating 2 - The demo section demonstrates some but not all of the requirements or the demo section demonstrates class/methods/variables that don't exist in the design.</p>
<p class="scorecardQuestion">Rating 3 - The demo section demonstrates each of the requirements correctly.</p>
<p class="scorecardQuestion">Rating 4 - The demo section demonstrates each of the requirements correctly in a clear fashion using a likely customer scenario (i.e. sets up a scenario that is similar to what a user of the component would see) or demonstrates extra functionality or flexibility.</p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 15
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[21].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[21].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[21].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                            
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The component specification contains no grammatical or spelling errors.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Was it written in a way that is easily
understandable and doesn't require multiple readings to understand?
This category should ONLY judge the grammar, sentence structure and
spelling (i.e. the knowledge transfer piece). How well the designer
explained the design structure or algorithms is addressed in a prior
question.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Useless. The document is
not helpful to readers trying to understand or implement the component
because of missing sections with critical information, frequent
spelling errors, extremely poor grammar, etc.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 2 - Marginally usable. The
document provided some helpful information, but required multiple
readings because of missing or incomplete sections, frequent spelling
errors, unconventional wordings, poor grammar, etc.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 3 &#8211; Usable. The document has no
missing or incomplete sections, and provides enough helpful information
to implement the component. The document requires significant efforts
to read because the style is inconsistent, the material is not well
organized, or there are occasional spelling or grammatical errors.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 4 &#8211; Helpful. The document is
well organized, easy to read, and stylistically consistent; it has no
missing or incomplete sections, and no spelling errors. Despite an
occasional unconventional wording or a few grammar mistakes, the
document provides significant help to anyone trying to understand or
implement the component. </p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 5
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[22].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[22].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
				        		        </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The presentation of the diagrams and specification was professional.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Did the designer make use of fonts and
colors to appropriately denote elements in the diagrams? Was the
specification formatted in a professional looking manner? Was the
diagram laid out in an easy to follow manner (most important elements
in the top left to least important at the right and bottom edges)? Were
like items grouped together (i.e. implementations [including the
abstract base] of some interface should be near the interface)? Did the
layout help you understand the design? Note: multiple class diagrams
are allowed but discouraged unless separate sub-packages were used or
the design was sufficiently complex that multiple diagrams help in the
understanding.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The presentation looks
amateur. The presentation not only lacks the above elements but also
actively confuses the reviewer in trying to understand the design. </p><p class="scorecardQuestion">Rating 2 &#8211; The presentation lacks many of the above but doesn't add to any confusion in understanding the design. 
</p><p class="scorecardQuestion">Rating 3 &#8211; The presentation looks professional but has some rough edges that can be improved upon. 
</p><p class="scorecardQuestion">Rating 4 &#8211; The presentation looks
professional, and polished, and contributes to understanding the
design. Minor errors (such as coloring, font size, etc.) are acceptable
for this rating.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 15
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[23].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[23].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[23].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                               
                        </tbody></table>
                        <!-- spacer  -->                              
                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="normal">
                                    <img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1">
                                </td>
                            </tr>
                        </tbody></table>
                    
                
                <!--
                    
                  -->

                    
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="whiteBkgnd">
                                    Overall Comments
                                </td>
                            </tr>
                        </tbody></table>
                    
                    
                        <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
                            <tbody><tr>
                                <td class="forumTitle" width="80%">
                                    <strong>
                                        Overall Comments
                                    </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 125
                                    </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Response
                                    </strong>
                                </td>
                            </tr>
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">Overall, this is a quality design that meets all requirements. 
</p><p class="scorecardQuestion">Please detail any additional comments
regarding the component design. The reviewer must include their
reasoning for assigning anything but a perfect score in this category.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 100
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    
                                    
                                        <select name="questions[24].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
                                    
                                </td>
                            </tr>
                            
                                
                                    <tr>
                                        <td colspan="2">
                                            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                <tbody><tr>
                                                    <td class="forumTextOdd" nowrap="nowrap" width="15%">
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[24].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                        <input name="submit" value="Delete" onclick="" class="submitButton" type="submit">
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="5%">
                                                        
                                                            
                                                            <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
                                                                                          
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                        </td>
                                    </tr>
                                
                            
                               
                        </tbody></table>
                        <!-- spacer  -->                              
                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="normal">
                                    <img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="5" width="1">
                                </td>
                            </tr>
                        </tbody></table>
                    
                
            </td>
        </tr>

        <!-- Bottom Buttons -->   
        <tr>
            <td class="lightBkgnd" align="center">
                <table border="0" cellpadding="0" cellspacing="4">
                    <tbody><tr>
                        

                        <td>
                            <input name="submit" value="Save and Mark as Complete" onclick="" class="submitButton" type="submit">
                        </td>
                    </tr>
                </tbody></table>
            </td>
        </tr>
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Overall, this is a quality design that meets all requirements.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Please detail any additional comments regarding the component design.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 100
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[24].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[24].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%">
				        		    <select name="questions[24].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment" selected="selected">Comment</option></select>
			                    </td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
				        		    
				        		    <input name="submit" value="Delete" onclick="" class="submitButton" type="submit"></td>
				        		<td class="forumTextOdd" valign="middle" width="5%">
							        		
				        		    
				        		    <input name="submit" value="Add" onclick="" class="submitButton" type="submit">
							        		        
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
