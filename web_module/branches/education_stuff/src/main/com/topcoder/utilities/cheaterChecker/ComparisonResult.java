package com.topcoder.utilities.cheaterChecker;

public class ComparisonResult implements Result {
    private int index1 = 0;
    private int index2 = 0;
    private double value = 0.0D;

    public ComparisonResult() {
    }

    public ComparisonResult(int index1, int index2, double value) {
        setIndex1(index1);
        setIndex2(index2);
        setValue(value);
    }

    public int getIndex1() {
        return index1;
    }

    public void setIndex1(int index1) {
        this.index1 = index1;
    }

    public int getIndex2() {
        return index2;
    }

    public void setIndex2(int index2) {
        this.index2 = index2;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public int compareTo(Object o) {
        Result other = (Result)o;
        return new Double(value).compareTo(new Double(other.getValue()));
    }

}
