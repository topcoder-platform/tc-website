package com.topcoder.web.common.throttle;
/*
 * Counter.java
 *
 * Created on March 28, 2006, 11:45 AM
 */


/**
 * General purpose integer counter class.  This class is not thread safe.  If the throttler's
 * locking scheme is changed, this class may need to be synchronized.
 *
 * @author ivern
 */
public class Counter {
    /**
     * Counter's value.
     */
    private int value;

    /**
     * Constructs a new instance of Counter with an initial value of zero.
     */
    public Counter() {
        this.value = 0;
    }

    /**
     * Constructs a new instance of Counter with a specified initial value.
     *
     * @param value the initial value for the counter.
     */
    public Counter(int value) {
        this.value = value;
    }

    /**
     * Increments the value of the counter by one.
     */
    public void increment() {
        ++this.value;
    }

    /**
     * Decrements the value of the counter by one.
     */
    public void decrement() {
        --this.value;
    }

    /**
     * Sets the value of the counter.
     *
     * @param value new value for the counter.
     */
    public void setValue(int value) {
        this.value = value;
    }

    /**
     * Returns the value of the counter.
     *
     * @return the value of the counter.
     */
    public int getValue() {
        return this.value;
    }
}
