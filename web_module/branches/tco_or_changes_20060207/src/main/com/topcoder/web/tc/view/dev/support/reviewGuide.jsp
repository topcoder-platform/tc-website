<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Review Guidelines</title>

<jsp:include page="../../../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

<div class="guide">

<p align=center>
    <a href="#requirements">Requirements</a>&#160;&#160;|&#160;&#160;
    <a href="#approach">Approach</a>&#160;&#160;|&#160;&#160;
    <a href="#design">Design</a>&#160;&#160;|&#160;&#160;
    <a href="#documentation">Documentation</a>
</p>

<a name="requirements"></a>
<p class=guideSubTitle>Requirements Section</p>
<p class=guideDesc>
The answers to the questions should be limited to how the design meets the requirements (both
business and technical) as described in the requirements document AND the forums for the component.
</p>

<br/>

<p class=guideQuestion>Q:
The design addresses all the requirements as specified in the requirements documents and/or the forum.
</p>
<p class=guideDesc>The reviewer should be able to take each point in the requirements document and find the associated
implementation in the design.  The reviewer should read the component forum prior to doing this to
ensure that any modifications or addition to the requirements are taken into account.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>the design is missing any of the 'core' requirements or missing a majority of the 'non-core' requirements</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>the design has all of the 'core' requirements but does not address a majority of the 'non-core' requirements</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>the design has all of the 'core' requirements and a majority of the 'non-core' requirements and/or, potentially, includes minor additional functionality.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>the design addresses all requirements and provides new and substantially useful (to the customer) functionality. </td></tr>
</table>
<p class=guideDesc>
'Core' requirements are those requirements that are essential to component's intent (ie the component
either cannot fulfill it's goal or cannot provide value added service to the customer without those requirements).
</p>

<br/><br/>

<p class=guideQuestion>Q:
The component specification includes a clear and easily grasped explanation of any algorithms used in
the design.
</p>
<p class=guideDesc>The reviewer should judge whether the algorithms are complete, accurate and contain enough information
for the developer to properly implement.  Please note that this review question should judge the correctness
of the algorithm and how well the designer relates the algorithm - the grammar and spelling should NOT be
included in this question.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>the component specification is missing a description for any of the algorithms used in the design or external research is required to understand how to implement any of the algorithms </td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>the component specification includes all the algorithms.  However, the description is hard to understand or contains errors, misunderstandings or was generally written in a style that was hard to understand - generally requiring many reading to fully grasp the algorithm.  The developer may need external research to fully understand the algorithm.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>the component specification includes all the algorithms.  The description is fairly clear with, at most, minor errors and includes everything needed by the developer to implement without any external research.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>the component specification includes all the algorithms.  The description is clear, contains no errors and can be understood from a single reading.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The use cases cover all the business requirements as stated in the requirements document.
</p>
<p class=guideDesc>The reviewer should be able to take each requirements point and find a use case covering that requirement
(a single use case can cover more than one requirement).  Care must be taken to ensure that the use cases
are not too high-level or too low-level.  If the designer included additional functionality beyond the requirements,
that functionality must be covered by use cases also.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>A majority of the requirements are not covered by the use cases.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Only a majority of the requirements are covered but some are missing and/or the use cases are too high (or low) of a level in details.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>All the requirements are covered at a proper level of detail.  </td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>All the requirements are covered at a proper level of detail and the designer made proper use of inherited/associations/extend/include semantics.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
All the use cases are represented by sequence diagrams.
</p>
<p class=guideDesc>The reviewer should be able to take each use case and find a sequence diagram that covers it.  If the designer
has missed some use cases, the reviewer should not take those use cases into account when answer this question.
This question is only relevant to those use cases that have been defined.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>A majority of the use cases are not covered by the sequence diagrams.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Only a majority of the use cases are covered but some are missing</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>All the use cases are covered however, a single sequence diagram covers multiple use cases</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>All the use cases are covered and there is a one to one relationship between use cases and sequence diagrams.</td></tr>
</table>

<br/><br/>

<a name="approach"></a>
<p class=guideSubTitle>Approach Section</p>
<p class=guideDesc>
The answers to the questions should be limited to how good the designer's approach to designing the component
was (in knowing design standards, creating an easy to use component that is flexible and extendable).
</p>

<br/><br/>

<p class=guideQuestion>Q:
The design incorporates standard design patterns and methodologies where applicable (i.e. Model-View-Controller,
Factory Pattern, Object Oriented design principles, follows J2EE specs).
</p>
<p class=guideDesc>The reviewer should determine a few things.  Are the patterns/methodologies used 'forced' (ie is there good justification
for using the pattern or did the designer force the pattern into the design to say they used that pattern).  Are the
patterns/methodologies implemented correctly (this does not mean completely - the design may justify a partial
implementation)?  Did the designer show an understanding of the pattern/methodology?  Did the designer recognize
and document all the patterns used?
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>A pattern/methodology was inappropriately used that could cause problems either in implementing the component or in implementing future enhancements to the component. </td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>An appropriate pattern/methodology was used but the designer showed a lack of understanding in the implementation of it, a pattern/methodology should have been used but was not or a pattern/methodology was 'forced'</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Appropriate patterns and/or methodologies were used but the designer missed some in the component specification (either by missing completely or incorrectly labeling). </td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Appropriate patterns and/or methodologies were used and were identified correctly.  The reviewer should also assign this rating if the design, appropriately, does not need any patterns/methodologies.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The design accounts for incorporating future enhancements and/or features beyond the requirements.
</p>
<p class=guideDesc>The reviewer should consider what enhancement/features the next version of the component will likely be or what
types of enhancements a client of the component will likely request.  The reviewer should then review the future
enhancements that the designer included in the component specification for their vision of what the next likely
enhancements are.  The reviewer should also consider how tightly coupled the classes or what assumptions the design
was built upon when considering how 'substantial' the modifications would entail.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The design would need substantial modifications to accommodate both the enhancements the reviewer and designer came up with. </td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The design could accommodate (without substantial changes) the enhancements the designer included but would need substantial changes to accommodate the reviewer enhancements.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The design could accommodate with moderate changes both the reviewer and designer enhancements.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The design could trivially accommodate the reviewer and designer enhancements.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The component makes effective use of the TopCoder component catalog.
</p>
<p class=guideDesc>The reviewer should review the components recommended in the requirements documentation.  The designer will
need to provide justification (either in the component specification or in the component forum) if they choose not to
use the recommendations.  The reviewer should also review the TopCoder catalog for any components that could
potentially be used in the component design.  The reviewer should not be critical of the designer's use, assumptions
or lack of details for components that are being introduced or in the design/development stage - as long as the
designer has included verbage in the component specification stating that the design may need to change based on
the final 'look' of the dependent component.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The design did not use any of the recommended components and did not give sufficient justification as to why.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The design used at least one of the recommended components but not all and did not give sufficient justification as to why.  Likewise, assign this rating if the designer missed using likely components or used any other component incorrectly.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The design used all the recommended components correctly but missed using other likely components.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The design used all recommended and likely components correctly.  If no components were, appropriately, used - assign this rating also.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The component presents an easy to use API for the application to use.
</p>
<p class=guideDesc>The reviewer should look at the demo section of the component specification to see the designer's vision of how the
component will be used.  The reviewer should then review how the API addresses the requirements and how easy
the API is to accomplish the requirements.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The API demonstrates an obvious lack of consistency, cohesion or generally makes it a pain to use.  Tasks (as defined by the requirements) take multiple API calls to accomplish what should be more straightforward.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The API is not immediately obvious (by looking at the class diagram alone) how to use or how to accomplish the requirement tasks.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The API is obvious (by looking at the class diagram) but could have been made simpler or more powerful/flexible.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The API is simple to use and provides useful helper/utility functions for common tasks (usually those defined in the requirements).  Having a simple, yet powerful/flexible, API would additionally fall into this category.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The design addresses whether the component is thread safe or not.
</p>
<p class=guideDesc>The reviewer should review the component specification to see if the designer addresses the thread safety of the
component.  Please note that this does not mean the components must be thread safe - it simply means whether
the designer has justified why it is or isn't thread safe.  If the component is deemed thread safe, the designer should
have documented their approach to thread safety in order to determine if the approach is sound.  If the component is
deemed not to be thread safe, the designer should document any reasons why the component is not thread safe.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>There is no mention whether the component is thread safe or not.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The designer mentions thread safety but fails to provide the reasoning</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The designer mentions thread safety but is incorrect in the reasoning</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The designer mentions thread safety and provides correct arguments to back it up.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The classes are well scoped.
</p>
<p class=guideDesc>The reviewer should determine whether the classes in the design attempt to do too many tasks.  A good clue to a
violation of this is whether the name of the class adequately encompasses the API of the class.  If so, then the class
is probably properly scoped (unless the name is too generic or too high-level).
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Multiple classes definitely violate scope and should be re factored into smaller classes.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>A single class definitely violates scope and should be re factored into smaller classes.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The classes seem fine but at least one class could potentially benefit from being re factored.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>All classes seem to be scoped well.</td></tr>
</table>

<br/><br/>

<a name="design"></a>
<p class=guideSubTitle>Design Section</p>
<p class=guideDesc>
The answers to the questions should be limited to design fundamentals (how well the design was executed).
</p>

<br/><br/>

<p class=guideQuestion>Q:
Sub-packages have been defined to separate functionality into maintainable units.
</p>
<p class=guideDesc>The reviewer should make a determination whether classes in the design could be grouped into separate packages.
This category generally applies to complex components or components that allow for functionality to be plugged in
(where the functionality should justifiably exist in a separate package).  Note: for pluggable components, the interface,
implementations and any related abstract bases should be grouped within the package.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The component is sufficiently complex or uses pluggable classes that can justifiably be separated into sub-packages and was not.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The designer separated some into separate sub-packages but either missed some classes or missed other sub-packages that could be justified.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The designer created an unnecessary sub-package or the component could potentially (can't be justified however) benefit from an additional sub-package.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The designer appropriately used sub-packages or the design did not need any sub-packages.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
Modifiers (final, abstract, synchronized, property, etc) and scope (private, package, public, etc) have been appropriately
used in the design in the classes/methods/variables.
</p>
<p class=guideDesc>Have internally (to the component) used classes been defined incorrectly as public?  Has a public class improperly
exposed protected or private members?  Are abstract classes abstract?  It is strongly advised that variables have a
private scope (not even protected) and only accessed via getter/setter methods (exception would be C#'s property
variables).
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The designer demonstrates obvious lack of understanding.  For example: by making everything public or by making private something that should be public.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The design misidentifies a majority of the modifiers or scope.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The designer misidentifies a minority of modifiers or scope.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The designer identifies the modifiers/scope appropriately.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
Custom exceptions been defined appropriately and do not cover multiple, unrelated reasons.
</p>
<p class=guideDesc>Has the designer appropriately reused existing system exceptions and appropriately defined custom exceptions for
the rest?  The reviewer should also imagine they were using this component in an application.  If a custom exception
is thrown - does it give enough information to the application to be able to react appropriately?  Example: an inappropriate
custom exception would be some high level exception that is thrown for multiple, unrelated, reasons.   Please note that
TopCoder Software has decided that null arguments should be represented by the null specific exception
(NullPointerException and ArgumentNullException) and not the more generic IllegalArgumentException.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Appropriate custom exceptions were not defined or a single generic exception is used throughout the component for every custom reason.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Appropriate custom exceptions were defined but for multiple, unrelated reasons or system exceptions were reused inappropriately (this does not include the above null argument exception note).</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Custom exceptions were used appropriately for multiple, related reasons but do not give specific reason details beyond the included text or the design inappropriately identified a null argument exception).</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Custom exceptions were used appropriately and give reason details beyond simple text.  Custom exceptions were used appropriately and for a single specific reason alone.  Custom exceptions were not appropriate for this design.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
Type assignments have been used appropriately for method arguments, variables and return types.
</p>
<p class=guideDesc>Are the type assignments correct and what you'd expect?  Are the Collection interfaces used appropriately?  If an
actual array is used, is there justification why a Collection interface is not used?  A gotcha to check for: if the return
type is a Collection - make sure it's a clone (or similar) of the internal Collection to avoid exposing an internally
protected field.  Please note that TopCoder Software has made determination to prefer collection interfaces to arrays
in all instances except where justified (presumably because of performance or overhead reasons and where either
standard implementations or custom implementations would not provide the characteristics needed).
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Are a majority of Types used incorrectly (not including array to collection stuff).  Ie is a string used where an integer should be?</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>At least one type is used incorrectly (same limitation as <b>Rating 1</b>)</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The types are appropriate and arrays are used where collections should have been.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The types are appropriate and the collection interfaces are used where appropriate (ie arrays are used when justified)</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The relationships between classes within the component and between the component and external entities (other
components, system classes) have been defined appropriately.
</p>
<p class=guideDesc>Are all relationships shown?  Are the relationship attributes assigned appropriately (ordered, unordered, aggregate,
composite, etc)?  Do they contain proper labels?  Two ways of doing associations are appropriate:
1) Define a variable for the association, draw the association and label it with the variable.
2) Define the association and label it with a variable name - no variable needs to be shown for the relationship in the class.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Relationships are missing between internal classes and/or external TopCoder components.  Relationships are consistently missing attribute information.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Relationships exist between internal classes and/or external TopCoder components.  However, system classes are missing or some of the relationships have missing/incorrect attributes.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Relationships between internal classes and external entities (both TopCoder components and system classes) have been defined.  Some of the association attributes are either missing or incorrect.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Relationships between internal classes and external entities (both TopCoder components and system classes) have been defined and all association attributes are correct.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The classes, methods and variables named appropriately.
</p>
<p class=guideDesc>Does the name provide a hint as to what the function of the entity is?  Does the name follow system language and
TopCoder standards (capitalization, underscores, etc)?
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The name of an entity is totally misleading or incorrect for the entity's function.    Only 'public' names should be eligible for this rating.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>A name violates either system language or TopCoder standards.  Only 'public' names should be eligible for this rating.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>All names follow the system language and TopCoder standards, and the names cover the functionality of the entities - however another name may more fully describe the functionality.  All names (private or public) are eligible for this rating.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The names follow the system language and TopCoder standards and fully describes the functionality of the entities.  All names (private or public) are eligible for this rating.</td></tr>
</table>
<p class=guideDesc>Please note that 'public' is defined as:<br/>
* Public or protected class names<br/>
* Public variables or protected variables on public or protected classes<br/>
* Public methods or protected methods on public or protected classes
</p>

<br/><br/>

<p class=guideQuestion>Q:
The design made proper use of the language's features?
</p>
<p class=guideDesc>Does the designer duplicate functionality that is already provided by the language?  Are properties, delegates,
interfaces, inheritance, networking, etc use appropriately?
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Language feature are consistently ignored.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Language features are inconsistently ignored or consistently misused.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Language features are incorporated consistently and occasionally misused or abused.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Language features are appropriately used correctly.</td></tr>
</table>

<br/><br/>

<a name="documentation"></a>
<p class=guideSubTitle>Documentation Section</p>
<p class=guideDesc>
The answers to the questions should be limited to how well the design was documented.  This largely means how
easy will it be to take the design and develop it.  Please note that the reviewer should assign a 4 if any section is
not applicable to the design.
</p>

<br/><br/>

<p class=guideQuestion>Q:
The class documentation in the 'Documentation' tab of Poseidon provides a high-level description of the class; it's
role in the overall design and all relevant information to the developer.
</p>
<p class=guideDesc>The reviewer should look at this from a component developer standpoint and not an application developer standpoint.
This is not javadoc on how to use the class.  This should contain helpful information to the developer on how to develop
the class and if the class is mutable or not.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently non-helpful</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Documentation is missing in at least one class or consistently provides little help to the developer</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Documentation is complete and adequate to develop the component but requires the designer to answer additional questions by the developer.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the developer (the developer will likely not require any additional information from the designer).</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The method documentation in the 'Documentation' tab of Poseidon provides a detailed description of the method's scope,
the parameters (including what is considered valid or not), return type (range, nulls, etc) and any exceptions that may be
thrown.
</p>
<p class=guideDesc>The reviewer should look at this from a component developer standpoint and not an application developer standpoint.
This is not javadoc on how to use the method.  This should contain helpful information to the developer on how to develop
the method and what the constraints the method will have.  The designer does not have to provide physical examples of
arguments.  The designer does not have to explicitly say what is considered valid if this information is contained in the
documentation tags unless the argument validation is so complex that it needs special attention (such as a regex pattern).
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently non-helpful</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Documentation is missing in at least one method documentation or consistently provides little help to the developer</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Documentation is complete and adequate to develop the component but requires the designer to answer additional questions by the developer.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the developer (the developer will likely not require any additional information from the designer).</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The variable documentation in the 'Documentation' tab of Poseidon provides a detailed description of the variable's scope,
intended usage and potential range of values.
</p>
<p class=guideDesc>The reviewer should look at this from a component developer standpoint and not an application developer standpoint.  This
s not javadoc on how to use the variable.  This should contain helpful information to the developer on how to use the variable
and what the constraints (null, range, etc) the variable will have.   The designer should mention if the value is mutable, is it set
in the constructor and potentially where it will be modified and/or used.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently non-helpful</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Documentation is missing in at least one variable documentation or consistently provides little help to the developer</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Documentation is complete and adequate to develop the component but requires the designer to answer additional questions by the developer.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the developer (the developer will likely not require any additional information from the designer).</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The sequence diagrams provide sufficient detail for the developer to understand the interactions between classes.
</p>
<p class=guideDesc>The sequence diagrams should demonstrate to an adequate degree what interactions occur as a result of a method call.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Sequence diagrams do not show sufficient details useful to a developer (ie they show the API call from the application but nothing beyond that).</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The sequence diagrams show some interaction but not enough to be able to develop from.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The sequence diagrams show enough detail to give the developer an idea of what occurs on the method call.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The sequence diagrams clearly show the detail of what occurs on the method call and potentially provides helpful notes on things that cannot be displayed visually in the diagram.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The component specification contains a comprehensive demo section.
</p>
<p class=guideDesc>Is the demo section complete (does it demonstrate each requirement)?  Was it written in a way that 'promotes' the
component (ie clear, demonstrates flexibility, etc)?
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Demo section is missing or the existing demo section contains non-compilable errors (don't actually try to compile it - just view it to make sure it looks correct)?</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The demo section demonstrates some but not all of the requirements or the demo section demonstrates class/methods/variables that don't exist in the design (probably never were updated).</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The demo section demonstrates each of the requirements correctly.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The demo section demonstrates each of the requirements correctly in a clear fashion using a likely customer scenario (ie set's up a scenario that is similar to what a user of the component would see) or demonstrates extra functionality or flexibility.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The component specification contains no grammatical or spelling errors.
</p>
<p class=guideDesc>Was it written in a way that is easily understandable and doesn't require multiple reading to understand?  This category
should ONLY judge the grammar, sentence structure and spelling (ie the knowledge transfer piece).  How well the designer
explained the design structure or algorithms was addressed in a prior question.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>Unreadable - designer made so many grammatical or spelling errors that you have no idea what they are trying to relate.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>Hard to read - designer made a number of grammatical or spelling errors but the overall knowledge transfer can be made with multiple readings.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>Sufficient - the designer made a some grammatical or spelling errors but the points were quickly understandable.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>No errors - the designer was concise and made not errors.</td></tr>
</table>

<br/><br/>

<p class=guideQuestion>Q:
The presentation of the diagrams and specification was professional.
</p>
<p class=guideDesc>Did the designer make use of fonts and colors to appropriately denote elements in the diagrams?  Was the specification
formatted in a professional looking manner?  Was the diagram laid out in an easy to follow manner (most important elements
in the top left to least important at the right and bottom edges)?  Were like items grouped together (ie implementations
[including the abstract base] of some interface should be near the interface)? Did the layout help you understand the design?
Note: multiple class diagrams are allowed but discouraged unless separate sub-packages were used or the design was
sufficiently complex that multiple diagrams help in the understanding.
</p>
<table class=guideTable cellspacing=0>
    <tr><td class=guideHead><b>Rating 1</b> -</td><td class=guideCell>The presentation looks amateurish.  The presentation not only lacks the above elements but also actively confuses the reviewer in trying to understand the design.</td></tr>
    <tr><td class=guideHead><b>Rating 2</b> -</td><td class=guideCell>The presentation lacks many of the above but doesn't add to any confusion in understanding the design.</td></tr>
    <tr><td class=guideHead><b>Rating 3</b> -</td><td class=guideCell>The presentation looks professional but has some rough edges that can be improved upon.</td></tr>
    <tr><td class=guideHead><b>Rating 4</b> -</td><td class=guideCell>The presentation looks professional, has a polished look, and contributes to understanding the design.</td></tr>
</table>

</div>
            <br/>
            <br/>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
