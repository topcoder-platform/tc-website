package com.topcoder.common;

public class ApplicationServer {


  //Environments
  public static final int PROD     = 1;
  public static final int QA       = 2;
  public static final int DEV      = 3;


  /** DEV **/
/*
  public static int                   ENVIRONMENT                  = DEV;
  public static int                   WEBLOGIC_PORT                = 7001;
  public static String                SERVER_NAME                  = "172.16.1.153";
  public static String                HOST_URL                     = "t3://172.16.1.152:7001";
  public static String                CONTEST_HOST_URL             = "t3://172.16.1.152:7010";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "172.16.1.152" };
  public final static String          BASE_DIR                     = "/export/home/weblog5/classes";
*/


  //** BETA DEV GLASTONBURY **//

  public static int                   ENVIRONMENT                  = DEV;
  public static int                   WEBLOGIC_PORT                = 7030;
  public static String                SERVER_NAME                  = "beta.dev.topcoder.com";
  public static String                HOST_URL                     = "t3://172.16.1.152:7030";
  public static String                CONTEST_HOST_URL             = "t3://172.16.1.152:7010";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "172.16.1.152" };
  public final static String          BASE_DIR                     = "/export/home/beta/classes";
  public static String                MPSQAS_HOST_URL              = "t3://172.16.1.152:7020";


  //** QA (GLASTONBURY **//
/*
  public static int                   ENVIRONMENT                  = QA;
  public static int                   WEBLOGIC_PORT                = 7030;
  public static String                SERVER_NAME                  = "beta.topcoder.com";
  public static String                HOST_URL                     = "t3://172.16.212.51:7030";
  public static String                CONTEST_HOST_URL             = "t3://172.16.212.52:7010";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "172.16.212.51", "172.16.212.52" };
  public final static String          BASE_DIR                     = "/export/home/weblog5/classes";
*/  


  //** QA (EXODUS)**/
/*
  public static int                   ENVIRONMENT                  = QA;
  public static int                   WEBLOGIC_PORT                = 7001;
  public static String                SERVER_NAME                  = "www.topcoder.com";
  public static String                HOST_URL                     = "t3://jma-cluster.topcoder.com:7001";
  public static String                CONTEST_HOST_URL             = "t3://192.168.12.52:7013";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "192.168.12.51", "192.168.12.52" };
  public final static String          BASE_DIR                     = "/export/home/weblog5/jma_QA";
*/


  //** EXODUS **/
/*
  public static int                   ENVIRONMENT                  = PROD;
  public static int                   WEBLOGIC_PORT                = 7001;
  public static String                SERVER_NAME                  = "www.topcoder.com";
  public static String                HOST_URL                     = "t3://jma-cluster.topcoder.com:7001";
  public static String                CONTEST_HOST_URL             = "t3://192.168.12.52:7010";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "192.168.12.51", "192.168.12.52" };
  public final static String          BASE_DIR                     = "/export/home/weblog5/jma";
*/

  public       static String IAGREE = BASE_DIR + "/com/topcoder/common/terms.txt";
  public final static String JNDI_FACTORY="weblogic.jndi.WLInitialContextFactory";
  public final static String JMS_FACTORY="jms.connection.jmsFactory";
  public final static String JMS_BKP_FACTORY="jms.connection.jmsFactory_BKP";
  public final static String TRANS_FACTORY="javax.transaction.UserTransaction";
  public final static String EMAIL_QUEUE="eMailQueue";


  // WEBSITE EJBS
  public static String AUTHENTICATION_SERVICES    = "com.topcoder.ejb.AuthenticationServicesHome";
  public static String CODER_STATISTICS           = "com.topcoder.ejb.CoderStatisticsHome";
  public static String CORPORATE_CONTACT_SERVICES = "com.topcoder.ejb.CorporateContactServicesHome";
  public static String DATA_CACHE                 = "com.topcoder.ejb.DataCacheHome";
  public static String GRAPH                      = "com.topcoder.ejb.GraphHome";
  public static String NEWS_SERVICES              = "com.topcoder.ejb.NewsServicesHome";
  public static String REPORTING                  = "com.topcoder.ejb.ReportingHome";
  public static String SEARCH                     = "com.topcoder.ejb.SearchHome";
  public static String USER_SERVICES              = "com.topcoder.ejb.UserServicesHome";
  public static String UTIL                       = "com.topcoder.ejb.UtilHome";

  public final static String COMPILE_SERVICES="jma.CompileServicesHome";
  public final static String TEST_SERVICES="jma.TestServicesHome";
  public final static String CONTEST_SERVICES="jma.ContestServicesHome";
  public final static String WORLD_SERVICES="jma.WorldServicesHome";
  public final static String MPSQAS_SERVICES="jma.MPSQASServicesHome";

}
