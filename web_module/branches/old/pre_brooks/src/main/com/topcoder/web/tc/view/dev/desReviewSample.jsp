<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD><TITLE>Aspect-Oriented Programming Factory Design Review Scorecard</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Expires content=-1>
<link type="text/css" rel="stylesheet" href="http://software.topcoder.com/includes/tcs_style.css"/>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY class=body marginheight="0" marginwidth="0"><!--Header begins --><!--Header begins-->
<TABLE class=middle cellSpacing=0 cellPadding=0 width="100%" align=center 
border=0>
  <TBODY>
  <TR vAlign=top><!-- Gutter 1 begins -->
    <TD width=15><IMG height=10 alt="" 
      src="/i/clear.gif" 
      width=15 border=0> </TD><!-- Gutter 1 ends --><!-- Middle Column begins -->
    <TD width="100%">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
          <TD class=normal><IMG height=20 alt="" 
            src="/i/clear.gif" 
            border=0> </TD></TR></TBODY></TABLE><!-- Tabs -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
          <TD class=forumHeadFoot colSpan=3><IMG height=7 alt="" 
            src="/i/clear.gif" 
            width=10 border=0> </TD></TR></TBODY></TABLE><!-- Content begins -->
      <SCRIPT>
    function set(form, what, qIdx, rIdx) {
        form.action.value = what;
        form.questionIndex.value = qIdx;
        form.responseIndex.value = rIdx;
    }
</SCRIPT>
<!-- Start Title -->
      <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
        border=0><FORM name=reviewScorecardForm 
        action=/review/saveReviewScorecard.do method=post><INPUT type=hidden 
        value=8346810 name=id> <INPUT type=hidden value=296145 name=rid> <INPUT 
        type=hidden value=119676 name=sid> <INPUT type=hidden value=admin 
        name=action> <INPUT type=hidden value=-1 name=questionIndex> <INPUT 
        type=hidden value=-1 name=responseIndex> 
        <TBODY>
        <TR>
          <TD class=whiteBkgnd>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=left width="5%"><IMG height=62 alt="" src="http://software.topcoder.com/images/icon_design.gif" 
                  width=66> </TD>
                <TD class=tableHeader noWrap width="45%"><STRONG>TCO - 
                  Aspect-Oriented Programming Factory</STRONG> version 1.0</TD>
                <TD class=breadcrumb vAlign=bottom align=right 
              width="50%"></TD></TR>
              <TR>
                <TD class=whiteBkgnd colSpan=3><IMG height=1 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            border=0>
              <TBODY>
              <TR>
                <TD class=blackBkgnd colSpan=2>Design Review Scorecard - 
                Pops</TD></TR>
              <TR>
                <TD class=forumTextOdd colSpan=2>For the Design Checklist, 
                  mark each deliverable as Yes, it exists; No, it does not 
                  exist; N/A, this deliverable was not required. For the Design 
                  Review, provide a score for each statement according to the 
                  dropdown answers.</TD></TR></TBODY></TABLE><!-- Start Text -->
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Component Design</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Component 
                  Design</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The design addresses the 
                  functionality as detailed in the Requirements 
                  Specification.</P>
                  <P class=scorecardQuestion>Where applicable, list the missing 
                  elements below.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[0].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree" >2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The design effectively uses all 
                  required technologies (language, required components, 
                  etc.).</P>
                  <P class=scorecardQuestion>If technologies are not used 
                  correctly, explain why.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[1].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[1].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The design incorporates standard 
                  design patterns and methodologies where applicable (i.e. 
                  Model-View-Controller, Factory Pattern, Object Oriented design 
                  principles, follows J2EE specs).</P>
                  <P class=scorecardQuestion>If patterns should be applied to 
                  the design, explain below.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[2].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree" >3 - 
                    Agree</OPTION> <OPTION value="4 - Strongly Agree" selected>4 - 
                    Strongly Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[2].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The design effectively uses 
                  components from the TopCoder</P>
                  <P class=scorecardQuestion>For example, a component that 
                  requires logging should make use of the TopCoder</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[3].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[3].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The design accounts for 
                  incorporating additional functionality and features beyond the 
                  initial intended usage.</P>
                  <P class=scorecardQuestion>This includes being able to extend 
                  the functionality without needing to change the core design. 
                  Are there any assumptions that prevent extension?</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[4].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[4].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Class Diagram</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Class 
                  Definition</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The class diagram(s) accurately and 
                  thoroughly depicts the required elements of this 
                component.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[5].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>

              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[5].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>This is a suitable design given the 
                  expected component usage and throughput requirements.</P>
                  <P class=scorecardQuestion>(i.e.e Singleton pattern, Object 
                  Factory, Frameworks, does not violate technical specs (EJB 
                  2.0))</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[6].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[6].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The Class documentation in the 
                  'Documentation' tab of Poseidon provides a detailed 
                  description of intended class usage.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[7].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[7].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Variable 
                  Definition</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Variable types are suitable for the 
                  expected component usage.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[8].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[8].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The variable documentation in the 
                  'Documentation' tab of Poseidon provides detailed descriptions 
                  of variable type, scope, initial value and intended 
                usage.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[9].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[9].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
</TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Method 
                  Definition</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The defined methods properly expose 
                  the API requirements defined in the Requirements 
                  Specification.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[10].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[10].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Methods provide access to and 
                  properly encapsulate the defined variables.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[11].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[11].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The Exceptions defined is an 
                  inclusive list of the anticipated exceptions.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[12].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[12].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The method documentation in the 
                  'Documentation' tab of Poseidon provides detailed descriptions 
                  of method arguments, return type, scope, exceptions and 
                  intended usage.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[13].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[13].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The method documentation in the 
                  'Documentation' tab of Poseidon provides detailed valid and 
                  invalid argument values to facilitate test case 
                creation.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[14].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[14].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle 
                width="90%"><STRONG>Relationships</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Class relationships are well 
                  defined.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[15].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[15].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Other Diagrams</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Use-Case 
                  Diagram(s)</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Contain use cases that accurately 
                  depict the defined functional usage of the component.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[16].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[16].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>All public methods are represented 
                  in the use cases.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[17].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree" >3 - 
                    Agree</OPTION> <OPTION value="4 - Strongly Agree" selected>4 - 
                    Strongly Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[17].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required selected>Required</OPTION> <OPTION 
                          value=Comment>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Sequence 
                  Diagram(s)</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Thoroughly depicts the ordered 
                  interaction between classes.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[18].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[18].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Sequence diagrams exist for each 
                  implementation of a use case</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[19].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[19].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Miscellaneous</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Component 
                  Specification</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The Component Specification 
                  provides sufficient information for this design to be 
                  implemented.</P>
                  <P class=scorecardQuestion>List any missing elements or 
                  outstanding questions.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[20].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[20].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Contains a comprehensive outline of 
                  the required Benchmark data and Stress tests.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[21].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[21].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Exception/Error 
                  Handling</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Exceptions are clearly defined and 
                  well documented in either the Component Specification or the 
                  .zargo file.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[22].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[22].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The design clearly defines how 
                  invalid arguments (including null arguments) are to be 
                  handled.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[23].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[23].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Overall 
                  Comments</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Overall, this is a quality design 
                  that meets all requirements.</P>
                  <P class=scorecardQuestion>Please detail any additional 
                  comments regarding the component design.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[24].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>
              <TR>
                <TD colSpan=2>
                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0 
                  width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=forumTextOdd noWrap 
                        width="15%"><STRONG>Response 1:</STRONG></TD>
                      <TD class=forumTextOdd width="60%"></TD>
                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp; 
                        <SELECT 
                          name=questions[24].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- spacer  -->
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(1).gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE></TD></TR><!-- Bottom Buttons -->
        <TR>
          <TD class=lightBkgnd align=middle>
            <TABLE cellSpacing=4 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE></TD></TR></FORM></TBODY></TABLE><!-- Content ends-->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD height=15><IMG height=15 alt="" 
            src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(2).gif" 
            width=10 border=0> </TD></TR></TBODY></TABLE></TD><!--Middle Column ends --><!-- Gutter 2 begins -->
    <TD width=15><IMG height=10 alt="" 
      src="D:\webpages\Aspect-Oriented Programming Factory Design Review Scorecard_files\clear(2).gif" 
      width=15 border=0> 
</TD><!-- Gutter 2 ends --></TR></TBODY></TABLE></BODY></HTML>