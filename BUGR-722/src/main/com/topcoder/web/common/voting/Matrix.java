package com.topcoder.web.common.voting;

import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.util.*;

/**
 * @author dok
 * @version $Revision: 59638 $ $Date$
 *          Create Date: Sep 2, 2005
 */
public class Matrix implements Serializable {

    private static final Logger log = Logger.getLogger(Matrix.class);
    private List candidates;
    private Map candidateIndex;
    private int[][] matrix;

    public Matrix() {
        super();
    }

    /**
     * create a matrix using the given <code>candidates</code>
     * and <code>matrix</code> of voting information.  in general
     * that order should be alphabetical since that's how
     * the contructor that takes a ballot will organize things.
     *
     * @param candidates - the candidates for this matrix.  the indexes in the list must match the indexes of the matrix
     * @param matrix     - the actual data for this matrix
     */
    public Matrix(List candidates, int[][] matrix) {
        init(candidates, matrix);
    }

    /**
     * create a matrix using the given <code>ballot</code>
     *
     * @param ballot - a ballot we want to represent in a matrix
     */
    public Matrix(RankBallot ballot) {
        ArrayList a = new ArrayList(ballot.getElection().getCandidates());
        Collections.sort(a, new Candidate.IDComparator());
        init(a, null);

        matrix = new int[candidates.size()][candidates.size()];
        for (int i = 0; i < matrix.length; i++) {
            Arrays.fill(matrix[i], 0);
        }
        for (int i = 0; i < matrix.length; i++) {
            //you can't beat yourself
            matrix[i][i] = -1;
        }

        Vote[] votes = (Vote[]) ballot.getVotes().toArray(new Vote[]{});

        //build up an index of all the candidates that where actually
        //included in the votes contained in this ballot.  we'll need
        //that info make the assumption those not included are preferred less
        //than those that did
        HashSet voteIndex = new HashSet();
        for (int i = 0; i < votes.length; i++) {
            voteIndex.add(votes[i].getId().getCandidate());
        }
        //log.debug(voteIndex.toString());

        Candidate c;
        for (int i = 0; i < votes.length; i++) {
            for (int j = 0; j < votes.length; j++) {
                if (i != j) {
                    //mark that i beat j if i was preferred to j
                    if (votes[i].getRank().compareTo(votes[j].getRank()) < 0) {
                        matrix[getIndex(votes[i].getId().getCandidate())][getIndex(votes[j].getId().getCandidate())] = 1;
                    }
                }
            }
            //mark that i beat j if j wasn't present in the ballot
            for (Iterator it = candidates.iterator(); it.hasNext();) {
                c = (Candidate) it.next();
                if (!voteIndex.contains(c)) {
                    matrix[getIndex(votes[i].getId().getCandidate())][getIndex(c)] = 1;
                }
            }
        }
        //log.debug(this.toString());
    }

    private void init(List candidates, int[][] matrix) {
        this.candidates = candidates;
        this.matrix = matrix;
        candidateIndex = new HashMap();
        int i = 0;
        Candidate c;
        Integer idx;
        for (Iterator it = candidates.iterator(); it.hasNext(); i++) {
            c = (Candidate) it.next();
            idx = new Integer(i);
            candidateIndex.put(c, idx);
        }

    }

    /**
     * helper method to give a given candidates index in the matrix.
     *
     * @param c the candidate whose index we will return
     * @return int the index of the candidate in this matrix or -1 if it doesn't exist
     */
    public int getIndex(Candidate c) {
        Integer ret = (Integer) candidateIndex.get(c);
        if (ret != null) {
            return ret.intValue();
        } else {
            return -1;
        }
    }

    /**
     * addVote two matrixes together
     *
     * @param m1 the first of two matrixes to addVote
     * @param m2 the second of two matrixes to addVote
     * @return Matrix
     */
    public static Matrix add(Matrix m1, Matrix m2) {
        int size = m1.candidates.size();
        if (size != m2.candidates.size()) {
            throw new IllegalArgumentException("m1 and m2 must be the same size, they were " +
                    m1.candidates.size() + " and " + m2.candidates.size() + " respectively");
        }
        for (int i = 0; i < size; i++) {
            if (!m1.candidates.get(i).equals(m2.candidates.get(i))) {
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
        Candidate c;
        for (int i = 0; i < matrix.length; i++) {
            c = (Candidate) candidates.get(i);
            if (c.getId() != null) {
                buf.append(c.getId()).append(",");
            } else {
                buf.append(c.getName()).append(",");
            }
        }
        buf.append("\n");
        for (int i = 0; i < matrix.length; i++) {
            c = (Candidate) candidates.get(i);
            if (c.getId() != null) {
                buf.append(c.getId()).append(" ");
            } else {
                buf.append(c.getName()).append(" ");
            }
            for (int j = 0; j < matrix[i].length; j++) {
                buf.append(matrix[i][j]).append(" ");
            }
            buf.append("\n");
        }
        return buf.toString();
    }

    /**
     * @param a the first candidate
     * @param b the second candidate
     * @return true if <code>a</code> beat <code>b</code>, false otherwise
     */
    public boolean beat(Candidate a, Candidate b) {
        return beat(getIndex(a), getIndex(b));
    }

    /**
     * @param a the index of the first candidate
     * @param b the index of the second candidate
     * @return true if the candidate at index <code>a</code> beat
     *         the candidate at indx <code>b</code>, false otherwise
     */
    public boolean beat(int a, int b) {
        return matrix[a][b] > matrix[b][a];
    }

    /**
     * @param a the first candidate
     * @param b the second candidate
     * @return true of <code>a</code> tied <code>b</code>, false otherwise
     */
    public boolean tie(Candidate a, Candidate b) {
        return beat(getIndex(a), getIndex(b));
    }

    /**
     * @param a the index of the first candidate
     * @param b the index of the second candidate
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
     * @param o the other object
     * @return boolean
     */
    public boolean equals(Object o) {
        try {
            Matrix other = (Matrix) o;
            if (matrix.length != other.matrix.length) {
                return false;
            }
            for (int i = 0; i < matrix.length; i++) {
                if (!candidates.get(i).equals(other.candidates.get(i))) {
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
     * Return the candidates in this matrix.
     *
     * @return Set of candidates
     */
    public List getCandidates() {
        return Collections.unmodifiableList(candidates);
    }

    /**
     * @param a the first candidate
     * @param b the second candidate
     * @return the number of votes ranking <code>a</code> above <code>b</code>
     */
    public int getValue(Candidate a, Candidate b) {
        return getValue(getIndex(a), getIndex(b));
    }

    /**
     * @param a the index of the first candidate
     * @param b the index of the second candidate
     * @return the the number of votes ranking the candidate with index
     *         <code>a</code> above the candidate with index <code>b</code>
     */
    public int getValue(int a, int b) {
        return matrix[a][b];
    }

    public Candidate getCandidate(int idx) {
        return (Candidate) candidates.get(idx);
    }

    public Candidate getCandidate(Integer idx) {
        return getCandidate(idx.intValue());
    }

}
