package com.topcoder.web.codinginterface.view.tag;

import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.language.Language;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.util.HashMap;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 20, 2005
 */
public class ArgumentIterator extends BodyTagSupport {

    protected static final Logger log = Logger.getLogger(ArgumentIterator.class);

    public static final String INDEX = "argumentIndex";
    public static final String ARGUMENT = "argument";
    public static final String INPUT = "inputElement";

    private Problem problem = null;
    private Language language = null;
    private DataType[] arguments = null;
    private int index = 0;

    public void setProblem(Problem problem) {
        this.problem = problem;
        setArguments(this.problem);
    }

    public void setProblem(String problem) {
        this.problem = (Problem) pageContext.findAttribute(problem);
        log.debug("problem set to " + this.problem);
        setArguments(this.problem);
    }

    private void setArguments(Problem p) {
        arguments = p.getComponent(0).getParamTypes();
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public void setLanguage(String language) {
        this.language = (Language) pageContext.findAttribute(language);
    }

    public int doStartTag() throws JspException {
        return arguments.length > 0 ? EVAL_BODY_TAG : SKIP_BODY;
    }

    public int doAfterBody() throws JspException {
        if (index < arguments.length) {
            pageContext.setAttribute(INDEX, String.valueOf(index), PageContext.PAGE_SCOPE);
            pageContext.setAttribute(ARGUMENT, new DataTypeRenderer(arguments[index]).toPlainText(language),
                    PageContext.PAGE_SCOPE);
            String input = null;
            if (arguments[index].getDimension() > 0) {
                input = "<a href=\"Javascript:launchArray(" + index +
                        ");<img src=\"/i/corp/screening/buttonCreate.gif\" alt=\"Create\"/></a>";
            } else {
                String name = CodingInterfaceConstants.TEST_ARGUMENT_PREFIX + index;
                input = "<input type=\"text\" name=\"" + name + "\" size=\"20\" maxlength=\"50\" value=\"" +
                        getDefaultValue(name) == null ? "" : getDefaultValue(name).toString() + "\">";
            }
            pageContext.setAttribute(INPUT, input, PageContext.PAGE_SCOPE);
            index++;
            return EVAL_BODY_TAG;
        } else {
            try {
                if (bodyContent != null) {
                    bodyContent.writeOut(getPreviousOut());
                }
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
            return SKIP_BODY;
        }
    }


    protected Object getDefaultValue(String name) {
        try {
            HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
            return defaults.get(name);
        } catch (Exception e) {
            return null;
        }
    }


    public int doEndTag() throws JspException {
        problem = null;
        language = null;
        arguments = null;
        index = 0;
        return super.doEndTag();
    }


}
