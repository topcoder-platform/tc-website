package com.topcoder.web.resume.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.servlet.request.FileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.InitialContext;

public abstract class ResumeTask {
    private static Logger log = Logger.getLogger(ResumeTask.class);

    private InitialContext ctx;
    private String nextPage;
    private FileUpload fileUpload;
    private boolean nextPageInternal;

    public ResumeTask() {
        setInitialContext(null);
        setNextPage(null);
        setFileUpload(null);
        setNextPageInternal(true);
    }

    public abstract void processStep(String step) throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx = ctx;
    }

    public InitialContext getInitialContext() {
        return ctx;
    }

    public void setNextPage(String nextPage) {
        this.nextPage = nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public FileUpload getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(FileUpload fileUpload) {
        this.fileUpload = fileUpload;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    }

    public void setNextPageInternal(boolean nextPageInternal) {
        this.nextPageInternal = nextPageInternal;
    }

    public boolean getNextPageInternal() {
        return this.nextPageInternal;
    }

}
