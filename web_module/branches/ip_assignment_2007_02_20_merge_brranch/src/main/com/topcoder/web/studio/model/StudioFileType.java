package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class StudioFileType extends Base {
    private Integer id;
    private String description;
    private Set mimeTypes = new HashSet();
    private Integer sort;
    private Boolean imageFile;

    public static final Integer ZIP_ARCHIVE_TYPE_ID = new Integer(14);

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

    public Set getMimeTypes() {
        return Collections.unmodifiableSet(mimeTypes);
    }

    public void setMimeTypes(Set mimeTypes) {
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
        return imageFile.booleanValue();
    }

}
