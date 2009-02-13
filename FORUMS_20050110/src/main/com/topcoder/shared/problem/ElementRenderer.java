package com.topcoder.shared.problem;

import com.topcoder.shared.language.Language;

/**
 * Interface for all renderer objects.
 * @author Greg Paul
 */
public interface ElementRenderer {
    /**
     * An <code>ElementRenderer</code> must be capable of transforming the information in
     * its corresponding element into a language-specific HTML fragment.
     *
     * @param language  The language for which the HTML fragment should be generated.  E.g., if the
     *                  language is C++, references to array types should be presented as vector
     *                  template instantiations (a transformation the <code>Language</code> object
     *                  is intended to perform).
     * @return A fragment of HTML
     * @throws Exception if there is a problem instantiating one of the necessary renderers
     */
    String toHTML(Language language) throws Exception;

    /**
     * An <code>ElementRenderer</code> must be capable of transforming the information in
     * its corresponding element into a language-specific plain text fragment.
     *
     * @param language  The language for which the HTML fragment should be generated.  E.g., if the
     *                  language is C++, references to array types should be presented as vector
     *                  template instantiations (a transformation the <code>Language</code> object
     *                  is intended to perform).
     * @return A fragment of HTML
     * @throws Exception if there is a problem instantiating one of the necessary renderers
     */
    String toPlainText(Language language) throws Exception;

    /**
     * Set the element for this renderer.
     * @param element the element
     * @throws Exception if the renderer is not capable of rendering the given element
     */
    void setElement(Element element) throws Exception;
}

