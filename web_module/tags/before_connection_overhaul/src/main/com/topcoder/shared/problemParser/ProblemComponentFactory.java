package com.topcoder.shared.problemParser;

import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.JavaLanguage;

import com.topcoder.shared.problem.*;

import org.apache.log4j.Category;

import org.apache.xerces.parsers.DOMParser;
import org.apache.xerces.parsers.StandardParserConfiguration;
 
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.NamedNodeMap;
 
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import java.io.*;

import java.util.*;

/**
 * This factory does all of the work of parsing an XML description of a problem statement and constructing
 * an appropriate instance of the <code>ProblemComponent</code> class.  Uses xerces2-j for parsing.
 *
 * @see ProblemComponent
 * @author Logan Hanks
 */
public class ProblemComponentFactory
    implements ErrorHandler
{
    static final String TYPE = "type";
    static final String INTRO = "intro";
    static final String SPEC = "spec";
    static final String NOTES = "notes";
    static final String CONSTRAINTS = "constraints";
    static final String CONSTRAINT = "constraint";
    static final String NUMERIC = "numeric";
    static final String ARRAY = "array";
    static final String USER_CONSTRAINT = "user-constraint";
    static final String TEST_CASES = "test-cases";
    static final String TEST_CASE_INPUT = "input";
    static final String TEST_CASE_OUTPUT = "output";
    static final String TEST_CASE_ANNOTATION = "annotation";
    static final String SIGNATURE = "signature";
    static final String SIGNATURE_CLASS = "class";
    static final String SIGNATURE_METHOD = "method";
    static final String SIGNATURE_RETURN = "return";
    static final String SIGNATURE_PARAMS = "params";
    static final String SIGNATURE_PARAM = "param";
    static final String SIGNATURE_PARAM_NAME = "name";

    Node doc, root;
    NodeList sections;
    ProblemComponent stmt;
    Category trace = Category.getInstance(getClass());

    public ProblemComponentFactory()
    {
    }

    /**
     * Builds a <code>ProblemComponent</code>.
     *
     * @param reader    A reader on some input stream containing the XML description of a problem statement
     * @param unsafe    A flag which, if set, will designate that information suitable only for
     *                  MPSQAS will be included in the <code>ProblemComponent</code>
     * @return This method always returns a <code>ProblemComponent</code> object, and should not
     *         throw any exceptions.  If any parse errors occurred (or anything else of significance),
     *         they will be noted in the problem statement's messages.  Furthermore, if a parse error
     *         occurred, the statement will be marked as invalid.
     *
     * @see ProblemComponent
     */
    synchronized public ProblemComponent buildFromXML(Reader reader, boolean unsafe) {
        stmt = new ProblemComponent(unsafe);
        try {
            ResourceBundle bundle = ResourceBundle.getBundle("ProblemParser");
            DOMParser parser = new DOMParser(new StandardParserConfiguration());

            parser.setErrorHandler(this);
            parser.setFeature("http://xml.org/sax/features/validation", true);
            parser.setFeature("http://apache.org/xml/features/validation/schema", true);
            parser.setFeature("http://apache.org/xml/features/validation/schema-full-checking", true);
            parser.setProperty("http://apache.org/xml/properties/schema/external-schemaLocation", bundle.getString("schema"));
            parser.parse(new InputSource(reader));
            doc = parser.getDocument();
            root = getChildByName(doc.getChildNodes(), "problem");
            sections = root.getChildNodes();
            checkTypes(root);
            if(!stmt.isValid()) {
                trace.error("checkTypes failed!");
                return stmt;
            }
            parseSignature();
            parseIntro();
            parseSpec();
            parseNotes();
            parseConstraints();
            parseTestCases();
        } catch(Exception ex) {
            System.out.println("Exception while parsing statement: " + ex);
            ex.printStackTrace();
            stmt.addMessage(new ProblemMessage(ProblemMessage.FATAL_ERROR, ex.getMessage()));
            stmt.setValid(false);
        } finally {
            ArrayList messages = stmt.getMessages();

            for(int i = 0; i < messages.size(); i++)
                trace.debug(messages.get(i).toString());
        }
        return stmt;
    }

    /**
     * Builds a <code>ProblemComponent</code>.
     *
     * @param content       An XML description of a problem statement
     * @param unsafe    A flag which, if set, will designate that information suitable only for
     *                  MPSQAS will be included in the <code>ProblemComponent</code>
     * @return This method always returns a <code>ProblemComponent</code> object, and should not
     *         throw any exceptions.  If any parse errors occurred (or anything else of significance),
     *         they will be noted in the problem statement's messages.  Furthermore, if a parse error
     *         occurred, the statement will be marked as invalid.
     *
     * @see ProblemComponent
     * @throws IOException
     */
    synchronized public ProblemComponent build(String content, boolean unsafe)
        throws IOException
    {
        return buildFromXML(new StringReader(content), unsafe);
    }

    void traverse(Node node)
    {
        NodeList nl = node.getChildNodes();

        System.out.println("<" + node.getNodeName() + ">");
        if(node.getNodeType() != node.ELEMENT_NODE)
            System.out.println("<text>" + node.getNodeValue() + "</text>");
        for(int i = 0; i < nl.getLength(); i++)
            traverse(nl.item(i));
        System.out.println("</" + node.getNodeName() + ">");
    }

    public Category getCategory()
    {
        return trace;
    }

    public void error(SAXParseException ex)
        throws SAXException
    {
        //trace.error(ex.toString());
        stmt.addMessage(new ProblemMessage(ProblemMessage.ERROR, ex.getMessage(), ex.getLineNumber(), ex.getColumnNumber()));
    }

    public void warning(SAXParseException ex)
        throws SAXException
    {
        //trace.warn(ex.toString());
        stmt.addMessage(new ProblemMessage(ProblemMessage.WARNING, ex.getMessage(), ex.getLineNumber(), ex.getColumnNumber()));
    }

    public void fatalError(SAXParseException ex)
        throws SAXException
    {
        //trace.fatal(ex.toString());
        stmt.addMessage(new ProblemMessage(ProblemMessage.FATAL_ERROR, ex.getMessage(), ex.getLineNumber(), ex.getColumnNumber()));
    }

    /**
     * Utility method for obtaining the first child of a node with a particular name.
     *
     * @param nl    A <code>NodeList</code>, representing the children of some node
     * @param name  An element name to locate
     * @return If a node in nl has the given name, it is returned.  Otherwise <code>null</code> is returned.
     */
    static public Node getChildByName(NodeList nl, String name)
    {
        //System.out.println("Looking for "+name);
        for(int i = 0; i < nl.getLength(); i++) {
            Node node = nl.item(i);

            //System.out.println("  found "+node.getNodeName());
            if(node.getNodeName().equals(name))
                return node;
        }
        return null;
    }

    /**
     * Gets the text value of the attribute of the given node with the given name,
     * or <code>null</code> if an attribute of that name is not defined for the node.
     */
    static public String getAttribute(Node node, String name)
    {
        NamedNodeMap nl = node.getAttributes();

        if(nl == null)
            return null;

        Node n = nl.getNamedItem(name);

        if(n == null)
            return null;
        return n.getNodeValue();
    }

    /**
     * If the given node contains a text element, returns the contents of that text element.
     * Otherwise returns <code>null</code>.
     */
    static public String getText(Node node)
    {
        if(node == null)
            return null;
        if(node.getNodeType() != node.ELEMENT_NODE)
            return null;

        NodeList nl = node.getChildNodes();

        if(nl.getLength() != 1)
            return null;

        Node n = nl.item(0);

        if(n.getNodeType() != node.TEXT_NODE)
            return null;

        return n.getNodeValue();
    }

    void checkTypes(Node node)
    {
        NodeList nl = node.getChildNodes();

        for(int i = 0; i < nl.getLength(); i++) {
            Node subnode = nl.item(i);

            if(subnode.getNodeType() == subnode.ELEMENT_NODE) {
                if(subnode.getNodeName().equals(TYPE)) {
                    String text = getText(subnode);

                    if(text == null) {
                        stmt.addMessage(new ProblemMessage(ProblemMessage.ERROR, "Empty type element"));
                        stmt.setValid(false);
                    } else {
                        try {
                            DataTypeFactory.getDataType(text);
                        } catch(InvalidTypeException ex) {
                            stmt.addMessage(new ProblemMessage(ProblemMessage.ERROR, "Invalid type: " + text));
                            stmt.setValid(false);
                        }
                    }
                } else
                    checkTypes(subnode);
            }
        }
    }

    DataType getType(Node node)
        throws InvalidTypeException
    {
        String value = node.getFirstChild().getNodeValue();

        return DataTypeFactory.getDataType(value);
    }

    DataType getNestedType(Node node)
        throws InvalidTypeException
    {
        return getType(getChildByName(node.getChildNodes(), TYPE));
    }

    void removeTextChildren(Node node)
    {
        for(Node n = node.getFirstChild(), next; n != null; n = next) {
            next = n.getNextSibling();
            if(n.getNodeType() == n.TEXT_NODE)
                node.removeChild(n);
        }
    }

    void parseSignature()
        throws Exception
    {
        Node node = getChildByName(sections, SIGNATURE);
        NodeList nl = node.getChildNodes();
        String className = getText(getChildByName(nl, SIGNATURE_CLASS));
        String methodName = getText(getChildByName(nl, SIGNATURE_METHOD));
        DataType returnType = getNestedType(getChildByName(nl, SIGNATURE_RETURN));
        
        Node params = getChildByName(nl, SIGNATURE_PARAMS);

        removeTextChildren(params);

        NodeList paramList = params.getChildNodes();
        DataType[] paramTypes = new DataType[paramList.getLength()];
        String[] paramNames = new String[paramList.getLength()];
        
        for(int i = 0; i < paramTypes.length; i++) {
            Node n = paramList.item(i);

            paramTypes[i] = getType(getChildByName(n.getChildNodes(), TYPE));
            paramNames[i] = getText(getChildByName(n.getChildNodes(), SIGNATURE_PARAM_NAME));
        }
        stmt.setClassName(className);
        stmt.setMethodName(methodName);
        stmt.setReturnType(returnType);
        stmt.setParamTypes(paramTypes);
        stmt.setParamNames(paramNames);
    }

    void parseIntro()
    {
        Node node = getChildByName(sections, INTRO);

        stmt.setIntro(NodeElementFactory.build(node));
    }

    void parseSpec()
    {
        Node node = getChildByName(sections, SPEC);

        if(node != null)
            stmt.setSpec(NodeElementFactory.build(node));
    }

    void parseNotes()
    {
        Node node = getChildByName(sections, NOTES);

        removeTextChildren(node);

        NodeList nl = node.getChildNodes();
        Element[] notes = new Element[nl.getLength()];

        for(int i = 0; i < notes.length; i++)
            notes[i] = NodeElementFactory.build(nl.item(i));
        stmt.setNotes(notes);
    }

    void parseConstraints()
    {
        Node node = getChildByName(sections, CONSTRAINTS);

        removeTextChildren(node);

        NodeList nl = node.getChildNodes();
        Constraint[] constraints = new Constraint[nl.getLength()];

        for(int i = 0; i < constraints.length; i++)
            constraints[i] = ConstraintFactory.build(nl.item(i));
        stmt.setConstraints(constraints);
    }

    void parseTestCases()
    {
        Node node = getChildByName(sections, TEST_CASES);

        removeTextChildren(node);

        NodeList nl = node.getChildNodes();
        TestCase[] testCases = new TestCase[nl.getLength()];

        for(int i = 0; i < testCases.length; i++)
            testCases[i] = TestCaseFactory.build(nl.item(i));
        stmt.setTestCases(testCases);
    }

    static public void main(String[] args)
        throws Exception
    {
        JavaLanguage java = new JavaLanguage();
        CPPLanguage cpp = new CPPLanguage();
        CSharpLanguage csharp = new CSharpLanguage();
        DataType t_string = new DataType(18, "String");
        DataType t_astring = new DataType(22, "String[]");
        DataType t_aastring = new DataType(22, "String[][]");
        DataType t_int = new DataType(1, "int");
        DataType t_aint = new DataType(20, "int[]");
        DataType t_long = new DataType(14, "long");
        HashMap map = new HashMap();

        map.put(new Integer(java.ID), "String");
        map.put(new Integer(cpp.ID), "string");
        map.put(new Integer(csharp.ID), "String");
        t_string.setTypeMapping(map);
 
        map = new HashMap();
        map.put(new Integer(java.ID), "String[]");
        map.put(new Integer(cpp.ID), "vector<string>");
        map.put(new Integer(csharp.ID), "String[]");
        t_astring.setTypeMapping(map);
 
        map = new HashMap();
        map.put(new Integer(java.ID), "String[][]");
        map.put(new Integer(cpp.ID), "vector< vector<string> >");
        map.put(new Integer(csharp.ID), "String[][]");
        t_aastring.setTypeMapping(map);
 
        map = new HashMap();
        map.put(new Integer(java.ID), "int");
        map.put(new Integer(cpp.ID), "int");
        map.put(new Integer(csharp.ID), "int");
        t_int.setTypeMapping(map);
 
        map = new HashMap();
        map.put(new Integer(java.ID), "int[]");
        map.put(new Integer(cpp.ID), "vector<int>");
        map.put(new Integer(csharp.ID), "int[]");
        t_aint.setTypeMapping(map);
 
        map = new HashMap();
        map.put(new Integer(java.ID), "long");
        map.put(new Integer(cpp.ID), "long long");
        map.put(new Integer(csharp.ID), "long");
        t_long.setTypeMapping(map);

        HashMap types = new HashMap();

        types.put("String", t_string);
        types.put("String[]", t_astring);
        types.put("String[][]", t_aastring);
        types.put("int", t_int);
        types.put("int[]", t_aint);
        types.put("long", t_long);

        FileReader reader = new FileReader(args[0]);

        ProblemComponentFactory factory = new ProblemComponentFactory();
        ProblemComponent stmt = factory.buildFromXML(reader, true);
        ArrayList messages = stmt.getMessages();

        for(int i = 0; i < messages.size(); i++)
            ((ProblemMessage)messages.get(i)).log(factory.trace);

        if(stmt.isValid()) {
            System.out.println("XML:\n\n" + stmt.toXML());
//            System.out.println("\nHTML (Java):\n\n" + stmt.toHTML(new JavaLanguage()));
//            System.out.println("\nHTML (C++):\n\n" + stmt.toHTML(new CPPLanguage()));
        } else
            System.out.println("Problem statement not valid!");
    }
}

