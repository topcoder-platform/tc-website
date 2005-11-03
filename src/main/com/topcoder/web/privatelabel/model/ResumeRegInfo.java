package com.topcoder.web.privatelabel.model;


public class ResumeRegInfo extends FullRegInfo {

    private byte[] resume = null;
    private String resumeContentType = null;
    private String resumeFileName = null;


    public ResumeRegInfo() {

    }

    public ResumeRegInfo(SimpleRegInfo info) {
        super(info);
    }

    public String getUploadStatus() {
        if (resume == null)
            return "Not Supplied";
        else
            return "Attached (" + resumeFileName + ")";
    }

    public boolean hasResume() {
        return (resume != null);
    }


    public byte[] getResume() {
        return resume;
    }

    public String getResumeContentType() {
        return resumeContentType;
    }

    public String getResumeFileName() {
        return resumeFileName;
    }

    public void setResume(byte[] resume) {
        this.resume = resume;
    }

    public void setResumeContentType(String resumeContentType) {
        this.resumeContentType = resumeContentType;
    }

    public void setResumeFileName(String resumeFileName) {
        this.resumeFileName = resumeFileName;
    }


}
