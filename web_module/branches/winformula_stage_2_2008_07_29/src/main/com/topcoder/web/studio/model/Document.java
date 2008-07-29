package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class Document extends Base {
    private Long id;
    private Set<Contest> contests = new HashSet<Contest>();
    private String originalFileName;
    private String systemFileName;
    private FilePath path;
    private MimeType mimeType;
    private DocumentType type;

    /**
     * <p>A <code>String</code> providing the description of the uploaded document.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
     */
    private String description = null;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<Contest> getContests() {
        return Collections.unmodifiableSet(contests);
    }

    public void setContests(Set<Contest> contests) {
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

    public DocumentType getType() {
        return type;
    }

    public void setType(DocumentType type) {
        this.type = type;
    }

    public MimeType getMimeType() {
        return mimeType;
    }

    public void setMimeType(MimeType mimeType) {
        this.mimeType = mimeType;
    }

    /**
     * <p>Gets the descriptin of this document.</p>
     *
     * @return a <code>String</code> providing the description of the document.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the descriptin of this document.</p>
     *
     * @param description a <code>String</code> providing the description of the document.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
     */
    public void setDescription(String description) {
        this.description = description;
    }
}

