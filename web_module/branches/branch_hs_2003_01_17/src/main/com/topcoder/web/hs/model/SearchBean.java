package com.topcoder.web.hs.model;

public class SearchBean {

  private final static int MAX_RESULTS_PER_PAGE=15;

  private int prev;

  private int next;

  public SearchBean() {
    prev=0;
    next=15;
  }

  public int getPrev() {
    return(prev);
  }

  public void setPrev(int _prev) {
    prev=_prev;
  }

  public int getNext() {
    return(next);
  }

  public void setNext(int _next) {
    next=_next;
  }

  public int getMaxResultsPerPage() {
    return(MAX_RESULTS_PER_PAGE);
  }

};
