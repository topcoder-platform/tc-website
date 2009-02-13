package com.topcoder.mpsqas.tester;

import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.shared.util.logging.Logger;

import java.io.*;
import java.lang.reflect.Method;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Tester is the class responsible for running users code.  It is meant to die after each test, and be restarted
 * presumably by a shell script.  The tester listens for socket connection on the TESTER_PORT, then takes an ArrayList
 * from the socket, and processes the test whose information is in the ArrayList.  It the sends the result back through
 * the socket.
 *
 * @author mitalub
 */
public class Tester extends Thread {
    private static Logger log = Logger.getLogger(Tester.class);

    /**
     * main creates the tester and starts it up by calling getTest.
     */
    public static void main(String[] args) {
        Tester t = new Tester();
        t.getTest();
        System.exit(1);
    }

    /**
     * getTest is responsible for the socket work in testing.  It gets a connection to the TesterQueue and waits for a test.
     * When it gets a test connection it takes an ArrayList representing test arguments and processes a test on them.  It the returns
     * the results of the test through the socket, and kills itself.  If their are any exceptions, it kills itself.
     */
    public void getTest() {
        try {
            //Gets a connetion to the TesterQueue and waits for a test
            Socket socket = new Socket(ApplicationConstants.TESTER_IP, ApplicationConstants.GET_TEST_PORT);

            //create the streams
            ObjectOutputStream outputStream = new ObjectOutputStream(new BufferedOutputStream(socket.getOutputStream()));
            outputStream.flush();
            ObjectInputStream inputStream = new ObjectInputStream(socket.getInputStream());

            //get the data
            ArrayList data = (ArrayList) inputStream.readObject();
            log.debug("Got new test.");

            //process the test
            ArrayList testResult = test((HashMap) data.get(0), (String) data.get(1), (String) data.get(2), (String) data.get(3), (ArrayList) data.get(4), (Object[]) data.get(5));

            //return the results
            outputStream.writeObject(testResult);
            outputStream.flush();

            //close everyhing
            try {
                outputStream.close();
            } catch (Exception e1) {
            }
            try {
                inputStream.close();
            } catch (Exception e2) {
            }
            try {
                socket.close();
            } catch (Exception e3) {
            }
        } catch (Exception e) {
            log.error("Error in tester: ");
            e.printStackTrace();
        }
        //commit suicide
        System.exit(1);
    }

    /**
     * test is responsible for managing the test.  It makes sure the args are valid (and casts them properly).  It loads the class and any
     * inner classes.  It then runs the args through the method and returns all the results.  All exceptions are printed to a new PrintStream
     * so the user can see them.  The first element in the return ArrayList is a String representation of what happened, the second is the actual
     * return Object, or null if nothing was returned.
     *
     * @param classFiles A HashMap of className->classCode representing the class to test.
     * @param packageName The package in which the code to test is.
     * @param className The class to test.
     * @param methodName The method to test.
     * @param paramTypes The parameter types of the method, as string descriptors.
     * @param args The arguments to pass to the method
     */
    private ArrayList test(HashMap classFiles, String packageName, String className, String methodName, ArrayList paramTypes, Object[] args) {
        log.debug("Testing " + packageName + "." + className + "." + methodName + paramTypes);
        log.debug("  Args: " + ApplicationConstants.makePretty(args));

        PrintStream oldOut = System.out;
        PrintStream oldErr = System.err;
        ByteArrayOutputStream codeOut = new ByteArrayOutputStream();
        PrintStream codeOutPrint = new PrintStream(codeOut);
        System.setOut(codeOutPrint);
        System.setErr(codeOutPrint);

        Object resultObject = null;
        try {
            //load the class
            TCClassLoader loader = new TCClassLoader(classFiles);
            loader.loadClass(packageName + "." + className);
            Class mainClass = loader.getMainClass();

            //get the parametr classes
            Class[] paramClasses = getParamClasses(paramTypes);

            //run the method
            resultObject = runMethod(mainClass, methodName, paramClasses, args);
        } catch (Exception e2) {
            e2.printStackTrace();
        }

        try {
            codeOut.close();
        } catch (Exception e3) {
        }

        //make sure the result string is not too long, and does not contain the wierd package name
        String result = codeOut.toString();
        if (result.length() > 5000) result = result.substring(0, 5000);
        int index;
        while ((index = result.indexOf(packageName)) != -1) {
            if (index + packageName.length() + 1 < result.length())
                result = result.substring(0, index) + result.substring(index + packageName.length() + 1);
            else
                result = result.substring(0, index);
        }
        ArrayList retVal = new ArrayList(2);
        retVal.add(result);
        retVal.add(resultObject);
        return retVal;
    }

    /**
     * getParamClasses converts an ArrayList of Strings representing the parameter object types to a Class[].
     *
     * @param paramTypes An ArrayList of String representations of the parameter types.
     */
    private Class[] getParamClasses(ArrayList paramTypes) {
        Class[] classes = new Class[paramTypes.size()];
        String type;
        for (int i = 0; i < paramTypes.size(); i++) {
            type = (String) paramTypes.get(i);
            if (type.equals("int"))
                classes[i] = int.class;
            else if (type.equals("Integer"))
                classes[i] = Integer.class;
            else if (type.equals("double"))
                classes[i] = double.class;
            else if (type.equals("Double"))
                classes[i] = Double.class;
            else if (type.equals("long"))
                classes[i] = long.class;
            else if (type.equals("Long"))
                classes[i] = Long.class;
            else if (type.equals("Character"))
                classes[i] = Character.class;
            else if (type.equals("char"))
                classes[i] = char.class;
            else if (type.equals("String"))
                classes[i] = String.class;
            else if (type.equals("int[]"))
                classes[i] = int[].class;
            else if (type.equals("double[]"))
                classes[i] = double[].class;
            else if (type.equals("String[]")) classes[i] = String[].class;
        }
        return classes;
    }

    /**
     * runMethod actually calls the method using reflection.  It creates a class instance, and gets the method.
     * It the starts the Thread to run the method, and times it.  If it takes longer than TIME_OUT_MILLIS, "The method timed out"
     * is printed, otherwise the return value is printed.  Note all System.out's print to the new PrintStream that the user will
     * get.  It returns the Object returned, or null if no object was returned.
     *
     * @param testClass The class to test.
     * @param method    The String name of the method to test.
     * @param paramTypes The paramter types, as classes.
     * @param paramValues The parameter values as Objects.
     */
    private Object runMethod(Class testClass, String method, Class[] paramTypes, Object[] paramValues) {
        Object result = null;
        try {
            System.out.println(method + "() called:");
            this.testObject = testClass.newInstance();
            this.method = testClass.getMethod(method, paramTypes);
            this.paramValues = paramValues;
            this.testDone = false;
            this.resultObject = null;
            start();
            long starttime = System.currentTimeMillis();
            while (!this.testDone && System.currentTimeMillis() - starttime < ApplicationConstants.TIME_OUT_MILLIS) {
                Thread.sleep(10);
            }

            if (!this.testDone)
                System.out.println("The method timed out.");
            else
                System.out.println("The method returned: " + ApplicationConstants.makePretty(this.resultObject));
            System.out.println("Execution time: " + ((System.currentTimeMillis() - starttime) / 1000.0));
            result = this.resultObject;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * run() calls the method on the code and stores the result in a global Object.  If the run method finishes,
     * it sets a boolean stating so.
     */
    public void run() {
        try {
            this.resultObject = this.method.invoke(this.testObject, this.paramValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        testDone = true;
    }

    private Object testObject;
    private Method method;
    private Object[] paramValues;
    private Object resultObject;
    private boolean testDone;
}
