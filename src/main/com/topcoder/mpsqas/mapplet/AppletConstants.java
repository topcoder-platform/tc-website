package com.topcoder.mpsqas.mapplet;

import com.topcoder.mpsqas.common.HiddenValue;

import java.awt.*;
import java.util.ArrayList;

/**
 * AppletConstants
 *
 * A set of constants used by the applet.
 *
 * @author mitalub
 */
public class AppletConstants {
    /**Fonts*/
    public static Font HEADER_FONT = new Font("SansSerif", Font.BOLD, 20),
    NORMAL_FONT = new Font("SansSerif", Font.PLAIN, 12),
    FIXED_WIDTH_FONT = new Font("MonoSpaced", Font.PLAIN, 11),
    BOLD_FONT = new Font("SansSerif", Font.BOLD, 12);
    public static String HTML_FONT_STRING = "SansSerif";
    public static int HTML_FONT_SIZE = 2;

    /**How long the applet will wait for a response*/
    public static final long TIME_OUT_MILLIS = 8000l;

    /**list of characters to try when looking for a delimiter, first char
     * tried first */
    public static final String DELIM_CHARS = " ,.|;:-_+=/<>~[]{}?*!@#$%^&()abcdefghi" +
            "jklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

    /**About box text*/
    public static final String ABOUT = "MPSQAS Applet\nMember Problem Submission " +
            "and Quality Assurance System\n\nVersion 1.2";

    /**URL of mpsqas help*/
    public static final String HELP_CONTENTS_URL =
            "http://www.topcoder.com/contest/mpsqas/mpsqashelp.html";

    /**Help when testing an array*/
    public static String ARRAY_HELP = "To enter an array, enter a delimited String " +
            "where the fi rst character is the delimiter.\n" +
            "For example \",HI,HOW,ARE,YOU\" corresponds to the array " +
            "{\"HI\", \"HOW\", \"ARE\", \"YOU\"}.";

    /**change log text*/
    public static String CHANGE_LOG =
            "MPSQAS Applet currently Version 1.2\n" +
            "\n" +
            "02/06/2002 - Version 1.2: *Support for new multi-division contest structure.\n" +
            "                          *Support char and Character parameters.\n" +
            "                          *Fixed flickering chat bug.\n" +
            "                          *Improved status box to bold important messages\n" +
            "                            and double click moves status box instead of copying it.\n" +
            "                          *Changed fonts to use only Java guaranteed fonts.\n" +
            "\n" +
            "12/31/2001 - Version 1.1: *Sortable tables\n" +
            "                          *Change log\n" +
            "                          *Chat history\n" +
            "                          *Automatically change problem status\n" +
            "                            to USED after contests\n" +
            "                          *View payment & user information (admins only)\n" +
            "                          *Fixed timing out of connection after \n" +
            "                            long idleness (hopefully).\n" +
            "                          *Status message area, fewer pop ups.\n" +
            "                            (double click area to get pop up)\n" +
            "                          *Back / Reload / Forward button\n" +
            "                          *Chat with problems, too.\n" +
            "                          *Problem statement and solution history.\n" +
            "                          *Save problem statements without resubmit.";

    /**table columns information*/
    public static String[] UNREAD_CORRESPONDENCE_COLS = {"Class"};

    public static String[] MAIN_WRITING_PROBLEM_COLS = {"Time", "Name",
                                                        "Method", "Division", "Difficulty", "Status"};

    public static int[] MAIN_WRITING_PROBLEM_COLS_WIDTHS = {1000, 1000, 1000, 600, 600, 1000};

    public static String[] MAIN_TESTING_PROBLEM_COLS = {"Written By", "Time", "Class",
                                                        "Method", "Division", "Difficulty", "Status"};

    public static int[] MAIN_TESTING_PROBLEM_COLS_WIDTHS = {600, 1000, 1000, 1000, 600, 600, 1000};

    public static String[] MAIN_CONTEST_COLS = {"Name", "Time", "Role"};

    public static int[] MAIN_CONTEST_COLS_WIDTHS = {600, 200, 140};

    public static String[] MAIN_APPLICATION_COLS = {"Handle", "Type", "Rating", "Events"};

    public static int[] MAIN_APPLICATION_COLS_WIDTHS = {500, 500, 300, 100};

    public static String[] PENDING_APPROVAL_COLS = {"Writer", "Time", "Class",
                                                    "Method", "Division", "Difficulty"};

    public static int[] PENDING_APPROVAL_COLS_WIDTHS = {300, 500, 500, 500, 300, 300};

    public static String[] TESTER_INFO_COLS = {"Handle"};

    public static int[] TESTER_INFO_COLS_WIDTHS = {100};

    public static String[] ALL_SOLUTIONS_COLS = {"Coder", "Primary"};

    public static int[] ALL_SOLUTIONS_COLS_WIDTHS = {200, 120};

    public static String[] AVAILABLE_PROBLEMS_COLS = {"Class", "Writer", "Division", "Difficulty"};

    public static int[] AVAILABLE_PROBLEMS_COLS_WIDTHS = {200, 200, 200, 200};

    public static String[] SCHEDULED_PROB_COLS =
            {"Class", "Writer", "Division", "Difficulty", "Points"};

    public static int[] SCHEDULED_PROB_COLS_WIDTHS = {200, 200, 200, 200, 200};

    public static boolean[] SCHEDULED_PROB_COLS_EDIT = {false, false, true, true, true};

    public static String[] CORRESPONDENCE_COLS = {"Time", "From"};

    public static int[] CORRESPONDENCE_COLS_WIDTHS = {200, 200};

    public static String[] USER_LIST_COLS = {"Active Users"};

    public static int[] USER_LIST_COLS_WIDTHS = {200};

    public static String[] MAIN_USER_COLS = {"Handle", "Name", "Paid", "Pending", "Pay"};

    public static int[] MAIN_USER_COLS_WIDTHS = {100, 100, 70, 70, 50};

    public static boolean[] MAIN_USER_COLS_EDIT = {false, false, false, false, true};

    public static String[] VIEW_USER_WRITING_COLS = {"Time", "Class", "Division", "Difficulty",
                                                     "Status", "Paid", "Pending"};

    public static int[] VIEW_USER_WRITING_COLS_WIDTHS = {300, 300, 300, 300, 300, 150, 150};

    public static String[] VIEW_USER_TESTING_COLS = {"Time", "Writer", "Class", "Division", "Difficulty",
                                                     "Status", "Paid", "Pending"};

    public static int[] VIEW_USER_TESTING_COLS_WIDTHS = {300, 300, 300, 300, 300, 300, 150, 150};

    /**menu structure*/
    public static String[] MENU_STRINGS = {"Main", "Problems", "Calendar", "Applications",
                                           "Admin", "Help"};

    /**menu structure*/
    public static String[][][] MENU_ITEMS =
            {{{"Foyer", "loadFoyer"},
              {"Exit", "exit"}},

             {{"Propose Problem", "loadProposalRoom"},
              {"Main Problem Room", "loadMainProblemRoom"}},

             {{"Upcoming Contests", "loadUpcomingContestsRoom"}},

             {{"Problem Writer Application", "loadWriterApplication"},
              {"Problem Tester Application", "loadTesterApplication"}},

             {{"Pending Problems", "loadPendingApproval"},
              {"Pending Applications", "loadPendingApplication"},
              {"All Problems", "loadAllProblems"},
              {"Users", "loadUsers"}},

             {{"Contents", "loadHelp"},
              {"Change Log", "loadChangeLog"},
              {"About", "about"}}};

    /**only admins get menu at this index*/
    public static int ADMIN_MENU_INDEX = 4;

    /**number of characters in a chat area or status area before beginning messages
     are removed */
    public static int MAX_STRING_LENGTH = 1500;

    /**
     * buildConstraints assigns a set of constraints to a GridBagConstraints object.
     *
     * @param gbc   The GridBagConstraints
     * @param gx    Value to assign to gridx
     * @param gy    Value to assign to gridy
     * @param gw    Value to assign to gridwidth
     * @param gh    Value to assign to gridheight
     * @param wx    Value to assign to weightx
     * @param wy    Value to assign to weighty
     */
    public static void buildConstraints(GridBagConstraints gbc, int gx, int gy, int gw,
                                        int gh, int wx, int wy) {
        gbc.gridx = gx;
        gbc.gridy = gy;
        gbc.gridwidth = gw;
        gbc.gridheight = gh;
        gbc.weightx = wx;
        gbc.weighty = wy;
    }

    /**
     * castArgs convers an ArrayList of String arguments to an Object[] containing Objects
     * that are of the type specified in paramTypes.  If this is not possible, an exception .
     * is thrown.
     *
     * @param paramTypes  String representations of what the arguements should be.
     * @param uncastedArgs An ArrayList of String representation of the argument values.
     */
    public static Object[] castArgs(ArrayList paramTypes, ArrayList uncastedArgs) {
        Object[] args = null;
        int i = 0;
        try {
            args = new Object[paramTypes.size()];
            String current;
            String type;
            for (i = 0; i < paramTypes.size(); i++) {
                current = (String) uncastedArgs.get(i);
                type = (String) paramTypes.get(i);

                if (type.equals("int") || type.equals("Integer"))
                    args[i] = new Integer(current);
                else if (type.equals("double") || type.equals("Double"))
                    args[i] = new Double(current);
                else if (type.equals("long") || type.equals("Long"))
                    args[i] = new Long(current);
                else if (type.equals("char") || type.equals("Character")) {
                    if (current.length() != 1) {
                        throw new IllegalArgumentException();
                    }
                    args[i] = new Character(current.charAt(0));
                } else if (type.equals("String"))
                    args[i] = current;
                else if (type.equals("int[]") || type.equals("double[]") || type.equals("String[]")) {
                    ArrayList tokens = new ArrayList();
                    char token = current.charAt(0);
                    int lastindex = 0,currindex = 0;
                    if (current.length() != 1) {
                        while (currindex < current.length()) {
                            currindex = current.indexOf(token, lastindex + 1);
                            if (currindex == -1) currindex = current.length();
                            tokens.add(current.substring(lastindex + 1, currindex));
                            lastindex = currindex;
                        }
                    }
                    if (type.equals("int[]")) {
                        int[] array = new int[tokens.size()];
                        for (currindex = 0; currindex < array.length; currindex++)
                            array[currindex] = Integer.parseInt((String) tokens.get(currindex));
                        args[i] = array;
                    }
                    if (type.equals("double[]")) {
                        double[] array = new double[tokens.size()];
                        for (currindex = 0; currindex < array.length; currindex++)
                            array[currindex] = Double.parseDouble((String) tokens.get(currindex));
                        args[i] = array;
                    }
                    if (type.equals("String[]")) {
                        String[] array = new String[tokens.size()];
                        for (currindex = 0; currindex < array.length; currindex++)
                            array[currindex] = (String) tokens.get(currindex);
                        args[i] = array;
                    }
                } else
                    throw new IllegalArgumentException("Tester does not support " + type + ".  Please contact us.");
            }
        } catch (Exception e) {
//      e.printStackTrace();
            throw new IllegalArgumentException("Argument " + (i + 1) + " must be a " + paramTypes.get(i).toString());
        }
        return args;
    }

    /**
     * castArgs converts an Object[] of arguments to an ArrayList of String representations of the Objects
     *
     * @param paramTypes  String representations of what the arguements should be.
     * @param castedArgs  An Object[] of args
     */
    public static ArrayList uncastArgs(ArrayList paramTypes, Object[] castedArgs) {
        ArrayList args = new ArrayList(paramTypes.size());
        String type;
        int i,j,k;
        for (i = 0; i < paramTypes.size(); i++) {
            type = (String) paramTypes.get(i);

            String stringRep = "";
            if (type.equals("int[]")) {
                int[] array = (int[]) castedArgs[i];
                if (array.length == 0) stringRep += " ";
                for (j = 0; j < array.length; j++)
                    stringRep += " " + array[j];
                args.add(stringRep);
            } else if (type.equals("double[]")) {
                double[] array = (double[]) castedArgs[i];
                if (array.length == 0) stringRep += " ";
                for (j = 0; j < array.length; j++)
                    stringRep += " " + array[j];
                args.add(stringRep);
            } else if (type.equals("String[]")) {
                String[] array = (String[]) castedArgs[i];
                if (array.length == 0) stringRep += " ";
                boolean goodDelim = false;
                String delim = null;
                for (j = 0; j < DELIM_CHARS.length() && !goodDelim; j++) {
                    delim = DELIM_CHARS.charAt(j) + "";
                    goodDelim = true;
                    for (k = 0; k < array.length; k++)
                        if (array[k].indexOf(delim) != -1) goodDelim = false;
                }
                if (!goodDelim)
                    delim = "<cant_find_delimiter>";
                for (j = 0; j < array.length; j++)
                    stringRep += delim + array[j];
                args.add(stringRep);
            } else
                args.add(castedArgs[i].toString());
        }
        return args;
    }

    /**
     * Compares two table objects for sorting.
     */
    public static int compareForColumnSort(Object o1, Object o2) {
        int result = 0;
        if (o1 instanceof HiddenValue && o2 instanceof HiddenValue) {
            HiddenValue h1 = (HiddenValue) o1;
            HiddenValue h2 = (HiddenValue) o2;
            if (h1.getValue() < h2.getValue()) {
                result = -1;
            }
            if (h1.getValue() > h2.getValue()) {
                result = 1;
            }
        } else if (o1 instanceof Double && o2 instanceof Double) {
            double d1 = ((Double) o1).doubleValue();
            double d2 = ((Double) o2).doubleValue();
            if (d1 < d2) {
                result = -1;
            }
            if (d2 < d1) {
                result = 1;
            }
        } else if (o1 instanceof Integer && o2 instanceof Integer) {
            int i1 = ((Integer) o1).intValue();
            int i2 = ((Integer) o2).intValue();
            if (i1 < i2) {
                result = -1;
            }
            if (i2 < i1) {
                result = 1;
            }
        } else {
            String s1 = (o1.toString()).toLowerCase();
            String s2 = (o2.toString()).toLowerCase();
            result = s1.compareTo(s2);
        }
        return result;
    }
}
