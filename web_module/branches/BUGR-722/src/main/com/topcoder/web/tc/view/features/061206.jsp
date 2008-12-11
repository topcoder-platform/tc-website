<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<span class="bigTitle">Creating Use Case and Sequence Diagrams</span><br>

      <p>
      <img src="/i/m/Ghostar_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="151743" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

<span class="bodySubtitle">Overview</span><br>

The goal of this article is to provide a good understanding of what use case and sequence diagrams are, how they are properly created, and how they can influence a design.  This article will cover the standard parts of each diagram and how they fit together, at the proper level, to create a diagram that will help developers and users.
<br><br>
Throughout this tutorial we will focus on the <A href="http://software.topcoder.com/catalog/c_component.jsp?comp=21798352">File Validator component</A>, using that component to show the right and wrong ways to create the use case and sequence diagrams.
<br><br>
<span class="bodySubtitle">Use Case Diagrams</span><br>
A use case diagram is a simple diagram that describes <b>what</b> can be done with the component.  It should describe, in simple terms, all major functionality that can be accomplished with a component
<br><br>
<strong>Use Case Items</strong><br>
A use case is made up of the following items:

<ol>
<li><b>Actors:</b>  Actors describe the item that uses the functionality of the component.  Normally, for TopCoder components, the main actor is just an "Application", as the components are normally libraries that use the component we are designing.  Sometimes though, there could be other actors, possibly the "User."  The "User" is often seen as an actor in web components that the user directly interacts with, like the Calendar Tag component.</li>
<li><b>Use Cases:</b>  A use case describes the actual functionality that can be performed with the component, like "Validate file," or "Format code," or "Convert a value from one unit to another."  There are two main types of use cases, concrete and abstract use cases.</li>
<li><b>Concrete Use Case:</b>  A concrete use case defines functionality that the actor can use directly.  Normally, concrete use cases directly map to a part of the API in the component that the user can call to perform some operation.  A concrete use case is used directly by the actor to perform some sort of operation.</li>
<br>
<div align="center"><img src="/i/education/useCase1.gif" alt="Use Case Diagram 1" border="0" /></div>
</li>
<li><b>Abstract Use Case:</b> An abstract (or sometimes called aggregate) use case doesn't describe functionality that can get called by the user.  Instead, it defines common functionality that is shared between multiple use cases.  For instance, if we have two use cases that have similar functionality, but different implementations, they can be grouped with an abstract use case.  In the File Validator component, we have two different XML validation schemes, DTD and XSD validation.  Both of these validation types perform the same type of operation, but their implementations are different.  In this case a "Validate XML file" abstract use case should be used to group the two separate, concrete use cases.</li>
<li><b>Relationships:</b>  There are two main relationships that are normally used - include and extend.  There is a third available (a generalization relationship) that is very similar to an extend relationship, with some minor differences.  The generalization relationship isn't used very often, and is not covered in the sample Use Case diagrams given by TopCoder for designers.</li>
<li><b>Include Relationships:</b>  The include relationship defines a relationship between two use cases where one use case uses the functionality in another use case as part of its processing.  The include relationship is shown by a dashed arrow from one use case to the other use case the first will use.  It should be marked with an "&lt;&lt;include&gt;&gt;" stereotype.</li>
<li><b>Extend Relationships:</b>  The extend relationship shows a relationship from a concrete use case, normally to an abstract use case that is used to show that the concrete use case provides the functionality of the abstract use case in an implementation specific way.  Generally speaking, the extend relationship shows that the use case at the origin of the extend arrow decorates the extending use case somehow, with some sort of specific implementation.  In the File Validator component, the abstract use case is "Validate XML File".  An extend relationship is shown from "Validate XML file against an XSD file" to show that the XSD use case extends the "Validate XML File" use case by providing XML file validation using an XSD schema.  The extend relationship is visually similar to the include relationship, but instead of being marked with an "&lt;&lt;include&gt;&gt;" stereotype, it is marked with an "&lt;&lt;extend&gt;&gt;" stereotype.</li>
<li><b>Generalization Relationships:</b>  While the extend relationship defines that one use case extends another with implementation-specific or additional functionality, a generalization relationship defines a relationship where the child can <b>replace</b> the parent without affecting the overall process to the user.  For instance, if we had a "Validate XML file against an XSD file" concrete use case, it would be possible to have a "Validate XML file against an XSD file using X" use case generalize the original, as the new use case could completely replace the original concrete use case to the user.</li>
</ol>
<br>
<strong>Determining The Proper Use Cases</strong><br>
Determining the proper use cases is probably the hardest part of generating the use case diagram.  There are a lot of mistakes that can be made when figuring out what use cases to include.
<br><br>
The main step in getting the use cases right is to do the Use Case diagram before you do anything else in the design.  This ensures that the use case isn't affected by the designer's vision of the implementation, which can lead to errors.
<br><br>
In a TopCoder design competition, the easiest way to determine the use cases to include is to first go through the requirements, pulling out required operations that the user should be able to accomplish with the component.  If it is a functionality requirement, it should be a use case and also easily accessible in the API.
<br><br>
For the File Validator component, the following required operations can be taken from the <A href="http://software.topcoder.com/catalog/document?id=21798383">requirements specification</A> given:
<ul>
<li>Validate string</li>
<li>Validate stream</li>
<li>Validate byte array</li>
<li>Validate file path</li>
<li>Validate an XML file using an XSD schema</li>
<li>Validate a file using its file type and the Magic Numbers component</li>
</ul>

The thread safety requirement isn't a valid use case to show, as it describes a property of the component rather than an operation.  The same idea applies to the Object Factory compatibility requirements &mdash; it isn't an operation to be done with the component, but is instead a property describing the component as a whole.
<br><br>
The first four use cases pulled from the requirements &mdash; Validate string, Validate stream, Validate byte array, and Validate file path &mdash; can be all grouped under a "Validate file" use case.  There was the option of making each concrete type that the component could validate (string, stream, byte array, file path) its own concrete use case, but I determined that doing that would lead to use cases that were too "low level" (see below for more on identifying proper level).  Although it was decided not to include those use cases, a note was added explaining that the use case covered those possibilities, as it is a requirement of the design that the use cases cover the requirements mentioned in the requirement specification.
<br><br>
The first thing to do when defining the use case diagram is to determine the actor.  In this case, we know the component is a library that can be used by TopCoder for many different projects, but will always be part of a much larger program.  Since this component isn't used directly by a user, only as a library, we can determine that the actor should be called "Application," representing the larger application that will use this component.
<br><br>
Next, we look for any abstract use cases that may be defined.  The abstract use case is easy to glean from the use cases pulled from the requirements.  Notice that both the XSD and Magic Numbers validation both start with text similar to "Validate a file."  This makes it obvious that they both describe the same sort of functionality that could be described by some abstract use case, which in this case we call "Validate file."
<br><br>
The next step is to add any concrete use cases.  For this component, we add the "Validate a file using Magic Numbers," and "Validate an XML file using an XSD file."
<br><br>
Finally, we add the relationships.  The first one is from the user to the abstract use case, and the next is the "extend" relationships from the two concrete use cases to the "Validate file" abstract use case.
<br><br>
After adding the note about the different input types allowed, we get a use case diagram that looks like this:
<br><br>
<div align="center"><img src="/i/education/useCase2.gif" alt="Use Case Diagram 2" border="0" /></div>
<br><br>
This diagram succinctly and accurately describes the functionality of the component at a high level.  The user can see, just by looking at this diagram and nothing else in the component, what functionality is available.
<br><br>
If I had stopped here with the use case diagram, that would have been fine, and I would have had little to no trouble during review.  My problem was that I decided to add some additional functionality, in the form of another XML validation scheme: DTD.  This would allow me to get extra points for additional functionality, but these extra points were diminished because of how I chose to show that new functionality in the use case diagram:
<br><br>
<div align="center"><img src="/i/education/useCase3.gif" alt="Use Case Diagram 3" border="0" /></div>
This may look fine at first, but notice that now we have two concrete use cases that start with the same "Validate XML File" string.  This is a perfect place for another abstract use case, but I missed that before submitting.  Every one of the three reviewers picked up on the problem, and it cost me some points.  This is why it is best to solidify your use case diagram before you start anything else.  By constantly coming back and changing the diagram, you introduce the possibility of errors.
<br><br>
After final fixes, the final use case diagram looked like this:
<br><br>
<div align="center"><img src="/i/education/useCase4.gif" alt="Use Case Diagram 4" border="0" /></div>
<br><br>
<strong>Getting The Right "Level"</strong><br>
Determining if a use case has the right level - neither too high nor too low - is a tricky thing to do.  First we have to know what is meant by use case "level."  The level of a use case is really how well it defines <b>what</b> the functionality of the component is to the user.  Determining if a use case is at the right level is really a matter of asking yourself two questions:
<ul>
<li>Does the use case accurately explain to the user <b>what</b> functionality is available?</li>
<li>Does the use case explain to the user <b>how</b> the functionality is obtained?</li>
</ul>

The purpose of the first question is to determine if the use case is too high level.  Going back to our File Validator example, if I had just included a concrete "Validate File" use case, and nothing else, the use case would be too high level.  It wouldn't accurately describe to the user that the functionality available is only validation of XML files against a schema and validation of file type with the Magic Numbers component. 
<br><br>
The purpose of the second question is to determine if the use case is too low level.  The purpose of the use case diagram is to explain to the user <b>what</b> functionality is available in a given component, but the user doesn't need to know <b>how</b> the functionality is obtained.
<br><br>
For example, if the use case diagram I had come up with for the File Validator component had looked like this:
<br><br>
<div align="center"><A href="/i/education/useCase5_lg.gif" target="_blank"><img src="/i/education/useCase5.gif" alt="Use Case Diagram 5" border="0" /></A><br>
<i>click for larger image</i></div>
<br><br>
We could determine that a number of the new use cases were too low level, as they would fail the second question test.  The user shouldn't care at this point that we use the XmlFileValidator, or that they need to set the FileType to validate against, or how the Magic Numbers component is used to validate the file type.
<br><br>

<strong>How The Use Case Diagram Affects The Design</strong><br>
The use case diagram should affect the overall design of the API, not the other way around.  To ensure that the API is coherent and simple for the user, each concrete use case should be easily accessed through a method or two in the API.  The easiest way to do this is to map each concrete use case to a method in the API, named similar to the use case if possible.
<br><br>
The areas in the use case diagram that are abstract should be represented by pluggable features in the design, either through an abstract class or an interface.  Since the abstract use case defines similar behavior for use cases, and abstract classes and interfaces define similar behavior for classes, it should be straightforward to map the API and the use cases.
<br><br>
Going back to the File Validator component again, it is fairly obvious what the API should look like, just by looking at the use cases.
<br><br>
Since "Validate File" is abstract, it should be represented by an abstract class or an interface in the class diagram, if possible.  In this component, the use case maps directly to the FileValidator class.  The FileValidator class handles all the different file formats allowed &mdash; from string, to byte array, to path, and to stream, and the conversions between them &mdash; allowing the subclasses to only need to override a single method that takes a stream parameter.  "Validate XML File" is also abstract, and it maps to the XmlFileValidator class.  The XmlFileValidator class aggregates the actual validation functionality, so all the subclasses need to do is pass the parent class some parameters.  The three concrete use cases can be seen mapping to the three concrete classes in the component.  In this way, the component is coherent and should be easily used and understood by the user.
<br><br>
If you do the use cases first and allow the final use case diagram to affect the overall outcome of the API, you should end up with a component that will be coherent, consistent, and easy for the user to pick up and use.
<br><br>

<strong>Use Case Dos And Don'ts</strong><br>
<ul>
<li><b>Do</b> design the use case diagram first.  Use the requirements to determine what use cases are needed.  This will lead to an easy-to-read diagram, not affected by the designer's choices that come later on.</li>
<li><b>Don't</b> use class names in the use cases, especially class names from your own designed component.  The use cases should be independent of the class diagram, and will likely be the first place a user heads to figure out what is possible with the component.</li>
<li><b>Do</b> use the proper abstract use cases and actors.</li>
<li><b>Do</b> make sure that the relationships used are the right ones and are pointing in the right directions.</li>
<li><b>Don't</b> change the use case diagram much, if at all, after it has been originally completed.  While it may be hard to avoid, the chances for errors and "level" problems are much greater if the changes are done after the class diagram has already been started.</li>
</ul>
<br>
<span class="bodySubtitle">Sequence Diagrams</span><br>
A sequence diagram is a diagram that shows the flow of data through an operation in the component.  Normally a sequence diagram covers all the interactions that happen on a particular method call in the component.
<br><br>
Sequence diagrams are easier to produce correctly than a use case diagram.  They are more time consuming, mainly because you generally need to do at least a couple for most components, but generating them is straightforward.
<br><br>

<strong>Sequence Diagram Items</strong><br>
Sequence diagrams are made up of two items, in a two dimensional grid.  Along the X-axis are all the objects that are going to be used in the diagram.  They should be named after the type they represent, like IDictionary or XmlFileValidator.  Along the Y-axis run the messages between these items, representing all the different calls in the diagram.
<br><br>
<div align="center"><img src="/i/education/useCase6.gif" alt="Use Case Diagram 6" border="0" /></div>
<br><br>
The messages run on "swimlanes" between two different objects.  The actual call is represented by a solid arrow, and the return value is represented by a dashed arrow going back to the caller.  Each message in the diagram needs to have a short description, as well as the name of the call being made.  The return arrows just need to have "Return" as the description and the type returned as the message.  The message returned should be "void" if the call doesn't have a return value.   A create call is special and needs to be marked with the "&lt;&lt;create&gt;&gt;" stereotype.  
<br><br>

<strong>Picking The Interactions To Show In Sequence Diagrams</strong><br>
Picking the correct interactions in the component to document as sequence diagrams is the most difficult part of the sequence diagram deliverable in TopCoder components.  The TopCoder review guidelines for sequence diagrams states: 
<br><br>
<i>"Interactions involving five or more objects (both system and/or component) are considered complicated. Designers may include SDs with less than five objects, but they are not required to do so."</i>
<br><br>
This helps a bit when determining what to diagram.  Keep in mind that the number of objects is not just those in the component, but all those actually used in the operation, like all the SQL types (connection, command, reader), or all the XML types (XmlDocument, XmlReader, XmlNode, XmlElement).   
<br><br>
Generally speaking, if an operation involves another TopCoder component &mdash; like ConnectionFactory or IDGenerator &mdash; it should be shown as a sequence diagram.  The exception to this rule would be the Configuration Manager.  Using the Configuration Manager just to read in simple properties for a class normally doesn't need to be documented in a sequence diagram.  If, on the other hand, the Configuration Manager loading involves creation of more complex objects from the component, or moderate computation, it should be documented with a sequence diagram.
<br><br>
The biggest mistake I see when doing reviews is that designers don't include sequence diagrams they think are self-explanatory or easy.  The normal operations skipped are SQL operations, like INSERT and UPDATE, as well as XML parsing operations.  Keep in mind that the current scorecard doesn't allow a lot of leeway in this area, so it is a good idea to include SQL and XML interactions.  This also helps clarify areas in the component, especially things like SQL connection handling.
<br><br>

<strong>Diagramming The Interactions</strong><br>
Actually generating the diagram isn't hard, but it can be time consuming.  Optimally, the sequence diagram should show all interactions in a particular call, down to collection types like IDictionary and List.  In practice, this can lead to large diagrams, but the more information available the better.  Sequence diagrams are not approximations or overviews, they are meant to be an accurate representation of all the interactions in a call.
<br><br>
The sequence diagrams should normally start at the left side of the diagram with an "Application" object that represents the external caller.  That object has a message from it to an object in the component, representing the call made.
<br><br>
<div align="center"><A href="/i/education/useCase7_lg.gif" target="_blank"><img src="/i/education/useCase7.gif" alt="Use Case Diagram 7" border="0" /></A><br>
<i>click for larger image</i></div>
<br><br>
This is the average case for sequence diagrams, but sometimes internal interactions that need to be documented could originate from an object inside the component.  After the first interaction, it is just a matter of accurately showing the flow of data in the call, in as much detail as possible.  Make sure to include objects not housed in your design, especially TopCoder objects from other components used.
<br><br>
Notice in the above diagram we show the FileValidator calling another instance of the FileValidator object.  This is my way of showing internal interactions between the same instance of a class, but you can optionally use the loopback arrow, where the message loops back to the originating object.  
<br><br>
Loops are extra pieces that can make a big difference in a diagram.  Currently there are two ways of doing loops &mdash; you can use the loop construct in Poseidon 4.1.2, or you can do it the "old" way by drawing a rectangle around the area that is repeated.  I prefer the "old" rectangle way, as you are allowed more documentation in the rectangle describing what the looping actually accomplishes.  An example of looping can be seen in this diagram:
<br><br>
<div align="center"><A href="/i/education/useCase8_lg.gif" target="_blank"><img src="/i/education/useCase8.gif" alt="Use Case Diagram 8" border="0" /></A><br>
<i>click for larger image</i></div>
<br><br>
<strong>Possible Shortcuts</strong><br>
Here are two possible shortcuts you can take when doing sequence diagrams.  These aren't officially sanctioned, so use at your own risk.  I have found these to work well for me, in moderation.
<br><br>
<i>Use notes to your advantage</i><br>
A lot of times in components you will see that two or more interactions are similar, but still considered "complicated."  In these cases you could save some time by doing one diagram well, then adding a note explaining the other interactions and how they differ from the main diagram.  Only use this if the interactions are <b>very</b> similar, and the differences can be described in a sentence or two.
<br><br>
<i>Show shortcuts to the interactions</i><br>
Use this only in moderation, and only carefully.  I have found that by using loops and other things you can show shortcuts to interactions.  The main place I use this is XML parsing, where we read more than 3 items from an XML node.  You can group these all into one call by adding a loop around the read and explaining in the loop that this interaction is repeated for "items 2-x," whatever they may be.  Note that you still need to show all interactions; you are just grouping some together to save space.
<br><br>

<strong>Sequence Diagram Dos And Don'ts</strong><br>
<ul>
<li><b>Don't</b> show interactions that are simple and just set or get values of variables, like property setters and getters (that aren't calculated) and constructors that take the parameters and assign them to member variables.  Such simple operations aren't required and detract from the sequence diagrams that are actually informative.</li>
<li><b>Do</b> make your sequence diagrams as detailed as possible.  The more detail, the better, and you will never get docked points for having too much detail.</li>
<li><b>Do</b> show interactions outside the component.  By confining your sequence diagrams to only objects in the current design, the diagrams tend to have missing information and aren't complete enough for development.</li>
<li><b>Do</b> the sequence diagrams <b>after</b> the class diagram has been finalized.  By doing this, you ensure that the interactions and calls you show in the diagram exist in the component, and you lessen the likelihood of having to make changes to the sequence diagrams later on.</li>
<li><b>Do</b> use the sequence diagrams to evaluate the validity of your design.  The more detailed you get with the sequence diagrams, the more the sequence diagrams will confirm or deny the assumptions you made in your design.  If you start to have problems detailing the sequence diagrams, go back and take a second look at the design, and see if you can make changes to make things simpler.</li>
</ul>

<strong>Conclusion</strong><br>
One thing not really covered in this tutorial is proper coloring of the diagrams.  You can review the <A href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=desDocumentation">sample use case and sequence diagrams</A> for a good explanation of the colors used.  The sequence diagram generation has changed with Poseidon 4.1.2, so you may need to be creative in getting them correct, at least until new samples are available for the updated versions.
<br><br>
Hopefully this tutorial gives you a good understanding about what use case and sequence diagrams are, and how they can be done correctly.  Keep in mind these are just guidelines, not definitive rules - and always be prepared to appeal your decisions to reviewers.
<br><br>



        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
