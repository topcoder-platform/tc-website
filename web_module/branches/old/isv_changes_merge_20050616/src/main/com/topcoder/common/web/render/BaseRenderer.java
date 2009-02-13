package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.ElementRenderer;

/**
 * base abstract class for applet side renderer objects
 * @author Greg Paul
 */
abstract class BaseRenderer implements ElementRenderer {

    /** List of tags not to be outputted when toHTML called. */
    static String[] XML_ONLY_TAGS =
            {"tctype", "list", "fontstyle", "heading", "special",
             "inline", "type", "block", "flow", "type", "problem",
             "signature", "intro", "spec", "notes", "note", "constraints",
             "user-constraint", "test-cases", "test-case", "input",
             "output", "annotation", "example", "name"};

    static String[] HTML_ONLY_TAGS =
            {"ul", "ol", "li", "tt", "i", "b", "h1", "h2", "h3", "h4",
             "h5", "a", "img", "br", "sub", "sup", "p", "pre", "hr", "list"};

    protected String tdClass;

    public abstract String toHTML(Language language) throws InstantiationException, IllegalAccessException, ClassNotFoundException, Exception;

    public abstract String toPlainText(Language language) throws InstantiationException, IllegalAccessException, ClassNotFoundException, Exception;

    static String encodeHTML(String text) {
        StringBuffer buf = new StringBuffer(text.length());

        for (int i = 0; i < text.length(); i++) {
            switch (text.charAt(i)) {
                case '&':
                    buf.append("&amp;");
                    break;
                case '<':
                    buf.append("&lt;");
                    break;
                case '>':
                    buf.append("&gt;");
                    break;
                case '"':
                    buf.append("&quot;");
                    break;
                default:
                    buf.append(text.charAt(i));
            }
        }
        return buf.toString();
    }

    /**
     * Use the class of the given element to figure out
     * what renderer class should be used.
     * @param element the element that we want to get a renderer for
     * @return the renderer for the given element
     * @throws Exception 1.  if we can't find the renderer class
     * 2. if we can't instantiate it
     * 3. if we're not allowed to access it.
     */
    ElementRenderer getRenderer(Element element) throws Exception {
        ElementRenderer ret;
        String elementClassName = element.getClass().getName().substring(element.getClass().getName().lastIndexOf(".") + 1);
        String rendererClassName = elementClassName + "Renderer";
        String rendererPackage = ProblemRenderer.class.getName().substring(0, ProblemRenderer.class.getName().lastIndexOf("."));

        Class rendererClass = null;
        try {
            rendererClass = Class.forName(rendererPackage + "." + rendererClassName);
            ret = (ElementRenderer) rendererClass.newInstance();
            ret.setElement(element);
        } catch (ClassNotFoundException cnfe) {
            throw new Exception("Could not find class: " + rendererPackage + rendererClassName);
        } catch (InstantiationException e) {
            throw new Exception("Could not instantiate: " + rendererPackage + rendererClassName);
        } catch (IllegalAccessException e) {
            throw new Exception("Illegal Access: " + rendererPackage + rendererClassName);
        }
        return ret;
    }

    /**
     * Go through the given string and remove all the html tags
     * @param text the string to remove the html tags from
     * @return the string without html tags
     */
    static String removeHtmlTags(String text) {

        StringBuffer buf = new StringBuffer(text);
        for (int i = 0; i < HTML_ONLY_TAGS.length; i++) {
            boolean clear = false;
            for (; !clear;) {
                int beginIndex = buf.toString().indexOf("<" + HTML_ONLY_TAGS[i] + ">");
                int endIndex1 = buf.toString().indexOf("</" + HTML_ONLY_TAGS[i] + ">");
                int endIndex2 = buf.toString().indexOf("<" + HTML_ONLY_TAGS[i] + "/>");
                clear = beginIndex < 0 && endIndex1 < 0 && endIndex2 < 0;
                if (beginIndex > -1) {
                    buf.delete(beginIndex, beginIndex + HTML_ONLY_TAGS[i].length() + 2);
                }
                if (endIndex1 > -1) {
                    buf.delete(endIndex1, endIndex1 + HTML_ONLY_TAGS[i].length() + 3);
                }
                if (endIndex2 > -1) {
                    buf.delete(endIndex2, endIndex2 + HTML_ONLY_TAGS[i].length() + 3);
                }

            }
        }

        return buf.toString();
    }

    public String getTdClass() {
        return tdClass;
    }

    public void setTdClass(String tdClass) {
        this.tdClass = tdClass;
    }
}

