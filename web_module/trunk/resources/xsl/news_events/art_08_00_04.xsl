<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Press Room</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Wanted: La Creme de la Creme</span></p>
                        </div>

						<p>
						TopCoder successfully blends the cooperative elements of open source with good, old-fashioned global competition.
						<br/><br/>
						<span class="bodySubtitle">Not Just for Fun</span><br/>
						The TopCoder elite have found the competition's rewards include considerable cash.
						<br/><br/>
						Beyond the fun and competition, top coders can make serious money. TopCoder Tomasz Czajka from Poland (who goes by the codename tomek) has earned $75,000 from two contests that took a total of less than 10 hours. Thirteenth-ranked U.S. TopCoder dmwright, whose real name is unlisted, has earned $151,000 to date. Each coder is re-rated after every competition according to a complex algorithm that involves competition factor, skill, volatility and expected performance.
						<br/><br/>
						Of the 40,000 Top Coder member base, Java and C++ programmers make up the majority of coders, with 45 percent professionals and 55 percent from the collegiate crowd the top-ranked U.S. schools are MIT, Stanford, Caltech, Stony Brook and Michigan. 
						<br/><br/>
						TopCoder keeps stats on ranges of ages, not individual ages, but they do claim a large community of high schoolers some of whom are climbing the ranks.
						<br/><br/>
						Of the 25,000 U.S. TopCoders, 5,773 are rated members (members are rated only if they compete).
						<br/><br/>
						Bursting geographic boundaries, Glastonbury, Conn. based TopCoder pits the best programmers in the world against each other. Based on a model of "competition and lucrative fun," TopCoder ups the ante for the software industry by paying attention to what you can do, not who you are. "Aggressive competition has got to be good," CTO Michael Lydon says. "Anyone who wants to compete already has a leg up in this world, whether it be in sports or, in this case, programming." 
						<br/><br/>
						Based on the age-old premise that quality counts, TopCoder's a triple threat: It holds competitions for its large pool of programmers and ranks them, has a catalog of commercial reusable software components that's been coded by its membership base that other programmers can re-use, and does software development using a patented process of distributing software specifications in the form of problems that are up for bid. This multifaceted approach, supported by its programmer pool and substantial component base, has proven not only cost effective, but global, in its reach to offer the best-coded implementations to clients. 
						<br/><br/>
						<span class="bodySubtitle">Building a Framework</span><br/>
						The company evolved its competitive software development model with care. Founded in 2001, TopCoder was based on two principles: First, it's difficult and costly identifying top coding talent, and second, the best way to reduce software costs is through reuse. Driven by these values, Chairman and CEO Jack Hughes launched the concept of programming tournaments to objectively assess software developers' skills. Programmers signed up in droves, competed, and were sorted by a complex formula, with the best programmers rising in the ranks. TopCoder has extended this platform to allow for more advanced competitions to yield commercial-grade software components and applications. Its competitive-based software development methodology rests solidly on the foundation of their ranked and skilled member base and its growing commercial grade components. 
						<br/><br/>
						The ratings reflect not only competence, but work ethic if you sign up for a tournament and don't show or quit early, you lose points. If you challenge another programmer and are wrong, you're penalized; if right, your opponent loses the points. "The ranking process is totally open," says Lydon. "If it wasn't, our credibility would go out the window and recruiters love it." Top-dog ratings generally mean money and recognition, and companies looking for programmers have turned to TopCoder to evaluate top candidates as well as to post openings. 
						<br/><br/>
						According to an article posted on the TopCoder website by competitor dplass, " All I really need to know about software development, I learned from TopCoder."
						<br/><br/>
						<span class="bodySubtitle">A Handful at the Helm</span><br/>
						What's unique about the TopCoder software development methodology? For one, its lean personnel: The organization has only 25 employees; five are product/project managers, but all are software architects. In a typical TopCoder project, the front and back ends look similar to those in traditional development practices. TopCoder project managers are responsible for requirements gathering and development of specifications with high-level use case diagrams, activity diagrams and technical constraints, developing the proposed architecture describing the platforms on which the application will reside (logical and physical layout of the system), and generating a working prototype, a deployment diagram that defines the logical layout of the system modules and components, and the project plan.
						<br/><br/>
						<span class="bodySubtitle">Best Shore Methodology</span><br/>
						Sounds like business as usual, but here's where the path diverges and the competitive model kicks in: In the subsequent design and development phase, TopCoder's "best shore" approach is competitively implemented through a bidding process in which the best implementation wins. Work is broken into generic components to split the deliverables and responsibilities amenable to sustaining parallel efforts and reuse. Transitioning from specification to design stages requires breaking the application into modules and components that can be designed independently. In the process, existing components from the TopCoder component catalog as well as new components are identified, leading to more generic designs resulting in higher rates of reuse.
						<br/><br/>
						The application project, posted on the TopCoder website, provides a high-level overview of the application, eligibility, complexity level, payment and deliverables. Software designers are given four days to ask questions and state their interest in the project. TopCoder then selects at least two designers to compete in the design phase, sometimes under NDA. The company then provides them with a requirements specification, high-level use case diagrams, activity diagrams, HTML prototype, component diagram and access to a secure online forum for project discussion. 
						<br/><br/>
						TopCoder's "best shore" approach is implemented through a bidding process in which the best design and code wins. 
						<br/><br/>
						The designers typically have one week to submit their designs to a review board of three high-rated, paid TopCoder members. Designs are evaluated on a number of rigorously enforced key metrics: TopCoder requires more detailed use cases (and the design of new use cases, if necessary), class diagrams, method definitions, exceptions, sequence diagrams, DDL (Data Definition Language), test plans, enumeration of the design patterns that were used, and benchmarks. The design phase should provide a detailed blueprint for the application developers. All submissions are then rated from how well the designer interpreted the requirements to the proper use of patterns by the TopCoder review board and posted on its website. The highest-rated design is implemented in the development phase. 
						<br/><br/>
						Development is similarly competitive: A project description, including a high-level overview, payments and timelines, is posted on the website. Developers log in and state their interest, and TopCoder selects at least two to participate based on their qualifications. If required, NDAs are signed and access offered to secure online forums with clients, project managers and designers. Upon submission, the code is reviewed and undergoes extensive testing by up to three TopCoder Development Review Board members. Only one winner is selected per project. The winner is provided feedback in the form of comments, suggestions or required changes, and works with the developer until the application passes final review. The deliverable is a packaged, fully functioning, fully tested solution for the application that complies with TopCoder's coding standards, including fully documented code and unit test cases. 
						<br/><br/>
						<span class="bodySubtitle">Back-end Structure</span><br/>
						At the back end, it all comes together in the integration and testing phase, which entails the work of managers, designers and developers. Winning developers are responsible for integrating their code with the project's different modules as well as the components from the TopCoder Component Catalog, until all existing test cases pass. The application goes through an internal QA certification phase, and it's then deployed and tested in the client's QA environment.
						<br/><br/>
						Changes to the scope and requirements are posted in the forum. Designers submit design changes with appropriate UML and supporting text to the project manager. The developers download the latest design from the forum and incorporate these changes in the component. Designers and developers are paid only when the development and integration phases are successfully completed. 
						<br/><br/>
						<span class="bodySubtitle">For Cash, Royalties and Recognition</span><br/>
						Available component design and development contests are listed on the TopCoder website, with prizes ranging from $100-$1,000. 
						<br/><br/>
						In a typical project, more than half of an application is composed of generic components from the TopCoder Component Catalog, leading to savings of more than 30 percent. All generic components developed by TopCoder belong to the organization and are added to the eponymous catalog. Custom components built for the project typically comprise 25 percent of the application and are owned by the client, along with the application-specific code (the application glue). Developers earn royalties based on the quarterly revenue earned by the TopCoder Component Catalog.
						<br/><br/>
						When asked if this model was duplicable in other companies, Lydon said that it probably was for large companies like IBM, but for others, it would be too costly to emulate TopCoder's extensive community of top-flight programmers, its catalog of reusable software components and its highly disciplined approach to software development. 
						<br/><br/>
						Rosalyn Lum

						</p>

                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
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
