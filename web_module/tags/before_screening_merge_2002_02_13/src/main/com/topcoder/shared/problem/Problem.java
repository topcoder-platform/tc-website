package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.*;

import java.io.*;

/**
 * This class contains data for a problem.  Each problem consists of a number of
 * components.  The actual program interface data (className, etc.) of each component is
 * contained in <code>ProblemComponent</code> objects.  For single-coder contests, each problem
 * has only one component.
 *
 * @author Jing Xue
 * @author Hao Kung
 */
public class Problem extends BaseElement implements Element, Serializable, CustomSerializable {
    private static final String LEGAL = "This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited.  (c)2003, TopCoder, Inc.  All rights reserved.  ";

    private ProblemComponent[] problemComponents = new ProblemComponent[0];
    private int problemId = -1;
    private String name = "";
    private int problemTypeID = -1;
    private String problemText = "";

    /**
     * Get the a cache key
     * @return
     */
    public final String getCacheKey() {
        return "Problem." + problemId;
    }

    /**
     * Default Constructor
     */
    public Problem() {
    }

    /**
     *
     * @param problemid
     * @return
     */
    public static String getCacheKey(int problemid) {
        return "Problem." + problemid;
    }

    /**
     *
     * @param writer
     * @throws IOException
     */
    public void customWriteObject(CSWriter writer) throws IOException {
        writer.writeInt(problemComponents.length);
        for (int i = 0; i < problemComponents.length; i++)
            writer.writeObject(problemComponents[i]);
        writer.writeInt(problemId);
        writer.writeString(name);
        writer.writeInt(problemTypeID);
        writer.writeString(problemText);
    }

    /**
     *
     * @param reader
     * @throws IOException
     * @throws ObjectStreamException
     */
    public void customReadObject(CSReader reader) throws IOException, ObjectStreamException {
        int count = reader.readInt();
        problemComponents = new ProblemComponent[count];
        for (int i = 0; i < count; i++)
            problemComponents[i] = (ProblemComponent) reader.readObject();
        problemId = reader.readInt();
        name = reader.readString();
        problemTypeID = reader.readInt();
        problemText = reader.readString();
    }

    /**
     *
     * @param problemId
     */
    public void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    /**
     *
     * @return
     */
    public int getProblemId() {
        return this.problemId;
    }

    /**
     *
     * @return
     */
    public Object clone() {
        Problem p = new Problem();
        p.setProblemId(problemId);
        p.setProblemText(problemText);
        p.setProblemComponents(problemComponents);
        return p;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @return
     */
    public String getProblemText() {
        return problemText;
    }

    /**
     *
     * @param problemText
     */
    public void setProblemText(String problemText) {
        this.problemText = problemText;
    }

    /**
     *
     * @return
     */
    public ProblemComponent[] getProblemComponents() {
        return problemComponents;
    }

    /**
     *
     * @param problemComponents
     */
    public void setProblemComponents(ProblemComponent[] problemComponents) {
        this.problemComponents = problemComponents;
    }

    /**
     *
     * @return
     */
    public int getProblemTypeID() {
        return problemTypeID;
    }

    /**
     *
     * @param problemTypeID
     */
    public void setProblemTypeID(int problemTypeID) {
        this.problemTypeID = problemTypeID;
    }

    /**
     *
     * @param i
     * @return
     */
    public ProblemComponent getComponent(int i) {
        if (i >= problemComponents.length) return null;
        return problemComponents[i];
    }

    /**
     *
     * @return
     */
    public String toString() {
        StringBuffer ret = new StringBuffer(1000);
        ret.append("(com.topcoder.shared.problem.Problem) [");
        ret.append("problemComponents = ");
        if (problemComponents == null) {
            ret.append("null");
        } else {
            ret.append("{");
            for (int i = 0; i < problemComponents.length; i++) {
                ret.append(problemComponents[i].toString() + ",");
            }
            ret.append("}");
        }
        ret.append(", ");
        ret.append("problemId = ");
        ret.append(problemId);
        ret.append(", ");
        ret.append("name = ");
        if (name == null) {
            ret.append("null");
        } else {
            ret.append(name.toString());
        }
        ret.append(", ");
        ret.append("problemTypeID = ");
        ret.append(problemTypeID);
        ret.append(", ");
        ret.append("problemText = ");
        if (problemText == null) {
            ret.append("null");
        } else {
            ret.append(problemText.toString());
        }
        ret.append(", ");
        ret.append("]");
        return ret.toString();
    }

    /**
     *
     * @return
     */
    public String toXML() {
        StringBuffer xml = new StringBuffer();
        for (int i=0; i<problemComponents.length; i++) {
            xml.append(problemComponents[i].toXML());
        }
        return xml.toString();
    }

    /**
     * Problem statement is valid if all the components are.
     *
     * @return
     */
    public boolean isValid() {
        boolean valid = true;
        for (int i = 0; i < problemComponents.length; i++) {
            valid = valid && problemComponents[i].isValid();
        }
        return valid;
    }
}



