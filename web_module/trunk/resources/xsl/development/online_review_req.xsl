<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 9">
<meta name=Originator content="Microsoft Word 9">
<link rel=File-List href="./Online-Review-Spec_files/filelist.xml">
<link rel=Edit-Time-Data href="./Online-Review-Spec_files/editdata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<title>Online Review Specification</title>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Subject>&lt;Project Name&gt;</o:Subject>
  <o:Author>Mike Morris</o:Author>
  <o:Keywords>Software Requirements</o:Keywords>
  <o:Template>Requirements Specification.dot</o:Template>
  <o:LastAuthor>Micah Gideon Modell</o:LastAuthor>
  <o:Revision>18</o:Revision>
  <o:TotalTime>979</o:TotalTime>
  <o:LastPrinted>2003-01-27T16:53:00Z</o:LastPrinted>
  <o:Created>2003-02-07T15:51:00Z</o:Created>
  <o:LastSaved>2003-02-26T00:25:00Z</o:LastSaved>
  <o:Pages>6</o:Pages>
  <o:Words>2247</o:Words>
  <o:Characters>12809</o:Characters>
  <o:Category>Specification</o:Category>
  <o:Company>TopCoder Software</o:Company>
  <o:Lines>106</o:Lines>
  <o:Paragraphs>25</o:Paragraphs>
  <o:CharactersWithSpaces>15730</o:CharactersWithSpaces>
  <o:Version>9.4402</o:Version>
 </o:DocumentProperties>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:ActiveWritingStyle Lang="EN-US" VendorID="8" DLLVersion="513" NLCheck="0">1</w:ActiveWritingStyle>
  <w:TrackRevisions/>
  <w:DoNotShowRevisions/>
  <w:DoNotPrintRevisions/>
  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>
  <w:UseMarginsForDrawingGridOrigin/>
  <w:Compatibility>
   <w:WW6BorderRules/>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
  </w:Compatibility>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:536902279 -2147483648 8 0 511 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;
	mso-font-charset:2;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 268435456 0 0 -2147483648 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:553679495 -2147483648 8 0 66047 0;}
@font-face
	{font-family:"Book Antiqua";
	panose-1:2 4 6 2 5 3 5 3 3 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
 /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
h1
	{mso-style-next:Normal;
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	page-break-after:avoid;
	mso-outline-level:1;
	mso-list:l0 level1 lfo2;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-bidi-font-family:"Times New Roman";
	mso-font-kerning:0pt;
	mso-bidi-font-weight:normal;}
h2
	{mso-style-parent:"Heading 1";
	mso-style-next:Normal;
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	page-break-after:avoid;
	mso-outline-level:2;
	mso-list:l0 level2 lfo2;
	font-size:10.0pt;
	font-family:Arial;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-font-weight:normal;}
h3
	{mso-style-parent:"Heading 1";
	mso-style-next:Normal;
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	page-break-after:avoid;
	mso-outline-level:3;
	mso-list:l0 level3 lfo2;
	font-size:10.0pt;
	font-family:Arial;
	mso-bidi-font-family:"Times New Roman";
	font-weight:normal;
	font-style:italic;
	mso-bidi-font-style:normal;}
h4
	{mso-style-parent:"Heading 1";
	mso-style-next:Normal;
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	page-break-after:avoid;
	mso-outline-level:4;
	mso-list:l0 level4 lfo2;
	font-size:10.0pt;
	font-family:Arial;
	mso-bidi-font-family:"Times New Roman";
	font-weight:normal;}
h5
	{mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	mso-outline-level:5;
	mso-list:l0 level5 lfo2;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-bidi-font-family:"Times New Roman";
	font-weight:normal;}
h6
	{mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	mso-outline-level:6;
	mso-list:l0 level6 lfo2;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-bidi-font-family:"Times New Roman";
	font-weight:normal;
	font-style:italic;
	mso-bidi-font-style:normal;}
p.MsoHeading7, li.MsoHeading7, div.MsoHeading7
	{mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	mso-outline-level:7;
	mso-list:l0 level7 lfo2;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoHeading8, li.MsoHeading8, div.MsoHeading8
	{mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	mso-outline-level:8;
	mso-list:l0 level8 lfo2;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-style:italic;
	mso-bidi-font-style:normal;}
p.MsoHeading9, li.MsoHeading9, div.MsoHeading9
	{mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-indent:0in;
	line-height:12.0pt;
	mso-pagination:none;
	mso-outline-level:9;
	mso-list:l0 level9 lfo2;
	font-size:9.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;
	font-style:italic;
	mso-bidi-font-style:normal;}
p.MsoToc1, li.MsoToc1, div.MsoToc1
	{mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:.5in;
	margin-bottom:3.0pt;
	margin-left:0in;
	line-height:12.0pt;
	mso-pagination:none;
	tab-stops:right 6.5in;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc2, li.MsoToc2, div.MsoToc2
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:.5in;
	margin-bottom:0in;
	margin-left:.3in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	tab-stops:right 6.5in;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc3, li.MsoToc3, div.MsoToc3
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.6in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	tab-stops:1.0in right 6.5in;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc4, li.MsoToc4, div.MsoToc4
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:30.0pt;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc5, li.MsoToc5, div.MsoToc5
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:40.0pt;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc6, li.MsoToc6, div.MsoToc6
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:50.0pt;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc7, li.MsoToc7, div.MsoToc7
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:60.0pt;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc8, li.MsoToc8, div.MsoToc8
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:70.0pt;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoToc9, li.MsoToc9, div.MsoToc9
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:80.0pt;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoNormalIndent, li.MsoNormalIndent, div.MsoNormalIndent
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:45.0pt;
	margin-bottom:.0001pt;
	text-indent:-45.0pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoFootnoteText, li.MsoFootnoteText, div.MsoFootnoteText
	{margin-top:2.0pt;
	margin-right:0in;
	margin-bottom:2.0pt;
	margin-left:.25in;
	text-indent:-.25in;
	line-height:12.0pt;
	mso-pagination:lines-together;
	page-break-after:avoid;
	border:none;
	mso-border-bottom-alt:solid black .75pt;
	padding:0in;
	mso-padding-alt:0in 0in 0in 0in;
	font-size:8.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Helvetica;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{margin:0in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	tab-stops:center 3.0in right 6.0in;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{margin:0in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	tab-stops:center 3.0in right 6.0in;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
span.MsoFootnoteReference
	{mso-ansi-font-size:10.0pt;
	vertical-align:super;}
p.MsoTitle, li.MsoTitle, div.MsoTitle
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:none;
	font-size:18.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:6.0pt;
	margin-left:.5in;
	line-height:12.0pt;
	mso-pagination:lines-together;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	color:blue;
	font-style:italic;
	mso-bidi-font-style:normal;
	text-decoration:underline;
	text-underline:single;}
p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-align:center;
	mso-line-height-alt:12.0pt;
	mso-pagination:none;
	font-size:18.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	mso-ansi-language:EN-AU;
	font-style:italic;
	mso-bidi-font-style:normal;}
p.MsoBodyText2, li.MsoBodyText2, div.MsoBodyText2
	{margin:0in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	color:blue;
	font-style:italic;
	mso-bidi-font-style:normal;}
p.MsoBodyTextIndent2, li.MsoBodyTextIndent2, div.MsoBodyTextIndent2
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
p.MsoDocumentMap, li.MsoDocumentMap, div.MsoDocumentMap
	{margin:0in;
	margin-bottom:.0001pt;
	line-height:12.0pt;
	mso-pagination:none;
	background:navy;
	font-size:10.0pt;
	font-family:Tahoma;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.Paragraph2, li.Paragraph2, div.Paragraph2
	{mso-style-name:Paragraph2;
	margin-top:4.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	text-align:justify;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	color:black;
	mso-ansi-language:EN-AU;}
p.Bullet1, li.Bullet1, div.Bullet1
	{mso-style-name:Bullet1;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	text-indent:-.3in;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.Bullet2, li.Bullet2, div.Bullet2
	{mso-style-name:Bullet2;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:1.0in;
	margin-bottom:.0001pt;
	text-indent:-.25in;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	color:navy;}
p.Tabletext, li.Tabletext, div.Tabletext
	{mso-style-name:Tabletext;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:6.0pt;
	margin-left:0in;
	line-height:12.0pt;
	mso-pagination:lines-together;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MainTitle, li.MainTitle, div.MainTitle
	{mso-style-name:"Main Title";
	margin-top:24.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	text-align:center;
	mso-pagination:none;
	font-size:16.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	mso-font-kerning:14.0pt;
	font-weight:bold;
	mso-bidi-font-weight:normal;}
p.Paragraph1, li.Paragraph1, div.Paragraph1
	{mso-style-name:Paragraph1;
	margin-top:4.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.Paragraph3, li.Paragraph3, div.Paragraph3
	{mso-style-name:Paragraph3;
	margin-top:4.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:76.5pt;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.Paragraph4, li.Paragraph4, div.Paragraph4
	{mso-style-name:Paragraph4;
	margin-top:4.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:112.5pt;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.Body, li.Body, div.Body
	{mso-style-name:Body;
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Book Antiqua";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.Bullet, li.Bullet, div.Bullet
	{mso-style-name:Bullet;
	margin-top:6.0pt;
	margin-right:.25in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	tab-stops:list .25in left .5in;
	font-size:10.0pt;
	font-family:"Book Antiqua";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.InfoBlue, li.InfoBlue, div.InfoBlue
	{mso-style-name:InfoBlue;
	mso-style-update:auto;
	mso-style-next:"Body Text";
	margin-top:0in;
	margin-right:0in;
	margin-bottom:6.0pt;
	margin-left:.5in;
	line-height:12.0pt;
	mso-pagination:none;
	font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	color:blue;
	font-style:italic;
	mso-bidi-font-style:normal;}
ins
	{mso-style-type:export-only;
	text-decoration:none;}
span.msoDel
	{mso-style-type:export-only;
	mso-style-name:"";
	text-decoration:line-through;
	display:none;
	color:red;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-header:url("./Online-Review-Spec_files/header.htm") h1;
	mso-footer:url("./Online-Review-Spec_files/header.htm") f1;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
 /* List Definitions */
@list l0
	{mso-list-id:-5;
	mso-list-template-ids:-1;}
@list l0:level1
	{mso-level-style-link:"Heading 1";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level2
	{mso-level-style-link:"Heading 2";
	mso-level-text:"%1\.%2";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level3
	{mso-level-style-link:"Heading 3";
	mso-level-text:"%1\.%2\.%3";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level4
	{mso-level-style-link:"Heading 4";
	mso-level-text:"%1\.%2\.%3\.%4";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level5
	{mso-level-style-link:"Heading 5";
	mso-level-text:"%1\.%2\.%3\.%4\.%5";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level6
	{mso-level-style-link:"Heading 6";
	mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level7
	{mso-level-style-link:"Heading 7";
	mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level8
	{mso-level-style-link:"Heading 8";
	mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7\.%8";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l0:level9
	{mso-level-style-link:"Heading 9";
	mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7\.%8\.%9";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l1
	{mso-list-id:168252355;
	mso-list-type:hybrid;
	mso-list-template-ids:683723970 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l2
	{mso-list-id:215775289;
	mso-list-type:hybrid;
	mso-list-template-ids:-419245922 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l3
	{mso-list-id:524683704;
	mso-list-type:hybrid;
	mso-list-template-ids:898252572 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l3:level1
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	margin-left:1.0in;
	text-indent:-.25in;}
@list l3:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	margin-left:1.5in;
	text-indent:-.25in;}
@list l4
	{mso-list-id:582373707;
	mso-list-type:hybrid;
	mso-list-template-ids:-330123086 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l5
	{mso-list-id:1174345335;
	mso-list-type:hybrid;
	mso-list-template-ids:429417122 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l6
	{mso-list-id:1186938840;
	mso-list-template-ids:-1;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l6:level2
	{mso-level-text:"%1\.%2";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level3
	{mso-level-text:"%1\.%2\.%3";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level4
	{mso-level-text:"%1\.%2\.%3\.%4";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level5
	{mso-level-text:"%1\.%2\.%3\.%4\.%5";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level6
	{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level7
	{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level8
	{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7\.%8";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l6:level9
	{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7\.%8\.%9";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	mso-level-legacy:yes;
	mso-level-legacy-indent:0in;
	mso-level-legacy-space:.1in;
	margin-left:0in;
	text-indent:0in;}
@list l7
	{mso-list-id:1191648262;
	mso-list-type:hybrid;
	mso-list-template-ids:2088125132 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l7:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l8
	{mso-list-id:1322393490;
	mso-list-type:hybrid;
	mso-list-template-ids:-1598239586 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l8:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l8:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.25in;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l8:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.75in;
	mso-level-number-position:left;
	margin-left:1.75in;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l9
	{mso-list-id:1501121838;
	mso-list-type:hybrid;
	mso-list-template-ids:1550980094 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l9:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l10
	{mso-list-id:1915241031;
	mso-list-type:hybrid;
	mso-list-template-ids:-1105944904 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l10:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l10:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l11
	{mso-list-id:1944727334;
	mso-list-type:hybrid;
	mso-list-template-ids:519759878 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l11:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="16385"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=EN-US link=blue vlink=purple style='tab-interval:.5in'>

<div class=Section1>

<h1 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1127'><a
name="_Toc456598592"></a><a name="_Toc10301853"><span style='mso-bookmark:_Toc456598592'>Online
Review Requirements Specification</span></a></h1>

<span style='mso-bookmark:_Toc456598592'></span>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-change:
"%1\:1\:0\:\." "Dave Tanacea" 20020529T1437'><span style='mso-bookmark:_Toc10301853'><a
name="_Toc456598593"><![if !supportLists]>1.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Scope</a></span></h1>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10301853'><span
style='mso-bookmark:_Toc456598593'>The Online Review Application <span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:51">will </del></span><span class=msoDel><del
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:48">take </del></span><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:48">automate</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:52">s</ins><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:48"> </ins><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:52">the process of </del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:52">the </ins>TopCoder
Software<span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:52">�s</del></span> peer review <ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:52">process </ins><span
class=msoDel><del cite="mailto:Mike%20Morris" datetime="2003-01-27T12:49">process
</del></span>for both Component Design and Component Development projects.<span
style="mso-spacerun: yes">�� </span>Reviewers <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:53">will be</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:53">are</ins> able
to login, check the status of their assignments, download submissions for
review, <span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:53">fill</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-04T13:59">-</del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:53">in</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:53">complete</ins>
online review forms and perform aggregation of reviews.<span
style="mso-spacerun: yes">� </span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:54">There is an </del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:54">The </ins>admin<ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:54">istration</ins>
section <span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:54">that </del></span>allows users to set up reviews,
assign members<ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:55">, monitor the process and intervene at any stage</ins><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T17:55"> and score components</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:55"> of
development</ins>.</span></span></p>

<p class=MsoNormal><span style='mso-bookmark:_Toc10301853'><span
style='mso-bookmark:_Toc456598593'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></span></p>

<span style='mso-bookmark:_Toc456598593'></span>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10301853'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-change:
"%1\:1\:0\:\.%2\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10301853'><![if !supportLists]>1.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Logic
Requirements</span></h2>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:2\:0\:\.%2\:1\:0\:\.%3\:1\:0\:" "Dave Tanacea" 20020529T1437'><span
style='mso-bookmark:_Toc10301853'><![if !supportLists]>1.1.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Reviewers
Track Assignments</span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10301853'>Reviewers
can login and view current board assigned projects (components), including dates
of each portion of the review and their role in the process.<span
style="mso-spacerun: yes">� </span><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:43">From this section, reviewers must be able to
navigate easily to </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:45">their current action items.</ins></span></p>

<span style='mso-bookmark:_Toc10301853'></span>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030129T0107'><a name="_Toc10301867"></a><a
name="_Toc10301854"><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:07">1.1.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:07">Submission
Upload<o:p></o:p></ins></span></a></h3>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0107'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:07">All
developers/designers must be able to upload submissions for any projects they
have inquired about.<span style="mso-spacerun: yes">� </span>The system must </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T17:59">track each
user</ins><ins cite="mailto:Micah%20Gideon%20Modell">�s submissions and assign
each submitter <ins datetime="2003-02-25T18:05">a </ins>unique id for each
project to <ins datetime="2003-02-25T18:03">which</ins> they submit solutions
(i.e. user XXX submitting for <ins datetime="2003-02-25T18:01">project</ins><ins
datetime="2003-02-25T18:02">s</ins><ins datetime="2003-02-25T18:01"> Y and Z</ins><ins
datetime="2003-02-25T18:02"> might be assigned �Submitter 1500� and Submitter
1501� respectively</ins><ins datetime="2003-02-25T18:03">, but if user XXX
submits a cor</ins><ins datetime="2003-02-25T18:04">rection for project Y, they
are still �Submitter 1500� and the file must be stored accordingly</ins><ins
datetime="2003-02-25T18:03">).<span style="mso-spacerun: yes">� </span>These
unique ids must be unique system-wide. </ins><ins datetime="2003-02-25T19:22">Submitters
must be referred to by this generic name through</ins><ins
datetime="2003-02-25T19:23">ou</ins><ins datetime="2003-02-25T19:22">t the app</ins><ins
datetime="2003-02-25T19:23">lication</ins><ins datetime="2003-02-25T19:24"> to
maintain their anonymity</ins><ins datetime="2003-02-25T19:25"> during review</ins><ins
datetime="2003-02-25T19:24">.</ins><ins datetime="2003-01-29T01:07"><o:p></o:p></ins></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:2\:0\:\.%2\:1\:0\:\.%3\:1\:0\:" "Dave Tanacea" 20020529T1437'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]>1.1.3<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Primary
Reviewer Design and Development Screening Scorecard</span></span></h3>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:Unknown 20030210T1244'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'>Primary
Reviewers will have an on-line <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:53">tool to fill
out the </del></span>screening scorecard<ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T13:53"> for each </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:08">submission
that</ins><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:53">
provides access to all required files and a checklist of screening requirements</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:27"> and </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:28">a place to
enter </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-28T23:27">text for </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:13">response</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:27">s in response
to others</ins>.<ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:10"><span style="mso-spacerun: yes">� </span>The text
of each of these questions must be configurable</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:17"> (</ins></span></span><a
href="#_What_elements_of"><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'>see Configuration</span></span><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'></span></span></a><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:17">).</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:31"><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0108'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:08"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0108'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:08">Once
screening is completed, </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:09">the Product </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:16">M</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:09">anager must be
able to view and edit the results, select the winner</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:11">s</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:29"> </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:09">based upon
the scores and send </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:08">e</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-28T23:31">mail notifications </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:10">to the
reviewers</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-28T23:31">.</ins><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:31"> </del></span></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030124T1448'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:48">1.1.4<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-27T13:06">Development</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:48"> Reviewers
and Test Case Approval</ins><ins cite="mailto:Mike%20Morris"
datetime="2003-01-27T12:49"> <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-27T13:07"><ins
datetime="2003-01-27T12:49">� what does this have to do with Design Reviewers?</ins></del></span></ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:26"><o:p></o:p></ins></span></span></h3>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030124T1626'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:26">All reviewers
will have an online tool to approve or reject</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:28"> the test
cases submitted by fellow review board members.<span style="mso-spacerun:
yes">� </span>This requires</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:29"> yes/no </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:30">approval</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-28T23:28"> and a place to enter text responses </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:29">(to be sent
to the Product Manager) </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-28T23:28">if warranted.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T00:56"><o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:1\:0\:\.%2\:1\:0\:\.%3\:3\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]>1.1.5<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Reviewers
Design and Development Scorecard</span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'>All reviewers will have an on-line <span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T13:55">tool to fill out either the design or development </del></span>scorecard<ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:55"> <span
class=msoDel><del cite="mailto:Mike%20Morris" datetime="2003-01-27T12:50"><ins
datetime="2003-01-24T13:55">which</ins></del></span></ins><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:50">that</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:55"> provides
access to all required </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:13">submissions</ins>.<ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:58"><span
style="mso-spacerun: yes">� </span>Scorecards must </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:59">be capable of
presenting multiple sections consisting of</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:58">:<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l3 level1 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030124T1358;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:58">1.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T13:59">Description of
attribute to be </ins><ins cite="mailto:Micah%20Gideon%20Modell">scored<ins
datetime="2003-01-24T14:10"> (herein referred to as Questions)</ins>.<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l3 level1 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030210T1244;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T12:44">2.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell">One overall rating<ins
datetime="2003-01-24T14:11"> response to each question</ins>.<ins
datetime="2003-01-24T14:12"><o:p></o:p></ins></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l3 level1 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030210T1244;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T12:44">3.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:26">Ability for
reviewer to provide zero or many re</ins><ins cite="mailto:Micah%20Gideon%20Modell">sponses<ins
datetime="2003-01-24T14:08"> </ins><ins datetime="2003-01-24T14:09">to each </ins><ins
datetime="2003-01-24T14:25">q</ins><ins datetime="2003-01-24T14:11">uestion</ins><ins
datetime="2003-01-24T14:24">.<o:p></o:p></ins></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l3 level1 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030124T1425;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:25">4.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:25">Require at least
one response for any question eliciting a less-than-perfect overall rating.<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l3 level1 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030124T1424;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:24">5.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:24">Responses
must </ins><ins cite="mailto:Micah%20Gideon%20Modell">consist of:<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.5in;text-indent:-.25in;mso-list:l3 level2 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030124T1401;tab-stops:list 1.5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:01">a.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:01">Text
response.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:02"><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.5in;text-indent:-.25in;mso-list:l3 level2 lfo4;
mso-list-ins:"Micah Gideon Modell" 20030124T1402;tab-stops:list 1.5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:02">b.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:03">Decision on
whether response describes a requirement, recommendation or other comment.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:04"><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030124T1404'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:04">Scorecards
must be </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:05">able to be saved for later completion.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:30"> </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:22">Individual
scorecards may be marked as complete (although this does not preclude further
editing)</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T00:53">.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:30"><span style="mso-spacerun: yes">� </span></ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:02">Reviewers
must be able to submit all scorecards</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T00:55"> once each
individual review is complete, </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T09:30">indicating</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T00:55"> the reviews </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:33">are ready to</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T00:55"> be used</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:05"> in the </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:27">scoring</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:05"> phase.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:21"><span
style="mso-spacerun: yes">� </span>If reviewers have marked all scorecards as
complete, but </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:15">have </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-10T14:21">not submitted</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:33">, when the
end of the review process is reached, the scorecards are submitted.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:39"><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030124T1439'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:1\:0\:\.%2\:1\:0\:\.%3\:4\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]>1.1.6<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Primary
Reviewer Aggregation </span></span></h3>

<p class=MsoBodyTextIndent2><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:35">When all reviews are </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:15">received</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:35">, the winner
is calculated </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:15">using a configu</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:16">rable </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:49">weighted </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:16">matrix (</ins></span></span><a
href="#_What_elements_of"><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'>see Configuration</span></span><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'></span></span></a><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:16">) </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:35">and the </ins>Primary
Reviewers have an online tool to aggregate all review <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:27">comments</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:27">responses</ins>.<span
style="mso-spacerun: yes">� </span>This tool will <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:29">show</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:29">present</ins>
<ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:30">the
winning submission for the </ins><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:29">all </del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T09:30">component,
each</ins><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:29">
question </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:31">from the review and</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:29"> all reviewer
responses</ins><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:31">comments</del></span> <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:31">and give t</del></span><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:50">. </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:31">T</ins>he
primary reviewer <ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:32">must have the ability to mark each individual
response as </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:34">�Accepted�, �Rejected� or �Duplicate� as well as </ins>the
ability to <span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:35">accept, reject, </del></span>edit the <span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:35">reviewers comments</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:35">responses</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:49"> or switch
it�s status between required/recommended/comment</ins>.<ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:04"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0104'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:04"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0104'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:04">When
completed, reviewers must be notified and provided with a means of
accepting/rejecting the aggregation and providing text comments upon rejection.<o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0105'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:05"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0105'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:06">Once</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:05"> accepted, </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:16">the </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:07">Product
Manager must be able to view </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:17">and edit </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:07">the results
and send</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:17"> the notification emails.</ins><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:04"><span
style="mso-spacerun: yes">� </span></del></span><ins cite="mailto:Mike%20Morris"
datetime="2003-01-27T12:50"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Mike Morris" 20030127T1250'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:50"><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-27T13:25">Add the
ability to reject the winner. This would be in case a winner is in-eligible, or
does not complete the final review. </del></span></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030124T1644'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:44">1.1.7<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:44">Final Review<o:p></o:p></ins></span></span></h3>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030124T1644'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:45">Primary
Reviewer must have an online tool to </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:50">re</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:45">view the </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:46">�final�
submission of the winning developer</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:44">.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:48"><span style="mso-spacerun: yes">� </span></ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:50">This tool
must provide access to all required files</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:51"> as well as
presenting the reviewer with the questions and responses recorded for the
developer (see 1.1.5) </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:52">along </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:51">with </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:53">a method for indicating whether each has or has not
been completed in the revision.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:51"> </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:44"><o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-text-indent-alt:0in;mso-list:
l0 level3 lfo2;mso-list-change:"%1\:1\:0\:\.%2\:1\:0\:\.%3\:5\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]>1.1.8<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Administrators
Schedule Review Periods</span></span></h3>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:Unknown 20030210T1244'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:39">Admins must
have a</ins><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:39">Admin</del></span> tool to <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:32">set up</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:32">sp</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:40">e</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:32">cify</ins> <ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:41">begin and end</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:33"> </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T14:37">dates for
each phase</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T14:39"> </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:33">of the review process.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:19"><span
style="mso-spacerun: yes">� </span></ins><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:33">review
milestones and perform board assignments</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:19">.</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:33"><span
style="mso-spacerun: yes">� </span>These dates </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:19">serve as a
guide</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:35"> to govern the scheduling of above-described
phases.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:20"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0120'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:20"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0120'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:58"><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-28T23:29"><span
style="mso-spacerun: yes">� </span>The reason should be a drop down box with a choice,
as well as a comment section (thoughts?).</del></span></ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:41">Admins must
be able to allocate resources to each phase of the project by entering the
handle</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:42"> of the developer to perform the specified task.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:20"><span
style="mso-spacerun: yes">� </span></ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:39">Primary reviewer must be indicated.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:21"><span
style="mso-spacerun: yes">� </span></ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:24">Emails notifying reviewers of initial assignments
must be sent once a week after all assignments are completed (to </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:26">minimize</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:24"> </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:26">the number of
emails and </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:28">provide</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:26"> consistency).<span style="mso-spacerun: yes">�
</span></ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:22">N</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:21">otification emails </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:23">based upon
configurable templates (</ins></span></span><a href="#_What_elements_of"><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'>see
Configuration</span></span><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'></span></span></a><span style='mso-bookmark:
_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:23">) </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:21">must be sent
upon modification.</ins><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:23"><o:p></o:p></del></span></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1814'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:14"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1814'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:14"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0138'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:14">Admins must
be able to specify payment amounts for each resource as well as record whether
or not payment has been sent.<span style="mso-spacerun: yes">� </span>Changes
here do not produce email notifications.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:38"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0139'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:38"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0138'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:40">Admins must be
able to assign a Product Manager for the project.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:49"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0149'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:49"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0149'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:49">Admins must
be able to change the status of a project [ Screening Pending | Screening In
Progress | Screening Complete | Review In Progress | Review </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:51">Complete |
Aggregation In Progress | Aggregation Complete ]</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:59">.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T02:08"><span
style="mso-spacerun: yes">� </span></ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:24">These </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:50">descriptions</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:24"> must be
configurable.<span style="mso-spacerun: yes">� </span></ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T02:08">Emails must
be sent on s</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T02:09">tatus changes</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T11:37">.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:51"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0151'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:51"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0151'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:52">Admins must
be able to terminate a project at any time due to the projects</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:53">� successful
completion or it�s failure (</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:52">Zero Submissions or All Failure Submissions).</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:42"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0142'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:42"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0142'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:42">Admins must
provide reasons for any changes </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T11:51">to a project</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:43">.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T19:21"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030225T1921'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T19:21"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030225T1921'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T19:21">Admins must
be able to view each submission, the real handle of the submitter and be able
to remove any submission from any given project at any point in the project.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:37"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030210T1437'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:37"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030210T1437'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:37">Admins must
be able to provide a freeform comment to communicate </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:38">information
(reasons for delays)</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-10T14:37"> to the developers and designers.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:14"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1814'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:10"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1810'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:10">Admins must
be able to edit</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-19T18:16"> and</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-19T18:10"> add </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:12">responses</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:10"> to each</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:13"> scorecard</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:15"> and
worksheet (Review, Screening, Aggregation).</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:42"><span
style="mso-spacerun: yes">� </span>When editing Review Scorecards, </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:43">total score </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:42">changes (the
results of </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:44">matrix calculations) must be reflected immediately
in the UI.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:41"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030225T1841'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:41"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030225T1841'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:41">Administrators
must be able to write individualized responses to each submitter.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:17"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1817'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:17"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1817'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:17">Admin must be
able to draft </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:13">responses</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:17"> to each
submitter upon completion of each phase.<o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1817'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:17"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030219T1817'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:17">Admin must be
able to (once all docs have been reviewed) send notifications to each submitter</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-19T18:18"> participating
in the project informing of the results of the phase just ended.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:38"><o:p></o:p></ins></span></span></p>

<p class=MsoBodyTextIndent2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030129T0120'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Mike%20Morris" datetime="2003-01-27T12:51"><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:23">Admins have
the ability to replace reviewers</del></span><ins datetime="2003-01-27T12:52"><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-29T01:23"> at anytime during the review process.<span
style="mso-spacerun: yes">� </span>This requires a reason to be entered. </del></span><ins
datetime="2003-01-27T12:59"><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T01:23"><span
style="mso-spacerun: yes">�</span>The reason should be a drop down box with a
choice, as well as a comment section (thoughts?).</del></span></ins></ins></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:1\:0\:\.%2\:1\:0\:\.%3\:6\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T16:31">1.1.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:31">Development
Reviewers Peer Approval of Test Cases</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:31"><o:p></o:p></del></span></span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:31">Development
Review Board members must approve other reviewers test cases.<span
style="mso-spacerun: yes">� </span>The purpose of this is to ensure the proper
test-cases are implemented by the review board.<span style="mso-spacerun:
yes">� </span></del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:31"><o:p></o:p></del></span></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030210T1420'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:20">1.1.9<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell">Contact Product Manager<o:p></o:p></ins></span></span></h3>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030210T1420'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell">Each project detail page must provide a
facility for contacting the Product Manager assigned to the project.<o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030210T1420'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T14:20">1.1.10<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell">Audit Trail<o:p></o:p></ins></span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><ins cite="mailto:Micah%20Gideon%20Modell">The
system must maintain an audit trail for each change made including the
modification, modification date, modifying user and reason (where available).</ins><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:28"><o:p></o:p></del></span></span></span></p>

<h2 style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1127'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></span></h2>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Design
Specification<o:p></o:p></ins></span></span></h2>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:50">Design
Overview<o:p></o:p></ins></span></span></h3>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1050'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:50">[This section
includes a </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:51">detailed textual description of the design of this
application.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:53"><span style="mso-spacerun: yes">� </span>This
includes a description of the interaction</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:54">s</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:53"> between each
component</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:54"> and the </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:55">way in which
the application classes tie them together.]<o:p></o:p></ins></span></span></p>

<p class=MsoBodyText style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1055'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:50"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1050'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:50">1.2.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Design
Patterns<o:p></o:p></ins></span></span></h3>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">[Reference
any design patterns used in the design.<span style="mso-spacerun: yes">�
</span>For example: abstract factory, MVC, etc.]<o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.3<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Required
Algorithm<o:p></o:p></ins></span></span></h3>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">[Specify any
algorithms required for implementation of this design. Provide pseudo code for
the algorithm implementation.]<o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.4<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Component
Requirements<o:p></o:p></ins></span></span></h3>

<h4 style='margin-left:0in;text-indent:0in;mso-list:l0 level4 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.4.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">TopCoder
Software Components<o:p></o:p></ins></span></span></h4>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">[List the
components used in your design and provide a brief overview of the service(s)
provided by each Replace Recommended components with components actually used.]
<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.75in;mso-text-indent-alt:
-.25in;mso-list:l8 level1 lfo6;mso-list-ins:"Micah Gideon Modell" 20030214T1049;
tab-stops:list .75in'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Math Matrix<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Configuration Manager<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Notification<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in;mso-list:l8 level2 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list 1.25in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:"Courier New";mso-bidi-font-family:"Times New Roman"'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Event Engine<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in;mso-list:l8 level2 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list 1.25in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:"Courier New";mso-bidi-font-family:"Times New Roman"'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Email Engine<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Calendar<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Job Scheduler<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">File Upload<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Logging Wrapper<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l8 level1 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Security Manager<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:1.25in;text-indent:-.25in;mso-list:l8 level2 lfo6;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list 1.25in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><![if !supportLists]><span
style='font-family:"Courier New";mso-bidi-font-family:"Times New Roman"'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">ID Generator<o:p></o:p></ins></span></span></p>

<h4 style='margin-left:0in;text-indent:0in;mso-list:l0 level4 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.4.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Third Party
Components<o:p></o:p></ins></span></span></h4>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">[List the Third
party components used/required in this application.<span style="mso-spacerun:
yes">� </span>This may include </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T18:40">any TopCoder Software approved </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">packages</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T18:41"> </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T18:40">(</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">such as
xerces</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T18:40">)</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T18:41"><span style="mso-spacerun: yes">� </span>If unsure,
ask the Product Manager</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T18:42"> through the forums</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T18:41">.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"> Include the
version of the component.]<span style="mso-spacerun: yes">� </span><o:p></o:p></ins></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><a name="_Toc10369264"><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.5<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Deployment
Constraints<o:p></o:p></ins></a></span></span></h3>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l2 level1 lfo8;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">N Web Servers<o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l2 level1 lfo8;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">N Application Servers<o:p></o:p></ins></span></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.6<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Exception
Handling Overview<o:p></o:p></ins></span></span></span></h3>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">[List each exception condition anticipated and how
it is to be handled in the implementation.<span style="mso-spacerun: yes">�
</span>This should include invalid parameter values as well as invalid states.]<o:p></o:p></ins></span></span></span></p>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">[Exception Name] : [Enter overview here]<o:p></o:p></ins></span></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.7<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Development
Standards:<o:p></o:p></ins></span></span></span></h3>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l4 level1 lfo10;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">It is required that all code be clearly commented.<o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">All code must adhere to javadoc standards, and, at
minimum, include the @author, @param, @return, @throws and @version tags.<span
style="mso-spacerun: yes">� </span><o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l10 level2 lfo12;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
"Courier New";mso-bidi-font-family:"Times New Roman"'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">When populating the author tag, use your TopCoder
member handle.<span style="mso-spacerun: yes">� </span>In addition, please do
not put in your email addresses.<o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l10 level2 lfo12;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
"Courier New";mso-bidi-font-family:"Times New Roman"'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Copyright tag: Copyright � 2002, TopCoder, Inc. All
rights reserved<o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">For standardization purposes, code must use a
4-space (not tab) indentation.<o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Do not use the ConfigurationManager inside of
EJB�s.<span style="mso-spacerun: yes">� </span>The usage of the java.io.*
package to read/write configuration files can potentially conflict with a
restrictive security scheme inside the EJB container.<o:p></o:p></ins></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">All code must adhere to the Code Conventions
outlined in the following: </ins></span></span></span><a
href="http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html"><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bidi-font-family:Tahoma'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><u>http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html</u></ins></span></span></span></span><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'></span></span></span></a><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></ins></span></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><a
name="_Toc10369265"><![if !supportLists]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">1.2.8<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Data Requirements<o:p></o:p></ins></a></span></span></span></h3>

<h4 style='margin-left:0in;text-indent:0in;mso-list:l0 level4 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.8.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Data Handling<o:p></o:p></ins></span></span></span></span></h4>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">[List each
configuration file utilized by this application, a brief description of the
file and, where applicable, the component using it]<o:p></o:p></ins></span></span></span></span></p>

<h4 style='margin-left:0in;text-indent:0in;mso-list:l0 level4 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030214T1049'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">1.2.8.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Table and
column names should be as follows: table_name, not tableName.<o:p></o:p></ins></span></span></span></span></h4>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l9 level1 lfo14;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Every table must have a Primary Key.<o:p></o:p></ins></span></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l9 level1 lfo14;
mso-list-ins:"Micah Gideon Modell" 20030214T1049;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Always use Long (or database equivalent) for the
Primary Key.<o:p></o:p></ins></span></span></span></span></p>

<p class=MsoNormal style='margin-left:.5in;mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030214T1049'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">For maximum
portability, database objects (table names, indexes, etc) should be kept to 18
characters or less.<span style="mso-spacerun: yes">� </span>Informix and DB2
have an 18-character limit.<o:p></o:p></ins></span></span></span></span></p>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030213T1410'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:10">1.3<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:11">Enhancement </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:10">Flexibility<o:p></o:p></ins></span></span></span></span></h2>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030213T1410'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:10">[This </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:32">section
discusses how your application </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-13T14:10">design anticipates</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:11"> future needs
of the application </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:32">providing</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:11"> the
flexibility to easily make these changes in the future</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:33">.<span
style="mso-spacerun: yes">� </span>Please address any flexibility requirements
listed and add any you identify during design.</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:11">]</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:13"><o:p></o:p></ins></span></span></span></span></p>

<p class=MsoBodyText style='margin-left:.75in;text-indent:-.25in;mso-list:l5 level1 lfo16;
mso-list-ins:"Micah Gideon Modell" 20030213T1414;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-13T14:14">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-13T14:13">Addition and/or removal of </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-13T14:14">steps of the
process.</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-13T14:10"><o:p></o:p></ins></span></span></span></span></p>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030210T1244'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-10T12:44">1.4<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell">Industry Standards <o:p></o:p></ins></span></span></span></span></h2>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030210T1244'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><ins
cite="mailto:Micah%20Gideon%20Modell">[Reference any industry standards used in
the design.<span style="mso-spacerun: yes">� </span>For example: XML, SOAP]<o:p></o:p></ins></span></span></span></span></p>

<p class=MsoBodyText style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030210T1244'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T10:59"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></span></span></p>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1059'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T10:59">1.5<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T10:59">Example of
the Software Usage<o:p></o:p></ins></span></span></span></span></h2>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l11 level1 lfo18;
tab-stops:list .75in'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:02">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]>TopCoder Software Component Development
Methodology<span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:02"><o:p></o:p></del></span></span></span></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l11 level1 lfo18;
mso-list-ins:"Micah Gideon Modell" 20030130T1557;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:57">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:57"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l11 level1 lfo18;
tab-stops:list .75in'><span style='mso-bookmark:_Toc10301854'><span
style='mso-bookmark:_Toc10301867'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:03">Managing a s</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T15:02">tructured
application development </ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:03">process.<o:p></o:p></ins></span></span></span></span></p>

<p class=MsoNormal style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030130T1503'><span
style='mso-bookmark:_Toc10301854'><span style='mso-bookmark:_Toc10301867'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></span></span></span></p>

<span style='mso-bookmark:_Toc10301867'></span>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-change:
"%1\:2\:0\:\.%2\:1\:0\:" "Dave Tanacea" 20020528T1558'><span style='mso-bookmark:
_Toc10301854'><span style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:
_Toc10369265'><![if !supportLists]>2.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Interface Requirements</span></span></span><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'></span></span></h1>

<p class=MsoNormal><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-text-indent-alt:0in;mso-list:
l0 level3 lfo2;mso-list-change:"%1\:2\:0\:\.%2\:1\:0\:\.%3\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a
name="_Toc10301855"><![if !supportLists]>2.1.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Graphical User Interface Requirements</a></span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'>HTML /JSP </span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:2\:0\:\.%2\:1\:0\:\.%3\:2\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]>2.1.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>External
Interfaces</span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'>All database access should be performed
through EJB, to allow for <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T09:30">acess</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-29T09:30">access</ins>
to the data from other application servers if necessary.</span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:2\:0\:\.%2\:1\:0\:\.%3\:3\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]>2.1.3<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Environment
Requirements</span></span></h3>

<p class=MsoNormal style='text-indent:.5in'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'>J2EE 1.4</span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:2\:0\:\.%2\:1\:0\:\.%3\:4\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]>2.1.4<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>User
Requirements</span></span></h3>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l11 level1 lfo18;
mso-list-ins:"Micah Gideon Modell" 20030130T1445;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:45">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:46">Designers/Developers � Designer and Developer
Members will require secure access to the online submission upload form.<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l11 level1 lfo18;
mso-list-ins:"Micah Gideon Modell" 20030130T1447;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:47">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]>Review Board Members � <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:47">TopCoder
Software</del></span><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:47">Review Board</ins> Members will <span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:43">need </del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:43">require </ins>secure
access to the <span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:48">online-</del></span>review <ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:48">scorecards</ins><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:48">application</del></span>.<span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:45"><span
style="mso-spacerun: yes">� </span></del></span></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l11 level1 lfo18;
mso-list-ins:"Micah Gideon Modell" 20030130T1445;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:45">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]>TopCoder Software Administrators � Product
Managers will <ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:47">require secure access to the </ins><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:48">use the</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:48">administrative
forms</ins><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:49"> application</del></span> to schedule, review and
distribute submissions to the reviewers.</span></span></p>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></span></p>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-change:
"%1\:3\:0\:\." "Micah Gideon Modell" 20030124T1350'><span style='mso-bookmark:
_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a name="_Toc10369244"><![if !supportLists]>3.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Software
Requirements</a></span></span></h1>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a
name="_Toc10369245"><![if !supportLists]>3.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Administration Requirements</a></span></span></h2>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:1\:0\:\.%3\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a
name="_Toc10369246"></a><a name="_What_elements_of"></a><![if !supportLists]><span
style='mso-bookmark:_Toc10369246'>3.1.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]><span style='mso-bookmark:_Toc10369246'>What elements
of the application need to be configurable?</span></span></span></h3>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l7 level1 lfo20;
mso-list-ins:"Micah Gideon Modell" 20030130T1445;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:45">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:41">Design/Development </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:40">Screening </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:18">Scorecard </ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:40">questions<o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l7 level1 lfo20;
mso-list-ins:"Micah Gideon Modell" 20030130T1445;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:45">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:41">Design/</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:40">Development</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-25T18:18"> Review
Scorecard questions</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:19"><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l7 level1 lfo20;
mso-list-ins:"Micah Gideon Modell" 20030225T1819;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:19">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-25T18:19">Scoring weights</ins><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T14:40"><o:p></o:p></ins></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l7 level1 lfo20;
mso-list-ins:"Micah Gideon Modell" 20030130T1445;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:45">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]>Project Schedules</span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l7 level1 lfo20;
mso-list-ins:"Micah Gideon Modell" 20030130T1445;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T14:45">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]>Board assignments including roles</span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1103'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'><a name="_Toc10369247"></a><a
name="_Configuration_Files"></a><![if !supportLists]><span style='mso-bookmark:
_Toc10369247'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:03">3.1.2<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><span style='mso-bookmark:_Toc10369247'><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:02">Configuration
Files<o:p></o:p></ins></span></span></span></h3>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1102'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><span
style='mso-bookmark:_Toc10369247'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:02">[List each configuration file utilized by this
application, a brief description of the file and, where applicable, the
component using it]<o:p></o:p></ins></span></span></span></p>

<h4 style='margin-left:.75in;text-indent:-.25in;mso-list:l6 level1 lfo22;
mso-list-ins:"Micah Gideon Modell" 20030207T1109;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><span
style='mso-bookmark:_Toc10369247'><![if !supportLists]><span style='font-family:
Symbol'><ins cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:09">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:02">&lt;&lt;File Name&gt;&gt; :
&lt;&lt;Description&gt;&gt; <o:p></o:p></ins></span></span></span></h4>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:2\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><span
style='mso-bookmark:_Toc10369247'><![if !supportLists]>3.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Technical
Constraints</span></span></span></h2>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:2\:0\:\.%3\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a
name="_Toc10369248"><![if !supportLists]>3.2.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Are there particular frameworks or standards that are
required?</a></span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'>JSP / EJB</span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:2\:0\:\.%3\:2\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a
name="_Toc10369249"><![if !supportLists]>3.2.2<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Third Party Component, Library, or Product Dependencies:</a></span></span></h3>

<p class=MsoNormal style='margin-left:.5in'><span style='mso-bookmark:_Toc10369264'><span
style='mso-bookmark:_Toc10369265'>TCS Website should be used for component and
user tables.</span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:2\:0\:\.%3\:3\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><a
name="_Toc10369250"><![if !supportLists]>3.2.3<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>QA Environment:</a></span></span></h3>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo24;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Solaris 7</span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo24;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>RedHat Linux 7.1</span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo24;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Windows 2000</span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo24;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>JBoss 3.0.4</span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo24;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T15:09">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]>Tomcat 4.1.12<span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T15:09"><o:p></o:p></del></span></span></span></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo24;
mso-list-ins:"Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-24T13:50">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></ins></span><![endif]><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:08"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></span></p>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:3\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">1.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Design </del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:27">Constraints</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></span></h2>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:3\:0\:\.%3\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369264'><span style='mso-bookmark:_Toc10369265'><![if !supportLists]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">1.1.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><![if !supportEmptyParas]>&nbsp;<![endif]></del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></span></h3>

<span style='mso-bookmark:_Toc10369264'></span>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l4 level1 lfo10;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">It is
required that all code be clearly commented.</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">All code must
adhere to javadoc standards, and, at minimum, include the @author, @param,
@return, @throws and @version tags.<span style="mso-spacerun: yes">� </span></del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l10 level2 lfo12;
mso-list-change:o "Micah Gideon Modell" 20030124T1350;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
"Courier New";mso-bidi-font-family:"Times New Roman"'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">When populating the author tag, use your TopCoder
member handle.<span style="mso-spacerun: yes">� </span>In addition, please do
not put in your email addresses.</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-.25in;mso-list:l10 level2 lfo12;
mso-list-change:o "Micah Gideon Modell" 20030124T1350;tab-stops:list 1.0in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
"Courier New";mso-bidi-font-family:"Times New Roman"'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Copyright tag: Copyright � 2002, TopCoder, Inc. All
rights reserved</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">For
standardization purposes, code must use a 4-space (not tab) indentation.</del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Do not use
the ConfigurationManager inside of EJB�s.<span style="mso-spacerun: yes">�
</span>The usage of the java.io.* package to read/write configuration files can
potentially conflict with a restrictive security scheme inside the EJB container.</del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l10 level1 lfo12;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span style='font-family:
Symbol'><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></span><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">All code must
adhere to the Code Conventions outlined in the following: </del></span></span><a
href="http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html"><span
style='mso-bookmark:_Toc10369265'><span style='mso-bidi-font-family:Tahoma'><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html</del></span></span></span><span
style='mso-bookmark:_Toc10369265'></span></a><span style='mso-bookmark:_Toc10369265'><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:3\:0\:\.%3\:2\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369265'><![if !supportLists]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:23">1.1.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Data</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:23">base
Standards:</del></span></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:23"><o:p></o:p></del></span></h3>

<h4 style='margin-left:0in;text-indent:0in;mso-list:l0 level4 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1123'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:23"><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">1.1.1.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></ins><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">Table and column
names should be as follows: table_name, not tableName.</del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></h4>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l9 level1 lfo14;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><![if !supportLists]><span
style='font-family:Symbol'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Every table must have a Primary Key.</del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49"><o:p></o:p></del></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l9 level1 lfo14;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .5in'><![if !supportLists]><span
style='font-family:Symbol'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-14T10:49">Always use Long (or database equivalent) for the
Primary Key.</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><o:p></o:p></del></span></p>

<p class=MsoNormal style='margin-left:.5in'><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49">For maximum
portability, database objects (table names, indexes, etc) should be kept to 18
characters or less.<span style="mso-spacerun: yes">� </span>Informix and DB2
have an 18-character limit.</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-14T10:49"><o:p></o:p></del></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:-.25in;mso-list:l2 level1 lfo8;
mso-list-ins:"Micah Gideon Modell" 20030130T1512;tab-stops:list .5in'><![if !supportLists]><span
style='font-family:Symbol'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:12"><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T15:54">�<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span></ins></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:54"><![if !supportEmptyParas]>&nbsp;<![endif]></del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:54"><o:p></o:p></del></span></p>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:4\:0\:" "Micah Gideon Modell" 20030124T1350'><a
name="_Toc10369268"><![if !supportLists]>3.3<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:16">Required</del></span><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:16">Included</ins>
Documentation</a></h2>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:4\:0\:\.%3\:1\:0\:" "Micah Gideon Modell" 20030124T1350'><a
name="_Toc10369269"><![if !supportLists]>3.3.1<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Design Documentation</a></h3>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo25;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Use-Case Diagram</p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo25;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Class Diagram</p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo25;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Sequence Diagram</p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo25;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Component Specification<ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-24T16:55">s/Requirements</ins></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo25;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Test Cases</p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l1 level1 lfo25;
mso-list-change:\F0B7 "Micah Gideon Modell" 20030124T1350;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol'>�<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Schema</p>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><a name="_Toc10369271"><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">Installation
and Usage<o:p></o:p></ins></a></h1>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">Install Notes<o:p></o:p></ins></span></h2>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1115'><span
style='mso-bookmark:_Toc10369271'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15">[List and explain all configuration parameters
and/or files that the application requires.]<o:p></o:p></ins></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.1.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">&lt;&lt;Installation
Note&gt;&gt;<o:p></o:p></ins></span></h3>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.2<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">Upgrade Notes<o:p></o:p></ins></span></h2>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1115'><span
style='mso-bookmark:_Toc10369271'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15">[If applicable, list and explain the procedure for
upgrading to this version.]<o:p></o:p></ins></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-text-indent-alt:0in;mso-list:
l0 level3 lfo2;mso-list-ins:"Micah Gideon Modell" 20030207T1115'><span
style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.2.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">&lt;&lt;Upgrade
Note&gt;&gt;<o:p></o:p></ins></span></h3>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.3<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">Usage Notes<o:p></o:p></ins></span></h2>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1115'><span
style='mso-bookmark:_Toc10369271'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15">[List and explain any issues to be aware of when
using an application conforming to this design.<span style="mso-spacerun:
yes">� </span>This includes, but is not limited to, expected resource usage,
unavoidable exception conditions.]<o:p></o:p></ins></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.3.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">&lt;&lt;Usage
Note&gt;&gt;<o:p></o:p></ins></span></h3>

<h2 style='margin-left:0in;text-indent:0in;mso-list:l0 level2 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1115'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">4.4<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">Uninstall
Notes<o:p></o:p></ins></span></h2>

<p class=InfoBlue style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1115'><span
style='mso-bookmark:_Toc10369271'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15">[List and explain the uninstall procedure or
requirements for the application.<span style="mso-spacerun: yes">� </span>For
instance, list any supporting files that may be put on the file-system for an
application to work properly (i.e. security key store).]<o:p></o:p></ins></span></p>

<h3 style='margin-left:0in;text-indent:0in;mso-list:l0 level3 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1118'><span style='mso-bookmark:_Toc10369271'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:18">4.4.1<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></ins><![endif]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">&lt;&lt;Uninstall
Note&gt;&gt;</ins><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:16"><o:p></o:p></ins></span></h3>

<p class=MsoNormal style='mso-list:none;mso-list-ins:"Micah Gideon Modell" 20030207T1116'><span
style='mso-bookmark:_Toc10369271'><ins cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15"><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></ins></span></p>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:4\:0\:\.%3\:2\:0\:" "Micah Gideon Modell" 20030124T1350'><span
style='mso-bookmark:_Toc10369271'><![if !supportLists]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">1.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></del></span><![endif]><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15">Installation Documentation</del></span></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15"><o:p></o:p></del></span></h1>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-ins:
"Micah Gideon Modell" 20030207T1118'><![if !supportLists]><ins
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:18"><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-02-07T11:15">1.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></del></span></ins><![endif]><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15">[Documentation
for installing the software package.]</del></span><span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-02-07T11:15"><o:p></o:p></del></span></h1>

<h1 style='margin-left:0in;text-indent:0in;mso-list:l0 level1 lfo2;mso-list-change:
"%1\:3\:0\:\.%2\:4\:0\:\.%3\:3\:0\:" "Micah Gideon Modell" 20030124T1350'><a
name="_Toc10369272"><![if !supportLists]>5.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><![endif]>Administration Documentation</a></h1>

<p class=InfoBlue>[Advanced help documentation on how to administer and
troubleshoot the application.]<span class=msoDel><del
cite="mailto:Micah%20Gideon%20Modell" datetime="2003-01-30T15:01"><o:p></o:p></del></span></p>

<p class=MsoNormal><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:01"><![if !supportEmptyParas]>&nbsp;<![endif]></del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:01"><o:p></o:p></del></span></p>

<p class=MsoNormal><span class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:01"><![if !supportEmptyParas]>&nbsp;<![endif]></del></span><span
class=msoDel><del cite="mailto:Micah%20Gideon%20Modell"
datetime="2003-01-30T15:01"><o:p></o:p></del></span></p>

<p class=InfoBlue style='margin-left:0in'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>

</div>

</body>

</html>


</xsl:stylesheet>

