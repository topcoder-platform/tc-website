package com.topcoder.web.common.tag;

public class NextPageTag extends PageTag {

    private static final long serialVersionUID = 1L;

    @Override
    protected boolean displayLink() {
        return rsc.croppedDataAfter();
    }

    @Override
    protected int getPageDelta() {
        return 1;
    }

    @Override
    protected String getDefaultText() {
        return "next  &gt;&gt;";
    }

}
