<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
            
            <jsp:include page="/page_title.jsp" >
               <jsp:param name="image" value="algorithm"/>
               <jsp:param name="title" value="Introduction Event"/>
            </jsp:include>

            <div style="float:right; margin-top: 6px;"><a href="/tc?module=Static&amp;d1=help&amp;d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></a></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for GuitarChords</h2>

            <div>
            <strong>
            Problem Statement 
            | <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=guitarChordsSol" class="bcLink">Solution</a>
            </strong>
            </div>
            
            <table>
                <tbody>
                    <tr>
                        <td colspan="2"><h3>Problem Statement</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <p>Musical notes are are given the following 12 names, in ascending order:</p>
                            <pre>A, A#, B, C, C#, D, D#, E, F, F#, G, G#</pre>
                            <p>The names repeat for higher and lower notes, so the note one step higher than "G#" is "A" and the note 5 steps lower than "B" is "F#". Notes that are a multiple of 12 steps apart have the same name, and for our purposes we will consider them equivalent.</p>
                            <p>Guitars have a number of strings, and each string is tuned to sound one of the 12 notes. The note each string sounds is called its "open" note. Underneath the strings are <em>frets</em>, numbered starting at 1, which are used to change the note a string sounds. If you press a string against the i-th fret with your finger, the note will be i steps higher than the string's open note. (i.e., if you press a string tuned to "C#" against the 3rd fret, it will sound the note "E").</p>
                            <p><em>Chords</em> are sets of notes played at the same time. To play a chord on a guitar, each string must sound one of the notes in the chord, and each note in the chord must be played on at least one string.</p>
                            <p>There can be many ways to play the same chord. We measure the difficulty of one way to play a chord as the amount you must stretch your fingers to reach the required frets. Calculate this as the lowest fret used subtracted from the highest fret used, plus 1. Only consider the strings which are pressed against frets -- the strings that are not pressed against frets (and, thus, sound their open note) do not affect the difficultly of a chord. If a chord can be played without using any frets at all, its difficulty is zero.</p>
                            <p>You are given a String[] strings, each element of which is the open note of one string on the guitar, and a String[] chord, each element of which is one note in a chord. Return the lowest possible difficulty value necessary to play that chord.</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Definition</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Class:</td>
                                        <td>GuitarChords</td>
                                    </tr>
                                    <tr>
                                        <td>Method:</td>
                                        <td>stretch</td>
                                    </tr>
                                    <tr>
                                        <td>Parameters:</td>
                                        <td>String[], String[]</td>
                                    </tr>
                                    <tr>
                                        <td>Returns:</td>
                                        <td>int</td>
                                    </tr>
                                    <tr>
                                        <td>Method signature:</td>
                                        <td>int stretch(String[] strings, String[] chord)</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">(be sure your method is public)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Constraints</h3></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><strong>strings</strong> and <strong>chord</strong> will each contain between 1 and 6 elements, inclusive.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><strong>chord</strong> will not contain more elements than <strong>strings</strong>.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Each element of <strong>strings</strong> and <strong>chord</strong> will be one of the 12 note names given in the problem statement.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><strong>chord</strong> will not contain any duplicate elements.</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Examples</h3></td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">0)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{ "A", "C", "F" }

{ "C#", "F#", "A#" }</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 1</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">The three notes in the chord are each one step higher than the notes played by the three strings. So, you can play this chord by putting your finger on the 1st fret on all three strings. The answer is therefore: (1-1)+1.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">1)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{ "E", "A", "D", "G", "B", "E" }

{ "E", "G#", "B" }</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 2</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">The best way to play this chord is with your fingers on the following frets:
                                                            <pre>string 0, "E": no fret, plays note "E"
string 1, "A": fret #2, plays note "B"
string 2, "D": fret #2, plays note "E"
string 3, "G": fret #1, plays note "G#"
string 4, "B": no fret, plays note "B"
string 5, "E": no fret, plays note "E"</pre>
All strings are playing a note in the chord, and each note in the chord is played on at least one string. The largest-numbered fret is 2, and the smallest is 1. Therefore the answer is (2-1)+1.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">2)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{ "D#" }

{ "D#" }</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 0</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">3)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{ "E", "F" }

{ "F#", "D#" }</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 3</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">You can play this chord with the 11th fret of the "E" string (playing the note "D#") and the 13th fret of the "F" string (playing the note "F#"). (13-11)+1 = 3.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">4)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{ "C", "C", "C" }

{ "C", "E", "G" }</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 4</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            
            <hr><p>This problem statement is the exclusive and proprietary property of TopCoder, Inc. Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited. &copy;2006, TopCoder, Inc. All rights reserved. </p></hr>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>