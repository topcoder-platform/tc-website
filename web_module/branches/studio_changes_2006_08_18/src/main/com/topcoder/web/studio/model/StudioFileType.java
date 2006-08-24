package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class StudioFileType extends Base {
    public static final Integer ADOBE_ACROBAT_TYPE_ID = new Integer(3);
    private Integer id;
    private String description;
    private String mimeType;
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

    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
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
