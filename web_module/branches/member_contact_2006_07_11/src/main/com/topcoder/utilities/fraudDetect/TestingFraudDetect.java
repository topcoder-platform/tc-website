package com.topcoder.utilities.fraudDetect;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.utilities.CommentStripper;
import org.apache.log4j.Category;

import javax.sql.DataSource;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;


public class TestingFraudDetect {

    private static Category log = Category.getInstance(FraudDetect.class.getName());

    private ResultSet rs = null;
    private PreparedStatement ps = null;
    private Connection conn = null;
    private CommentStripper cs = new CommentStripper();
    private DataSource ds = null;
    private boolean restrictByCompany = false;


    /**
     *
     * @param args
     * @throws SQLException
     * @throws Exception
     */
    public static void main(String args[]) throws Exception {
        int numArgs = args.length;
//        if (numArgs < 2 || numArgs > 3) {
        if (numArgs < 1 || numArgs > 2) {
            System.out.println("SYNTAX: java " + FraudDetect.class.getName() + " <problem id> <optional company id> ");
            return;
        }

        try {
            TestingFraudDetect tm = new TestingFraudDetect();
            tm.ds = (DataSource) TCContext.getInitial().lookup("SCREENING_OLTP");
            ArrayList a = null;
            if (args.length == 2) {
                tm.restrictByCompany = true;
                a = tm.fraud(Integer.parseInt(args[0]), Integer.parseInt(args[1]));
            } else {
                tm.restrictByCompany = false;
                a = tm.fraud(Integer.parseInt(args[0]), -1);
            }
            for (int c = 0; c < a.size(); c++)
                System.out.println("REPORT:" + a.get(c).toString());
        } catch (Exception exception1) {
            exception1.printStackTrace();
        }

    }


    /**
     *
     * @param o
     */
    private void closeObject(Object o) {
        if (o == null)
            return;
        try {
            if (o instanceof ResultSet)
                ((ResultSet) o).close();
            else if (o instanceof PreparedStatement)
                ((PreparedStatement) o).close();
            else if (o instanceof Connection)
                ((Connection) o).close();
        } catch (Exception e) {
            try {
                log.error("Fraud Detect:  Error closing " + o.getClass());
                log.error(e.getMessage());
            } catch (Exception ex) {
            }
        }
    }


    /**
     *
     */
    private void closeConnections() {

        closeObject(rs);
        closeObject(ps);
        closeObject(conn);
        rs = null;
        ps = null;
        conn = null;
    }

    /**
     *
     * @param e
     */
    private void handleException(Exception e) {
        try {
            log.error("Fraud Detect: Exception caught: " + e.toString());
            log.error("Exception details:");
            if (e instanceof SQLException)
                DBMS.printSqlException(true, (SQLException) e);
            else
                e.printStackTrace();
        } catch (Exception ex) {
        }
        closeConnections();
    }


    /**
     * get the contest problems and their difficulty levels
     * @param companyId
     * @param componentId
     * @return
     */
    private Problem getProblemInfo(int companyId, int componentId) {
        Problem p = null;

        try {
            conn = ds.getConnection();
            StringBuffer sqlString = new StringBuffer(500);
            sqlString.append(" SELECT rc.component_id");
            sqlString.append(" , c.class_name");
            sqlString.append(" , rc.difficulty_id");
            sqlString.append(" , 1 as division_id");
            sqlString.append(" FROM session_round_component rc");
            sqlString.append(" , component c");
            sqlString.append(" WHERE rc.component_id = c.component_id");
            sqlString.append(" AND c.component_id = ?");
            if (restrictByCompany) {
                sqlString.append(" AND rc.session_round_id IN (SELECT session_round_id");
                sqlString.append("                     FROM session_profile sp");
                sqlString.append("                    WHERE sp.company_id = ?)");
            }

            ps = conn.prepareStatement(sqlString.toString());
            ps.setInt(1, componentId);
            if (restrictByCompany) {
                ps.setInt(2, companyId);
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new Problem();
                p.setProblemId(rs.getInt("component_id"));
                p.setClassName(rs.getString("class_name"));
                p.setDivisionId(rs.getInt("division_id"));
                p.setDifficultyLevelId(rs.getInt("difficulty_id"));
            }
            closeObject(rs);
            closeObject(ps);
            closeObject(conn);
        } catch (Exception exception1) {
            handleException(exception1);
        }
        return p;
    }


    /**
     * get the contest problems and their difficulty levels
     * @param companyId
     * @param componentId
     * @return
     */
    private ArrayList getSubmissionInfo(int companyId, int componentId) {
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Problem p = null;
        ArrayList problems = new ArrayList();

        try {
            conn = ds.getConnection();
            StringBuffer sqlString = new StringBuffer(500);

            sqlString.append(" SELECT cc.coder_id");
            sqlString.append(" , scf.class_file");
            sqlString.append(" , u.user_id as handle");
            sqlString.append(" , s.submission_text");
            sqlString.append(" , c.language_id");
            sqlString.append(" , s.open_time");
            sqlString.append(" , s.submit_time");
            sqlString.append(" , s.submission_points");
            sqlString.append(" FROM component_state cc");
            sqlString.append(" , submission s");
            sqlString.append(" , security_user u ");
            sqlString.append(" , submission_class_file scf");
            sqlString.append(" , compilation c");
            sqlString.append(" WHERE 1=1");
            sqlString.append(" AND cc.component_id = ?");
            sqlString.append(" AND s.submission_points > 0");
            sqlString.append(" AND s.component_state_id = cc.component_state_id");
            sqlString.append(" AND u.login_id = cc.coder_id ");
            sqlString.append(" AND cc.submission_number = s.submission_number");
            sqlString.append(" AND scf.submission_number = s.submission_number");
            sqlString.append(" AND scf.component_state_id = s.component_state_id");
            sqlString.append(" AND scf.submission_number = cc.submission_number");
            sqlString.append(" AND scf.component_state_id = cc.component_state_id");
            sqlString.append(" AND scf.sort_order = 1");
            sqlString.append(" AND c.component_state_id = cc.component_state_id");
            if (restrictByCompany) {
                sqlString.append(" AND cc.session_id IN (SELECT session_id");
                sqlString.append("                FROM session_profile sp");
                sqlString.append("                   , session s");
                sqlString.append("                WHERE sp.company_id = ?");
                sqlString.append("                  and sp.session_profile_id = s.session_profile_id)");
            }
            sqlString.append(" ORDER BY s.submission_points DESC");

            ps = conn.prepareStatement(sqlString.toString());
            ps.setInt(1, componentId);
            if (restrictByCompany) {
                ps.setInt(2, companyId);
            }
            rs = ps.executeQuery();

            for (int count = 0; rs.next(); count++, problems.add(p)) {
                p = new Problem();
                p.setCoderId(rs.getInt("coder_id"));
                p.setSubmissionClassFile(rs.getBytes("class_file"));
                p.setSubmissionText(cs.stripComments(DBMS.getTextString(rs, 4)));
                p.setSubmitPoints(rs.getFloat("submission_points"));
                p.setHandle(rs.getString("handle"));
                p.setLanguageId(rs.getInt("language_id"));
                p.setOpenTime(rs.getLong("open_time"));
                p.setSubmitTime(rs.getLong("submit_time"));
            }
            //enter log4j message
            closeObject(rs);
            closeObject(ps);
            closeObject(conn);
        } catch (Exception exception1) {
            handleException(exception1);
        }

        return problems;
    }


    /**
     *
     * @param companyId
     * @param componentId
     * @return
     */
    public ArrayList fraud(int componentId, int companyId) {

        log.debug("ContestServices.fraudDetect called");
        Problem problem = getProblemInfo(companyId, componentId);
        String className = problem.getClassName();

        Problem tempProb = null;


        String tempString = "",
                programtext = "";

        int count = 0,
                count1 = 0,
                count2 = 0,
                tempint = 0,
                sim1 = 0,
                sim2 = 0,
                numCounter = 0,
                numCounter2;

        double simPercent = 0.0D,
                avgSimPercent = 0.0D,
                stddevSimPercent = 0.0D,
                avescore = 0.0D,
                sourceAvgSimPercent = 0.0D,
                sourceStddevSimPercent = 0.0D,
                longestSubstringAvgPercent = 0.0D,
                longestsubstringStddevPercent = 0.0D,
                longestSubsequenceAvgPercent = 0.0D,
                longestSubsequenceStddevPercent = 0.0D,
                editDistanceAvgPercent = 0.0D,
                editDistanceStddevPercent = 0.0D,
                compositeAvg = 0.0D,
                compositeStddev = 0.0D;

        ArrayList retVal = new ArrayList();
        ArrayList comparisons;
        ArrayList sourceComparisons;
        ArrayList longestSubstrings;
        ArrayList longestSubsequences;
        ArrayList editDistances;
        ArrayList composite;

        double[][] simPercentStore;
        double[][] sourceSimpercentStore;
        double[][] longestSubstringStore;
        double[][] longestSubsequenceStore;
        double[][] editDistanceStore;
        double[][] compositeStore;

        int[] competitorIds;
        double[] charPerSecondScores;

        String[] competitorHandles;

        ArrayList[] fileStrings;
        ArrayList[] sourceStrings;
        //double[][] compositescores;
        ArrayList copyrights = new ArrayList();
        ArrayList cpsalert = new ArrayList();
        JavaTokenizer[] jTok;

        File tempfile;

        FileOutputStream fos;

        Runtime rt = Runtime.getRuntime();

        Process p;

        Problem submittedProblem = null;

        try {

            tempfile = new File("./tempfile." + System.currentTimeMillis() + ".tmp");
            tempfile.createNewFile();

            log.debug("Looking into problem " + problem.getProblemId());
            ArrayList subInfo = getSubmissionInfo(problem.getRoundId(), problem.getProblemId());

            int xxx = subInfo.size();
            log.debug("Arrays: " + xxx);
            competitorIds = new int[xxx];
            competitorHandles = new String[xxx];
            fileStrings = new ArrayList[xxx];
            sourceStrings = new ArrayList[xxx];
            simPercentStore = new double[xxx][xxx];
            sourceSimpercentStore = new double[xxx][xxx];
            longestSubstringStore = new double[xxx][xxx];
            longestSubsequenceStore = new double[xxx][xxx];
            editDistanceStore = new double[xxx][xxx];
            compositeStore = new double[xxx][xxx];
            jTok = new JavaTokenizer[xxx];
            charPerSecondScores = new double[xxx];

            for (int i = 0; i < subInfo.size(); i++) {
                competitorIds[i] = ((Problem) subInfo.get(i)).getCoderId();
                competitorHandles[i] = ((Problem) subInfo.get(i)).getHandle();
            }
            //for each coder who submitted the problem
            log.debug(" Before for each coder who submitted the problem");
            for (count = 0; count < subInfo.size(); count++) {
                submittedProblem = (Problem) subInfo.get(count);
                log.debug(submittedProblem.getHandle() + "'s " + className);
                programtext = submittedProblem.getSubmissionText();

                try {
                    //write the class file to a temporary file
                    fos = new FileOutputStream(tempfile);
                    fos.write((byte[]) submittedProblem.getSubmissionClassFile());
                    fos.close();

                    //and run strings on that temp file
                    p = rt.exec("strings ./" + tempfile.getName());

                    //store each string in an ArrayList
                    tempString = "";
                    fileStrings[count] = new ArrayList();
                    while ((tempint = p.getInputStream().read()) > 0) {
                        if (tempint != '\n')
                            tempString += (char) tempint;
                        else {
                            if (tempString.indexOf("java") == -1)
                                fileStrings[count].add(tempString.trim());
                            tempString = "";
                        }
                    }
                    if (!tempString.trim().equals("")) {
                        fileStrings[count].add(tempString.trim());
                    }
                } catch (Exception e) {
                    fileStrings[count] = null;
                }

                count1 = -1;
                sourceStrings[count] = new ArrayList();
                jTok[count] = new JavaTokenizer(programtext);

                /* calculate Characters per second rate */
                try {
                    charPerSecondScores[count] = programtext.length() * 1000.0 / (submittedProblem.getSubmitTime() - submittedProblem.getOpenTime());
                    if (charPerSecondScores[count] > 3.0) {
                        tempString = String.valueOf(charPerSecondScores[count]);
                        tempString = rpad(tempString, '0', 9);
                        tempString = tempString.substring(0, 6);
                        cpsalert.add("  " + competitorHandles[count] + "(" + competitorIds[count] + ") had a char per second rate of " + tempString + " in problem " + className + "(" + componentId + ").");

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                /* flag submissions with the word "copyright" */
                if (jTok[count].copyright) copyrights.add("  " + competitorHandles[count] + "(" + competitorIds[count] + ") used the word 'copyright' in problem " + className + "(" + componentId + ").");



                /* parse program text */
                tempString = "";
                while (++count1 < programtext.length()) {
                    if (programtext.charAt(count1) != '\n')
                        tempString += programtext.charAt(count1);
                    else {
                        if (!tempString.trim().equals("")) sourceStrings[count].add(tempString.trim());
                        tempString = "";
                    }
                }
                if (!tempString.trim().equals("")) sourceStrings[count].add(tempString.trim());
                tempfile.delete(); // moved inside for loop
            }
            System.gc();
            log.debug(" AFTER for each coder who submitted the problem");


            //compare each ArrayList of strings to each other ArrayList of strings and get the correlation and average correlation
            avgSimPercent = 0;
            stddevSimPercent = 0;
            sourceAvgSimPercent = 0;
            sourceStddevSimPercent = 0;
            longestSubstringAvgPercent = 0;
            longestsubstringStddevPercent = 0;
            longestSubsequenceAvgPercent = 0;
            longestSubsequenceStddevPercent = 0;
            editDistanceAvgPercent = 0;
            editDistanceStddevPercent = 0;
            compositeAvg = 0;
            compositeStddev = 0;
            numCounter = 0;
            numCounter2 = 0;
            comparisons = new ArrayList();
            sourceComparisons = new ArrayList();
            longestSubstrings = new ArrayList();
            longestSubsequences = new ArrayList();
            editDistances = new ArrayList();
            composite = new ArrayList();
            log.debug(" BEFORE compare each ArrayList of strings to each other ArrayList of strings and get the correlation and average correlation ");
            for (count = 0; count < fileStrings.length - 1; count++)
                for (count1 = count + 1; count1 < fileStrings.length; count1++)
                    if (fileStrings[count] != null && fileStrings[count1] != null) {
                        try {
                            /* Do direct filestring comparison */
                            sim1 = 0;
                            for (count2 = 0; count2 < fileStrings[count].size(); count2++)
                                if (fileStrings[count1].indexOf(fileStrings[count].get(count2)) != -1) sim1++;

                            sim2 = 0;
                            for (count2 = 0; count2 < fileStrings[count1].size(); count2++)
                                if (fileStrings[count].indexOf(fileStrings[count1].get(count2)) != -1) sim2++;

                            simPercent = ((double) sim1 / fileStrings[count].size() + (double) sim2 / fileStrings[count1].size()) / 2;
                            simPercentStore[count][count1] = simPercent;
                            avgSimPercent += simPercent;
                            stddevSimPercent += simPercent * simPercent;
                            numCounter++;
                            tempString = String.valueOf(simPercent);
                            tempString = rpad(tempString, '0', 10);
                            tempString = tempString.substring(0, 9);
                            tempString = tempString + " for " + competitorHandles[count] + "(" + competitorIds[count] + ") and ";
                            tempString += competitorHandles[count1] + "(" + competitorIds[count1] + ") for problem " + className + "(" + componentId + ").";
                            comparisons.add(tempString);
                        } catch (Exception e) {
                            log.error("Error with Do direct filestring comparison:\n" + e.toString());
                        }
                    }
            log.debug(" AFTER compare each ArrayList of strings to each other ArrayList of strings and get the correlation and average correlation ");
            fileStrings = null;
            System.gc();

            /* Now do source comparisons */
            log.debug(competitorHandles[count] + "'s " + className + " BEFORE  Now do source comparisons ");
            for (count = 0; count < jTok.length - 1; count++)
                for (count1 = count + 1; count1 < jTok.length; count1++) {
                    /* Determine longest substring length */
                    log.debug(competitorHandles[count] + "'s " + className + " BEFORE  Determine longest substring length  ");
                    try {
                        simPercent = jTok[count1].longestCommonSubstring(jTok[count]);
                        longestSubstringStore[count][count1] = simPercent;
                        longestSubstringAvgPercent += simPercent;
                        longestsubstringStddevPercent += simPercent * simPercent;
                        tempString = String.valueOf(simPercent);
                        tempString = tempString + " for " + competitorHandles[count] + "(" + competitorIds[count] + ") and ";
                        tempString += competitorHandles[count1] + "(" + competitorIds[count1] + ") for problem " + className + "(" + componentId + ").";
                        longestSubstrings.add(tempString);
                    } catch (Exception e) {
                        log.error("Error in Determine longest substring length:\n" + e.toString());
                    }
                    log.debug(competitorHandles[count] + "'s " + className + " AFTER  Determine longest substring length  ");

                    /* Determine common subsequence ratio */
                    log.debug(competitorHandles[count] + "'s " + className + " BEFORE  Determine common subsequence ratio  ");
                    try {
                        simPercent = jTok[count1].longestCommonSubsequence(jTok[count]) /
                                ((double) Math.max(jTok[count].size(), jTok[count1].size()));
                        longestSubsequenceStore[count][count1] = simPercent;
                        longestSubsequenceAvgPercent += simPercent;
                        longestSubsequenceStddevPercent += simPercent * simPercent;
                        tempString = String.valueOf(simPercent);
                        tempString = rpad(tempString, '0', 10);
                        tempString = tempString.substring(0, 9);
                        tempString = tempString + " for " + competitorHandles[count] + "(" + competitorIds[count] + ") and ";
                        tempString += competitorHandles[count1] + "(" + competitorIds[count1] + ") for problem " + className + "(" + componentId + ").";
                        longestSubsequences.add(tempString);
                    } catch (Exception e) {
                        log.error("Error in Determine common subsequence ration :\n" + e.toString());
                    }
                    log.debug(competitorHandles[count] + "'s " + className + " AFTER  Determine common subsequence ratio  ");

                    /* Determine edit distance ratio */
                    log.debug(competitorHandles[count] + "'s " + className + " BEFORE  Determine edit distance ratio  ");
                    try {
                        simPercent = jTok[count1].levinsteinDistance(jTok[count]) /
                                ((double) Math.max(jTok[count].size(), jTok[count1].size()));
                        editDistanceStore[count][count1] = simPercent;
                        editDistanceAvgPercent += simPercent;
                        editDistanceStddevPercent += simPercent * simPercent;
                        tempString = String.valueOf(simPercent);
                        tempString = rpad(tempString, '0', 10);
                        tempString = tempString.substring(0, 9);
                        tempString = tempString + " for " + competitorHandles[count] + "(" + competitorIds[count] + ") and ";
                        tempString += competitorHandles[count1] + "(" + competitorIds[count1] + ") for problem " + className + "(" + componentId + ").";
                        editDistances.add(tempString);
                    } catch (Exception e) {
                        log.error("Error in Determine edit distance ration:\n" + e.toString());
                    }
                    log.debug(competitorHandles[count] + "'s " + className + " AFTER  Determine edit distance ratio  ");

                    /* Do old source comparison */
                    log.debug(competitorHandles[count] + "'s " + className + " BEFORE  Do old source comparison  ");
                    try {
                        sim1 = 0;
                        for (count2 = 0; count2 < sourceStrings[count].size(); count2++)
                            if (sourceStrings[count1].indexOf(sourceStrings[count].get(count2)) != -1) sim1++;

                        sim2 = 0;
                        for (count2 = 0; count2 < sourceStrings[count1].size(); count2++)
                            if (sourceStrings[count].indexOf(sourceStrings[count1].get(count2)) != -1) sim2++;

                        numCounter2++;
                        simPercent = ((double) sim1 / sourceStrings[count].size() + (double) sim2 / sourceStrings[count1].size()) / 2;
                        sourceSimpercentStore[count][count1] = simPercent;
                        sourceAvgSimPercent += simPercent;
                        sourceStddevSimPercent += simPercent * simPercent;
                        tempString = String.valueOf(simPercent);
                        tempString = rpad(tempString, '0', 10);
                        tempString = tempString.substring(0, 9);
                        tempString = tempString + " for " + competitorHandles[count] + "(" + competitorIds[count] + ") and ";
                        tempString += competitorHandles[count1] + "(" + competitorIds[count1] + ") for problem " + className + "(" + componentId + ").";

                        sourceComparisons.add(tempString);
                    } catch (Exception e) {
                        log.error("Error in Do old source comparison:\n" + e.toString());
                    }
                    log.debug(competitorHandles[count] + "'s " + className + " AFTER  Do old source comparison  ");
                }

            sourceStrings = null;
            System.gc();
            log.debug(competitorHandles[count] + "'s " + className + " AFTER  Now do source comparisons ");

            /* Compute averages and standard deviations of each metric */
            avgSimPercent /= numCounter;
            stddevSimPercent = Math.sqrt(stddevSimPercent / numCounter -
                    sqr(avgSimPercent));
            sourceAvgSimPercent /= numCounter2;
            sourceStddevSimPercent = Math.sqrt(sourceStddevSimPercent / numCounter2 -
                    sqr(sourceAvgSimPercent));
            longestSubstringAvgPercent /= numCounter2;
            longestsubstringStddevPercent = Math.sqrt(longestsubstringStddevPercent /
                    numCounter2 -
                    sqr(longestSubstringAvgPercent));
            longestSubsequenceAvgPercent /= numCounter2;
            longestSubsequenceStddevPercent = Math.sqrt(longestSubsequenceStddevPercent /
                    numCounter2 -
                    sqr(longestSubsequenceAvgPercent));
            editDistanceAvgPercent /= numCounter2;
            editDistanceStddevPercent = Math.sqrt(editDistanceStddevPercent /
                    numCounter2 -
                    sqr(editDistanceAvgPercent));

            /* Finally, normalize the metrics and produce composite scores */

            log.debug(" BEFORE  Finally, normalize the metrics and produce composite scores ");
            for (count = 0; count < jTok.length - 1; count++)
                for (count1 = count + 1; count1 < jTok.length; count1++) {
                    if (jTok[count] != null && jTok[count1] != null) {
                        double total = 0.0;
                        if (simPercentStore[count][count1] > avgSimPercent)
                            total += curve((simPercentStore[count][count1] - avgSimPercent) / stddevSimPercent);
                        if (sourceSimpercentStore[count][count1] > sourceAvgSimPercent)
                            total += curve((sourceSimpercentStore[count][count1] - sourceAvgSimPercent) / sourceStddevSimPercent);
                        if (longestSubstringStore[count][count1] > longestSubstringAvgPercent)
                            total += curve((longestSubstringStore[count][count1] - longestSubstringAvgPercent) / longestsubstringStddevPercent);
                        if (longestSubsequenceStore[count][count1] > longestSubsequenceAvgPercent)
                            total += curve((longestSubsequenceStore[count][count1] - longestSubsequenceAvgPercent) / longestSubsequenceStddevPercent);
                        if (editDistanceStore[count][count1] < editDistanceAvgPercent)
                            total += curve((editDistanceStore[count][count1] - editDistanceAvgPercent) / editDistanceStddevPercent);
                        total = total / 5;
                        compositeAvg += total;
                        compositeStddev += sqr(total);
                        compositeStore[count][count1] = total;
                        tempString = "" + total;
                        if (tempString.indexOf('E') == -1) {
                            tempString = rpad(tempString, '0', 10);
                            tempString = tempString.substring(0, 9);
                            tempString = tempString + " for " + competitorHandles[count] + "(" + competitorIds[count] + ") and ";
                            tempString += competitorHandles[count1] + "(" + competitorIds[count1] + ") for problem " + className + "(" + componentId + ").";

                            composite.add(tempString);
                        }
                    }
                }
            log.debug(" AFTER  Finally, normalize the metrics and produce composite scores ");
            jTok = null;
            compositeAvg /= numCounter2;
            compositeStddev = Math.sqrt(compositeStddev / numCounter2 -
                    sqr(compositeAvg));


            System.gc();
            //sort pairs of code by correlation
            Collections.sort(comparisons);
            Collections.sort(sourceComparisons);
            Collections.sort(longestSubstrings);
            Collections.sort(longestSubsequences);
            Collections.sort(editDistances);
            Collections.sort(composite);

            //get the average score for the problem
            StringBuffer sqlString = new StringBuffer(500);

            sqlString.append(" SELECT SUM(s.submission_points)");
            sqlString.append(" , COUNT(s.submission_points)");
            sqlString.append(" FROM component_state cc");
            sqlString.append(" , submission s");
            sqlString.append(" WHERE cc.component_id = ?");
            sqlString.append(" AND s.submission_points > 0");
            sqlString.append(" AND s.component_state_id = cc.component_state_id");
            sqlString.append(" AND cc.submission_number = s.submission_number");
            if (restrictByCompany) {
                sqlString.append(" AND cc.session_id IN (SELECT session_id");
                sqlString.append("                FROM session_profile sp");
                sqlString.append("                   , session s");
                sqlString.append("                WHERE sp.company_id = ?");
                sqlString.append("                  and sp.session_profile_id = s.session_profile_id)");
            }

            conn = ds.getConnection();
            ps = conn.prepareStatement(sqlString.toString());

            ps.setInt(1, componentId);
            if (restrictByCompany) {
                ps.setInt(2, companyId);
            }
            rs = ps.executeQuery();
            rs.next();
            avescore = rs.getDouble(1) / rs.getInt(2);
            closeConnections();

            //add info to the return value
            retVal.add("For " + className + ":");
            retVal.add("  Average source similarity: " + sourceAvgSimPercent);
            retVal.add("  Std.Dev source similarity: " + sourceStddevSimPercent);
            retVal.add("  Average class similarity: " + avgSimPercent);
            retVal.add("  Std.Dev class similarity: " + stddevSimPercent);
            retVal.add("  Average longest common substring: " + longestSubstringAvgPercent);
            retVal.add("  Std.Dev longest common substring: " + longestsubstringStddevPercent);
            retVal.add("  Average longest common subsequence: " + longestSubsequenceAvgPercent);
            retVal.add("  Std.Dev longest common subsequence: " + longestSubsequenceStddevPercent);
            retVal.add("  Average edit distance: " + editDistanceAvgPercent);
            retVal.add("  Std.Dev edit distance: " + editDistanceStddevPercent);
            retVal.add("  Average composite score: " + compositeAvg);
            retVal.add("  Std.Dev composite score: " + compositeStddev);
            retVal.add("  Average points earned: " + avescore);
            retVal.add("Similar source file submissions are:");
            for (count = sourceComparisons.size() - 1; count >= 0; count--)
                if (!report(retVal, sourceComparisons.get(count).toString(), sourceAvgSimPercent, sourceStddevSimPercent, 3.5))
                    break;
            retVal.add("Similar class file submissions are:");
            for (count = comparisons.size() - 1; count >= 0; count--)
                if (!report(retVal, comparisons.get(count).toString(), avgSimPercent, stddevSimPercent, 3.5))
                    break;
            retVal.add("Similar common substrings are:");
            for (count = longestSubstrings.size() - 1; count >= 0; count--)
                if (!report(retVal, longestSubstrings.get(count).toString(), longestSubstringAvgPercent, longestsubstringStddevPercent, 3.5))
                    break;
            retVal.add("Similar common subsequences are:");
            for (count = longestSubsequences.size() - 1; count >= 0; count--)
                if (!report(retVal, longestSubsequences.get(count).toString(), longestSubsequenceAvgPercent, longestSubsequenceStddevPercent, 3.5))
                    break;
            retVal.add("Short minimum edit distances are:");
            for (count = 0; count < editDistances.size(); count++)
                if (!report(retVal, editDistances.get(count).toString(), editDistanceAvgPercent, editDistanceStddevPercent, -3.5))
                    break;
            retVal.add("Overall suspicion list:");
            for (count = composite.size() - 1; count >= 0; count--)
                if (!report(retVal, composite.get(count).toString(), compositeAvg, compositeStddev, 5.0))
                    break;
            retVal.add("The 5 fastest submissions earned:");

            //get the top scores for the problem
            for (count = 0; count < subInfo.size() && count < 5; count++) {
                tempProb = (Problem) subInfo.get(count);
                retVal.add("  " + tempProb.getSubmitPoints() + " for " + tempProb.getHandle() + "(" + tempProb.getCoderId() + ") on " + className + "(" + componentId + ") ");
            }
            retVal.add("---------------------------------------------------------------------------------");

            //some other info
            retVal.add("Other possibly suspicious info:");
            retVal.addAll(copyrights);
            retVal.addAll(cpsalert);

        } catch (SQLException sqlex) {
            DBMS.printSqlException(true, sqlex);
        } catch (Exception ignore) {
            ignore.printStackTrace();
            retVal.add(ignore.toString());
        } finally {
            comparisons = null;
            sourceComparisons = null;
            longestSubstrings = null;
            longestSubsequences = null;
            editDistances = null;
            composite = null;
            simPercentStore = null;
            sourceSimpercentStore = null;
            longestSubstringStore = null;
            longestSubsequenceStore = null;
            editDistanceStore = null;
            compositeStore = null;
            competitorIds = null;
            charPerSecondScores = null;
            competitorHandles = null;
            fileStrings = null;
            sourceStrings = null;
            //compositescores = null;
            jTok = null;
            System.gc();
            closeConnections();
        }

        return retVal;

    }


    /**
     *
     * @param retVal
     * @param s
     * @param ave
     * @param stddev
     * @param threshhold
     * @return
     */
    boolean report(ArrayList retVal, String s, double ave,
                   double stddev, double threshhold) {
        double val = 0.0;
        try {
            val = Double.parseDouble(s.substring(0, s.indexOf(' ')));
        } catch (NumberFormatException e) {
            log.error("s.substring(0, s.indexOf(' ')): " + s.substring(0, s.indexOf(' ')));
            e.printStackTrace();
        }
        val -= ave;
        val /= stddev;
        if (val / threshhold >= 1) {
            String q = String.valueOf(val);
            q = rpad(q, '0', 9);
            q = q.substring(0, 9);
            retVal.add("  " + q + ": " + s);
            return true;
        }
        return false;
    }

    /**
     *
     * @param x
     * @return
     */
    double sqr(double x) {
        return x * x;
    }

    /**
     *
     * @param x
     * @return
     */
    double curve(double x) {
        return Math.sqrt(x * x + 1) - 1;
    }

    /**
     * Pad a String on the left.
     * @param s the String to pad
     * @param c the character to pad the String with
     * @param len the intended length of the return String.
     * @return the String after having been padded
     */
    private String rpad(String s, char c, int len) {
        StringBuffer buf = new StringBuffer(len);
        buf.append(s);
        while (buf.length() < len) {
            buf.append(c);
        }
        return buf.toString();
    }


}
