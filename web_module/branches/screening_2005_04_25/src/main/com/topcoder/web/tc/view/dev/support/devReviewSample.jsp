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
<input name="org.apache.struts.taglib.html.TOKEN" value="b1debc3fb85df669530f79bb1a07c43" type="hidden">
    <input value="10250375" name="id" type="hidden">
    <input value="310233" name="rid" type="hidden">
    <input value="266149" name="sid" type="hidden">
    <input value="admin" name="action" type="hidden">
    <input value="-1" name="questionIndex" type="hidden">
    <input value="-1" name="responseIndex" type="hidden">
        
	<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
    <form name="reviewScorecardForm" method="post" action="/review/saveReviewScorecard.do"></form><tbody><tr>
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
    				    1.0</td>
					<td class="breadcrumb" align="right" valign="bottom" width="50%"></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="1" width="1"></td>
				</tr>
			</tbody></table>
			
			<table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
				<tbody><tr>
					<td class="blackBkgnd" colspan="2">
					    Development Review Scorecard 
					    - Submission 
					    00000000</td>				
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
					<td class="whiteBkgnd">Component Development</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Component Development</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 200</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The implementation addresses the functionality as detailed in the component design documents.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check whether and
how well all the functionality outlined in the design is implemented.
Each method should be implemented based on the provided documentation.
The functionality of the component as a whole should be implemented as
it was described in the documentation. Where applicable, list the
missing elements below.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The implementation misses
items included in the design documentation, and as a result, the
required functionality is no longer provided, or the component simply
does not work. A missing method implementation should fall in this
category, if the method is reasonably important. If one or two setters
or getters are not implemented, and the code from the stubs is left
instead, then it should be ignored. However, if that becomes a pattern
of the implementation, then 1 should be given.
</p><p class="scorecardQuestion">Rating 2 - Some things are not
implemented exactly as the design says, but the functionality of the
component is still provided. For example, for some input, the output is
not exactly as the design provides. If there is no effect on the
functionality of the component as a whole, especially if the method is
not a public one, then this score should be given.
</p><p class="scorecardQuestion">Rating 3 - The implementation follows
the design documentation. This score applies even if one or two minor
things are not implemented as the design says. For example, some
exception handling may not be implemented exactly as outlined in the
design, but there should be no influence on the functionality.
</p><p class="scorecardQuestion">Rating 4 - The implementation is a quality one, follows the design documentation, and may even have some improvements.
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
				        		    <textarea name="questions[0].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[0].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The implementation correctly uses the technologies that are specific to the component. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check if the
technologies and components specific to the component are used and used
properly. For example, if a singleton pattern is required--Is it
implemented correctly? In a thread safe manner? Are TopCoder components
or other third party libraries used properly? Are other technologies
used or implemented properly (e.g. XML, JDBC, EJB, servlet, JSP)? </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Components and technologies
are not used, or used improperly affecting the functionality of the
component or making the component unusable.
</p><p class="scorecardQuestion">Rating 2 - Some components and
technologies are not used, which that slightly influences the
performance or results in excessive amounts of code. Same score applies
if some components and technologies are not used as the best practice
dictates, but the final goal is achieved nevertheless.
</p><p class="scorecardQuestion">Rating 3 - Components and technologies are used properly.
</p><p class="scorecardQuestion">Rating 4 - Components and technologies
are used properly beyond what is outlined in the design. The
implementation is not a simple copy/paste of the code provided in the
spec. It is clear that the developer has done some research of his/her
own (or already possessed the knowledge). This is the case usually when
the design does a poor job in explaining how the technologies and
components should be used.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 25
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
				        		    <textarea name="questions[1].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[1].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The submission properly implements required algorithms as defined in section 1.3 of the Component Specification.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at the
presence and quality of the required algorithms. All algorithms must be
implemented as described in the algorithms section. Improvements are
allowed and encouraged, as long they are properly explained and
documented. They do not necessarily have to be approved in the forums,
because they can be considered a competitive advantage, but they should
be at least approved by the PM in a private mail. Fixing mistakes is
not considered an improvement. If an algorithm has mistakes in the
design or it is not appropriate, then it is up to the developer to fix
it or work with the designer on it.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Some algorithms are missing
or are implemented so poorly that the component does not work in the
way it was intended to.
</p><p class="scorecardQuestion">Rating 2 - Some algorithms are not
implemented as the design specifies, and this slightly affects the
performance of the component or the elegance of the implementation.
</p><p class="scorecardQuestion">Rating 3 - The algorithms are implemented properly.
</p><p class="scorecardQuestion">Rating 4 - All algorithms are
implemented properly and efficiently and the developer brings
improvements beyond the design. Direct translations of the pseudocode
from the spec (or even copy/paste) should not be awarded with this
score.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 25
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
				        		    <textarea name="questions[2].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[2].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
					<td class="whiteBkgnd">Definitions</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Definitions</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 100</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">All
classes, methods and variables declarations are exactly as they are
defined in the design documents (visibility, types, modifiers, names,
exception list).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should verify the
conformity of the implementation to the design. No changes and no
missing entities are permitted (unless previously approved by the
designer in the forums).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Some entities are missing
or are changed in a way that makes the component no longer able to
provide some functionality or the usage is changed.
</p><p class="scorecardQuestion">Rating 2 - The API is affected but
the usage remains the same (changes in names, added exceptions, widened
visibilities or changes in types).
</p><p class="scorecardQuestion">Rating 3 - One or two changes are present that have no effect on the usage (i.e., final modifiers).
</p><p class="scorecardQuestion">Rating 4 - Everything is declared exactly as in the design.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 40
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
				        		    <textarea name="questions[3].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[3].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">No additional public or protected entities are present in the design.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check whether
there are additional entities and whether they are reasonable
additions. Package private and protected variables are not allowed.
Package private methods are allowed, as long as they fit naturally into
the design. Package private classes are allowed also, if they are used
to provide helper methods. Private variables, methods and inner classes
are allowed. All added entities must follow the language naming
conventions and must use proper English. Note that when there are
multiple packages, helper classes may need to be public. In this case,
the restriction about adding public classes and methods is relaxed.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Many restricted entities are added without being necessary or the additions are not explained at all.
</p><p class="scorecardQuestion">Rating 2 - Entities are added and they are reasonable, but the reasons are not well explained.
</p><p class="scorecardQuestion">Rating 3 - The added entities seem
fine. If they have naming problems or use incorrect English, then this
score should be given. However, if the problems are more than just a
few typos, then lower scores can be considered.
</p><p class="scorecardQuestion">Rating 4 - Nothing is added or the added entities are well justified, well named and properly documented.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 30
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[4].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[4].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The implementation properly maps class relationships.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check if the
interaction between the classes conforms to the relationships defined
by the design. All defined relationships must be implemented and no
additional relationships can be introduced. For example, package
private methods are a form of dependency between the owner class and
the caller class. The developer is allowed to add package private
methods only when the dependency already exists.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - There are relationships
that are not implemented which seriously affect the component (missing
inheritance, missing associations, unused helper classes that result in
unused code) or the added relationships break design patterns (creates
coupling between classes).
</p><p class="scorecardQuestion">Rating 2 - Some relationships are not
implemented but they do not affect the component (for example a
dependency to a class is not used, and an alternae route is used for
getting some information) or some relationships are added without being
necessary that do not break any design pattern and do not tighten the
coupling between the classes unnecessarily.
</p><p class="scorecardQuestion">Rating 3 - All relationships are
implemented properly but some minor additional relationships are
present. These additional relationships must be necessary to the design
(the designer has overlooked the issues and there is no reasonable way
to eliminate them) but the developer added them without prior approval
from the designer.
</p><p class="scorecardQuestion">Rating 4 - All relationships are implemented properly and no additional relationships are present.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 30
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[5].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[5].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
					<td class="whiteBkgnd">Code Review</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Code Review</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 150</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The object types defined in the implementation are the best choice for the intended usage.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look here for
variable and object types that are not the best choice (from a
performance or memory consumption point of view). For example, using a
Vector instead of an array. Interfaces should be used for attribute
types instead of the concrete implementation classes where possible
(e.g., List instead of ArrayList). Efficiency is a primary concern
here. For example, HashMaps should be used instead of TreeMaps, unless
key order is important.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Sub-efficient object types are consistently used and this could potentially affect the performance of the component.
</p><p class="scorecardQuestion">Rating 2 - Some less efficient object types are used but this is not a pattern of misuse throughout the implementation.
</p><p class="scorecardQuestion">Rating 3 - Concrete classes are used instead of interfaces as variable types.
</p><p class="scorecardQuestion">Rating 4 - No better object types can be found and interfaces are used everywhere as variable types.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 20
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[6].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[6].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">There is no useless code.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look for pieces of
code that are not needed. Such code includes emulating standard Java
functionality (such as array copying), code that can be easily
simplified, unused variables, assignments to variables that are not
used afterwards. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Useless code is present in many places and that seems to be a pattern in the implementation.
</p><p class="scorecardQuestion">Rating 2 - There are some pieces of code that could be simplified with little modification.
</p><p class="scorecardQuestion">Rating 3 - Some useless code appears by accident.
</p><p class="scorecardQuestion">Rating 4 - No useless code can be found.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[7].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[7].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">There is no code redundancy.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should score here how
well the developer managed to avoid code redundancy. There should be no
duplicated pieces of code. The developer should factor out code into
helper classes or private methods and implement overloads if possible.
This factorisation should not go to the opposite extreme either. The
end result should not be a class with many small helper methods that do
very little. Every method used to factor code should have well defined
functionality and should fit naturally in the design.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The code is consistently
duplicated. Large pieces of common code are copied in different places
and there seems to be no effort to avoid such situations.
</p><p class="scorecardQuestion">Rating 2 - Some duplication exists but there are signs that the developer paid some attention to redundancy.
</p><p class="scorecardQuestion">Rating 3 - No code redundancy exists.
</p><p class="scorecardQuestion">Rating 4 - No code redundancy exists and the developer uses elegant techniques to avoid it.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 20
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
				        		    <textarea name="questions[8].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[8].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The code is clear and efficient.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer is supposed to score here
the clarity, the elegance and the efficiency of the code. The code
should not be more complicated than it needs to be for what it does. It
should not use complicated `if&#8217; constructs that make it hard to follow.
There should not be huge pieces of code. Where needed, private methods
should be used to reduce the complexity. The code should be as
efficient as possible and different optimisation techniques could be
used to achieve that (e.g., caching information, breaking out of loops
once the result is obtained). However, the optimisations should be used
wisely without going to the opposite extreme where the optimisations
affect the clarity and the elegance of the code, without bringing
significant benefits.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Complicated code is written
for simple tasks to such a degree that the code can no longer be
followed. Unnecessary complications and sub-efficient code is a pattern
in this implementation. The code is neither clear nor efficient.
</p><p class="scorecardQuestion">Rating 2 - The code clarity and
efficiency could benefit from some improvements but it is obvious that
the developer was concerned with these aspects. The same score should
be given if the balance between clarity and efficiency is not right.
</p><p class="scorecardQuestion">Rating 3 - The code is clear and
efficient where needed. This score should be given if there aren&#8217;t any
obvious places that need improvement but the developer did not show any
special skills in the written code.
</p><p class="scorecardQuestion">Rating 4 - The code is clear and easy
to understand. Necessary optimisations are used but without going to
the extreme of sacrificing the code clarity for insignificant gains.
The developer has shown obvious skills in writing clear and efficient
code.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 30
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[9].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[9].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The thrown exceptions provide suitable error messages and cause (where appropriate).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check whether the
exceptions provide useful error messages.The spelling of the messages
should be checked, too.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - No messages at all or the messages are so poorly written that they aren&#8217;t very useful.
</p><p class="scorecardQuestion">Rating 2 - Consistent errors in messages are present but the messages are still comprehendable.
</p><p class="scorecardQuestion">Rating 3 - Some minor typos or some isolated situations in which the messages are missing.
</p><p class="scorecardQuestion">Rating 4 - Meaningful and correct error messages are provided for each thrown exception.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
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
				        		    <textarea name="questions[10].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[10].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">All code, including test cases, follows the TopCoder coding conventions.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check here the
code style used by the developer. Tools such as Checkstyle should be
used to properly check it. In addition, there should be no tabs, proper
tags (author, version) and copyright section. Because there are tools
to check the code style automatically, nothing less than perfect from
the code style point of view should be tolerated.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Consistent code violations are present to such a degree that the code looks bad.
</p><p class="scorecardQuestion">Rating 2 - Many code violations are present, but when looking at the code, it still seems professional.
</p><p class="scorecardQuestion">Rating 3 - Some minor code violations are present here and there.
</p><p class="scorecardQuestion">Rating 4 - The code style is perfect and every element is present.
</p><p class="scorecardQuestion"></p></td>
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
				        		    <textarea name="questions[11].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[11].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
					<td class="whiteBkgnd">Documentation</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Documentation</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 150</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The
implementation code contains detailed documentation for classes,
written in Javadoc / XML style as required by the Java / C# coding
standards.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
an application developer standpoint. Class documentation should contain
a description of the class and its purpose. The documentation should
emphasize how the class will be used and also if it is subject to
future extensions (subclassing, for example). Class documentation
should contain code examples of class usage where this is the case.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Documentation is missing
for one or more classes or it proves to be consistently unhelpful. The
documentation provided by the developer does not clarify how most of
the classes will be used, by providing simple comments that do not
bring additional value to the name of the class. </p><p class="scorecardQuestion">Rating 2 - Documentation exists for
each class in the design but it provides little help to the developer;
it is missing details regarding the way a class is intended to be used.
</p><p class="scorecardQuestion">Rating 3 - Documentation is complete
and adequate to use the component but requires further minor
clarifications in several situations.
</p><p class="scorecardQuestion">Rating 4 - Documentation is complete
and provides full details to the application developer using this
component. The developer will likely not require any other details on
how the component will be used.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 25
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
				        		    <textarea name="questions[12].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[12].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The
implementation code contains detailed documentation for methods,
written in Javadoc / XML style as required by the Java / C# coding
standards.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
an application developer standpoint. Method documentation should
contain a detailed description of the method which can include: intent
of method, pre and post conditions, side effects, dependencies,
implementation notes, who should be calling this method, whether the
method should or should not be overridden, where to invoke super when
overriding, control flow or state dependencies that need to exist
before calling this method. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">All required tags defining parameters, return type and exceptions should be present and correctly describe method details.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Method documentation should contain code examples where appropriate.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Documentation is
consistently missing or consistently unhelpful. A majority of the
methods either lack documentation or do not provide required details.
</p><p class="scorecardQuestion">Rating 2 - Documentation is missing on at least one method or provides little help to the developer.
</p><p class="scorecardQuestion">Rating 3 - Documentation is complete and adequate to use the component but may require further clarifications.
</p><p class="scorecardQuestion">Rating 4 - Documentation is complete
and provides full details to the application developer using this
component. The developer should not require any additional information
on how the component will be used.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 25
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
				        		    <textarea name="questions[13].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[13].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The
implementation code contains detailed documentation for variables,
written in Javadoc / XML style as required by the Java / C# coding
standards.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
an application developer standpoint. Variable documentation should
contain a description of the variable role and purpose, implementation
notes and whether it is intended to be used in subclasses. Variable
documentation should exist for all variables in the design, regardless
of the visibility of the variable.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Documentation is
consistently missing or consistently unhelpful. A majority of the
variables either miss documentation or do not provide required details.
</p><p class="scorecardQuestion">Rating 2 - Documentation is missing on at least one variable or provides little help to the developer.
</p><p class="scorecardQuestion">Rating 3 - Documentation is complete and adequate to use the component but may require further clarifications.
</p><p class="scorecardQuestion">Rating 4 - Documentation is complete
and provides full details to the application developer using this
component. The developer should not require any additional information
on how the component will be used.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[14].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[14].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The implementation code contains detailed documentation.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
a future component maintenance developer standpoint. This issue also
ensures that there are no useless comments that pollute source code and
make it hard to understand. At a minimum, the developer should provide
meaningful comments for blocks of code in methods, describing what it
is trying to do, the assumptions made and the way it is done.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Documentation is consistently missing or consistently not helpful.
</p><p class="scorecardQuestion">Rating 2 - Documentation is missing in
at least one important algorithm / code block or consistently provides
little help to the developer. Documentation contains useless comments
that do not provide any value to the implementation, but only make it
harder to read / understand.
</p><p class="scorecardQuestion">Rating 3 - Documentation is complete
and adequate to understand the implementation, but there may be several
places where it can further be enhanced with useful details, or
simplified by removing useless comments.
</p><p class="scorecardQuestion">Rating 4 - Documentation is clear, complete and concise, helping in clarifying implementation decisions and details.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 20
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
				        		    <textarea name="questions[15].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[15].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">There are no errors and no warnings while generating the Javadoc / XML documentation.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">That means the documentation must be
perfect from a syntactical point of view. There should be no missing
tags, no additional tags, not even for private members or inner
classes. Tools such as javadoc, Checkstyle or features of the modern
IDEs should be used to check it. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">No - The documentation misses documentation tags or generates warnings and errors for different other reasons.
</p><p class="scorecardQuestion">Yes - The documentation is correct and complete.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[16].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
			    	</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The component documentation contains no grammatical or spelling errors.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The developer made so many
grammatical or spelling errors that one cannot understand what the
developer is trying to relate.
</p><p class="scorecardQuestion">Rating 2 - The developer made a
number of grammatical or spelling errors but the overall knowledge
transfer can be made with multiple readings. </p><p class="scorecardQuestion">Rating 3 - The developer made some grammatical or spelling errors but the points were quickly understandable. 
</p><p class="scorecardQuestion">Rating 4 - The developer was concise and made no grammatical or spelling errors.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
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
				        		    <textarea name="questions[17].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[17].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>


			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The algorithms, test setup, dependencies, and demo sections of the Component Specification document have been properly updated if necessary.  If no changes were needed, assign a 4 here.  If other sections need to change to reflect the implementation, they should be up to date as well.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The Component Specification has not been updated and needs modifications.
</p><p class="scorecardQuestion">Rating 2 - Major modifications are needed.
</p><p class="scorecardQuestion">Rating 3 - Some minor modifications are needed. 
</p><p class="scorecardQuestion">Rating 4 - The Component Specification needs no modifications to properly reflect the component as developed.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 20
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
				        		    <textarea name="questions[17].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[17].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
					<td class="whiteBkgnd">Unit Test Cases</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Unit Test Cases</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 150</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Unit Test Cases test all methods and constructors.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should verify if for each
public method and constructor defined by the component, the developer
provided test methods. The reviewer should focus on the existence of
the test methods, instead of focusing on their quality. The Test Case
containing the demonstration of the component will not be considered
when counting existing test methods.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Most of the test methods
are missing or the existing test methods incorrectly test the
functionality of the component.
</p><p class="scorecardQuestion">Rating 2 - The submission does not
contain test methods for trivial functionality of the component, such
as set / get methods or exception constructors. However, this does not
appear to be a pattern throughout the unit testing.
</p><p class="scorecardQuestion">Rating 3 - There is at least one test method for each public method and constructor.
</p><p class="scorecardQuestion">Rating 4 - There are several test methods for each public method and constructor.
</p><p class="scorecardQuestion"></p></td>
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
				        		    <textarea name="questions[18].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[18].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Unit Test cases contain an implementation or a demonstration of how the component will be used.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Unit Test cases should contain at
least an implementation of the &#8220;demo&#8221; provided by the designer in the
Component Specification (if one is provided). The developer can and is
encouraged to provide more test methods that demonstrate the way the
component will be used by a future client. The test methods that are
used as a demonstration should be grouped in the same Test Case. If the
Component Specification does not contain a proper &#8220;demo&#8221; section, the
developer is still responsible for providing one in their unit test
cases.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this
section from the point of view of a client and identify if the provided
demonstration suits the needs of such a client, by helping the client
understand how the component is used.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - No demonstration of the
component usage is provided, or the one provided is not helpful or does
not refer to important basic functionality of the component. Basic
functionality is that functionality that is essential to the component.
</p><p class="scorecardQuestion">Rating 2 - The provided demonstration
properly describes the usage of the basic functionality of the
component, but fails to present a demonstration of additional non-basic
functionality or fails to implement the &#8220;demo&#8221; in the Component
Specification.
</p><p class="scorecardQuestion">Rating 3 - The provided demonstration
properly addresses the usage of the component and contains an
implementation of the &#8220;demo&#8221; section as provided by the designer in the
Component Specification.
</p><p class="scorecardQuestion">Rating 4 - The provided demonstration
is clear, helpful and addresses all the needs of a client. All basic
and additional functionality of the component is described, and
properly documented.
</p><p class="scorecardQuestion"></p></td>
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
				        		    <textarea name="questions[19].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[19].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Unit Test Cases thoroughly and correctly test all methods and constructors.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Unit tests evaluate every public
method in the component to ensure that valid and invalid inputs are
handled properly and as defined in the documentation. The reviewer
should focus on verifying the correctness and the quality of the test
methods provided by the developer. The existing test methods should
correctly test the functionality of the component as detailed in the
documentation. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The Unit Test Cases consider using
real data and appropriately configure the system as it is expected to
be in the real world. For example, if a component implies using a
database, the Unit Test Cases should provide test methods that interact
with the database, instead of providing mock-ups of data.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The unit tests do not
correctly and thoroughly test the basic functionality of the component.
The developer provided tests that address only valid or invalid
arguments, or do not test the component using real values and system
configuration. Basic functionality is that functionality that is
essential to the component.
</p><p class="scorecardQuestion">Rating 2 - The unit tests do not
thoroughly test the additional functionality of the component. The
developer provided tests that address only valid or invalid arguments,
or does not test the component using real values and system
configuration. </p><p class="scorecardQuestion">Rating 3 - The unit tests correctly
and thoroughly test the functionality of the component. Basic and
additional functionality of the component are addressed and tested
using real values and system configuration, as it is expected to be run
on the client&#8217;s computer.
</p><p class="scorecardQuestion">Rating 4 - The submission is properly
tested using different types of tests that address different aspects of
each tested method or constructor. For example, if an algorithm has
time constraints it should be tested not only for accuracy but also to
see if it respects the constraints. When testing for accuracy, an
algorithm should be presented with different sets of data. </p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 25
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[20].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[20].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Where applicable, Unit Test Cases properly configure the test environment.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should check if the Unit
Test Cases wisely configure the test environment using setup and
teardown methods, without duplicating the configuration with each test
method. Also, the configuration should address only required items, and
should not contain more configurations than needed. The reviewer should
also look for extra initializations that affect the performance of unit
testing. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The unit test methods should not
contain configuration details that are system specific. They must be
stored in separate configuration files and loaded when needed.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The test environment is not
configured using setup and teardown methods, but instead the
configuration is repeated over and over for a majority of the test
methods, or the test methods contain configuration details that should
have been stored in configuration files.
</p><p class="scorecardQuestion">Rating 2 - In several places, setup
and teardown contain configuration and initialization sections that
either do not address all entities of the environment, or address more
entities than needed, or affect the performance of the unit testing.
</p><p class="scorecardQuestion">Rating 3 - Setup and teardown contain
configuration and initialization sections that either do not address
all entities of the environment, or address more entities than needed.
The missed or added entities should represent minor details, such as
repeatedly initializing the same variable without affecting the
performance or the integrity of the unit testing.
</p><p class="scorecardQuestion">Rating 4 - Setup and teardown are
used wisely for configuring the test environment, and configuration
details that are system specific are stored in configuration files.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 10
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
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[21].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[21].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
			                    </td>
				        	</tr>
				        </tbody></table>
				    </td>
				</tr>
		
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Where applicable, files used in Unit Test Cases exist in the /test_files directory.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should verify that all
test files and configuration files used in Unit Testing exist and are
located in the /test_files directory.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">No - The developer either provided invalid files or did not store them in the appropriate /test_files directory.
</p><p class="scorecardQuestion">Yes - All files used in the Unit
Testing exist in the /test_files directory or there are no test files
or configuration files used.</p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 5
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[22].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
			    	</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">Where
applicable, Unit Test cases do not leave temporary files on the file
system, open network or database connections, open files or streams
after testing is complete.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The system is not affected after unit
testing of the component, meaning that no temporary files are left on
the file system, no network / database connections are left open, no
files / streams are left open.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">No - Temporary files are left on the file system or database / network connections are not closed after testing is complete.
</p><p class="scorecardQuestion">Yes - Temporary files are removed from
the file system after testing is complete and temporary files are
created only when needed.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 5
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[23].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="Yes">Yes</option><option value="No">No</option></select>
	
			    	</td>
			    </tr>
	
    

	
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The unit test code contains detailed documentation for classes, methods and variables as defined in the Deliverables Document.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
a future component maintenance developer standpoint. Unit tests
documentation should contain details about what is tested (which method
/ constructor), the expected behaviour and the arguments used. The
quality of the documentation has to be the same as for the component
code.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - Documentation is consistently missing or consistently not helpful.
</p><p class="scorecardQuestion">Rating 2 - Documentation is missing on
at least one test method or consistently provides little help to the
maintenance developer.
</p><p class="scorecardQuestion">Rating 3 - Documentation is complete and adequate to use the component but may require further clarifications.
</p><p class="scorecardQuestion">Rating 4 - Documentation is complete
and provides full details to the developer maintaining this component.
The developer should not require any additional information on how the
testing of the component will be maintained or enhanced.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 20
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
				        		    <select name="questions[24].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
					<td class="whiteBkgnd">Review Board Test Cases</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Review Board Test Cases</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 100</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">(Stress, Accuracy or Failure tests)
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Stress / Benchmark - Tests the implementation according to performance and throughput. Output basic benchmarking to System.out.
</p><p class="scorecardQuestion">Accuracy - Tests the implementation on the accuracy of the results when using the component.
</p><p class="scorecardQuestion">Failure - Tests the implementation's ability to handle bad data and incorrect usage.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Please specify the type of test cases
that were authored and executed, the total number of tests and the
number of tests that were successful.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 100
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
						 Pass: <input name="questions[25].totalPass" size="4" value="5" class="registerForm" type="text"><br>
						 Total: <input name="questions[25].totalTests" size="4" value="5" class="registerForm" type="text">
	
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[25].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[25].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
					<td class="whiteBkgnd">Overall Comments</td>
				</tr>
			</tbody></table>
	
    
		    <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
			    <tbody><tr>
			    	<td class="forumTitle" width="80%">
			    	    <strong>Overall Comments</strong></td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Weight: 150</strong>
			    	</td>
			    	<td class="forumTitleCenter" width="10%">
			    	    <strong>Response</strong></td>
			    </tr>
    
    
			    <tr>
			    	<td class="forumTextOdd" width="80%"><p class="scorecardQuestion">The
reviewer should evaluate the submission as a whole in this item. The
evaluation criteria include how much work needs to be done to complete
it, whether the submission deserves to pass or not, and it&#8217;s level of
quality compared to an average submission that meets all requirements.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 - The submission is lacking in many areas. In order to complete it, much work needs to be done.
</p><p class="scorecardQuestion">Rating 2 - The submission is lacking
in many areas but the component still works and it is possible to test
it. The problems it has should be fixable without much effort.
</p><p class="scorecardQuestion">Rating 3 - The submission meets all
requirements but it doesn&#8217;t excel in any way. The fixes that need to be
done should not be significant. The submission should be of average
quality.
</p><p class="scorecardQuestion">Rating 4 - The submission excels in
many areas. All requirements are met and some are exceeded. In order to
complete the component, only minor items need to be fixed. This
submission is clearly above average.
</p><p class="scorecardQuestion"></p></td>
			    	<td class="forumTextOdd" valign="top" width="10%">
			    	    Weight: 100
			    	</td>
			    	<td class="forumTextOdd" valign="top" width="10%">
	
	
			    	    <select name="questions[26].evaluation" class="searchForm"><option value="Answer">Answer</option><option value="1 - Strongly Disagree">1 - Strongly Disagree</option><option value="2 - Somewhat Agree">2 - Somewhat Agree</option><option value="3 - Agree">3 - Agree</option><option value="4 - Strongly Agree">4 - Strongly Agree</option></select>
	
			    	</td>
			    </tr>
	
	    
			    <tr>
			        <td colspan="2">
			            <table class="whiteBkgnd" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
			
				        	<tbody><tr>
				        		<td class="forumTextOdd" nowrap="nowrap" width="15%">
				        		    <strong>Response 1:</strong></td>
				        		<td class="forumTextOdd" width="60%">
				        		    <textarea name="questions[26].responses[0].responseText" cols="65" rows="2"></textarea></td>
				        		<td class="forumTextOdd" valign="middle" width="15%"> 
				        		    <select name="questions[26].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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