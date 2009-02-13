package com.topcoder.web.corp.view.tces.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;


/**

 * Custom tag that iterates through a collection of Objects

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class IteratorTag

        extends BodyTagSupport {

    // Collection to iterate through

    protected Collection collection;

    // The Collection as an array

    protected Object[] elementArray;

    // index of current element

    protected int index;


    /**

     * Returns the element at the specified index.  Override

     * this function if you need to retrieve something outside

     * of the collection - for example, the collection stores

     * keys, and you want to iterate through the values that

     * those keys map to.  Return null when there is no such

     * element.

     *

     * @param index		the index of the desired element

     *

     * @return Object	the Object at that index - or null if there is no such Object.

     */


    Object getElementAt(int index) {

        if (index < elementArray.length) {

            return elementArray[index];

        } else {

            return null;

        }

    }


    public void setCollection(Collection collection) {

        // if the collection is null, use an empty list

        if (collection == null) collection = new ArrayList();


        this.collection = collection;

        elementArray = collection.toArray();

    }


    public int doStartTag()

            throws JspException {

        index = 0;


        return elementArray.length > 0 ? EVAL_BODY_TAG : SKIP_BODY;

    }


    public void doInitBody()

            throws JspException {

        Object element = getElementAt(index++);

        if (element != null) {

            pageContext.setAttribute(getId(), element);

        }

    }


    public int doAfterBody()

            throws JspException {

        Object element = getElementAt(index++);

        if (element != null) {

            pageContext.setAttribute(getId(), element);

            return EVAL_BODY_TAG;

        } else {

            try {

                if (bodyContent != null) {

                    bodyContent.writeOut(getPreviousOut());

                }

            } catch (IOException e) {

                throw new JspException(e.getMessage());

            }

            return SKIP_BODY;

        }

    }


    public void release() {

        collection = null;

        index = 0;

    }

}

