package com.topcoder.web.common.tag;

public class PrevPageTag extends PageTag {

    private static final long serialVersionUID = 1L;

    @Override
    protected boolean displayLink() {
        return rsc.croppedDataBefore();
    }

    @Override
    protected int getPageDelta() {
        return -1;
    }

    @Override
    protected String getDefaultText() {
        return "&lt;&lt; prev";
    }

}
