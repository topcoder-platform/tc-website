<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Forums - Search Tips</title>
    <style type="text/css">
    * {
        font-family : arial, helvetica, sans-serif;
        font-size : 10pt;
    }
    .header {
        border-bottom : 1px #ccc solid;
    }
    .title {
        font-family : arial;
        font-size : 14pt;
        font-weight : bold;
    }
    .close A, .close A:visited {
        font-family : verdana, arial, helvetica, sans-serif;
        font-size : 8pt;
        white-space : nowrap;
        color : #00f;
    }
    .nav, .nav A {
        font-family : verdana;
        font-size : 8pt;
    }
    .nav A, .nav A:visited {
        color : #00f;
        text-decoration : underline;
    }
    .nav A:hover {
        color : #00f;
        text-decoration : none;
    }
    H4 {
        font-size : 11pt;
        font-weight : bold;
    }
    H5 {
        font-size : 10pt;
        font-weight : bold;
    }
    TT {
        font-size : 10pt;
        font-family : courier new, monospace;
        font-weight : bold;
        color : #66f;
    }
    blockquote {
        border : 1px #ccc solid;
        -moz-border-radius : 2px;
        padding : 3px;
        margin-left : 5%;
        margin-right : 25%;
        background-color : #eee;
    }
    </style>
</head>
<body>

<div class="header">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tbody>
    <tr>
        <td width="99%" class="title">
            Search Tips
        </td>
        <td width="1%" class="close">
            <a href="#" onclick="window.close();return false;">Close Window</a>
        </td>
    </tr>
</tbody>
</table>
</div>

<!-- ======================================================================= -->

<h4><a name="basic"></a>Basic Searches</h4>

<p>
To do a basic search, enter some search terms. For example:
</p>

    <blockquote><tt>black cat adoption</tt></blockquote>
    
<p>
This will search for documents containing the words <tt>black</tt>, <tt>cat</tt>
or <tt>adoption</tt>.
</p>

<br>

<!-- ======================================================================= -->
    
<h4><a name="grouping"></a>Grouping</h4>

<p>
You can group search terms using parentheses to for sub queries. For example,
to find results about different colors of cats, try the following:
</p>

    <blockquote><tt>(black OR orange OR white) AND cat</tt></blockquote>
    
<p>For more explanation on the <tt>OR</tt> and <tt>AND</tt> operators
see below in the "Boolean operators" section.</p>
    
<br>

<!-- ======================================================================= -->

<h4><a name="wildcard"></a>Wildcard Searches</h4>

<p>Wilcard searches let you look for parts of words. 
The single character wildcard search (<tt>?</tt>) looks for terms that match that
with the single character replaced. For example, to search for "<tt>text</tt>"
or "<tt>test</tt>" you can use the search:</p>

    <blockquote><tt>te?t</tt></blockquote>

<p>Multiple character wildcard searches (<tt>*</tt>) looks for 0 or more characters. For
example, to search for <tt>test</tt>, <tt>tests</tt> or <tt>tester</tt>, you can use the search:</p>

    <blockquote><tt>test*</tt></blockquote>

<p>You can also use the wildcard searches in the middle of a term.</p>

    <blockquote><tt>te*t</tt></blockquote>

<p>Note: You cannot use a <tt>*</tt> or <tt>?</tt> symbol as the first character of a search.</p>

<br>

<!-- ======================================================================= -->

<h4><a name="fuzzy"></a>Fuzzy Searches</h4>

<p>Fuzzy searches return results that match your search terms exactly as well
as results that are close. For example, if you want to find a word that
is similar to <tt>foam</tt> add a tilde (<tt>~</tt>) to your search term:
</p>

    <blockquote><tt>foam~</tt></blockquote>
    
<p>This search will match terms like <tt>foam</tt> and <tt>roams</tt>.</p>

<br>

<!-- ======================================================================= -->

<h4><a name="proximity"></a>Proximity Searches</h4>

<p>
Proximity searches help you find words that are close to each other. For
example, if you know the word "<tt>new</tt>" and "<tt>car</tt>" are within
5 words of each other you can write your query like this:
</p>

    <blockquote><tt>"new car"~5</tt></blockquote>
    
<br>

<!-- ======================================================================= -->

<h4><a name="boosting"></a>Boosting a Term</h4>

<p>
Boosting a search term gives it more weight in the result list. For example,
if you search for "<tt>black cat</tt>" you might get results about black
paint and cats but not necessarily black cats. In this case, we want to tell
the search engine to weight the word "cat" more heavily: 
</p>

    <blockquote><tt>black cat^4</tt></blockquote>
    
<p>
You can also boost phrases:
</p>

    <blockquote><tt>"black cat"^4 adopt</tt></blockquote>
    
<p>
You can use any number to boost the term -- the higher the number the higher
the boosting. For example, if the query above still returns too many
results, consider increasing the boost value:
</p>
    
    <blockquote><tt>"black cat"^6 adopt</tt></blockquote>
    
<br>

<!-- ======================================================================= -->

<h4><a name="boolean"></a>Boolean operators</h4>

<p>
Boolean operators allow terms to be combined for more advanced searches.
The terms <tt>AND</tt>, <tt>+</tt>, <tt>OR</tt>, <tt>NOT</tt> and <tt>-</tt>
are supported. Note, these  terms must be in ALL CAPS to distinguish them
from normal words.
</p>

<h5>OR</h5>

<p>
The <tt>OR</tt> operator links two terms and finds a matching document if
either of the terms exist in a document. Note, the symbol <tt>||</tt>
can be used in place or the word <tt>OR</tt>.
To search for documents that contain either "black cat" or just "cat adoption"
use the query:
</p>

    <blockquote><tt>"black cat" OR "cat adoption"</tt></blockquote>
    
<p>or</p>
    
    <blockquote><tt>"black cat" || "cat adoption"</tt></blockquote>
    
<p>Note, <tt>OR</tt> is the default search term, so this search is equivalent:</p>
    
    <blockquote><tt>"black cat" "cat adoption"</tt></blockquote>
    

<h5>AND</h5>

<p>
The <tt>AND</tt> operator matches documents where both terms in the text of the 
document. The symbol <tt>&amp;&amp;</tt> can be used in place of the word
<tt>AND</tt>. This is a more restrictive search than an <tt>OR</tt> search.
To search for documents that contain "black cat" and "cat adoption" use the 
query:
</p>

    <blockquote><tt>"black cat" AND "cat adoption"</tt></blockquote>
    
<p>or</p>
    
    <blockquote><tt>"black cat" &amp;&amp; "cat adoption"</tt></blockquote>
    
    
<h5>The "+" Keyword</h5>

<p>
The <tt>+</tt> operator tells the search engine that the search term must
appear in a document to be a match. To search for documents that must contain 
"black cat" and may contain "cat adoption" use the query:
</p>

    <blockquote><tt>+"black cat" "cat adoption"</tt></blockquote>


<h5>NOT</h5>    

<p>
The <tt>NOT</tt> operator excludes documents that contain terms after <tt>NOT</tt>.
The <tt>!</tt> symbol can be used in place of the word <tt>NOT</tt>.
To search for documents that contain "black cat" but not "cat adoption" use the query:</p>

    <blockquote><tt>"black cat" NOT "cat adoption"</tt></blockquote>

<p>or</p>
    
    <blockquote><tt>"black cat" ! "cat adoption"</tt></blockquote>

<p>Note: The NOT operator must be used with multiple terms. For example, the following
search will return no results:</p>

    <blockquote><tt>NOT "black cat"</tt></blockquote>

    
<h5>The "-" Keyword</h5>

<p>The <tt>-</tt> operator excludes documents that contain the term after the "-" symbol.
To search for documents that contain "black cat" but not "cat adoption" use the query:</p>

    <blockquote><tt>"black cat" -"cat adoption"</tt></blockquote>

<br>

<!-- ======================================================================= -->

<h4><a name="escaping"></a>Escaping Special Characters</h4>

<p>There are a number of special characters that are part of the query syntax.
The current list special characters are</p>

    <blockquote><tt>+ - &amp;&amp; || ! ( ) { } [ ] ^ " ~ * ? : \</tt></blockquote>

<p>To escape these character use the <tt>\</tt> before the character. For example to
search for <tt>(1+1):2</tt> use the query:</p>

    <blockquote><tt>\(1\+1\)\:2</tt></blockquote>
    
<br>

</body>
</html>
