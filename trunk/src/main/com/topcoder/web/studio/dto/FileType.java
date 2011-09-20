/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.util.Set;

/**
 * <p>An entity class mapped to <code>tcs_catalog.file_type_lu</code> table.</p>
 * 
 * <p>
 *   Version 1.2 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Added <code>MimeType</code> relationship.</li>
 *   </ol>
 * </p>
 * 
 * @author isv, pvmagacho
 * @version 1.1 
 * @since (Re-Platforming Studio Release 2 assembly)
 */
public class FileType extends Base {
    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Zip</code> archives.</p>
     * 
     * @since 1.1
     */
    public static final Long ZIP_ARCHIVE_TYPE_ID = 14l;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Java</code> archives.</p>
     * 
     * @since 1.1
     */
    public static final Long JAR_ARCHIVE_TYPE_ID = 16l;

    /**
     * <p>A <code>Long</code> providing the ID of this file type.</p>
     */
    private Long id;

    /**
     * <p>A <code>String</code> providing the description of this file type.</p>
     */
    private String description;

    /**
     * <p>A <code>Integer</code> providing the sorting order for this file type.</p>
     */
    private Integer sort;

    /**
     * <p>A <code>Boolean</code> providing the flag indicating whether this file type corresponds to image file or
     * not.</p>
     */
    private Boolean imageFile;

    /**
     * <p>A <code>String</code> providing the filename extension for this file type.</p>
     */
    private String extension;

    /**
     * <p>A <code>Boolean</code> providing the flag indicating whether the files of this type are bundled or not.</p>
     */
    private Boolean bundled;

    /**
     * <p>A <code>Set</code> providing the list of projects assigned to this file type.</p>
     */
    private Set<Project> projects;

    /**
     * <p>A <code>Set</code> providing the list of mime types assigned to this file type.</p>
     */
    private Set<MimeType> mimeTypes;

    /**
     * <p>Constructs new <code>FileType</code> instance. This implementation does nothing.</p>
     */
    public FileType() {
    }

    /**
     * <p>Gets the flag indicating whether the files of this type are bundled or not.</p>
     *
     * @return a <code>Boolean</code> providing the flag indicating whether the files of this type are bundled or not.
     */
    public Boolean getBundled() {
        return this.bundled;
    }

    /**
     * <p>Sets the flag indicating whether the files of this type are bundled or not.</p>
     *
     * @param bundled a <code>Boolean</code> providing the flag indicating whether the files of this type are bundled or
     *                not.
     */
    public void setBundled(Boolean bundled) {
        this.bundled = bundled;
    }

    /**
     * <p>Gets the filename extension for this file type.</p>
     *
     * @return a <code>String</code> providing the filename extension for this file type.
     */
    public String getExtension() {
        return this.extension;
    }

    /**
     * <p>Sets the filename extension for this file type.</p>
     *
     * @param extension a <code>String</code> providing the filename extension for this file type.
     */
    public void setExtension(String extension) {
        this.extension = extension;
    }

    /**
     * <p>Gets the flag indicating whether this file type corresponds to image file or not.</p>
     *
     * @return a <code>Boolean</code> providing the flag indicating whether this file type corresponds to image file or
     *         not.
     */
    public Boolean getImageFile() {
        return this.imageFile;
    }

    /**
     * <p>Sets the flag indicating whether this file type corresponds to image file or not.</p>
     *
     * @param imageFile a <code>Boolean</code> providing the flag indicating whether this file type corresponds to image
     *                  file or not.
     */
    public void setImageFile(Boolean imageFile) {
        this.imageFile = imageFile;
    }

    /**
     * <p>Gets the sorting order for this file type.</p>
     *
     * @return a <code>Integer</code> providing the sorting order for this file type.
     */
    public Integer getSort() {
        return this.sort;
    }

    /**
     * <p>Sets the sorting order for this file type.</p>
     *
     * @param sort a <code>Integer</code> providing the sorting order for this file type.
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * <p>Gets the description of this file type.</p>
     *
     * @return a <code>String</code> providing the description of this file type.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this file type.</p>
     *
     * @param description a <code>String</code> providing the description of this file type.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the ID of this file type.</p>
     *
     * @return a <code>Long</code> providing the ID of this file type.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this file type.</p>
     *
     * @param id a <code>Long</code> providing the ID of this file type.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * <p>Gets the list of projects assigned to this file type.</p>
     *
     * @return a <code>Set</code> providing the list of projects assigned to this file type.
     */
    public Set<Project> getProjects() {
        return this.projects;
    }

    /**
     * <p>Sets the list of projects assigned to this file type.</p>
     *
     * @param projects a <code>Set</code> providing the list of projects assigned to this file type.
     */
    public void setProjects(Set<Project> projects) {
        this.projects = projects;
    }
    /**
     * <p>Gets the list of mime types assigned to this file type.</p>
     *
     * @return a <code>Set</code> providing the list of  mime types assigned to this file type.
     */
    public Set<MimeType> getMimeTypes() {
        return this.mimeTypes;
    }

    /**
     * <p>Sets the list of  mime types assigned to this file type.</p>
     *
     * @param projects a <code>Set</code> providing the list of  mime types assigned to this file type.
     */
    public void setMimeTypes(Set<MimeType> mimeTypes) {
        this.mimeTypes = mimeTypes;
    }

}
