package com.topcoder.web.common.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


public class RewriteTag extends TagSupport {
    private String page;
    private String href;

    /**
     * Sets the value of <code>page</code>.
     *
     * @param page
     */
    public void setPage( String val )
    {
        page = val;
    }

    /**
     * Gets the value of <code>page</code>.
     *
     * @return 
     */
    public String getPage()
    {
        return page;
    }

    /**
     * Sets the value of <code>href</code>.
     *
     * @param href
     */
    public void setHref( String val )
    {
        href = val;
    }

    /**
     * Gets the value of <code>href</code>.
     *
     * @return 
     */
    public String getHref()
    {
        return href;
    }

    public int doStartTag() throws JspException {
        if(href == null && page == null)
            throw new JspException("href or page must be set");

        if(href != null && page != null)
            throw new JspException(
                    "href and page cannot both be set. Set one or the other");

        return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
        HttpServletResponse response = 
            (HttpServletResponse)pageContext.getResponse();

        StringBuffer buffer = new StringBuffer();
        String url = null;
        if(href != null)
        {
            url = href;
        }
        else
        {
            HttpServletRequest request = 
                (HttpServletRequest)pageContext.getRequest();
            url = request.getContextPath() + page;
        }
        buffer.append(response.encodeURL(url));
        try
        {
            pageContext.getOut().print(buffer.toString());
        }
        catch(IOException e)
        {
            throw new JspException(e.getMessage());
        }

        return EVAL_PAGE;
    }
}
