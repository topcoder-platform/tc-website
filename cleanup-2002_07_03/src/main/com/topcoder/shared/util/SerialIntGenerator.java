package com.topcoder.shared.util;

public final class SerialIntGenerator {

    private int count;

    public SerialIntGenerator() {
    }

    SerialIntGenerator(int start) {
        count=start;
    }

    public synchronized void reset() {
        count=0;
    }

    public synchronized int next() {
        if (count==-1) {
            throw new RuntimeException("wrapped in SerialIntGenerator");
        }
        return count++;
    }

}
