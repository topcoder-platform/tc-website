<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Component Design Finals Summary</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tco06/onsite_photos/shot_design.jpg" alt="" class="photoFrameBig" /><br>
</div>
<p>by <strong>the Design Review Board</strong><br>
<em>TopCoder Members</em><br />
Friday, May 5, 2006<br>
<br><br>
Congratulations to <tc-webtag:handle coderId="119676" darkBG="true" />, the overall Design Competition winner! See below for a summary of how the Design Competition went...
<br><br>
<b>First online finals round</b><br>
by <tc-webtag:handle coderId="13377493" darkBG="true" /><br><br>
The Relation component consists of data structures which hold objects, constraints associated with objects, and the relationship among objects. It also includes a relationally complete set of operations for manipulating those data structures, including project operation, restrict operation, union operation, difference operation, inner join operation, and outer join operation.
<br><br>
Design of the relation component is very challenging because competitors have to finish designing the component (which is like a mini-database system) within one week. The key challenge of the design is figuring out how to achieve time-efficiency and space-efficiency for the relationally complete set of operations. This component could be used in a data abstraction layer to contain data returned from SQL queries and to perform operations on that data. The data volume handled by this component could be huge. How to perform nested inner/outer join while achieving both time and space efficiency will definitely be the focus of the design. In addition, as we all know, handling null value in datebase system design is a tricky task, especially when outer join is involved. How to handle null value is another important design decision competitors have to make.
<br><br>
<b>Second online finals round</b><br>
by <tc-webtag:handle coderId="277356" darkBG="true" /><br><br>
The XSD2DDL component is a kind of transformer from XSD format to DDL. These formats are quite different, so the design for this component needs to be quite complex to meet all the requirements.
<br><br>
XSD2DDL was the most interesting component among final online components from the design point of view. There are different ways to implement this component and none of them is wrong -- event driven model, MVC model and even template-based approach -- and each method has its own strong parts.
<br><br>
The most difficult task was to create a really extensible framework which would allow the easy addition of various RDBMS DDL syntaxes. It was important to have the ability to reuse existing DDL transformation and implement only DDL syntax differences without rewriting the same parts (otherwise it would not be 'easily added database.') 
<br><br>
To meet this requirement contestants had to separate XSD parsing logic and DDL generation as well as separting of various aspects of DDL generation -- table, column and constraint generation. Some solutions separated even different constraint types to allow changes to only some of them (like regexp constraint), but reuse other ones (like unique constraint syntax which is the same for most RDBMS).
<br><br>
Another challenging task was allowing support for new features like 'Table comments.' Contestants had to create extensible data structure representing transformed data and define interfaces to generate the appropriate DDL for added data. From the other side, the design needed to avoid becoming overcomplicated with complex API, or else users would not know how to accomplish the required tasks. Only the designer who was able to found the golden mean will win this exciting online round!
<br><br>
Third online finals round</b><br>
by <tc-webtag:handle coderId="286907" darkBG="true" /><br><br>
The DataView Decorator/Result Set Collection Decorator components require a read-only decoration of the underlying result set, which can be customized with extra data and behaviors. This seemingly compact design isn’t easy at all.
<br><br>
First, the decoration needs to be tailored with a hierarchy of entities, including the collection, the iterator, the result row and the metadata. Care should be executed to make these entities work consistently with the add-ons; and at the same time the solution should still take up some performance concerns. Second, the component needs to accommodate pluggable behaviors. It’s crucial that the behavior definition be powerful while easy to program against. Last, but not the least, is that the component should provide a clean API to work with data and behaviors associated on different levels. A solution satisfying these criteria is very likely to earn a decent score from the review board.
<br><br>
First onsite finals round</b><br>
by <tc-webtag:handle coderId="13377493" darkBG="true" /><br><br>
<br><br>
The appeals phase lasted 2 hours. In total, there were 135 appeals received, with almost half of them (67) accepted. Reviewers were overwhelmed by the large amount of appeals from competitors. Some appeals targeted mistakes made by the reviewers, while others brought up different interpretations of review guidelines. The appeal phase went smoothly. The result after appeal phase nearly remained the same as before appeal phase. <tc-webtag:handle coderId="293874" darkBG="true" /> won the relation component design with a final score 94.52.
<br><br>
Second onsite finals round</b><br>
by <tc-webtag:handle coderId="277356" darkBG="true" /><br><br>
As usual, the appeal phase contained two main types -- appeals about structural design issues (API, scope, extensibility) and apeals about presentation/documentation issues (algorithm description, poseidon documentation, demo).
<br><br>
Many appeals focused on the 'extensibility' section, where some designs were penalized for the issues described above - the designs don't allow the re-use of existing DDL elements for other RDBMS. They mostly were rejected because this extensibility feature is critical. 
<br><br>
Third onsite finals round</b><br>
by <tc-webtag:handle coderId="286907" darkBG="true" /><br><br>
<br><br>
The onsite appeal phase got pretty intense and the review board was flooded with a total of 166 appeals, of which about 50 percent are successful. However the original ranks were not affected too much by the intensity. <tc-webtag:handle coderId="119676" darkBG="true" /> secured first place via 12 successful appeals out of 16 -- an amazingly high success rate of 75%. On the other hand a few of the competitors submitted around 25 appeals each. Overall the submitters obtained an average raise of more than 7 points on each scorecard, which is probably going to be a new TCO record.
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
