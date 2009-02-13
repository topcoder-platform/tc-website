package com.topcoder.web.common.voting;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Sep 2, 2005
 */
public class Matrix {

    private Candidate[] candidates = null;
    private Map candidateIndex = null;
    private int[][] matrix = null;

    /**
     * create a matrix using the given <code>candidates</code>
     * and <code>matrix</code> of voting information.
     * @param candidates
     * @param matrix
     */
    private Matrix(Candidate[] candidates, int[][] matrix) {
        this.candidates = new Candidate[candidates.length];
        System.arraycopy(candidates, 0, this.candidates, 0, candidates.length);
        this.matrix = matrix;
    }

    /**
     * create a matrix using the given <code>balot</code>
     * @param balot
     */
    public Matrix(RankBalot balot) {
        ArrayList a = new ArrayList();
        int idx = 0;
        candidateIndex = new HashMap();
        Object candidate = null;
        List candidateList = balot.getCandidates();
        for (int i=0; i<candidateList.size(); i++) {
            candidate = candidateList.get(i);
            a.add(candidate);
            candidateIndex.put(candidate, new Integer(idx));
            idx++;
        }
        candidates = (Candidate[]) a.toArray(new Candidate[a.size()]);

        matrix = new int[candidates.length][candidates.length];
        for (int i = 0; i < matrix.length; i++) {
            Arrays.fill(matrix[i], 0);
        }
        for (int i = 0; i < matrix.length; i++) {
            //you can't beat yourself
            matrix[i][i] = -1;
        }

        Vote[] votes = (Vote[]) balot.getVotes().toArray(new Vote[balot.getVotes().size()]);
        for (int i = 0; i < votes.length; i++) {
            for (int j = 0; j < votes.length; j++) {
                if (i != j && votes[i].compareTo(votes[j]) > 0) {
                    matrix[getIndex(votes[i].getCandidate())][getIndex(votes[j].getCandidate())] = 1;
                }
            }
        }
    }

    /**
     * helper method to give a given candidates index in the matrix.
     * @param c
     * @return
     */
    private int getIndex(Candidate c) {
        int ret = ((Integer) candidateIndex.get(c)).intValue();
        return ret;
    }

    /**
     * add two matrixes together
     * @param m1
     * @param m2
     * @return
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
        for (int i=0; i<size; i++) {
            matrix[i][i] = -1;
        }
        for (int i=0; i<size; i++) {
            for (int j=0; j<size; j++) {
                if(i!=j) {
                    matrix[i][j]=m1.matrix[i][j]+m2.matrix[i][j];
                }
            }
        }
        return new Matrix(m1.candidates, matrix);

    }

    /**
     * custom implementation to print things out nicely.
     * @return
     */
    public String toString() {
        StringBuffer buf = new StringBuffer(matrix.length * 3);
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                buf.append(matrix[i][j]).append(" ");
            }
            buf.append("\n");
        }
        return buf.toString();
    }

    /**
     * returns true if a beat b, false otherwise
     * @param a
     * @param b
     * @return
     */
    public boolean beat(Candidate a, Candidate b) {
        return matrix[getIndex(a)][getIndex(b)] > matrix[getIndex(b)][getIndex(b)];
    }

    /**
     * two matrices are equal if all the vote counts match up.
     * and the candidates are the same
     * @param o
     * @return
     */
    public boolean equals(Object o) {
        try {
            Matrix other = (Matrix)o;
            if (matrix.length!=other.matrix.length) {
                return false;
            }
            for (int i = 0; i < matrix.length; i++) {
                if (!this.candidates[i].equals(other.candidates[i])) {
                    return false;
                }
            }
            for (int i = 0; i < matrix.length; i++) {
                for (int j = 0; j < matrix[i].length; j++) {
                    if (matrix[i][j]!=other.matrix[i][j]) {
                        return false;
                    }
                }
            }
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }

}
