<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotDevelopment.jpg" alt="" class="photoFrameBig" /><br>
</div>

<span class="bigTitle">PE is the new Component Development Champion</span>
<br><br>

by <strong>the Development Review Board</strong><br>
<em>TopCoder Members</em>
<br><br>

<tc-webtag:handle coderId="9998760" context="development"/> is the winner of the 2006 TopCoder Collegiate Challenge Component Development competition and the $15,000 top prize. <tc-webtag:handle coderId="14788013" context="development"/> gave a strong performance in second place, and <tc-webtag:handle coderId="302810" context="development"/> came in third. Congratulations to all the finalists, and particularly <tc-webtag:handle coderId="9998760" context="development"/>!
<br><br>

<strong>Friday, November 17, 2006</strong><br>
<strong>Round 3: Client Logic for Firefox</strong><br>
by <tc-webtag:handle coderId="299979" context="development"/>
<br><br>
Client Logic for Firefox is a custom component. It provides the functionality to cooperate with the Orpheus game servers. The main idea for this component is to provide a set of helper methods, instead of the whole client logic of the Orpheus games. The helper methods can communicate with the Orpheus game servers, create pop up windows according to the content retrieved from the servers, and perform other common tasks such as logging in and logging out. When an event happens, it also can notify a set of event listeners to perform additional processes. The component is essentially installed as a Firefox extension (XUL file). There is a similar component acting as a plugin to Microsoft Internet Explorer as well. However, due to the fact that the design of the MSIE plugin is much more complex than the design of the Firefox plugin (24 classes versus 9 classes), all finalists chose this project.
<br><br>
The major challenges come from the technologies used in this component. The algorithm used in this component is rather simple and straightforward. There are two technologies used in this component, namely LiveConnect and Cookies. LiveConnect is relatively new to the developers. It is designed to communicate between the Javascript and the Java applet in the web pages. When Javascript wants to access the objects in the Java applet, it can use <i>document.getElementById(<appletId>)</i> to retrieve the instance of the applet, and access the fields and methods directly. When the Java applet wants to access the objects in Javascript, it must use <i>netscape.javascript.JSObject</i> as the proxy. The <i>JSObject</i> class provides methods like <i>call</i>, <i>getMember</i>, <i>setMember</i>, etc. Cookies are relatively familiar, since we hear and use them very often. In this component, cookies are used as the persistence in the client side, since they can be accessed via Javascript ‘<i>document.cookie</i>’.
<br><br>
Doing research on unfamiliar technologies can definitely be time-consuming. Since there are two major technologies used in this component, and many defects exist in the design, I expected some finalists to misuse them. To my surprise, all finalists failed to use these two technologies correctly.
<br><br>
Two common errors can be observed in all the submissions, as well as in the design. For LiveConnect, the designer and all finalists thought <i>getMember(‘document.cookie’)</i> and <i>setMember(‘document.cookie’,cookie)</i> would work as expected. However, they can only access a member/method of the <i>JSObject</i> itself, not a member/method of a member. Therefore, the mentioned statements should be written as <i>getMember(‘document’).getMember(‘cookie’)</i> and <i>getMember(‘document’).setMember(‘cookie’, cookie)</i>. 
<br><br>
For cookies, the designer and all finalists used <i>document.cookie</i> as a normal string read-write property. Actually, it does not act like a normal string property. When setting the cookie, it can only accept one key/value pair (including the expiry time, path, etc) at a time. Any additional key/value pairs would be ignored. When getting the cookie, it returns all accessible cookies, excluding the expiry time, path, and other information. These design flaws cannot be found if there is no test case against real <i>JSObject</i> and Java applets.
<br><br>
Speaking of test cases, the finalists found that they were trapped by the LiveConnect technology. In normal JUnit test cases, there is no way to create a valid Java applet with a Javascript support environment. Thus, a real <i>JSObject</i> cannot be easily obtained. Some finalists gave up, providing no meaningful test cases for the key functionality of the component, which resulted in a very low score. Other finalists provide mocked <i>JSObject</i> classes, instead of the real <i>JSObject</i> instances. It is better than no test case, but this testing strategy does not detect the misuse of LiveConnect and cookies. 
<br><br>
When I wrote test cases, I was facing the same situation. As an accuracy reviewer, it is very important to make sure that the component works as expected in the design and requirement. Therefore, before writing the accuracy test cases, I always spend several hours implementing the component by myself with no documentations and test cases (it is known that I am a fast developer). As soon as the implementation is finished, I realized the key issue here would be how to obtain a valid <i>JSObject</i> instance. Usually, one can be obtained via <i>JSObject.getWindow(Applet)</i>. If a valid Java applet can be created, I can have a real <i>JSObject</i> instance. However, there is no existing JUnit test runner based on applets. Therefore, I decided to write my own applet test runner. The rest would be rather straightforward, since I can test the component against a real <i>JSObject</i>. With this testing strategy, the LiveConnect and cookies misuse can be observed.
<br><br>

<strong>Thursday, November 16, 2006</strong><br>
<strong>Round 2: XMI Reader</strong><br> 
by <tc-webtag:handle coderId="20076717" context="development"/>
<br><br>
TopCoder is building its own UML tool that -- like Poseidon -- is based on <a href="http://en.wikipedia.org/wiki/XMI" target="_blank">XMI standards</a>. The XMIReader component is used to read and parse XMI files. This component only reads the file and parses it as a standard XML file, while providing a framework for handling each element type. To reduce the memory usage, the component uses SAX instead of DOM.
<br><br>
Compared with the other UML components, this one is much easier. It registers handlers for element types and uses them to parse the corresponding XMI elements. However, the handlers are not in the scope of this component, there are only two classes to implement and the logic is straightforward, so it should be relatively easy. 
<br><br>
One note, though: Of the two versions, the .NET version includes one potential trap. The .NET version of the component must process an empty element as if it were the end of an element. If not, the component will encounter an infinite loop. To ensure that this works, the developers should test their submissions against a real XMI file (like the one in the docs directory). 
<br><br>

<strong>Wednesday, November 15, 2006</strong><br>
<strong>Round 1: Rename Package Ant Task / Rename Namespace NAnt Task</strong><br>
by <tc-webtag:handle coderId="297731" context="development"/>
<br><br>
The Rename package Ant task and Rename namespace NAnt task components were about building functionality to enable source code to be modified automatically while still remaining consistent with the original intent. 
<br><br>
Their design called for the utilization of regular expressions; this presented a challenge to the developers as they tried to improve upon the specified algorithms. Additionally, concurrency issues in the file manipulation operations contributed to making the development a non-trivial affair.
<br><br>
Interesting testing scenarios were used by the developers as they tried to bridge the packages being extended (Ant / NAnt) and the code they wrote.
<br><br>
As usual, the performance of the end product was an important consideration and the approach used by some of the developers added to their submissions having an edge over the others.
<br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
