package com.topcoder.sql.wrapper;

class IdGenerator {

    public static long next = 0;

    public static synchronized Long nextId() {
        return new Long(next++);
    }
}
