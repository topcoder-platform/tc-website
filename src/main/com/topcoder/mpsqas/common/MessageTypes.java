package com.topcoder.mpsqas.common; 

/**
 * MessageTypes
 *
 * This class is a list of static variables used by messages
 * going back and forth between the mpsqas server and applet 
 * and other constant data used by both the applet and server.
 *
 * @author mitalub
 */
public class MessageTypes
{
  /**Applet to Server requests*/
  public static final int LOGIN_RQ=0,
                          CHAT_RQ=1,
                          PROPOSAL_RQ=2,
                          MOVE_RQ=3,
                          PENDING_REPLY_RQ=4,
                          SEND_CORRESPONDENCE_RQ=5,
                          SUBMIT_PROBLEM_RQ=6,
                          COMPILE_RQ=7,
                          TEST_RQ=8,
                          SCHEDULE_PROBLEMS_RQ=9,
                          COMPARE_SOLUTIONS_RQ=10,
                          SUBMIT_PROBLEM_STATEMENT_RQ=11,
                          SUBMIT_APPLICATION_RQ=12,
                          VIEW_APPLICATION_RQ=13,
                          APPLICATION_REPLY_RQ=14,
                          ADMIN_SAVE_PROBLEM_RQ=15,
                          CONTEST_VERIFY_RQ=16,
                          CHAT_HISTORY_RQ=17,
                          SUBMIT_PAYMENT_RQ=18,
                          PING_RQ = 19,
                          RELATIVE_MOVE_RQ = 20; //back or forward

  /**Server to applet responses*/
  public static final int LOGIN_RS=100,
                          MOVE_RS=101,
                          CHAT_RS=102,
                          NEW_USER_LIST_RS=103,
                          NEW_CORRESPONDENCE_RS=104,
                          NEW_PENDING_PROPOSAL_RS=105,
                          NEW_PENDING_SUBMISSION_RS=106,
                          NEW_ROUND_SCHEDULE_RS=107,
                          PROBLEM_MODIFIED_RS=108,
                          APPLICATION_REPLY_RS=109,
                          NEW_PENDING_APPLICATION_RS=110,
                          UPDATE_STATUS_RS=111,
                          RETURN_RESULTS_RS=112,
                          PING_RS = 113;

  /**Rooms*/
  public static final int LOGIN_ROOM=0,
                          FOYER_ROOM=1,
                          PROPOSAL_ROOM=2,
                          MOVING_ROOM=3,
                          PENDING_APPROVAL_ROOM=4,
                          MAIN_PROBLEM_ROOM=5,
                          VIEW_PROBLEM_ROOM=6,
                          UPCOMING_CONTESTS_ROOM=7,
                          VIEW_CONTEST_ROOM=8,
                          APPLICATION_ROOM=9,
                          MAIN_APPLICATION_ROOM=10,
                          VIEW_APPLICATION_ROOM=11,
                          MAIN_USER_ROOM=12,
                          VIEW_USER_ROOM=13;

  /**Difficulty level ids*/
  public static final int EASY=1;
  public static final int MEDIUM=2;
  public static final int HARD=3;
  public static final int[] DIFFICULTY_IDS = {1, 2, 3};
  public static final String[] DIFFICULTY_NAMES = 
         {"Easy", "Medium", "Hard"};

  /**Division ids*/
  public static final int DIVISION_ONE = 1;
  public static final int DIVISION_TWO = 2;
  public static final int[] DIVISION_IDS = {1, 2};
  public static final String[] DIVISION_NAMES = {"Division 1", "Division 2"};

  /**status ids*/
  public static final int PROPOSAL_PENDING_APPROVAL=10;
  public static final int PROPOSAL_REJECTED=20;
  public static final int PROPOSAL_APPROVED=30;
  public static final int SUBMISSION_PENDING_APPROVAL=40;
  public static final int SUBMISSION_REJECTED=50;
  public static final int SUBMISSION_APPROVED=60;
  public static final int TESTING=70;
  public static final int FINAL_TESTING=75;
  public static final int READY=80;
  public static final int USED=90;
  public static int[] STATUS_IDS={10,20,30,40,50,60,70,75,80,90};
  public static String[] STATUS_NAMES={"Proposal Pending",
                                       "Proposal Rejected",
                                       "Proposal Approved",
                                       "Submission Pending",
                                       "Submission Rejected",
                                       "Submission Approved",
                                       "Testing",
                                       "Final Testing",
                                       "Ready",
                                       "Used"};

  /**Panels to be displayed in ViewProblemRoom*/
  public static final int PROBLEM_STATEMENT_PANEL=1,
                          SOLUTION_PANEL=2,
                          TEST_CASES_PANEL=3,
                          CORRESPONDENCE_PANEL=5,
                          APPROVAL_PANEL=6,
                          ALL_SOLUTION_PANEL=7,
                          ADMIN_PROBLEM_PANEL=8,
                          CHAT_PANEL=9;

  /**Test how many*/
  public static final int TEST_ONE=1;
  public static final int TEST_ALL=2;

  /**Load problems types*/
  public static final int ALL_PROBLEMS=1;

  /**ApplicationTypes*/
  public static final int TESTER_APPLICATION=0;
  public static final int WRITER_APPLICATION=1;

  /**
   * Returns the difficulty level name associated with the specified
   * difficulty id.
   * 
   * @param difficultyId The difficulty level id.
   */
  public static HiddenValue getDifficultyName(int difficultyId)
  {
    for(int i=0; i<DIFFICULTY_IDS.length; i++)
    {
      if (DIFFICULTY_IDS[i] == difficultyId)
      {
        return new HiddenValue(DIFFICULTY_NAMES[i], difficultyId);
      }
    }
    return new HiddenValue("Unknown", difficultyId);
  }

  /**
   * Returns the status level name associated with the specified
   * status id.
   *
   * @param statusId The status level id.
   */
  public static HiddenValue getStatusName(int statusId)
  {
    for(int i=0; i<STATUS_IDS.length; i++)
    {
      if (STATUS_IDS[i] == statusId)
      {
        return new HiddenValue(STATUS_NAMES[i], statusId);
      }
    }
    System.out.println("Unknown status id = " + statusId);
    return new HiddenValue("Unknown", statusId);
  }

  /**
   * Returns the status level name associated with the specified
   * status id.
   *
   * @param statusId The status level id.
   */
  public static HiddenValue getDivisionName(int divId)
  {
    for(int i=0; i<DIVISION_IDS.length; i++)
    {
      if (DIVISION_IDS[i] == divId)
      {
        return new HiddenValue(DIVISION_NAMES[i], divId);
      }
    }
    return new HiddenValue("Unknown", divId);
  }
}
