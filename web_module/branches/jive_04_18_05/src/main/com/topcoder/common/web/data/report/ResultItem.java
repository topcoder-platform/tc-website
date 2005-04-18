package com.topcoder.common.web.data.report;

import java.io.Serializable;

public abstract class ResultItem implements Comparable, Serializable {

    public static final int INT = 1;
    public static final int STRING = 2;
    public static final int DATE = 3;
    public static final int FLOAT = 4;

    public String toString() {
        return this.toString();
    }

    public abstract int getType();

}
