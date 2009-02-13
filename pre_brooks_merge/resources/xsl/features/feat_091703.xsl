<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>A Crash Course in the Java Collections Framework</strong></font><br />
                        Wednesday, September 17, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=271144"><strong>goongas</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
On the heels of a recent article by Yarin describing the C++ Standard Template Library, this article will try to quickly teach how to use the Java Collections Framework (JCF) for common Java programming tasks. It does not mention how things work behind the scenes, or when to use which data structure, but instead gives several small code snippets from which one can learn how to use some parts of the JCF.  Many advanced features are omitted.  For more detailed information, see the links at the bottom of the article. 
</p>

<p>
The Java Collections Framework is the standard collection of data structures and algorithms for Java.  A data structure is an object that holds several elements, which can be the same or different class.  (It is not recommended to store elements of different classes in one data strucuture).   The containers covered in this article are ArrayList, HashSet/TreeSet, and HashMap/TreeMap.  Include the following line at the top of code in which you want to use JCF structures: 
</p>

<p>
<pre>
import java.util.*;
</pre>
</p>


<h2>ArrayList</h2>
<p>
An ArrayList corresponds to a one dimensional array. An ArrayList is declared and allocated like this: 
</p>

<p>
<pre>
ArrayList al = new ArrayList();
</pre>
</p>

<p>
The ArrayList above has a size of 0.  The size of an ArrayList is reduced or expanded automatically if needed.  To add elements to an ArrayList, you can use the add method.  (Note: you can only add elements that are objects of a class to JCF data structures.  To add native data types like ints or chars, you must use the corresponding wrapper classes).
</p>

<p>
<pre>
al.add(new Integer(10));
</pre>
</p>

<p>
To replace all the elements in an ArrayList with a new value, you can use the fill method from the Collections class:
</p>

<p>
<pre>
Collections.fill(al, new Integer(25)); //all existing elements are now 25
</pre>
</p>

<p>
Elements in an ArrayList are accessed using the get(int index) method.  For example: 
</p>

<p>
<pre>
int var1 = ((Integer)al.get(0)).intValue();  //retrieves the first element in al and converts it to an int
</pre>
</p>

<p>
Other useful methods in the ArrayList class are:
</p>

<p>
<pre>
int size();                        //Returns the number of elements in the ArrayList
Object remove(int index);          //Removes the element located at the specified index
boolean contains(Object element);  //Returns true if the ArrayList contains element, otherwise false
int indexOf(Object element)        //Searches for the first instance of element and returns its position, 
                                   //or -1 if it is not found
void clear();                      //Removes all elements from the ArrayList
</pre>
</p>

<h2>Sorting an ArrayList</h2>
<p>
An ArrayList can be sorted in ascending order according to the natural order of the elements by using Collections.sort(), as long as the class of the elements implements Comparable:
</p>

<p>
<pre>  
Collections.sort(al);
</pre>
</p>

<p>
To sort in an order you specify and/or to sort classes that do not implement Comparable, you can create a comparator, as in the following example:
</p>

<p>
<pre>
public class DescendingComparator implements Comparator{
   public int compare(Object o1, Object o2) /*descending order*/  {
      if (((Integer) o1).intValue() &gt; ((Integer)o2).intValue()) return -1;
      else if (((Integer) o1).intValue() &lt; ((Integer)o2).intValue()) return 1;
      return 0; /*equal*/
   }
}

Collections.sort(al, new DescendingComparator()); //will sort ArrayList of Integers in descending order
</pre>
</p>

<h2>HashSet/TreeSet</h2>

<p>
A set is used to store non-duplicate, as defined by the equals() method of the class, elements.  A HashSet is unsorted, while a TreeSet is sorted by the natural ordering of the elements or the rules of a comparator.  Examples of declaration and allocation are as follows:
</p>

<p>
<pre>
HashSet hs = new HashSet();
TreeSet ts = new TreeSet(); 
TreeSet ts2 = new TreeSet(new DescendingComparator());  //elements will be sorted in descending order
</pre>
</p>

<p>
To add, remove and check for single elements in a set:
</p>

<p>
<pre>
hs.add(new Integer(7));     //Insert integer 7 in the set
hs.remove(new Integer(5));  //Remove integer 5 (if it exists) from the set
hs.contains(new Integer(7)) //Checks to see if 7 is in the set
</pre>
</p>

<p>
To access elements in a HashSet/TreeSet, you can use an iterator to iterate through the set.  For example:
</p>

<p>
<pre>
Iterator itr = hs.iterator();
int sum = 0;
while (itr.hasNext()) {
   sum += ((Integer)itr.next()).intValue();
}
</pre>
</p>

<p>
You can create an ArrayList from an existing set, and vice versa:
</p>

<pre>
ArrayList al = new ArrayList(hs);
HashSet   hs = new HashSet(al);
</pre>

<h2>HashMap/TreeMap</h2>
<p>
In certain cases, there is a need to store a one-to-one relationship between two elements.  The first element is the key, and the second element is the value.  For example, we may want to lookup someone's age by their last name.   The last name is the key, and the age is the value.  TreeMaps are sorted by the keys, while HashMaps are unsorted.  Below is the code to setup and use a HashMap (the code for a TreeMap is similar).
</p>
<p>
<pre>  
HashMap hm = new HashMap();
hm.put("Smith", new Integer(20)); //Smith is 20
hm.put("Jones", new Integer(23)); //Jones is 23
hm.put("Smith", new Integer(21)); //Smith is now 21, the Smith-20 relationship was overwritten.
hm.get("Smith")                   //will return Integer 21
</pre>
</p>

<p>
 To iterate through the HashMap and obtain the sum of the ages, you can do the following:
</p>

<p>
<pre>
Iterator itr = hm.keySet().iterator();
int age = 0;
while (itr.hasNext())
   age += ((Integer)hm.get(itr.next())).intValue();  //at end of loop age will contain 41
</pre>
</p>
<p>
Other useful methods are containsKey(Object key), containsValue(Object value), and remove(Object key).
</p>

<h2>More about the Java Collections Framework</h2>
<p>
More information about the Java Collections Framework can be found at <a href="http://java.sun.com/products/jdk/1.2/docs/guide/collections/">http://java.sun.com/products/jdk/1.2/docs/guide/collections/</a>.
The API for Java 1.4.2 can be found here at <a href="http://java.sun.com/j2se/1.4.2/docs/api/index.html">http://java.sun.com/j2se/1.4.2/docs/api/index.html</a>.
</p>
                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

