package com.topcoder.shared.problem;

/**
 * Constants for use by problem
 */
public class ProblemConstants
{
  public static int MAIN_COMPONENT = 1;
  public static int SECONDARY_COMPONENT = 0;
  public static int JAVA = 1;
  public static int CPP = 3;
  public static int CSHARP = 4;

  /** List of tags not to be outputted when toHTML called. */
  public static String[] XML_ONLY_TAGS = 
          {"tctype",
           "list",
           "fontstyle",
           "heading",
           "special",
           "inline",
           "type",
           "block",
           "flow",
           "type",
           "problem",
           "signature",
           "intro",
           "spec",
           "notes",
           "note",
           "constraints",
           "user-constraint",
           "test-cases",
           "test-case",
           "input",
           "output",
           "annotation",
           "example",
           "name"};
  public static char[] BAD_XML_CHARS = 
          {'<', '>', '&', ':', ';', '\'', '"'};
}
