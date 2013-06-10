/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>A DTO representing a single comment from final fix review.</p>
 * 
 * @author isv
 * @version 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
 */
public class FinalFixComment extends Base {

    /**
     * <p>A <code>String</code> providing the text of the comment.</p>
     */
    private String comment;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the final fix item has been fixed or not.</p>
     */
    private boolean fixed;

    /**
     * <p>Constructs new <code>FinalFixComment</code> instance. This implementation does nothing.</p>
     */
    public FinalFixComment() {
    }

    /**
     * <p>Gets the flag indicating whether the final fix item has been fixed or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the final fix item has been fixed or not.
     */
    public boolean getFixed() {
        return this.fixed;
    }

    /**
     * <p>Sets the flag indicating whether the final fix item has been fixed or not.</p>
     *
     * @param fixed a <code>boolean</code> providing the flag indicating whether the final fix item has been fixed or
     * not.
     */
    public void setFixed(boolean fixed) {
        this.fixed = fixed;
    }

    /**
     * <p>Gets the text of the comment.</p>
     *
     * @return a <code>String</code> providing the text of the comment.
     */
    public String getComment() {
        return this.comment;
    }

    /**
     * <p>Sets the text of the comment.</p>
     *
     * @param comment a <code>String</code> providing the text of the comment.
     */
    public void setComment(String comment) {
        this.comment = comment;
    }
}
