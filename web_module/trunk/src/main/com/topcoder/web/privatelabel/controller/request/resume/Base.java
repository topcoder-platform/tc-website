package com.topcoder.web.privatelabel.controller.request.resume;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.servlet.request.FileUpload;

abstract public class Base extends BaseProcessor {

    protected FileUpload file;

    abstract protected void businessProcessing() throws TCWebException;

    public void setFileUpload(FileUpload fu) {
        this.file = fu;
    }


}
