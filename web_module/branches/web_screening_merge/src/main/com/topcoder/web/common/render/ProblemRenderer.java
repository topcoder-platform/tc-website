package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

import java.awt.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.Problem</code>
 * @author Greg Paul
 */
public class ProblemRenderer extends BaseRenderer implements ElementRenderer {

    private Problem problem;
    private Color backgroundColor = null;
    private Color foregroundColor = null;

    private static final String LEGAL = "This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited.  (c)2005, TopCoder, Inc.  All rights reserved.  ";

    public ProblemRenderer() {
        this.problem = null;
    }

    /**
     * Takes the <code>Problem</code> to be rendered.
     * @param problem
     */
    public ProblemRenderer(Problem problem) {
        this.problem = problem;
    }

    public void setElement(Element element) throws Exception {
        problem = (Problem) element;
    }

    /**
     * Render the <code>Problem</code> in HTML.
     * @param language the language for all language specific information in the problem statement.
     * @return the problem statement
     */
    public String toHTML(Language language) throws Exception {
        StringBuffer html = new StringBuffer(1000);

        if (!problem.getProblemText().equals("")) {
            html.append(problem.getProblemText());
            html.append("<hr>");
        }
        ProblemComponent[] problemComponents = problem.getProblemComponents();
        ProblemComponentRenderer pcr = null;
        for (int i = 0; i < problemComponents.length&&problemComponents[i]!=null; i++) {
            pcr = new ProblemComponentRenderer(problemComponents[i]);
            pcr.setTdClass(getTdClass());
            html.append(pcr.toHTML(language));
            html.append("<hr>");
        }
        html.append("<p>");
        html.append(LEGAL);
        html.append("</p>");

        return html.toString();
    }

    /**
     * Render the <code>Problem</code> in plain text.
     * @param language the language for all language specific information in the problem statement.
     * @return the problem statement
     */
    public String toPlainText(Language language) throws Exception {
        StringBuffer text = new StringBuffer(1000);

        if (!problem.getProblemText().equals("")) {
            text.append(problem.getProblemText());
            text.append("\n\n\n");
        }

        ProblemComponent[] problemComponents = problem.getProblemComponents();
        for (int i = 0; i < problemComponents.length; i++) {
            text.append(new ProblemComponentRenderer(problemComponents[i]).toPlainText(language));
            text.append("\n\n\n");
        }

        text.append(LEGAL);
        return text.toString();

    }


    /**
     * Creates a hex string representing a <code>Color</code>
     * @param c the color we want to convert to a hex string
     * @return the color in hex
     */
    private String rgbColor(Color c) {
        String red = lpad(Integer.toString(c.getRed(), 16), '0', 2);
        String green = lpad(Integer.toString(c.getGreen(), 16), '0', 2);
        String blue = lpad(Integer.toString(c.getBlue(), 16), '0', 2);
        return red + green + blue;
    }

    /**
     * Pad a String on the left.
     * @param s the String to pad
     * @param c the character to pad the String with
     * @param len the intended length of the return String.
     * @return the String after having been padded
     */
    private String lpad(String s, char c, int len) {
        StringBuffer buf = new StringBuffer(len);
        for (int i = 0; i < len - s.length(); i++) {
            buf.append(c);
        }
        buf.append(s);
        return buf.toString();
    }


    /**
     * Set the background color to be used when rendering.
     * @param backgroundColor
     * @deprecated use a css style now
     */
    public void setBackgroundColor(Color backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    /**
     * Set the foreground (text) color to be used when rendering.
     * @param foregroundColor
     * @deprecated use a css style now
     */
    public void setForegroundColor(Color foregroundColor) {
        this.foregroundColor = foregroundColor;
    }

}

