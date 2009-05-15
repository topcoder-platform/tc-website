package com.topcoder.util.idgenerator;

import java.sql.SQLException;

/**
 * High/low id generator.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
final class HighLowIdGenerator implements IdGeneratorInterface {

    private final int maxLo;
    private final HighValueFetcher highValueFetcher;
    private final String tableId;

    private long hi=-1;
    private int lo;

    /**
     * Creates an instance of this class.
     * 
     * @param maxLo             the maximum value for the low value.
     * @param highValueFetcher  high value fetcher.
     */ 
    HighLowIdGenerator(int maxLo, HighValueFetcher highValueFetcher, String tableId) {
        this.maxLo=maxLo;
        this.highValueFetcher=highValueFetcher;
        this.tableId = tableId;
    }

    private void fetchHighValue() throws SQLException {
        hi=highValueFetcher.nextHighValue(tableId);
    }

    public long nextId() throws SQLException {
        if (hi<0) {
            fetchHighValue();
        }
        long id=combine(hi, lo, maxLo);
        inc();
        return id;
    }

    private void inc() throws SQLException {
        int newLo=lo+1;
        if (newLo>=maxLo) {
            fetchHighValue();
            newLo=0;
        }
        lo=newLo;
    }

    private static long combine(long hi, int lo, int maxLo) {
        return lo+maxLo*hi;
    }

}
