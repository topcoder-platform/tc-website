   package com.topcoder.ejb.ProblemServices;

   import javax.ejb.*;
   import java.rmi.RemoteException;
   import com.topcoder.common.web.data.*;
   import java.util.*;
   import java.sql.*;
         
   /**
   *
   */
   public interface ProblemServices extends EJBObject {
   
      //public int insertProblem(Problem problem) throws RemoteException;

      public void insertProblem(Problem problem, HashMap environments) throws RemoteException;

      public int insertProblem(Problem problem, Connection conn) throws RemoteException;

      //public void insertProblemText(int problem_id, String problemText)  throws RemoteException;

      public void insertProblemText(int problem_id, String problemText, Connection conn)  throws RemoteException;
 
      public void updateProblemText(String class_name, String problemText, Connection conn) throws RemoteException;
      
      //public void insertProblemParameters(int problem_id, ArrayList vtrProbParams) throws RemoteException;

      public void insertProblemParameters(String class_name, ArrayList vtrProbParams, Connection conn) throws RemoteException;

      public int insertTestCase(int problem_id, Object test_case_args, Object expected_result) throws RemoteException;

      //public void updateProblem(Problem problem, boolean paramTypesModified) throws RemoteException;

      public void updateProblem(Problem problem, boolean paramTypesModified, HashMap environments) throws RemoteException;

      public void updateProblem(Problem problem, boolean paramTypesModified, Connection conn) throws RemoteException;

      public void insertTestCaseBlobs(int test_case_id, Object test_case_args, Object expected_result) throws RemoteException;

      public void deleteTestCases(int problem_id) throws RemoteException;

      public void deleteTestCases(int problem_id, Connection conn) throws RemoteException;
  
      public void deleteTestCase(int test_case_id) throws RemoteException;

      //public void insertTestCaseArgs(int problem_id, ArrayList testCaseArgs) throws RemoteException;

      public int getNextProblemId() throws RemoteException;

      public int getNextTestCaseId() throws RemoteException;

      public ArrayList getProblemList() throws RemoteException;
      
      public Problem getProblem(int problem_id) throws RemoteException;

      public ArrayList getTestCases(int problem_id) throws RemoteException;

      public ArrayList getDifficultyLevels() throws RemoteException;

      public HashMap getDataTypes() throws RemoteException;
  
      public void deleteProblem(int problem_id) throws RemoteException;
  
      public void deleteProblem(String class_name, Connection conn) throws RemoteException;

      public void deleteProblem(String class_name, HashMap environments) throws RemoteException;
   }



