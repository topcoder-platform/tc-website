package com.topcoder.mpsqas.common;
import java.util.*;

/** 
 *  ApplicationConstants is a list of constants used by
 *  the application and applet servers, Applet does not
 *  have access to these constants.
 */
public class ApplicationConstants
{
  /** Dev  Addresses*/
/*
  public static  String COMPILER_IP="172.16.1.152";
  public static  String TESTER_IP="172.16.1.152";
  public static  int GET_COMPILE_PORT=5032;
  public static  int PUT_COMPILE_PORT=5033;
  public static  int GET_TEST_PORT=5034;
  public static  int PUT_TEST_PORT=5036;
  public static  int INTERNAL_COMMUNICATION_PORT=5137;
  public static  String APPLET_SERVER_IP="172.16.1.153";
  public static  String BASE_CODE_PATH="/home/weblog5/classes";
*/

  /* QA Glastonbury */
/*
  public static  String COMPILER_IP="172.16.212.52";;
  public static  String TESTER_IP="172.16.212.52";
  public static  int GET_COMPILE_PORT=5032;
  public static  int PUT_COMPILE_PORT=5033;
  public static  int GET_TEST_PORT=5034;
  public static  int PUT_TEST_PORT=5035;
  public static  int INTERNAL_COMMUNICATION_PORT=5036;
  public static  String APPLET_SERVER_IP="172.16.210.55";
*/


  /* Prod */
  public static  String COMPILER_IP="192.168.12.55";
  public static  String TESTER_IP="192.168.12.55";
  public static  int GET_COMPILE_PORT=5032;
  public static  int PUT_COMPILE_PORT=5033;
  public static  int GET_TEST_PORT=5034;
  public static  int PUT_TEST_PORT=5035;
  public static  int INTERNAL_COMMUNICATION_PORT=5036;
  public static  String APPLET_SERVER_IP="192.168.10.56";
  public static  String BASE_CODE_PATH="/opt/weblog5/classes";

  /**internal message types*/
  public static final int CORRESPONDENCE_BROADCAST_IN=0,
                          ROUND_SCHEDULE_BROADCAST_IN=1,
                          PENDING_PROPOSAL_BROADCAST_IN=2,
                          PENDING_SUBMISSION_BROADCAST_IN=3,
                          PROBLEM_MODIFIED_BROADCAST_IN=4,
                          PENDING_APPLICATION_BROADCAST_IN=5;

  /**groups*/
  public static int ADMIN_GROUP=13;
  public static int PROBLEM_WRITER_GROUP=30;
  public static int PROBLEM_TESTER_GROUP=31;

  /**how long to wait for tests  / compiles / other messages*/
  public static long TIME_OUT_MILLIS=10000;

  /**minumum number of test cases allowed in a user's submission*/
  public static int MIN_TEST_CASES=5;

  /**contest segments*/
  public static int CODING_SEGMENT=1;
  public static int CHALLENGE_SEGMENT=2;

  /**how long after the start of a contest until it is really over */
  public static long DISPLAY_OLD_CONTEST = 86400000l; //24 hours

  /**problem user types*/
  public static final int PROBLEM_WRITER=5;
  public static final int PROBLEM_TESTER=6;
  public static final int PROBLEM_ADMIN=100;

  /**correspondence from email address*/
  public static String FROM_EMAIL_ADDRESS="contest@topcoder.com";

  /**application status*/
  public static int APPLICATION_PENDING=1;  
  public static int APPLICATION_REJECTED=2;  
  public static int APPLICATION_ACCEPTED=3;  

  /**timing for background processor*/
  public static long BACKGROUND_CHECK_FREQUENCY = 10000; 
  public static long CHAT_LOG_FREQUENCY = 20000;
  public static long UPCOMING_CONTESTS_CHECK_FREQUENCY = 20000;
  public static long PING_FREQUENCY = 200000;

  /**the smallest round id for a "real" contest (mpsqas ignores contests with 
     lower ids)*/
  public static int REAL_CONTEST_ID_LOWER_BOUND = 2000;

  /**payment*/
  public static int[][] WRITING_PAYMENT = { {100, 125, 150},   //div 1
                                            {50,  75,  100} }; //div 2
  public static int[][] TESTING_PAYMENT = { {50, 50, 50},      //div 1
                                            {25, 25, 25} };    //div 2

  /**application strings*/
  public static String SERVER_ERROR = "Server Error.  Please contact us.";
  public static String HORIZONTAL_RULE = 
  "----------------------------------------------------\n";

  /**Problem group describers for getting problems*/
  public static int PROBLEMS_FOR_CONTEST = 1;
  public static int SCHED_PROBLEMS_FOR_CONTEST = 2;
  public static int PROBLEMS_WITH_STATUS = 3;
  public static int USER_WRITTEN_PROBLEMS = 4;
  public static int USER_TESTING_PROBLEMS = 5;
  public static int ALL_PROBLEMS = 6;

  /**User group describers for getting users*/
  public static int TESTERS_FOR_PROBLEM = 1;
  public static int ALL_TESTERS = 2;
  public static int ALL_USERS = 3;

  /**
   * Returns a good looking string representation of an object.
   *
   * @params o The object to make pretty.
   */
  public static  String makePretty(Object result)
  {
    if(result==null) return "null";

    if(result.getClass().isArray())
    {
      StringBuffer buf = new StringBuffer(250);
      String type = result.getClass().getComponentType().toString();
      buf.append("{");
      try {
        if(type.equals("int")) {
          buf.append(((int[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((int[])result)[i]);
        }
        else if(type.equals("double")) {
          buf.append(((double[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((double[])result)[i]);
        }
        else if(type.equals("class java.lang.String")) {
          buf.append("\"" + ((String[]) result) [0] + "\"");
          for(int i= 1; ; i++)
            buf.append(", \"" + ((String[])result)[i] + "\"");
        }
        else if(type.equals("float")) {
          buf.append(((float[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((float[])result)[i]);
        }
        else if(type.equals("boolean")) {
          buf.append(((boolean[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((boolean[])result)[i]);
        }
        else if(type.equals("long")) {
          buf.append(((long[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((long[])result)[i]);
        }
        else if(type.equals("char")) {
          buf.append(((char[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((char[])result)[i]);
        }
        else if(type.equals("byte")) {
          buf.append(((byte[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((byte[])result)[i]);
        }
        else if(type.equals("short")) {
          buf.append(((short[]) result) [0]);
          for(int i= 1; ; i++)
            buf.append(", " + ((short[])result)[i]);
        }
        else if(type.equals("class java.lang.Object")) {
          buf.append(makePretty(((Object[]) result) [0]));
          for(int i= 1; ; i++)
            buf.append(", " + makePretty(((Object[])result)[i]));
        }
        else if(type.equals("class [I")) {  // multi-dimensional int array
          int[][] iArray = (int[][]) result;
          for(int i = 0; i < iArray.length; i++)
          {
            buf.append(makePretty(iArray[i]));
            if(i != (iArray.length-1))
              buf.append(", ");
          }
        }
        else if(type.equals("class [Ljava.lang.String;")) { // multi-dimensional string array
          String[][] sArray = (String[][]) result;
          for(int i = 0; i < sArray.length; i++)
          {
            buf.append(makePretty(sArray[i]));
            if(i != (sArray.length-1))
              buf.append(", ");
          }

        }
      } catch (Exception e) {}
      buf.append("}");

      return buf.toString();
    }
    else if(result instanceof java.util.ArrayList)
    {
      StringBuffer buf = new StringBuffer(250);
      ArrayList tmp = (ArrayList) result;
      buf.append("[");
      for (int i = 0; i < tmp.size(); i++)
      {
        buf.append(makePretty(tmp.get(i)));
        if(i != tmp.size()-1)
          buf.append(", ");
      }
      buf.append("]");
      return buf.toString();
    }
    else if(result instanceof java.lang.String) {
      return "\"" + result + "\"";
    }


    return result.toString();
  }

  /**
   * Compares two Objects.
   * 
   * @param o1 The first object to check
   * @param o2 The second object to check
   */
  public static  boolean compare(Object expected,Object result)
  {
        String expType = "";
    String resultType = "";

    if (result == null&&expected==null) {
      return(true);
    }
    if (result == null||expected==null) {
      return(false);
    }

    if(expected.getClass().isArray()) {
      if(result.getClass().isArray()) {
        expType = expected.getClass().getComponentType().toString();
        System.out.println("expType: " + expType);
        resultType = result.getClass().getComponentType().toString();
        if(expType.equals(resultType)) {
          System.out.println("exp and result types are equal.");
          if(expType.equals("int")) {
            return Arrays.equals((int[])expected, (int[])result);
          }
          else if(expType.equals("class java.lang.String")) {
            System.out.println("comparing string arrays");
            System.out.println("expected size: " + ((String[])expected).length);
            System.out.println("result size: " + ((String[])result).length);
            return Arrays.equals((String[])expected, (String[])result);
          }
          else if(expType.equals("double")) {
            return Arrays.equals((double[])expected, (double[])result);
          }
           else if(expType.equals("float")) {
            return Arrays.equals((float[])expected, (float[])result);
          }
           else if(expType.equals("boolean")) {
            return Arrays.equals((boolean[])expected, (boolean[])result);
          }
           else if(expType.equals("long")) {
            return Arrays.equals((long[])expected, (long[])result);
          }
          else if(expType.equals("char")) {
            return Arrays.equals((char[])expected, (char[])result);
          }
          else if(expType.equals("byte")) {
            return Arrays.equals((byte[])expected, (byte[])result);
          }
          else if(expType.equals("short")) {
            return Arrays.equals((short[])expected, (short[])result);
          }
        }
        else {
          return false;
        }
      }
      else {
        return false;
      }
    }
    else if(expected instanceof Number) {
      if(result instanceof Number) {
        return (expected.toString()).equals(result.toString());
      }
      else {
        return false;
      }
    }
    //Not an array or a number so just compare the objects
    else {
      return expected.equals(result);
    }

    return false;
  }
}
