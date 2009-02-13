package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class StudioFileType extends Base {
    public static final Integer ZIP_ARCHIVE_TYPE_ID = 14;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Java</code> archives.</p>
     * 
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public static final Integer JAR_ARCHIVE_TYPE_ID = 16;

    private Integer id;
    private String description;
    private Set<MimeType> mimeTypes = new HashSet<MimeType>();
    private Integer sort;
    private Boolean imageFile;
    private String extension;

    /**
     * <p>A <code>Boolean</code> flag indicating whether this file type corresponds to bundled files or not.</p>
     * 
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    private Boolean bundledFile;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<MimeType> getMimeTypes() {
        return Collections.unmodifiableSet(mimeTypes);
    }

    public void setMimeTypes(Set<MimeType> mimeTypes) {
        this.mimeTypes = mimeTypes;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Boolean getImageFile() {
        return imageFile;
    }

    public void setImageFile(Boolean imageFile) {
        this.imageFile = imageFile;
    }

    public boolean isImageFile() {
        return imageFile;
    }


    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    /**
     * <p>Gets the flag indicating whether this file type corresponds to bundled files or not.</p>
     *
     * @return a <code>Boolean</code> flag indicating whether this file type corresponds to bundled files or not.
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public Boolean getBundledFile() {
        return this.bundledFile;
    }

    /**
     * <p>Gets the flag indicating whether this file type corresponds to bundled files or not.</p>
     *
     * @return a <code>Boolean</code> flag indicating whether this file type corresponds to bundled files or not.
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public Boolean isBundledFile() {
        return this.bundledFile;
    }

    /**
     * <p>Sets the flag indicating whether this file type corresponds to bundled files or not.</p>
     *
     * @param bundledFile a <code>Boolean</code> flag indicating whether this file type corresponds to bundled files or
     *        not.
     * @since TopCoder Studio Modifications Assembly (Req# 5.6)
     */
    public void setBundledFile(Boolean bundledFile) {
        this.bundledFile = bundledFile;
    }
}
