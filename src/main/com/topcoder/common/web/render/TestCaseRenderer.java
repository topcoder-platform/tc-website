package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.TestCase;
import com.topcoder.shared.problem.ElementRenderer;

public class TestCaseRenderer implements ElementRenderer {

    private TestCase testCase = null;   

    public TestCaseRenderer(TestCase testCase) {
        this.testCase = testCase;
    }
    
    public String toHTML(Language language) {
        StringBuffer buf = new StringBuffer(256);

        buf.append("<table>");

        buf.append("<tr><td>");
        buf.append("<table>");
        String[] inputs = testCase.getInput();
        for(int i = 0; i < inputs.length; i++) {
            buf.append("<tr><td>");
            buf.append("<pre>");
            buf.append(breakIt(ProblemRenderer.encodeHTML(inputs[i])));
            buf.append("</pre>");
            buf.append("</td></tr>");
        }
        buf.append("</table>");
        buf.append("</td></tr>");

        buf.append("<tr><td>");
        buf.append("<pre>Returns: ");
        buf.append(ProblemRenderer.encodeHTML(breakIt(testCase.getOutput())));
        buf.append("</pre>");
        buf.append("</td></tr>");

        buf.append("<tr><td>");
        if(testCase.getAnnotation() != null) {
            buf.append("<table>");
            buf.append("<tr><td colspan=\"2\">");
            buf.append(testCase.getAnnotation().toHTML(language));
            buf.append("</td></tr>");
            buf.append("</table>");
        }
        buf.append("</td></tr>");

        buf.append("</table>");
        return buf.toString();
    }
  
    public String toPlainText(Language language) {
        return testCase.toPlainText(language);
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
            for (int i=0; i<s.length(); i++) {
                if (s.charAt(i)=='\"' && s.length() >= i && s.charAt(i+1)==',') {
                    out.append("\",\n");
                    i+=2;
                } else {
                    out.append(s.charAt(i));
                }
            }
        }
        return out.toString();
    }


}
