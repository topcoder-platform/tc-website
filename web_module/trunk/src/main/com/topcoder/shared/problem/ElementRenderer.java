package com.topcoder.shared.problem;

import com.topcoder.shared.language.Language;
/**
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
     */
    public String toHTML(Language language);

    /**
     * An <code>ElementRenderer</code> must be capable of transforming the information in 
     * its corresponding element into a language-specific plain text fragment.
     *
     * @param language  The language for which the HTML fragment should be generated.  E.g., if the
     *                  language is C++, references to array types should be presented as vector
     *                  template instantiations (a transformation the <code>Language</code> object
     *                  is intended to perform).
     * @return A fragment of HTML
     */
    public String toPlainText(Language language);

}

