<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="../script.jsp" />
<style type="text/css">
    .code
{
	width: 500;
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="comp_tutorials"/>
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

<div style="float: right;"><tc-webtag:forumLink forumID="505849" message="Discuss this article" /></div>
<span class="bodyTitle">The Design Process - Section 1: some advice...</span>

<p>
<img src="/i/m/Pops_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<a class="bodyText" href="/tc?module=MemberProfile&cr=119676"><strong>Pops</strong></a><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<a name="introduction"></a>
<span class=bodySubtitle>Introduction</span><br/>
The design competition has started to heat up recently and has been attracting a lot of new designers.  I thought this would be an ideal time to provide some advice about the TCS design process.  This four-part series will attempt to provide some constructive advice about the different phases in the design process.  This article will not attempt to provide you with strategies or to provide a design tutorial, it will simply describe how to make the most of each of the phases and provide some useful do's and dont's that my experience as both a designer and reviewer has seen.
<br><br>
<span class=bodySubtitle>First Timers</span><br/>
The best advice I can give first time designers - expect to fail the first 1-3 project(s).  That is not a comment about a lack of skill sets or motivation but on the learning curve to the TCS process.  The reviewers have a base of experience they work from and expect certain 'things' in designs.  The first few projects will usually be focused on learning how the process works and what the reviewers expect in the submitted designs.  My advice to you is to carefully review all the posted <A href="/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">documentation</A> and keep the documents in mind while designing.  Of those documents, you should be thoroughly familiar with the reviewer guideline documents and the coloring standards.  Both of those are good insights into precisely what the reviewer will be looking for and will certainly reduce the number of 'failed' submission due to not understanding exactly what is expected.
<br><br>
<span class=bodySubtitle>Selecting a Component</span><br/>
There are usually about five design components posted each week with a fairly good split between java and C# (however, C# seems to be more favored).  You should read the specifications for each of them and generally choose one that you are familiar with (both the language and the concepts).  Do not sign up for the component immediately.  If you sign up for the component and later find out that the specification has a 'surprise' in it (surprise meaning some unexpected functionality or complication), your reliability rating will be affected if you don't complete it (see the <A href="/tc?module=Static&d1=dev&d2=support&d3=reliability">reliability rating details</A>).  Instead, use the time to refine your understanding of the specification by asking questions in the related forum.  The questions you ask should clarify your understanding of the specification and 'challenge' the PM if the specification is either in error or lacks some crucial point.  You should sign up for the component only after you fully understand the component and the full extent of work involved.
<br><br>
<span class=bodySubtitle>Designing to Submission</span><br/>
There are really three methods designers use for creating their designs.  
<ul>
<li><b>Sketching</b><br/>
The most common is to sketch out your design ideas on a pad of paper.  This allows you to quickly understand where some of the issues lay and solve them without a lot of effort.  When you are fairly confident of the design's foundations, you recreate it in Poseidon and finish off the details.  This method is very effective for the more complex designs and allows you to move fairly quickly given that the foundation is good.  Unfortunately, the weakness of this method is in the details.  Sometimes a critical flaw is found while doing the detail work that will force the designer to patch the design.  This patching is generally fairly obvious because the patch doesn't integrate into the design very well.  I personally prefer this method for most designs (believe it or not - I usually use the back of an envelope to sketch out my ideas).</li>
<li><b>Adhoc</b><br/>
"Full speed ahead captain" pretty well describes this method.  The method is really an iterative approach to designing.  The designer just sits down and lets the design emerge through constant revisions as problems occur or ideas are introduced.  This method has the potential to reduce the overall time spent and is very effective when the design is fairly straightforward.  This method also has a fairly high chance of creating a design that is not clear in its goal or has a less than obvious approach.  Likewise, if you start out with a foundation that is flawed, the revisions will take a lot more time.  I use this strategy in most of the smaller designs where the size is 5 to 7 classes big.  I will generally lay out the design in my head after taking some time to consider it and then bring up Poseidon to see where the design takes me.</li>
<li><b>Prototyping</b><br/>
The last method is to prototype the design with code.  Essentially, you bring up your favorite IDE and write the interface code with documentation.  Once you are satisfied, you import it into Poseidon and fix it up.  This method is good for those developers who are moving into the design phase because they do something they are familiar with.  Likewise, this method gives you a good 'developer' perspective (where you pay a bit more attention to the signatures and the eventual code that will be developed from it).  The downside to this is in the considerable work you need to do in Poseidon to 'fix' the design.  You need to correct import errors, fix up the documentation and assign the relationships correctly - something I've never seen done with full success in the components I have reviewed.  The reason is that by working on the code (rather than the design), you usually forget about certain associations or details that cannot be shown in code but need to be shown in the design diagrams.  I personally don't like this method.  I feel that it puts the designer too close to the code and they miss the overall design goals (seeing the trees but not the forest).</li>
</ul>
<div class="sideNote"><b>Sidenote: Dummy Submissions</b><br/>
The submission deadline is looming and you won't be able to submit in time - what will you do?  Unless you have made a reasonable attempt, don't bother to submit.  Reliability rating is only positively affected if you pass the screening phase.  By submitting a dummy or incomplete submission, all you do is waste everyone's time since the submission certainly won't pass screening.  Let me reiterate, submitting a dummy submission has absolutely no benefits - don't do it.
</div>
<span class=bodySubtitle>Forums again</span><br/>
The last advice that I'd like to give is to encourage you to use the forums throughout the design process.  I really feel that most designers fail here.  Questions about the specification will naturally arise as you are concentrating on the details.  Be sure to ask those questions to get the official PM response.  If you do not and simply make an assumption about some point, that assumption (whether right or wrong) will generally appear in the review.  Had the designer asked the PM about the issue during the design, then the issue would not arise in the review or if it did, the designer has recourse in pointing out the forum message to the reviewer.
<br><br>
<span class=bodySubtitle>What's coming up…</span><br/>
Over the next two weeks we'll start exploring the appeals phase by pointing out some of the common ways designers appeal decisions (both the good and the bad ways).  We'll then wrap up the series by explaining the final fixes phase and what lessons you should take away from the whole experience.
<br/><br/>
<A href="/tc?module=Static&d1=features&d2=041105">...continue to Section 2</A>

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
