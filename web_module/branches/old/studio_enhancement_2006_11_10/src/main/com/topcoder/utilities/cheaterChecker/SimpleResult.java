package com.topcoder.utilities.cheaterChecker;

public class SimpleResult implements Result {
    private int index = 0;
    private double value = 0.0D;

    public SimpleResult() {
    }

    public SimpleResult(int index1, double value) {
        setIndex(index1);
        setValue(value);
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public int compareTo(Object o) {
        Result other = (Result) o;
        return new Double(value).compareTo(new Double(other.getValue()));
    }

}
