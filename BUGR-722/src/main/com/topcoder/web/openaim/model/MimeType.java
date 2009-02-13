package com.topcoder.web.openaim.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class MimeType extends Base {
    private Integer id;
    private String description;
    private OpenAIMFileType fileType;

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

    public OpenAIMFileType getFileType() {
        return fileType;
    }

    public void setFileType(OpenAIMFileType fileType) {
        this.fileType = fileType;
    }

}
