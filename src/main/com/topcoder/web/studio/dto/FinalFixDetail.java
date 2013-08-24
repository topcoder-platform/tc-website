/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.util.List;

/**
 * <p>A DTO representing a single final fix review.</p>
 *
 * @author isv
 * @version 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
 */
public class FinalFixDetail extends Base {

    /**
     * <p>A <code>String</code> providing the additional comment for the review.</p>
     */
    private String additionalComment;

    /**
     * <p>A <code>List</code> providing the final fix items.</p>
     */
    private List<FinalFixComment> comments;

    /**
     * <p>Constructs new <code>FinalFixDetail</code> instance. This implementation does nothing.</p>
     */
    public FinalFixDetail() {
    }

    /**
     * <p>Gets the final fix items.</p>
     *
     * @return a <code>List</code> providing the final fix items.
     */
    public List<FinalFixComment> getComments() {
        return this.comments;
    }

    /**
     * <p>Sets the final fix items.</p>
     *
     * @param comments a <code>List</code> providing the final fix items.
     */
    public void setComments(List<FinalFixComment> comments) {
        this.comments = comments;
    }

    /**
     * <p>Gets the additional comment for the review.</p>
     *
     * @return a <code>String</code> providing the additional comment for the review.
     */
    public String getAdditionalComment() {
        return this.additionalComment;
    }

    /**
     * <p>Sets the additional comment for the review.</p>
     *
     * @param additionalComment a <code>String</code> providing the additional comment for the review.
     */
    public void setAdditionalComment(String additionalComment) {
        this.additionalComment = additionalComment;
    }
}
