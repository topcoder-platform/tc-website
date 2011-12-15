package com.topcoder.web.corp.view.testing.tag;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.corp.common.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Custom tag to simplify linking to the servlet.
 * @author Porgery
 * @author Grimicus
 */
public class ServletLinkTag extends TagSupport {

    private String param;
    private String processor;
    private String onClick;
    private String styleClass;
    private String target;

    /**
     * Sets the value of <code>target</code>. This tag is optional.
     *
     * @param target
     */
    public void setTarget(String val) {
        target = val;
    }

    /**
     * Sets the value of <code>styleClass</code>.  This parameter should
     * be substituted for the <code>class</code> parameter normally used
     * by the anchor tag as class is a reserved word and java and cannot
     * be used by the JSP tag. This tag is optional.
     *
     * @param val
     */
    public void setStyleClass(String val) {
        styleClass = val;
    }

    /**
     * Sets the value of <code>processor</code>. Specifies the name of the
     * processor class the servlet should instantiate.
     *
     * @param val
     */
    public void setProcessor(String val) {
        processor = val;
    }

    /**
     * Sets the value of <code>param</code>. If set, this string is appended
     * after the processor parameter as part of the url. An ampersand (&amp;)
     * is added before this string if needed.
     *
     * @param param
     */
    public void setParam(String val) {
        param = val;
    }

    /**
     * Sets the value of <code>onClick</code>. This parameter is optional.
     *
     * @param onClick
     */
    public void setOnClick(String val) {
        onClick = val;
    }

    /**
     * JSP Tag Specific method.  Checks that href and page are set correctly
     * (i.e. only one is set and not both or neither).  Then it writes the
     * &lt;a&gt; part of the anchor tag given what parameters have been
     * passed to the tag.
     *
     * @return JSP Tag Specific return. (Always returns EVAL_BODY_INCLUDE)
     * @throws javax.servlet.jsp.JspException Thrown if the href and page are set incorrectly or
     *              if there is an IO problem writing out the tag.
     */
    public int doStartTag() throws JspException {
        HttpServletResponse response =
                (HttpServletResponse) pageContext.getResponse();

        StringBuffer buffer = new StringBuffer();
        buffer.append("<a href=\"");

        buffer.append(response.encodeURL(buildUrl()) + "\"");

        if (onClick != null) {
            buffer.append(" onClick=\"" + onClick + "\"");
        }

        if (styleClass != null) {
            buffer.append(" class=\"" + styleClass + "\"");
        }

        if (target != null) {
            buffer.append(" target=\"" + target + "\"");
        }

        buffer.append(">");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }

        return EVAL_BODY_INCLUDE;
    }

    private String buildUrl() {
        HttpServletRequest request =
                (HttpServletRequest) pageContext.getRequest();

        StringBuffer buffer = new StringBuffer();

        SessionInfo info = (SessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY);
        buffer.append(info.getServletPath());
        if (processor != null || param != null) {
            buffer.append("?");
            if (processor != null) {
                buffer.append(Constants.MODULE_KEY + "=");
                buffer.append(processor);
            }
            if (param != null) {
                if (!buffer.toString().endsWith("?") && !param.startsWith("&"))
                    buffer.append("&");
                buffer.append(param);
            }
        }
        return buffer.toString();
    }

    /**
     * JSP Tag Specific method.  Sets the &lt;/a&gt; part of the anchor.
     *
     * @return JSP Tag specific return (Always returns EVAL_PAGE)
     * @throws javax.servlet.jsp.JspException Thrown if there is a problem write out the tag.
     */
    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().println("</a>");
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        param=null;
        processor=null;
        onClick=null;
        styleClass=null;
        target=null;

        return EVAL_PAGE;
    }

}
