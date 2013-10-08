<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Sponsor</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;
	mso-font-charset:2;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 268435456 0 0 -2147483648 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;
	mso-font-charset:2;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 268435456 0 0 -2147483648 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1073786111 1 0 415 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520081665 -1073717157 41 0 66047 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
p
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:"Times New Roman";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;
	mso-style-unhide:no;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Balloon Text";
	mso-ansi-font-size:8.0pt;
	mso-bidi-font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-ascii-font-family:Tahoma;
	mso-hansi-font-family:Tahoma;
	mso-bidi-font-family:Tahoma;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:10.0pt;
	line-height:115%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 @list l0
	{mso-list-id:349261940;
	mso-list-template-ids:1869413326;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1038091047;
	mso-list-template-ids:1188585664;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:1298562994;
	mso-list-template-ids:1172706928;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1542283362;
	mso-list-template-ids:-1081037380;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>

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
            <jsp:param name="node" value=""/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%" align="center">

        <div style="padding: 15px; text-align: left; width: 540px;">

<p class=MsoNormal align=center style='margin-bottom:0in;margin-bottom:.0001pt;
text-align:center;mso-line-height-alt:12.75pt'><b style='mso-bidi-font-weight:
normal'><span style='font-size:28.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black;mso-no-proof:yes'>


<img width=152 height=152
src="/i/sponsor/appirio_logo.jpg" v:shapes="Picture_x0020_1"></span></b><b><span
style='font-size:28.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
"Times New Roman";color:black'><o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-bottom:0in;margin-bottom:.0001pt;
text-align:center;mso-line-height-alt:12.75pt'><b><span style='font-size:28.0pt;
font-family:"Arial","sans-serif";mso-fareast-font-family:"Times New Roman";
color:black'>Join Us in India!<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:12.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:12.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:12.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Workday Integration
Consultant- Jaipur, India<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
normal'><b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Consulting | Jaipur,
India</span></b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>&nbsp;</span><span
style='font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:
"Times New Roman"'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
normal'><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'><br>
<br style='mso-special-character:line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]></span><span style='font-size:12.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Voted one of the best
places to work in both the Bay Area, California and in the state of Indiana, <span
class=SpellE>Appirio</span> is rapidly becoming one of the premier employers in
the Cloud Computing Industry. With offices in San Francisco, Indianapolis,
London, and Tokyo, <span class=SpellE>Appirio</span> is excited to continue its
global expansion through hiring full time positions in Jaipur, India for our
rapidly&nbsp;growing&nbsp;Workday consulting practice.&nbsp;<o:p></o:p></span></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>&nbsp;<o:p></o:p></span></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>If you're looking for an
exciting opportunity to help establish an Indian&nbsp;presence&nbsp;for one of
the fastest growing&nbsp;companies,&nbsp;in one of the fastest growing
industries, then check out our positions in Jaipur and jumpstart your career
today. &nbsp;<o:p></o:p></span></p>

<br/>
<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Duties:</span></b><span
style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
"Times New Roman";color:black'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><span class=SpellE><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Appirio</span></span><span
style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
"Times New Roman";color:black'> is focused on Workday, Salesforce.com, and
Google Enterprise customer implementations.&nbsp; Workday Integration
Consultants are responsible for&nbsp;successful deployments of various
integration products, tools, and services, as related to Workday
implementations.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Integration Consultants
must have deep knowledge of service oriented architecture design principles,
common ERP integration design patterns, in-depth knowledge of&nbsp;various
integration technologies, and will utilize skills to drive integration
deployment successes.<o:p></o:p></span></p>

<br/>
<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Specific areas of
concentration include:</span></b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'><o:p></o:p></span></p>

<ul style='margin-top:0in' type=disc>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l2 level1 lfo1;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Participate in and/or lead Workday integrations<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l2 level1 lfo1;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Consult with the functional consultant(s) and other
     technical consultants to design, build and deploy Workday to meet customer
     business needs and resolve complex integration issues<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l2 level1 lfo1;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Perform analysis and effective diagnosis of client
     issues<o:p></o:p></span></li>
</ul>

<br/>
<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Candidate Profile:</span></b><span
style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
"Times New Roman";color:black'><o:p></o:p></span></p>

<ul style='margin-top:0in' type=disc>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Enthusiastic, professional, and confident personality,
     with a focus on customer success<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Excellent listening skills to fully understand the
     customer requirements and pain points<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Ability to translate customer requirements into
     implementation plans<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Technical acumen to convert plans into real solutions
     that work<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Driven by customer success with a team player attitude<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Looking for a full-time position<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l0 level1 lfo2;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Located in Jaipur or willing to relocate there<o:p></o:p></span></li>
</ul>

<br/>
<p class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
12.75pt'><b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'>Preferred
Skills/Experience:</span></b><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
mso-fareast-font-family:"Times New Roman";color:black'><o:p></o:p></span></p>

<ul style='margin-top:0in' type=disc>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l3 level1 lfo3;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>B.S. degree in Computer Science, Software Engineering,
     MIS or equivalent<o:p></o:p></span></li>
</ul>

<ul style='margin-top:0in' type=disc>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l1 level1 lfo4;tab-stops:list .5in'><span
     class=SpellE><span style='font-size:9.0pt;font-family:"Arial","sans-serif";
     mso-fareast-font-family:"Times New Roman"'>WebLogic</span></span><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>, <span class=SpellE>WebSphere</span>, <span
     class=SpellE>WebMethods</span>, or other middleware experience preferred<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l1 level1 lfo4;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>XML, XSLT experience required<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l1 level1 lfo4;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Java, EDI, Web Services, Java, JSON, BIRT, .Net or
     other integration technologies preferred<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;margin-bottom:0in;margin-bottom:.0001pt;
     line-height:12.75pt;mso-list:l1 level1 lfo4;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Command of Service Oriented Architecture Concepts<o:p></o:p></span></li>
 <li class=MsoNormal style='color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:
     auto;line-height:12.75pt;mso-list:l1 level1 lfo4;tab-stops:list .5in'><span
     style='font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-font-family:
     "Times New Roman"'>Strong communication skills<o:p></o:p></span></li>
</ul>

<!--
<p><a href="/tc?module=JobHit&jid=534&jt=1" class="button" style="width: 70px;">Apply Now</a></p>
<p class=MsoNormal><o:p>&nbsp;</o:p></p>
-->

</div>



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