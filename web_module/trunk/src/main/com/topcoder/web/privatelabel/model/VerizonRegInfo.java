package com.topcoder.web.privatelabel.model;

public class VerizonRegInfo extends FullRegInfo {
    private boolean isRegFull;

    public VerizonRegInfo() {
        super();
        isRegFull = false;
    }

    public VerizonRegInfo(SimpleRegInfo info) {
        super(info);
        isRegFull=false;
    }

    public boolean isRegFull() {
        return isRegFull;
    }

    public void setRegFull(boolean regFull) {
        isRegFull = regFull;
    }

}
