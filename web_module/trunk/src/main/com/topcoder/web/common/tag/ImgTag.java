package com.topcoder.web.common.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p>
 * JSP Tag for writing img tags in html with the ability to deal with the
 * context of the web app for the src parameter of the tag.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 */
public class ImgTag extends TagSupport {
    private String page;
    private String href;
    private String height;
    private String width;
    private String vspace;
    private String border;
    private String alt;

    /**
     * Sets the value of <code>alt</code>. This parameter is optional.
     *
     * @param val
     */
    public void setAlt(String val) {
        alt = val;
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
     * @param val The url to use when a reference is needed to an image outside
     *          the web application.
     */
    public void setHref(String val) {
        href = val;
    }

    /**
     * Sets the value of <code>height</code>. This parameter is optional.
     *
     * @param val
     */
    public void setHeight(String val) {
        height = val;
    }

    /**
     * Sets the value of <code>width</code>. This parameter is optional.
     *
     * @param val
     */
    public void setWidth(String val) {
        width = val;
    }

    /**
     * Sets the value of <code>vspace</code>. This parameter is optional.
     *
     * @param val
     */
    public void setVspace(String val) {
        vspace = val;
    }

    /**
     * Sets the value of <code>border</code>. This parameter is optional.
     *
     * @param val
     */
    public void setBorder(String val) {
        border = val;
    }

    /**
     * JSP Tag specific method.  Does some validation and then returns.
     *
     * @return JSP Tag specific return (Always returns SKIP_BODY)
     * @throws JspException Thrown if there are problems with how this tag is
     *              written.  Basically, only href OR page should be set.
     *              If both or neither are set, exception is thrown.
     */
    public int doStartTag() throws JspException {
        if (href == null && page == null)
            throw new JspException("href or page must be set");

        if (href != null && page != null)
            throw new JspException("href and page cannot both be set. Set one or the other");

        return SKIP_BODY;
    }

    /**
     * JSP Tag Specific method.  Writes out the &lt;img&gt; tag.  Sets the
     * <code>src</code> parameter of the tag depending on whether
     * <code>href</code> or <code>page</code>.  If <code>page</code>was set,
     * then it will prepend the context of this web app to the value.
     *
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     *
     * @return JSP Tag specific return (Always returns EVAL_PAGE)
     * @throws JspException thrown if there is IO trouble writing the tag out.
     */
    public int doEndTag() throws JspException {

        HttpServletResponse response =
                (HttpServletResponse) pageContext.getResponse();

        StringBuffer buffer = new StringBuffer();
        buffer.append("<img src=\"");
        String url = null;
        if (href != null) {
            url = href;
        } else {
            HttpServletRequest request =
                    (HttpServletRequest) pageContext.getRequest();
            url = request.getContextPath() + page;
        }
        buffer.append(response.encodeURL(url) + "\"");

        if (alt != null) {
            buffer.append(" alt=\"" + alt + "\"");
        }

        if (height != null) {
            buffer.append(" height=\"" + height + "\"");
        }

        if (width != null) {
            buffer.append(" width=\"" + width + "\"");
        }

        if (vspace != null) {
            buffer.append(" vspace=\"" + vspace + "\"");
        }

        if (border != null) {
            buffer.append(" border=\"" + border + "\"");
        }

        buffer.append(" />");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        this.page = null;
        this.href = null;
        this.height = null;
        this.width = null;
        this.vspace = null;
        this.border = null;
        this.alt = null;

        return super.doEndTag();
    }

}
