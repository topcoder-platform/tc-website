<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 520;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
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
            <jsp:param name="node" value="comp_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="comp_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=comp_index">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="515168" message="Discuss this article" />
</div>

<span class="bigTitle">Using the .Net Configuration Manager </span>
<br /><br />

<%--<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10445079" context="development"/> <br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>Over the last 60 days, the Java version of the Configuration Manager component has been downloaded more often than any other component in TopCoder's catalog. Just a few spaces behind it in the Top 10 most-downloaded list is the .NET version of Configuration Manager. </p>

<p>Most TopCoder members who have participated in at least one .NET design or development competition will tell you that the first component they needed to learn was the <strong>Configuration Manager.</strong> Simply put, it&rsquo;s a key to unlocking the potential of the component catalog, because it abstracts access to the configuration data on almost every single .NET component you'll ever need to use. In this article, we'll look at the functionality that makes this component so powerful. </p>

<p>Because the implementation details of <a href="https://software.topcoder.com/catalog/c_component.jsp?comp=5904571&ver=3">Configuration Manager</a> are already presented in the component specifications, this article will focus on the following topics:</p>
<ul>
  <li>Where to use the Configuration Manager component</li>
  <li>Overview of component API</li>
  <li>Discussion on the functionalities provided</li>
  <li>How to plug this component into your application.</li>
</ul>

<p>The target audience for this article is TopCoder members who are new to component competitions, or who are interested in taking their first steps into the component arena. If you're more experienced and don't need all the explanations on the component, you might still find the section on configuring your application useful &ndash; if so, feel free to skip over the next few sections and go directly to <a href="#plug">'How to plug this component into your application'</a>.</p>

<p><span class="bodySubtitle">Where to use Configuration Manager</span><br />
As stated in its <a href="https://software.topcoder.com/catalog/document?id=11863464">Requirements Specification</a>, the purpose of the Configuration Manager is to centralize the management of, and access to, the configuration data. This component is almost ubiquitous in the TopCoder .NET Catalog because of this functionality.</p>

<p>Common examples where this component should be used are libraries that need configuration for the external entities with whom they are communicating (like an FTP, SMTP server address and port or a database connections string), or libraries that need to distinguish items that change, depending on which machine they are used, from items that stay the same.</p>

<p>Some of the most popular TopCoder components that benefit from the power provided by this component include:</p>

<ul>
    <li><a href="https://software.topcoder.com/catalog/c_component.jsp?comp=9900311&ver=1">Connection Factory</a>, which decouples a particular database implementation from applications and other components by providing a layer of abstraction around the creation of a database connection.</li>
    <li><a href="https://software.topcoder.com/catalog/c_component.jsp?comp=14896778&ver=2">Object Factory</a>, which provides a standard interface to create objects based on configuration settings or some other specifications.</li>
</ul>


<p><span class="bodySubtitle">Overview of the component API</span><br />
In this section we'll introduce how the component should be used, by presenting a series of code samples focused on the usage of the .NET Configuration Manager API.</p>

<p>In order to take advantage of the configuration properties we need to load them first. The component provides a comfort method for developers, which helps load a new configuration file. The component&rsquo;s internal mechanisms will recognize the configuration file&rsquo;s extension and use the proper handler to load the file. </p>

<pre class="code">
const string iniConfigFilePath = @"..\..\conf\Email_Engine.ini"
const string xmlConfigFilePath = @"..\..\conf\Message_Persistence.xml";
// Retrieve the Configuration Manager instance
ConfigManager cm = ConfigManager.GetInstance();
cm.LoadFile(iniConfigFilePath);
cm.LoadFile(xmlConfigFilePath);
</pre>

<p>Retrieving property values is pretty straightforward. By specifying the namespace and the property name we can obtain the property value(s) needed. Starting from the second version of this component there have appeared a set of comfort methods for retrieving long or double values from configuration (internally the Configuration Manager contains <tt>DefaultStringConverter</tt> class, which takes care of converting from string to the needed type). </p>

<p>Another feature introduced in the second version of the component is the possibility to retrieve property values with a parsing preference. The parsing preference refers to constraints we can declare when retrieving a property value like:</p>

<ul>
  <li>property is required to exist in the configuration</li>
  <li>property is required to have a non-empty/non-blank string value.</li>
</ul>

<pre class="code">
try

{
    // Retrieve the Configuration Manager instance
    ConfigManager cm = ConfigManager.GetInstance();

    // Verify if the configNamespace exists
    if (cm.GetNamespace(configNamespace) == null)
    {
    StringBuilder msg = new StringBuilder();
    msg.Append("The configuration manager namespace ")
    .Append(configNamespace).Append(" is missing");
    throw new ConfigurationException(msg.ToString()); 
    }

    smtpPort = cm.GetIntValue(configNamespace, smtpPortPropertyName);
    // A common practice for making a more robust reading mechanism    
    // from configuration is to check if the parameters are missing or 
    // if they are empty/blank strings. A ParsingPreferenceException    
    // will be thrown if the specified preferences for the value are 
    // not respected.
    // In the case of GetIntValue/GetDoubleValue methods this check is   
    // made by default.
    ParsingPreference smtpAddressparsingPreference = new ParsingPreference();
    smtpAddressparsingPreference.AllowNull = false;
    smtpAddressparsingPreference.AllowEmpty = false;
    smtpAddressparsingPreference.TrimSpace = true;

    smtpAddress = cm.GetValue(configNamespace,     
    smtpAddressPropertyName,smtpAddressparsingPreference);
}
catch (ConfigurationException)
{
    throw;
}
catch (Exception ex)
{
    // All exceptions thrown by ConfigManager are wrapped into a  
    // exception used in the application for denoting a configuration
    // problem. Note that ConfigurationException is not part of  
    // Configuration Manager component's assembly.
    throw new ConfigurationException(
        "There is a problem with the configuration : "
            + ex.Message, ex);
}
</pre>

<p>Configuration Manager is also used in unit tests of components. In this manner, multiple testing environments are simulated with writing less code. An interesting detail worth noting here is that, after running a test case, the testing environment that was previously created must be cleaned in order to avoid possible inconsistencies when running successive test cases.</p>

<pre class="code">
/// &lt;summary>
/// Releases all resources used in testing. Clears all the namespaces 
/// from the Configuration Manager.
/// &lt;/summary>
[TearDown]
public void TearDown()
{
    ConfigManager cm = ConfigManager.GetInstance();
    // By making this method call all the namespace are cleared and by 
    // specifying &lt;c>preload&lt;/c> property as false the preload 
    // files(specified usually in "..\conf\preload.xml" file will not   
    // be reloaded.
    cm.Clear(false);
}

/// &lt;summary>
/// Tests the constructor of the &lt;c>MockEmailEvengine&lt;/c> class when 
/// the configuration namespace is loaded from a &lt;c>.ini&lt;/c> file.
/// &lt;/summary>
 [Test]
public void TestConstructorInitializedWithIniConfigFile()
{
    ConfigManager cm = ConfigManager.GetInstance();
    cm.LoadFile(iniConfigFilePath);
    MockEmailEngine instance = new MockEmailEngine(ConfigNamespace);
    Assert.IsNotNull(instance, "The instance was not created");
}
</pre>

<p><span class="bodySubtitle">Configuration Manager functionality </span><br />
This component provides the possibility to read property values from different types of configuration files like:</p>

  <ul>
    <li>.ini files</li>
    <li>.xml files</li>
    <li>.mxml files (which contain the description of property retrieval handler from an alternative data source).</li>
  </ul>

<p>You can examine the formats of those files on the attached demo provided by this article. Note that a configuration file can contain one or more namespaces declaration.</p>

<p>This component is almost a replicate of the component with the same name developed in Java. There are a few interesting differences between those two components, though. For example in Java we can have imbricate properties, like in the following configuration sample code:</p>

<pre class="code">
&lt;Property name="transition1">
  &lt;Property name="startState">
    &lt;Value>state1&lt;/Value>
  &lt;/Property>
  &lt;Property name="endState">
    &lt;Value>state2&lt;/Value>
  &lt;/Property>
  &lt;Property name="input">
    &lt;Value>input1&lt;/Value>
  &lt;/Property>
  &lt;Property name="actionNames">
    &lt;Value>sendmail&lt;/Value>
  &lt;/Property>
&lt;/Property>
</pre>

<p>This feature is not available in the .NET version of the component, where properties must be coded in a custom manner:</p>

<pre class="code">
&lt;Property name="transition1_startState">
    &lt;Value>state1&lt;/Value>
&lt;/Property>
&lt;Property name="transition1_endState">
  &lt;Value>state2&lt;/Value>
&lt;/Property>
&lt;Property name="transition_input">
  &lt;Value>input1&lt;/Value>
&lt;/Property>
&lt;Property name="transition_actionNames">
    &lt;Value>sendmail&lt;/Value>
&lt;/Property>
</pre>

<p>This component implements the <a href="/tc?module=Static&d1=tutorials&d2=singletons">Singleton</a> design pattern so there is no reason for you to include a ConfigManager parameter type in your method calls as a parameter. The way to obtain the only instance of this class is: ConfigManager cm = ConfigManager.GetInstance();</p>

<p>Another functionality provided by this component is its ability to preload configuration files when they are specified in @&quot;..\..\conf\preload.xml&quot; configurations file of the component, or on the file denoted by &quot;TopCoder.Util.ConfigurationManager.Preload&quot; property name in the application configuration file. Here is an example of how to fill out the configuration files to be preloaded:</p>

<pre class="code">
&lt;?xml version="1.0" encoding="UTF-8"?>

&lt;ConfigManager>
  &lt;namespace name="TopCoder.Util.ConfigurationManager">
    &lt;property name="preload">
      &lt;!mdash;
           All the values of this property represent configuration  
           files to be preloaded.
      -->
      &lt;value>..\..\test_files\test1.xml&lt;/value>
      &lt;value>..\..\test_files\test2.xml&lt;/value>
    &lt;/property>
  &lt;/namespace>
&lt;/ConfigManager>
</pre>

<p><a name="plug"></a><span class="bodySubtitle">How to plug this component into your application</span><br />
In this section, we'll focus on the necessary steps required to use this component in your application. The demo contains a build file, which can be used in order to compile and run the code. </p>

<p><strong>Add TopCoder.Util.ConfigurationManager.dll as reference for your application</strong><br />
In order to use the Configuration Manager component in your source code you need to add it as a reference library for your application. In the demo, the library is located in &quot;.\lib\tcs&quot; directory. Note that you should download at least version 2.0.1 of the component in order to have the demo and the tests run without problems.</p>

<p><strong>Configure preloaded files</strong><br />
When using this component you must remember to have either @&quot;..\..\conf\preload.xml&quot; file relative to the place where your application is executed, or the application configuration file must contain the &quot;TopCoder.Util.ConfigurationManager.Preload&quot; property, which should contain as a value the configurations file path for preloaded files of this component.</p>

<p><strong>Running the demo</strong><br />
The demo application represents a Mock Email Engine, which is supposed to send messages to addresses found in configuration. This application doesn&rsquo;t really send any mail -- its sole purpose is proving the utility of Configuration Manager.</p>

<p>Essentially, the demo application's Email Engine console displays the SMTP server through which the mock email message will be sent. The content of the Email Engine console will contain the configuration source from where the property values are read and the address:port for the SMTP server read from the configuration. You'll notice that if you change the property values in the configuration, and then restart the application, your changes will be reflected in the content of the Email Engine console.</p>

<p>Before running the demo application you should verify that you have the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.microsoft.com/downloads/details.aspx?familyid=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=en' refer='netConfigurationMgr' />">.NET Framework 2.0</a> installed on your machine. In order to run the demo you simply need unzip the <a href="/i/development/downloads/ConfigManagerTutorial_demo.zip">demo file</a> and then run the <strong>TopCoder.ConfigManagerTutorial.exe</strong> file located in the <tt>build\classes</tt> directory. </p>
If you make modifications on the source files of the demo application and you have <a target="_blank" href="<tc-webtag:linkTracking link='http://nant.sourceforge.net/' />">NAnt</a> tool installed on machine you simply need to call <strong>nant rundemo</strong> to test your changes.
<p>Good luck!</p>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
