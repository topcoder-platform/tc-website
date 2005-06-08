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
    <TD width=15><IMG height=10 alt="" src="/i/clear.gif" 
      width=15 border=0> </TD>
<!-- Gutter 1 ends -->
<!-- Middle Column begins -->
        <td width="100%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr valign="top">
                    <td class="normal"><img src="/i/clear.gif" alt="" border="0" height="15" width="100"></td>
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
<input name="id" value="15150166" type="hidden">
        <input value="156859" name="rid" type="hidden">
        <input value="305384" name="sid" type="hidden">
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
                            <strong>
                                Component Name
                            </strong>
                            version
                            1.0
                        </td>
                        <td class="breadcrumb" align="right" valign="bottom" width="50%">
                            
                            <a href="" class="breadcrumbLinks">Download Submission</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="whiteBkgnd" colspan="4">
                            <img src="http://software.topcoder.com/images/clear.gif" alt="" border="0" height="1" width="1">
                        </td>
                    </tr>
                </tbody></table>

                <table class="forumBkgd" border="0" cellpadding="0" cellspacing="1" width="100%">
                    <tbody><tr>
                        <td class="blackBkgnd" colspan="2">
                            Design
                            Review Scorecard -
                            Submission
                            00000000
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="forumTextOdd">
                            For the Design
                            Checklist, mark each deliverable as Yes, it exists; No, it does not exist; N/A,
                            this deliverable was not required. For the
                            Design
                            Review, provide a score for each statement according to the dropdown answers.
                        </td>
                    </tr>
                </tbody></table>

                <!-- Start Text -->
                
                <!--
                    
                  -->

                    
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody><tr>
                                <td class="whiteBkgnd">
                                    Requirements Section
                                </td>
                            </tr>
                        </tbody></table>
                    
                    
                        <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
                            <tbody><tr>
                                <td class="forumTitle" width="80%">
                                    <strong>
The answers to the questions should be limited to how the design meets
the requirements (both business and technical) as described in the
requirements document AND the forums for the component. </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 300
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
service to the customer without those requirements). </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The design is missing any
of the &#8216;core&#8217; requirements. The missing requirement(s) prevent the
design from fulfilling the goal of the requirements.
</p><p class="scorecardQuestion">Rating 2 &#8211; The design has all of the
&#8216;core&#8217; requirements but does not address any of the &#8216;non-core&#8217;
requirements. The design addresses all requirements to solve the
problem for which the component was requested, but is missing major
usability features from the requirements document.
</p><p class="scorecardQuestion">Rating 3 &#8211; The design addresses all
of the &#8216;core&#8217; requirements and a majority of the &#8216;non-core&#8217;
requirements and, potentially, includes minor additional functionality.
The design solves the problem for which the component was requested,
provides all the usability features, but either does not provide
enhancements on top of the requirements, or the added functionality
does not alter the customer&#8217;s experience with the component.
</p><p class="scorecardQuestion">Rating 4 &#8211; The design addresses all requirements and provides new and substantially useful to the customer functionality.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[0].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[0].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The component specification includes a clear and easily grasped explanation of algorithms used in the design. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should judge whether the
algorithm descriptions are complete, accurate and contain enough
information for the developer to properly implement the algorithms.
Please note that this review question should judge only the correctness
of the algorithm and how well the designer relates the algorithm &#8211; the
grammar and spelling should NOT be included in this question. The
algorithms stated can be actual code, pseudo-code or even simple
textual descriptions, as long as the designer effectively relates the
point of the algorithm. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The component specification
is missing a description for any of the algorithms defined in the
requirements, or external research is required to understand how to
implement any of the algorithms. </p><p class="scorecardQuestion">Rating 2 &#8211; The component
specification includes all the algorithms defined in the requirements.
However, the description contains logical errors or misunderstandings,
or is generally written in a style that is hard to understand &#8211;
generally requiring many readings to fully grasp the algorithm. The
developer may need external research to fully understand the algorithm.
</p><p class="scorecardQuestion">Rating 3 &#8211; The component
specification includes all the algorithms defined in the requirements
and optionally any &#8216;complicated&#8217; sections of the design. The
description is fairly clear with, at most, minor errors and includes
everything needed by the developer to implement without any external
research. </p><p class="scorecardQuestion">Rating 4 &#8211; The component
specification includes all the algorithms defined in the requirements
and any &#8216;complicated&#8217; sections of the design. The description is clear,
contains no logical errors, and can be understood from a single
reading.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[1].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[1].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
<p class="scorecardQuestion">The use cases cover all the business requirements as stated in the requirements document.</p>

<p class="scorecardQuestion">The reviewer should be able to take each requirement and find a use case covering it (a single use case may cover multiple requirements). Use cases must not be too high-level or too low-level. Additional functionality beyond the requirements must be covered by use cases as well.</p>

<p class="scorecardQuestion">These rules should be considered when judging the use cases:</p>

<p class="scorecardQuestion">a) A use case is something an actor wants the system to do</p>
<p class="scorecardQuestion">b) Use cases are always started by an actor</p>
<p class="scorecardQuestion">c) Use cases are always defined from the point of view of an actor</p>
<p class="scorecardQuestion">d) Use cases are always described by a verb phrase</p>

<p class="scorecardQuestion">When a single use case covers multiple unrelated activities, it is considered too high-level. A good indicator of this is a single use case covering multiple points in the requirements document.</p>

<p class="scorecardQuestion">Too low-level is defined as multiple use cases covering related activities. For example, providing a use case for each constructor or each version of an overloaded method are considered too low-level.</p>

<p class="scorecardQuestion">Use cases must not reveal the intended implementation. For example, a use case of "Read Configuration" should not specify how it reads the configuration (i.e. it should not say "Read Configuration via Configuration Manager," unless the component provides other user-selectable alternatives for obtaining the configuration without the Configuration Manager).</p>

<p class="scorecardQuestion">This question does not address the presentation of the diagrams; only the logical content needs to be considered.</p>

<p class="scorecardQuestion">Rating 1 - A majority (> 49%) of the requirements are not covered by the use cases. </p>
<p class="scorecardQuestion">Rating 2 - A majority (> 49%) of the requirements are covered but at least one requirement is missing and/or the use cases are too high (or low) level in detail as explained above.</p>
<p class="scorecardQuestion">Rating 3 - All the requirements are covered at a proper level of detail as explained above. </p>
<p class="scorecardQuestion">Rating 4 - All the requirements are covered at a proper level of detail as explained above, and the designer made proper use of inherited/associations/extend/include semantics.</p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[2].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[2].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The
sequence diagrams cover complicated use cases or other complicated
sequences where the interactions of the objects are not obvious.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Sequence diagrams should be included
when there are interactions between objects that need to be
demonstrated or where interactions are not immediately obvious or where
method documentation may benefit from a supplemental diagram.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Interactions involving five or more
objects (both system and/or component) are considered complicated.
Designers may include SDs with less than five objects, but they are not
required to do so.
</p><p class="scorecardQuestion">This question does not address the
presentation of the diagrams; only the logical content needs to be
considered for this question.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; A majority (&gt;49%) of the
complicated interactions are not covered by the sequence diagrams.
Identify all complicated interactions without the diagrams in your
comments.
</p><p class="scorecardQuestion">Rating 2 &#8211;. At least one complicated
interaction is missing a sequence diagram, or a majority (&gt;49%) of
the diagrams are misleading or incorrect. You must either identify the
missing interaction or add explanations of how to fix misleading or
incorrect diagrams in your comments.
</p><p class="scorecardQuestion">Rating 3 &#8211; All the complicated
interactions are covered by sequence diagrams, but at least one of the
diagrams is incorrect or misleading (missing participants or missing
calls on any of the diagrams make that diagram grossly incorrect). You
must add explanations of how to fix misleading or incorrect diagrams in
your comments.
</p><p class="scorecardQuestion">Rating 4 &#8211; All &#8216;complicated&#8217;
interactions have been described by corresponding sequence diagrams,
and none of the diagrams are incorrect or misleading. This rating
permits minor issues such as mislabeled methods or mismatched
parameters or return values to exist in the diagram.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[3].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[3].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    Approach Section
                                </td>
                            </tr>
                        </tbody></table>
                    
                    
                        <table class="forumBkgd" align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
                            <tbody><tr>
                                <td class="forumTitle" width="80%">
                                    <strong>
The answers to the questions should be limited to how good the
designer&#8217;s approach to designing the component was (in knowing design
standards, creating an easy to use component that is flexible and
extendable). </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 200
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
design incorporates standard design patterns and methodologies where
applicable (e.g. Model-View-Controller, Factory Pattern, Object
Oriented design principles, follows J2EE specs). </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should determine a few
things: Are the patterns/methodologies used 'forced' (i.e. is there
good justification for using the pattern or did the designer force the
pattern into the design to say they used that pattern). Are the
patterns/methodologies implemented correctly (this does not mean
completely &#8211; the design may justify a partial implementation)? Did the
designer show an understanding of the pattern/methodology? Did the
designer recognize and document all the patterns used? </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The design consistently
uses patterns/methodologies inappropriately, causing potential problems
either in implementing the component or in implementing future
enhancements to the component. </p><p class="scorecardQuestion">Rating 2 &#8211; An appropriate
pattern/methodology was used but the designer showed a lack of
understanding in the implementation of it. A pattern/methodology should
have been used but was not (name the missing patterns and explain how
the design would benefit from using them). A pattern/methodology was
'forced' (name the inappropriate patterns and explain why they are not
applicable to the design). </p><p class="scorecardQuestion">Rating 3 &#8211; Appropriate patterns
and/or methodologies were used but the designer missed some in the
component specification (either missed completely or incorrectly
labeled). </p><p class="scorecardQuestion">Rating 4 &#8211; Appropriate patterns
and/or methodologies were used and were identified correctly in the
component specification. The reviewer should also assign this rating if
the design, appropriately, does not need any patterns/methodologies.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 10
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
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The design accounts for incorporating future enhancements and/or features beyond the requirements. 
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
                                    Weight: 10
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
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The component makes effective use of the TopCoder component catalog. 
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
permission from the PM. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The design did not use any of the recommended components and did not give any justification as to why. 
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
                                    Weight: 30
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
                                    Weight: 30
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
                                
                            
                            
                
                <!--
                    
                  -->

                    
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The design addresses whether the component is thread safe or not. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should review the
component specification to see if the designer addresses the thread
safety of the component. Please note that this does not mean the
components must be thread-safe &#8211; it simply means whether the designer
has justified why it is or isn't thread safe. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">If the component is deemed thread
safe, the designer should have documented their approach to thread
safety in order to determine if the approach is sound. The approach can
come in two forms:
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">a) A high level overview written in
the component specification and specific detail included in the
class/method/variable documentation tabs.
</p><p class="scorecardQuestion">b) A detailed approach written in the
component specification and references to it written in the
class/method/variable documentation tabs.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">If the component is deemed not to be
thread safe, the designer should document any reasons why the component
is not thread safe and, if applicable, provide a high level summary of
what could be done to make the component thread safe. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; There is no mention of whether the component is thread safe or not. 
</p><p class="scorecardQuestion">Rating 2 &#8211; The designer mentions thread safety but fails to provide the reasoning 
</p><p class="scorecardQuestion">Rating 3 &#8211; The designer mentions thread safety but is incorrect in the reasoning 
</p><p class="scorecardQuestion">Rating 4 &#8211; The designer mentions thread safety and provides correct arguments to back it up.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[8].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[8].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The classes are well scoped. 
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
                                        Weight: 100
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
the package. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The component is
sufficiently complex or uses pluggable classes that can justifiably be
separated into sub-packages and was not. </p><p class="scorecardQuestion">Rating 2 &#8211; The designer separated
some classes into separate sub-packages but either missed some classes
or missed other sub-packages that could be justified based on the
designer&#8217;s approach. For example, when one set of features was moved
into a separate package, but another similar set was left in the main
package.
</p><p class="scorecardQuestion">Rating 3 &#8211; The designer created an
unnecessary sub-package or the component could potentially benefit from
an additional sub-package The reviewer should provide their reasoning
when suggesting a sub package be eliminated or added.
</p><p class="scorecardQuestion">Rating 4 &#8211; The
designer appropriately used sub-packages or the design did not need any
sub-packages.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[10].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[10].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">Modifiers
(final, abstract, synchronized, property, virtual, overrides, etc.) and
scope (private, package, public, etc.) been appropriately used in the
design in the classes/methods/variables. </p><p class="scorecardQuestion">
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
</p><p class="scorecardQuestion">This question addresses the logical
aspect of providing the modifiers, not the presentation of it. When
there are multiple ways to convey a modifier, not using all of them is
considered a presentation issue. For example, an abstract class must
have an abstract checkbox on the attributes page, an abstract
stereotype, and a color of the abstract class. Any of the three methods
is sufficient to convey that the class is abstract for the purposes of
this question.
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The designer demonstrates
obvious lack of understanding or ignores modifiers fully. For example,
variables with accessor methods are declared public, or key methods of
the API are declared private. </p><p class="scorecardQuestion">Rating 2 &#8211; The design misidentifies a majority (&gt;49%) of the modifiers or scope. 
</p><p class="scorecardQuestion">Rating 3 &#8211; The designer misidentifies a minority (&lt;49%) of modifiers or scope. 
</p><p class="scorecardQuestion">Rating 4 &#8211; The designer identifies the modifiers/scope appropriately.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[11].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[11].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">Custom exceptions been appropriately defined and do not cover multiple, unrelated reasons. 
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
IllegalArgumentException. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Appropriate custom
exceptions were not defined or a single generic exception is used
throughout the component for every custom reason. </p><p class="scorecardQuestion">Rating 2 &#8211; Appropriate custom
exceptions were defined but for multiple, unrelated reasons or system
exceptions were reused inappropriately (this does not include the above
null argument exception note). </p><p class="scorecardQuestion">Rating 3 &#8211; Custom exceptions were
used appropriately for multiple, related reasons but do not give
specific reason details beyond the included text or the design
inappropriately identified a null argument exception. </p><p class="scorecardQuestion">Rating 4 &#8211; Custom exceptions were
used appropriately and give reason details beyond simple text. Custom
exceptions were used appropriately and for a single specific reason
alone. Custom exceptions were not appropriate for this design.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[12].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[12].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">Type assignments have been used appropriately for method arguments, variables and return types. 
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
the characteristics needed). </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; A majority (&gt;49%) of
types are used incorrectly (not including array to collection stuff).
That is, a string used where an integer should be etc. </p><p class="scorecardQuestion">Rating 2 &#8211; At least one type is used incorrectly (same limitation as Rating 1). 
</p><p class="scorecardQuestion">Rating 3 &#8211; The types are appropriate and arrays are used where collections should have been. 
</p><p class="scorecardQuestion">Rating 4 &#8211; The types are appropriate
and the collection interfaces are used where appropriate (i.e. arrays
are used when justified).
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[13].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[13].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The
relationships between classes within the component and between the
component and external entities (other components, system classes) have
been appropriately defined. </p><p class="scorecardQuestion">
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
relationships are missing attribute information. </p><p class="scorecardQuestion">Rating 2 &#8211; A minority (&lt;49%) of
relationships between internal classes and/or external TopCoder
components are missing from the class diagrams, or system classes are
missing. </p><p class="scorecardQuestion">Rating 3 &#8211; Class diagrams show all
relationships between internal classes and external entities (both
TopCoder components and system classes). A considerable number of the
association attributes (&gt;10%) are either missing or incorrect. </p><p class="scorecardQuestion">Rating 4 &#8211; Class diagrams show all
relationships between internal classes and external entities (both
TopCoder components and system classes) and all association attributes
are correct.
</p><p class="scorecardQuestion"></p>
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
                                
                            
                            
                
                <!--
                    
                  -->

                    
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The classes, methods and variables are named appropriately. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Does the name provide a hint as to
what the function of the entity is? Does the name follow system
language and TopCoder standards (capitalization, underscores, etc.)? </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; The name of one or more
entities is totally misleading or incorrect for the entity&#8217;s function.
Note: the designer may challenge this if they can give sufficient
justification as to why the name is appropriate. Only &#8216;public&#8217; names
should be eligible for this rating. </p><p class="scorecardQuestion">Rating 2 &#8211; One or more names violate
either system language or TopCoder standards. Only &#8216;public&#8217; names
should be eligible for this rating. </p><p class="scorecardQuestion">Rating 3 &#8211; All names follow the
system language and TopCoder standards, and the names cover the
functionality of the entities; however another name may more fully
describe the functionality. All names (private or public) are eligible
for this rating. </p><p class="scorecardQuestion">Rating 4 &#8211; All names follow the
system language and TopCoder standards and fully describe the
functionality of the entity. All names (private or public) are eligible
for this rating. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Please note that &#8216;public&#8217; is defined as: 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">- Public or protected class names 
</p><p class="scorecardQuestion">- Public variables or protected variables on public or protected classes 
</p><p class="scorecardQuestion">- Public methods or protected methods on public or protected classes
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[15].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[15].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The design made proper use of the language&#8217;s features. 
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
The answers to the questions should be limited to how well the design
was documented. This largely means how easy will it be to take the
design and develop it. Please note that the reviewer should assign a 4
if any section is not applicable to the design. Reviewers should
disregard whether the designer used HTML tags, properly line wrapped or
even if the document is not well formed (ie HTML errors) in the
documentation tab(s). The documentation is for the developer only and
will not be used for presentation purposes. </strong>
                                </td>
                                <td class="forumTitleCenter" width="10%">
                                    <strong>
                                        Weight: 250
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
all relevant information to the developer. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The reviewer should look at this from
a component developer standpoint and not an application developer
standpoint. This is not javadoc on how to use the class. This should
contain helpful information to the developer on how to develop the
class and if the class is mutable or not. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Documentation is consistently missing or consistently unhelpful. 
</p><p class="scorecardQuestion">Rating 2 &#8211; Documentation is missing in at least one class or consistently provides little help to the developer. 
</p><p class="scorecardQuestion">Rating 3 &#8211; Documentation is complete
and adequate to develop the component but requires the designer to
answer additional questions by the developer. </p><p class="scorecardQuestion">Rating 4 &#8211; Documentation is complete
and provides full details to the developer (the developer will likely
not require any additional information from the designer).
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[17].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[17].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
<p class="scorecardQuestion">The method documentation in the 'Documentation' tab of Poseidon provides detailed description of the method's scope, parameters (including what is considered valid or not), return type (range, nulls, etc.) and any exceptions that may be thrown. Properties, delegates, indexers and events of C# are considered methods for the purpose of this question.</p>
<p class="scorecardQuestion">This documentation is for the component developer, not the component users. It is not javadoc on how to use the method. It should contain helpful information to the developer on how to write the method and what are its constraints. Examples of argument values are not required. The designer does not have to explicitly say what is considered valid if this information is already contained elsewhere (in the tags or in the free-form text). Duplicating the valid/invalid information and exception information in both the documentation tags and free form text is not required (nor even recommended). Algorithms and complex validation (such as with a regex pattern) should be explained only in the free form text. The reviewer should assume that any variable (null, empty string, int range, etc) is valid/invalid if not specifically denoted as an invalid/valid by the exceptions text or other free form information. Also note that specifying 'raised signals’ in Poseidon is not required if the exception has been clearly denoted in the documentation tags or free form text.</p>
<p class="scorecardQuestion">For C# designs, the reviewer should verify that property setters handle argument validation and throw appropriate exceptions.</p>
<p class="scorecardQuestion">Rating 1 - Documentation is consistently missing or unhelpful. </p>
<p class="scorecardQuestion">Rating 2 - Documentation is missing in at least one method documentation or consistently provides little help to the developer. </p>
<p class="scorecardQuestion">Rating 3 - Documentation is complete and adequate to develop the component but requires the designer to answer additional questions by the developer. </p>
<p class="scorecardQuestion">Rating 4 - Documentation is complete and provides full details to the developer (the developer will likely not require any additional information from the designer).</p>
</td>

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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[18].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[18].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The
variable documentation in the 'Documentation' tab of Poseidon provides
a detailed description of the variable's scope, intended usage and
potential range of values. </p><p class="scorecardQuestion">
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
denote why]). </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The variable constraints only need to
be included where they may differ from those defined by any associated
getters/setters (whether they be method or property based).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Collections should state at least the
following information (regardless if it&#8217;s also stated in the
getter/setters): whether the collection can be empty or not and what
element types can exist in the collection (including whether null
elements are allowed).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Documentation is consistently missing or unhelpful. 
</p><p class="scorecardQuestion">Rating 2 &#8211; Documentation is missing in
at least one variable documentation or consistently provides little
help to the developer. </p><p class="scorecardQuestion">Rating 3 &#8211; Documentation is complete
and adequate to develop the component but requires the designer to
answer additional questions by the developer. </p><p class="scorecardQuestion">Rating 4 &#8211; Documentation is complete
and provides full details to the developer (the developer will likely
not require any additional information from the designer).
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[19].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[19].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The sequence diagrams provide sufficient detail for the developer to understand the interactions between classes. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">The sequence diagrams should demonstrate to an adequate degree what interactions occur as a result of a method call. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Sequence diagrams do not
show sufficient details useful to a developer (e.g. they show the API
call from the application but nothing beyond that). </p><p class="scorecardQuestion">Rating 2 &#8211; The sequence diagrams show some interaction but not enough to be able to develop from. 
</p><p class="scorecardQuestion">Rating 3 &#8211; The sequence diagrams show enough detail to give the developer an idea of what occurs on the method call. 
</p><p class="scorecardQuestion">Rating 4 &#8211; The sequence diagrams
clearly show the detail of what occurs on the method call and
potentially provides helpful notes on things that cannot be displayed
visually in the diagram.
</p><p class="scorecardQuestion"></p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 10
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
                                
                            
                            
                
                <!--
                    
                  -->

                    
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
<p class="scorecardQuestion">The component specification contains a comprehensive demo section.</p>
<p class="scorecardQuestion">Is the demo section complete? Was it written to promote the component to potential users?</p>
<p class="scorecardQuestion">The demo section is not a reference implementation or a set of unit tests. It should give the reader a quick, concise demonstration of the major functionality of the component. "Major functionality" is defined as the requirements specified in the requirements documentation.</p>
<p class="scorecardQuestion">The demo section needs to compile only with respect to the component’s API. All other elements (application provided methods, classes, objects, etc.) shown can be assumed if commented properly and, may include pseudocode. Examples of this would be:</p>
<p class="scorecardQuestion">
a) ACMEInterface appACME = application provided object<br>
b) Date todayPlusOne = todays date plus 1 day
</p>
<p class="scorecardQuestion">The 'compilability’ requirement should be lenient on well-formed source code (i.e. missing semi-colons, non-closed parens/quotes, etc. do not count). It is the developer’s responsibility to correct the demo to ensure well formedness.</p>
<p class="scorecardQuestion">External setup information does not need to be included in the demo as long as comments provide enough information to understand what setup the demo relied on.</p>
<p class="scorecardQuestion">Only the relevant output of the demo needs to be shown (i.e. when the component’s job is to output something specific). Logging output does not need to be shown.</p>
<p class="scorecardQuestion">Rating 1 - Demo section is missing or the existing demo section contains non-compilable errors (don't actually try to compile it - just view it to make sure it looks correct). </p>
<p class="scorecardQuestion">Rating 2 - The demo section demonstrates some but not all of the requirements or the demo section demonstrates class/methods/variables that don't exist in the design (probably were never updated).</p>
<p class="scorecardQuestion">Rating 3 - The demo section demonstrates each of the requirements correctly.</p>
<p class="scorecardQuestion">Rating 4 - The demo section demonstrates each of the requirements correctly in a clear fashion using a likely customer scenario (i.e. sets up a scenario that is similar to what a user of the component would see) or demonstrates extra functionality or flexibility.</p>
                                </td>
                                <td class="forumTextOdd" valign="top" width="10%">
                                    Weight: 20
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
                                
                            
                            
                
                <!--
                    
                  -->

                    
                    
                            
                            <tr>
                                <td class="forumTextOdd" width="80%">
                                    <p class="scorecardQuestion">The component specification contains no grammatical or spelling errors. 
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Was it written in a way that is easily
understandable and doesn't require multiple readings to understand?
This category should ONLY judge the grammar, sentence structure and
spelling (i.e. the knowledge transfer piece). How well the designer
explained the design structure or algorithms is addressed in a prior
question. </p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Please note that spelling and grammar
should only be denoted in those items that are visible to the customer.
This would include the component specification, the diagrams themselves
(not the doc tabs) and any additional information attached to the
submission (that is not developer oriented).
</p><p class="scorecardQuestion">
</p><p class="scorecardQuestion">Rating 1 &#8211; Useless. The document is
not helpful to readers trying to understand or implement the component
because of missing sections with critical information, frequent
spelling errors, extremely poor grammar, etc. </p><p class="scorecardQuestion">Rating 2 - Marginally usable. The
document provided some helpful information, but required multiple
readings because of missing or incomplete sections, frequent spelling
errors, unconventional wordings, poor grammar, etc. </p><p class="scorecardQuestion">Rating 3 &#8211; Usable. The document has
no missing or incomplete sections, and provides enough helpful
information to implement the component. The document requires
significant efforts to read because the style is inconsistent, the
material is not well organized, or there are occasional spelling or
grammatical errors. </p><p class="scorecardQuestion">Rating 4 &#8211; Helpful. The document is
well organized, easy to read, and stylistically consistent; it has no
missing or incomplete sections, and no spelling errors. Despite an
occasional unconventional wording or a few grammar mistakes, the
document provides significant help to anyone trying to understand or
implement the component.
</p><p class="scorecardQuestion"></p>
                                </td>
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
                                                        <strong>
                                                            Response 1:
                                                        </strong>
                                                    </td>
                                                    <td class="forumTextOdd" width="60%">
                                                        <textarea name="questions[22].responses[0].responseText" cols="65" rows="2"></textarea>
                                                    </td>
                                                    <td class="forumTextOdd" valign="middle" width="15%">&nbsp;
                                                        <select name="questions[22].responses[0].responseType"><option value="Recommended">Recommended</option><option value="Required">Required</option><option value="Comment">Comment</option></select>
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
                                    <p class="scorecardQuestion">The presentation of the diagrams and specification was professional. 
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
                                        Weight: 150
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
    
</tbody></table>
<!-- spacer  -->										
		    <table border="0" cellpadding="2" cellspacing="0" width="100%">
		    	<tbody><tr>
		    		<td class="normal"><img src="/i/clear.gif" alt="" border="0" height="5" width="1"></td>
		    	</tr>
		    </tbody></table>
	</td></tr>
</tbody></table>
				

<!-- Content ends-->
        
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr><td height="15"><img src="/i/clear.gif" alt="" border="0" height="15" width="10"></td></tr>
            </tbody></table>
        </td>
<!--Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/i/clear.gif" alt="" border="0" height="10" width="15"></td>
<!-- Gutter 2 ends -->

    </tr>
</tbody></table>

</body></html>