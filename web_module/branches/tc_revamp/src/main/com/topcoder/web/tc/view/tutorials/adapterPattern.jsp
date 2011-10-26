<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp" />
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

<div style="float: right;"><tc-webtag:forumLink forumID="505904" message="Discuss this article" /></div>
<span class="bodyTitle">Adapter Pattern</span>

<p>
<img src="/i/m/Pops_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="119676" context="design"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<p>
<span class="bodySubtitle">Description</span><br>
"Convert the interface of a class into another interface clients expect." [GoF]  In other words, you define an API to use locally and then create implementations of that API that will convert the calls to another class's API.  The main benefit of the adapter pattern is that it allows you to use classes that were not originally designed for your purposes.   Please note that I use the wording "API" rather than "interface" (as GoF does) since the adapter pattern does not depend on an actual interface implementation (as used in Java/C#).  What GoF meant by 'interface' is the method signatures that make up the interactions with some class (ie it's programming interface).  
<br><br>

<span class="bodySubtitle">When and when not to use</span><br>
The adapter pattern is commonly used in applications where some package or third party application is being replaced with some other package.  Rather than rewrite the application to use the new package's API, it's commonly less expensive to write an adapter to simply adapt the old API to the newer API.  The application will simply call the old API via the adapter and the adapter will then manage the calls to the new package.
<br><br>
The adapter pattern is common in component design/development also.  However, the focus in component development is in integrating other components into the overall design, usually the adapter is simply another implementation to some strategy pattern that offers the adapting class's capabilities to the pattern.  The designer will spot functionality in a different component that they view as useful for this component.  The designer can then create an adapter to adapt that functionality to what the component expects.  This allows the designer to quickly reuse other components in a design without having to ask for modifications to the other component or having to explicitly support the other component's API.  
<br><br>
An adapter pattern should not be used when the component categorically depends on the functionality of the other class.   In other words, if the other component provides functionality that is critical to the component and cannot be replaced, then the component should call the API directly and not bother with an adapter class between them.
<br><br>

<span class="bodySubtitle">Considerations</span><br>
The biggest consideration when using the adapter pattern is in identifying the pattern appropriately.  The adapter pattern is very similar to the bridge, decorator and proxy patterns.  Each of these patterns has similar features to the adapter pattern &ndash; the difference is in the intent of the pattern.  The intent of the adapter pattern is to simply convert a local interface to another class's interface.  The other patterns intent is much different.  The bridging pattern intent is to allow two implementations to vary independently.  The decorator pattern's intent is to enhance another class and the proxy pattern intent is to be a placeholder for the other class.  The intent of the class is what determines if the class is an adapter or not.
<br><br>
Another consideration is when the adapting class is no longer an adapting class but a complex or composite class.  Adapter classes can range from simple, one to one translation, to complex translation functionality.  The complexity of the adapter class largely depends on how similar the two APIs are to each other.  However, as more functionality and state information is added to an adapter class, the less like an adapter it is and the more like a complex class (that happens to use the other API as part of it's operations) it becomes.  Like the first consideration, it all comes back to intent of the class.  If the complexity is due solely to enable API-to-API translation, then the class can still be counted as an adapter.  However, if the complexity starts to add functionality beyond the other's API, the more like a complex class the adapter becomes.  
<br><br>
Lastly, an adapter class should only adapt a single API.  From the wording in GoF &ndash; "Convert the interface of a class&#8230;."  If the adapter translates some of the API to one class's API and the rest of the API to a different class's API, the class is more like a composite class than an adapter class.  This doesn't mean that you can't use more than one class in the translation process.  What it means is that the source of the API should come for a specific class API.
<br><br>

<span class="bodySubtitle">Implementation details</span><br>
The adapter pattern is very easy to implement.  Simply identify the interface that your component will deal with and then identify the component's API that you want to use.  Create a simple class (generally called "xxxAdapter") that implements your interface and executes the other API.  Please note that it is reversed if you are providing an adapter to another component.
<br><br>
<span class="bodySubtitle">Adapter as a Subclass</span><br>
An adapter pattern can be implemented as a subclass to the class you wish to adapt.  The subclass would then implement your own API and translate to the API of the super class.  The approach presents several issues:
<ol>
<li>The adapter class is tied directly to the underlying class via inheritance.  This creates a hard association between the components that must be considered when either component changes and is simply not possible if the adapter class needs to subclass a different tree.</li>
<li>The adapter class only works with the underlying class and can't use any subclasses or alternative implementations of the underlying class.  In other words, the approach limits you to specifically what the underlying class has to offer.  If the underlying class is later decorated or subclassed with additional functionality, the adapter class will not be able to use that functionality since it's tied to a specific class structure.</li>
</ol>
There are no examples in the TopCoder Software catalog of this type of implementation (at least that I could find).  However, I believe the implementation description above is simple enough to understand without an example.  Please feel free to post a message in the forum related to this article if you'd like to discuss implementation details.
<br><br>

<span class="bodySubtitle">Adapter as an Interface</span><br>
The adapter pattern is generally implemented as part of a strategy pattern.   In fact, the best benefit comes when the adapting class is utilizing the strategy pattern on both sides.  Combining the strategy pattern with the adapter pattern results in a powerful combination that:
<ul>
<li>Allows the application to decide if it will use the Adapter and which Adapter implementation to use.</li>
<li>Allows the application to decide the actual implementation the Adapter is converting to.</li>
</ul>
To implement an adapter as an interface, create a class that implements some local interface with a variable whose type is the other interface we are adapting to.  The constructor of the adapter class will then take an instance of the other interface and store it into that instance field.  Calls to the local interface can then call the other interfaces methods without regard to the actual implementation of the other interface.
<br><br>
Let's take a look at an example &ndash; the .NET Password Validator component.  The Password Validator component provides a centralized location to store enterprise password rules sets.  A rule set provides a number of validation rules that implement the IRule interface (see Figure 1 below).  This component provides a number of prebuilt rules for some of the most common password validations (such as minimum length, expiration time, common words, etc).  Customers can provide their own implementations to the IRule interface to customize the component to their own local password validations.  The designer realized that the customer may already have a number of pre-existing validations built with the .NET Data Validation component and may want to utilize those validations within the password validation component.   An adapter class was created to adapt the IRule interface of the .NET Password Validator component to the IValidator interface of the .NET Data Validation component.
<br><br>
As you see in Figure 1 below, the designer created an adapter class called DataValidationAdapterRule that implements the IRule interface.  The adapter class's constructor takes an instance of the IValidator interface (either directly or through a configuration option) and stores it to an instance variable.  When calls are made to the Validate method of IRule interface, the class 'converts' those calls to the IsValid method of the IValidator interface.  This allows the component to utilize the functionality in another component that wasn't specifically designed for this component.
<br><br>
<div align=center><b>Figure 1</b><br><br>
<A href="/i/education/adapter1_lg.gif"><img src="/i/education/adapter1.gif" alt="Figure 1" border="0" /></A></div>
<br><br>
<span class="bodySubtitle">Bibliography</span><br>

[GoF] Gamma, Helm, Johnson, Vlissides.  Adapter Pattern.  Design Patterns &ndash; Elements of Reusable Object-Oriented Software, 1995.


        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
