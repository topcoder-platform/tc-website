package com.topcoder.util.idgenerator;

import java.sql.SQLException;
import javax.sql.DataSource;

import com.topcoder.util.idgenerator.sql.DB;

/**
 * Id generator implementation.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
final class IdGeneratorImpl implements IdGeneratorInterface {

    private final IdGeneratorInterface generator;

    /**
     * Creates an instance of this class.
     * 
     * @param db                    db.
     * @param dataSource            data source.
     * @param tableName             table name.
     * @param userDefColumnName     userDef column name.
     * @param highValueColumnName   high value column name.
     * @param maxHi                 the maximum high value.
     * @param maxLo                 the maximum low value.
     * @param autoInit              if there's auto initialization
     */ 
    IdGeneratorImpl(DB db, DataSource dataSource, String tableName, String userDefColumnName, String highValueColumnName, 
            long maxHi, int maxLo, boolean autoInit, String tableId) {
        HighValueFetcherImpl fetcher=new HighValueFetcherImpl(db, dataSource, tableName, userDefColumnName, highValueColumnName, 
                maxHi, autoInit);
        generator=new HighLowIdGenerator(maxLo, fetcher, tableId);
    }

    public long nextId() throws SQLException {
        return generator.nextId();
    }
    
}
