package com.topcoder.dde.util.DWLoad;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.UnknownNamespaceException;

public class ReliabilityRating {
    protected static final Logger log = Logger.getLogger(ReliabilityRating.class);

    public static final String DRIVER_KEY = "DriverClass";
    public static final String CONNECTION_URL_KEY = "ConnectionURL";
    public static final String HISTORY_LENGTH_KEY = "HistoryLength";

    /**
     * the date when the new rules go into effect
     */
    public static final Date START_DATE = getDate(2005, Calendar.OCTOBER, 5, 9, 0);
    //public static final Date START_DATE = getDate(2004, Calendar.JULY, 1, 9, 0);

    /* BUGR-852 modification */
    /**
     * the pivot date when hen the 'change in order calculation' takes place.
     */
    public static final Date PIVOT_DATE = getDate(2009, Calendar.JANUARY, 7, 0, 0);

    /**
     * the date when new tracks counted for reliability.
     */
    public static final Date NEW_PHASE_DATE = getDate(2009, Calendar.MARCH, 23, 0, 0);
    
    /**
     * The date when UI Prototypes and RIA Builds count for reliability.
     */
    public static final Date UI_PROTOTYPE_AND_RIA_BUILD_START_DATE = getDate(2009, Calendar.AUGUST, 1, 0, 0);

    public static void main(String[] args) {
        long start = System.currentTimeMillis();

        String namespace = ReliabilityRating.class.getName();
        ConfigManager config = ConfigManager.getInstance();
        if (!config.existsNamespace(namespace)) {
            try {
                config.add(namespace, ConfigManager.CONFIG_XML_FORMAT);
            } catch (ConfigManagerException cme) {
                System.err.println("Couldn't add " + namespace.replace('.', '/') + ".xml to namespace");
                return;
            }
        } else {
            try {
                config.refresh(namespace);
            } catch (ConfigManagerException cme) {
                System.err.println("Exception while refreshing namespace: " + namespace);
                return;
            }
        }

        String jdbcDriver;
        String connectionURL;
        int historyLength;
        try {
            jdbcDriver = config.getString(namespace, DRIVER_KEY);
            connectionURL = config.getString(namespace, CONNECTION_URL_KEY);
            String historyLengthStr = config.getString(namespace, HISTORY_LENGTH_KEY);
            historyLength = Integer.parseInt(historyLengthStr);
            if (jdbcDriver == null) {
                System.err.println("No JDBC Driver specified.  (Config param '" + DRIVER_KEY + "')");
                return;
            }

            if (connectionURL == null) {
                System.err.println("No Connection URL specified.  (Config param '" + CONNECTION_URL_KEY + "')");
                return;
            }

        } catch (UnknownNamespaceException e) {
            System.err.println("Initialized ConfigManager and namespace '" + namespace + "' without trouble but could not retrieve resource bundle");
            return;
        }

        Connection c = null;
        try {
            Class.forName(jdbcDriver);
            c = DriverManager.getConnection(connectionURL);

            ReliabilityCalculator rc = new OldTracksReliabilityCalculator();

            // Design
            rc.calculateReliability(c, historyLength, 1, START_DATE, PIVOT_DATE);

            // Development
            rc.calculateReliability(c, historyLength, 2, START_DATE, PIVOT_DATE);

            rc = new NewTracksReliabilityCalculator();

            // Conceptualization
            rc.calculateReliability(c, historyLength, 23, NEW_PHASE_DATE, NEW_PHASE_DATE);

            // Specification
            rc.calculateReliability(c, historyLength, 6, NEW_PHASE_DATE, NEW_PHASE_DATE);

            // Architecture
            rc.calculateReliability(c, historyLength, 7, NEW_PHASE_DATE, NEW_PHASE_DATE);

            // Assembly
            rc.calculateReliability(c, historyLength, 14, NEW_PHASE_DATE, NEW_PHASE_DATE);

            // Test Suites
            rc.calculateReliability(c, historyLength, 13, NEW_PHASE_DATE, NEW_PHASE_DATE);
            
            // Test Scenarios
            rc.calculateReliability(c, historyLength, 26, NEW_PHASE_DATE, NEW_PHASE_DATE);
            
            // UI Prototypes
            rc.calculateReliability(c, historyLength, 19, UI_PROTOTYPE_AND_RIA_BUILD_START_DATE, UI_PROTOTYPE_AND_RIA_BUILD_START_DATE);
            
            // RIA Builds
            rc.calculateReliability(c, historyLength, 24, UI_PROTOTYPE_AND_RIA_BUILD_START_DATE, UI_PROTOTYPE_AND_RIA_BUILD_START_DATE);
        } catch (SQLException e) {
                DBMS.printException(e);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                log.info("exception B: " + e1);
            }
        }
       log.info("ran in " + (float) (System.currentTimeMillis() - start) / (float) 1000 + " seconds");
    }

    private static Date getDate(int year, int month, int day, int hour, int minute) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, day);
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, minute);
        return new Date(cal.getTime().getTime());
    }

}
