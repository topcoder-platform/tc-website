package com.topcoder.web.servlet.admin.task.util;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import javax.transaction.UserTransaction;
import javax.transaction.Status;

import com.topcoder.ejb.ProblemServices.*;
import com.topcoder.web.servlet.admin.*;
import com.topcoder.common.*;
import com.topcoder.common.web.util.*; 
import com.topcoder.common.web.xml.*; 
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.*;
import com.topcoder.tcclasses.*;

public final class PProblem {

  private static final String DIR           = XSL.DIR+"problem/";
  private static final String PROBLEM_MENU  = DIR + "problemmenu.xsl";
  private static final String SYS_TEST_MENU = DIR + "systestmenu.xsl";
  private static final String SYSTEM_TEST   = DIR + "systemtest.xsl";
  private static final String SETUP         = DIR + "problem.xsl";
  private static final String NEW_PROBLEM   = DIR + "newproblem.xsl";
  private static final String SPECIAL_CASE  = DIR + "specialcase.xsl";
  //private static final String XSL_DIR = "xsl/admin_old/problem/";
  private static final boolean verbose      = true;

  ///////////////////////////////////////////////////////////////////////////////////
  public static String process(HttpServletRequest request, HttpServletResponse response,
                        RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
     throws NavigationException {
  //////////////////////////////////////////////////////////////////////////////////
  
    String result = null;
    RecordTag problemTag = new RecordTag( "PROBLEMS" );
    HashMap sessionObjects = nav.getSessionObjects();

    try {     
      String command = Conversion.checkNull( request.getParameter("Command") );
      Log.msg(verbose, "processTaskAdminProblem: Command: "+ command); 
      if (command.equals("getProblemInfo")) {
        result = getProblemInfo (HTMLmaker, request, document, nav, problemTag, sessionObjects);
      } else if ( command.equals("getNewProblemScreen") ) {
        result = getNewProblemScreen (HTMLmaker, request, document, nav, problemTag, sessionObjects);
      } else if ( command.equals("problemsave") ) {
        result = saveProblem (HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
        //go back to the problem list page
        result = getProblemInfo (HTMLmaker, request, document, nav, problemTag, sessionObjects);
      } else if ( command.equals("problemnext") ) {
        result = saveProblem (HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
        if (result.compareToIgnoreCase("") == 0) {
          result = getProblemInfo (HTMLmaker, request, document, nav, problemTag, sessionObjects);
        }
      } else if ( command.equals("getProblemModifyScreen") ) {
        result = getProblemModifyScreen(HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
      } else if ( command.equals("deleteProblem") ) {
        result = deleteProblem(HTMLmaker, request, document, nav, problemTag, sessionObjects);
      } else if ( command.equals("getNewTestCaseScreen") ) {
        result = getNewTestCaseScreen(HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
      } else if ( command.equals("getTestCaseModifyScreen") ) {
        result = getTestCaseModifyScreen(HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
      } else if ( command.equals("specialcase") ) {
        result = saveProblem(HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
      } else if ( command.equals("fromspecialcase") ) {
        result = specialCase(HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
      } else if ( command.equals("systemtestnext") || command.equals("systemtestsave") ) {
        result = saveTestCase(HTMLmaker, request, document, nav, problemTag, sessionObjects, command);
      } else if ( command.equals("deleteTestCase") ) {
        result = deleteTestCase(HTMLmaker, request, document, nav, problemTag, sessionObjects);
      } else if ( command.equals("cancelTestCase") ) {
        result = cancelTestCase(HTMLmaker, request, document, nav, problemTag, sessionObjects);
      } else {
        throw new NavigationException("processTaskAdminProblem:process:Error:invalid command:",
          XSL.NAVIGATION_ERROR_URL);
      }
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: process method: ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static String getProblemModifyScreen (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag,
    HashMap sessionObjects, String command) throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    ProblemServices problemEJB = null;

    int problem_id = Integer.parseInt(request.getParameter("results"));
    Problem problemAttr = null;

    try {
      if ( sessionObjects.containsKey("sessionProblemAttr") ) {
        problemAttr = (Problem)sessionObjects.get("sessionProblemAttr");
      }

      problemTag = getProblemScreenInfo(problemTag, sessionObjects);
     
      if((problemAttr == null) || (problem_id != problemAttr.getProblemId())) {
        Context ctx = TCContext.getInitial();
        ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");
        problemEJB = problemServicesHome.create();
        problemAttr = problemEJB.getProblem(problem_id);
      }

      problemAttr.setModified(true);
      sessionObjects.put("sessionProblemAttr", problemAttr);
      problemTag.addTag(problemAttr.getXML());
      document.addTag(problemTag);
      //Log.msg(verbose, document.getXML(2));
      System.out.println(document.getXML(2));
      result = HTMLmaker.render(document, NEW_PROBLEM, null);
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: getProblemModifyScreen : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static String getNewProblemScreen (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag,
    HashMap sessionObjects) throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    Problem problemAttr = new Problem();

    try {
      problemTag = getProblemScreenInfo(problemTag, sessionObjects);
      document.addTag(problemTag);

      sessionObjects.put("sessionProblemAttr", problemAttr);

      result = HTMLmaker.render(document, NEW_PROBLEM, null);
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: getNewProblemScreen : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static RecordTag getProblemScreenInfo (RecordTag problemTag, HashMap sessionObjects) throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    ProblemServices problemEJB = null;
    ArrayList difficultyLevels = null;
    //ArrayList dataTypes = null;
    String dataType = "";
    RecordTag dataTypeTag = null;
    HashMap dataTypeHash = null;

    try {
      Context ctx = TCContext.getInitial();
      ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");
      problemEJB = problemServicesHome.create();
      difficultyLevels = problemEJB.getDifficultyLevels();

      if ( sessionObjects.containsKey("datatypes") ) {
        dataTypeHash = (HashMap)sessionObjects.get("datatypes");
      }
      else {
        dataTypeHash = problemEJB.getDataTypes();
        sessionObjects.put("datatypes", dataTypeHash);
      }

      Difficulty difficultyLevelAttr = null;
      for (int i = 0; i < difficultyLevels.size(); i++) {
        difficultyLevelAttr = (Difficulty)difficultyLevels.get(i);
        problemTag.addTag(difficultyLevelAttr.getXML());
      }

      Set keys = dataTypeHash.keySet();
      Iterator iterator = keys.iterator();

      Integer dataTypeId = null;
      while(iterator.hasNext()) {
        dataTypeId = (Integer)iterator.next();
        dataType = (String)dataTypeHash.get(dataTypeId);
        dataTypeTag = new RecordTag("DataType");
        dataTypeTag.addTag( new ValueTag("DataTypeName", dataType) );
        dataTypeTag.addTag( new ValueTag("DataTypeID", dataTypeId.intValue()) );
        problemTag.addTag(dataTypeTag);
      }

    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: getProblemScreenInfo : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return problemTag;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String saveProblem (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects,
    String command)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = "";
    ProblemServices problemEJB = null;
    Problem problem = (Problem)sessionObjects.get("sessionProblemAttr");
    String xsldocURLString = "";
    boolean modified = problem.getModified();
    boolean resultTypeModified = false;
    boolean paramTypesModified = false;
    String existingArgs = "";
    ArrayList testCases = null;
 
    Log.msg(verbose, "saveProblem: ");
    
    //problem.setClassName(request.getParameter("classname"));
    problem.setNewClassName(request.getParameter("classname"));
    problem.setMethodName(request.getParameter("methodname"));

    boolean DEV = false;
    boolean QA = false; 
    boolean PROD = false;

    if(request.getParameter("DEV") != null) {
      DEV = true;
    }

    if(request.getParameter("QA") != null) {
      QA = true;
    }

    if(request.getParameter("PROD") != null) {
      PROD = true;
    }

    System.out.println("DEV: " + DEV);
    System.out.println("QA: " + QA);
    System.out.println("PRDO: " + PROD);

    HashMap environments = new HashMap();
    environments.put("DEV", new Boolean(DEV));
    environments.put("QA", new Boolean(QA));
    environments.put("PROD", new Boolean(PROD));

    String resultType = "";
    int resultTypeId = 0;
    resultTypeId = Integer.parseInt(request.getParameter("resulttype"));
    problem.setProblemText(request.getParameter("problemtext"));
    problem.setDifficultyId(Integer.parseInt(request.getParameter("difflevel")));
    String paramTypesString = request.getParameter("paramtypes");
    String report = null;
   
    //if updating an existing problem, check to see if the result type or
    //problem parameter types have been modified. 
    if(modified) {
      existingArgs = buildCommaString(problem.getParamTypes());
      System.out.println("existingArgs: " + existingArgs);

      if(resultTypeId != problem.getResultTypeId()) {
        resultTypeModified = true;
      }

      if(!existingArgs.equals(paramTypesString)) {
        paramTypesModified = true;
      }
 
    }
 
    try {
      problem.setParamTypes(parseCommaString(paramTypesString, "String"));
      problem.setResultTypeId(resultTypeId);
      
      Context ctx = TCContext.getInitial();
      UserTransaction ux = Transaction.get();
      ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");
      try {
        if ( Transaction.begin(ux) ) {
          Log.msg("SERVLET Tx Begun: saveProblem");
          problemEJB = problemServicesHome.create();

          if(!modified) {
            //insert the problem into the database
            //problem.setProblemId(problemEJB.insertProblem(problem));
            problem.setClassName(problem.getNewClassName()); 
            problemEJB.insertProblem(problem, environments);
          }
          else {
            //if either the result type or the parameter types have been
            //modified then the problem test cases must be deleted.
/*
            if(resultTypeModified || paramTypesModified) {
              System.out.println("Deleting Test Cases");
              problemEJB.deleteTestCases(problem.getProblemId());
              problem.setTestCases(new ArrayList());
            }
*/
            if(command.equals("problemnext")) {
              //get problem testCases
              testCases = problemEJB.getTestCases(problem.getProblemId());

              problem.setTestCases(testCases);  
            }
            //problemEJB.updateProblem(problem, paramTypesModified); 
            problemEJB.updateProblem(problem, paramTypesModified, environments);
            problem.setClassName(problem.getNewClassName());
          }
          problem.setModified(false);
          sessionObjects.put("sessionProblemAttr", problem);
        }
        if ( Transaction.commit(ux) ) { Log.msg("SERVLET Tx COMMITTED: saveProblem "); }
        problemServicesHome = null;
      } catch (Exception e) {
        try {
          if (ux.getStatus()==Status.STATUS_ACTIVE) Transaction.rollback(ux);
        } catch (Exception te) {
            Log.msg("processTaskAdminProblem: saveProblem error saving problem ");
            Log.msg("MSG: " + te);
        }
        Log.msg("MSG: " + e);
        throw new NavigationException("DB ERROR", XSL.INTERNAL_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
        } catch (Exception ignore) { }
        ctx = null;
      }

      if(command.equals("problemnext")) {
        problemTag.addTag(problem.getXML());
        document.addTag(problemTag);
        result = HTMLmaker.render (document, SYS_TEST_MENU, null);
      }
      

    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: saveProblem: ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }

    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static String getProblemInfo (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    ProblemServices problemEJB = null;
    ArrayList problemList = null;
    Problem problemAttr = null;
  
    try {
      Context ctx = TCContext.getInitial();
      ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");
      try {
          Log.msg("Begun: getProblemInfo for Admin");
          problemEJB = problemServicesHome.create();
          problemList = problemEJB.getProblemList();
          sessionObjects.put("problemList", problemList);
        
        problemServicesHome = null;
      } catch (Exception e) {
        Log.msg("processTaskAdminProblem: getProblemInfo error retrieving problem list .");
        Log.msg("MSG: " + e);
        throw new NavigationException("DB ERROR", XSL.INTERNAL_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
        } catch (Exception ignore) { }
        ctx = null;
      }
       
      for (int i = 0; i < problemList.size(); i++) {
        problemAttr = (Problem)problemList.get(i); 
        problemTag.addTag(problemAttr.getXML());
      }
      document.addTag(problemTag);
      //System.out.println(document.getXML(2));
      result = HTMLmaker.render (document, PROBLEM_MENU, null);

      if ( sessionObjects.containsKey("sessionProblemAttr") ) {
        sessionObjects.remove("sessionProblemAttr");
      }
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: getProblemInfo : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static String deleteProblem (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    ProblemServices problemEJB = null;
    int problem_id = 0;
    String class_name = "";

    try {
      problem_id = Integer.parseInt(request.getParameter("results"));
      class_name = request.getParameter("class_name"); 

      Context ctx = TCContext.getInitial();
      ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");

      try {
        Log.msg("Begun: deleteProblem");

        //needed so that we delete from all environments.
        HashMap environments = new HashMap();
        environments.put("DEV", new Boolean(true));
        environments.put("QA", new Boolean(true));
        environments.put("PROD", new Boolean(true)); 

        problemEJB = problemServicesHome.create();
        //problemEJB.deleteProblem(problem_id);
        problemEJB.deleteProblem(class_name, environments);
        problemServicesHome = null;
      } catch (Exception e) {
        Log.msg("processTaskAdminProblem: deleteProblem error deleting problem .");
        Log.msg("MSG: " + e);
        throw new NavigationException("DB ERROR", XSL.INTERNAL_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
        } catch (Exception ignore) { }
        ctx = null;
      }

      result = getProblemInfo(HTMLmaker, request, document, nav, problemTag, sessionObjects);

    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: deleteProblem: ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String getNewTestCaseScreen(RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag,
    HashMap sessionObjects, String command) throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    int problem_id = 0;
    ArrayList dataTypes = null; 
    String dataType = "";
    RecordTag dataTypeTag = null;
    TestCase testCaseAttr = new TestCase();
    TestCaseArg testCaseArgAttr = new TestCaseArg();
    ExpectedResult expectedResultAttr = new ExpectedResult();
    Problem problem = null;
    ArrayList paramTypes = null;
    ArrayList testCaseArgs = new ArrayList();
    String resultType = "";
    String argTypeString = "";
    String xsldocURLString = null;
    boolean specialCaseFlag = false;
    

    try {
      problem = (Problem) sessionObjects.get("sessionProblemAttr");
      problem_id = problem.getProblemId();
      testCaseAttr.setProblemId(problem_id);
      paramTypes = problem.getParamTypes();
      resultType = problem.getResultType();

      expectedResultAttr.setProblemId(problem_id);
      expectedResultAttr.setResultType(resultType);
      testCaseAttr.setExpectedResult(expectedResultAttr);

      if(resultType.equals("ArrayList") || resultType.equals("Matrix2D")) {
         specialCaseFlag = true;
      }

      for(int i=0; i<paramTypes.size(); i++) { 
        testCaseArgAttr = new TestCaseArg();
        testCaseArgAttr.setProblemId(problem_id);
        testCaseArgAttr.setArgPosition(i);
        argTypeString = (String)paramTypes.get(i);
        testCaseArgAttr.setArgType(argTypeString);

        if(argTypeString.equals("ArrayList")) {
          specialCaseFlag = true;
        } else if(argTypeString.equals("Matrix2D")) {
          specialCaseFlag = true;
        } else {
          
        }
        testCaseArgs.add(testCaseArgAttr);
      }

      testCaseAttr.setTestCaseArgs(testCaseArgs);

      if(specialCaseFlag) {
        dataTypes = (ArrayList) sessionObjects.get("datatypes");

        for (int i = 0; i < dataTypes.size(); i++) {
          dataType =  (String)dataTypes.get(i);

          if( !(dataType.equals("ArrayList") || dataType.equals("Matrix2D") ||
                dataType.equals("Enumeration") || dataType.equals("Hashtable") ||
                dataType.equals("Vector")) ) {
            dataTypeTag = new RecordTag("DataType");
            dataTypeTag.addTag( new ValueTag("DataTypeName", dataType) );
            dataTypeTag.addTag( new ValueTag("DataTypeID", dataType) );
            problemTag.addTag(dataTypeTag);
          }
        }
        xsldocURLString = SPECIAL_CASE;
      } else {
        xsldocURLString = SYSTEM_TEST;
      }
 
      sessionObjects.put("sessionTestCaseAttr", testCaseAttr);

      problemTag.addTag(testCaseAttr.getXML());
      document.addTag(problemTag);
      Log.msg(verbose, document.getXML(2));
      result = HTMLmaker.render (document, xsldocURLString, null);

    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: getSetupScreen : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static String getTestCaseModifyScreen(RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag,
    HashMap sessionObjects, String command) throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    String testCaseIdString = "";
    String testOrderString = "";
    int testCaseId = 0;
    int testOrder = 0;
    ArrayList testCases = null;
    Problem problemAttr = null;
    TestCase testCaseAttr = null;     


    try {
      testCaseIdString = request.getParameter("testCaseId");
      testCaseId = Integer.parseInt(testCaseIdString);

      testOrderString = request.getParameter("testOrder");
      testOrder = Integer.parseInt(testOrderString);

      problemAttr = (Problem)sessionObjects.get("sessionProblemAttr");
      testCases = problemAttr.getTestCases();
      testCaseAttr = (TestCase)testCases.get(testOrder);
      testCaseAttr.setModified(true);

      sessionObjects.put("sessionTestCaseAttr", testCaseAttr);

      problemTag.addTag(testCaseAttr.getXML());
      document.addTag(problemTag);
      Log.msg(verbose, document.getXML(2));

      result = HTMLmaker.render (document, SYSTEM_TEST, null);
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: getProblemModifyScreen : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  } 


  
  ////////////////////////////////////////////////////////////////////////////////
  private static String specialCase (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects,
    String command)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = "";
    TestCase testCaseAttr = null;
    TestCaseArg testCaseArgAttr = null;
    ExpectedResult expectedResultAttr = null;

    Log.msg(verbose, "specialCase: ");
   
    testCaseAttr = (TestCase)sessionObjects.get("sessionTestCaseAttr");

    Enumeration paramNames = request.getParameterNames();
    String paramName = "";
    String paramValue = "";
    String paramIndexString = "";
    String paramIdentifier = "";
    String paramType = "";
    String rowDatIdentifier = "";
    int delimIndex = 0;
    int paramIndex = 0;
    int delimChar = '-';
    int paramValueInt = 0; 
    ArrayList arrListTypes = null;
    ArrayList testCaseArgs = null;


    if(testCaseAttr != null) {
      testCaseArgs = testCaseAttr.getTestCaseArgs();
      expectedResultAttr = testCaseAttr.getExpectedResult();
    } else {
      throw new NavigationException("processTaskAdminProblem: specialCase: getting session TestCase  ",
            XSL.NAVIGATION_ERROR_URL);
    }

    while (paramNames.hasMoreElements()) {
      paramName = (String) paramNames.nextElement();
      System.out.println("paramName: " + paramName);
      
      if( !(paramName.equals("Task") || paramName.equals("LoggedIn") || 
            paramName.equals("Command") || paramName.equals("results")) ) {

        paramValue = request.getParameter(paramName);
        paramIdentifier = paramName.substring(0,3);
        delimIndex = paramName.indexOf(delimChar);
        paramType = paramName.substring(6, delimIndex);
        paramIndexString = paramName.substring(delimIndex + 1);
        paramIndex = Integer.parseInt(paramIndexString) - 1;

        System.out.println("paramIdentifier: " + paramIdentifier);
        System.out.println("paramType: " + paramType);
        System.out.println("paramIndex: " + paramIndex);
        System.out.println("testCaseArgs size: " + testCaseArgs.size());


        //argument parameter
        if(paramIdentifier.equals("arg")) {
          testCaseArgAttr = (TestCaseArg)testCaseArgs.get(paramIndex);
 
          if(paramType.equals("ArrayList")) {
            arrListTypes = parseCommaString(paramValue, "String");
            testCaseArgAttr.setArgListTypes(arrListTypes);

          } else if(paramType.equals("Matrix2D")) {
            rowDatIdentifier = paramName.substring(3,6);

            if(rowDatIdentifier.equals("row")) {
              paramValueInt = Integer.parseInt(paramValue);
              testCaseArgAttr.setMatrix2DRows(paramValueInt);

            }
            else if(rowDatIdentifier.equals("dat")) {
              testCaseArgAttr.setMatrix2DType(paramValue);
            }
          }

          //after modifying the TestCaseArg, put them back into the arraylist.
          testCaseArgs.set(paramIndex, testCaseArgAttr);

        }
        //expected result parameter 
        else if(paramIdentifier.equals("exp")) {

          if(paramType.equals("ArrayList")) {
            arrListTypes = parseCommaString(paramValue, "String");
            expectedResultAttr.setArgListTypes(arrListTypes);
 
          } else if(paramType.equals("Matrix2D")) {
            rowDatIdentifier = paramName.substring(3,6);

            if(rowDatIdentifier.equals("row")) {
              paramValueInt = Integer.parseInt(paramValue);
              expectedResultAttr.setMatrix2DRows(paramValueInt);

            }
            else if(rowDatIdentifier.equals("dat")) {
              expectedResultAttr.setMatrix2DType(paramValue);
            }

          }
        }
      }
    } //end while

    testCaseAttr.setTestCaseArgs(testCaseArgs);
    testCaseAttr.setExpectedResult(expectedResultAttr);
    sessionObjects.put("sessionTestCaseAttr", testCaseAttr);    

    try {
      problemTag.addTag(testCaseAttr.getXML());
      //document.addTag(problemTag);
      //Log.msg( document.getXML(2) );
      document.addTag(problemTag);
      result = HTMLmaker.render (document, SYSTEM_TEST, null);

    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: specialCase : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }

    return result;
  }

  
  /**
  *
  * @param valueString - String of comma separated values.
  * @param type - the return types
  * @return ArrayList of valueTypes.
  */
  private static ArrayList parseCommaString(String valueString, String type) {
    ArrayList values = new ArrayList();
    String nextValue = "";

    StringTokenizer strTokenizer = new StringTokenizer(valueString, ",");
      while (strTokenizer.hasMoreTokens()) {
        nextValue = strTokenizer.nextToken();
        if(type.equals("int") || type.equals("Integer")) {
          values.add(new Integer(nextValue));
        }
        else if(type.equals("Double") || type.equals("double")) {
           values.add(new Double(nextValue));
        }
        else if(type.equals("Float") || type.equals("float")) {
          values.add(new Float(nextValue));
        }
        else if(type.equals("Boolean") || type.equals("boolean")) {
           values.add(new Boolean(nextValue));
        }
        else if(type.equals("Long") || type.equals("long")) {
           values.add(new Long(nextValue));
        }
        else if(type.equals("Character") || type.equals("char")) {
           values.add(new Character(nextValue.charAt(0)));
        }

        else {
          values.add(nextValue);
        }
      }
     
    return values;
  }

  /**
  *
  * @param ArrayList of values
  * @return String of values separated by commas
  */
  private static String buildCommaString(ArrayList values) {
    StringBuffer resultBuffer = new StringBuffer();

    for(int i=0; i<values.size(); i++) {
      resultBuffer.append( ((Object)values.get(i)).toString() );

      if( (i+1) != values.size() ) {
        resultBuffer.append(",");
      }
    }

    return resultBuffer.toString();
  }

  /**
  *
  * @param arrList - ArrayList of size index or greater.
  * @param index - int: the position where the 
  *                value will be added to the arrList
  * @param type - String: the value type
  * @param value - String: the value to be added to the arrList.
  * @return ArrayList: arrList with the value added to it at position index.  
  */
  private static ArrayList addToArrayList(ArrayList arrList, int index, 
                                          String type, String value) {
    
    if(type.equals("Integer") || type.equals("int")) {
        arrList.set(index, new Integer(value));
    }
    else if(type.equals("Double") || type.equals("double")) {
         arrList.set(index, new Double(value));
    }
    else if(type.equals("String")) {
           arrList.set(index, new String(value));
    }
    else if(type.equals("Float") || type.equals("float")) {
        arrList.set(index, new Float(value));
    }
    else if(type.equals("Boolean") || type.equals("boolean")) {
        arrList.set(index, new Boolean(value));
    }
    else if(type.equals("Long") || type.equals("long")) {
        arrList.set(index, new Long(value));
    }
    else if(type.equals("Character") || type.equals("char")) {
        arrList.set(index, new Character(value.charAt(0)));
    }
 
    return arrList;
  }

  /**
  *
  * @param objectType - String: the objectValue type
  * @param objectValue - Object: the value
  * @return Object: the value casted to type objectType
  */
  private static Object getObjectValue(String objectType,  Object objectValue) {
    Object obj = null;
 
    if(objectType.equals("Integer") || objectType.equals("int")) {
      obj = new Integer(objectValue.toString());
    }
    else if(objectType.equals("Double") || objectType.equals("double")) {
      obj = new Double(objectValue.toString());
    }
    else if(objectType.equals("String")) {
      obj = new String(objectValue.toString());
    }
    else if(objectType.equals("Float") || objectType.equals("float")) {
      obj = new Float(objectValue.toString());
    }
    else if(objectType.equals("Boolean") || objectType.equals("boolean")) {
      obj = new Boolean(objectValue.toString());
    }
    else if(objectType.equals("Long") || objectType.equals("long")) {
      obj = new Long(objectValue.toString());
    }
    else if(objectType.equals("Character") || objectType.equals("char")) {
      obj = new Character((objectValue.toString()).charAt(0));
    }

    return obj;

   }

  ////////////////////////////////////////////////////////////////////////////////
  private static String saveTestCase (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects,
    String command)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = "";
    ProblemServices problemEJB = null;
    TestCase testCaseAttr = null;
    TestCaseArg testCaseArgAttr = null;
    ExpectedResult expectedResultAttr = null;
    Problem problem = null;

    Log.msg(verbose, "saveTestCase: ");

    testCaseAttr = (TestCase)sessionObjects.get("sessionTestCaseAttr");
    problem = (Problem)sessionObjects.get("sessionProblemAttr");

    Enumeration paramNames = request.getParameterNames();
    String paramName = "";
    String paramValue = "";
    String paramType = "";
    String paramIdentifier = "";
    String paramIndexString = "";
    String specialCaseParameter = "";
    String specialCaseType = "";
    int delimIndex = 0;
    int paramIndex = 0;
    int delimChar = '-';
    int test_case_id = 0;
    int problem_id = 0;
    int underScoreChar = '_';
    int underScoreIndex = 0;
    int specialCaseIndex = 0;
    int rows = 0;
    int cols = 0;
    int testOrder = 0;
    boolean modified = false;
    ArrayList args = new ArrayList();
    ArrayList arrListVals = new ArrayList();
    ArrayList expArrListVals = new ArrayList();
    ArrayList testCaseArgs = null;
    ArrayList arrListTypes = null;
    ArrayList testCases = null;
    Object expObj = new Object();
    Matrix2D matrix2DVal = null;
    Matrix2D expMatrix2DVal = null;
 
    if(testCaseAttr != null) {
      testCaseArgs = testCaseAttr.getTestCaseArgs();
      problem_id = testCaseAttr.getProblemId();
      modified = testCaseAttr.getModified();
      
      System.out.println("problem_id: " + problem_id);

      expectedResultAttr = testCaseAttr.getExpectedResult();
    } else {
      throw new NavigationException("processTaskAdminProblem: specialCase: getting session TestCase  ",
            XSL.NAVIGATION_ERROR_URL);
    }

    if(problem != null) {
      testCases = problem.getTestCases();
    } else {
      throw new NavigationException("processTaskAdminProblem: specialCase: getting session Problem  ",
            XSL.NAVIGATION_ERROR_URL);
    }

    //if modifying an existing Test Case, get its testOrder
    if(modified) {
      testOrder = testCaseAttr.getTestOrder();
      test_case_id = testCaseAttr.getTestCaseId();
    }
    //if saving a new Test Case, the testOrder should equal the last index of 
    //the testCases ArrayList when the Test Case is added to testCases
    else {
      testOrder = testCases.size();
      testCases.add(new Object());
    }
   
    for(int i=0; i<testCaseArgs.size(); i++) {
        args.add(new Object());
    }

    while (paramNames.hasMoreElements()) {
      paramName = (String) paramNames.nextElement();
      System.out.println("paramName: " + paramName);

      
      if( !(paramName.equals("Task") || paramName.equals("LoggedIn") || 
             paramName.equals("Command") || paramName.equals("results")) ) {

        paramIdentifier = paramName.substring(0,3);
        paramValue = request.getParameter(paramName);
        if(paramValue == null) {
          paramValue = "";
        }
        delimIndex = paramName.indexOf(delimChar);
        paramType = paramName.substring(3, delimIndex);

        paramIndexString = paramName.substring(delimIndex + 1, delimIndex + 2);
        paramIndex = Integer.parseInt(paramIndexString) - 1;
        
        System.out.println("paramType: " + paramType);
        System.out.println("paramIdentifier: " + paramIdentifier);
        System.out.println("paramIndex: " + paramIndex);
  
      }
      else {
        paramIdentifier = "";
        paramType = "";
        paramValue = "";
      }

      if( paramType.equals("ArrayList") || paramType.equals("Matrix2D") ) {
        underScoreIndex = paramName.indexOf(underScoreChar);
        specialCaseParameter = paramName.substring(underScoreIndex + 1);

        specialCaseIndex = Integer.parseInt(specialCaseParameter) - 1;

        System.out.println("specialCaseIndex: " + specialCaseIndex);
      }

      if( paramIdentifier.equals("arg") ) {
         testCaseArgAttr = (TestCaseArg)testCaseArgs.get(paramIndex);

         if(paramType.equals("ArrayList")) {
           arrListTypes = testCaseArgAttr.getArgListTypes();
           if(arrListTypes.size() > 0) {
             specialCaseType = (String)arrListTypes.get(specialCaseIndex);
             System.out.println("specialCaseType: " + specialCaseType);

             try {
               arrListVals = (ArrayList)args.get(paramIndex);
             }
             catch (ClassCastException cce) {
               arrListVals = new ArrayList();

               for(int j=0; j<arrListTypes.size(); j++) { 
                 arrListVals.add(new Object());
               }
             }
           
             arrListVals = addToArrayList(arrListVals, specialCaseIndex, specialCaseType, paramValue);

             System.out.println("arrListVals: " + arrListVals.toString());
           }
           else {
             arrListVals = new ArrayList();
           }

           args.set(paramIndex, arrListVals);
           testCaseArgAttr.setArgValue(arrListVals);

         } else if(paramType.equals("Matrix2D")) {
           specialCaseType = testCaseArgAttr.getMatrix2DType();
           rows = testCaseArgAttr.getMatrix2DRows();
           System.out.println("specialCaseType: " + specialCaseType);
           System.out.println("rows: " + rows);
           
           if(rows > 0) {
             arrListVals = parseCommaString(paramValue, specialCaseType);
             cols = arrListVals.size();
           }
           else {
             arrListVals = new ArrayList();
             cols = 0;
           }

           System.out.println("cols: " + cols);

           try {
             matrix2DVal = (Matrix2D)args.get(paramIndex);
           }
           catch (ClassCastException cce) {
             matrix2DVal = new Matrix2D(rows, cols);
           }
           
           for(int j=0; j<arrListVals.size(); j++) {
             matrix2DVal.set(specialCaseIndex, j, getObjectValue(specialCaseType, (Object)arrListVals.get(j)));
           }
           
           args.set(paramIndex, matrix2DVal);
           testCaseArgAttr.setArgValue(matrix2DVal.toArrayList());
  
         }
         else {
           args = addToArrayList(args, paramIndex, paramType, paramValue);
           arrListVals = new ArrayList();
           arrListVals.add(new Object());
           testCaseArgAttr.setArgValue(addToArrayList(arrListVals, 0, paramType, paramValue));
         }

         testCaseArgs.set(paramIndex, testCaseArgAttr);

      }
      else if( paramIdentifier.equals("exp") ) {

        System.out.println("paramType: " + paramType);
         if(paramType.equals("ArrayList")) {
           arrListTypes = expectedResultAttr.getArgListTypes();
           if(arrListTypes.size() > 0) {           
             specialCaseType = (String)arrListTypes.get(specialCaseIndex);
             System.out.println("specialCaseType: " + specialCaseType);

             if(expArrListVals.size() < 1) {
               for(int j=0; j<arrListTypes.size(); j++) {
                 expArrListVals.add(new Object());
               }
             }

             expArrListVals = addToArrayList(expArrListVals, specialCaseIndex, specialCaseType, paramValue);
           }
           else {
             expArrListVals = new ArrayList();
           }

           System.out.println("expArrListVals: " + expArrListVals.toString());

           expectedResultAttr.setResultValue(expArrListVals);
           expObj = expArrListVals;
         } else if(paramType.equals("Matrix2D")) {
           specialCaseType = expectedResultAttr.getMatrix2DType();
           rows = expectedResultAttr.getMatrix2DRows();
           System.out.println("specialCaseType: " + specialCaseType);
           System.out.println("rows: " + rows);

           arrListVals = parseCommaString(paramValue, specialCaseType);
           cols = arrListVals.size();

           System.out.println("cols: " + cols);

           if(expMatrix2DVal == null) {
             expMatrix2DVal = new Matrix2D(rows, cols);
           }

           for(int j=0; j<arrListVals.size(); j++) {
             expMatrix2DVal.set(specialCaseIndex, j, getObjectValue(specialCaseType, (Object)arrListVals.get(j)));
           }
          
            expectedResultAttr.setResultValue(expMatrix2DVal.toArrayList());
            expObj = expMatrix2DVal;
          
         }
         else {
           expObj = getObjectValue(paramType, paramValue);
           arrListVals = new ArrayList();
           arrListVals.add(new Object());
           expectedResultAttr.setResultValue(addToArrayList(arrListVals, 0, paramType, paramValue));
         }

      } 

    }

    System.out.println("\nexpObj: " + expObj.toString());
    System.out.println("\nARGS: " + args.toString());
    
 
    try {

      Context ctx = TCContext.getInitial();
      UserTransaction ux = Transaction.get();
      ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");
      try {
        if ( Transaction.begin(ux) ) {
          Log.msg("SERVLET Tx Begun: submitResponse run round engine");
          problemEJB = problemServicesHome.create();
          if(modified) {
            problemEJB.insertTestCaseBlobs(test_case_id, args, expObj);
          }
          else { 
            //insert the test case into the database
            test_case_id = problemEJB.insertTestCase(problem_id, args, expObj);
          }
          
        }
        if ( Transaction.commit(ux) ) { Log.msg("SERVLET Tx COMMITTED: saveTestCase "); }
        problemServicesHome = null;
      } catch (Exception e) {
        try {
          if (ux.getStatus()==Status.STATUS_ACTIVE) Transaction.rollback(ux);
        } catch (Exception te) {
            Log.msg("processTaskAdminProblem: saveTestCase error saving Test Case ");
            Log.msg("MSG: " + te);
        }
        Log.msg("MSG: " + e);
        throw new NavigationException("DB ERROR", XSL.INTERNAL_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
        } catch (Exception ignore) { }
        ctx = null;
      }

      if(command.equals("systemtestnext")) {
        testCaseAttr.setTestCaseId(test_case_id);
        testCaseAttr.setTestOrder(testOrder);
        testCaseAttr.setTestCaseArgs(testCaseArgs);
        testCaseAttr.setExpectedResult(expectedResultAttr);
        testCases.set(testOrder, testCaseAttr);
        problem.setTestCases(testCases);
        problemTag.addTag(problem.getXML());
        document.addTag(problemTag);
        Log.msg( document.getXML(2) );
        sessionObjects.put("sessionProblemAttr", problem);
      }
      
      result = HTMLmaker.render (document, SYS_TEST_MENU, null); 

    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: saveTestCase : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }

    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static String deleteTestCase (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    ProblemServices problemEJB = null;
    int testOrder = -1;
    int testCaseId = 0;
    Problem problemAttr = (Problem)sessionObjects.get("sessionProblemAttr");
    ArrayList testCases = problemAttr.getTestCases();
    TestCase testCaseAttr = null;

    try {
      testOrder = Integer.parseInt(request.getParameter("testOrder"));
      testCaseId = Integer.parseInt(request.getParameter("testCaseId"));

      Context ctx = TCContext.getInitial();
      ProblemServicesHome problemServicesHome = (ProblemServicesHome) ctx.lookup("com.topcoder.ProblemServicesHome");
      try {
          Log.msg("Begun: deleteTestCase");
          problemEJB = problemServicesHome.create();
          problemEJB.deleteTestCase(testCaseId);
        
          problemServicesHome = null;
      } catch (Exception e) {
        Log.msg("processTaskAdminProblem: deleteTestCase error deleting Test Case .");
        Log.msg("MSG: " + e);
        throw new NavigationException("DB ERROR", XSL.INTERNAL_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
        } catch (Exception ignore) { }
        ctx = null;
      }
       
      //now that the test case has been successfully deleted from the database, 
      //remove the test case from the session Problem and alter the 
      //the testOrder of each test case following the deleted test case.
      testCases.remove(testOrder);
      for (int i = testOrder; i < testCases.size(); i++) {
        testCaseAttr = (TestCase)testCases.get(i);
        testCaseAttr.setTestOrder(i);
        testCases.set(i, testCaseAttr);        
      }
      problemAttr.setTestCases(testCases);
      sessionObjects.put("sessionProblemAttr", problemAttr);      

      problemTag.addTag(problemAttr.getXML());
      document.addTag(problemTag);
//      Log.msg( document.getXML(2) );
      result = HTMLmaker.render (document, SYS_TEST_MENU, null);
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: deleteTestCase: ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }

   ////////////////////////////////////////////////////////////////////////////////
  private static String cancelTestCase (RenderHTML HTMLmaker, HttpServletRequest request,
    XMLDocument document, Navigation nav, RecordTag problemTag, HashMap sessionObjects)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
//    TestCase testCaseAttr = (TestCase)sessionObjects.get("sessionTestCaseAttr");
    Problem problemAttr = (Problem)sessionObjects.get("sessionProblemAttr");

    try {

      problemTag.addTag(problemAttr.getXML());
      document.addTag(problemTag);
//      Log.msg( document.getXML(2) );
      result = HTMLmaker.render (document, SYS_TEST_MENU, null);
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("processTaskAdminProblem: cancelTestCase: ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);
    }
    return result;
  }

}
