<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>The 5 Most Common Design Mistakes</strong></font><br />
                        Tuesday, February 10, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=119676"><strong>Pops</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
Being on the review board, I see designs that are first attempts, those that are well polished and everything in-between.  After seeing so many, a few mistakes seem to be made over and over.  I polled two fellow designers, srowen and kyky, to see if they have had any similar experiences with mistakes and whether they would have any recommendations to avoid those mistakes.  I've attempted to summarize their and my experiences in a compilation of the most 5 common mistakes and how to avoid them.</p>

<p><span class="bodySubtitle">1. Making assumptions</span><br/>
Easily the biggest mistake that I run across because it can happen in every stage of the design process.  You should have a crystal clear understanding of the requirements - if you do not, you have made an assumption on some requirement point.  This is a problem because the reviewer may make a different assumption on the same point and mark you down because of it.</p>

<p>You should make use of the forums extensively to either challenge unclear requirements or to refine your own understanding until you are crystal clear.  The forum also becomes a nice paper trail of your decision that can be followed by the review board members.</p>

<p>Your design elements (documentation, skeletons, class diagrams, sequence diagrams, etc) must show your intent clearly.  You cannot assume that the developer, or more importantly - the review board, will 'get it' or understand the subtlety or implications in your design.  While I'm working on a design, I usually keep a scratch sheet that I use to write down any of my thoughts that occur.  I will not consider the design finished until all those thoughts have been documented somewhere in the design.</p>

<p><span class="bodySubtitle">2. You're a designer - not a developer</span><br/>
You are writing a design for a developer - not developing the component.  Remember, a developer is synonymous to a programmer analyst.  I mention this because the 'analyst' part of that definition is the key word.  The developer is responsible for analyzing your design and figuring out the most efficient implementation - not you.</p>

<p>This means that you should never write a single line of code (with the single exception of validating a concept that your design hinges on).  If you write code, two possible side effects could happen.  Your eventual design, whether you realize it or not, will generally either require or heavily favor the implementation that you wrote  - eliminating or severely limiting a potentially better implementation the programmer analyst could implement.  Secondly, your design will inevitably create a component whose API is easy for you to implement rather than focusing on a component whose API is easy for the customer to use - which should be your focus.</p>

<p><span class="bodySubtitle">3. Making behemoth APIs</span><br/>
A single class taking up the majority of the design with function after function is probably symptomatic of a design problem rather than being a valid design decision.  While there are cases when a huge class is proper, the far likelier case is that the class has too large of scope and can be broken down into smaller, more easily maintainable classes with a more specific scope.  The overall design usually becomes more flexible with smaller classes because you have more 'building blocks' to combine in different ways.</p>

<p>Secondly, a huge API generally points to the component being in 'overkill' mode - trying to accomplish too much too early on.  Most of the components that are being designed are version 1.0 components.  A component should start simple, accomplishing or slightly surpassing the requirements, and allow future enhancements (driven by market needs) to expand upon it.</p>

<p><span class="bodySubtitle">4. Know the parties involved and their focus</span><br/>
Designers need to understand who will be using the designs and for what purpose.  The audience of the design consists of three separate parties:  the customer, the review board and the developer.  These parties are distinctly different in focus and need to be treated differently in your design.  The customer is looking at the design to figure out how to use it.  The review board is looking for well-founded patterns, flexibility and overall cleanliness of the design.  The developer is reviewing it to determine the best implementation.  Too many of the designs submitted forget who the target audience of each element is.  Let's look at each element and discuss who the element is for and why.</p>

<p>The component specification is of main interest to the review board and secondarily by the developer.  The component specification explains what the design accomplishes, the approach used, why it is designed this way and what the strengths/weaknesses are of the approach.  Think of the specification as your explanation to the review board on your design and it should address all assumptions, the reasoning and the design decisions that you have made in the design.  The specification should not only document the strengths of your design but also the weaknesses (otherwise you run the risk of a review board member finding the weakness and marking down for it).</p>

<p>The class diagram is of interest to all parties and is probably tied with the specification document in importance.  The customer and review board will use it to understand the structure of the component and how it interacts.  The developer will use it as a guide to their development.  Because of the importance to all parties, it must be crystal clear in intent (see the presentation point below for ideas on improving this area).</p>

<p>The developer will primarily use the 'documentation tab' to understand the element's use, rules and functionality within the component.  The documentation is written using javadoc formatting (or XML doc formatting in .NET designs) but is NOT really javadoc in the true sense.  This documentation is to the developer to explain how to implement that particular element.  The developer is then responsible in writing the proper customer javadocs.  The method documentation should mention functions intent and what are valid and invalid arguments.  A variable documentation should not only state what the variable means but also its limits and potentially, what methods modify it.</p>

<p>The use cases are of primary interest to the customer.  The use cases cover a high level look at the cases this component would be good for.  Use cases are a bit of art because they can be described at many levels (from fairly detailed cases to very high level cases).  A good rule of thumb is to think from the customer's standpoint and try to decide what level of detail is appropriate.</p>

<p>The sequence diagrams are of primary interest to the developer.  Think of the sequence diagrams as pseudo-code on how your component accomplishes the use cases and should not be very low-level (again, you're the designer - not the developer).  They should show the flow from class to class but not really get into the internal implementation details.</p>

<p><span class="bodySubtitle">5. Presentation</span><br/>
Presentation is one of the most important elements in the review process.  A badly presented design will almost always lose to a well-presented weaker design because it is easier to grasp.  A clear, concise design leaves the reviewer with no assumptions or misunderstandings and represents the thoroughness and time the designer put into the design.   The presentation is the 'sell' aspect to the review board - here's the design, it's easy to understand so score it well.</p>

<p>The component specification should contain no spelling errors and be neatly laid out (alignment, sections, bullet points, etc).  The class diagram should have no overlapping edges to any element, use colors to denote class types and have well laid out association lines (did you know that you can click on the middle of a association line to create an angle?).  More importantly, you should logically group related elements together in the class diagram - implementations of an interface better be near the interface rather than scattered around.  Classes, methods and variables should be consistently named across the diagram as well within each class. The sequence diagrams are nearly impossible, in Posedian, to lay out cleanly - you should make generous use of notes in the diagram to further explain the sequence.</p>

<p>While many other design mistakes have been seen, these probably represent the largest grouping of them.  The suggestions (and errors for that matter) are generic enough to be applied to any of the components that you may submit.  Try to follow some of the suggestions represented here and the designs you submit should start receiving higher points.</p>

                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

