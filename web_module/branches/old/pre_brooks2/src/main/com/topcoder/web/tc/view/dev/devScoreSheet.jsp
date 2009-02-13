<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Review Guidelines</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
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
    <a href="#development">Component Development</a>&#160;&#160;|&#160;&#160;
    <a href="#definitions">Definitions</a>&#160;&#160;|&#160;&#160;
    <a href="#codeReview">Code Review</a>&#160;&#160;|&#160;&#160;
    <a href="#documentation">Documentation</a><br/>
    <a href="#unitTestCases">Unit Test Cases</a>&#160;&#160;|&#160;&#160;
    <a href="#rbTestCases">Review Board Test Cases</a>&#160;&#160;|&#160;&#160;
    <a href="#overall">Overall Comments</a>
</p>

<a name="development"></a>
<p class=guideSubTitle>1. Component Development (20%)</p>
<br/><p class=guideQuestion>
1.1. The implementation addresses the functionality as detailed in the component design documents. 
</p>
<p class=guideDesc>
The reviewer should check whether and how well all the functionality outlined in the design is implemented. Each method should be implemented based on the provided documentation. The functionality of the component as a whole should be implemented as it was described in the documentation. Where applicable, list the missing elements below. (50%) (3-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>The implementation misses items included in the design documentation, and as a result, the required functionality is no longer provided, or the component simply does not work. A missing method implementation should fall in this category, if the method is reasonably important. If one or two setters or getters are not implemented, and the code from the stubs is left instead, then it should be ignored, but if that becomes a pattern of the implementation, then 1 should be given.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Some things are not implemented exactly as the design says, but the functionality of the component is still provided. For example, for some input, the output is not exactly as the design provides. If there is no effect on the functionality of the component as a whole, especially if the method is not a public one, then this score should be given.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The implementation follows the design documentation. This score applies even if one or two minor things are not implemented as the design says. For example, some exception handling may not be implemented exactly as outlined in the design but there should be no influence on the functionality.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The implementation is a quality one and follows the design documentation and even has some improvements.</td></tr>
</table>
<br/><p class=guideQuestion>
1.2. The implementation correctly uses the technologies that are specific to the component. 
</p>
<p class=guideDesc>
The reviewer should check if the technologies and components specific to the component are used and used properly. For example, if a singleton pattern is required. Is it implemented correctly? In a thread safe manner? Are TopCoder components or other third party libraries used properly? Are other technologies used or implemented properly (i.e. XML, JDBC, EJB, servlet, JSP)? (25%) (3-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Components and technologies are not used, or used improperly affecting the functionality of the component or making the component unusable.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Some components and technologies are not used and that slightly influences the performance or results in excessive amounts of code. Same score applies if some components and technologies are not used as the best practice dictates, but the final goal is achieved nevertheless.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Components and technologies are used properly.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Components and technologies are used properly beyond what is outlined in the design. The implementation is not a simple copy/paste of the code provided in the spec. It is clear that the developer has done some research of his/her own (or already possessed the knowledge). This is the case usually when the design does a poor job in explaining how the technologies and components should be used.</td></tr>
</table>
<br/><p class=guideQuestion>
1.3. The implementation properly implements required algorithms as defined in section 1.3 of the Component Specification. 
</p>
<p class=guideDesc>
 The reviewer should look at the presence and quality of the required algorithms. All algorithms must be implemented as described in the algorithms section. Improvements are allowed and encouraged, as long they are properly explained and documented. They do not necessarily have to be approved in the forums, because they can be considered a competitive advantage, but they should be at least approved by the PM in a private mail. Fixing mistakes is not considered an improvement. If an algorithm has mistakes in the design or it is not appropriate, then it is up to the developer to fix it or work with the designer on it. (25%) (3-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Some algorithms are missing or are implemented so poorly that the component does not work in the way it was intended to.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Some algorithms are not implemented as the design specifies, and this affects slightly the performance of the component or the elegance of the implementation.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The algorithms are implemented properly.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>All algorithms are implemented properly and efficiently and the developer brings improvements over the design. Direct translations of the pseudocode from the spec (or even copy/paste) should not be awarded with this score.</td></tr>
</table>
<a name="definitions"></a>
<br/><p class=guideSubTitle>2. Definitions (10%)</p>
<br/><p class=guideQuestion>
2.1. All classes, methods and variables declarations are exactly as they are defined in the design documents (visibility, types, modifiers, names, exception list). 
</p>
<p class=guideDesc>
The reviewer should verify the conformance of the implementation to the design. No changes and no missing entities are permitted (unless previously approved by the designer in the forums). (40%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Some entities are missing or are changed in a way that makes the component no longer able to provide some functionality or the usage is changed.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The API is affected but the usage remains the same (changes in names, added exceptions, widened visibilities or changes in types).</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>One or two changes are present that have no effect on the usage (i.e. final modifiers).</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Everything is declared exactly as in the design.</td></tr>
</table>
<br/><p class=guideQuestion>
2.2. No additional public or protected entities are present in the design. 
</p>
<p class=guideDesc>
The reviewer should check whether there are additional entities and whether they are reasonable additions. Package private and protected variables are not allowed. Package private methods are allowed, as long as they fit naturally into the design. Package private classes are allowed also, if they are used to provide helper methods. Private variables, methods and inner classes are allowed. All added entities must follow the language naming conventions and must use proper English. Note that when there are multiple packages, helper classes may need to be public. In this case the restriction about adding public classes and methods is relaxed. (30%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Many restricted entities are added without being necessary or the additions are not explained at all.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Entities are added and they are reasonable, but the reasons are not well explained.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The added entities seem fine. If they have naming problems or use incorrect English then same score should be given but if the problems are more than just a few typos, then lower scores can be considered.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Nothing is added or the added entities are well justified, well named and properly documented.</td></tr>
</table>
<br/><p class=guideQuestion>
2.3. The implementation properly maps class relationships. 
</p>
<p class=guideDesc>
The reviewer should check if the interaction between the classes is conformant to the relationships defined by the design. All defined relationships must be implemented and no additional relationships can be introduced. For example, package private methods are a form of dependency between the owner class and the caller class. The developer is allowed to add package private methods only when the dependency already exists. (30%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>There are relationships that are not implemented which seriously affect the component (missing inheritance, missing associations, unused helper classes that result in unused code) or the added relationships break design patterns (creates coupling between classes).</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Some relationships are not implemented but they do not affect the component (for example a dependency to a class is not used, and an alternative route is used for getting some information) or some relationships are added without being necessary but that does not break any design pattern and does not tighten the coupling between the classes unnecessarily.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>All relationships are implemented properly but some minor additional relationships are present. These additional relationships must be necessary to the design (the designer has overlooked the issues and there is no reasonable way to eliminate them) but the developer added them without prior approval from the designer.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>All relationships are implemented properly and no additional relationships are present.</td></tr>
</table>
<a name="codeReview"></a>
<br/><p class=guideSubTitle>3. Code Review (20%)</p>
<br/><p class=guideQuestion>
3.1. The object types defined in the implementation are the best choice for the intended usage. 
</p>
<p class=guideDesc>
The reviewer should look here for variable and object types that are not the best choice (from a performance or memory consumption point of view). For example, using a Vector vs. an array. Interfaces should be used for attribute types instead of the concrete implementation classes where possible (i.e. List instead of ArrayList). Efficiency is a primary concern here. For example, HashMaps should be used instead of TreeMaps, unless key order is important. (20%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Sub-efficient object types are consistently used and this potentially affects the performance of the component.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Some less efficient object types are used but this is not a pattern of misuse throughout the implementation.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Concrete classes are used instead of interfaces as variable types.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>No better object types can be found and interfaces are used everywhere as variable types.</td></tr>
</table>
<br/><p class=guideQuestion>
3.2. There is no useless code. 
</p>
<p class=guideDesc>
The reviewer should look for pieces of code that are not needed. Such code includes emulating standard Java functionality (such as array copying), code that can be easily simplified, unused variables, assignments to variables that are not used afterwards. (10%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Useless code is present in many places and that seems to be a pattern in the implementation.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>There are some pieces of code that could be simplified with little modification.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Some useless code appears by accident.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>No useless code can be found.</td></tr>
</table>
<br/><p class=guideQuestion>
3.3. There is no code redundancy. 
</p>
<p class=guideDesc>
The reviewer should score here how well did the developer manager to avoid code redundancy. There should be no duplicated pieces of code. The developer should factor out code into helper classes or private methods and implement overloads if possible. This factorisation should not go into the opposite extreme either. The end result should not be a class with many small helper methods that do very little. Every method used to factor code should have a well defined functionality and should fit naturally in the design. (20%) (3-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>The code is consistently duplicated. Large pieces of common code are copied in different places and there seems to be no effort in avoiding such situations.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Some duplication exists but there are signs that the developer paid some attention to this aspec</td></tr>t.
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>No code redundancy exists.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>No code redundancy exists and the developer uses elegant techniques of avoiding it.</td></tr>
</table>
<br/><p class=guideQuestion>
3.4. The code is clear and efficient. 
</p>
<p class=guideDesc>
The reviewer is supposed to score here the clarity, the elegance and the efficiency of the code. The code should not be more complicated that it needs to be for what it does. It should not use complicated if constructs that make it hard to follow. There should not be huge pieces of code. Where needed, private methods should be used to reduce the complexity. The code should be as efficient as possible and different optimisation techniques could be used to achieve that (i.e. caching information, breaking out of loops once the result is obtained). However, the optimisations should be used wisely without going to the opposite extreme where the optimisations affect the clarity and the elegance of the code, without bringing significant benefits. (30%) (3-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Complicated code is written for simple tasks to such a degree that the code can no longer be followed. Unnecessary complications and sub-efficient code is a pattern in this implementation. The code is neither clear nor efficient.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The code clarity and efficiency could benefit some improvements but it is obvious that the developer was concerned with these aspects. The same score should be given if the balance between clarity and efficiency is not right.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The code is clear and efficient where needed. This score should be given if there aren’t any obvious places that need improvement but the developer did not show any special skills in the written code.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The code is clear and easy to understand. Necessary optimisations are used but without going to the extreme of sacrificing the code clarity for insignificant gains. The developer has shown obvious skills in writing clear and efficient code.</td></tr>
</table>
<br/><p class=guideQuestion>
3.5. The thrown exceptions provide suitable error messages and cause (where appropriate). 
</p>
<p class=guideDesc>
The reviewer should check whether the exceptions provide useful error messages.The spelling of the messages should be checked too. (10%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>No messages at all or the messages are so bad that they aren’t very useful.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Consistent errors in messages are present but the messages are still comprehensible.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Some minor typos or some isolated situations in which the messages are missing are present.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Meaningful and correct error messages are provided for each thrown exception.</td></tr>
</table>
<br/><p class=guideQuestion>
3.6. All code, including test cases, follows the TopCoder coding conventions. 
</p>
<p class=guideDesc>
The reviewer should check here the code style used by the developer. Tools such as Checkstyle should be used to properly check it. In addition, there should be no tabs, proper tags (author, version) and copyright section. Because there are tools to check the code style automatically, nothing less than perfect from the code style point of view should be tolerated. (10%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Consistent code violations are present to such a degree that the code looks bad.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Many code violations are present, but when looking at the code, it still seems professional.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Some minor code violations are present here and there.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The code style is perfect and every element is present.</td></tr>
</table>
<a name="documentation"></a>
<br/><p class=guideSubTitle>4. Documentation (20%)</p>
<br/><p class=guideQuestion>
4.1. The implementation code contains detailed documentation for classes, written in Javadoc / XML style as required by the Java / C# coding standards. (25%) (3-based)
</p>
<p class=guideDesc>
The reviewer should look at this from an application developer standpoint. Class documentation should contain a description of the class and its purpose. The documentation should emphasize on how the class will be used and also if it is subject to future extensions (subclassing for example). Class documentation should contain code examples of class usage where this is the case.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Documentation is missing for one or more classes or it proves to be consistently unhelpful. The documentation provided by the developer does not clarify how most of the classes will be used, by providing simple comments that do not bring additional value to the name of the class.  </td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Documentation exists for each class in the design but it provides little help to the developer; it is missing details regarding the way a class is intended to be used.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Documentation is complete and adequate to use the component but requires further minor clarifications in several situations.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the application developer using this component. The developer will likely not require any other details on how the component will be used.</td></tr>
</table>
<br/><p class=guideQuestion>
4.2. The implementation code contains detailed documentation for methods, written in Javadoc / XML style as required by the Java / C# coding standards. (25%) (3-based)
</p>
<p class=guideDesc>
The reviewer should look at this from an application developer standpoint. Method documentation should contain a detailed description of the method which can include: intent of method, pre and post conditions, side effects, dependencies, implementation notes, who should be calling this method, whether the method should or should not be overridden, where to invoke super when overriding, control flow or state dependencies that need to exist before calling this method. 
<br/><br/>
All required tags defining parameters, return type and exceptions should be present and correctly describe method details.
<br/><br/>
Method documentation should contain code examples where appropriate.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently unhelpful. A majority of the methods either miss documentation or do not provide required details.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Documentation is missing on at least one method or provides little help to the developer.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Documentation is complete and adequate to use the component but may require further clarifications.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the application developer using this component. The developer should not require any additional information on how the component will be used.</td></tr>
</table>
<br/><p class=guideQuestion>
4.3. The implementation code contains detailed documentation for variables, written in Javadoc / XML style as required by the Java / C# coding standards. (10%) (3-based)
</p>
<p class=guideDesc>
The reviewer should look at this from an application developer standpoint. Variable documentation should contain a description of the variable role and purpose, implementation notes and whether it is intended to be used in subclasses. Variable documentation should exist for all variables in the design, regardless of the visibility of the variable.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently unhelpful. A majority of the variables either miss documentation or do not provide required details.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Documentation is missing on at least one variable or provides little help to the developer.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Documentation is complete and adequate to use the component but may require further clarifications.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the application developer using this component. The developer should not require any additional information on how the component will be used.</td></tr>
</table>
<br/><p class=guideQuestion>
4.4. The implementation code contains detailed documentation. (20%) (3-based)
</p>
<p class=guideDesc>
The reviewer should look at this from a future component maintenance developer standpoint. This issue also ensures that there are no useless comments that pollute source code and make it hard to understand. At minimum, the developer should provide meaningful comments for blocks of code in methods, describing what it is trying to do, the assumptions made and the way it is done.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently non-helpful.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Documentation is missing in at least one important algorithm / code block or consistently provides little help to the developer. Documentation contains useless comments that do not provide any value to the implementation, but only make it harder to read / understand.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Documentation is complete and adequate to understand the implementation, but there are several places where it can further be enhanced with useful details, or simplified by removing useless comments.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Documentation is clear, complete and concise, helping in clarifying implementation decisions and details.</td></tr>
</table>
<br/><p class=guideQuestion>
4.5. There are no errors and no warnings while generating the Javadoc / XML documentation. (10%) (Yes-No Question)
</p>
<p class=guideDesc>
That means the documentation must be perfect from a syntactical point of view. There should be no missing tags, no additional tags, not even for private members or inner classes. Tools such as javadoc, Checkstyle or features of the modern IDEs should be used to check it. 
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>No - The documentation misses documentation tags or generates warnings and errors for different other reasons.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Not applicable - </td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Not applicable - </td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Yes - The documentation is correct and complete.</td></tr>
</table>
<br/><p class=guideQuestion>
4.6. The component documentation contains no grammatical or spelling errors. (10%) (4-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>The developer made so many grammatical or spelling errors that one cannot understand what the developer is trying to relate. </td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The developer made a number of grammatical or spelling errors but the overall knowledge transfer can be made with multiple readings. </td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The developer made some grammatical or spelling errors but the points were quickly understandable. </td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The developer was concise and made no errors.</td></tr>
</table>
<a name="unitTestCases"></a>
<br/><p class=guideSubTitle>5. Unit Test Cases (20%)</p>
<br/><p class=guideQuestion>
5.1. Unit Test Cases test all methods and constructors.  (25%) (3-based)
</p>
<p class=guideDesc>
The reviewer should verify if for each public method and constructor defined by the component, the developer provided test methods. The reviewer should focus on the existence of the test methods, instead of focusing on their quality. The Test Case containing the demonstration of the component will not be considered when counting existing test methods.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Most of the test methods are missing or the existing test methods incorrectly test the functionality of the component.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The submission does not contain test methods for trivial functionality of the component, like set / get methods or exception constructors for example. However, this is not appear to be a pattern throughout the unit testing.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>There is at least one test method for each public method and constructor.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>There are several test methods for each public method and constructor.</td></tr>
</table>
<br/><p class=guideQuestion>
5.2. Unit Test cases contain an implementation or a demonstration of how the component will be used. (10%) (3-based)
</p>
<p class=guideDesc>
Unit Test cases should contain at least an implementation of the “demo” provided by the designer in the Component Specification (if one is provided). The developer can and is encouraged to provide more test methods that demonstrate the way the component will be used by a future client. The test methods that are used as a demonstration should be grouped in the same Test Case. If the Component Specification does not contain a proper “demo” section, the developer is still responsible for providing one in their unit test cases.
<br/><br/>
The reviewer should look at this section from the point of view of a client and identify if the provided demonstration suits the needs of such a client, by helping him understand how the component is used.  (40%) (3-based)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>No demonstration of the usage of the component is provided, or the one provided is not helpful or does not refer to important basic functionality of the component. Basic functionality is that functionality that is essential to the component.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The provided demonstration properly describes the usage of the basic functionality of the component, but fails to present a demonstration of additional non-basic functionality or fails to implement the “demo” in the Component Specification.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The provided demonstration properly addresses the usage of the component and contains an implementation of the “demo” section as provided by the designer in the Component Specification.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The provided demonstration is clear, helpful and addresses all the needs of a client. All basic and additional functionality of the component is described, and properly documented.</td></tr>
</table>
<br/><p class=guideQuestion>
5.3. Unit Test Cases thoroughly and correctly test all methods and constructors.  (25%) (3-based)
</p>
<p class=guideDesc>
Unit tests evaluate every public method in the component to ensure that valid and invalid inputs are handled properly and as defined in the documentation. The reviewer should focus on verifying the correctness and the quality of the test methods provided by the developer. The existing test methods should correctly test the functionality of the component as detailed in the documentation. 
<br/><br/>
The Unit Test Cases consider using real data and appropriately configure the system as it is expected to be in the real world. For example, if a component implies using a database, the Unit Test Cases should provide test methods that interact with the database, instead of providing mock-ups of data.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>The unit tests do not correctly and thoroughly test the basic functionality of the component. The developer provided tests that address only valid or invalid arguments, or does not test the component using real values and system configuration. Basic functionality is that functionality that is essential to the component.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The unit tests do not thoroughly test the additional functionality of the component. The developer provided tests that address only valid or invalid arguments, or does not test the component using real values and system configuration. </td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The unit tests correctly and thoroughly test the functionality of the component. Basic and additional functionality of the component are addressed and tested using real values and system configuration, as it is expected to be run on the client’s computer.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The submission is properly tested using different types of tests that address different aspects of each tested method or constructor. For example, a time constrained operation should be tested if it respects the imposed constraints; an algorithm should be tested for accuracy using different sets of data. </td></tr>
</table>
<br/><p class=guideQuestion>
5.4. Where applicable, Unit Test Cases properly configure the test environment. (10%) (4-based)
</p>
<p class=guideDesc>
The reviewer should check if the Unit Test Cases wisely configure the test environment using setup and teardown methods, without duplicating the configuration with each test method. Also, the configuration should address only required items, and should not contain more configurations than needed. The reviewer should also look for extra initializations that affect the performance of unit testing. 
<br/><br/>
The unit test methods should not contain configuration details that are system specific. They must be stored in separate configuration files and loaded when needed. 
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>The test environment is not configured using setup and teardown methods, but instead the configuration is repeated over and over for a majority of the test methods, or the test methods contain configuration details that should have been stored in configuration files.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>In several places, setup and teardown contain configuration and initialization sections that either do not address all entities of the environment, or address more entities than needed, or affect the performance of the unit testing.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Setup and teardown contain configuration and initialization sections that either do not address all entities of the environment, or address more entities than needed. The missed or added entities should represent minor details, like repeatedly initializing the same variable without affecting the performance or the integrity of the unit testing.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Setup and teardown are used wisely for configuring the test environment, and configuration details that are system specific are stored in configuration files.</td></tr>
</table>
<br/><p class=guideQuestion>
5.5. Where applicable, files used in Unit Test Cases exist in the /test_files directory.
</p>
<p class=guideDesc>
The reviewer should verify that all test files and configuration files used in Unit Testing exist and are located in the /test_files directory. (5%) (Yes/No Question)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>No - No  The developer either provided invalid files or did not stored them in the appropriate /test_files directory.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Not applicable </td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Not applicable </td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Yes - All files used in the Unit Testing exist in the /test_files directory or there are no test files or configuration files used.</td></tr>
</table>
<br/><p class=guideQuestion>
5.6. Where applicable, Unit Test cases do not leave temporary files on the file system, open network or database connections, open files or streams after testing is complete. ( 5%) (Yes/No Question)
</p>
<p class=guideDesc>
The system is not affected after unit testing of the component, meaning that no temporary files are left on the file system, no network / database connections are left open, no files / streams are left open.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>No - Temporary files are left on the file system or database / network connections are not closed after testing is complete.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Not applicable </td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Not applicable </td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Yes - No temporary files are left on the file system after testing is complete and temporary files are created only when needed. </td></tr>
</table>
<br/><p class=guideQuestion>
5.7. The unit test code contains detailed documentation for classes, methods and variables as defined in the Deliverables Document. (20%) (3-based)
</p>
<p class=guideDesc>
The reviewer should look at this from a future component maintenance developer standpoint. Unit tests documentation should contain details about what is tested (which method / constructor), the expected behaviour and the arguments used. The quality of the documentation has to be the same as for the component code.
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>Documentation is consistently missing or consistently non-helpful.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>Documentation is missing on at least one test method or consistently provides little help to the maintenance developer.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>Documentation is complete and adequate to use the component but may require further clarifications.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>Documentation is complete and provides full details to the developer maintaining this component. The developer should not require any additional information on how the testing of the component will be maintained or enhanced.</td></tr>
</table>
<a name="rbTestCases"></a>
<br/><p class=guideSubTitle>6. Review Board Test Cases (10%)</p>
<p class=guideDesc>
(Stress, Accuracy or Failure tests)
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Stress / <br/>Benchmark:</b> -</td><td class=guideCell>Tests the implementation according to performance and throughput. Output basic benchmarking to System.out.</td></tr>
<tr><td class=guideHead><b>Accuracy:</b> -</td><td class=guideCell>Tests the implementation on the accuracy of the results when using the component.</td></tr>
<tr><td class=guideHead><b>Failure:</b> -</td><td class=guideCell>Tests the implementation's ability to handle bad data and incorrect usage.</td></tr>
<tr><td class=guideCell colspan=2>Please specify the type of test cases that were authored and executed, the total number of tests and the number of tests that were successful.</td></tr>
</table>
<a name="overall"></a>
<br/><p class=guideSubTitle>OverAll Comments</p>
<p class=guideDesc>
The reviewer should evaluate here the submission as a whole. One criteria to evaluate it is to look at how much work needs to be done to complete it. Another one is to answer whether the submission deserves to pass or not. Another criteria to consider its level of quality compared to an average submission that meets all requirements.  
</p>
<table class=guideTable cellspacing=0>
<tr><td class=guideHead><b>Score 1</b> -</td><td class=guideCell>The submission is lacking in many areas. In order to complete it much work needs to be done.</td></tr>
<tr><td class=guideHead><b>Score 2</b> -</td><td class=guideCell>The submission is lacking in many areas but the component still works and it is possible to test it. The problems it has should be fixable without much effort.</td></tr>
<tr><td class=guideHead><b>Score 3</b> -</td><td class=guideCell>The submission meets all requirements but it doesn't seem to excel in any way. The fixes that need to be done should not be significant. The submission should have average quality.</td></tr>
<tr><td class=guideHead><b>Score 4</b> -</td><td class=guideCell>The submission excels in many areas. All requirements are met and some exceeded. In order to complete the component only minor things have to be fixed. This submission is clearly above the average.</td></tr>
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
            <jsp:include page="right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
