package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;

import java.util.Set;
import java.util.HashSet;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class CSFFileType extends Base {
    private Integer id;
    private String description;
    private Set mimeTypes = new HashSet();
    private Integer sort;
    private Boolean imageFile;

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
