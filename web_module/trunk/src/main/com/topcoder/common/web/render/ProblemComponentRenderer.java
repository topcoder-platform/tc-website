package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

public class ProblemComponentRenderer implements ElementRenderer {

    private String SECTION_HEADER = "h3";
    private ProblemComponent problemComponent = null;   
    private String LEFT_MARGIN = "&#160;&#160;&#160;&#160;";

    public ProblemComponentRenderer(ProblemComponent problemComponent) {
        this.problemComponent = problemComponent;
    }
    
    public String toHTML(Language language) {
        StringBuffer buf = new StringBuffer(4096);

        buf.append("<table>");

        /* Intro */
        buf.append(  "<tr>");
        buf.append(    "<td colspan=\"2\">");
        appendTag(buf, SECTION_HEADER, "Problem Statement");
        buf.append(    "</td>");
        buf.append(  "</tr>");
        if(problemComponent.getIntro() != null) {
            buf.append("<tr>");
            buf.append(  "<td>");
            buf.append(LEFT_MARGIN);
            buf.append(  "</td>");
            buf.append(  "<td>");
            buf.append(problemComponent.getIntro().toHTML(language));
            buf.append(  "</td>");
            buf.append("</tr>");
        }

        /* Signature */
        buf.append("<tr>");
        buf.append(  "<td colspan=\"2\">");
        appendTag(buf, SECTION_HEADER, "Definition");
        buf.append(  "</td>");
        buf.append("</tr>");
        buf.append("<tr>");
        buf.append(  "<td>");
        buf.append(LEFT_MARGIN);
        buf.append(  "</td>");
        buf.append(  "<td>");
        buf.append(    "<table>"); 
        buf.append(      "<tr>");
        buf.append(        "<td>Class:</td>");
        buf.append(        "<td>");
        buf.append(problemComponent.getClassName());
        buf.append(        "</td>");
        buf.append(      "</tr>");
        buf.append(      "<tr><td>Method:</td>");
        buf.append(        "<td>");
        buf.append(problemComponent.getMethodName());
        buf.append(        "</td>");
        buf.append(      "</tr>");
        buf.append(      "<tr><td>Parameters:</td>");
        buf.append(        "<td>");
        Element[] paramTypes = problemComponent.getParamTypes();
        for(int i = 0; i < paramTypes.length; i++) {
            if(i > 0)
                buf.append(", ");
            buf.append(paramTypes[i].toHTML(language));
        }
        buf.append(        "</td>");
        buf.append(      "</tr>");
        buf.append(      "<tr><td>Returns:</td>");
        buf.append(        "<td>");
        buf.append(problemComponent.getReturnType().toHTML(language));

        buf.append(        "</td>");
        buf.append(      "</tr>");
        buf.append(      "<tr><td>Method signature:</td>");
        buf.append(        "<td>");
        buf.append(encodeHTML(language.getMethodSignature(problemComponent.getMethodName(), 
                                                          problemComponent.getReturnType(), 
                                                          problemComponent.getParamTypes(), 
                                                          problemComponent.getParamNames())));
        buf.append(        "</td>");
        buf.append(      "</tr>");
        buf.append(      "<tr><td colspan=\"2\">(be sure your method is public)</td></tr>");
        buf.append(    "</table>");
        buf.append(  "</td>");
        buf.append("</tr>");

        /* Spec */
        if(problemComponent.getSpec() != null) {
            buf.append("<tr>");
            buf.append(  "<td>");
            buf.append(LEFT_MARGIN);
            buf.append(  "</td>");
            buf.append("</tr>");
            buf.append("<tr>");
            buf.append(  "<td>");
            buf.append(problemComponent.getSpec().toHTML(language));
            buf.append(  "</td>");
            buf.append("</tr>");
        }

        /* Notes */
        Element[] notes = problemComponent.getNotes();
        if(notes !=null && notes.length > 0) {
            buf.append("<tr>");
            buf.append(  "<td colspan=\"2\">");
            appendTag(buf, SECTION_HEADER, "Notes");
            buf.append(  "</td>");
            buf.append("</tr>");
            for(int i = 0; i < notes.length; i++) {
                buf.append("<tr>");
                buf.append(  "<td align=\"center\" valign=\"top\">");
                buf.append(    "-");
                buf.append(  "</td>");
                buf.append(  "<td>");
                buf.append(notes[i].toPlainText(language));
                buf.append(  "</td>");
                buf.append("</tr>");
            }
        }

        /* Constraints */
        Element[] constraints = problemComponent.getConstraints();
        if(constraints != null && constraints.length > 0) {
            buf.append("<tr>");
            buf.append(  "<td colspan=\"2\">");
            appendTag(buf, SECTION_HEADER, "Constraints");
            buf.append(  "</td>");
            buf.append("</tr>");
            for(int i = 0; i < constraints.length; i++) {
                buf.append("<tr>");
                buf.append(  "<td align=\"center\" valign=\"top\">");
                buf.append(    "-");
                buf.append(  "</td>");
                buf.append(  "<td>");
                buf.append(constraints[i].toPlainText(language));
                buf.append(  "</td>");
                buf.append("</tr>");
            }
        }

        /* Examples */
        TestCase[] testCases = problemComponent.getTestCases();
        if(testCases != null && testCases.length > 0) {
            boolean hasExamples = false;
            for(int i = 0; i < testCases.length&&!hasExamples; i++) {
                hasExamples = testCases[i].isExample();
            }
            if (hasExamples) {
                buf.append("<tr>");
                buf.append(  "<td colspan=\"2\">");
                appendTag(buf, SECTION_HEADER, "Examples");
                buf.append(  "</td>");
                buf.append("</tr>");
                int count = 0;
                for(int i = 0; i < testCases.length; i++) {
                    if(testCases[i].isExample()) {
                        buf.append("<tr>");
                        buf.append(  "<td align=\"center\" nowrap=\"true\">");
                        buf.append(    count+")");
                        buf.append(  "</td>");
                        buf.append(  "<td>");
                        buf.append(  "</td>");
                        buf.append("</tr>");
                        buf.append("<tr>");
                        buf.append(  "<td>");
                        buf.append(LEFT_MARGIN);
                        buf.append(  "</td>");
                        buf.append(  "<td>");
                        buf.append(new TestCaseRenderer(testCases[i]).toHTML(language));
                        buf.append(  "</td>");
                        buf.append("</tr>");
                        count++;
                    }
                }
            }
        }
        buf.append("</table>");

      return buf.toString();

    }
  
    static void appendTag(StringBuffer buf, String tag, String content) {
        buf.append('<');
        buf.append(tag);
        buf.append('>');
        buf.append(content);
        buf.append("</");
        buf.append(tag);
        buf.append('>');
    }
    /**
     * Utility function for encoding HTML entities in text.  All occurrences of the &lt;, &gt;,
     * and &amp; characters are converted to &amp;lt;, &amp;gt;, and &amp;amp;, respectively.
     */
    static public String encodeHTML(String text) {
        StringBuffer buf = new StringBuffer(text.length());

        for(int i = 0; i < text.length(); i++)
            switch(text.charAt(i)) {
                case '&':
                    buf.append("&amp;");
                    break;
                case '<':
                    buf.append("&lt;");
                    break;
                case '>':
                    buf.append("&gt;");
                    break;
                case '"':
                    buf.append("&quot;");
                    break;
                default:
                    buf.append(text.charAt(i));
            }
        return buf.toString();
    }

    public String toPlainText(Language language) {
        StringBuffer text = new StringBuffer(4000);

        /* Intro */
        text.append("PROBLEM STATEMENT\n");
        if (problemComponent.getIntro() != null)
            text.append(problemComponent.getIntro().toPlainText(language));

        /* Signature */
        text.append("\n\nDEFINITION");
        text.append("\nClass:");
        text.append(problemComponent.getClassName());
        text.append("\nMethod:");
        text.append(problemComponent.getMethodName());
        text.append("\nParameters:");
        Element[] paramTypes = problemComponent.getParamTypes();
        for (int j = 0; j < paramTypes.length; j++) {
            if (j > 0)
                text.append(", ");
            text.append(paramTypes[j].toPlainText(language));
        }
        text.append("\nReturns:");
        text.append(problemComponent.getReturnType().toPlainText(language));

        text.append("\nMethod signature:");
        text.append(language.getMethodSignature(problemComponent.getMethodName(),
                                                problemComponent.getReturnType(), 
                                                problemComponent.getParamTypes(), 
                                                problemComponent.getParamNames()));
        text.append("\n");

        /* Spec */
        if(problemComponent.getSpec() != null)
            text.append(problemComponent.getSpec().toPlainText(language));

        /* Notes */
        Element[] notes = problemComponent.getNotes();
        if(notes !=null && notes.length > 0) {
            text.append("\n\nNOTES\n");
            for (int j = 0; j < notes.length; j++) {
                text.append("-");
                text.append(notes[j].toPlainText(language));
                text.append("\n");
            }
        }

        /* Constraints */
        Element[] constraints = problemComponent.getConstraints();
        if(constraints != null && constraints.length > 0) {
            text.append("\n\nCONSTRAINTS\n");
            for (int j = 0; j < constraints.length; j++) {
                text.append("-");
                text.append(constraints[j].toPlainText(language));
                text.append("\n");
            }
        }

        /* Examples */

        TestCase[] testCases = problemComponent.getTestCases();
        if(testCases != null && testCases.length > 0) {
            text.append("\n\nEXAMPLES\n");
            for (int j = 0; j < testCases.length; j++)
                if (testCases[j].isExample()){
                    text.append("\n"+(j+1)+")\n");
                    text.append(testCases[j].toPlainText(language));
                    text.append("\n");
                }
        }


        /* TODO big ol nasty hack, when all the elements have true toPlainText() methods, this can be wacked. */
        int TEXT = 0;
        int TAG = 1;
        int VECTOR = 2;//quick hack for C++ type vector
        int state = TEXT;
        String vec = "vector";
        StringBuffer buf = new StringBuffer(1000);
        for(int i = 0; i<text.length(); i++) {
            char ch = text.charAt(i);
            if (state==TAG) {
                if(ch=='>')state = TEXT;
            } else if (state == TEXT) {
                int j = 0;
                for(; j<vec.length()&&i+j<text.length(); j++) {
                    if (vec.charAt(j)!=text.charAt(i+j)) 
                        break;
                }
                if (j == vec.length()) {
                    if (i+j<text.length()) {
                        if (Character.isWhitespace(text.charAt(i+j)))
                            j++;
                    }
                    if (text.charAt(i+j)=='<') {
                        i = i+j-1;
                        buf.append(vec);
                        buf.append(' ');
                        state = VECTOR;
                        continue;
                    }
                }
                if (ch == '<') {
                    int p = 0;
                    for (j = i+1; j<text.length();j++) {
                        if (text.charAt(j)=='>') {
                            break;
                        } else if (Character.isLetter(text.charAt(j)) && 
                                 (text.charAt(j) !='p' && text.charAt(j)!='P')) {
                            p = 2;
                            break;
                        } else p++;
                    }
                    if (p==1) {
                        buf.append("\n\n");
                    }
                    state = TAG;
                } else if (ch=='&') {
                    if (i+1 < text.length()) {
                        ch = text.charAt(++i);
                        if(ch=='l') {
                            buf.append('<');
                            i = i+2;
                        }else if(ch == 'g') {
                            buf.append('>');
                            i = i+2;
                        }else if(ch == 'q') {
                            buf.append('"');
                            i = i+4;
                        }else if(ch == 'a') {
                            buf.append('&');
                            i = i+3;
                        }
                    }
                } else {
                   buf.append(ch);
                }
           } else if (state == VECTOR) {
               buf.append(ch);
               if (ch=='>')  
                   state = TEXT;
           }
      }
      return buf.toString();
    }
}
