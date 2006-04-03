<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

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
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>


<div align="center">
<p><span class="bodyTitle">NVIDIA Corporation Returns as Premier Sponsor of 2005 TopCoder&#174; Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>Worldwide Leader in Graphics and Digital Media Processors Continues Partnership with International Championship of Programming for College Students</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, February 16, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced NVIDIA Corporation (Nasdaq: NVDA), a worldwide leader in graphics and digital media processors, as Premier sponsor of its 2005 TopCoder Collegiate Challenge (TCCC 05).  This will be the 3rd consecutive Collegiate Challenge sponsored by NVIDIA, which was among the first companies to partner with TopCoder and its powerful community of programmers. The TCCC 05 will bring many of the world's finest student programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at: http://www.topcoder.com/tccc05.
<br /><br />
"NVIDIA recognizes that it takes amazing people to build great products," said Ben de Waal, VP of GPU Software, NVIDIA Corporation. "We are excited to return as Premier Sponsor of the TopCoder Collegiate Challenge and to interact with some of the sharpest developers in the world." 
<br /><br />
What began as an initial round with more than 1,300 coders jockeying for programming position, will culminate in an exciting face-to-face "code off" between 24 Algorithm and 8 Component competitors at the Santa Clara Marriott on March 10th and 11th, 2005.  
<br /><br />
"NVIDIA is a true technology visionary committed to advancing the state of the digital gaming and graphics industry to as yet only dreamed of levels," said Rob Hughes, president of TopCoder. "By participating in the TopCoder Collegiate Challenge, NVIDIA is able to interface with the software developers who will engineer the future." 
<br /><br />
<span class="bodySubtitle">About NVIDIA</span><br />
NVIDIA Corporation is a worldwide leader in graphics and digital media processors. The Company's products enhance the end-user experience on consumer and professional computing devices. NVIDIA graphics processing units (GPUs), media and communications processors (MCPs), and wireless media processors (WMPs) have broad market reach and are incorporated into a variety of platforms, including consumer and enterprise PCs, notebooks, workstations, PDAs, mobile phones, and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 2,000 people worldwide. For more information, visit the Company's Web site at www.nvidia.com.
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br /><br />
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries.
</p>
<p>###</p>



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
