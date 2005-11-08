<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <title>Google&#153; 中国编程精英网罗赛, 竞赛软件由 Topcoder&#174;公司提供</title>
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
                <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gccj05_logo.gif"
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
        <jsp:param name="selectedTab" value="instructions"/>
    </jsp:include>
</div>

<br><br>

<span class="bigTitle">竞赛指南</span>
<span valign=top>
         <jsp:include page="ZH_right.jsp"/>
         </span>

<br><br>
<span class="greenSubtitle">装载竞技平台</span><br>
点击顶部的竞技平台来装载程序。参赛者需要至少 <A href="http://java.sun.com/getjava/index.jsp " target="_blank">Java Runtime version 1.4</A>
来运行平台。来运行平台。如果参赛者还没有安装Java Runtime 1.4，请点击<A href="http://java.sun.com/getjava/index.jsp " target="_blank">这里</A>。
<br><br>
<span class="greenSubtitle">登陆到竞技平台</span><br>
运行竞技平台程序，参赛者就会看到登陆画面。

<br><br>

<div align="center"><img src="/i/events/gccj05/arena1.gif" alt="" border="0"/></div>
<br><br>

这里参赛者只需要键入用户名和密码。登陆后，就会进入聊天主大厅。

<br><br>

<div align="center"><img src="/i/events/gccj05/arena2.gif" alt="" border="0"/></div>
<br><br>

进入参赛者被指定的竞赛房间，如下所示：
<ul>
    <li>点击"Active Contests"菜单项</li>
    <li>选择竞赛</li>
    <li>选择"Enter"</li>
</ul>

<span class="greenSubtitle">竞赛房间</span><br>
从进入竞赛房间开始，参赛者就会看到编码阶段需要完成的竞赛题。

<br><br>

<div align="center"><img src="/i/events/gccj05/arena3.gif" alt="" border="0"/></div>
<br><br>

<span class="greenSubtitle">编码阶段</span><br>
在编码阶段，每位参赛者要独立解答3道竞赛题，竞赛时间的长短随竞赛轮次的不同而不同：
<ul>
    <li>资格赛阶段，编码阶段共计60分钟，从参赛者进入第1题开始计时，共需完成2题。</li>
    <li>进入在线淘汰赛后，编码阶段共计75分钟，参赛者需完成3题。</li>
    <li>现场决赛时，编码阶段共计75分钟，参赛者需完成3题。</li>
</ul>

比赛开始后，要看到竞赛题目，参赛者可以执行以下操作：
<ul>
    <li>点击下拉菜单"Select one"</li>
    <li>选择要答题的分值</li>
</ul>

题目的分数越高，难度越大。参赛者可以以任何顺序打开题目，也可以同时打开所有的题目-但是注意每道题打开后就会开始自动倒计时。参赛者得到每道题的分数是根据完成这道题所耗费的时间而定，参赛者越快提交完成方案，得到的分数就越高。
<br><br>
编码阶段允许参赛者提交多次竞赛题目方案。如果参赛者对一道题目已经交了一份方案后，还愿意再交一份的话，那么这份方案会从参赛者上一次提交所剩的时间开始计时，同时这一题的满分会被扣除10%作为额外的处罚。
<br><br>
在编码阶段，竞赛房间和编码窗口的计时器显示的是竞赛剩余的时间。
<br><br>
<span class="greenSubtitle">编码窗口</span><br>
编码窗口是竞技平台里最重要的一部分，竞赛题目的显示，方案代码的编写、编译、测试以及提交都在这个窗口内进行。

<br><br>

<div align="center"><img src="/i/events/gccj05/arena4.gif" alt="" border="0"/></div>
<br><br>

<blockquote>
    <strong>竞赛题目</strong><br>
    编码窗口的顶部窗格显示了竞赛题目的全部内容。竞赛题目阐述了参赛者需要完成的内容，包括对题目的解释，参赛者解决方案所需用到的类和函数的定义，输入参数的限制，以及有助于说明的样例。
    <br><br>
    <strong>选择编程语言</strong><br>
    此次赛事允许参赛者采用Java，C++，C#，或者Visual
    Basic作为编程语言。参赛者可以逐题选择编程语言，在单场竞赛中也可以用任一编程语言来给出所有解决方案，因此参赛者可以在编程窗口中选择编程语言。编程语言选择区域位于编程窗口右上部，标题为"Choose your
    language"。在编译代码前，参赛者需选择适当的编程语言，选择不当则可能导致错误的编译结果。
    <br><br>
    <strong>创建解决方案</strong><br>
    参赛者在编写解决方案时所建立的类以及所有类的成员都必须定义为"public"，使TopCoder服务器能够访问类成员，并调用适当的函数。下面可以看到Java,C++,C#,Visual Basic的代码模板：
    <br><br>
    <b>Java代码模板</b><br>
    <pre>import &lt;necessary classes&gt;

        public class &lt;class-name&gt; {
        public &lt;return-type&gt; &lt;method-name&gt;(&lt;argument-type&gt; arg1) {
        //your source here
        return &lt;result&gt;;
        }
        }
    </pre>

    <b>C++代码模板</b><br>
    <pre>#include &lt;necessary classes&gt;

        using namespace std; //Required for TopCoder gcc compiler

        class &lt;class-name&gt;
        {
        public:
        &lt;return-type&gt; &lt;method-name&gt; (&lt;argument-type&gt; arg1)
        {
        //your source here
        return &lt;result&gt;;
        };
        };
    </pre>

    <b>C#代码模板</b><br>
    <pre>using &lt;necessary classes&gt;;

        public class &lt;class-name&gt; {
        public &lt;return-type&gt; &lt;method-name&gt;(&lt;argument-type&gt; arg1) {
        //your source here
        return &lt;result&gt;;
        }
        }
    </pre>


    <b>Visual Basic代码模板</b><br>
    <pre>
        Imports &lt;necessary classes&gt;;

        Public Class &lt;class-name&gt;
        Public Function &lt;method-name&gt;(ByVal arg1 As &lt;argument-type&gt;) As &lt;return-type&gt;

        //your source here
        Return &lt;result&gt;
        End Function
        End Class
    </pre>

    <br>

    <strong>编译</strong><br>
    编码窗口中的代码编译在TopCoder服务器上进行。编译时编码窗口内选择的编程语言将会对相应编译器发出编译请求，同时将编码窗口内的代码发送至TopCoder编译器。如果编译成功，参赛者将被提示成功；如果编译失败，失败的错误信息将返回，并在参赛者的编译结果窗口中显示。编译成功所生成的目标文件会被存储在TopCoder的服务器上。任何参赛者进行代码的测试或者提交都会采用最近编译成功的代码。下面是一个Java编译失败的例子：

    <br><br>

    <div align="center"><img src="/i/events/gccj05/arena5.gif" alt="" border="0"/></div>
    <br><br>

    <strong>用户测试</strong><br>
    代码编译成功后，参赛者可以自行测试程序。参赛者可以给出程序输入参数，测试只会显示程序运行的结果，并不会显示此结果正确性。参赛者需凭自己的判断来确定返回结果的正确性。使用试题叙述中的样例进行用户测试对判断参赛者解决方案的正确性提供了很好的参考价值，因为样例会指明对于给定的输入参数所应返回的正确结果。但是，样例并不能代表全面的测试，因为参赛者的代码即使对于所有样例参数输入都有正确的返回结果，也不能代表对其他输入参数同样会有正确的返回结果。参赛者需要考虑更多的边界和临界参数值，并进行测试。如果参赛者的代码对于提供的参数值能够成功运行(没有错误)，相应的运行结果将被返回。如果在执行期间有错误产生，则运行的错误信息将被返回。
    <br><br>
    <i>重要提示：所有提交的代码对任何数据的测试都必须在2秒内完成，否则代码将被标记为错误，参赛者将得不到分数。</i>
    <br><br>
    <strong>注意：</strong>参赛者运行类或函数的任何标准输出(i.e., System.out.println)会和测试结果一同返回。这有助于参赛者调试代码。参赛者也可以在提交代码前去掉这些系统输出，以提高提交的效率。
    <br><br>
    <strong>赛题变量窗口</strong><br>
    参赛者点击编码窗口中的"Test"按钮后，"Problem Arguments"窗口会弹出。

    <br><br>

    <div align="center"><img src="/i/events/gccj05/arena6.gif" alt="" border="0"/></div>
    <br><br>

    参赛者可以通过赛题变量窗口创建测试样例，测试代码。参赛者可以对题目提供的样例进行测试，也可以自行创建测试数据。创建测试数据时，参赛者将在文本输入框中输入数据(对于简单数据类型)。如果变量是一个数组类型(复杂数据类型)，
    参赛者可以按"Create"按钮创建数据。
    <br><br>
    <strong>简单数据类型</strong><br>
    对于所有非数组类型-如整型，长整型，字符型和字符串型-测试输入对话框会让参赛者在指定区域输入数据。数据输入要避免引号或者其他字符。所以，如果要测试字符串"abc"，参赛者应该直接键入abc到输入区域，而不是"abc"。
    <br><br>
    <strong>复杂数据类型</strong><br>
    如果输入项是数组，如int[](C++中的矢量)，测试对话框提供了一个按钮让参赛者创建数组。点击按钮会弹出新的对话框，参赛者可以输入数组元素。这里有2种方式输入数据。最直接的一种是每次输入一个数组元素后点击"+"键(或者敲击enter)，然后输入下一个。按'^'和'v'键可以分别向上和向下移动数组元素。要移除一项可以按'-'键，删除全部项则按'C'键。要调整已经存在的数据项，可以双击条目上的面板数据项，然后进行修改。
    每次添加单个数据项速度很慢，因此有2个功能键能进行批量添加元素。其中较简单的是"++"键。要用这个键，必须先输入所有数据元素，以逗号作为分隔符，然后按"++"键。例如，键入1，3，6，4，然后按"++"就会添加数组{1，3，6，4}。这个键适用于所有类型的数组。另一个批量添加按钮是"{}"。要用这个功能键，须键入数据，写法与源代码中一样。因此，要输入{1，3，6，4}就要先键入{1，3，6，4}，然后点击"{}"。与"++"键相比，这个键似乎没什么优势，其实它的优点在于能够用双引号分割字符串数组，这样就可以直接从赛题声明中复制和粘贴测试样例。例如，要输入字符串数组，{"a"，"b"，"c"}，只要直接键入{"a"，"b"，"c"}，然后按"{}"。如果要在字符串中用字符"或者\，则需要在它们前面插入\。因此，\"代表一个双引号，而\\代表一个反斜杠。例如{"\"\\\""}代表只含一个元素的字符串："\"。"{}"键的优点就在于可以直接从赛题声明中复制任何数组样例，然后通过按键"{}"来创建这样的数组。对于输入数据前后的大括号，它们是可选的，即没有它们，输入功能键{}也同样有效，而没有被双引号括起来的whitespace将被忽略。
    此外，这个对话框对其他数组一样有效。因此，按下"{}"键后，如果数据类型是整型，{1，2，3}会生成一个整型数组{1，2，3}；如果是字符串型，则生成字符串数组{"1"，"2"，"3"}。
    <br><br>
    <strong>提交方案</strong><br>
    参赛者在编译成功后，可以提交方案代码，值得注意的是不论方案正确与否，只要通过编译都可以被提交。越早提交正确的解决方案，得到的分数会越高。方案提交后，不论正确与否，都将给与相应的分数，但在经过系统测试后证明方案有错误，则分数会被扣除。提交的方案不一定是编码窗口内的源代码，但是提交前一定要成功通过编译。
    <br><br>
    参赛者可以对一道题提交多次方案。如果已经交了一份方案后，还是愿意再交一份的话，参赛者的这份方案会从上一次提交所剩的时间开始计时，同时这一题的满分会被扣除10%作为额外的处罚。
    <br><br>
</blockquote>
<span class="greenSubtitle">保存</span><br>
参赛者可以在编码的任何时候保存代码。点击"Save"按钮，当前代码就会被保存在TopCoder服务器上。经常保存可以确保参赛者较新的代码能够备份在服务器上，以防止意外事件的发生(诸如网络断线等情况)。编译代码的同时，代码会自动保存在服务器上。
<br><br>
<span class="greenSubtitle">清除代码</span><br>
点击"Clear"按钮可以快速的清除编码窗口中的代码。只有希望开始另一个新的题目时，才建议选用此功能。警告：一旦清除代码，将无法恢复！
<br><br>
<span class="greenSubtitle">计时器</span><br>
编码窗口的计时器会为当前竞赛倒计时，直至竞赛时间结束。例如在资格赛阶段，计时器会提醒参赛者在1小时的比赛时间内还剩多少时间(从参赛者打开题目时开始计时)。注意在用户机与服务器之间始终存在着延迟，因此，最好在计时器还剩至少30秒的时间内提交解决方案。
<br><br>
<span class="greenSubtitle">挑战阶段</span><br>
(注意：资格赛不包含挑战阶段)
<br><br>
挑战阶段会在编码阶段结束5分钟后开始(中间的五分钟是休息时间)。 挑战阶段会持续15分钟。
<br><br>
在挑战阶段，参赛者可以看到同一房间内其他选手提交的方案源代码。如果认为任一方案存在缺陷，可以针对缺陷给出测试数据，使其返回错误结果。如确实返回错误结果，则挑战成功，挑战者可以获得50分，而对方要扣去分数；相反，返回结果正确的话，则挑战失败，挑战者会被扣除25分。
<br><br>
要挑战其他选手的方案，请在比赛房间内点击"Summary"按钮，打开summary窗口。

<br><br>

<div align="center"><img src="/i/events/gccj05/arena7.gif" alt="" border="0"/></div>
<br><br>

双击任一分数值(绿色显示)来查看提交的方案源码。看到源码后，注意到窗口底部有"Challenge"按钮。Challenge按钮会打开arguments窗口，让参赛者输入测试数据，挑战方案。
<br><br>
参赛者必须确保自己没有负分才可以进行挑战。每个方案只能被成功挑战一次，如果方案已经被挑战成功，那它不能再被挑战。
<br><br>
<span class="greenSubtitle">系统测试阶段</span><br>
挑战阶段后，所有的提交方案都要经过一系列数据测试。例如资格赛时，系统测试会在整个资格赛完成后进行。数据测试会对期望值和返回值进行比较，来决定方案是否通过测试。
<br><br>
<i>提交的方案只要有一项测试不通过，就会被视为错误方案，扣除所有该方案的分数。此外，方案对任一项测试运行时间超过2秒的，也会被判为错误方案，扣除所有分数。</i>.
<br><br>
如果方案通过所有测试，提交方案时所得的分数将被保留。参赛者每轮最终的分数由2部分累计而成，即系统测试后得到分数和挑战阶段得到或扣除的分数的总和。
<br><br>
<span class="greenSubtitle">如果还有什么问题</span><br>
如果参赛者在比赛中对题目或者平台功能仍存在疑问，请进入聊天界面，向竞赛管理人员提出问题，只要在平台程序底部的白色聊天行内输入如下信息即可：
<br><br>
<strong><i>admins:[你的问题]</i></strong>
<br><br>
竞赛管理人员会相应作出解答。
<br><br>
如果参赛者登陆竞技平台存在问题，或者不能进入聊天界面，可以发email至<A href="gcjc@topcoder.com?subject=Question regarding Google Code Jam China">gcjc@topcoder.com</A>。
请在信内详细描述碰到的问题。

<br><br>
想要了解更多的 Google 中国编程精英网罗赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
</div>
</td>
<td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>