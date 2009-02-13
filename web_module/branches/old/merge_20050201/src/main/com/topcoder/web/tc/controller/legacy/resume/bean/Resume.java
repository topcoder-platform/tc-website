package com.topcoder.web.tc.controller.legacy.resume.bean;

public class Resume {
    private String fileName = null;
    private String fileType = null;
    private String mimeType = null;
    private byte[] file = null;

    public Resume(){ }

    public String getFileType() {
        return fileType;
    }

    public byte[] getFile() {
        return file;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

}
