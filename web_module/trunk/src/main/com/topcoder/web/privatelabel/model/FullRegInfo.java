package com.topcoder.web.privatelabel.model;

import com.topcoder.web.privatelabel.Constants;

public class FullRegInfo extends SimpleRegInfo {

    private byte[] resume;
    private String fileName;
    private int fileType;
    private int coderType;

    public FullRegInfo() {
    }

    public byte[] getResume() {
        return resume;
    }

    public void setResume(byte[] resume) {
        this.resume = resume;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getFileType() {
        return fileType;
    }

    public void setFileType(int fileType) {
        this.fileType = fileType;
    }

    public int getCoderType() {
        return coderType;
    }

    public void setCoderType(int coderType) {
        this.coderType = coderType;
    }

    public boolean isStudent() {
        return coderType==Constants.STUDENT;
    }

    public boolean isProfessional() {
        return coderType==Constants.PROFESSIONAL;
    }
}
