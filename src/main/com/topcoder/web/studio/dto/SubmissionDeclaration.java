/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * <p>This class represents the submission declaration, mapped to TCS catalog database.</p>
 *
 * Mutable and not thread-safe.
 *
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class SubmissionDeclaration extends Base {
    /**
     * Serial id.
     */
    private static final long serialVersionUID = 23204340932509954L;

    /**
     * Represents the submission declaration id.
     */
    private long id;

    /**
     * Represents the submission.
     */
    private Submission submission;

    /**
     * Represents the submission declaration comment.
     */
    private String comment;

    /**
     * Represents it has external content or not.
     */
    private boolean hasExternalContent;

    /**
     * Represents the submission external contents.
     */
    private List<ExternalContent> externalContents;

    /**
     * Returns id.
     *
     * @return id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id value to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Returns submission.
     *
     * @return submission
     */
    public Submission getSubmission() {
        return submission;
    }

    /**
     * Sets submission.
     *
     * @param submission value to set
     */
    public void setSubmission(Submission submission) {
        this.submission = submission;
    }

    /**
     * Returns comment.
     *
     * @return comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * Sets comment.
     *
     * @param comment value to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * Returns hasExternalContent flag
     *
     * @return hasExternalContent flag
     */
    public boolean getHasExternalContent() {
        return hasExternalContent;
    }

    /**
     * Sets hasExternalContent flag.
     *
     * @param hasExternalContent value to set
     */
    public void setHasExternalContent(boolean hasExternalContent) {
        this.hasExternalContent = hasExternalContent;
    }

    /**
     * Returns external contents.
     *
     * @return external contents
     */
    public List<ExternalContent> getExternalContents() {
        return externalContents;
    }

    /**
     * Sets external contents.
     *
     * @param externalContents value to set
     */
    public void setExternalContents(List<ExternalContent> externalContents) {
        this.externalContents = externalContents;
    }

    /**
     * Groups external contents according to type. This is especially useful in jsp and el expressions.
     *
     * @return grouped external contents
     */
    public Map<ExternalContentType, List<ExternalContent>> getGroupedExternalContents() {
        Map<ExternalContentType, List<ExternalContent>> result =
            new HashMap<ExternalContentType, List<ExternalContent>>();

        if (externalContents != null) {
            Map<Long, ExternalContentType> types = new HashMap<Long, ExternalContentType>();
            for (ExternalContent content : externalContents) {
                ExternalContentType type = content.getContentType();
                if (!types.containsKey(type.getId())) {
                    types.put(type.getId(), type);
                    result.put(type, new ArrayList<ExternalContent>());
                } else {
                    type = types.get(type.getId());
                }
                result.get(type).add(content);
            }
        }

        return result;
    }
}
