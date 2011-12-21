/**
 * Copyright (c) 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.math.matrix.LineItem;
import com.topcoder.math.matrix.MathMatrix;
import com.topcoder.math.matrix.Section;

import java.util.HashMap;

/**
 * Helper class for calculating the scores for scorecards.
 *
 * @author adic
 * @version 1.0
 */
public class ScoringHelper {

    /**
     * Epsilon for double calculations.
     */
    private static final double EPS = 1e-10;

    /**
     * The maximum scores for a subjective evaluation.
     */
    private static final int MAX_SUBJECTIVE_SCORE = 4;

    /**
     * Populates a MathMatrix for a given abstract scorecard.
     *
     * @param abstractScorecard the scorecard to compute the score for
     *
     * @return the populated MathMatrix for the given scorecard
     */
    public MathMatrix calculateScore(AbstractScorecard abstractScorecard) {
        // because we relax the condition that the sum of all weights has to be 1.0, we need to calculate the sum of
        // weights for each sections and for the entire scorecard, so that we can apply a normalization afterwards
        HashMap sectionSums = new HashMap(); // maps sections to weight sums per section (Doubles)
        ScorecardQuestion[] questions = abstractScorecard.getQuestions();
        double totalSum = 0.0; // the total sum of weights of the sections
        for (int i = 0; i < questions.length; i++) {
            if (questions[i] instanceof SubjectiveScorecardQuestion || questions[i] instanceof TestCaseScorecardQuestion) {
                ScorecardSection scorecardSection = questions[i].getScorecardSection();
                Double sum = (Double) sectionSums.get(scorecardSection);
                if (sum == null) {
                    sum = new Double(0);
                    totalSum += scorecardSection.getWeight();
                }
                sectionSums.put(scorecardSection, new Double(sum.doubleValue() + questions[i].getWeight()));
            }
        }

        if (totalSum < EPS) {
            throw new ArithmeticException("Invalid scorecard, sum of section weights is 0");
        }

        // create the math matrix and populate it
        MathMatrix mathMatrix = new MathMatrix("scorecard");
        HashMap sections = new HashMap(); // maps scorecard sections to math matrix sections
        for (int i = 0; i < questions.length; i++) {
            if ((questions[i] instanceof SubjectiveScorecardQuestion
                    || questions[i] instanceof TestCaseScorecardQuestion)
                    && 0 < questions[i].getScorecardSection().getWeight()) {

                // get the math matrix section for the scorecard section or create a new one
                ScorecardSection scorecardSection = questions[i].getScorecardSection();
                Section section = (Section) sections.get(scorecardSection);
                if (section == null) {
                    //LogHelper.log("scorecard section weight = " + scorecardSection.getWeight());
                    //LogHelper.log("total sum = " + totalSum);
                    section = new Section(scorecardSection.getName(), scorecardSection.getWeight() / totalSum);
                    sections.put(scorecardSection, section);
                    mathMatrix.addItem(section);
                }

                // get the score and the maximum score
                double score, max;
                if (questions[i] instanceof SubjectiveScorecardQuestion) {
                    score = questions[i].getEvaluation().getValue();
                    max = MAX_SUBJECTIVE_SCORE;
                } else {
                    score = ((TestCaseScorecardQuestion) questions[i]).getTotalPass();
                    max = ((TestCaseScorecardQuestion) questions[i]).getTotalTests();
                }

                // add a new line item for the curent question
                double sumWeights = ((Double) sectionSums.get(scorecardSection)).doubleValue();
                if (sumWeights < EPS) {
                    throw new ArithmeticException("Invalid scorecard, sum of question weights in section '"
                            + scorecardSection.getName() + "' is 0");
                }
                section.addItem(new LineItem(
                        questions[i].getQuestionText(), questions[i].getWeight() / sumWeights, max, score));
            }
        }
        return mathMatrix;
    }

    /**
     * Calculates the scores for an array of scorecards and returns the average score.
     *
     * @param abstractScorecards the array of scorecards
     *
     * @return the average score for the scorecards
     */
    public double calculateScore(AbstractScorecard[] abstractScorecards) {
        if (abstractScorecards.length == 0) {
            return 0;
        }
        double sum = 0;
        for (int i = 0; i < abstractScorecards.length; i++) {
            MathMatrix mathMatrix = calculateScore(abstractScorecards[i]);
            sum += mathMatrix.getWeightedScore();
        }
        return sum / abstractScorecards.length;
    }

}

