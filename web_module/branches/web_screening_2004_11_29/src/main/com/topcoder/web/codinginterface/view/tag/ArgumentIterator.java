package com.topcoder.web.codinginterface.view.tag;

import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.language.Language;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;
import java.util.HashMap;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 20, 2005
 */
public class ArgumentIterator extends BodyTagSupport {

    private Problem problem = null;
    private Language language = null;
    private String argTypeClass = null;
    private String argInputClass = null;
    private DataType[] arguments = null;
    private int index = 0;

    public void setProblem(Problem problem) {
        this.problem = problem;
        setArguments(this.problem);
    }

    public void setProblem(String problem) {
        this.problem = (Problem)pageContext.findAttribute(problem);
        setArguments(this.problem);
    }

    private void setArguments(Problem p) {
        arguments = p.getComponent(0).getParamTypes();
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public void setLanguage(String language) {
        this.language = (Language)pageContext.findAttribute(language);
    }

    public void setArgTypeClass(String argTypeClass) {
        this.argTypeClass = argTypeClass;
    }

    public void setArgInputClass(String argInputClass) {
        this.argInputClass = argInputClass;
    }

    public int doStartTag() throws JspException {
        return arguments.length > 0 ? EVAL_BODY_TAG : SKIP_BODY;
    }

    public int doAfterBody() throws JspException {
        if (index<arguments.length) {
            try {
                printArgument(index);
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
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

    private void printArgument(int index) throws IOException {
        JspWriter out = getPreviousOut();
        out.write("<tr><td class=\"");
        out.write(argTypeClass);
        out.write("\">");
        out.write(new DataTypeRenderer(arguments[index]).toPlainText(language));
        out.write("</td>");
        out.write("<td class=\"");
        out.write(argInputClass);
        out.write("\">");
        //content
        if (arguments[index].getDimension()>0) {
            out.write("<a href=\"");
            out.write("Javascript:launchArray("+index+");");
            out.write("<img src=\"/i/corp/screening/buttonCreate.gif\" alt=\"Create\"/>");
            out.write("</a>");
        } else {
            String name = CodingInterfaceConstants.TEST_ARGUMENT_PREFIX+index;
            out.write("<input type=\"text\" name=\"");
            out.write(name);
            out.write("\" size=\"20\" maxlength=\"50\"");
            out.write("value=\"");
            out.write(getDefaultValue(name)==null?"":getDefaultValue(name).toString());
            out.write("\" ");
            out.write(">");
        }
        out.write("</td></tr>");

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
        argTypeClass = null;
        argInputClass = null;
        arguments = null;
        index = 0;
        return super.doEndTag();
    }



}
