package com.topcoder.web.privatelabel.model;

import com.topcoder.servlet.request.UploadedFile;

public class ResumeRegInfo extends FullRegInfo {

    private UploadedFile file = null;

    public ResumeRegInfo() {

    }

    public ResumeRegInfo(SimpleRegInfo info) {
        super(info);
    }

    public UploadedFile getUploadedFile() {
        return file;
    }

    public void setUploadedFile(UploadedFile u) {
        this.file = u;
    }

    public String getUploadStatus() {
        if (file == null)
            return "Not Supplied";
        else
            return "Attached (" + file.getRemoteFileName() + ")";
    }

    public boolean hasResume() {
        return (file != null);
    }
}
