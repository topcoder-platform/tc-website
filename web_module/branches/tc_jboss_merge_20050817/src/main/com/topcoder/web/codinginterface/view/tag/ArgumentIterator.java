package com.topcoder.web.codinginterface.view.tag;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.render.DataTypeRenderer;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
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
    public static final String DIMENSION = "argumentDimension";

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
        //log.debug("problem set to " + this.problem);
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

    public void doInitBody() throws JspException {
        process();
    }

    public int doAfterBody() throws JspException {
        return process();
    }

    private int process() throws JspException {
        if (index < arguments.length) {
            pageContext.setAttribute(INDEX, String.valueOf(index), PageContext.PAGE_SCOPE);
            pageContext.setAttribute(ARGUMENT, new DataTypeRenderer(arguments[index]).toPlainText(language),
                    PageContext.PAGE_SCOPE);
            pageContext.setAttribute(DIMENSION, String.valueOf(arguments[index].getDimension()), PageContext.PAGE_SCOPE);
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
