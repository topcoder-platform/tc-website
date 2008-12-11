package com.topcoder.web.winformula.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class MimeType extends Base {
    private Integer id;
    private String description;
    private WinformulaFileType fileType;

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

    public WinformulaFileType getFileType() {
        return fileType;
    }

    public void setFileType(WinformulaFileType fileType) {
        this.fileType = fileType;
    }

}
