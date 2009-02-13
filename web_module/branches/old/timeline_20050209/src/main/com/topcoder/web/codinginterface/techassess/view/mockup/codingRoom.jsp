<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
         <jsp:param name="tabLev1" value="login"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="remaining"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT>&#160;</td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- CONTENT --%>
            <td class=bodyContent>
            
            <table cellspacing=0 cellpadding=0 border=0 width="100%">
               <tr>
                  <td align=left><span class=bodySmallTitle>Problem Statement</span></td>
                  <td align=right>
                  Choose your language: 
                  <input type="radio" name="language" value="java">&#160;Java&#160;
                  <input type="radio" name="language" value="cplus">&#160;C++&#160;
                  <input type="radio" name="language" value="csharp">&#160;C#&#160;
                  </td>
               </tr>
            </table>

            <iframe src="/i/corp/screening/probState.html" width="100%" height="200px" scrolling="auto" frameborder="1">
            [Your user agent does not support frames or is currently configured not to display frames. However, you may visit <a href="/i/corp/screening/probState.html">the related document.</a>]
            </iframe>

            <br/><br/>
            <p class=pL><span class=bodySmallTitle>Input Area</span></p>
            <textarea class=codingArea name="code" rows="20" cols="40" wrap="off">
using System;
using System.Collections;
using System.Text.RegularExpressions;

public class Cyberline 
{
  public string lastCyberword(string cyberline) 
  {
    string ret = "";
    //string strOK = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    char[] work = cyberline.ToCharArray();
    int length = work.Length;
    int x;
    for(int i = 0; i < length; ++i)
    {
      int dum = 0;
      char ch = work[i];
      if('a' <= ch && ch <= 'z')
        dum = 1;
      else if('A' <= ch && ch <= 'Z')
        dum = 1;
      else if('0' <= ch && ch <= '9')
        dum = 1;
      else if(ch == '-')
        dum = 1;
      else if(ch == '@')
        dum = 1;
      else
        work[i] = ' ';
      x = dum;
    }

    string w2 = new String(work);
    w2 = w2.TrimStart();
    w2 = w2.TrimEnd();
    string[] words = w2.Split(" ".ToCharArray());
    int numWords = words.Length;

    bool bFound = false;
    int index = 0;
    int use = 0;
    for(index = numWords - 1,bFound = false; index >=0 && !bFound; --index)
    {
      bool bWordOK = false;
      string testWord = words[index];
      length = testWord.Length;
      for(int i = 0; i < length; ++i)
      {
        char ch = testWord[i];
        if('a' <= ch && ch <= 'z')
          bWordOK = true;
        else if('A' <= ch && ch <= 'Z')
          bWordOK = true;
        else if('0' <= ch && ch <= '9')
          bWordOK = true;
        else if(ch == '@')
          bWordOK = true;
      }

      if(bWordOK)
        bFound = true;

      if(bFound)
        use = index;
    }

    ret = words[use];

    // remove all -
    while((index = ret.IndexOf('-')) > 0)
      ret = ret.Remove(index,1);

    // rules to make a word

    return ret;  
  }
}
            </textarea>

            <br /><br />

            <table cellspacing=0 cellpadding=0 border=0 class=codingButtons>
               <tr>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonResize.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonFind.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonGoTo.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonSave.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonCompile.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonTest.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonClear.gif" alt="" /></a></td>
                  <td><a href="/mockup/exampleDirections.jsp"><img src="/i/corp/screening/buttonClose.gif" alt="" /></a></td>
                  <td><a href="/mockup/exampleDirections.jsp"><img src="/i/corp/screening/buttonSubmit.gif" alt="" /></a></td>
               </tr>
            </table>

            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>