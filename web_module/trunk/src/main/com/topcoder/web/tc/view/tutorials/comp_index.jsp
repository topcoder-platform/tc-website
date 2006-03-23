<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>

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

         <div class="tutorBody">

        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="comp_tut"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

         <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign="top">
               <td class="bodyText"><b>Author</b></td>
               <td class="bodyText" width="100%"><b>Title</b></td>
               <td class="bodyText" align="center"><b>Date</b></td>
            </tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="152342" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=dev&d2=support&d3=desTutorial"><strong>Design Tutorial</strong></a></td>
               <td class="bodyText">12.17.2004</td>
            </tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="251989" context="development"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial"><strong>Development Tutorial</strong></a></td>
               <td class="bodyText">08.12.2004</td>
            </td></tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="296145" context="development"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=comp_dev_tc_style"><strong>Component-Based Development: TopCoder Style</strong></a></td>
               <td class="bodyText">03.17.2003</td>
            </tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><strong>The Design Process:</strong><br>
               &#160;-&#160;<a href="/tc?module=Static&d1=features&d2=040405"><strong>Section 1: some advice</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&d1=features&d2=041105"><strong>Section 2: appeals phase don'ts</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&d1=features&d2=041905"><strong>Section 3: appeals phase do's</strong></a><br>
               &#160;-&#160;<a href="/tc?module=Static&d1=features&d2=042505"><strong>Section 4: the wrap up</strong></a><br></td>
               <td class="bodyText">03.30.2005</td>
            </tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=singletons"><strong>The Singleton Pattern</strong></a></td>
               <td class="bodyText">07.06.2005</td>
            </tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=strategyPattern"><strong>The Strategy Pattern</strong></a></td>
               <td class="bodyText">08.16.2005</td>
            </tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=decoratorPattern"><strong>The Decorator Pattern</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=wavefrontPattern"><strong>Parallel Patterns: WaveFront Pattern</strong></a>
            </td></tr>
            <tr valign=top><td class="bodyText">
               <tc-webtag:handle coderId="119676" context="design"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=adapterPattern"><strong>Adapter Pattern</strong></a>
            </td></tr>
            <tr valign="top"><td class="bodyText">
               <tc-webtag:handle coderId="15664457" context="development"/>
               </td><td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=tutorials&d2=xmiDocumenter"><strong>Using XMI Documenter</strong></a></td>
               <td class="bodyText">03.23.2006</td>
            </tr>
         </table>
        </div>
        <p><br></p>
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
