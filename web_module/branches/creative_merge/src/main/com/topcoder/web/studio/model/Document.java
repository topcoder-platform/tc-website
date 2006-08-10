package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.FileType;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class Document extends Base {
    private Long id;
    private Set contests;
    private String originalFileName;
    private String systemFileName;
    private FilePath path;
    private FileType fileType;
    private DocumentType type;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set getContests() {
        return Collections.unmodifiableSet(contests);
    }

    public void setContests(Set contests) {
        this.contests = contests;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getSystemFileName() {
        return systemFileName;
    }

    public void setSystemFileName(String systemFileName) {
        this.systemFileName = systemFileName;
    }

    public FilePath getPath() {
        return path;
    }

    public void setPath(FilePath path) {
        this.path = path;
    }

    public FileType getFileType() {
        return fileType;
    }

    public void setFileType(FileType fileType) {
        this.fileType = fileType;
    }

    public DocumentType getType() {
        return type;
    }

    public void setType(DocumentType type) {
        this.type = type;
    }

}
