package com.topcoder.web.common.voting;

import com.topcoder.shared.util.logging.Logger;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.HashSet;
import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Sep 2, 2005
 */
public class Matrix implements Serializable {

    private static final Logger log = Logger.getLogger(Matrix.class);
    private Candidate[] candidates = null;
    private Map candidateIndex = null;
    private int[][] matrix = null;

    /**
     * create a matrix using the given <code>candidates</code>
     * and <code>matrix</code> of voting information.
     *
     * @param candidates
     * @param matrix
     */
    public Matrix(Candidate[] candidates, int[][] matrix) {
        this.candidates = candidates;
        this.matrix = matrix;
        candidateIndex = new HashMap();
        for (int i = 0; i < candidates.length; i++) {
            candidateIndex.put(candidates[i], new Integer(i));
        }
    }

    /**
     * create a matrix using the given <code>ballot</code>
     *
     * @param ballot
     */
    public Matrix(RankBallot ballot) {
        candidateIndex = new HashMap();
        candidates = ballot.getCandidates();
        for (int i = 0; i < candidates.length; i++) {
            candidateIndex.put(candidates[i], new Integer(i));
        }

        matrix = new int[candidates.length][candidates.length];
        for (int i = 0; i < matrix.length; i++) {
            Arrays.fill(matrix[i], 0);
        }
        for (int i = 0; i < matrix.length; i++) {
            //you can't beat yourself
            matrix[i][i] = -1;
        }

        Vote[] votes = ballot.getVotes();

        //build up an index of all the candidates that where actually
        //included in the votes contained in this ballot.  we'll need
        //that info make the assumption those not included are preferred less
        //than those that did
        HashSet voteIndex = new HashSet();
        for (int i = 0; i < votes.length; i++) {
            voteIndex.add(votes[i].getCandidate());
        }
        log.debug(voteIndex.toString());

        for (int i = 0; i < votes.length; i++) {
            for (int j = 0; j < votes.length; j++) {
                if (i != j) {
                    //mark that i beat j if i was preferred to j
                    if (votes[i].compareTo(votes[j]) > 0) {
                        matrix[getIndex(votes[i].getCandidate())][getIndex(votes[j].getCandidate())] = 1;
                    }
                }
            }
            //mark that i beat j either if j wasn't present in the ballot
            for (int j = 0; j < candidates.length; j++) {
                if (!voteIndex.contains(candidates[j])) {
                    matrix[getIndex(votes[i].getCandidate())][getIndex(candidates[j])] = 1;
                }
            }
        }
        log.debug(this.toString());
    }


    /**
     * helper method to give a given candidates index in the matrix.
     *
     * @param c
     * @return int
     */
    public int getIndex(Candidate c) {
        return ((Integer) candidateIndex.get(c)).intValue();
    }

    /**
     * add two matrixes together
     *
     * @param m1
     * @param m2
     * @return Matrix
     */
    public static Matrix add(Matrix m1, Matrix m2) {
        int size = m1.candidates.length;
        if (size != m2.candidates.length) {
            throw new IllegalArgumentException("m1 and m2 must be the same size, they were " +
                    m1.candidates.length + " and " + m2.candidates.length + " respectively");
        }
        for (int i = 0; i < size; i++) {
            if (!m1.candidates[i].equals(m2.candidates[i])) {
                throw new IllegalArgumentException("m1 and m2 must have the same candidates");
            }
        }
        int[][] matrix = new int[size][size];
        for (int i = 0; i < size; i++) {
            matrix[i][i] = -1;
        }
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (i != j) {
                    matrix[i][j] = m1.matrix[i][j] + m2.matrix[i][j];
                }
            }
        }
        return new Matrix(m1.candidates, matrix);

    }

    /**
     * custom implementation to print things out nicely.
     *
     * @return STring
     */
    public String toString() {
        StringBuffer buf = new StringBuffer(matrix.length * 3);
        for (int i = 0; i < matrix.length; i++) {
            buf.append(candidates[i].getName()).append(",");
        }
        buf.append("\n");
        for (int i = 0; i < matrix.length; i++) {
            buf.append(candidates[i].getName()).append(" ");
            for (int j = 0; j < matrix[i].length; j++) {
                buf.append(matrix[i][j]).append(" ");
            }
            buf.append("\n");
        }
        return buf.toString();
    }

    /**
     * @param a
     * @param b
     * @return true if <code>a</code> beat <code>b</code>, false otherwise
     */
    public boolean beat(Candidate a, Candidate b) {
        return beat(getIndex(a), getIndex(b));
    }

    /**
     * @param a
     * @param b
     * @return true if the candidate at index <code>a</code> beat
     *         the candidate at indx <code>b</code>, false otherwise
     */
    public boolean beat(int a, int b) {
        return matrix[a][b] > matrix[b][a];
    }

    /**
     * @param a
     * @param b
     * @return true of <code>a</code> tied <code>b</code>, false otherwise
     */
    public boolean tie(Candidate a, Candidate b) {
        return beat(getIndex(a), getIndex(b));
    }

    /**
     * @param a
     * @param b
     * @return true of the candidate at index <code>a</code>
     *         tied the candidate at index <code>b</code>, false otherwise
     */
    public boolean tie(int a, int b) {
        return matrix[a][b] == matrix[b][a];
    }


    /**
     * two matrices are equal if all the vote counts match up.
     * and the candidates are the same
     *
     * @param o
     * @return boolean
     */
    public boolean equals(Object o) {
        try {
            Matrix other = (Matrix) o;
            if (matrix.length != other.matrix.length) {
                return false;
            }
            for (int i = 0; i < matrix.length; i++) {
                if (!this.candidates[i].equals(other.candidates[i])) {
                    return false;
                }
            }
            for (int i = 0; i < matrix.length; i++) {
                for (int j = 0; j < matrix[i].length; j++) {
                    if (matrix[i][j] != other.matrix[i][j]) {
                        return false;
                    }
                }
            }
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }

    /**
     * Return the candidates in this matrix.  This is safe because
     * candidates are immutable.
     *
     * @return Candidate[]
     */
    public Candidate[] getCandidates() {
        return candidates;
    }

    /**
     * @param a
     * @param b
     * @return the number of votes ranking <code>a</code> above <code>b</code>
     */
    public int getValue(Candidate a, Candidate b) {
        return getValue(getIndex(a), getIndex(b));
    }

    /**
     * @param a
     * @param b
     * @return the the number of votes ranking the candidate with index
     *         <code>a</code> above the candidate with index <code>b</code>
     */
    public int getValue(int a, int b) {
        return matrix[a][b];
    }

}
