package com.topcoder.web.common.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p>
 * JSP Tag for writing anchor html tags with respect to the web application
 * context if needed.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 */
public class LinkTag extends TagSupport {
    private String page;
    private String href;
    private String onClick;
    private String styleClass;
    private String target;

    /**
     * Sets the value of <code>target</code>. This tag is optional.
     *
     * @param val
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
     * Sets the value of <code>page</code>.
     *
     * @param val The url to use.  It should be an absolute reference within
     *          the context of the web application. Should not be set if
     *          href is also set.
     */
    public void setPage(String val) {
        page = val;
    }

    /**
     * Sets the value of <code>href</code>.
     *
     * @param val The url to use when a reference is needed outside
     *          the web application.
     */
    public void setHref(String val) {
        href = val;
    }

    /**
     * Sets the value of <code>onClick</code>. This parameter is optional.
     *
     * @param val
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
     * @throws JspException Thrown if the href and page are set incorrectly or
     *              if there is an IO problem writing out the tag.
     */
    public int doStartTag() throws JspException {
        if (href == null && page == null)
            throw new JspException("href or page must be set");

        if (href != null && page != null)
            throw new JspException("href and page cannot both be set. Set one or the other");

        HttpServletResponse response =
                (HttpServletResponse) pageContext.getResponse();

        StringBuffer buffer = new StringBuffer();
        buffer.append("<a href=\"");
        String url = null;
        if (href != null) {
            url = href;
        } else {
            HttpServletRequest request =
                    (HttpServletRequest) pageContext.getRequest();
            url = request.getContextPath() + page;
        }
        buffer.append(response.encodeURL(url) + "\"");

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

    /**
     * JSP Tag Specific method.  Sets the &lt;/a&gt; part of the anchor.
     *
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     *
     * @return JSP Tag specific return (Always returns EVAL_PAGE)
     * @throws JspException Thrown if there is a problem write out the tag.
     */
    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().println("</a>");
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }

        this.page=null;
        this.href=null;
        this.onClick=null;
        this.styleClass=null;
        this.target=null;

        return super.doEndTag();
    }

}
