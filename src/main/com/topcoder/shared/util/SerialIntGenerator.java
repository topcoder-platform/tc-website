package com.topcoder.shared.util;

/**
 * @author unknown
 * @version  $Revision$
 */
public final class SerialIntGenerator {

    private int count;

    /**
     *
     */
    public SerialIntGenerator() {
    }

    /**
     *
     * @param start
     */
    SerialIntGenerator(int start) {
        count = start;
    }

    /**
     *
     */
    public synchronized void reset() {
        count = 0;
    }

    /**
     *
     * @return
     */
    public synchronized int next() {
        if (count == -1) {
            throw new RuntimeException("wrapped in SerialIntGenerator");
        }
        return count++;
    }

}
