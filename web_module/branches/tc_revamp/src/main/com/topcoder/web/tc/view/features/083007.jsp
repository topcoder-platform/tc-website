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
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517215" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Introducing the Configuration API &amp; Configuration Persistence components</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/FogleBird_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="160049" /><br />
      <em>TopCoder Staff</em>
</div>
<br clear="all">
<p><em>Originally featured in the most recent <a href="/tc?module=Static&d1=media&d2=tcchannel">TC Channel</a>, here is TopCoder project manager Michael Fogleman's review of recent updates to the most widely used component in the catalog - the configuration component. </em></p>
<p> Today we will discuss two high-visibility components in the <a href="http://software.topcoder.com/catalog/c_showroom.jsp">TopCoder catalog</a>. They are the <A href="<tc-webtag:linkTracking link='http://software.topcoder.com/catalog/c_component.jsp?comp=24631840' refer='feature_083007'/>">Configuration API</a> and the <A href="<tc-webtag:linkTracking link='http://software.topcoder.com/catalog/c_component.jsp?comp=26745972' refer='feature_083007'/>">Configuration Persistence</a> components, which were both only recently introduced to replace the traditional <A href="<tc-webtag:linkTracking link='http://software.topcoder.com/catalog/c_component.jsp?comp=500004' refer='feature_083007'/>">Configuration Manager</a> and refine TopCoder's approach to configuration management. Today's discussion will hopefully be useful to any members looking to get started in Component Design or Development, or even in application Assembly Contests. </p>
<p style="height:264px; width:300px; float:right;"><A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=tcchannel&clip=ep04' refer='feature_083007'/>"><img src="/i/education/feature083007/tc_chan_foglebird.jpg" /></a></p>
<p> Historically, the Configuration Manager has been used by 65% of the components in the catalog. This number reflects just how important it is for each component designer or developer to be completely familiar with these two components.</p>


<p> 
<span class="bodySubtitle">What's New</span><br />
The new Configuration API and Configuration Persistence components were recently added to the catalog to correct a few technical shortcomings in the previous Configuration Manager component. These include: </p>
<ol>
  <li><strong> Decoupled Persistence Logic <br>
  </strong> The new components decouple configuration entities from the logic which saves or loads the configuration. As a result, configuration can be managed independently from however it is persisted or obtained. </li>
  <li><strong> Programmatic API<br>
  </strong> The new components allow configuration objects to be programmatically created and modified. This makes it possible to use components without creating a configuration file at all. </li>
  <li><strong> Simplified Integration<br>
  </strong> The new components simplify the passing of configuration from component to component. In this new paradigm, components will typically accept a configuration object in their constructor, instead of a string representing a configuration namespace. </li>
  <li><strong> Advanced Functionality<br>
  </strong> The new components also support operations based on regular expression matching and generic processing over the nodes in a subset of the tree. </li>
</ol>
<p> The Configuration API component is a simple container for storing configurations. Its functionality includes: </p>
<ol>
  <li> Name &rarr; Value mapping for configuration values </li>
  <li> Name &rarr; Value mapping for child configuration object nodes </li>
  <li> A synchronized wrapper </li>
  <li> A default implementation of the configuration object interface </li>
</ol>
<p>This container can be used in a stand-alone manner, creating and manipulating configuration programmatically. Or the Configuration Persistence component can be used to load or save configuration objects from or to files. The default implementation is backward-compatible with the file types and formats used in the Configuration Manager component. </p>
<p>Let's take a look at a quick example to see the expected usage patterns for these two components. </p>
<p align="center"><img src="/i/education/feature083007/composition.png" /></p>
<p>Let's say an application is made up of two components and some assembly code. One of the two components also depends on a third component to accomplish one of its tasks. The expected usage pattern can be summed up as follows: </p>
<p align="center"><img src="/i/education/feature083007/dependencies.png" /></p>
<p>1. The three components only depend on the Configuration API component. Only the assembly code uses the Configuration Persistence component to load the configuration and pass the configuration objects to its two child components. </p>
<p align="center"><img src="/i/education/feature083007/distributionOfConfiguration.png" /></p>
<p>2. The configuration file -- and thus, the configuration objects -- will only hold the configuration for components A and B. Any configuration needed by C will be programmatically created by B. B's configuration should include any parameters needed to fulfill this role. This decouples the parent of B -- the assembly code -- from C, a component that is only indirectly depended upon </p>
<p align="center"><img src="/i/education/feature083007/configuration_tcchan_4.png" /></p>
<p>As an alternative to #2, the configuration object for B could have a nested configuration object for C that B could then pass on directly instead of programmatically creating a new one. The parent of B is no longer decoupled from C, from a configuration perspective, but this may be a better option when the amount of configuration for the indirectly associated components becomes large and unmanageable. </p>
<p>If you would like to see these components in action, check out the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=26806052">File Delivery</a> component, which was designed for the finals at this year's <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary">TCO</a>. </p>
<p>The Configuration API and Configuration Persistence components will soon become more and more mainstream as new projects begin to adopt them and phase out the existing Configuration Manager. They aren't too complicated to use, but you will need to be familiar with them to get an edge on your competition. Good luck! </p>
<p><strong>Related links: </strong></p>
<ul>
  <li><a href="<tc-webtag:linkTracking link='/tc?module=ViewActiveContests&ph=112' refer='feature_083007'/>">This week's current Component Design contests</a></li>
  <li><a href="<tc-webtag:linkTracking link='/tc?module=ViewActiveContests&ph=113' refer='feature_083007'/>">This week's current Component Development contests</a></li>
  <li><a href="/tc?module=Static&d1=tutorials&d2=netConfigurationMgr">Using the .NET Configuration Manager</a></li>
  <li><a href="/tc?module=Static&d1=tutorials&d2=comp_index">Component Tutorials</a></li>
</ul>
<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
