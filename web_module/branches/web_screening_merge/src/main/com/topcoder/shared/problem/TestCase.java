package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * This class represents a test case.  It can be either an example test case (as shown in a problem statement),
 * or it may represent a system test case (the former are actually instances of the latter).  All test cases
 * consist of one or more input strings and one output string.  Example test cases may have an optional
 * annotation, represented as an <code>Element</code>.
 *
 * @see Element
 * @author Logan Hanks
 */
public class TestCase extends BaseElement implements Element {
    public static final String UNKNOWN_OUTPUT = "UNKNOWN-OUTPUT10291821323";
    public static final String ERROR = "ERROR-GENERATING-OUTPUT10291821323";

    private String[] input;
    private String output;
    private String text;
    private Element annotation;
    private boolean example;

    public TestCase() {
    }

    /**
     * Constructs an unannotated test case.
     *
     * @param input     An array of input values.  The first value should be the value for the first argument, etc.
     * @param output    A string representation of the expected output for this test case
     * @param example   Specifies whether or not this is an example test case
     */
    public TestCase(String[] input, String output, boolean example) {
        this(input, output, null, example);
    }

    /**
     * @param input         An array of input values.  The first value should be the value for the first argument, etc.
     * @param output        A string representation of the expected output for this test case
     * @param annotation    An <code>Element</code> representing a writer's annotation, or explanation of this test case.
     *                      This value can be <code>null</code> if no annotation exists, and should only be non-<code>null</code>
     *                      when <code>example</code> is <code>true</code>.
     * @param example       Specifies whether or not this is an example test case
     * @see Element
     */
    public TestCase(String[] input, String output, Element annotation, boolean example) {
        this.input = input;
        this.output = output;
        this.annotation = annotation;
        this.example = example;
        if (annotation == null)
            text = "";
        else
            text = annotation.toXML();

        this.output = ProblemComponent.decodeXML(this.output);
        for (int i = 0; i < this.input.length; i++) {
            this.input[i] = ProblemComponent.decodeXML(this.input[i]);
        }
    }

    /**
     * Constructs a TestCase whos output is yet unknown.
     *
     * @param input         An array of input values.  The first value should be the value for the first argument, etc.
     * @param annotation    An <code>Element</code> representing a writer's annotation, or explanation of this test case.
     *                      This value can be <code>null</code> if no annotation exists, and should only be non-<code>null</code>
     *                      when <code>example</code> is <code>true</code>.
     * @param example       Specifies whether or not this is an example test case
     * @see Element
     */
    public TestCase(String[] input, Element annotation, boolean example) {
        this(input, UNKNOWN_OUTPUT, annotation, example);
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeObjectArray(input);
        writer.writeString(output);
        writer.writeObject(annotation);
        writer.writeBoolean(example);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {

        Object[] o_input;

        o_input = reader.readObjectArray();
        output = reader.readString();
        annotation = (Element) reader.readObject();
        example = reader.readBoolean();
        input = new String[o_input.length];
        for (int i = 0; i < o_input.length; i++)
            input[i] = (String) o_input[i];
        if (annotation == null)
            text = "";
        else
            text = annotation.toXML();
    }

    /**
     * True if this test case is an example test case.
     */
    public boolean isExample() {
        return example;
    }

    public void setExample(boolean example) {
        this.example = example;
    }

    /**
     * Returns the string representations of the input values as an array.  The order of the
     * array corresponds to the order of parameters to the solution.
     */
    public String[] getInput() {
        return input;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    /**
     * Returns the string representation of the expected output for this test case.
     */
    public String getOutput() {
        return output;
    }

    /**
     * Returns the annotation associated with this test case.  Returns <code>null</code> if no
     * annotation exists.
     */
    public Element getAnnotation() {
        return annotation;
    }

    public String toXML() {
        StringBuffer buf = new StringBuffer(256);

        buf.append("<test-case");
        if (example)
            buf.append(" example=\"1\"");
        buf.append('>');
        for (int i = 0; i < input.length; i++) {
            buf.append("<input>");
            buf.append(ProblemComponent.encodeXML(input[i]));
            buf.append("</input>");
        }
        buf.append("<output>");
        buf.append(ProblemComponent.encodeXML(output));
        buf.append("</output>");
        if (text != null && !text.equals("")) {
            buf.append(ProblemComponent.handleTextElement("annotation",
                    annotation));
        }
        buf.append("</test-case>");
        return buf.toString();
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof TestCase)) return false;

        TestCase t = (TestCase) obj;
        return toXML().equals(t.toXML());
    }
}

