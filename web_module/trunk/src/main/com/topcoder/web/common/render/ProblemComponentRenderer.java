package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.ProblemComponent</code>
 * @author Greg Paul
 */
public class ProblemComponentRenderer extends BaseRenderer implements ElementRenderer {

    private String SECTION_HEADER = "h3";
    private ProblemComponent problemComponent;
    private String LEFT_MARGIN = "&#160;&#160;&#160;&#160;";

    public ProblemComponentRenderer() {
        this.problemComponent = null;
    }

    /**
     * Takes the <code>ProblemComponent</code> to be rendered.
     * @param problemComponent
     */
    public ProblemComponentRenderer(ProblemComponent problemComponent) {
        this.problemComponent = problemComponent;
    }

    public void setElement(Element element) throws Exception {
        problemComponent = (ProblemComponent) element;
    }

    /**
     * Render the <code>Problem</code> in HTML.
     * @param language the language for all language specific information in the problem statement.
     * @return the problem component in html
     */
    public String toHTML(Language language) throws Exception {
        StringBuffer buf = new StringBuffer(4096);

        buf.append("<table>");

        /* Intro */
        buf.append("<tr>");
        buf.append("<td colspan=\"2\"");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        appendTag(buf, SECTION_HEADER, "Problem Statement");
        buf.append("</td>");
        buf.append("</tr>");
        if (problemComponent.getIntro() != null) {
            buf.append("<tr>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(LEFT_MARGIN);
            buf.append("</td>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(super.getRenderer(problemComponent.getIntro()).toHTML(language));
            buf.append("</td>");
            buf.append("</tr>");
        }

        /* Signature */
        buf.append("<tr><td colspan=\"2\"");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">&#160;</td></tr>");
        buf.append("<tr>");
        buf.append("<td colspan=\"2\"");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        appendTag(buf, SECTION_HEADER, "Definition");
        buf.append("</td>");
        buf.append("</tr>");
        buf.append("<tr>");
        buf.append("<td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        buf.append(LEFT_MARGIN);
        buf.append("</td>");
        buf.append("<td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        buf.append("<table>");
        buf.append("<tr>");
        buf.append("<td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">Class:</td>");
        buf.append("<td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        buf.append(problemComponent.getClassName());
        buf.append("</td>");
        buf.append("</tr>");


        int methodCount = problemComponent.getAllMethodNames().length;
        for (int i=(methodCount)>1?1:0; i<methodCount; i++) {
            buf.append("<tr><td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }

            buf.append(">Method:</td>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(problemComponent.getAllMethodNames()[i]);
            buf.append("</td>");
            buf.append("</tr>");
            buf.append("<tr><td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">Parameters:</td>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            DataType[] paramTypes = problemComponent.getAllParamTypes()[i];
            for (int j = 0; j < paramTypes.length; j++) {
                if (j > 0)
                    buf.append(", ");
                buf.append(new DataTypeRenderer(paramTypes[j]).toHTML(language));
            }
            buf.append("</td>");
            buf.append("</tr>");
            buf.append("<tr><td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">Returns:</td>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(new DataTypeRenderer(problemComponent.getAllReturnTypes()[i]).toHTML(language));

            buf.append("</td>");
            buf.append("</tr>");
            buf.append("<tr><td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">Method signature:</td>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(encodeHTML(language.getMethodSignature(problemComponent.getAllMethodNames()[i],
                    problemComponent.getAllReturnTypes()[i],
                    problemComponent.getAllParamTypes()[i],
                    problemComponent.getAllParamNames()[i])));
            buf.append("</td>");
            buf.append("</tr>");
            buf.append("<tr><td colspan=\"2\"");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">(be sure your method is public)</td></tr>");
        }

        buf.append("</table>");
        buf.append("</td>");
        buf.append("</tr>");







        /* Spec */
        if (problemComponent.getSpec() != null) {
            buf.append("<tr>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(LEFT_MARGIN);
            buf.append("</td>");
            buf.append("</tr>");
            buf.append("<tr>");
            buf.append("<td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(super.getRenderer(problemComponent.getSpec()).toHTML(language));
            buf.append("</td>");
            buf.append("</tr>");
        }

        /* Notes */
        Element[] notes = problemComponent.getNotes();
        if (notes != null && notes.length > 0) {
            buf.append("<tr><td colspan=\"2\"");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">&#160;</td></tr>");
            buf.append("<tr>");
            buf.append("<td colspan=\"2\"");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            appendTag(buf, SECTION_HEADER, "Notes");
            buf.append("</td>");
            buf.append("</tr>");
            for (int i = 0; i < notes.length; i++) {
                buf.append("<tr>");
                buf.append("<td align=\"center\" valign=\"top\"");
                if (getTdClass() != null) {
                    buf.append(" class=\"");
                    buf.append(getTdClass());
                    buf.append("\"");
                }
                buf.append(">");
                buf.append("-");
                buf.append("</td>");
                buf.append("<td");
                if (getTdClass() != null) {
                    buf.append(" class=\"");
                    buf.append(getTdClass());
                    buf.append("\"");
                }
                buf.append(">");
                buf.append(super.getRenderer(notes[i]).toHTML(language));
                buf.append("</td>");
                buf.append("</tr>");
            }
        }

        /* Constraints */
        Element[] constraints = problemComponent.getConstraints();
        if (constraints != null && constraints.length > 0) {
            buf.append("<tr><td colspan=\"2\"");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">&#160;</td></tr>");
            buf.append("<tr>");
            buf.append("<td colspan=\"2\"");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            appendTag(buf, SECTION_HEADER, "Constraints");
            buf.append("</td>");
            buf.append("</tr>");
            for (int i = 0; i < constraints.length; i++) {
                buf.append("<tr>");
                buf.append("<td align=\"center\" valign=\"top\"");
                if (getTdClass() != null) {
                    buf.append(" class=\"");
                    buf.append(getTdClass());
                    buf.append("\"");
                }
                buf.append(">");
                buf.append("-");
                buf.append("</td>");
                buf.append("<td");
                if (getTdClass() != null) {
                    buf.append(" class=\"");
                    buf.append(getTdClass());
                    buf.append("\"");
                }
                buf.append(">");
                buf.append(super.getRenderer(constraints[i]).toHTML(language));
                buf.append("</td>");
                buf.append("</tr>");
            }
        }

        /* Examples */
        TestCase[] testCases = problemComponent.getTestCases();
        if (testCases != null && testCases.length > 0) {
            boolean hasExamples = false;
            for (int i = 0; i < testCases.length && !hasExamples; i++) {
                hasExamples = testCases[i].isExample();
            }
            if (hasExamples) {
                buf.append("<tr><td colspan=\"2\"");
                if (getTdClass() != null) {
                    buf.append(" class=\"");
                    buf.append(getTdClass());
                    buf.append("\"");
                }
                buf.append(">&#160;</td></tr>");
                buf.append("<tr>");
                buf.append("<td colspan=\"2\"");
                if (getTdClass() != null) {
                    buf.append(" class=\"");
                    buf.append(getTdClass());
                    buf.append("\"");
                }
                buf.append(">");
                appendTag(buf, SECTION_HEADER, "Examples");
                buf.append("</td>");
                buf.append("</tr>");
                int count = 0;
                TestCaseRenderer tcr = null;
                for (int i = 0; i < testCases.length; i++) {
                    if (testCases[i].isExample()) {
                        buf.append("<tr>");
                        buf.append("<td align=\"center\" nowrap=\"true\"");
                        if (getTdClass() != null) {
                            buf.append(" class=\"");
                            buf.append(getTdClass());
                            buf.append("\"");
                        }
                        buf.append(">");
                        buf.append(count + ")");
                        buf.append("</td>");
                        buf.append("<td");
                        if (getTdClass() != null) {
                            buf.append(" class=\"");
                            buf.append(getTdClass());
                            buf.append("\"");
                        }
                        buf.append(">");
                        buf.append("</td>");
                        buf.append("</tr>");
                        buf.append("<tr>");
                        buf.append("<td");
                        if (getTdClass() != null) {
                            buf.append(" class=\"");
                            buf.append(getTdClass());
                            buf.append("\"");
                        }
                        buf.append(">");
                        buf.append(LEFT_MARGIN);
                        buf.append("</td>");
                        buf.append("<td");
                        if (getTdClass() != null) {
                            buf.append(" class=\"");
                            buf.append(getTdClass());
                            buf.append("\"");
                        }
                        buf.append(">");
                        tcr = new TestCaseRenderer(testCases[i]);
                        tcr.setTdClass(getTdClass());
                        buf.append(tcr.toHTML(language));
                        buf.append("</td>");
                        buf.append("</tr>");
                        count++;
                    }
                }
            }
        }
        buf.append("</table>");

        return buf.toString();

    }


    /**
     * Adds an html tag and some context to a <code>StringBuffer</code>.
     * ex: &lt;tag_name&gt;content&lt;/tag_name&gt;
     * @param buf the <code>StringBuffer</code>
     * @param tag the tag to add
     * @param content the content to add
     */
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

        for (int i = 0; i < text.length(); i++)
            switch (text.charAt(i)) {
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

    /**
     * Render the <code>Problem</code> in plain text.
     * @param language the language for all language specific information in the problem statement.
     * @return the problem component in plain text
     */
    public String toPlainText(Language language) throws Exception {
        StringBuffer text = new StringBuffer(4000);

        /* Intro */
        text.append("PROBLEM STATEMENT\n");
        if (problemComponent.getIntro() != null)
            text.append(super.getRenderer(problemComponent.getIntro()).toPlainText(language));

        /* Signature */
        text.append("\n\nDEFINITION");
        text.append("\nClass:");
        text.append(problemComponent.getClassName());





        int methodCount = problemComponent.getAllMethodNames().length;
        for (int i=(methodCount)>1?1:0; i<methodCount; i++) {

        text.append("\nMethod:");
        text.append(problemComponent.getAllMethodNames()[i]);
        text.append("\nParameters:");
        DataType[] paramTypes = problemComponent.getAllParamTypes()[i];
        for (int j = 0; j < paramTypes.length; j++) {
            if (j > 0)
                text.append(", ");
            text.append(new DataTypeRenderer(paramTypes[j]).toPlainText(language));
        }
        text.append("\nReturns:");
        text.append(new DataTypeRenderer(problemComponent.getAllReturnTypes()[i]).toPlainText(language));

        text.append("\nMethod signature:");
        text.append(language.getMethodSignature(problemComponent.getAllMethodNames()[i],
                problemComponent.getAllReturnTypes()[i],
                problemComponent.getAllParamTypes()[i],
                problemComponent.getAllParamNames()[i]));
        text.append("\n");
        }







        /* Spec */
        if (problemComponent.getSpec() != null)
            text.append(super.getRenderer(problemComponent.getSpec()).toPlainText(language));

        /* Notes */
        Element[] notes = problemComponent.getNotes();
        if (notes != null && notes.length > 0) {
            text.append("\n\nNOTES\n");
            for (int j = 0; j < notes.length; j++) {
                text.append("-");
                text.append(super.getRenderer(notes[j]).toPlainText(language));
                text.append("\n");
            }
        }

        /* Constraints */
        Element[] constraints = problemComponent.getConstraints();
        if (constraints != null && constraints.length > 0) {
            text.append("\n\nCONSTRAINTS\n");
            for (int j = 0; j < constraints.length; j++) {
                text.append("-");
                text.append(super.getRenderer(constraints[j]).toPlainText(language));
                text.append("\n");
            }
        }

        /* Examples */

        TestCase[] testCases = problemComponent.getTestCases();
        if (testCases != null && testCases.length > 0) {
            text.append("\n\nEXAMPLES\n");
            int count = 0;
            for (int j = 0; j < testCases.length; j++)
                if (testCases[j].isExample()) {
                    text.append("\n" + count + ")\n");
                    text.append(new TestCaseRenderer(testCases[j]).toPlainText(language));
                    text.append("\n");
                    count++;
                }
        }
        return super.removeHtmlTags(text.toString());
    }
}
