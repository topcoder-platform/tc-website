package com.topcoder.web.truveo.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class MimeType extends Base {
    private Integer id;
    private String description;
    private TruveoFileType fileType;

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

    public TruveoFileType getFileType() {
        return fileType;
    }

    public void setFileType(TruveoFileType fileType) {
        this.fileType = fileType;
    }

}
