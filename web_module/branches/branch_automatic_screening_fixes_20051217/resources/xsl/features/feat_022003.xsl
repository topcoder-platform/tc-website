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
                        <font size="3" color="#000000" face="tahoma, verdana"><i>Why Hasn't the Vision Met Reality?</i></font></p>
                        
                        <p>Wednesday, February 20, 2003<br/>
                        By&#160;David Tanacea, <i>President of TopCoder Software</i></p>

                        <p>For years now, we in the software development industry have been extolling the virtues of component-based development (CBD). The 
                        benefits of object-oriented design and component-based development seem obvious: </p>
                        
                        <ul>
                            <li>Reusing software saves money in the development phase of software projects, i.e., the more components you reuse, the less software 
                            you have to build. </li>
                            <li>The more applications in which you use a given component, the more valuable that component becomes.</li>
                            <li>Reusable components enable application developers to customize applications without high costs and long development cycles.</li>
                        </ul>
                        
                        <p>Reused software components have fewer bugs because they are used more often, and errors are uncovered and corrected along the way.</p>

                        <p>If CBD is easier to maintain, cost-efficient (saves up to half of software development costs) and incorporates a shorter development 
                        cycle, why then aren't software components utilized in more applications? </p>

                        <p>The answer lies in the application development process, especially the beginning stages of software development&#151;research and 
                        discovery. Put simply, CBD has been hampered due to lack of discipline and lack of expertise, especially when applying CBD methodology 
                        to the application development process. Software applications need to be well defined before coding begins. </p>

                        <p>Iterative prototypes, functional requirements, business process flows and transitions, and use cases are all critical tools used in 
                        application design. However, in most instances, the issue isn't the tools that are utilized, but the extent to which they are used. In too many 
                        cases, coding begins after high-level use cases have been defined, which causes the problem. In order to realize the true benefits of reuse, 
                        use cases must be driven down to the lowest level of granularity before class diagrams are created. Then, component diagrams must be 
                        created and broken down to their lowest level to identify reuse throughout the application. When done well, the immediate results are 
                        low-level base components that are the building blocks of all software. </p>

                        <p>It is relatively easy to extend, customize and assemble base components into complex components. However, if base components aren't 
                        identified in the application design process, the application suffers from blocks of software that are unwieldy and improperly interfaced. 
                        Base components, because of their low level of granularity, are easier to utilize in multiple applications, thereby driving down the 
                        development costs of the organization as a whole, without forgoing quality and customization. </p>

                        <p>The second driving factor behind CBD's slow adoption is that proper application development isn't done rigorously. First, it takes 
                        knowledge and foresight to break down an application design to its lowest level. Second, there is always the urge to quickly finish 
                        designing and start coding! </p>

                        <p>Project deadlines approach like the proverbial freight train, and the paradox is, the extra time spent in the design process makes the 
                        development process proceed exponentially faster and with fewer errors. While this is true for any design methodology, it's especially 
                        true for CBD, as the benefits gained by a particular application are also realized by all additional applications that utilize that component. </p>

                        <p>There are several ways that an application developer can drive down the cost of applications and increase their quality. The most obvious 
                        is to enforce good CBD principles. Design and development should be separate, with different individuals working on each. Both must have 
                        their own peer testing and review process. Managers must ensure that the internal component assets are well organized. Developers must 
                        be able to easily search for components that meet their functional and technical requirements. Components must also be well developed and 
                        well documented. It's better to forgo the opportunity to reuse a component than to poorly build an ostensibly reusable component. High 
                        quality, low-cost commercial components should be utilized to speed the building of a company's reusable assets. </p>

                        <p>Finally, it is critical for all development benefits to be measured. Metrics that measure component cost (in component development 
                        and re-use), productivity (speed of development) and quality (number of defects) must be established and tracked. Application metrics, 
                        the number of places components are used, the cost per application (total cost divided by the number of applications) and the percentage 
                        of applications using reusable components (productivity increase) must also be established. Only through quantitative analysis can a 
                        process be continually improved. The results will make the benefits obvious, saving both IT and the organization's resources, and making 
                        the discipline of application development much easier to enforce.</p>
                        
                        <p><br/></p>

                        <p>By&#160;David Tanacea<br/><div class="smallText"><i>President of TopCoder Software</i></div></p>
      
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

