package com.topcoder.util.idgenerator;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.sql.DataSource;

import com.topcoder.util.idgenerator.sql.DB;
import com.topcoder.util.idgenerator.sql.SimpleDB;

/**
 * The class (singleton) for generating unique ids.
 * 
 * @version 1.0  
 * @author Timur Zambalayev
 */
public final class IdGenerator {

    private static final long TEN13=10000000000000L;
    private static final int TEN5=100000;

    private static final Map idGeneratorMap = new HashMap();

    private static boolean initialized;
    private static DB _db;
    private static DataSource _dataSource;
    private static String _tableName;
    private static String _userDefColumnName;
    private static String _highValueColumnName;
    private static long _maxHi;
    private static int _maxLo;
    private static boolean _autoInit;

    private IdGenerator() {
    }

    /**
     * Returns whether the id generator is initialized. 
     *  
     * @return whether the id generator is initialized.
     */ 
    public static synchronized boolean isInitialized() {
        return initialized;
    }

    /**
     * Initializes the id generator.
     * 
     * @param dataSource            data source.
     * @throws  IllegalStateException   if already initialized.
     */ 
    public static void init(DataSource dataSource) {
        init(new SimpleDB(), dataSource);
    }

    /**
     * Initializes the id generator.
     * 
     * @param db                    the table locking strategy.
     * @param dataSource            data source.
     * @throws  IllegalStateException   if already initialized.
     */ 
    public static void init(DB db, DataSource dataSource) {
        init(db, dataSource, "key_generation");
    }

    /**
     * Initializes the id generator.
     * 
     * @param db                    the table locking strategy.
     * @param dataSource            data source.
     * @param tableName             table name.
     * @throws  IllegalStateException   if already initialized.
     */ 
    public static void init(DB db, DataSource dataSource, String tableName) {
        init(db, dataSource, tableName, "user_def", "high_value", TEN13, TEN5);
    }

    /**
     * Initializes the id generator.
     * 
     * @param db                    the table locking strategy.
     * @param dataSource            data source.
     * @param tableName             table name.
     * @param userDefColumnName     table/sequence column name.
     * @param highValueColumnName   high value column name.
     * @param maxHi                 the maximum high value.
     * @param maxLo                 the maximum low value.
     * @throws  IllegalStateException   if already initialized.
     */ 
    public static void init(DB db, DataSource dataSource, String tableName, String userDefColumnName, String highValueColumnName,
            long maxHi, int maxLo) {
        init(db, dataSource, tableName, userDefColumnName, highValueColumnName, maxHi, maxLo, true);
    }

    /**
     * Initializes the id generator.
     * 
     * @param db                    the table locking strategy.
     * @param dataSource            data source.
     * @param tableName             table name.
     * @param userDefColumnName     table/sequence column name.
     * @param highValueColumnName   high value column name.
     * @param maxHi                 the maximum high value.
     * @param maxLo                 the maximum low value.
     * @param autoInit              whether the row for this sequence will be automatically inserted in case there's no such row.
     * @throws  IllegalStateException   if already initialized.
     */ 
    public static synchronized void init(DB db, DataSource dataSource, String tableName, String userDefColumnName,
            String highValueColumnName, long maxHi, int maxLo, boolean autoInit) {
        if (initialized) {
            throw new IllegalStateException("already initialized");
        }
        initialized = true;
        _db = db;
        _dataSource = dataSource;
        _tableName = tableName;
        _userDefColumnName = userDefColumnName;
        _highValueColumnName = highValueColumnName;
        _maxHi = maxHi;
        _maxLo = maxLo;
        _autoInit = autoInit;
    }

    /**
     * Returns the next id.
     *  
     * @return the next id.
     * @throws SQLException     if a database access error occurs. 
     */ 
    public static long nextId() throws SQLException {
        return nextId("main_sequence");
    }

    /**
     * Returns the next id for the given table id.
     *  
     * @param tableId           the table/sequence name. 
     * @return the next id for the given table id.
     * @throws SQLException     if a database access error occurs.
     */ 
    public static synchronized long nextId(String tableId) throws SQLException {
        if (!initialized) {
            throw new RuntimeException("IdGenerator.init() wasn't called");
        }
        return getIdGenerator(tableId).nextId();
    }

    private static IdGeneratorInterface getIdGenerator(String tableId) {
        IdGeneratorInterface idgenerator = (IdGeneratorInterface) idGeneratorMap.get(tableId);
        if (idgenerator == null) {
            idgenerator = new IdGeneratorImpl(_db, _dataSource, _tableName, _userDefColumnName, _highValueColumnName, _maxHi,
                    _maxLo, _autoInit, tableId);
            idGeneratorMap.put(tableId, idgenerator);
        }
        return idgenerator;
    }

}
