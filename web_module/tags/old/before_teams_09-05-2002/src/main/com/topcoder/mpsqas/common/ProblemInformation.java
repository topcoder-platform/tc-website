package com.topcoder.mpsqas.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.StringTokenizer;

/**
 * ProblemInformation is a class representing a table of information about
 * a problem.
 *
 * @author mitalub
 */
public class ProblemInformation implements Serializable {
    /**
     * The constructor sets up the ProblemInformation with the class name.
     * All other field must be set with the set methods.
     *
     * @param classs The name of the class.
     */
    public ProblemInformation(String classs) {
        className = classs;
        paramTypes = new ArrayList();
        correspondence = new ArrayList();
        timestamp = "";
        methodName = "";
        returnType = "";
        problemStatement = "";
        testCases = new ArrayList();
        allSolutions = new ArrayList();
        testers = new ArrayList();
    }

    /**
     * getClassName returns the class name.
     */
    public String getClassName() {
        return className;
    }

    /**
     * setMethodName sets the method name.
     *
     * @param name  The method name.
     */
    public void setMethodName(String name) {
        methodName = name;
    }

    /**
     * getMethodName returns the method name.
     */
    public String getMethodName() {
        return methodName;
    }

    /**
     * setParamTypes parses a String of param types and
     * stores them in the ArrayList.
     *
     * @param types String of space delimited param types.
     */
    public void setParamTypes(String types) {
        paramTypes = new ArrayList();
        StringTokenizer st = new StringTokenizer(types, " ");
        while (st.hasMoreTokens()) paramTypes.add(st.nextToken());
    }

    /**
     * setParamTypes sets the param types arraylist.
     *
     * @param types ArrayList of param types.
     */
    public void setParamTypes(ArrayList types) {
        paramTypes = types;
    }

    /**
     * getParamTypesString returns a String of param types (with spaces, that is)
     */
    public String getParamTypesString() {
        String ret = "";
        for (int i = 0; i < paramTypes.size(); i++)
            ret += (String) paramTypes.get(i) + " ";
        return ret;
    }

    /**
     * getParamTypes returns the parameter types (as an ArrayList).
     */
    public ArrayList getParamTypes() {
        return paramTypes;
    }

    /**
     * setReturnType sets the return type.
     *
     * @param type The return type
     */
    public void setReturnType(String type) {
        returnType = type;
    }

    /**
     * getReturnType returns the return type.
     */
    public String getReturnType() {
        return returnType;
    }

    /**
     * setProblemStatement sets the problem statment.
     *
     * @param statement The problem statement.
     */
    public void setProblemStatement(String statement) {
        problemStatement = statement;
    }

    /**
     * getProblemStatement returns the problem statement.
     */
    public String getProblemStatement() {
        return problemStatement;
    }

    /**
     * setDifficultyLevel sets the difficulty level of the problem.
     *
     * @param difficulty The difficulty level.
     */
    public void setDifficultyLevel(int difficulty) {
        difficultyLevel = difficulty;
    }

    /**
     * getDifficultyLevel returns the problem difficulty level.
     */
    public int getDifficultyLevel() {
        return difficultyLevel;
    }

    /**
     * getTimeStamp returns the last modified date of the proble.
     */
    public String getTimestamp() {
        return timestamp;
    }

    /**
     * setTimestamp sets the timestamp.
     *
     * @param time  The time.
     */
    public void setTimestamp(String time) {
        timestamp = time;
    }

    /**
     * addCorrespondence adds a correspence message
     * to the list.
     *
     * @param message The message to add
     */
    public void addCorrespondence(Correspondence message) {
        correspondence.add(message);
    }

    /**
     * setCorrespondence sets the correspondence ArrayList.
     *
     * @param messages New list of messages.
     */
    public void setCorrespondence(ArrayList messages) {
        correspondence = messages;
    }

    /**
     * getCorrespondence returns the ArrayList of messages.
     */
    public ArrayList getCorrespondence() {
        return correspondence;
    }

    /**
     */
    public SolutionInformation getSolution() {
        return solution;
    }

    /**
     * setSolution sets the solution file info
     */
    public void setSolution(SolutionInformation solution) {
        this.solution = solution;
    }

    /**
     * setStatus sets the status of the problem.
     *
     * @param in The status of the problem.
     */
    public void setStatus(int in) {
        status = in;
    }

    /**
     * getStatus returns the status of the problem.
     */
    public int getStatus() {
        return status;
    }

    /**
     * Sets the test cases.
     *
     * @param cases An ArrayList of test cases where each element is an ArrayList
     *              whose 0th to size()-1 elements are arguments
     */
    public void setTestCases(ArrayList cases) {
        testCases = cases;
    }

    /**
     * Returns the test cases, and an ArrayList of Object[]
     */
    public ArrayList getTestCases() {
        return testCases;
    }

    /**
     * Returns the type of user who retrieved the problem information
     */
    public int getUserType() {
        return userType;
    }

    /**
     * Sets the type of the user who retrieve the problem information.
     *
     * @param userType The type of the user.
     */
    public void setUserType(int userType) {
        this.userType = userType;
    }

    /**
     * Adds a solution to the allSolutions list.
     */
    public void addSolution(SolutionInformation in) {
        allSolutions.add(in);
    }

    /**
     * Sets the solutions list.
     *
     * @param in ArrayList of ArrayList of solutions.  Inner ArrayLists of form name,text,id.
     */
    public void setAllSolutions(ArrayList in) {
        allSolutions = in;
    }

    /**
     * Returns the list of solutions.
     */
    public ArrayList getAllSolutions() {
        return allSolutions;
    }

    public void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    public int getProblemId() {
        return this.problemId;
    }

    /**
     * ArrayList of UserInformation representing the problem's testers.
     */
    public void setTesters(ArrayList testers) {
        this.testers = testers;
    }

    public ArrayList getTesters() {
        return this.testers;
    }

    /**
     * The user who wrote the problem.
     */
    public void setWriter(UserInformation writer) {
        this.writer = writer;
    }

    public UserInformation getWriter() {
        return writer;
    }

    public void setPoints(double points) {
        this.points = points;
    }

    public double getPoints() {
        return this.points;
    }

    public void setDivision(int division) {
        this.division = division;
    }

    public int getDivision() {
        return this.division;
    }

    public void setPaid(double paid) {
        this.paid = paid;
    }

    public double getPaid() {
        return paid;
    }

    public void setPendingPayment(double pendingPayment) {
        this.pendingPayment = pendingPayment;
    }

    public double getPendingPayment() {
        return pendingPayment;
    }

    public void setPrimarySolutionId(int primarySolutionId) {
        this.primarySolutionId = primarySolutionId;
    }

    public int getPrimarySolutionId() {
        return primarySolutionId;
    }


    public Object clone() {
        ProblemInformation p = new ProblemInformation(className);
        p.setTimestamp(timestamp);
        p.setMethodName(methodName);
        p.setReturnType(returnType);
        p.setParamTypes((ArrayList) paramTypes.clone());
        p.setProblemStatement(problemStatement);
        p.setDifficultyLevel(difficultyLevel);
        p.setCorrespondence((ArrayList) correspondence.clone());
        p.setSolution(solution);
        p.setStatus(status);
        p.setTestCases((ArrayList) testCases.clone());
        p.setAllSolutions((ArrayList) allSolutions.clone());
        p.setUserType(userType);
        p.setProblemId(problemId);
        p.setTesters((ArrayList) testers.clone());
        p.setWriter(writer);
        p.setPoints(points);
        p.setDivision(division);
        p.setPrimarySolutionId(primarySolutionId);
        p.setPaid(paid);
        p.setPendingPayment(pendingPayment);
        return p;
    }

    public String toString() {
        return "ProblemInformation(" + className + ")";
    }

    private String timestamp;
    private String className;
    private String methodName;
    private String returnType;
    private ArrayList paramTypes;
    private String problemStatement;
    private int difficultyLevel;
    private ArrayList correspondence;
    private SolutionInformation solution;
    private int status;
    private ArrayList testCases;
    private ArrayList allSolutions;
    private int userType;
    private int problemId;
    private ArrayList testers;
    private UserInformation writer;
    private int division;
    private double points;
    private double paid;
    private double pendingPayment;
    private int primarySolutionId;
}
