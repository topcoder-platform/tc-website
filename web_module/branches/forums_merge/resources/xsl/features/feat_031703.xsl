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
                        <p><font size="5" color="#000000" face="tahoma, verdana"><strong>Component-Based Development</strong></font><br/>
                        <font size="3" color="#000000" face="tahoma, verdana"><i>TopCoder Style</i></font></p>
                        
                        <p>Monday, March 17, 2003<br/>
                        By&#160;srowen, <i>TopCoder Member</i></p>
                        
                      	<p>There is programming, and there is software development. You, dear TopCoder member, demonstrate 
                      	weekly that you can solve well-stated programming puzzles quickly.
                      	</p>
						<p>Yet solutions to real-world problems require more: deciding *what* puzzles must be solved, 
						describing them thoroughly, developing solutions that are open to change, and verifying those 
						solutions: design, documentation and testing. Together with the actual programming, these make up 
						the software development process.
						</p>
						<p>These are not new issues, and fortunately we have a set of common tools available when tackling 
						these software development tasks. Object-oriented language was a major step forward for design, 
						as was the Unified Modeling Language (UML) for describing software systems. Wide interest in 
						standard "design patterns" has added to designers' common vocabulary of design solutions. Finally, 
						standard open-source unit testing packages like JUnit have helped developers benefit from early and 
						frequent testing.
						</p>
						<p>Despite all this, it's still an art, not a science, and software development skill grows with real 
						experience. Lucky for us then that TopCoder Software has done for software development what TopCoder did 
						for programming, where members can compete to design and develop small software components. It's 
						instructive to see a modern software development process in action on a small scale, and to learn 
						through participation (and of course there is the lure of prize money.)
						</p>
						<p>So, this article presents my own perspective on how to navigate the software *design* process. 
						This being TopCoder, it is in the form of a brief 10-step guide to designing TopCoder Software 
						components, but the ideas should be somewhat applicable elsewhere, since TopCoder Software's practices 
						are common to many Java projects (i.e., Ant, JUnit, javadoc, UML). I hope to convince you that this 
						doesn't have to be a difficult or time-consuming process, and thereby encourage even more TopCoder 
						members to bring their skills to the competition, and also employ these software development processes 
						in the real world. It can only make us all better designers and developers.
						</p>
						<p><b>1. Pick your component; conceive your approach</b><br />
						At TopCoder Software, start by picking a component that interests you, or pertains to your experience. 
						If you can apply some specialized knowledge or great insight to your design, then it has a real "secret 
						weapon." Winning a design competition is not just about producing good documents, but also presenting a 
						compelling story for the future of the component; think about what in your design will really sell the 
						review board on your ideas. For example, those with a finance background might dream up significant 
						extra functionality for the Financial Calculator; those with extensive networking experience know more 
						about what needs to be designed into the HTTP Tunneling component.
						</p>
						<p><b>2. Inquire about the component</b><br />
						Inquire about the design competition at topcoder.com so that you can get access to the component 
						specification forum. There you can get the design submission .jar file, which contains the 
						directory structure for your submission. Unpack this into a local directory, and complete whatever 
						other local setup you need. Setting up your environment and organizing your resources is always an 
						important first step.
						</p>
						<p><b>3. Define your use cases</b><br />
						This should be easy; having considered the component requirements, and decided basically where you 
						want to go, you should be able to list about two to five distinct things that are done with the 
						component, and who or what ("actor") does them. Just consider how you might summarize this informally 
						for another developer. For TopCoder Software components, you may often just have one "actor", 
						which is the software application that uses the component. As an example, what do you do with a 
						Spell Check component? Create and configure it, and use it to find misspelled words in a document? 
						Or possibly, correct misspellings based on suggestions?
						</p>
						<p>Get started on your model in Poseidon: start a new model, and create a use case diagram. 
						Drop in an actor, create a use case bubble for each of your use cases, connect them, done!</p>
						<p><b>4. Prototype it</b><br />
						Conventional wisdom says that one should design first, and implement second. Indeed, that's generally 
						good advice, but it's always tempting to skip right to the coding. In this case, give in - start 
						laying out some of your ideas in code; see if you can get basic functionality working. In the process, 
						you may discover that your conceptual design doesn't actually work out well when it comes to coding it. 
						You may find out that your algorithms, or third-party components you want to use, don't work. 
						A couple rounds of coding should uncover any fatal design problems before you go any further.
						</p>
						<p><b>5. Write your class diagram</b><br />
						After you have tried out your design ideas in code, and are satisfied that it can be made to work well, 
						you should have a sense of what classes will make up your design, and how they will relate. Start 
						adding these to your class diagram.
						</p>
						<p>TopCoder guidelines and example documents demonstrate exactly what you need to model (essentially, 
						anything public - if there are important non-public elements, though, these can be modeled as well). 
						This is the "map" for your component design, so strive for clarity - the point of the diagram is 
						communication of ideas to another person like yourself. Make the diagram neat; the arrangement of 
						diagram elements should visually communicate groupings. Don't model anything beyond the basics unless you 
						really feel it's important; too much detail can obscure the basic structure.</p>
						<p>Fill in javadoc as well according to TopCoder guidelines to the Poseidon diagram; this is the place to 
						detail exactly what each public method and class does.
						</p>
						<p><b>6. Write sequence diagrams</b><br />
						Sequence diagrams describe the flow of control and information in the component for its various actions. 
						While there are a number of ways to approach sequence diagrams, for small software components, a good 
						rule-of-thumb is to describe functionality at the level of pseudo-code. It will help developers understand 
						to implement functionality at a high level.
						</p>
						<p>What to model and not model here is fairly subjective; again, remember that the purpose is to clearly 
						communicate the high-level structure of the implementation to other developers. Capture all the major 
						method calls and interactions between objects; skip the minor details, as they just clutter the diagram. 
						If the diagram runs past two printed pages or so, it's likely too big - reduce your level of detail, or 
						break the diagram into two if possible.
						</p>
						<p>Sequence diagrams for TopCoder Software components are available on the web site; browse a few to 
						develop a sense of how different designers like to model these items.
						</p>
						<p><b>7. Fill out the component specification</b><br />
						Having almost perfected the UML documentation of your design, finish by writing up the English 
						documentation. For TopCoder Software, that's the Component Specification document. Like in any 
						design, you should include a concise summary of the component's functionality and major design points. 
						The rest of the document should be straightforward to complete, with your completed Poseidon model. 
						In particular I think it is useful to include illustrative code snippets in section 4.
						</p>
						<p><b>8. Export skeleton code and add javadoc</b><br />
						With a completed class diagram, you should be able to export skeleton Java code from Poseidon. You will 
						need this code when writing your test cases. Fill in javadoc as well according to TopCoder guidelines 
						to your skeleton code; this is the place to detail exactly what each public method and class does. Be 
						sure to follow TopCoder's code formatting guidelines, which are basically Sun's guidelines; these are 
						commonly used in Java projects as well.
						</p>
						<p><b>9. Write test cases</b><br />
						Writing test cases before coding starts is gaining popularity as an effective way to empower developers 
						to write good code; for small software components it is, without question, feasible, and useful. TopCoder 
						Software enforces this because you, the designer, will write some test cases for the benefit of developers 
						after you.
						</p>
						<p>Your tests verify that the functionality you have specified is provided in an implementation. If you 
						say that a method should not accept null, test for this. Cover all public methods in your tests - this 
						ensures that the tests won't even compile if any part of your API is not implemented. Write tests that 
						verify all basic functionality.
						</p>
						<p>See the example TopCoder design submission for an example of a JUnit test case.</p>
						<p><b>10. Repeat if needed, and submit</b><br />
						You will likely need to revise your work from steps 5 though 9 a few times. It's advisable to step away 
						from your work for a day or so, then review your entire submission with fresh eyes one last time. It's 
						easy to accidentally make updates in one place but not another - for example, if you revised a method's 
						name during design, did you updated it in the class diagram, the skeleton code, the unit tests, and in 
						the component specification?</p>
						<p>Once satisfied, build your design submission and send it in!</p>
						<p>This approach works well for me in practice at TopCoder Software, and during other real-world 
						software development. It's not the only approach to be sure, nor necessarily the best, but I offer it 
						to new and experienced developers alike as just another perspective "from the field." Cultivating good 
						design habits turns good programmers into powerful software developers; I hope that more of TopCoder's 
						strong programmers will contribute to and learn from participation in TopCoder Software design and 
						development projects.</p>
                        
                        <p><br/></p>

                        <p>By&#160;srowen<br /><i>TopCoder Member</i></p>
      
                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" bgcolor="#FFFFFF" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
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

