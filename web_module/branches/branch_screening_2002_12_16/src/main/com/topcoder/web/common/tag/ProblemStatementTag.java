package com.topcoder.web.common.tag;

import java.awt.Color;
import java.io.StringReader;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.Language;

import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;

import com.topcoder.common.web.render.ProblemRenderer;


public class ProblemStatementTag extends TagSupport {

    private Color textColor = Color.BLACK;
    private String text;
    private Language language;

    /**
     * Sets the value of <code>textColor</code>.
     *
     * @param textColor
     */
    public void setTextColor( String val )
    {
        if(val != null) {
            if(val.startsWith("#") && val.length() == 7) {
                textColor = parseColor(val);
            }
            else if(val.equalsIgnoreCase("black")) {
                textColor = Color.BLACK;
            }
            else if(val.equalsIgnoreCase("white")) {
                textColor = Color.WHITE;
            }
            else if(val.equalsIgnoreCase("blue")) {
                textColor = Color.BLUE;
            }
            else if(val.equalsIgnoreCase("cyan")) {
                textColor = Color.CYAN;
            }
            else if(val.equalsIgnoreCase("dark_gray") || 
                    val.equalsIgnoreCase("darkgray")) {
                textColor = Color.DARK_GRAY;
            }
            else if(val.equalsIgnoreCase("gray")) {
                textColor = Color.GRAY;
            }
            else if(val.equalsIgnoreCase("green")) {
                textColor = Color.GREEN;
            }
            else if(val.equalsIgnoreCase("light_gray") || 
                    val.equalsIgnoreCase("lightgray")) {
                textColor = Color.LIGHT_GRAY;
            }
            else if(val.equalsIgnoreCase("magenta")) {
                textColor = Color.MAGENTA;
            }
            else if(val.equalsIgnoreCase("orange")) {
                textColor = Color.ORANGE;
            }
            else if(val.equalsIgnoreCase("pink")) {
                textColor = Color.PINK;
            }
            else if(val.equalsIgnoreCase("red")) {
                textColor = Color.RED;
            }
            else if(val.equalsIgnoreCase("yellow")) {
                textColor = Color.YELLOW;
            }
        }
    }

    /**
     * Sets the value of <code>text</code>.
     *
     * @param text
     */
    public void setText( String val )
    {
        text = val;
    }

    /**
     * Sets the value of <code>language</code>.
     *
     * @param language
     */
    public void setLanguage( String val )
    {
        if(val != null) {
            if(val.equals(JavaLanguage.DESCRIPTION)) {
                language = JavaLanguage.JAVA_LANGUAGE;
            }
            else if(val.equals(CPPLanguage.DESCRIPTION)) {
                language = CPPLanguage.CPP_LANGUAGE;
            }
            else if(val.equals(CSharpLanguage.DESCRIPTION)) {
                language = CSharpLanguage.CSHARP_LANGUAGE;
            }
        }
    }

    /** 
     * Method specific to JSP Tags.  Validates inputs and writes out property
     * if possible.  If it is not possible because bean does not exist, exits
     * quietly
     * 
     * @return The JSP Tag specific return specifying the next action
     *          (Should always return SKIP_BODY)
     * @throws JspException Thrown if name and property are not set or if
     *                  there is IO trouble writing out the tag.
     */
    public int doStartTag() throws JspException {
        if(text == null) {
            throw new JspException("Text must be set");
        }
        if(language == null) {
            throw new JspException(
                    "Language is not set or set to invalid value");
        }
        StringReader reader = new StringReader(text);
        ProblemComponent arrProblemComponent[] = new ProblemComponent[1];
        arrProblemComponent[0] = 
            new ProblemComponentFactory().buildFromXML(reader, true);
        Problem problem = new Problem();
        problem.setProblemComponents(arrProblemComponent);
        ProblemRenderer pr = new ProblemRenderer(problem);
        pr.setForegroundColor(textColor);

        try {
            pageContext.getOut().println(pr.toHTML(language));
        }
        catch(Exception e) {
            throw new JspException(e.getMessage());
        }

        return SKIP_BODY;
    }

    private Color parseColor(String rgbColor) {

        String r = rgbColor.substring(1,3);
        String g = rgbColor.substring(3,5);
        String b = rgbColor.substring(5);

        return new Color(Integer.parseInt(r, 16),
                         Integer.parseInt(g, 16),
                         Integer.parseInt(b, 16));
    }
}
