package com.topcoder.web.common.tag;

public class NextPageTag extends PageTag {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
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
