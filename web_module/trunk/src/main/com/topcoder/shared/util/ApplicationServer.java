package com.topcoder.shared.util;

import java.util.StringTokenizer;

/**
 * A class to hold application wide constants
 * @author Steve Burrows
 * @version $Revision$
 */
public class ApplicationServer {

    private static TCResourceBundle bundle = new TCResourceBundle("ApplicationServer");

    public static final int PROD = bundle.getIntProperty("PROD", 1);
    public static final int QA = bundle.getIntProperty("QA", 2);
    public static final int DEV = bundle.getIntProperty("DEV", 3);

    public static int ENVIRONMENT = bundle.getIntProperty("ENVIRONMENT", DEV);
    public static String SERVER_NAME = bundle.getProperty("SERVER_NAME", "172.16.20.20");
    public static String HOST_URL = bundle.getProperty("HOST_URL", "t3://172.16.20.41:7030");
    public static String CONTEST_HOST_URL = bundle.getProperty("CONTEST_HOST_URL", "t3://172.16.20.40:9003");
    public static String[] WEBLOGIC_CLUSTER_IP = getClusterArray(bundle.getProperty("WEBLOGIC_CLUSTER_IP", "172.16.20.41"));
    public static String BASE_DIR = bundle.getProperty("BASE_DIR", "/usr/web/build/classes");

    public static String IAGREE = bundle.getProperty("IAGREE", BASE_DIR + "/com/topcoder/common/terms.txt");
    public final static String JNDI_FACTORY = bundle.getProperty("JNDI_FACTORY", "weblogic.jndi.WLInitialContextFactory");
    public final static String JMS_FACTORY = bundle.getProperty("JMS_FACTORY", "jms.connection.jmsFactory");
    public final static String JMS_BKP_FACTORY = bundle.getProperty("JMS_BKP_FACTORY", "jms.connection.jmsFactory_BKP");
    public final static String TRANS_FACTORY = bundle.getProperty("TRANS_FACTORY", "javax.transaction.UserTransaction");

    public static String AUTHENTICATION_SERVICES = bundle.getProperty("AUTHENTICATION_SERVICES", "com.topcoder.ejb.AuthenticationServicesHome");
    public static String CODER_STATISTICS = bundle.getProperty("CODER_STATISTICS", "com.topcoder.ejb.CoderStatisticsHome");
    public static String DATA_CACHE = bundle.getProperty("DATA_CACHE", "com.topcoder.ejb.DataCacheHome");
    public static String REPORTING = bundle.getProperty("REPORTING", "com.topcoder.ejb.ReportingHome");
    public static String SEARCH = bundle.getProperty("SEARCH", "com.topcoder.ejb.SearchHome");
    public static String USER_SERVICES = bundle.getProperty("USER_SERVICES", "com.topcoder.ejb.UserServicesHome");
    public static String UTIL = bundle.getProperty("UTIL", "com.topcoder.ejb.UtilHome");
    public static String MPSQAS_SERVICES = bundle.getProperty("PACTS_SERVICES", "com.topcoder.web.pacts.ejb.PactsServicesHome");
    public static String CONTEST_ADMIN_SERVICES = bundle.getProperty("CONTEST_ADMIN_SERVICES", "jma.ContestAdminServicesHome");
    public static String PACTS_SERVICES = bundle.getProperty("PACTS_SERVICES", "com.topcoder.web.pacts.ejb.PactsServicesHome");
    public static String PROJECT_SERVICES = bundle.getProperty("PROJECT_SERVICES", "tc.ProjectServicesHome");
    public static String TCES_SERVICES = bundle.getProperty("TCES_SERVICES", "com.topcoder.web.tces.ejb.TCESServicesHome");

    private static String[] getClusterArray(String s) {
        StringTokenizer st = new StringTokenizer(s, ",");
        String[] ret = new String[st.countTokens()];
        int i = 0;
        while (st.hasMoreTokens()) {
            ret[i] = st.nextToken();
            i++;
        }
        return ret;
    }
}
