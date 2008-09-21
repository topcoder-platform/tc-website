/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

/**
 * <p>A POJO class used for representing the contest types. Maintains the contest type ID, description and two flags
 * indicating whether the image or file preview is required for contest type or not.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.1)
 */
public class ContestType extends Base {

    /**
     * <p>An <code>Integer</code> referencing the contest type corresponding to <code>Storyboard</code> contests.</p>
     */
    public static final Integer STORYBOARD = 1;

    /**
     * <p>An <code>Integer</code> referencing the contest type corresponding to <code>Prototype</code> contests.</p>
     */
    public static final Integer PROTOTYPE = 2;

    /**
     * <p>An <code>Integer</code> referencing the contest type corresponding to <code>Logo</code> contests.</p>
     */
    public static final Integer LOGO = 3;

    public static final Integer OTHER = 18;

    /**
     * <p>An <code>Integer</code> maintaining the ID of this contest type.</p>
     */
    private Integer id = null;

    /**
     * <p>A <code>String</code> maintaining the textual description of this contest type.</p>
     */
    private String description = null;

    /**
     * <p>A <code>Boolean</code> flag indicating whether the preview image is required for this contest type or not.</p>
     */
    private Boolean previewImageRequired = null;

    /**
     * <p>A <code>Boolean</code> flag indicating whether the preview file is required for this contest type or not.</p>
     */
    private Boolean previewFileRequired = null;

    /**
     * <p>A <code>Boolean</code> flag indicating whether submissions should have a gallery displayed/built or not.</p>
     *
     * @since Studio Submission Slideshow
     */
    private Boolean includeGallery = null;

    /**
     * <p>Constructs new <code>ContestType</code> instance. This implementation does nothing.</p>
     */
    public ContestType() {
    }

    /**
     * <p>Gets the ID of this contest type.</p>
     *
     * @return an <code>Integer</code> providing the ID of this contest type.
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this contest type.</p>
     *
     * @param id an <code>Integer</code> providing the ID of this contest type.
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * <p>Gets the description of this contest type.</p>
     *
     * @return a <code>String</code> providing description ID of this contest type.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this contest type.</p>
     *
     * @param description a <code>String</code> providing description ID of this contest type.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the flag indicating whether the image preview is required for this contest type or not.</p>
     *
     * @return a <code>Boolean</code> indicating whether the preview image is required for this contest type or not.
     */
    public Boolean getPreviewImageRequired() {
        return this.previewImageRequired;
    }

    /**
     * <p>Sets the flag indicating whether the image preview is required for this contest type or not.</p>
     *
     * @param previewImageRequired a <code>Boolean</code> indicating whether the preview image is required for this
     *                             contest type or not.
     */
    public void setPreviewImageRequired(Boolean previewImageRequired) {
        this.previewImageRequired = previewImageRequired;
    }

    /**
     * <p>Gets the flag indicating whether the file preview is required for this contest type or not.</p>
     *
     * @return a <code>Boolean</code> indicating whether the file preview is required for this contest type or not.
     */
    public Boolean getPreviewFileRequired() {
        return this.previewFileRequired;
    }

    /**
     * <p>Sets the flag indicating whether the preview file is required for this contest type or not.</p>
     *
     * @param previewFileRequired a <code>Boolean</code> indicating whether the preview file is required for this
     *                            contest type or not.
     */
    public void setPreviewFileRequired(Boolean previewFileRequired) {
        this.previewFileRequired = previewFileRequired;
    }

    /**
     * <p>Gets the flag indicating whether the submissions should have a gallery displayed/built or not.</p>
     *
     * @return a <code>Boolean</code> flag indicating whether submissions should have a gallery displayed/built or not.
     * @since Studio Submission Slideshow
     */
    public Boolean getIncludeGallery() {
        return this.includeGallery;
    }

    /**
     * <p>Sets the flag indicating whether the submissions should have a gallery displayed/built or not.</p>
     *
     * @param includeGallery a <code>Boolean</code> flag indicating whether submissions should have a gallery
     *                       displayed/built or not.
     * @since Studio Submission Slideshow
     */
    public void setIncludeGallery(Boolean includeGallery) {
        this.includeGallery = includeGallery;
    }
}
