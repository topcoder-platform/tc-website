<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
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
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

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
      
                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
