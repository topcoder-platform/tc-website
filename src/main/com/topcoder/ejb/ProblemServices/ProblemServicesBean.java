
  package com.topcoder.ejb.ProblemServices;
  
  import java.sql.*;
  import javax.naming.*;
  import javax.ejb.*;
  import java.util.*;
  import java.io.*;
  import java.rmi.RemoteException;
  import com.topcoder.common.web.data.*;
  import com.topcoder.common.*;
  import com.topcoder.ejb.ContestAdminServices.*;
  import com.topcoder.tcclasses.*;
 
  /**
  * Stateless Session EJB that extends BaseEJB. This class is mainly used by the 
  * Problem Administration Tool for creating and managing problems. 
  *
  * @author ademich
  */
  public class ProblemServicesBean extends com.topcoder.ejb.BaseEJB {
    protected SessionContext ctx;
    protected Properties props;
    final static boolean verbose = true;
    
   /**
    * Inserts a new problem into the problem table. The method first retrieves a 
    * problem_id from the database with a call to DBMS.getSeqId for the problem
    * sequence. Then the following fields are inserted: problem_id, result_type_id (result_type),
    * method_name, class_name, status (active_ind), difficulty_id. Calls are made to 
    * insertProblemText  and insertProblemParameters.
    * 
    * @exception RemoteException
    * @param problem - Problem
    * @return int - new problem_id
    */ 
    public void insertProblem(Problem problem, HashMap environments) throws RemoteException {
      Log.msg(verbose,"insertProblem(Problem, HashMap) called ...");
     
      Connection conn = null;
      Connection conn2 = null; //used for other QA

      try { 
        //if the user chose to save the problem to the DEV environment, get the connection to the DB
        //and call insertProblem.
        if( ((Boolean)environments.get("DEV")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) { 
              ex.printStackTrace(); 
            }
            conn = DriverManager.getConnection("jdbc:postgresql://172.16.1.151:5432/jmabeta", "coder", "coder");
            conn.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://172.16.1.151:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
          System.out.println("\ninserting problem: DEV");
          insertProblem(problem, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
        }
        if( ((Boolean)environments.get("QA")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) { 
              ex.printStackTrace(); 
            }
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.14.52:5432/qa_transactional", "coder", "coder");
            conn.setAutoCommit(false);
     
            conn2 = DriverManager.getConnection("jdbc:postgresql://172.16.214.51:5432/qa_transactional", "coder", "coder");
            conn2.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            //conn = DriverManager.getConnection("jdbc:informix-sqli://192.168.14.52:2020/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
            conn2 = DriverManager.getConnection("jdbc:informix-sqli://172.16.214.51:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
/*
          System.out.println("\ninserting problem: QA-PROD");
          insertProblem(problem, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
*/

          System.out.println("\ninserting problem: QA-LOCAL");
          insertProblem(problem, conn2);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn2.commit();
          }
          conn2.close();
        }
        if( ((Boolean)environments.get("PROD")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.14.51:5432/tcoltp", "coder", "coder");
            conn.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://192.168.14.51:2020/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }

          System.out.println("\ninserting problem: PROD");
          insertProblem(problem, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
        }
      }
      catch(Exception e) {
        e.printStackTrace();
        throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (conn != null) {
            conn.commit();
            conn.close();
          }
          if (conn2 != null) {
            conn2.commit();
            conn2.close();
          }
        } catch (Exception ignore) {  }
      }
            
    }


    /////////////////////////////////////////////////////////////////////////////////////////////////
    public int insertProblem(Problem problem, Connection conn) throws RemoteException {
    /////////////////////////////////////////////////////////////////////////////////////////////////
      Log.msg(verbose,"insertProblem(Problem, Connection) called ...");

      PreparedStatement ps = null;
      ResultSet rs = null;

      int problem_id = -1;

      StringBuffer txtProblems = new StringBuffer(200);
      if(DBMS.DB == DBMS.POSTGRES) {
        txtProblems.append(" INSERT INTO problems (problem_id, result_type, ").
                    append(" method_name, class_name, difficulty_level_id, active_ind) ").
                    append(" VALUES (?, ?, ?, ?, ?, ?) ");
      }
      else {
        txtProblems.append(" INSERT INTO problem (problem_id, result_type_id, ").
                    append(" method_name, class_name, difficulty_id) ").
                    append(" VALUES (?, ?, ?, ?, ?) ");
      }


      try {
        //problem_id = getNextProblemId();
        //conn = DBMS.getConnection();
        problem_id = DBMS.getSeqId(conn, DBMS.PROBLEM_SEQ);
        problem.setProblemId(problem_id);
        ps = conn.prepareStatement(txtProblems.toString());
        ps.setInt(1, problem_id);
        if(DBMS.DB == DBMS.POSTGRES) {
          ps.setString(2, problem.getResultType());
        }
        else {
          ps.setInt(2, problem.getResultTypeId());
        }
        ps.setString(3, problem.getMethodName());
        ps.setString(4, problem.getClassName ());
        ps.setInt(5, problem.getDifficultyId());
        if(DBMS.DB == DBMS.INFORMIX) {
          ps.setString(6, "A"); /**** for now ****/
        }

        int RetVal = ps.executeUpdate();
        if (RetVal != 1)  {
          throw new RemoteException("ProblemServicesBean:insertProblem: Error Problem " +
          problem.getProblemId() + " failed to be inserted in the database ");
        }
      
        if(DBMS.DB == DBMS.POSTGRES) {
          conn.commit();
        }

        // Insert Problem Text
        String problemText = problem.getProblemText();
        if (problemText != null) {
          insertProblemText(problem_id, problemText, conn);
        }

        if(DBMS.DB == DBMS.POSTGRES) {
          conn.commit();
        }

        // Insert Problem Parameters
        //ArrayList vtrProblemParameters = problem.getProblemParameters();
        ArrayList vtrProblemParameters = problem.getParamTypes();
        if (vtrProblemParameters.size() > 0) {
          insertProblemParameters(problem.getClassName(), vtrProblemParameters, conn);
        }
 
      } catch (Exception e) {
           e.printStackTrace();
           throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null)   ps.close();
        } catch (Exception ignore) {  }
      }


      return problem_id;

    }
        

    /**
    * Inserts problemText into the problem table.
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem
    * @param problemText - String containing the problem statement.
    */ 
    public void insertProblemText(int problem_id, String problemText, Connection conn)  throws RemoteException  {
      Log.msg(verbose,"insertProblemText(String, String, Connection) called ...");

      PreparedStatement ps = null;
      ResultSet rs = null;

      //ByteArrayOutputStream baos = null;

      StringBuffer txtProblemText = new StringBuffer(100);

      try {
        //if POSTGRES, check to see if problem text exists in problem_text table.

        txtProblemText.append(" INSERT INTO problem_text (problem_text, problem_id) ").
                       append(" VALUES (?,?) ");

        ps = conn.prepareStatement(txtProblemText.toString());

         //baos = getByteArrayOutputStream(problemText);

          ps.setInt(2, problem_id);
          //ps.setBytes(1, baos.toByteArray());

          if (DBMS.DB == DBMS.INFORMIX) {
            ps.setBytes(1, DBMS.serializeTextString(problemText));
          }
          else if (DBMS.DB == DBMS.POSTGRES) {
            ps.setString(1, problemText);
          }

          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new RemoteException ("ProblemServicesBean:insertProblemText failed");
          }

      } catch (Exception e)  {
        throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
        } catch (Exception ignore) { }
      }

    }

    ////////////////////////////////////////////////////////////////////////////////////////////
    public void updateProblemText(String class_name, String problemText, Connection conn)  throws RemoteException  {
    ////////////////////////////////////////////////////////////////////////////////////////////
      Log.msg(verbose,"updateProblemText(String, String, Connection) called ...");

      PreparedStatement ps = null;
      ResultSet rs = null;

      //ByteArrayOutputStream baos = null;

      StringBuffer txtProblemText = new StringBuffer(100);

      try {
        //if POSTGRES, check to see if problem text exists in problem_text table.
        if(DBMS.DB == DBMS.POSTGRES) {
          StringBuffer selectProblemText = new StringBuffer(100);

          txtProblemText.append(" UPDATE problem_text ").
                         append(" SET problem_text = ? ").
                         append(" WHERE problem_id = (SELECT problem_id ").
                         append("                     FROM problems ").
                         append("                     WHERE class_name = ?) ");
        }
        else {
          txtProblemText.append(" UPDATE problem ").
                         append(" SET problem_text = ? ").
                         append(" WHERE class_name = ? ");
        }


        ps = conn.prepareStatement(txtProblemText.toString());

         //baos = getByteArrayOutputStream(problemText);

          ps.setString(2, class_name);
          //ps.setBytes(1, baos.toByteArray());

          if (DBMS.DB == DBMS.INFORMIX) {
            ps.setBytes(1, DBMS.serializeTextString(problemText));
          }
          else if (DBMS.DB == DBMS.POSTGRES) {
            ps.setString(1, problemText);
          }

          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new RemoteException ("ProblemServicesBean:updateProblemText failed");
          }

      } catch (Exception e)  {
        throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
        } catch (Exception ignore) { }
      }

    }


            
    /**
    * Essentially inserts a problem's param_types into the database.
    * Gets a handle to Contest EJB and calls the insertBlobObject method
    * with table = problem, field = param_types,
    * "problem_id=" + problem_id as the whereClause variable, and an
    * ArrayList of Problem Parameter Types.
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem 
    * @param vtrProbParams - ArrayList of problem Parameter Types.
    */
    public void insertProblemParameters(String class_name, ArrayList vtrProbParams, Connection conn) throws RemoteException {
      Log.msg(verbose, "insertProblemParameters(String, ArrayList, Connection) called ...");

      PreparedStatement ps = null;
      StringBuffer insProbParamBuf = new StringBuffer(100);
      byte[] bytes = null;      

      if(DBMS.DB == DBMS.POSTGRES) {
        insProbParamBuf.append(" UPDATE problems "); 
      }
      else {
        insProbParamBuf.append(" UPDATE problem ");
      }
      
      insProbParamBuf.append(" SET param_types = ? ").
                      append(" WHERE class_name = ? ");

      try {
        ps = conn.prepareStatement(insProbParamBuf.toString());
        bytes = DBMS.serializeBlobObject(vtrProbParams);
        if(bytes != null) {
          ps.setBytes(1, bytes);
        }
        else {
          throw new RemoteException("ProblemServices.insertProblemParameters: error serializing the blob object");
        }

        ps.setString(2, class_name);
        ps.executeUpdate();

      } catch (Exception e) {
        throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
        } catch (Exception ignore) { }
      }
    }

     
    /**
    * Inserts a test case into the system_test_case table. The method first inserts the problem_id
    * and test_case_id. Then, insertTestCaseBlobs is called to update the inserted test case 
    * with the test case arguments and expected results. 
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem
    * @param test_case_args - Object of Test Case Argument values
    * @param expected_result - Object of Expected Result values
    */
    public int insertTestCase(int problem_id, Object test_case_args, Object expected_result) throws RemoteException {
      Log.msg(verbose, "insertTestCase(problem_id, test_cast_args, expected_result) called ...");
                 
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      ArrayList testCaseArgs = null;
      int test_case_id = 0;
      

      StringBuffer txtTestCases = new StringBuffer();
      if(DBMS.DB == DBMS.POSTGRES) {
        txtTestCases.append(" INSERT INTO system_test_cases (problem_id, test_case_id) ").
                     append(" VALUES (?, ?) ");
      }
      else {
        txtTestCases.append(" INSERT INTO system_test_case (problem_id, test_case_id) ").
                     append(" VALUES (?, ?) ");
      }
               
      try {
        conn = DBMS.getConnection();

        //test_case_id = getNextTestCaseId();
        test_case_id = DBMS.getSeqId(conn, DBMS.JMA_SEQ);

        ps = conn.prepareStatement(txtTestCases.toString());
          
        ps.setInt(1,problem_id);
        ps.setInt(2,test_case_id);
               
        int RetVal = ps.executeUpdate();
        if (RetVal != 1) {
          throw new RemoteException ("ProblemServicesBean:insertTestCase() failed");
        }

        insertTestCaseBlobs(test_case_id, test_case_args, expected_result);


      } catch (Exception e) {
          e.printStackTrace();
          throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
          if (conn != null) conn.close();
        } catch (Exception ignore) {  }
      }

      return test_case_id;

    }

    /**
    * Inserts test case arguments and expected results into the system_test_case
    * table. Makes calls to Contest.insertBlobObject.
    *
    * @exception RemoteException
    * @param test_case_id - int value uniquely identifying a Test Case
    * @param test_case_args - Object of Test Case Argument values
    * @param expected_result - Object of Expected Result values
    */
    public void insertTestCaseBlobs(int test_case_id, Object test_case_args, Object expected_result) throws RemoteException {
      Log.msg(verbose, "insertTestCaseBlobs() called ...");
                 
      String table = "";
      String field = "";
      String whereClause = "";
                     
      try {
        InitialContext ctx = TCContext.getInitial();
        ContestAdminServicesHome cHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        ContestAdminServices c = (ContestAdminServices) cHome.create();
        ctx.close();
        ctx = null;
 
        // Insert Test Case Args
        if(DBMS.DB == DBMS.POSTGRES) {
          table = "system_test_cases";
        }
        else {
          table = "system_test_case";
        }
         
        field = "args";
        whereClause = "test_case_id=" + test_case_id;
        c.insertBlobObject(table, field, test_case_args, whereClause);

        // Insert Expected Result
        if(DBMS.DB == DBMS.POSTGRES) {
          table = "system_test_cases";
        }
        else {
          table = "system_test_case";
        }
        field = "expected_result";
        whereClause = "test_case_id=" + test_case_id;
        c.insertBlobObject(table, field, expected_result, whereClause);


      } catch (Exception e) {
          throw new RemoteException (e.getMessage());
      }

    }

    /**
    * Updates a problem in the problem table. Retrieves the result_type_id (result_type), 
    * method_name, class_name and difficulty_id from the Problem object (problem) 
    * and updates a problem with those values.
    *
    * @exception RemoteException
    * @param problem - Problem
    * @param paramTypesModified - true if the problem paramTypes need to be updated,
    *                             false otherwise
    */ 
    public void updateProblem(Problem problem, boolean paramTypesModified, HashMap environments) throws RemoteException {
      Log.msg(verbose,"updateProblem(Problem, paramTypesModified, environments) called ...");

      Connection conn = null;
      Connection conn2 = null;

      try {
        //if the user chose to save the problem to the DEV environment, get the connection to the DB
        //and call updateProblem.
        if( ((Boolean)environments.get("DEV")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://172.16.1.151:5432/jmabeta", "coder", "coder");
            conn.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://172.16.1.151:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
          System.out.println("\nupdating problem: DEV"); 
          updateProblem(problem, paramTypesModified, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
        }
        if( ((Boolean)environments.get("QA")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.14.52:5432/qa_transactional", "coder", "coder");
            conn.setAutoCommit(false);

            conn2 = DriverManager.getConnection("jdbc:postgresql://172.16.214.51:5432/qa_transactional", "coder", "coder");
            conn2.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            //conn = DriverManager.getConnection("jdbc:informix-sqli://192.168.14.52:2020/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
            conn2 = DriverManager.getConnection("jdbc:informix-sqli://172.16.214.51:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
/*
          System.out.println("\nupdating problem: QA-PROD");
          updateProblem(problem, paramTypesModified, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
*/
          System.out.println("\nupdating problem: QA-LOCAL");
          updateProblem(problem, paramTypesModified, conn2);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn2.commit();
          }
          conn2.close();

        }
        if( ((Boolean)environments.get("PROD")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.14.51:5432/tcoltp", "coder", "coder");
            conn.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://192.168.14.51:2020/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
          System.out.println("\nupdating problem: PROD");
          updateProblem(problem, paramTypesModified, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
        }
      }
      catch(Exception e) {
        e.printStackTrace();
        throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (conn != null) {
            conn.commit();
            conn.close();
          }
          if (conn2 != null) {
            conn2.commit();
            conn2.close();
          }
        } catch (Exception ignore) {  }
      }

    }

    ///////////////////////////////////////////////////////////////////////////
    public void updateProblem(Problem problem, boolean paramTypesModified, Connection conn) throws RemoteException {
    ///////////////////////////////////////////////////////////////////////////
      Log.msg(verbose,"updateProblem(Problem, paramTypesModified, Connection) called ...");

      PreparedStatement ps = null;
      ResultSet rs = null;
      int problem_id = problem.getProblemId();

      StringBuffer txtProblems = new StringBuffer(150);
      if(DBMS.DB == DBMS.POSTGRES) {
        txtProblems.append(" UPDATE problems ").
                    append(" SET result_type = ?, method_name = ?, class_name = ?, difficulty_level_id = ? ").
                    append(" WHERE class_name = ? ");
      }
      else {
        txtProblems.append(" UPDATE problem ").
                    append(" SET result_type_id = ?, method_name = ?, class_name = ?, difficulty_id = ? ").
                    append(" WHERE class_name = ? ");
      }


      try {
        ps = conn.prepareStatement(txtProblems.toString());

        if(DBMS.DB == DBMS.POSTGRES) {
          ps.setString(1, problem.getResultType());
        }
        else {
          ps.setInt(1, problem.getResultTypeId());
        }
        ps.setString(2, problem.getMethodName());
        ps.setString(3, problem.getNewClassName());
        //ps.setString(5, problem.getActiveInd());
        ps.setInt(4, problem.getDifficultyId());
        ps.setString(5, problem.getClassName());

        int RetVal = ps.executeUpdate();
        if (RetVal != 1)  {
          throw new RemoteException("ProblemServicesBean:updateProblem: Error Problem " +
          problem.getProblemId() + " failed to be updated in the database ");
        }

        if(DBMS.DB == DBMS.POSTGRES) {
          conn.commit();
        }

        // Update Problem Text
        String problemText = problem.getProblemText();
        if (problemText != null) {
          updateProblemText(problem.getNewClassName(), problemText, conn);
        }

        if(DBMS.DB == DBMS.POSTGRES) {
          conn.commit();
        }

        if(paramTypesModified) {
          // Update Problem Parameters
          //ArrayList vtrProblemParameters = problem.getProblemParameters();
          ArrayList vtrProblemParameters = problem.getParamTypes();
          if (vtrProblemParameters.size() > 0) {
            insertProblemParameters(problem.getNewClassName(), vtrProblemParameters, conn);
          }
        }

      } catch (Exception e) {
           e.printStackTrace();
           throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null)   ps.close();
        } catch (Exception ignore) {  }
      }

    }

    
    /**
    * Serializes an object by creating a ByteArrayOutputStream from it. 
    *
    * @exception RemoteException
    * @param obj - Object
    * @return ByteArrayOutputStream
    */
/*
    private ByteArrayOutputStream getByteArrayOutputStream(Object obj) throws RemoteException {
      Log.msg(verbose,"getByteArrayOutputStream(Object) called ...");
       
      ByteArrayOutputStream baos = null;
      ByteArrayInputStream bs = null;
      ObjectOutputStream  oos = null;

         if (obj != null) {
           try {
             baos = new ByteArrayOutputStream();
             oos = new ObjectOutputStream(baos);
             oos.writeObject(obj);
             oos.close();
           } catch (Exception e) {
              System.out.println("Serialization error in getByteArrayOutputStream");
           }
         } else {
              throw new RemoteException ("Serialization error in getByteArrayOutputStream");
         }

          return baos;
          
    }
*/

    /**
    * Deletes all test cases associated with a problem
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem
    */
    public void deleteTestCases(int problem_id) throws RemoteException {
      Log.msg(verbose, "deleteTestCases(problem_id) called ...");
                 
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      StringBuffer txtTestCases = new StringBuffer();
      if(DBMS.DB == DBMS.POSTGRES) {
        txtTestCases.append(" DELETE FROM system_test_cases ").
                     append(" WHERE problem_id = ? ");
      }
      else {
        txtTestCases.append(" DELETE FROM system_test_case ").
                     append(" WHERE problem_id = ? ");
      }
               
      try {
        conn = DBMS.getConnection();
        ps = conn.prepareStatement(txtTestCases.toString());
          
        ps.setInt(1,problem_id);
               
        ps.executeUpdate();
        
      } catch (Exception e) {
          throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
          if (conn != null) conn.close();
        } catch (Exception ignore) {  }
      }

    }

    /**
    * Deletes all test cases associated with a problem
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem
    * @param conn - Connection object used to connect to a particular database
    */
    public void deleteTestCases(int problem_id, Connection conn) throws RemoteException {
      Log.msg(verbose, "deleteTestCases(problem_id, conn) called ...");

      PreparedStatement ps = null;
      ResultSet rs = null;

      StringBuffer txtTestCases = new StringBuffer();
      if(DBMS.DB == DBMS.POSTGRES) {
        txtTestCases.append(" DELETE FROM system_test_cases ").
                     append(" WHERE problem_id = ? ");
      }
      else {
        txtTestCases.append(" DELETE FROM system_test_case ").
                     append(" WHERE problem_id = ? ");
      }

      try {
        ps = conn.prepareStatement(txtTestCases.toString());

        ps.setInt(1,problem_id);

        ps.executeUpdate();

      } catch (Exception e) {
          throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
        } catch (Exception ignore) {  }
      }

    }

    /**
    * Deletes a test case from the database.
    *
    * @exception RemoteException
    * @param test_case_id - int value uniquely identifying a test case
    */
    public void deleteTestCase(int test_case_id) throws RemoteException {
      Log.msg(verbose, "deleteTestCase(test_case_id) called ...");
                 
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      StringBuffer txtTestCases = new StringBuffer();
      if(DBMS.DB == DBMS.POSTGRES) {
        txtTestCases.append(" DELETE FROM system_test_cases ").
                     append(" WHERE test_case_id = ? ");
      }
      else {
        txtTestCases.append(" DELETE FROM system_test_case ").
                     append(" WHERE test_case_id = ? ");
      }
               
      try {
        conn = DBMS.getConnection();
        ps = conn.prepareStatement(txtTestCases.toString());
          
        ps.setInt(1,test_case_id);
               
        ps.executeUpdate();
        
      } catch (Exception e) {
          throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
          if (conn != null) conn.close();
        } catch (Exception ignore) {  }
      }

    }

    /**
    * Deletes a problem from the database
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem
    */
    public void deleteProblem(int problem_id) throws RemoteException {
      Log.msg(verbose, "deleteProblem(problem_id) called ...");
                 
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      StringBuffer txtProblems = new StringBuffer();
      StringBuffer txtProblemText = new StringBuffer();

      if(DBMS.DB == DBMS.POSTGRES) {
        txtProblems.append(" DELETE FROM problems ").
                    append(" WHERE problem_id = ? ");

        txtProblemText.append(" DELETE FROM problem_text ").
                       append(" WHERE problem_id = ? ");
      }
      else {
        txtProblems.append(" DELETE FROM problem ").
                    append(" WHERE problem_id = ? ");
      }
               
      try {
        //delete the test cases
        deleteTestCases(problem_id);

        conn = DBMS.getConnection();

        if(DBMS.DB == DBMS.POSTGRES) {
          //delete problem_text
          ps = conn.prepareStatement(txtProblemText.toString());
          ps.setInt(1,problem_id);
          ps.executeUpdate();
        }

        //delete the problem
        ps = conn.prepareStatement(txtProblems.toString());
        ps.setInt(1,problem_id);
        ps.executeUpdate();
        
        
      } catch (Exception e) {
          throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
          if (conn != null) conn.close();
        } catch (Exception ignore) {  }
      }

    }

    /**
    * Deletes a problem from the database
    *
    * @exception RemoteException
    * @param class_name - String representing a problem's class name
    * @param environments - HashMap containing the environments to delete the problem from
    */
    public void deleteProblem(String class_name, HashMap environments) throws RemoteException {
      Log.msg(verbose,"deleteProblem(String, HashMap) called ...");

      Connection conn = null;
      Connection conn2 = null; //used for other QA

      try {
        //if the user chose to delete the problem from the DEV environment, get the connection to the DB
        //and call deleteProblem.
        if( ((Boolean)environments.get("DEV")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://172.16.1.151:5432/jmabeta", "coder", "coder");
            conn.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://172.16.1.151:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
          System.out.println("\ndeleting problem: DEV");
          deleteProblem(class_name, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
        }
        if( ((Boolean)environments.get("QA")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.14.52:5432/qa_transactional", "coder", "coder");
            conn.setAutoCommit(false);

            conn2 = DriverManager.getConnection("jdbc:postgresql://172.16.214.51:5432/qa_transactional", "coder", "coder");
            conn2.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://192.168.14.52:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
            conn2 = DriverManager.getConnection("jdbc:informix-sqli://172.16.214.51:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
          System.out.println("\ndeleting problem: QA-PROD");
          deleteProblem(class_name, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();

          System.out.println("\ndeleting problem: QA-LOCAL");
          deleteProblem(class_name, conn2);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn2.commit();
          }
          conn2.close();
        }
        if( ((Boolean)environments.get("PROD")).booleanValue() ) {
          if(DBMS.DB == DBMS.POSTGRES) {
            try {
              Class.forName(DBMS.POSTGRES_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.14.51:5432/tcoltp", "coder", "coder");
            conn.setAutoCommit(false);
          }
          else if(DBMS.DB == DBMS.INFORMIX) {
            try {
              Class.forName(DBMS.INFORMIX_DRIVER);
            } catch(Exception ex) {
              ex.printStackTrace();
            }
            conn = DriverManager.getConnection("jdbc:informix-sqli://192.168.14.51:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
          }
          System.out.println("\ndeleting problem: PROD");
          deleteProblem(class_name, conn);
          if(DBMS.DB == DBMS.POSTGRES) {
            conn.commit();
          }
          conn.close();
        }
      }
      catch(Exception e) {
        e.printStackTrace();
        throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (conn != null) {
            conn.commit();
            conn.close();
          }
          if (conn2 != null) {
            conn2.commit();
            conn2.close();
          }
        } catch (Exception ignore) {  }
      }

    }



    /**
    * Deletes a problem from the database
    *
    * @exception RemoteException
    * @param class_name - String value representing a problem's class_name
    * @param conn - Connection object used to connect to a particular database
    */
    public void deleteProblem(String class_name, Connection conn) throws RemoteException {
      Log.msg(verbose, "deleteProblem(class_name, conn) called ...");

      PreparedStatement ps = null;
      ResultSet rs = null;
      int problem_id = 0;

      StringBuffer txtProblems = new StringBuffer();
      if(DBMS.DB == DBMS.POSTGRES) {
        txtProblems.append(" SELECT problem_id ").
                    append(" FROM problems ").
                    append(" WHERE class_name = ? ");
      }
      else {
        txtProblems.append(" SELECT problem_id ").
                    append(" FROM problem ").
                    append(" WHERE class_name = ? ");
      }

      try {
        ps = conn.prepareStatement(txtProblems.toString());
        ps.setString(1, class_name);
        rs = ps.executeQuery();

        if(rs.next()) {
          problem_id = rs.getInt(1);
        }
        else {
          throw new RemoteException("Problem Not Found in Database");
        } 

        StringBuffer txtProblemText = new StringBuffer();
 
        if(DBMS.DB == DBMS.POSTGRES) {
          txtProblems.replace(0, txtProblems.length(), " DELETE FROM problems ").
                      append(" WHERE problem_id = ? ");

          txtProblemText.append(" DELETE FROM problem_text ").
                         append(" WHERE problem_id = ? ");
        }
        else {
          txtProblems.replace(0, txtProblems.length(), " DELETE FROM problem ").
                      append(" WHERE problem_id = ? ");
        }

        //delete the test cases
        deleteTestCases(problem_id, conn);

        if(DBMS.DB == DBMS.POSTGRES) {
          //delete problem_text
          ps = conn.prepareStatement(txtProblemText.toString());
          ps.setInt(1,problem_id);
          ps.executeUpdate();
        }

        //delete the problem
        ps = conn.prepareStatement(txtProblems.toString());
        ps.setInt(1,problem_id);
        ps.executeUpdate();


      } catch (Exception e) {
          throw new RemoteException (e.getMessage());
      }
      finally {
        try {
          if (ps != null) ps.close();
        } catch (Exception ignore) {  }
      }

    }

    /**
    * Method to inactivate a Problem. Updates the active_ind field to 'I'
    * in the PROBLEM table. 
    *
    * @exception RemoteException
    * @param problem_id - int value uniquely identifying a problem
    */
    public void inactivateProblem(int problem_id) throws RemoteException {
      Log.msg(verbose,"inactivateProblem() called ...");
         
      Connection conn = null;
      PreparedStatement ps = null;
      String txtDltProb = "";
      if(DBMS.DB == DBMS.POSTGRES) {
        txtDltProb = " UPDATE Problems SET active_ind = 'I' WHERE problem_id = ? ";
      }
      else {
        txtDltProb = " UPDATE Problem SET status = 'I' WHERE problem_id = ? ";
      }
                     
      try {
        conn = DBMS.getConnection();
        ps = conn.prepareStatement(txtDltProb);
                
        ps.setInt(1, problem_id); 
                    
        int RetVal = ps.executeUpdate();
        if (RetVal != 1)  {
          throw new RemoteException("ProblemServicesBean:inactivateProblem: Error " +
          " failed to inactivate Problem " + problem_id);
        }
      } catch (Exception e)  {
           throw new RemoteException (e.getMessage());
       }
       finally  {
         try  {
           if (ps != null)  ps.close();
           if (conn != null) conn.close();
         } catch (Exception ignore) {  }
       }
    }

      
    /** 
    * This method returns the next problem_id (MAX(problem_id) + 1) from the PROBLEMS table. 
    *
    * @exception RemoteException
    * @return int representing the next unique problem_id from the PROBLEMS table.
    */
    public int getNextProblemId() throws RemoteException
    {
      if (verbose) Log.msg("ProblemServices.getNextProblemId() called ...");

      int retVal = -1;

      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      StringBuffer sqlStr = new StringBuffer(100);

      try {
        conn = DBMS.getConnection();

        if(DBMS.DB == DBMS.POSTGRES) {
          sqlStr.append("SELECT MAX(problem_id) + 1 as problem_id FROM problems ");
        }
        else {
          sqlStr.append("SELECT MAX(problem_id) + 1 as problem_id FROM problem ");
        }

        ps = conn.prepareStatement(sqlStr.toString());
        rs = ps.executeQuery();

        if(rs.next())
        {
          retVal = rs.getInt(1);
          
          System.out.println("problem_id retVal: " + retVal);
          if( retVal <= 0 ) {
            retVal = 1;
          }
        }

      }
      catch (SQLException e) {
        e.printStackTrace();
      }
      finally {
        try {
          if (ps != null) ps.close();
          if (conn != null) conn.close();
        } catch (Exception ignore) { }
      }

      return retVal;
    }

    /**
    * This method returns the next test_case_id (MAX(test_case_id) + 1) from the SYSTEM_TEST_CASES table.
    *
    * @exception RemoteException
    * @return int representing the next unique test_case_id from the SYSTEM_TEST_CASES table.
    */
    public int getNextTestCaseId() throws RemoteException
    {
      if (verbose) Log.msg("ProblemServices.getNextTestCaseId() called ...");

      int retVal = -1;

      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      StringBuffer sqlStr = new StringBuffer(100);

      try {
        conn = DBMS.getConnection();

        if(DBMS.DB == DBMS.POSTGRES) {
          sqlStr.append("SELECT MAX(test_case_id) + 1 as test_case_id FROM system_test_cases ");
        }
        else {
          sqlStr.append("SELECT MAX(test_case_id) + 1 as test_case_id FROM system_test_case ");
        }

        ps = conn.prepareStatement(sqlStr.toString());
        rs = ps.executeQuery();

        if(rs.next())
        {
          retVal = rs.getInt(1);
          
          if( retVal <= 0 ) {
            retVal = 1;
          }
        }

      }
      catch (SQLException e) {
        e.printStackTrace();
      }
      finally {
        try {
          if (ps != null) ps.close();
          if (conn != null) conn.close();
        } catch (Exception ignore) { }
      }

      return retVal;
    }


    /**
    * Retrieves all problems and some corresponding characteristics from the 
    * PROBLEMS and DIFFICULTY_LEVELS tables
    *
    * @exception RemoteException
    * @return ArrayList of ProblemAttribute objects.
    */
    public ArrayList getProblemList() throws RemoteException {
      if(verbose) Log.msg("ProblemServices.getProblemList() called ... ");

      ArrayList results = new ArrayList();
      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      Problem problem = null;

       StringBuffer txtGetProblem = new StringBuffer();

       if(DBMS.DB == DBMS.POSTGRES) {
         txtGetProblem.append(" SELECT p.problem_id, p.method_name, p.class_name, ").
                       append(" p.result_type, p.active_ind, d.difficulty_level ").
                       append(" FROM problems p, difficulty_levels d " ).
                       append(" WHERE p.difficulty_level_id = d.difficulty_level_id ").
                       append(" ORDER BY problem_id ");
       }
       else {
         txtGetProblem.append(" SELECT p.problem_id, p.method_name, p.class_name, ").
                       append(" dt.data_type_desc, p.status, d.difficulty_level, p.result_type_id ").
                       append(" FROM problem p, difficulty d, data_type dt " ).
                       append(" WHERE p.difficulty_id = d.difficulty_id ").
                       append(" AND p.result_type_id = dt.data_type_id ").
                       append(" ORDER BY problem_id ");
       }

       
       try {
         conn = DBMS.getConnection();


         ps = conn.prepareStatement(txtGetProblem.toString());
         rs = ps.executeQuery();

         while (rs.next()) {
            problem = new Problem();
            problem.setProblemId(rs.getInt(1));
            problem.setMethodName(rs.getString(2));
            problem.setClassName(rs.getString(3));
            problem.setResultType(rs.getString(4));
            problem.setActiveInd(rs.getString(5));
            problem.setDifficulty(rs.getString(6));
            if(DBMS.DB != DBMS.POSTGRES) {
              problem.setResultTypeId(rs.getInt(7));
            }
            results.add(problem);
         }

       }
       catch (SQLException e) {
         e.printStackTrace();
       }
       finally {
         try {
           if (ps != null) ps.close();
           if (conn != null) conn.close();
         } catch (Exception ignore) { }
       }

       return results;

    }

    /**
    * Retrieves all problem characteristics from the 
    * PROBLEMS, DIFFICULTY_LEVELS and PROBLEM_TEXT tables
    *
    * @exception RemoteException
    * @return Problem object
    */
    public Problem getProblem(int problem_id) throws RemoteException {
      if(verbose) Log.msg("ProblemServices.getProblem() called ... ");

      ArrayList paramTypes = new ArrayList();
      Object blobObject = null;
    
      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      Problem problem = new Problem();;
      
      String whereClause = "problem_id=" + problem_id;
      String table = "problem";
      if(DBMS.DB == DBMS.POSTGRES) {
        table = "problems";
      }
      String field = "param_types";
      String problem_text = null;
      

       StringBuffer txtGetProblem = new StringBuffer(300);
       
       if(DBMS.DB == DBMS.POSTGRES) {
         txtGetProblem.append(" SELECT p.problem_id, p.method_name, p.class_name, ").
                       append(" p.result_type, p.active_ind, p.difficulty_level_id, ").
                       append(" d.difficulty_level, pt.problem_text, p.param_types ").
                       append(" FROM difficulty_levels d, problems p LEFT OUTER JOIN problem_text pt " ).
                       append(" ON p.problem_id = pt.problem_id ").
                       append(" WHERE p.problem_id = ? AND ").
                       append(" p.difficulty_level_id = d.difficulty_level_id ");
       }
       else {
         txtGetProblem.append(" SELECT p.problem_id, p.method_name, p.class_name, ").
                       append(" dt.data_type_desc, p.status, p.difficulty_id, ").
                       append(" d.difficulty_level, p.problem_text, p.param_types, p.result_type_id ").
                       append(" FROM problem p, difficulty d, data_type dt " ).
                       append(" WHERE p.problem_id = ? AND ").
                       append(" p.difficulty_id = d.difficulty_id AND ").
                       append(" p.result_type_id = dt.data_type_id ");
       }

       
       try {
         conn = DBMS.getConnection();
         conn.setAutoCommit(false);

         ps = conn.prepareStatement(txtGetProblem.toString());
         ps.setInt(1, problem_id);

         rs = ps.executeQuery();

         if (rs.next()) {
            problem.setProblemId(rs.getInt(1));
            problem.setMethodName(rs.getString(2));
            problem.setClassName(rs.getString(3));
            problem.setResultType(rs.getString(4));
            problem.setActiveInd(rs.getString(5));
            problem.setDifficultyId(rs.getInt(6));
            problem.setDifficulty(rs.getString(7));
            try {
              problem_text = DBMS.getTextString(rs, 8);
            }
            catch (Exception tce) {
              problem_text = "";
            }
             
            try {
              blobObject = DBMS.getBlobObject(rs, 9);
            }
            catch (Exception tce) {}

            problem.setProblemText(problem_text);
            if(DBMS.DB != DBMS.POSTGRES) {
              problem.setResultTypeId(rs.getInt(10));
            }
         }
         
         if(blobObject instanceof ArrayList) {
           paramTypes = (ArrayList)blobObject;
         }
         else {
           paramTypes = new ArrayList();
         }

         problem.setParamTypes(paramTypes);
/*
         table = "problem_text";
         field = "problem_text";
         problem_text = (String)getBlobObject(table, field, whereClause);
         problem.setProblemText(problem_text);
*/         

       }
       catch (SQLException e) {
         e.printStackTrace();
       }
       finally {
         try {
           if (ps != null) ps.close();
           if (conn != null) {
             conn.commit();
             conn.close();
           }
         } catch (Exception ignore) { }
       }

       return problem;

    }

    /**
    * Retrieves all problem test case characteristics from the 
    * SYSTEM_TEST_CASE table
    *
    * @exception RemoteException
    * @return ArrayList of TestCase
    */
    public ArrayList getTestCases(int problem_id) throws RemoteException {
      if(verbose) Log.msg("ProblemServices.getTestCases() called ... ");

      ArrayList testCases = new ArrayList();
      TestCase testCaseAttr = null;
      ExpectedResult expectedResultAttr = null;
       
      ArrayList testCaseArgs = null;
      
      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
            
      
      Object expBlobObject = null;
      String whereClause = "";
      String table = "system_test_case";
      if(DBMS.DB == DBMS.POSTGRES) {
        table = "system_test_cases";
      }
      String field = "";
      int test_case_id = 0;
      int testOrder = 0;
      ArrayList blobObject = null;

       StringBuffer txtGetTestCases = new StringBuffer();
       if(DBMS.DB == DBMS.POSTGRES) {
         txtGetTestCases.append(" SELECT problem_id, test_case_id, args, expected_result ").
                         append(" FROM system_test_cases " ).
                         append(" WHERE problem_id = ? ").
                         append(" ORDER BY test_case_id ");
       }
       else {
         txtGetTestCases.append(" SELECT problem_id, test_case_id, args, expected_result ").
                         append(" FROM system_test_case " ).
                         append(" WHERE problem_id = ? ").
                         append(" ORDER BY test_case_id ");
       }

       
       try {
         conn = DBMS.getConnection();
         conn.setAutoCommit(false);

         ps = conn.prepareStatement(txtGetTestCases.toString());
         ps.setInt(1, problem_id);

         rs = ps.executeQuery();

         while (rs.next()) {
            testCaseAttr = new TestCase();
            testCaseAttr.setProblemId(rs.getInt(1));
            test_case_id = rs.getInt(2);
            testCaseAttr.setTestCaseId(test_case_id);
            testCaseAttr.setTestOrder(testOrder);
            
            try {
              blobObject = (ArrayList)DBMS.getBlobObject(rs, 3);
              expBlobObject = DBMS.getBlobObject(rs, 4);
            }
            catch (Exception tce) {}
            
            testCaseArgs = buildTestCaseArgs(blobObject, problem_id, test_case_id);
            
            testCaseAttr.setTestCaseArgs(testCaseArgs);
                        
            expectedResultAttr = buildExpectedResult(expBlobObject, problem_id, test_case_id);
            
            testCaseAttr.setExpectedResult(expectedResultAttr);

            testCases.add(testCaseAttr);
            testOrder++;
         }

       }
       catch (SQLException e) {
         e.printStackTrace();
       }
       finally {
         try {
           if (ps != null) ps.close();
           if (conn != null) conn.close();
         } catch (Exception ignore) { }
       }

       return testCases;

    }

    /**
    * Builds an array of TestCaseArg from a 
    * blob object ArrayList.
    *
    * @exception RemoteException
    * @return ArrayList of TestCaseArg
    */
    private ArrayList buildTestCaseArgs(ArrayList blobObject, int problem_id, int test_case_id) {
      TestCaseArg testCaseArgAttr = null;
      ArrayList argValues = null;
      ArrayList testCaseArgs = new ArrayList();
      String argType = "";

      for(int i=0; i<blobObject.size(); i++) {
        argValues = new ArrayList();
        testCaseArgAttr = new TestCaseArg();
        testCaseArgAttr.setProblemId(problem_id);
        testCaseArgAttr.setTestCaseId(test_case_id);
        testCaseArgAttr.setArgPosition(i);

        if(blobObject.get(i) instanceof Integer) {
          System.out.println("Integer");
          testCaseArgAttr.setArgType("Integer");
          argValues.add((Integer)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof Double) {
          System.out.println("Double");
          testCaseArgAttr.setArgType("Double");
          argValues.add((Double)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof String) {
          System.out.println("String");
          testCaseArgAttr.setArgType("String");
          argValues.add((String)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof Float) {
          System.out.println("Float");
          testCaseArgAttr.setArgType("Float");
          argValues.add((Float)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof Boolean) {
          System.out.println("Boolean");
          testCaseArgAttr.setArgType("Boolean");
          argValues.add((Boolean)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof Long) {
          System.out.println("Long");
          testCaseArgAttr.setArgType("Long");
          argValues.add((Long)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof Character) {
          System.out.println("Character");
          testCaseArgAttr.setArgType("Character");
          argValues.add((Character)blobObject.get(i));
          testCaseArgAttr.setArgValue(argValues);
        }
        else if(blobObject.get(i) instanceof ArrayList) {
          System.out.println("ArrayList");
          testCaseArgAttr.setArgType("ArrayList");
          argValues = (ArrayList)blobObject.get(i);
          testCaseArgAttr.setArgValue(argValues);
          testCaseArgAttr.setArgListTypes(getArgTypes(argValues, "ArrayList"));
        }
        else if(blobObject.get(i) instanceof Matrix2D) {
          System.out.println("Matrix2D");
          testCaseArgAttr.setArgType("Matrix2D");
          argValues = ((Matrix2D)blobObject.get(i)).toArrayList();
          testCaseArgAttr.setArgValue(argValues);
          testCaseArgAttr.setMatrix2DRows(argValues.size());
          argType = (String)(getArgTypes(argValues, "Matrix2D")).get(0);
          testCaseArgAttr.setMatrix2DType( argType );
        }

        testCaseArgs.add(testCaseArgAttr);

      }

      return testCaseArgs;

    }

    /**
    * Builds an ExpectedResult object from a 
    * blob object ArrayList.
    *
    * @exception RemoteException
    * @return ArrayList of TestCaseArg
    */
    private ExpectedResult buildExpectedResult(Object blobObject, 
        int problem_id, int test_case_id) {

      ExpectedResult expectedResultAttr = new ExpectedResult();
      ArrayList argValues = new ArrayList();
      String argType = "";

        expectedResultAttr.setProblemId(problem_id);
        expectedResultAttr.setTestCaseId(test_case_id);

        if(blobObject instanceof Integer) {
          System.out.println("Integer");
          expectedResultAttr.setResultType("Integer");
          argValues.add(new Integer(blobObject.toString()));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof Double) {
          System.out.println("Double");
          expectedResultAttr.setResultType("Double");
          argValues.add(new Double(blobObject.toString()));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof String) {
          System.out.println("String");
          expectedResultAttr.setResultType("String");
          argValues.add(new String(blobObject.toString()));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof Float) {
          System.out.println("Float");
          expectedResultAttr.setResultType("Float");
          argValues.add(new Float(blobObject.toString()));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof Boolean) {
          System.out.println("Boolean");
          expectedResultAttr.setResultType("Boolean");
          argValues.add(new Boolean(blobObject.toString()));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof Long) {
          System.out.println("Long");
          expectedResultAttr.setResultType("Long");
          argValues.add(new Long(blobObject.toString()));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof Character) {
          System.out.println("Character");
          expectedResultAttr.setResultType("Character");
          argValues.add(new Character((blobObject.toString()).charAt(0)));
          expectedResultAttr.setResultValue(argValues);
        }
        else if(blobObject instanceof ArrayList) {
          System.out.println("ArrayList");
          expectedResultAttr.setResultType("ArrayList");
          argValues = (ArrayList)blobObject;
          expectedResultAttr.setResultValue(argValues);
          expectedResultAttr.setArgListTypes(getArgTypes(argValues, "ArrayList"));
        }
        else if(blobObject instanceof Matrix2D) {
          System.out.println("Matrix2D");
          expectedResultAttr.setResultType("Matrix2D");
          argValues = ((Matrix2D)blobObject).toArrayList();
          expectedResultAttr.setResultValue(argValues);
          expectedResultAttr.setMatrix2DRows(argValues.size());
          argType = (String)(getArgTypes(argValues, "Matrix2D")).get(0);
          expectedResultAttr.setMatrix2DType(argType);
        }

        return expectedResultAttr;

    }

    /**
    * Builds an ArrayList of Strings representing the value types
    * within arrList. If type is "Matrix2D" the return ArrayList will
    * contain one String value representing the Matrix2D values' type.
    *
    * @exception RemoteException
    * @return ArrayList of Strings
    */
    private ArrayList getArgTypes(ArrayList arrList, String type) {

      ArrayList Matrix2DArrList = null;
      ArrayList arrTypeList = new ArrayList();

      int repeatVal = 0;
 
      if(type.equals("ArrayList")) {
        repeatVal = arrList.size();
      }
      else if(type.equals("Matrix2D")) {
        Matrix2DArrList = getArgTypes((ArrayList)arrList.get(0), "firstType");
        arrTypeList.add((String)Matrix2DArrList.get(0));
      }
      else if(type.equals("firstType")) {
        repeatVal = 1;
      }

      for(int i=0; i<repeatVal; i++) {
        
        if(arrList.get(i) instanceof Integer) {
          System.out.println("Integer");
          arrTypeList.add("Integer");
        }
        else if(arrList.get(i) instanceof Double) {
          System.out.println("Double");
          arrTypeList.add("Double");
        }
        else if(arrList.get(i) instanceof String) {
          System.out.println("String");
          arrTypeList.add("String");
        }
        else if(arrList.get(i) instanceof Float) {
          System.out.println("Float");
          arrTypeList.add("Float");
        }
        else if(arrList.get(i) instanceof Boolean) {
          System.out.println("Boolean");
          arrTypeList.add("Boolean");
        }
        else if(arrList.get(i) instanceof Long) {
          System.out.println("Long");
          arrTypeList.add("Long");
        }
        else if(arrList.get(i) instanceof Character) {
          System.out.println("Character");
          arrTypeList.add("Character");
        }

      }

      return arrTypeList;

    }


    /**
    * Retrieves all difficulty levels and the corresponding
    * characteristics from the DIFFICULTY_LEVELS table
    *
    * @exception RemoteException
    * @return ArrayList of DifficultyLevelAttribute objects.
    */ 
    public ArrayList getDifficultyLevels() throws RemoteException {
      if(verbose) Log.msg("ProblemServices.getDifficultyLevels() called ... ");

      ArrayList results = new ArrayList();
      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      Difficulty difficultyLevel = null;

       StringBuffer txtGetDifficultyLevels = new StringBuffer();
       if(DBMS.DB == DBMS.POSTGRES) {
         txtGetDifficultyLevels.append(" SELECT difficulty_level_id, difficulty_level, difficulty_desc ").
                                append(" FROM difficulty_levels " );
       }
       else {
         txtGetDifficultyLevels.append(" SELECT difficulty_id, difficulty_level, difficulty_desc ").
                                append(" FROM difficulty " );
       }

       try {
         conn = DBMS.getConnection();


         ps = conn.prepareStatement(txtGetDifficultyLevels.toString());
         rs = ps.executeQuery();

         while (rs.next()) {
            difficultyLevel = new Difficulty();
            difficultyLevel.setDifficultyId(rs.getInt(1));
            difficultyLevel.setDifficultyLevel(rs.getString(2));
            difficultyLevel.setDifficultyDesc(rs.getString(3));
            results.add(difficultyLevel);
         }

       }
       catch (SQLException e) {
         e.printStackTrace();
       }
       finally {
         try {
           if (ps != null) ps.close();
           if (conn != null) conn.close();
         } catch (Exception ignore) { }
       }

       return results;

    }

    /**
    * Retrieves all datatypes (type_names) from the DATA_TYPE table
    *
    * @exception RemoteException
    * @return HashMap: key - data_type_id, value - data_type_desc
    */
    public HashMap getDataTypes() throws RemoteException {
      if(verbose) Log.msg("ProblemServices.getDataTypes() called ... ");

      HashMap dataTypeHash = new HashMap();
      java.sql.Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

       StringBuffer txtGetDataTypes = new StringBuffer();
       if(DBMS.DB == DBMS.POSTGRES) {
         txtGetDataTypes.append(" SELECT type_name ").
                         append(" FROM data_types " ).
                         append(" ORDER BY type_name ");
       }
       else {
         txtGetDataTypes.append(" SELECT data_type_desc, data_type_id ").
                         append(" FROM data_type " ).
                         append(" ORDER BY data_type_desc ");
       }

       try {
         conn = DBMS.getConnection();

         ps = conn.prepareStatement(txtGetDataTypes.toString());
         rs = ps.executeQuery();

         if(DBMS.DB == DBMS.POSTGRES) {
           while (rs.next()) {
             dataTypeHash.put(rs.getString(1), rs.getString(1));
           }
         }
         else {
           while (rs.next()) {
             dataTypeHash.put(new Integer(rs.getInt(2)), rs.getString(1));
           }
         }

       }
       catch (SQLException e) {
         e.printStackTrace();
       }
       finally {
         try {
           if (ps != null) ps.close();
           if (conn != null) conn.close();
         } catch (Exception ignore) { }
       }

       return dataTypeHash;

    }

 
  }
