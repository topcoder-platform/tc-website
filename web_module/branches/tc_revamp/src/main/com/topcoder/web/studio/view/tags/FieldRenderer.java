/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.view.tags;

import com.topcoder.shared.util.StringUtil;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;

/**
 * <p>A custom tag used for outputting the pre-formatted text having the new line characters replaced with
 * <code>BREAK LINE</code> HTML tag for preventing the text formatting when including the text into page content.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.14)
 */
public class FieldRenderer extends TagSupport {

    /**
     * <p>A <code>String</code> providing the text with field content to be formatted by this tag.</p>
     */
    private String text = null;

    /**
     * <p>Constructs new <code>FieldRenderer</code> instance. This implementation does nothing.</p>
     */
    public FieldRenderer() {
    }

    /**
     * <p>Sets the text to be formatted bby this tag.</p>
     *
     * @param text a <code>String</code> providing the text to be formatted by this tag.
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * <p>Starts processing this tag. Formats the </p>
     *
     * @return {@link #SKIP_BODY} always.
     * @throws JspException if an unexpected error occurs.
     */
    public int doStartTag() throws JspException {
        if (this.text != null) {
            String processedText = StringUtil.replace(this.text, "\r\n", "<br/>");
            processedText = StringUtil.replace(processedText, "\n", "<br/>");
            try {
                pageContext.getOut().print(processedText);
            } catch (Exception e) {
                throw new JspException(e.getMessage());
            }
        }
        return SKIP_BODY;
    }

    /**
     * <p>Releases the resources held by this tag instance.</p>
     */
    public void release() {
        this.text = null;
        super.release();
    }
}
