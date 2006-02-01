<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD><TITLE>Aspect-Oriented Programming Factory Design Review Scorecard</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Expires content=-1>
<link type="text/css" rel="stylesheet" href="http://software.topcoder.com/includes/tcs_style.css"/>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY class=body marginwidth="0" marginheight="0">
<TABLE class=middle cellSpacing=0 cellPadding=0 width="100%" align=center 
border=0>
  <TBODY>
  <TR vAlign=top><!-- Gutter 1 begins -->
    <TD width=15><IMG height=10 alt="" src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif"  width=15 border=0> </TD><!-- Gutter 1 ends --><!-- Middle Column begins -->
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
          <TD class=forumHeadFoot colSpan=3><IMG height=7 alt=""src="/i/clear.gif" 
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
        value=8346976 name=id> <INPUT type=hidden value=290448 name=rid> <INPUT 
        type=hidden value=277356 name=sid> <INPUT type=hidden value=admin 
        name=action> <INPUT type=hidden value=-1 name=questionIndex> <INPUT 
        type=hidden value=-1 name=responseIndex> 
        <TBODY>
        <TR>
          <TD class=whiteBkgnd>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=left width="5%"><IMG height=62 alt="" src="http://software.topcoder.com/images/icon_development.gif" 
                  width=66> </TD>
                <TD class=tableHeader noWrap width="45%"><STRONG>TCO - 
                  Distributed Simple Cache</STRONG> version 1.0</TD>
                <TD class=breadcrumb vAlign=bottom align=right 
              width="50%"></TD></TR>
              <TR>
                <TD class=whiteBkgnd colSpan=3><IMG height=1 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            border=0>
              <TBODY>
              <TR>
                <TD class=blackBkgnd colSpan=2>Development Review Scorecard - 
                  aksonov</TD></TR>
              <TR>
                <TD class=forumTextOdd colSpan=2>For the Development 
                  Checklist, mark each deliverable as Yes, it exists; No, it 
                  does not exist; N/A, this deliverable was not required. For 
                  the Development Review, provide a score for each statement 
                  according to the dropdown answers.</TD></TR></TBODY></TABLE><!-- Start Text -->
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Component Development</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Component 
                  Development</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The implementation addresses the 
                  functionality as detailed in the component design 
                  documents.</P>
                  <P class=scorecardQuestion>Where applicable, list the missing 
                  elements below.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[0].evaluation><OPTION 
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The implementation correctly uses 
                  all required technologies (language, required components, 
                  etc.) and packages.</P>
                  <P class=scorecardQuestion>If required technologies or 
                  packages are not used properly, explain why.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[1].evaluation><OPTION 
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The implementation properly 
                  implements required algorithms as defined in section 1.3 of 
                  the Component Specification.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[2].evaluation><OPTION 
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The implementation has not modified 
                  the public API as defined in the design.</P>
                  <P class=scorecardQuestion>This includes no additional public 
                  classes, methods or variables.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[3].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Class Implementation</TD></TR></TBODY></TABLE>
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
                  <P class=scorecardQuestion>All classes are implementated as 
                  defined in the design documents. This not only includes 
                  technical details such as modifiers and types, but also naming 
                  conventions.</P></TD>
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Defined classes are 
implemented.</P>
                  <P class=scorecardQuestion>If not, list additional or missing 
                  classes. Points should be deducted for adding classes that 
                  affect the public API.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[5].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
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
                  <P class=scorecardQuestion>All variables are implemented as 
                  defined in the design documents. This not only includes 
                  technical details such as modifiers and types, but also naming 
                  conventions.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[6].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR>              <TR>
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

            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
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
                  <P class=scorecardQuestion>All methods are implemented as 
                  defined in the design documents. This not only includes 
                  technical details such as modifiers, types, arguments and 
                  exceptions, but also naming conventions.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[7].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
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
                  <P class=scorecardQuestion>The implementation properly maps 
                  class relationships.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[8].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Code Review</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Code 
                Review</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The object types defined in the 
                  implementation are the best choice for the intended usage. For 
                  example, using a Vector vs. an array.</P></TD>
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>There are no needless loops.</P></TD>
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>There is no needless/careless 
                  object instantiation or variable assignment.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[11].evaluation><OPTION 
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The implementation code contains 
                  detailed documentation for classes, methods and variables as 
                  defined in the Deliverables Document.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[12].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree">3 - Agree</OPTION> 
                    <OPTION value="4 - Strongly Agree" selected>4 - Strongly 
                    Agree</OPTION></SELECT> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Test Cases</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Test 
Cases</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Unit Test Cases thoroughly test all 
                  methods and constructors.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[13].evaluation><OPTION 
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
                  <P class=scorecardQuestion>Where applicable, Unit Test Cases 
                  properly make use of setup and teardown methods to configure 
                  the test environment.</P></TD>
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Where applicable, files used in 
                  Unit Test Cases exist in the /test_files directory.</P></TD>
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Where applicable, Unit Test cases 
                  do not leave temporary files on the file system after testing 
                  is complete.</P></TD>
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>The unit test code contains 
                  detailed documentation for classes, methods and variables as 
                  defined in the Deliverables Document.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[17].evaluation><OPTION 
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
                          name=questions[0].responses[0].responseType><OPTION 
                          value=Recommended>Recommended</OPTION> <OPTION 
                          value=Required>Required</OPTION> <OPTION value=Comment 
                          selected>Comment</OPTION></SELECT> </TD>
                      <TD class=forumTextOdd vAlign=center width="5%"></TD>
                      <TD class=forumTextOdd vAlign=center 
                    width="5%"></TD></TR></TBODY></TABLE></TD></TR>

              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Review Board Test Cases:</P>
                  <P class=scorecardQuestion>(Stress, Accuracy or Failure 
                  tests)</P>
                  <P class=scorecardQuestion>Stress / Benchmark: Tests the 
                  implementation according to performance and throughput. Output 
                  basic benchmarking to System.out.</P>
                  <P class=scorecardQuestion>Accuracy: Tests the implementation 
                  on the accuracy of the results when using the component.</P>
                  <P class=scorecardQuestion>Failure: Tests the implementation's 
                  ability to handle bad data and incorrect usage.</P>
                  <P class=scorecardQuestion>Please specify the type of test 
                  cases that were authored and executed, the total number of 
                  tests and the number of tests that were successful.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%">&nbsp;Pass: 
                  <INPUT class=registerForm size=4 value=0 
                  name=questions[18].totalPass><BR>&nbsp;Total: <INPUT 
                  class=registerForm size=4 value=0
                  name=questions[18].totalTests> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
                  width=1 border=0></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=whiteBkgnd>Overall Score</TD></TR></TBODY></TABLE>
            <TABLE class=forumBkgd cellSpacing=1 cellPadding=0 width="100%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=forumTitle width="90%"><STRONG>Overall 
                Score</STRONG></TD>
                <TD class=forumTitleCenter 
                  width="10%"><STRONG>Response</STRONG></TD></TR>
              <TR>
                <TD class=forumTextOdd width="90%">
                  <P class=scorecardQuestion>Overall, this is a quality 
                  implementation that meets all requirements.</P>
                  <P class=scorecardQuestion>Please detail any additional 
                  comments regarding the component implementation.</P></TD>
                <TD class=forumTextOdd vAlign=top width="10%"><SELECT 
                  class=searchForm name=questions[19].evaluation><OPTION 
                    value=Answer>Answer</OPTION> <OPTION 
                    value="1 - Strongly Disagree">1 - Strongly Disagree</OPTION> 
                    <OPTION value="2 - Somewhat Agree">2 - Somewhat 
                    Agree</OPTION> <OPTION value="3 - Agree" >3 - 
                    Agree</OPTION> <OPTION value="4 - Strongly Agree" selected>4 - 
                    Strongly Agree</OPTION></SELECT> </TD></TR><TR>                <TD colSpan=2>                  <TABLE class=whiteBkgnd cellSpacing=0 cellPadding=0                   width="100%" align=center border=0>                    <TBODY>                    <TR>                      <TD class=forumTextOdd noWrap                         width="15%"><STRONG>Response 1:</STRONG></TD>                      <TD class=forumTextOdd width="60%"></TD>                      <TD class=forumTextOdd vAlign=center width="15%">&nbsp;                         <SELECT                           name=questions[5].responses[0].responseType><OPTION                           value=Recommended>Recommended</OPTION> <OPTION                           value=Required>Required</OPTION> <OPTION value=Comment                           selected>Comment</OPTION></SELECT> </TD>                      <TD class=forumTextOdd vAlign=center width="5%"></TD>                      <TD class=forumTextOdd vAlign=center                     width="5%"></TD></TR></TBODY></TABLE></TD></TR>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=normal><IMG height=5 alt="" 
                  src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
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
            src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
            width=10 border=0> </TD></TR></TBODY></TABLE></TD><!--Middle Column ends --><!-- Gutter 2 begins -->
    <TD width=15><IMG height=10 alt="" 
      src="Distributed SImple Cache Programming Factory Design Review Scorecard_files/clear.gif" 
      width=15 border=0> 
</TD><!-- Gutter 2 ends --></TR></TBODY></TABLE></BODY></HTML>