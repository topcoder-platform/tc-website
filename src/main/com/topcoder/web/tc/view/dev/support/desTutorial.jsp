<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Design Tutorial</title>

<jsp:include page="../../script.jsp" />

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
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="desTutorial"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

			<h2>Design Tutorial</h2>

         <h2>Introduction</h2>
         <p>TopCoder Software designs components for Java and .NET. Although the two frameworks have their differences, the requirements to the design deliverables are identical. This tutorial does not teach you how to design - it is expected that you already understand object-oriented design, and are capable of converting a set of requirements into a design. This tutorial teaches you how to deliver your design to TopCoder so that the review board is able to give your design a good review, and ultimately a developer whom you will probably never meet in person is able to convert your design ideas into a finished component.</p>
         <p>At a high level, the design process is simple - you convert a set of requirements into a set of diagrams and a component specification document. When you have submitted your design, a three-member review board will review your work and give you feedback. You are given an opportunity to review the feedback and submit appeals. After the appeals, TopCoder Software compares scores of all submissions and determines the winning design. If your design wins, you implement the changes detailed in the feedback from the review board and submit the changes for the final review. This is the last step of the process - once your changes are approved, you are done!</p>
         <p>The rest of this tutorial describes this process in details.</p>

         <h2>Before You Begin</h2>
         <p>Before you begin, you need to get the software, set up your environment, and register with TopCoder Software.</p>

         <h3>Required Software</h3>
         <p>TopCoder Software uses Poseidon software from <A href="http://www.gentleware.com" target="_blank">www.gentleware.com</A> to capture diagrams during the design process. You need to download a Community Edition of the software. Gentleware regularly publishes updates to Poseidon. However, TopCoder Software does not switch to the latest version right away. Please consult <A href="/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">TopCoder Software web site</A> for the version of the software that you need to download.</p>
         <p>In addition to diagrams, you need to deliver a component specification document. You need to submit a document in Rich Text Format (RTF). You can use Microsoft Word or Microsoft WordPad to produce RTF files. The Microsoft WordPad is included with the default distribution of Microsoft Windows.</p>
         <p>Finally, depending on the target platform of your design, you need <A href="http://ant.apache.org/">ant</A> or <A href="http://nant.sourceforge.net/">nant</A> to prepare your design distribution for submission. See <A href="/i/development/downloads/TopCoder_Software_Member_Guide.pdf">TopCoder Software Member Guide</A> for the required versions of these tools.</p>

         <h3>Templates and Samples</h3>
         <p>The presentation of your diagrams needs to follow TopCoder Software guidelines. TopCoder supplies two sets of diagram styles - one for Java and one for .NET. You can view them <A href="/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">here</A>.</p>
         <p>In addition, TopCoder Software provides two sample design submissions for the Credit Card Validation (CCV) component - one for Java and one for .NET. These are real components that won in a competition against other submissions. This tutorial references these sample designs, so you need to download and unpack them. The sample submissions are available <A href="/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">here</A>.</p>
         <p>Finally, the Community Edition of Poseidon does not provide support for .NET designs. It comes with a set of pre-defined classes from java.lang and java.util packages, but no .NET classes. If you are designing for .NET, you need to download a Poseidon template with pre-defined .NET classes. The template is available <A href="/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">here</A>.</p>

         <h3>Registration</h3>
         <p>You must register with TopCoder software to participate in design competitions. This registration is in addition to your regular TopCoder registration. You can complete your registration <A href="/reg/index.jsp">here</A>.</p>

         <h2>Gathering the Requirements</h2>
         <p>Before you start designing, you need to understand what you are designing. TopCoder has gathered most of the requirements for you, and made them available in the form of the Requirements Specification document. Typically, this document provides you with a good starting point. However, you may find that the document describes the requirements very generally. This is intentional: TopCoder Software avoids limiting your creativity by specifying the requirements in very general terms. TopCoder Software also gives you access to <A href="https://software.topcoder.com/forum/c_active_collab.jsp?ft=2">forums</A> where you can ask questions and obtain any necessary clarifications to the requirements.</p>

         <h3>Choosing the Component</h3>
         <p>This is probably the most important step in doing the design. Do you know all the technologies involved in building this component? Have you designed or used a component like this before? Are you familiar with the algorithms required to implement the component? How much new technology will you need to learn before you can start designing? Answering these questions should help you decide if you want to give this component a try. If you choose a component that does not match your design skills or does not overlap with your area of expertise, you will spend a lot of time designing your component running the risk of your submission being rejected. If you choose a component for which you understand all the requirements, your chances of success goes up: once you have a working design in your mind, making it a winning submission is a matter of discipline.</p>

         <h3>Registering for the Component</h3>
         <p>Once you decided that a particular component might be for you, you have to register for this component. You must register before the registration deadline (usually 48 hours after the project has been posted for design) to be able to submit. If you are designing the component for a tournament, you must register for the tournament separately, before registering for the component. See rules of a particular tournament to learn about the registration requirements.</p>

         <h3>Obtaining the Design Distribution</h3>
         <p>Design distribution is an archive with the skeleton of the directory structure for your submission. Design distribution is available through the <A href="https://software.topcoder.com/forum/c_active_collab.jsp?ft=2">Developer Forums</A> -the first message on the design forum for your component contains the distribution archive. Most of the items in there are for developers - the only items in there related to the design are the build script and the requirements specification. Extract the archive to a directory of your choice. All your deliverables will go into the "docs" subdirectory of this directory.</p>

         <h3>Refining the Requirements</h3>
         <p>It is hard to overestimate the importance of understanding the requirements. Your chances to submit a successful design depend on it. Read the requirements several times to make sure that you understand what each item means. Sometimes, small but important items would be mentioned only briefly. Take notes of the small items that you find in the requirements document - your design has to address them, or the review board will find your design incomplete.</p>
         <p>Sometimes TopCoder Software clarifies requirements in the <A href="https://software.topcoder.com/forum/c_active_collab.jsp?ft=2">Developer Forums</A>. These clarifications are as important as the requirements in the original document. If you doubt that you understand any item in the requirements or in the forum posts, post your questions to the forum. Even if you have a slightest doubt about your interpretation of a particular requirement, post a question to the forum to confirm that you are thinking along the right lines. TopCoder will answer your questions within 24 hours. Try to get your questions in as early as possible; otherwise there may be no time to discuss the answer if you need further clarifications.</p>
         <p>Sometimes TopCoder Software requests designs for custom components (i.e. the components for a specific customer). Since a specific customer is involved, TopCoder Software restricts access to the design distribution to the designers who registered for the component. If you register for one of the custom components, read the forums, and then realize that you would not be able to build this component, you can contact the project manager to unregister. You can unregister only during a relatively short window - contact Project Manager before registering to find out the deadline to unregister.</p>

         <h3>Examining the Design Scorecard</h3>
         <p>Before you start preparing your design submission, take a look at the <A href="/tc?module=Static&d1=dev&d2=desReviewSample">design scorecard</A>. This card tells you what is considered important when your design is evaluated. In a sense, designing for TopCoder is an exercise in maximizing the value of the 25 items of the scorecard.</p>
         <p>A quick look at the scorecard reveals that TopCoder Software places a lot of value in the documentation: 25% of your score comes directly from scorecard items related to documentation. What the card does not show, however, is that poor documentation can cost you a lot more than the 25% allocated for it. Without good documentation, reviewers will not understand how your design maps to the requirements, and give your design low scores for the requirements section. If your documentation is poor, reviewers may not fully understand your approach either, scoring your design poorly on the approach section. The scoring of the design section is mostly independent of the documentation, but the entire section is worth only 10% of the total. This may be counterintuitive, but feature-incomplete designs with good documentation always win against feature-complete designs with poor documentation. This is because the ultimate goal of TopCoder software is to build a working component without involving the designer in the build process. This is impossible when the documentation is bad or insufficient. The scorecard fully reflects this - that is why the highest payoff in terms of review points comes from improving documentation.</p>

         <h2>Preparing Your Submission - Diagrams</h2>
         <p>Once you have a design (or a basic outline of a design) in your mind, it is time to capture it in a set of diagrams. You need to supply diagrams of three types -class diagrams, sequence diagrams, the use case diagrams. The following sections guide you through the process of making these diagrams.</p>

         <h3>Working with Poseidon</h3>
         <p>Poseidon is the tool used at TopCoder to capture UML diagrams. The tool presents a relatively intuitive interface to users who understand UML.</p>
         <p>One thing that you will notice right away is that Poseidon is slow. There is little you can do about it, other than learning to live with this limitation. A few things that will make the tool faster are:</p>
         <ul>
            <li>Allocate more memory - Poseidon is a memory-hungry tool; allocating more memory for its JVM at start-up helps speed things up a bit.</li>
            <li>Disable the Bird View - the Bird View facility is nearly useless when you work with small to medium-size diagrams; turning it off speeds up things because the amount of required rendering goes down by at least 50%.</li>
            <li>Disable automatic critiquing - the critiquing feature uses a lot of CPU. Use it only when you need it.</li>
            <li>When you are not writing the documentation, switch away from the documentation tab. This item alone can save you several seconds every time you select another model element: switching between classes, methods, and variables becomes much faster when the documentation tab is not visible.</li>
         </ul>
         <p>Another problem with Poseidon is that it sometimes corrupts your project files. Unfortunately, the only defense against this is to save your work often. Moreover, it is insufficient to simply click [Save] every once in a while: although Poseidon maintains a limited number of backup files, it does not tell you when it saves a corrupted file. Clicking [Save] enough times will overwrite all your good backups, leaving you with nothing. To address this problem, use the File/Save As menu command, and change the name of file every time you save. This may be wasteful in terms of disk space, but it can save you a lot of frustration, especially when re-building is not an option because of submission deadlines.</p>

         <h3>Preparing Use Case Diagrams</h3>
         <p>It is a good idea to start with the Use Case diagrams, because doing so lets you organize your thoughts at the high level before going deeper into the details. In general, you should make at least one use case for each requirement. When you are done, examine your diagram for dependencies. Can you find use cases that depend on other use cases? Do you have groups of use cases that share functionality? All but the most trivial components need use case diagrams featuring dependencies, extensions, or inheritance. Identifying and capturing these associations in a diagram will help you think about the classes in your design. It will also give you a higher rating for the corresponding item of the scorecard.</p>
         <p>For example, take a look at the <A href="https://software.topcoder.com/catalog/document?id=10141196">use case diagram</A> of the <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=10028532&ver=1">CCV design</A> and the way they map to the original requirements. The requirements ask for a way to define credit cards, pick a subset of credit card definitions, and validate a card against that subset. The Use Case diagram maps these requirements to three major use cases - Create Registry, Manage Registry, and Validate Credit Card Text. The Manage Registry case is further subdivided to show various management tasks. Note that even with the subdivisions for certain tasks the diagram stays at a high level. It tells you what you can do with the component without telling you how it is done. Also note the comments on the diagram. Use Case diagrams have a relatively limited expressive power; you should add comments for everything that you think may help the developers and the reviewers understand your intent better. Do not assume that the developers and reviewers will understand everything simply by looking at the diagram - useful comments are always appreciated.</p>

         <h3>Preparing Class Diagrams</h3>
         <p>Class diagrams are the most important diagrams of your design. They capture the structure of your classes and interfaces. All elements of your design should be on class diagrams, including the private methods and variables that you need to illustrate the way your classes work together.</p>
         <p>This tutorial assumes that you are familiar with UML diagrams. Since UML is a rather flexible language for designs, TopCoder establishes some guidelines for its use to avoid too much variation between diagrams prepared by different designers.</p>

         <h3>Classes and Interfaces</h3>
         <p>You need to use Class elements to model classes and Interface elements to model interfaces. Adding the "interface" stereotype to a class does not make it an interface.</p>
         <p>Pay attention to class scope and modifiers, such as final. Use as much relevant UML elements as you see applicable; use stereotypes for language elements that you cannot model in UML.</p>
         <p>If you are designing for .NET, you need to model certain language features not available in UML (such as enumerations and delegates) with classes. The example of the <A href="/tc?module=Static&d1=dev&d2=support&d3=diag_netClass">.NET Class Diagram</A> illustrates this and other conventions used at TopCoder. Unlike the <A href="/tc?module=Static&d1=dev&d2=support&d3=diag_javaClass">example diagram for Java</A> that can be viewed as a "coloring guide," the .NET example diagram tells you things that go beyond the level of presentation.</p>

         <h3>Relationships</h3>
         <p>When modeling relationships in Poseidon, pay attention to the attributes of your dependencies and associations. UML lets you add many useful attributes to lines that show relationships - you can specify multiplicity, aggregation / composition, and navigability. You can also name associations, which is especially useful when you show aggregations or compositions: using the name of the variable that you declared to implement the association helps viewers understand your design better.</p>
         <p>Look at the <A href="https://software.topcoder.com/catalog/document?id=10141192">CCV class diagram</A> for examples of showing relations correctly: the CreditCardValidatorRegistry is shown as a composition over CreditCardValidator objects; other relations are correctly shown as directional. Also look at the way the <A href="/tc?module=Static&d1=dev&d2=support&d3=diag_javaClass">example class diagram</A> shows and labels relations. This reflects the preference of TopCoder in choosing the types of relationships: for example, &lt;&lt;throws&gt;&gt; are shown as dependencies, not as associations, and &lt;&lt;realize&gt;&gt; are shown as interface realizations, not as an inheritances.</p>

         <h3>Member Variables</h3>
         <p>Classes must show all public and protected variables that they define. For the most part, public data members are limited to constants. Important internal data structures of a class (i.e. private variables) should be included in the model as well. When possible, show variable's initial value on the diagram - Poseidon supports a simple syntax for that: </p>
         <p>"- names: Set = new HashSet()". If the value for the variable comes as an argument of a constructor, do not show the initial value; instead, mention the initial value in the documentation tab of Poseidon.</p>
         <p>You should provide the type and the scope for each variable, and use the modifiers where applicable. If a variable is final, identifying it as such on the diagram helps convey your intentions to the developers implementing your design.</p>
         <p>Almost universally, your design should favor private variables with accessors over public variables. Static public final variables (which of course are not variables at all) represent the only exception (see the IDENTIFIER member of the subclasses of the AbstractCreditCardValidator class in <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=10028532&ver=1">CCV design</A> for an example). In general, reviewers will always catch your uses of non-static public variables, and score down your design.</p>

         <h3>Methods and Constructors</h3>
         <p>Include all public and protected methods and constructors in the model. Constructors should have a "create" stereotype. When the use of a private method or a constructor is important to the design, your diagram should show it as well. For example, if your design uses a private constructor to prevent instantiations of a class, your diagram should show that private constructor.</p>
         <p>Method modifiers play important role in conveying your intentions to the developers. UML supports all Java modifiers, and most of C# modifiers. Use stereotypes for C# modifiers missing from Poseidon (most notably, "virtual" and "override").</p>
         <p>When you type in a name of your constructor, Poseidon automatically assigns the constructor a return type. Since the "return type" of a constructor is always implied, you should remove the "return" entry from the argument list of the constructor. See constructors of the <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=10028532&ver=1">CCV design</A> for examples.</p>

         <h3>Preparing Sequence Diagrams</h3>
         <p>Sequence diagrams capture the interaction between objects in your design. You need to create one sequence diagram for each non-abstract use case from your use case diagrams. Name your sequence diagrams the same way you named use cases - this makes it easier for the reviewers and developers to associate them. Make your sequence diagrams as detailed as possible - they are your best tool to convey the dynamics of your component's interaction with the environment. Use comments to clarify elements of your algorithm that you cannot put on a sequence diagram. Comments should help developers understand your algorithm in more details. Finally, TopCoder uses a visual convention to show loops on sequence diagrams. This may be of great help to developers - see section on Templates and Samples for information on this and other visual conventions used at TopCoder.</p>

         <h3>Documenting Classes, Methods, and Variables</h3>
         <p>Providing documentation is the most important task that you have as the designer. It is not unusual to put as much or more efforts into the documentation as in the diagrams. Typically, the result is worth the effort: every helpful detail that you put in your documentation reduces the need to interact with the developers implementing your component. It also helps the review board understand your design better, which typically results in higher ratings on the scorecard, and a higher chance to win the component.</p>
         <p>Look at the documentation available in the <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=10028532&ver=1">CCV designs</A> in Poseidon for a good example of what to put in the documentation. Remember that you are not writing user documentation - your audience is developers and reviewers. You have to explain two important things to them: why do you need this class, method, or variable, and how to implement it.</p>
         <ul>
            <li>Class Documentation - You need to explain the purpose this class or interface serves in the design. Is this a base class of a group of related classes? Do its methods provide an implementation of a particular algorithm? Does it participate in a design pattern? If you think it is helpful to the developers, mention it here.</li>
            <li>Method Documentation - You need to explain the purpose of the method, its parameters, and the exceptions it throws. Does your method implement a particular algorithm? Did you provide a sequence diagram for the method? Does the method check its arguments for validity? If it does not, why is it OK? What are the valid values of the method's arguments? Does this method throw exceptions? When does it do it? If your method is non-trivial, consider providing pseudocode for it.</li>
            <li>When you document methods, you also need to document their arguments. Poseidon creates a table that lists all arguments of a method - you need to fill in the blanks. The argument documentation should define the valid values of each argument, and say what happens when a value is outside its range (i.e. an exception is thrown, a log entry is added, a default value is used, or something else happens).</li>
            <li>Variable Documentation - You need to explain the purpose of the variable and a range of its legal values. When is the variable initialized? What is the initial value? For collections, provide types of values. For maps and dictionaries, provide types of their keys. Is the variable mutable? Do you need to synchronize access to this variable or use a synchronized or an unmodifiable collection? Provide all the relevant details in this section.</li>
         </ul>
         <p>See the <A href="https://software.topcoder.com/catalog/c_component.jsp?comp=10028532&ver=1">CCV design</A> for an example of good Poseidon documentation. Note that good documentation does not necessarily imply a lot of documentation: the amount of documentation you write should be commensurable with the complexity of the class or the method. Explain everything that may make the implementation easier. This makes the development easier, and translates into higher review scores.</p>

         <h2>Preparing Your Submission - Component Specification</h2>
         <p>The Component Specification document is intended to be a self-contained document describing your design. Ideally, a reader should understand high-level organization of your component from the Component Specification alone, without having to look at the diagrams.</p>

         <h3>Your Audience</h3>
         <p>When you write your design documentation, always keep your audience in mind. Remember that you are writing for the review board and developers, not for the end-users of your component. This applies both to the component specification and to the documentation that you put in Poseidon.</p>

         <h3>Writing a Design Overview</h3>
         <p>Provide a high-level summary of the component and a summary of your design approach in this section. You should provide answers to these questions:</p>
         <ul>
            <li>What is the primary purpose of the component?</li>
            <li>What are the most important pieces of the component's functionality?</li>
            <li>How does the design address the requirements?</li>
            <li>What new functionality does the design add to the component?</li>
         </ul>
         <p>Make this section short - the details go into the other sections of the document.</p>

         <h3>Describing the Required Algorithms</h3>
         <p>Even when the requirements do not ask for algorithms specifically, your design probably relies on a few important sequences of instructions that should be followed precisely to make your component work. A general rule is that the developers should be able to build your component without external research. This does not mean that you should copy descriptions from web sites and textbooks: giving developers a link or a book reference complete with a page number is acceptable. For the simplest algorithms such as BFS, DFS, binary search, etc. it is acceptable to refer developers to their favorite textbook without providing an exact reference: you should assume that developers are qualified coders with at least the elementary training. However, if the algorithm that the developers need to implement is not a trivial application of a textbook algorithm, you will be better off providing the missing details. For example, if your component applies the BFS algorithm to search the file system, you should provide details on how the objects in the file system correspond to the objects in the textbook version of the algorithm.</p>
         <p>Generally, your description of the algorithm is only a recommendation to the developers. They can always implement the algorithm differently in a bid to produce a superior implementation. However, this is not an excuse to provide incorrect algorithms. It should be possible to implement your pseudo-code, or to copy your code directly into a class, and get a working solution. The best way to ensure that your algorithms work is to build a quick prototype and verify that the code you give to developers compiles, and does what you think it should do.</p>

         <h3>Documenting the Design Patterns</h3>
         <p>The patterns make your design easier to understand by "mapping" new concepts from your design to known concepts from the world of design patterns. Typically, mentioning design patterns by name and pairing them with classes in your design is sufficient for this section. Use <A href="http://www.bookpool.com/.x/mfxwo9n5t0/sm/0201633612">this book</A> as the definitive guide on naming patterns and their elements. Over the years of the industry's obsession with the subject of design patterns, a countless number of patterns have been identified in a great deal of books and articles. However, using only the patterns from the "Design Patterns" book is enough: reviewers may mention an obscure pattern that you missed in their reviews, but they will not give you a lower rating for missing it.</p>
         <p>You do not need to document your reasons for using or not using a particular design pattern, as long as you believe that you have good reasons for including or excluding a pattern. Remember, however, that adding patterns may introduce unnecessary complexity into your design: using more patterns does not automatically make your design better. Consequentially, the review board may score your submission lower for including unnecessary patterns that complicate the design.</p>

         <h3>Writing an Overview of Interfaces, Classes, and Exceptions</h3>
         <p>This section contains a simplified version of the class overview that you put in the documentation tab of Poseidon. You need to put enough information for each class, interface, or exception to help your audience understand the place the class takes in the overall design. If a class participates in a pattern, you may want to refer to the role the class plays in the pattern to help your readers understand the overall place of the class in your design.</p>
         <p>You should keep the descriptions in this section concise - typically, two or three sentences provide enough information about the class. When you describe exceptions (both custom and the system exceptions that your design reuses) you should also mention classes or methods that throw these exceptions. You should also include a descriptive message for the exception to serve as a guideline for developers.</p>
         <p>Look at the corresponding sections of the <A href="https://software.topcoder.com/catalog/document?id=10141191">CCV design</A> to get an idea on the expected depths of coverage for this section.</p>

         <h3>Describing Configuration Requirements</h3>
         <p>There are two approaches to making your design configurable: you can either provide a set of configuration APIs, or to use one or more configuration files. You need to discuss configuration only when you use configuration files. Almost inevitably, this means using the Configuration Manager component. Familiarize yourself with the APIs of the Configuration Manager component and the structure of the configuration files it supports. This should help you choose a solid configuration strategy.</p>
         <p>When you use the Configuration Manager component in your design, the configuration section should provide answers to three questions:</p>
         <ul>
            <li>What namespace does your component use?</li>
            <li>What are the names of the properties that your component read?</li>
            <li>What are the example values of the configuration properties of your component?</li>
         </ul>
         <p>One way to provide this information is to supply an example configuration file. See the configuration section of the <A href="https://software.topcoder.com/catalog/document?id=10141191">CCV design</A> for an example of this approach.</p>

         <h3>Discussing Thread Safety</h3>
         <p>Discuss threading and synchronization issues in this section. Is your component thread-safe or does it require external synchronization to be used in a multi-threaded environment? If your component is thread-safe, you should explain what makes it thread-safe. Typically, the discussion boils down to immutability and internal synchronization. See the thread safety discussion of the <A href="https://software.topcoder.com/catalog/document?id=10141191">CCV design</A> to get an idea of the expected depth for this section.</p>

         <h3>Writing a Good Demo</h3>
         <p>This section is important for two reasons - it gives the reviewers and developers a chance to evaluate the simplicity of your component's API, and it helps other designers evaluate the applicability of your component to their own design.</p>
         <p>The requirements document gives you an idea of what to put in your demo section. Taking a scenario from the requirements and writing an implementation for it using the APIs of your component should be sufficient. Make sure to comment your demo section, and cover all features of your design. If your design can be extended in multiple ways, you should separate the "mainstream" uses from the extensions for the "advanced" users. Use the conventional wisdom and go from simple examples to more complex ones. Make your demo section easy to follow - it is your opportunity to present your component to the world, so use it to your advantage.</p>

         <h2>Wrapping Up and Submitting</h2>
         <p>You should go through the design scorecard again before submitting. How would you rate your submission on each of the questions in the scorecard? If you think that a certain item will not get a top rating, try fixing it if you have time. If you do not have enough time to address all items you think need more work, try fixing the documentation items first. Once you are done, run the build script to prepare your submission. Depending on your target platform, build the design_submission target using either the ant tool for Java or the nant tool for .NET. If you did it right, and if your environment is configured correctly, you will see a new JAR file created in the top directory of your design. This is the file you use in the Submit and Review web application to upload your submission. It is a good idea to practice building your submission ahead of the deadline: finding a small bug in a TopCoder-supplied build script becomes progressively harder as you approach the deadline.</p>
         <p>You may upload your submission as many times as you want before the deadline. TopCoder Software provides you with a facility to check your uploaded submission. Once you uploaded your design, you can download it back to see that you have uploaded the correct file. It makes sense to use this facility: you have spent a lot of time preparing your design; taking this extra step prevents a great deal of frustration in case you pick a wrong file for an upload (this happens more often than you may think).</p>

         <h2>Review</h2>
         <p>Now that you have submitted, you can sit back and relax: there is nothing you can change at this point, all you have to do is to wait for the scores to arrive.</p>
         <p>The reviewing phase is split in two parts - the screening, which is done by a single reviewer, and the actual review done by three reviewers.</p>
         <p>The screening step is done to reduce the load on the reviewers. The reviewer performing the screening is typically an experienced reviewer who uses the TopCoder Software screening scorecard to quickly determine if a submission can get a passing score. Only the submissions that are grossly insufficient will fail at this point. For example, if a submission is missing the use case diagrams and the component specification, there is no point to review it further: you do not need three reviewers to tell you that it is impossible for this submission to get a minimum passing score. If you followed this tutorial well and paid attention to the <A href="https://software.topcoder.com/catalog/document?id=10141191">CCV component</A>, you should have no problem getting past the screening stage.</p>
         <p>The actual review is a different story. At this point, three reviewers evaluate your design using the TopCoder Software scorecard. When you get back your scorecards, there should be little or no surprises: the rating guidelines for each item of the scorecard used by the reviewers are available to you; the reviewers will provide you with explanations for every item for which you did not get the full score. Sometimes you agree with the reviewer's assessments, sometimes you disagree; when you think the reason reviewers disagree with you is that they did not notice something in your submission, misinterpreted the requirements, or missed a post in the developers' forum, you have a chance to appeal.</p>

         <h2>Appeals</h2>
         <p>The best way to win an appeal is to avoid it. Is your submission relying on a post in the developers' forums that you think may be easy to miss? Note it in your documentation. Are you interpreting a particular requirement in an unconventional way? Make sure you highlight it in your documentation. Do you think there are fine points of your design that the reviewers may miss? Stress them in your documentation. The component specification is your best weapon to avoid appeals. It is also your best friend if you do need to submit an appeal.</p>
         <p>The key thing to remember during the appeals is that you have only one chance to do it. There is no discussion going on at this point - you must state your point of view as clearly as possible to convince your reviewers that your submission deserves a higher rating in a particular category. This is the only item open for the discussion at this point: you should not, for example, attempt to convince the reviewers to remove a particular item marked as required from the list. If your component wins, you will get an opportunity to discuss this and other issues related to final fixes.</p>

         <h2>What Happens When Your Design Wins</h2>
         <p>Congratulations! The scores are in - your submission has won a component design contest. This does not mean that you are done yet: you need to fix all items that the review board considered required, and support the developers while they compete in developing a component to your design specifications.</p>

         <h3>Final Fixes</h3>
         <p>The first thing you get after the review has finished is an aggregation worksheet. This document becomes available shortly after the completion of the appeals phase. The worksheet enumerates the work items you need to finish before your submission is considered complete. You must implement all the required items, and consider implementing the recommended ones. In rare cases when you disagree with a required item because it has severe consequences to the design integrity, adds the unnecessary complexity to the component, or is useless to a potential customer, you should discuss the item with the review board and the TopCoder Software using the now-familiar developers' forums. If you fail to convince the reviewers of your point of view, you must implement the required change.</p>
         <p>One useful thing to do during the final fixes is to keep a list of items you fix, with comments on what you did to address the required item. Keep this document in the "docs" directory of your component to ensure that the document is archived together with your final submission.</p>

         <h3>Final Submission and Review</h3>
         <p>When you upload your final submission, the primary reviewer goes through your design once more to ensure that every item from the aggregation worksheet has been addressed. If the reviewer is satisfied, the design project is considered complete; if the reviewer is not satisfied, the project moves back to the final fixes stage for more iterations.</p>

         <h3>Helping Developers Build the Component</h3>
         <p>Now that your design is complete, the project is ready to move to the development phase. To ensure that you have a vested interest in the successful completion of the project, TopCoder Software ties the payment of the final 25% of the design winnings to the completion of the development phase. When you see your component posted for the development, you should start monitoring the developers' forums again: at this point, you are the main authority to answer developers' questions related to your design. Sometimes you will get simple questions from developers who miss a thing or two in the documentation. These are the easiest questions to answer - instead of copying the explanations from the documentation, you should refer developers to the answer in the component specification or in the Poseidon documentation. This will help reviewers of the development effort to understand what has really changed as the result of the forums interaction. However, most questions that you are going to get are really questions that point out things that you and the review board did not catch: mismatching signatures, typos in the names of objects and classes, etc. You should answer these questions with the understanding that the developers are not asking these small questions because they want to annoy you with silly stuff like "the getString is spelled as getSrting on the XYZ diagram." Please remember that the development effort is scored not so much on how well the resulting component works, but mostly on how closely the developer has followed your design. If your design says getSrting and the developers modify it to say getString without getting an OK from you, their effort will get fewer points from the development review board. This is the only way to ensure the consistency across multiple development efforts going on simultaneously in different parts of the world.</p>

         <h2>What If Your Design Did Not Win?</h2>
         <p>Very often TopCoder receives multiple qualified submissions for the same component. The review board picks the design with the highest score, which makes designing for TopCoder what it is - a competition. If your component does not win in a competition, you should try to learn as much as you can from the reviewers' comments, and from studying the winning submission when it is offered for development. Generally, looking at winning designs is one of the best ways to improve your own designs. This gives you an opportunity to understand the reasons why the review board gave that design the highest score of all the submissions. Very often, the reasons are in the knowledge transfer part of the design, not in the technical aspects of it. Understanding the reasons why winning designs win is key to improving the score of your future design submissions.</p>

         <h2>Conclusion</h2>
         <p>The learning curve on the design side of the TopCoder Software is long. Getting in your first design submission requires significant efforts, but things tend to get much easier over time. After a few submissions, struggling with the tools and understanding the process become secondary to your main challenge, which is to design the best solution to the set of requirements. Good luck!</p>

            <p><br/></p>
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
