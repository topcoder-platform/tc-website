/*
 * CatalogSearchEngine.java
 * 22 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.search.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.sql.DB;
import com.topcoder.util.idgenerator.sql.InformixDB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 * A private class used to provide search functionality for the component
 * catalog.
 *
 * @version 1.0, 22 September 2002
 * @author  Albert Mao
 * @see     CatalogBean
 * @see     ComponentManagerBean
 */
class CatalogSearchEngine {

    /** The separator between words expected by the parser */
    public static final String DELIMITER = " ";
    /** The constant representing the Word Count search and index strategy */
    public static final String WORDCOUNT = "wordcount";
    /** The constant representing the string document parser */
    public static final String STRINGPARSE = "stringparse";
    /** The categories to use for the search engine */
    public static final String[] CATALOG = new String[]{"DDECATALOG"};

    private static CatalogSearchEngine singleton = null;

    private SearchEngine searchEngine;
    private DataSource ds;

    private CatalogSearchEngine() {
        searchEngine = new SearchEngine();
        try {
            Context dsBinding = new InitialContext();
            ds = (DataSource) dsBinding.lookup("java:comp/env/jdbc/DefaultDS");
        } catch (NamingException exception) {
            throw new EJBException(
                    "Failed to obtain data source for search engine: "
                    + exception.toString());
        }
        DB tableLocker = new InformixDB();

        try {
            searchEngine.addStrategy(WORDCOUNT,
                    new WordCountStrategy(ds, tableLocker, searchEngine));
        } catch (SQLException exception) {
            throw new EJBException(
                    "Failed to initialize search engine: " + exception.toString());
        }
        searchEngine.addDocParser(STRINGPARSE, new StringDocParser());
    }

    public synchronized static CatalogSearchEngine getInstance() {
        if (singleton == null) {
            singleton = new CatalogSearchEngine();
        }
        return singleton;
    }


    public SearchIterator search(String searchString, int bufferSize) {
        SearchStrategy searcher = searchEngine.getSearchStrategy(WORDCOUNT);
        if (bufferSize <= 0) {
            return searcher.search(CATALOG, searchString);
        } else {
            return searcher.search(CATALOG, searchString, bufferSize);
        }
    }

    public synchronized void index(long componentId, String words) {
        IndexStrategy indexer = searchEngine.getIndexStrategy(WORDCOUNT);
        indexer.indexDoc(CATALOG, componentId,
                new InMemoryLoc(words, STRINGPARSE));
    }

    public synchronized void reIndex(long componentId, String words) {
        IndexStrategy indexer = searchEngine.getIndexStrategy(WORDCOUNT);
        
        /* The following deletes should be moved to IndexStrategy.reIndexDoc() */
        indexer.deleteIdentifier(CATALOG, componentId);  // delete from word_srch_ctgy
        
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ps = conn.prepareStatement(
                    "delete from word_search where document_id = ?");
            ps.setLong(1, componentId);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                } 
            } catch (SQLException e) {
                throw new EJBException(e);
            }
            try {
                if (conn != null) {
                    conn.close();
                } 
            } catch (SQLException e) {
                throw new EJBException(e);
            }
        }
        /* End - deletes to be moved */

        indexer.reIndexDoc(CATALOG, componentId,
                new InMemoryLoc(words, STRINGPARSE));   
    }

    public synchronized void unIndex(long componentId) {
        IndexStrategy indexer = searchEngine.getIndexStrategy(WORDCOUNT);
        indexer.deleteIdentifier(componentId);
    }


}