package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * Generates all the affidavits and payments for the people who won
 * money in the given contest round.  Displays the number of
 * affidavit/payment pairs generated. <p>
 *
 * Usage: java GenerateRoundPayments &lt;round ID&gt; &lt;apply changes&gt; <br>
 * - round ID is the ID number of the round for which to generate payments
 * - apply changes should be TRUE to modify the database.  Otherwise, the
 * database is not modified and the changes that would have been applied are
 * logged.
 *
 * @author Dave Pecora
 * @version 1.00, 04/07/2002
 * @see DataInterfaceBean
 */

public class GenerateRoundPayments {
    private void generatePayments(long roundId, boolean makeChanges) {
        try {
            DataInterfaceBean d = new DataInterfaceBean();
            int pairsInserted = d.generateRoundPayments(roundId, makeChanges);
            if (pairsInserted > 0) {
                System.out.println("GenerateRoundPayments: " + pairsInserted + " affidavit/payment pairs");
                if (!makeChanges) {
                    System.out.print("would have been ");
                }
                System.out.println("inserted successfully.");
            } else {
                System.out.println("GenerateRoundPayments: Nobody is owed money for the given round.");
            }
        } catch (Exception e) {
            System.out.print("GenerateRoundPayments: Program execution unsuccessful");
            if (makeChanges)
                System.out.print("; database not updated");
            System.out.println(".  Cause:");
            System.out.println(e.getMessage());
        }
    }

    public static void main(String args[]) {
        if (args.length != 2) {
            System.out.println("Usage: GenerateRoundPayments <round ID> <apply changes>\n" +
                    "- round ID is the ID of the round for which to generate payments\n" +
                    "- apply changes should be TRUE to modify the database.  Otherwise,\n" +
                    "the database is not modified and the changes that would have been\n" +
                    "applied are logged.");
            return;
        }

        long roundId = 0;
        try {
            roundId = Long.parseLong(args[0]);
            if (args[0].length() > 10 || roundId < 0) {
                throw new Exception();
            }
        } catch (Exception e) {
            System.out.println("GenerateRoundPayments: Invalid round ID " + args[0]);
            return;
        }

        boolean makeChanges = false;
        if (args[1].equals("TRUE")) {
            makeChanges = true;
        }

        GenerateRoundPayments grp = new GenerateRoundPayments();
        grp.generatePayments(roundId, makeChanges);
    }
}

