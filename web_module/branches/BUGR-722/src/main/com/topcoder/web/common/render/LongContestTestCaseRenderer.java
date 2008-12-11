package com.topcoder.web.common.render;

import com.topcoder.shared.problem.ElementRenderer;
import com.topcoder.shared.problem.TestCase;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.language.Language;

/**
 * @author dok
 * @version $Revision: 56347 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 15, 2006
 */
public class LongContestTestCaseRenderer extends BaseRenderer implements ElementRenderer {

    private TestCase testCase;

    public LongContestTestCaseRenderer() {
        this.testCase = null;
    }

    public LongContestTestCaseRenderer(TestCase testCase) {
        this.testCase = testCase;
    }

    public void setElement(Element element) throws Exception {
        testCase = (TestCase) element;
    }

    public String toHTML(Language language) throws Exception {
        StringBuffer buf = new StringBuffer(256);

        buf.append("<table>");

/*        buf.append("<tr><td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        buf.append("<table>");
        String[] inputs = testCase.getInput();
        for (int i = 0; i < inputs.length; i++) {
            buf.append("<tr><td");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append("<pre>");
            buf.append(BaseRenderer.encodeHTML(inputs[i]));
            buf.append("</pre>");
            buf.append("</td></tr>");
        }
        buf.append("</table>");
        buf.append("</td></tr>");*/

        buf.append("<tr><td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
//        buf.append("<pre>Returns: ");
        buf.append("<pre>");
//        buf.append(BaseRenderer.encodeHTML(breakIt(testCase.getOutput())));
        String output = testCase.getOutput();
        //pretty printer is enclosing it in double quotes, we're removing them here.  would be nice if there was a less crappy solution
        buf.append(output.substring(1, output.length()-1));
        buf.append("</pre>");
        buf.append("</td></tr>");

        buf.append("<tr><td");
        if (getTdClass() != null) {
            buf.append(" class=\"");
            buf.append(getTdClass());
            buf.append("\"");
        }
        buf.append(">");
        if (testCase.getAnnotation() != null) {
            buf.append("<table>");
            buf.append("<tr><td colspan=\"2\"");
            if (getTdClass() != null) {
                buf.append(" class=\"");
                buf.append(getTdClass());
                buf.append("\"");
            }
            buf.append(">");
            buf.append(super.getRenderer(testCase.getAnnotation()).toHTML(language));
            buf.append("</td></tr>");
            buf.append("</table>");
        }
        buf.append("</td></tr>");

        buf.append("</table>");
        return buf.toString();
    }

    public String toPlainText(Language language) throws Exception {
        StringBuffer buf = new StringBuffer(256);

/*        for (int i = 0; i < testCase.getInput().length; i++) {
            buf.append(testCase.getInput()[i]);
            buf.append("\n");
        }
        buf.append("\nReturns: ");*/
        buf.append(testCase.getOutput());
        if (testCase.getAnnotation() != null) {
            buf.append("\n\n");
            buf.append(super.getRenderer(testCase.getAnnotation()).toPlainText(language));
        }
        return buf.toString();


    }

    /* hopefully a temp hoke so that we don't have to stretch out the
     * screen.  the problem is text that is i a pre tag blows out the screen.
     * generally this is a non-issue, but for String arrays it can become an issue
     * if u have large elements.  so, breakIt goes through a string and looks for
     * ", which should indicate the end of an string element in an array.  it
     * then appends a line return immediately following the ,
     */
    private String breakIt(String s) {
        int breakLen = 80;
        StringBuffer out = new StringBuffer(s);
        if (s.length() > breakLen) {
            out = new StringBuffer(s.length());
            out.append("\n");
            for (int i = 0; i < s.length(); i++) {
                if (s.charAt(i) == '\"' && s.length() > i + 1 && s.charAt(i + 1) == ',') {
                    out.append("\",\n");
                    i += 2;
                } else {
                    out.append(s.charAt(i));
                }
            }
        }
        return out.toString();
    }


}
