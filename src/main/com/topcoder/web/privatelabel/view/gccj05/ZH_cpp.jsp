<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <title>Google&#153; Code Jam - 中国编程挑战赛, 竞赛软件由 Topcoder&#174;公司提供</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                        alt="Google Coder Jam China logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
<td width="49%">&#160;</td>
<td>
<div class=greenBigBox>

<%-- Tab bar links--%>
<div align="center">
    <jsp:include page="ZH_links.jsp">
        <jsp:param name="selectedTab" value=""/>
    </jsp:include>
</div>

<br><br>

<span class="bigTitle">针对C程序员的TopCoder C++</span>
<span valign=top>
         <jsp:include page="ZH_right.jsp"/>
         </span>

<br><br>
C++是在C语言基础上添加面向对象扩展而成。C++在提供很多传统C语言没有的优点的同时也保持了与C语言的兼容性，这样人们就可以在一个程序中同时使用C和C++。在比赛当中，您必须使用一些基本的C++功能来解答问题。下面我们对熟悉C语言的程序员简单介绍一些参加比赛必须知道的C++知识。
<br><br>
<span class="greenSubtitle">类和方法</span><br>
C++中最重要的新添加概念就是类。类可以包含方法和变量。在比赛时，您必须编写一个包含至少一个方法的类。做为一个例子，请看下面的问题定义：
<br><br>
类：CellTower<br>
方法：best<br>
参数：vector &lt;string&gt;, int, int<br>
返回：int<br>
方法签名：int best(vector &lt:string&gt; towers, int x, int y)<br>
<br><br>
解答这个问题您需要创建一个名为CellTower的类。这个类必须含有一个名为best的方法。方法best必须有三个参数（vector&lt;string&gt;, int, and int）并且返回一个整型（int）值。
<br><br>
类是用class关键字定义的。定义类和定义一个C结构在语法结构上类似。要定义上面那个题目所要求的类，可以使用下面的代码：
<pre>
    class CellTower {
    public:
    int best(vector&lt;string&gt; towers, int x, int y) {
    //您的代码
    }
    };
</pre>
方法的定义方式和定义一个C函数相似。关键字public告诉编译器我们定义的方法任何对象都可以调用。只有这样测试程序才能正确运行您的代码。
<br><br>
<span class="greenSubtitle">STL</span><br>
很多在比赛中经常被使用的类和函数都来自于标准模板库，通常英文缩写为STL。STL提供了一套通用的库，其中包含了从基本的字符处理到复杂的排序算法等各种工具。
<br><br>
参加比赛您必须熟悉至少两个类：vector和string。
<br><br>
<span class="greenSubtitle">包含（Includes）</span><br>
在您使用STL中的类之前，您必须在代码中包含相应的头文件。vector类来自于头文件“vector”；string类来自于“string”。您还需要在代码中加上如下一行： 
<pre>这行告诉编译器到std名字空间中去寻找类。</pre>
<span class="greenSubtitle">Vector</span><br>
vector是C++中用来取代C数组的。vector解决了传统C语言数组的许多问题。vector能查询当前数组大小以及动态调整大小。用 vector<类型> 可以声明vector，其中类型是存储在vector中的变量类型。比如如果您想创建一个包含int的vector，可以使用：
<pre>vector&lt;int&gt; myVar;</pre>
新创建的vector大小为0。声明一个其它大小的vector，您可以使用： 
<pre>vector&lt;int&gt; myVar(10);</pre>
在这个例子中新创建的vector大小为10。
<br><br>
要设置或者读取vector中某一项，您可以使用和C语言中处理数组相似的语法：
<pre>
    vector&lt;int&gt; myVar(10);

    myVar[0] = 1; //设置在位置0的项为1
    printf("%i", myVar[0]); //输出1
</pre>
C语言数组有一个重大缺陷是程序运行时无法知道数组到底有多大。这给循环读取数组中的每一项造成了困难。如果使用vector，这个任务就变得非常容易。size()方法返回vector的当前大小：
<pre>
    for(int i = 0; i &lt; myVar.size(); i++) {
    printf("%i", myVar[i]); //输出第i项
    }
</pre>

使用resize方法可以重新调整vector的大小：

<pre>
    myVar.resize(15); //myvar的大小变成了15
</pre>

vector类提供了其它很多很有用的功能，点击下面的参考链接了解更多关于vector的知识。

<br><br>

<span class="greenSubtitle">字符串（string）</span><br>
string类是用来代替char*表达字符串的。string提供了基本的字符处理并且提供了一个方法让很多使用char*的函数仍旧可以使用string。您可以使用=和+操作符赋值给string：
<pre>
    string s;
    s = "Hello";
    s = s + ", world";
</pre>
s一开始是空字符串（大小为0）。在第二行s的值变为“Hello”。然后“, world”被添加到了s的末端，s的值变成了“Hello, world”。
<br><br>
方法size()返回字符串的长度。这些代码：
<pre>
    string s = "Hello";
    printf("%i", s.size());
</pre>

将会输出5。
<br><br>
您可以象访问char数组一样访问string中的某一个字符：

<pre>
    string s = "Hello";
    printf("%c", s[0]); //输出 "H"
    s[0] = 'h'; //s变成了"hello"
</pre>
如果一个函数要求char*参数，可以使用c_str()方法：
<pre>
    string s = "Hello";
    printf("%s", s.c_str()); //输出 "Hello"
</pre>

<span class="greenSubtitle">解答实例</span><br>
请看下面的例题：
<br><br>
我们的输入程序将记录键盘输入到一个字符序列中。我们想把输入字符序列转换到一个单独的string中以便于日后使用。创建一个方法buildstring。这个方法接受一个vector<char>类型的参数。这个参数代表了键盘的输入序列。buildstring方法必须返回把从这个输入序列合并而成的string。
<br><br>
类: StringBuilder<br>
方法: buildString<br>
参数: vector &lt;char&gt;<br>
返回: string<br>
方法签名: string buildString(vector &lt;char&gt; array)
<br><br>
如下的解答使用string和vector解决了这个问题：

<pre>
    #include&lt;vector&gt;
    #include&lt;string&gt;

    using namespace std;

    class StringBuilder {
    public:
    string buildString(vector&lt;char&gt; array) {
    //创建将要返回的string
    string s;

    //循环读取数组中的每一项
    for(int i = 0; i &lt; array.size(); i++) {
    s = s + array[i];
    }

    //返回创建的string
    return s;
    }
    };
</pre>

<span class="greenSubtitle">额外参考</span><br>
C++和STL类库有几百个函数和类。这些函数和类是用来提高编程速度和效率的。下面列出的参考对我们上面没有讨论到的东西，以及整个C++，提供了简要概述。
<br><br>

C++:<br>
<a href="http://www.cplusplus.com/doc/tutorial/">C++指南</a><br>
<a href="http://www.4p8.com/eric.brasseur/cppcen.html">针对C用户的C++指南</a>
<br><br>
名字空间<br>
<a href="http://www.cplusplus.com/doc/tutorial/tut5-2.html">名字空间指南</a><br>
<a href="http://www-h.eng.cam.ac.uk/help/tpl/languages/C++/namespaces.html">C++名字空间</a>
<br><br>
Vectors:<br>
<a href="http://www.sgi.com/tech/stl/Vector.html">vector参考</a><br>
<a href="http://www.cprogramming.com/tutorial/stl/vector.html">vector类</a>
<br><br>
STL:<br>
<a href="http://www.sgi.com/tech/stl/">STL 程序员指南</a><br>
<a href="http://www.topcoder.com/index?t=features&c=feat_082803">C++标准模板库速成</a>

<br><br>
想要了解更多的 Google&#153; Code Jam - 中国编程挑战赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
</div>
</td>
<td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>