package com.topcoder.common;

import java.util.*;
import com.topcoder.server.util.TCResourceBundle;

public class ApplicationServer {

  private static TCResourceBundle bundle = new TCResourceBundle("ApplicationServer");

  public static final int PROD     = bundle.getIntProperty("PROD", 1); 
  public static final int QA       = bundle.getIntProperty("QA", 2);
  public static final int DEV      = bundle.getIntProperty("DEV", 3);

  public static int      ENVIRONMENT           = bundle.getIntProperty("SELECTED_ENVIRONMENT", DEV);
  public static int      WEBLOGIC_PORT         = bundle.getIntProperty("SELECTED_WEBLOGIC_PORT", 7030);
  public static String   SERVER_NAME           = bundle.getProperty("SELECTED_SERVER_NAME", "172.16.20.20");
  public static String   HOST_URL              = bundle.getProperty("SELECTED_HOST_URL", "t3://172.16.20.41:7030");
  public static String   CONTEST_HOST_URL      = bundle.getProperty("SELECTED_CONTEST_HOST_URL", "t3://172.16.20.41:7010");
  public static String   MPSQAS_HOST_URL       = bundle.getProperty("SELECTED_MPSQAS_HOST_URL", "t3://172.16.20.41:7030");
  public static String[] WEBLOGIC_CLUSTER_IP   = getClusterArray(bundle.getProperty("SELECTED_WEBLOGIC_CLUSTER_IP", "172.16.20.41"));
  public static String   BASE_DIR              = bundle.getProperty("SELECTED_BASE_DIR", "/usr/web/build/classes");

  public       static String IAGREE          = bundle.getProperty("IAGREE", BASE_DIR + "/com/topcoder/common/terms.txt");
  public final static String JNDI_FACTORY    = bundle.getProperty("JNDI_FACTORY", "weblogic.jndi.WLInitialContextFactory");
  public final static String JMS_FACTORY     = bundle.getProperty("JMS_FACTORY", "jms.connection.jmsFactory");
  public final static String JMS_BKP_FACTORY = bundle.getProperty("JMS_BKP_FACTORY", "jms.connection.jmsFactory_BKP");
  public final static String TRANS_FACTORY   = bundle.getProperty("TRANS_FACTORY", "javax.transaction.UserTransaction");

  public static String AUTHENTICATION_SERVICES = bundle.getProperty("AUTHENTICATION_SERVICES", "com.topcoder.ejb.AuthenticationServicesHome");
  public static String CODER_STATISTICS        = bundle.getProperty("CODER_STATISTICS", "com.topcoder.ejb.CoderStatisticsHome");
  public static String DATA_CACHE              = bundle.getProperty("DATA_CACHE", "com.topcoder.ejb.DataCacheHome");
  public static String REPORTING               = bundle.getProperty("REPORTING", "com.topcoder.ejb.ReportingHome");
  public static String SEARCH                  = bundle.getProperty("SEARCH", "com.topcoder.ejb.SearchHome");
  public static String USER_SERVICES           = bundle.getProperty("USER_SERVICES", "com.topcoder.ejb.UserServicesHome");
  public static String UTIL                    = bundle.getProperty("UTIL", "com.topcoder.ejb.UtilHome");
  public static String MPSQAS_SERVICES         = bundle.getProperty("PACTS_SERVICES", "com.topcoder.web.pacts.ejb.PactsServicesHome");
  public static String STATISTICS              = bundle.getProperty("STATISTICS", "com.topcoder.web.stat.ejb.Statistics.StatisticsHome");
  public static String CONTEST_ADMIN_SERVICES  = bundle.getProperty("CONTEST_ADMIN_SERVICES", "jma.ContestAdminServicesHome");
  public static String PACTS_SERVICES          = bundle.getProperty("PACTS_SERVICES", "com.topcoder.web.pacts.ejb.PactsServicesHome");
  public static String PROJECT_SERVICES        = bundle.getProperty("PROJECT_SERVICES", "tc.ProjectServicesHome");

  private static String[] getClusterArray(String s) {
    StringTokenizer st = new StringTokenizer(s, ",");
    String[] ret = new String[st.countTokens()];
    int i=0; 
    while(st.hasMoreTokens()) {
      ret[i] = st.nextToken();
      i++;
    }
    return ret;
  }
}
