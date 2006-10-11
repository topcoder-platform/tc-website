package com.topcoder.util.idgenerator;

import com.topcoder.util.idgenerator.sql.DB;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * High value fetcher implementation.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
final class HighValueFetcherImpl implements HighValueFetcher {

    private final DB db;
    private final DataSource dataSource;
    private final String tableName;
    private final String highValueColumnName;
    private final long maxHi;
    private final boolean autoInit;
    private final String selectSql;
    private final String updateSql;
    private final String insertSql;

    /**
     * Creates an instance of this class.
     *
     * @param db                    db.
     * @param dataSource            data source.
     * @param tableName             table name.
     * @param userDefColumnName     userDef column name.
     * @param highValueColumnName   high value column name.
     * @param maxHi                 the maximum high value.
     * @param autoInit              if there's auto initialization
     */
    HighValueFetcherImpl(DB db, DataSource dataSource, String tableName, String userDefColumnName, String highValueColumnName,
            long maxHi, boolean autoInit) {
        this.db=db;
        this.dataSource=dataSource;
        this.tableName=tableName;
        this.highValueColumnName=highValueColumnName;
        this.maxHi=maxHi;
        this.autoInit=autoInit;
        selectSql="SELECT "+highValueColumnName+" FROM "+tableName+" WHERE "+userDefColumnName+"=?";
        updateSql="UPDATE "+tableName+" SET "+highValueColumnName+"="+highValueColumnName+"+1 WHERE "+userDefColumnName+"=?";
        insertSql="INSERT INTO "+tableName+" ("+userDefColumnName+", "+highValueColumnName+") VALUES (?, 0)";
    }

    public long nextHighValue(String tableId) throws SQLException {
        Connection connection=null;
        try {
            connection=dataSource.getConnection();
            //connection.setAutoCommit(false);
            db.lockTable(connection, tableName);
            setHighValue(connection, tableId);
            long id=getCurrentHighValue(connection, tableId);
            testId(id);
            return id;
        } finally {
            if (connection!=null) {
                //connection.commit();
                connection.close();
            }
        }
    }

    private void setHighValue(Connection connection, String tableId) throws SQLException {
        PreparedStatement preparedStatement=null;
        try {
            preparedStatement=connection.prepareStatement(updateSql);
            preparedStatement.setString(1, tableId);
            int rowCount=preparedStatement.executeUpdate();
            if (rowCount!=1) {
                if (rowCount!=0) {
                    throw new RuntimeException("rowCount="+rowCount);
                }
                if (!autoInit) {
                    throw new RuntimeException("no such row in the id generation table, tableId="+tableId);
                }
                insertZero(connection, tableId);
            }
        } finally {
            if (preparedStatement!=null) {
                preparedStatement.close();
            }
        }
    }

    private long getCurrentHighValue(Connection connection, String tableId) throws SQLException {
        PreparedStatement preparedStatement=null;
        try {
            preparedStatement=connection.prepareStatement(selectSql);
            preparedStatement.setString(1, tableId);
            ResultSet resultSet=null;
            try {
                resultSet=preparedStatement.executeQuery();
                if (!resultSet.next()) {
                    throw new RuntimeException("no such row in the id generation table, tableId="+tableId);
                }
                long highValue=resultSet.getLong(highValueColumnName);
                if (resultSet.next()) {
                    throw new RuntimeException("more than one row in the id generation table, tableId="+tableId);
                }
                return highValue;
            } finally {
                if (resultSet!=null) {
                    resultSet.close();
                }
            }
        } finally {
            if (preparedStatement!=null) {
                preparedStatement.close();
            }
        }
    }

    private void insertZero(Connection connection, String tableId) throws SQLException {
        PreparedStatement preparedStatement=null;
        try {
            preparedStatement=connection.prepareStatement(insertSql);
            preparedStatement.setString(1, tableId);
            int rowCount=preparedStatement.executeUpdate();
            if (rowCount!=1) {
                throw new RuntimeException("rowCount="+rowCount);
            }
        } finally {
            if (preparedStatement!=null) {
                preparedStatement.close();
            }
        }
    }

    private void testId(long id) {
        if (id>=maxHi || id<0) {
            throw new IllegalStateException("idValue is out of range, idValue="+id+", maxHi="+maxHi);
        }
    }

}
