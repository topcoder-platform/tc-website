package com.topcoder.web.resume.bean;

public class Resume {
    private String fileName = null;
    private String fileType = null;
    private byte[] file = null;
    public Resume(String fileName, String fileType, byte[] file){
        this.fileName = fileName;
        this.fileType = fileType;
        this.file = file;
    }

    public String getFileType() {
        return fileType;
    }

    public byte[] getFile() {
        return file;
    }

    public String getFileName() {
        return fileName;
    }
}
