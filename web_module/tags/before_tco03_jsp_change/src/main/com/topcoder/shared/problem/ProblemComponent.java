package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.*;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

/**
 * This class fully represents a problem statement.  This consists of the following elements:
 *
 * <ul>
 *  <li>Problem name (useful for references between problem statements, e.g. in teams problems)
 *  <li>Introductory text
 *  <li>Signature
 *      <ul>
 *          <li>Class name
 *          <li>Method name
 *          <li>Return type
 *          <li>Parameter types and names
 *      </ul>
 *  <li>Some additional, optional text discussing the specification in more technical detail
 *  <li>One or more notes
 *  <li>One or more input constraints
 *  <li>One or more examples
 * </ul>
 *
 * Instances of this class are serializable and are suitable for client-side use.  Instances of
 * this class should generally be constructed by a <code>ProblemComponentFactory</code>.  This class
 * also provides a method to convert to its language-independent XML representation.
 * The class also provides methods for obtaining and modifying specific elements.
 *
 * @see com.topcoder.shared.problemParser.ProblemComponentFactory
 * @see Element
 * @see DataType
 * @see com.topcoder.shared.language.Language
 * @author Logan Hanks
 */
public class ProblemComponent extends BaseElement
        implements Element, Serializable, Cloneable, CustomSerializable {
    static String SECTION_HEADER = "h3";
    static String CODE = "<code>";

    private boolean unsafe = true;
    private boolean valid = true;
    private ArrayList messages = new ArrayList();
    private String name = "";
    private Element intro = new TextElement();
    private String className = "";
    private String methodName = "";
    private DataType returnType = new DataType();
    private DataType[] paramTypes = new DataType[0];
    private String[] paramNames = new String[0];
    private Element spec = new TextElement();
    private Element[] notes = new Element[0];
    private Constraint[] constraints = new Constraint[0];
    private TestCase[] testCases = new TestCase[0];
    private int componentTypeID = ProblemConstants.MAIN_COMPONENT;
    private int componentId = -1;
    private int problemId = -1;
    private String defaultSolution = "";
    private WebService[] webServices = new WebService[0];

    public ProblemComponent() {
    }

    /**
     * A problem statement must be constructed with a set of known data types, the XML
     * it was originally parsed from, and a flag specifying whether this instance is
     * an ``unsafe'' version.
     *
     * @param unsafe    If <code>true</code>, specifies that the problem statement contains
     *                  sensitive information that should be available only to MPSQAS
     */
    public ProblemComponent(boolean unsafe) {
        this.unsafe = unsafe;
    }


    /**
     * Utility function for encoding "special" xml characters, or characters
     * not allowing xml to properly parse.
     * Replaces bad characters with /ASCIIXXX/ where XXX is the ascii value
     * of the character.
     */
    static public String encodeXML(String text) {
        StringBuffer buf = new StringBuffer(text.length());
        ArrayList bad = new ArrayList();
        for (int i = 0; i < ProblemConstants.BAD_XML_CHARS.length; i++) {
            bad.add(new Character(ProblemConstants.BAD_XML_CHARS[i]));
        }

        for (int i = 0; i < text.length(); i++) {
            if (bad.indexOf(new Character(text.charAt(i))) == -1)
                buf.append(text.charAt(i));
            else
                buf.append("/ASCII" + (int) text.charAt(i) + "/");
        }
        return buf.toString();
    }

    /**
     * Undoes the encoding scheme in encodeXML.
     * @param text
     * @return
     */
    static public String decodeXML(String text) {
        StringBuffer buf = new StringBuffer(text.length());
        while (text.length() > 0) {
            boolean appendChar = true;
            if (text.startsWith("/ASCII") && text.indexOf("/", 2) != -1) {
                try {
                    buf.append((char) Integer.parseInt(text.substring(6,
                            text.indexOf("/", 2))));
                    appendChar = false;
                    text = text.substring(text.indexOf("/", 2) + 1);
                } catch (NumberFormatException e) {
                }
            }
            if (appendChar) {
                buf.append(text.charAt(0));
                text = text.substring(1);
            }
        }
        return buf.toString();
    }

    /**
     *
     * @param writer
     * @throws IOException
     */
    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeBoolean(unsafe);
        writer.writeBoolean(valid);
        writer.writeArrayList(messages);
        writer.writeString(name);
        writer.writeObject(intro);
        writer.writeString(className);
        writer.writeString(methodName);
        writer.writeObject(returnType);
        writer.writeObjectArray(paramTypes);
        writer.writeObjectArray(paramNames);
        writer.writeObject(spec);
        writer.writeObjectArray(notes);
        writer.writeObjectArray(constraints);
        writer.writeObjectArray(testCases);
        writer.writeInt(componentTypeID);
        writer.writeInt(componentId);
        writer.writeInt(problemId);
        writer.writeString(defaultSolution);
        writer.writeObjectArray(webServices);
    }

    /**
     *
     * @param reader
     * @throws IOException
     */
    public void customReadObject(CSReader reader)
            throws IOException {
        Object[] o_paramTypes, o_paramNames, o_notes, o_constraints, o_testCases, o_webServices;

        unsafe = reader.readBoolean();
        valid = reader.readBoolean();
        messages = reader.readArrayList();
        name = reader.readString();
        intro = (Element) reader.readObject();
        className = reader.readString();
        methodName = reader.readString();
        returnType = (DataType) reader.readObject();
        o_paramTypes = reader.readObjectArray();
        o_paramNames = reader.readObjectArray();
        spec = (Element) reader.readObject();
        o_notes = reader.readObjectArray();
        o_constraints = reader.readObjectArray();
        o_testCases = reader.readObjectArray();
        componentTypeID = reader.readInt();
        componentId = reader.readInt();
        problemId = reader.readInt();
        defaultSolution = reader.readString();
        o_webServices = reader.readObjectArray();

        if (o_paramTypes == null)
            o_paramTypes = new Object[0];
        if (o_paramNames == null)
            o_paramNames = new Object[0];
        if (o_notes == null)
            o_notes = new Object[0];
        if (o_constraints == null)
            o_constraints = new Object[0];
        if (o_testCases == null)
            o_testCases = new Object[0];
        if (o_webServices == null)
            o_webServices = new Object[0];

        paramTypes = new DataType[o_paramTypes.length];
        for (int i = 0; i < o_paramTypes.length; i++)
            paramTypes[i] = (DataType) o_paramTypes[i];
        paramNames = new String[o_paramNames.length];
        for (int i = 0; i < o_paramNames.length; i++)
            paramNames[i] = (String) o_paramNames[i];
        notes = new Element[o_notes.length];
        for (int i = 0; i < o_notes.length; i++)
            notes[i] = (Element) o_notes[i];
        constraints = new Constraint[o_constraints.length];
        for (int i = 0; i < o_constraints.length; i++)
            constraints[i] = (Constraint) o_constraints[i];
        testCases = new TestCase[o_testCases.length];
        for (int i = 0; i < o_testCases.length; i++)
            testCases[i] = (TestCase) o_testCases[i];
        webServices = new WebService[o_webServices.length];
        for (int i = 0; i < o_webServices.length; i++)
            webServices[i] = (WebService) o_webServices[i];
    }

    /**
     * If a problem component is unsafe, then it should not
     * have all the system test cases, only those that are marked
     * as examples.
     * @return
     */
    public boolean isUnsafe() {
        return unsafe;
    }

    /**
     * If a problem component is unsafe, then it should not
     * have all the system test cases, only those that are marked
     * as examples.
     * @param unsafe
     */
    public void setUnsafe(boolean unsafe) {
        this.unsafe = unsafe;
    }

    /**
     * A problem statement is valid if it was successfully parsed without errors.
     * @return
     */
    public boolean isValid() {
        return valid;
    }

    /**
     *
     * @param valid
     */
    public void setValid(boolean valid) {
        this.valid = valid;
    }

    /**
     * Get the list of <code>ProblemMessage</code>s generated by the parsing process.
     *
     * @return  An <code>ArrayList</code> of <code>ProblemMessage</code>s
     * @see ProblemMessage
     */
    public ArrayList getMessages() {
        return messages;
    }

    /**
     *
     * @param messages
     */
    public void setMessages(ArrayList messages) {
        this.messages = messages;
    }

    /**
     * Clears the list of problem messages.
     */
    public void clearMessages() {
        messages = new ArrayList();
    }

    /**
     * Append a <code>ProblemMessage</code> to the list of messages.
     * @param message
     */
    public void addMessage(ProblemMessage message) {
        if (message.getType() != message.WARNING)
            valid = false;
        messages.add(message);
    }

    /**
     * The ``intro'' is the required introductory text for a problem statement (shown before
     * the signature).
     * @return
     */
    public Element getIntro() {
        return intro;
    }

    /**
     * Updates the ``intro'' element.
     *
     * @see #getIntro
     * @param intro
     */
    public void setIntro(Element intro) {
        this.intro = intro;
    }

    /**
     * The ``spec'' is the optional text following the signature, typically giving more technical
     * information about the problem.
     * @return
     */
    public Element getSpec() {
        return spec;
    }

    /**
     * Updates the ``spec'' element.
     *
     * @see #getSpec
     * @param spec
     */
    public void setSpec(Element spec) {
        this.spec = spec;
    }

    /**
     * Gets the name of the class that should be defined in solutions to this problem.
     * @return
     */
    public String getClassName() {
        return className;
    }

    /**
     * Sets the name of the class that should be defined in solutions to this problem.
     * @param className
     */
    public void setClassName(String className) {
        this.className = className;
    }

    /**
     * Gets the name of the method that should be defined in solutions to this problem.
     */
    public String getMethodName() {
        return methodName;
    }

    /**
     * Sets the name of the method that should be defined in solutions to this problem.
     */
    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    /**
     * Gets the return type of the method that should be defined in solutions to this problem.
     *
     * @see DataType
     */
    public DataType getReturnType() {
        return returnType;
    }


    /**
     * Sets the return type of the method that should be defined in solutions to this problem.
     *
     * @see DataType
     */
    public void setReturnType(DataType returnType) {
        this.returnType = returnType;
    }

    /**
     * Gets the data type of all of the arguments to the method that should be defined in solutions to this problem.
     *
     * @return  An array of <code>DataType</code>s, where the first value is the type of the first argument,
     *          the second value is the type of the second argument, and so on
     * @see DataType
     */
    public DataType[] getParamTypes() {
        return paramTypes;
    }

    /**
     * Sets the data type of all of the arguments to the method that should be defined in solutions to this problem.
     *
     * @param paramTypes    An array of <code>DataType</code>s, where the first value is the type of the first argument,
     *                      the second value is the type of the second argument, and so on
     * @see DataType
     */
    public void setParamTypes(DataType[] paramTypes) {
        this.paramTypes = paramTypes;
    }

    /**
     * Gets the names of the arguments to the method that should be defined in solutions to this problem.
     *
     * @return  An array of <code>String</code>s, where the first value is the name of the first argument,
     *          the second value is the name of the second argument, and so on
     */
    public String[] getParamNames() {
        return paramNames;
    }

    /**
     * Sets the names of the arguments to the method that should be defined in solutions to this problem.
     *
     * @param paramNames    An array of <code>String</code>s, where the first value is the name of the first argument,
     *                      the second value is the name of the second argument, and so on
     */
    public void setParamNames(String[] paramNames) {
        this.paramNames = paramNames;
    }

    /**
     * Gets the list of notes.
     *
     * @return  An array of <code>Element</code>s, each <code>Element</code> representing a note
     * @see Element
     */
    public Element[] getNotes() {
        return notes;
    }

    /**
     * Sets the list of notes.
     *
     * @param notes An array of <code>Element</code>s, each <code>Element</code> representing a note
     * @see Element
     */
    public void setNotes(Element[] notes) {
        this.notes = notes;
    }

    /**
     * Gets the list of constraints.
     *
     * @return  An array of <code>Constraint</code>s, each <code>Constraint</code> representing a constraint
     * @see Constraint
     */
    public Constraint[] getConstraints() {
        return constraints;
    }

    /**
     * Sets the list of constraints.
     *
     * @param constraints   An array of <code>Constraint</code>s, each <code>Constraint</code> representing a constraint
     * @see Constraint
     */
    public void setConstraints(Constraint[] constraints) {
        this.constraints = constraints;
    }

    /**
     * Get the list of test cases.  This will include at least all of the example test cases.
     * If this is an unsafe version of the problem statement, it will include the system test cases
     * as well.
     *
     * @see TestCase
     */
    public TestCase[] getTestCases() {
        return testCases;
    }

    /**
     * Set the list of test cases.
     * @param testCases
     */
    public void setTestCases(TestCase[] testCases) {
        this.testCases = testCases;
    }

    /**
     * Sets the list of web services
     * @param webServices
     */
    public void setWebServices(WebService[] webServices) {
        this.webServices = webServices;
    }

    /**
     * Get the list of web services associated with this component
     * @return
     */
    public WebService[] getWebServices() {
        return webServices;
    }

    /**
     *
     * @param name
     * @param elem
     * @return
     */
    public static String handleTextElement(String name, Element elem) {
        if (elem instanceof TextElement)
            return "<" + name + ">" + elem.toString() + "</" + name + ">";
        return elem.toXML();
    }

    /**
     * Gets an XML representation for this component
     * @return
     */
    public String toXML() {
        StringBuffer buf = new StringBuffer(4096);

        buf.append("<?xml version=\"1.0\"?>");
        buf.append("<problem");

        buf.append(" xmlns=\"http://topcoder.com\"");
        buf.append(" name=\"");
        buf.append(name);
        buf.append("\"><signature><class>");
        buf.append(className);
        buf.append("</class><method>");
        buf.append(methodName);
        buf.append("</method><return>");
        buf.append(returnType.toXML());
        buf.append("</return><params>");
        for (int i = 0; i < paramTypes.length; i++) {
            buf.append("<param>");
            buf.append(paramTypes[i].toXML());
            buf.append("<name>");
            buf.append(paramNames[i]);
            buf.append("</name></param>");
        }
        buf.append("</params></signature>");
        if (intro != null)
            buf.append(handleTextElement("intro", intro));
        if (spec != null)
            buf.append(handleTextElement("spec", spec));
        buf.append("<notes>");
        for (int i = 0; i < notes.length; i++) {
            buf.append(handleTextElement("note", notes[i]));
        }
        buf.append("</notes><constraints>");
        for (int i = 0; i < constraints.length; i++)
            buf.append(constraints[i].toXML());
        buf.append("</constraints><test-cases>");
        for (int i = 0; i < testCases.length; i++) {
            buf.append(testCases[i].toXML());
        }
        buf.append("</test-cases></problem>");
        return buf.toString();
    }

    /**
     *
     * @return
     */
    public String toString() {
        StringBuffer str = new StringBuffer();
        str.append("com.topcoder.shared.problem.ProblemComponent[");
        str.append("unsafe=");
        str.append(unsafe);
        str.append(",valid=");
        str.append(valid);
        str.append(",messages=");
        str.append(messages);
        str.append(",name=");
        str.append(name);
        str.append(",intro=");
        str.append(intro);
        str.append(",className=");
        str.append(className);
        str.append(",methodName=");
        str.append(methodName);
        str.append(",returnType=");
        str.append(returnType);
        str.append(",paramTypes=");
        str.append(paramTypes);
        str.append(",paramNames=");
        str.append(paramNames);
        str.append(",spec=");
        str.append(spec);
        str.append(",notes=");
        str.append(notes);
        str.append(",constraints=");
        str.append(constraints);
        str.append(",testCases=");
        str.append(testCases);
        str.append("]");
        return str.toString();
    }

    /**
     * Get the component type id
     * @return
     */
    public int getComponentTypeID() {
        return componentTypeID;
    }

    /**
     * set the component type id
     * @param componentTypeID
     */
    public void setComponentTypeID(int componentTypeID) {
        this.componentTypeID = componentTypeID;
    }

    /**
     * set the component id
     * @param componentId
     */
    public final void setComponentId(int componentId) {
        this.componentId = componentId;
    }

    /**
     * set the default solution
     * @param solution
     */
    public final void setDefaultSolution(String solution) {
        this.defaultSolution = solution;
    }

    /**
     * gets the component id
     * @return
     */
    public final int getComponentId() {
        return this.componentId;
    }

    /**
     * gets the default solution
     * @return
     */
    public final String getDefaultSolution() {
        return this.defaultSolution;
    }

    /**
     * gets the problem id that this component is associated with
     * @return
     */
    public int getProblemId() {
        return problemId;
    }

    /**
     * sets the problem id that this component is associated with
     * @param problemId
     */
    public void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    /**
     * gets the cache key for supplied component id
     * @param componentID
     * @return
     */
    public static String getCacheKey(int componentID) {
        return "ProblemComponent." + componentID;
    }

    /**
     *  gets the cache key for this component
     * @return
     */
    public final String getCacheKey() {
        return getCacheKey(componentId);
    }

    /**
     * gets the string representation of the return type
     * for the required method for this component for the specified language
     * @param language the languageID
     * @return the return type for the languageID
     */
    public String getReturnType(int language) {
        return returnType.getDescriptor(language);
    }

    /**
     * @deprecated
     */
    public String getResultType() {
        return returnType.getDescriptor(ProblemConstants.JAVA);
    }

    /**
     * @deprecated
     * for old stuff, just gets array list of java types.
     */
    public ArrayList getArgs() {
        ArrayList ret = new ArrayList();
        for (int i = 0; i < paramTypes.length; i++) {
            ret.add(paramTypes[i].getDescriptor(ProblemConstants.JAVA));
        }
        return ret;
    }

    public static void main(String[] args) {
        System.out.println("Before: |" + args[0] + "|");
        String encoded = encodeXML(args[0]);
        System.out.println("Encoded: |" + encoded + "|");
        System.out.println("After: |" + decodeXML(encoded) + "|");

    }
}
