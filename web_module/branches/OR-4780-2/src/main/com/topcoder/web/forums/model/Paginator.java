/*
 * Created on Jul 20, 2005
 */
package com.topcoder.web.forums.model;

import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Page;
import com.jivesoftware.forum.action.util.Pageable;

import java.util.*;

/**
 * A class to make paging of forum content easier. Lists of threads and messages usually need to
 * be paged - using this class from your action or view should reduce the code need for page
 * logic.
 * <p>
 * A paginator represents a set set of pages and a way to tell what the current, previous
 * and next pages are.
 * <p>
 * The getPages()/getPages(int) methods return a "window" of page objects. This makes it possible
 * to easily print out a paginator of 10 pages out of a total of (for example) 279 pages. The
 * window is intelligently computed to be around the current page.
 * <p>
 * Note, this page doesn't maintain a cursor that can be advanced - simply, this class is not
 * an iterator. This class facilitates a paginated view of a set of items at a given point
 * in time.
 */
public class Paginator {

    // A pageable object - this is where we get the basic pagniator data from
    private Pageable pageable;

    // A list of pages in this paginator
    private Page[] pages;

    // The number of pages
    private int numPages = -1;

    /**
     * Creates a Paginator object. Pass in an object that implements the Pageable interface - this
     * gives the class access to collection (the items we're paginating) specific numbers like
     * number of total items, the starting page, etc.
     *
     * @param pageable an object implementing the Pageable inteface.
     */
    public Paginator(Pageable pageable) {
        this.pageable = pageable;
    }

    /**
     * Returns the number of total pages in this pagniator. Note, getPages() returns an array of
     * pages in the current page "window" - the length of that array will not be representative
     * of the total number of pages. This method will return the correct total number of pages.
     *
     * @return the total number of pages in this paginator.
     */
    public int getNumPages() {
        if (numPages == -1) {
            int totalItemCount = pageable.getTotalItemCount();
            int numResults = pageable.getResultFilter().getNumResults();
            numPages = (int)Math.ceil((double)totalItemCount / (double)numResults);
        }
        return numPages;
    }

    /**
     * Returns the underlying pageable object. From this object you can get the result filter
     * object.
     *
     * @return the underlying Pageable object.
     */
    public Pageable getPageable() {
        return pageable;
    }

    /**
     * Returns the starting index at the current point in the list of items.
     *
     * @return the starting index at the current point in the list of items.
     */
    public int getStart() {
        return pageable.getStart();
    }

    /**
     * Returns the index of the current page. The index is 0 based and by default it is 0.
     *
     * @return the index of the current page.
     */
    public int getPageIndex() {
        ResultFilter filter = pageable.getResultFilter();
        if (filter.getNumResults() == 0) {
            return 0;
        }
        return (pageable.getStart()/filter.getNumResults());
    }

    /**
     * Returns true if there is a page of items previous to the current one in the list.
     *
     * @return true if there is a page previous to the current one in the list, false otherwise.
     */
    public boolean getPreviousPage() {
        return getPageIndex() > 0;
    }

    /**
     * Returns the starting index of the previous page. This can be used to calculate
     * the correct values for a previous page of items in a view. So, if the user shows 15 items
     * per page and the current start index is 15 (page 2) then this method will return 0 (which
     * points to page 1).
     *
     * @return the starting index of the prevoius page of items.
     */
    public int getPreviousPageStart() {
        return ((getPageIndex()-1)*pageable.getResultFilter().getNumResults());
    }

    /**
     * Returns true if there is a page of items next to the current one in the list.
     *
     * @return true if there is a page next to the current one in the list, false otherwise.
     */
    public boolean getNextPage() {
        return (getPageIndex()+1) < getNumPages();
    }

    /**
     * Returns the starting index of the next page. This can be used to calculate
     * the correct values for a next page of items in a view. So, if the user shows 15 items
     * per page and the current start index is 15 (page 2) then this method will return 30 (which
     * points to page 3).
     *
     * @return the starting index of the prevoius page of items.
     */
    public int getNextPageStart() {
        return ((getPageIndex()+1)*pageable.getResultFilter().getNumResults());
    }

    /**
     * Returns an array of viewable pages 10 items in length (at most).
     *
     * @see #getPages(int)
     * @return an array (window) of viewable pages 10 items in length (at most).
     */
    public Page[] getPages() {
        // Return 10 viewable pages in the paginator "window".
        return getPages(10);
    }

    /**
     * Returns an array of Page objects representing the pages in a set of items. Each page knows
     * its page number and its starting index in the list of items. A null page represents
     * a buffer or break in the pages - this is a spot where a "..." or "--" could be entered.
     * Example: <tt>1 ... 5 6 7 8</tt>
     *
     * @param numViewablePages the size of the page window.
     * @return an array of Page objects designed to display a item list paginator.
     */
    public Page[] getPages(int numViewablePages) {

        // the pages array is computed lazily:

        if (pages == null) {

            int numResults = pageable.getResultFilter().getNumResults();

            // Determine the maximum number of pages (minimum will always be 1):
            int pageCount = getNumPages();

            int startIndex = getPageIndex();
            int maxPages = (pageCount < numViewablePages) ? pageCount : numViewablePages;
            List pageList = new ArrayList(maxPages);
            // create the list of pages
            for (int i=0; i<maxPages; i++) {
                Page page = new Page();
                page.setNumber(i+startIndex+1);
                page.setStart((i+startIndex)*numResults);
                pageList.add(page);
                // determine if we need to break - this occurs when there are no more
                // actual pages to append
                if ((i+startIndex+2) > pageCount) {
                    break;
                }
            }
            // Work down from the current page (adding pages to the front of the list) if
            // the max number of pages were not added and the new page isn't the first page:
            if (pageList.size() > 0) {
                Page lowestPage = (Page)pageList.get(0);
                while (pageList.size() < maxPages && lowestPage.getStart() != 0) {
                    Page page = Page.getPrev(lowestPage, numResults);
                    pageList.add(0, page);
                    lowestPage = page;
                }
                // Buffer down 2 pages (if we can)
                int count = 2;
                while (count-- > 0 && lowestPage.getStart() != 0) {
                    Page page = Page.getPrev(lowestPage, numResults);
                    pageList.add(0,page);
                    lowestPage = page;
                    if (count == 0 && lowestPage.getNumber() == 2) {
                        count ++;
                    }
                }
                // Add a special spacer page and the first page if the lowest page is > the 3rd page
                if (lowestPage.getNumber()-1 >= 2) {
                    pageList.add(0,null);
                    pageList.add(0, Page.FIRST);
                    }
            }
            pages = (Page[])pageList.toArray(new Page[]{});
        }
        return pages;
    }

}

