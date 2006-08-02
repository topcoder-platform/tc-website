package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.FileType;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class Submission extends Base {
    private Long id;
    private User submitter;
    private Contest contest;
    private String originalFileName;
    private String systemFileName;
    private FilePath path;
    private SubmissionType type;
    private FileType fileType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getSubmitter() {
        return submitter;
    }

    public void setSubmitter(User submitter) {
        this.submitter = submitter;
    }

    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
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

    public SubmissionType getType() {
        return type;
    }

    public void setType(SubmissionType type) {
        this.type = type;
    }

    public FileType getFileType() {
        return fileType;
    }

    public void setFileType(FileType fileType) {
        this.fileType = fileType;
    }


}
