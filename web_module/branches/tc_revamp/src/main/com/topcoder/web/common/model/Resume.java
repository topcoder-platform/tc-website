package com.topcoder.web.common.model;


/**
 * @author dok
 * @version $Revision: 59639 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class Resume extends Base {
    private Long id;
    private String fileName;
    private FileType fileType;
    private byte[] file;
    private Coder coder;


    public Resume() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public FileType getFileType() {
        return fileType;
    }

    public void setFileType(FileType fileType) {
        this.fileType = fileType;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
    }


}
