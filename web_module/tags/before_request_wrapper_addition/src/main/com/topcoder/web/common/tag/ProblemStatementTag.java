package com.topcoder.web.common.tag;

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

    private String tdClass = null;
    private String text;
    private Language language;

    /**
     * Sets the value of <code>textColor</code>.
     *
     * @param val
     */
    public void setClass(String val) {
        tdClass = val;
    }

    /**
     * Sets the value of <code>text</code>.
     *
     * @param val
     */
    public void setText(String val) {
        text = val;
    }

    /**
     * Sets the value of <code>language</code>.
     *
     * @param val
     */
    public void setLanguage(String val) {
        if (val != null) {
            if (val.equals(JavaLanguage.DESCRIPTION)) {
                language = JavaLanguage.JAVA_LANGUAGE;
            } else if (val.equals(CPPLanguage.DESCRIPTION)) {
                language = CPPLanguage.CPP_LANGUAGE;
            } else if (val.equals(CSharpLanguage.DESCRIPTION)) {
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
        if (text == null) {
            throw new JspException("Text must be set");
        }
        if (language == null) {
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
        pr.setTdClass(tdClass);

        try {
            pageContext.getOut().println(pr.toHTML(language));
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }

        return SKIP_BODY;
    }
}
