package com.topcoder.shared.problem;

abstract class BaseElement implements Element {
    private ElementRenderer renderer;

    public BaseElement() {
    }

    public void setRenderer(ElementRenderer renderer) {
        this.renderer = renderer;
    }

    public ElementRenderer getRenderer() {
        return renderer;
    }

    /**
     * Utility function for encoding HTML entities in text.  All occurrences of the &lt;, &gt;,
     * and &amp; characters are converted to &amp;lt;, &amp;gt;, and &amp;amp;, respectively.
     */
    static public String encodeHTML(String text) {
        StringBuffer buf = new StringBuffer(text.length());

        for (int i = 0; i < text.length(); i++)
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
        return buf.toString();
    }
}
