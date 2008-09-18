<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText{   background-color: #EEEEEE; }
.GAtableText2{   background-color: #FF6600; }
.GAtableText3{   background-color: #FFCC00; }
.GAtableText4{   background-color: #FFFF00; }
.GAtableText5{   background-color: #FFFF99; }

</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right; text-align:right;">
<tc-webtag:forumLink forumID="506105" message="Discuss this article" />
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">C++ tools #2 - GNU Make</span>

      <p>
      <img src="/i/m/sql_lall_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="275640" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

    There's a well-known joke about two women eating lunch at a resort. &quot;The food here is so horrible,&quot; says one. &quot;I know,&quot; replies the other, &quot;and the portions are so small!&quot;
    <br><br>
    There's a somewhat similar paradox that seems to apply to most developers. No matter how much we love what we do, it seems like one of the most enjoyable elements of our work is finding tools that help us do less of it. With their large following, the C++, C#.NET and Java languages are hotbeds of development for these time-saving tools -- for example, some of the tools commonly used  for short cuts and jump-starts in TopCoder component development include: 
    <br><br>
    <table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
        <tr class="sidebarTitle" nowrap="nowrap">
            <td>Type</td>
            <td>Java</td>
            <td>C#.NET</td>
            <td>C++</td>
        </tr>
        <tr class="GAtableText">
            <td>Building</td>
            <td><a href="http://ant.apache.org/" target="_blank">Ant</a></td>
            <td><a href="http://nant.sourceforge.net/" target="_blank">NAnt</a></td>
            <td><a href="/tc?module=Static&d1=features&d2=101206" target="_blank">Makefile</a></td>
        </tr>
        <tr class="GAtableText">
            <td>Documenting</td>
            <td><a href="http://java.sun.com/j2se/javadoc/" target="_blank">javadoc</a></td>
            <td><a href="http://ndoc.sourceforge.net/" target="_blank">NDoc</a></td>
            <td><a href="http://www.stack.nl/~dimitri/doxygen/" target="_blank">doxygen</a></td>
        </tr>
        <tr class="GAtableText">
            <td>Testing</td>
            <td><a href="http://www.junit.org/" target="_blank">JUnit</a></td>
            <td><a href="http://www.nunit.org/" target="_blank">NUnit</a></td>
            <td><a href="/tc?module=Static&d1=features&d2=081406" target="_blank">cppUnit</a></td>
        </tr>
    </table>

    <br><br>
    In this article, I'll review Make, &quot;a tool which controls the generation of executables and other non-source files of a program from the program's source files"
    (according to <a target="_blank" href="http://www.gnu.org/software/make/" target="_blank">GNU Make home</a>).
    Created in 1977, 'make' is a Unix utility which helps developers manage how their applications are built from source code, by giving users the abilty to
    set up source dependancies, add callable shell scripts, and perform many levels of string manipulation. <tt>make</tt> works by building 'target' files, first recursively making
    any of its 'dependancy' targets, while also skipping targets whose dependancies have not changed since the last time they were made -- a useful optimization for large projects/targets.
    The build information is obtained from what is called a 'Makefile', either specified when <tt>make</tt> is run, or using the environment's default file.
    <br><br>
   One version of <tt>make</tt>, 'GNU make', can be found contained within most GNU/Linux distributions. As such, it has become a popular build tool among developers of
    both small and large projects -- if you take a look at many open-source project file-listings, chances are that the ubiquitous 'Makefile' will make an appearance.
    <br><br>

    <span class="bodySubtitle">Example Makefile</span><br />
    Distributions of <tt>make</tt> usually come with their own default Makefile - for instance, if you have a file '<tt>me.cpp</tt>', and type '<tt>make me</tt>',
    it will probably attempt to build your target by automatically running '<tt>g++   me.cpp   -o me</tt>'. However, you can control what make does by providing it with your own Makefile.
    For instance, assume you have the following file in your directory, calling it 'Makefile' (with no extension):<br />

    <pre class="codeBox">
me.o : me.cpp
	@echo "Making object..."
	g++ -Wall -g -c me.cpp

me : me.o
	@echo "Making executable...."
	g++ -Wall -g me.o -o me
	</pre>
    
    Calling '<tt>make me</tt>' should result in an output similar to the following:
    
    <pre class="codeBox">
Making object...
g++ -Wall -g -c me.cpp
Making executable....
g++ -Wall -g me.o -o me
</pre>

    As you can see, <tt>make</tt> has built the 'me' target, by first building the 'me.o' target that it depends on. To build this, it has echoed a message to the screen,
    then run the supplied compilation command. Once this was built, the initial target could then be built by using its given commands.
    <br><br>
    Now......try it again - you should get a message telling you that 'me' is up to date. This is because it is newer than all of its dependencies, so make realizes it does
    not need to be built again. However, if you were to update the timestamp on me.o -- '<tt>touch me.o</tt>', say -- then try to build it again, you would notice that only the
    executable is built, as the object is still more recent than its dependency (me.cpp). This optimized building is a major benefit of Makefiles, and a reason why they are so popular.
    <br><br>

    <span class="bodySubtitle">Makefile structure</span><br />
    All Makefiles have a command setup, as follows:

    <pre class="codeBox">
# comments start with the hash character

# string assignments are simple (name)=(value), for example:
wish=$(mood) Birthday
mood=Happy
name=coder
print=@echo

# each target description  is:
# target(s) : [optional dependency list]
#	command, starting with tab character ('\t')
#	[optional other lines, all starting with tabs]
middle : FORCE
	$(print) -e "$(wish) to you!\n\
	$(wish) dear $(name),"
end finish : FORCE
	$(print) "$(wish) to you!"
beginning start : FORCE
	$(print) "$(wish) to you!"
song : start middle end
FORCE :
</pre>

    Now, running '<tt>make song</tt>' should print out:
    <pre class="codeBox">
Happy Birthday to you!
Happy Birthday to you!
Happy Birthday dear coder,
Happy Birthday to you!
</pre>

    The best way to think about how makefiles work is string replacements -- for example, the command for 'middle' is first joined into one line,
    then <tt>$(print)</tt> is replaced by <tt>@echo</tt>, <tt>$(wish)</tt> by <tt>$(mood) Birthday</tt> by <tt>Happy Birthday</tt>, etc... Finally,
    the whole command <tt>@echo -e "Happy Birthday to you!\nHappy Birthday dear coder,"</tt> is formed, then executed, in a shell.
    <br><br>
    Some things that may be useful to know about structure when writing your own makefiles include:
    <ul>
    <li>Each line of commands is run in its own shell. This means that if you are putting some shell scripts within your commands, you have to
    take care to make sure variables remain in scope.</li>
    <li>To help with this, you can use the slash character '\' to allow single commands to be split across multiple lines (as used above).</li>
    <li>When building a target, all the following lines below it that start with a tab character are run. This means you <b>must</b> start the commands with that
    character -- if your IDE instead inserts spaces, you may have to copy \t from somewhere.</li>
    <li>If you want a particular target rebuilt, you can add an empty target, such as 'FORCE' above. Putting this as a dependency will force a rebuild.</li>
    </ul>

    <span class="bodySubtitle">Programming in Makefiles</span><br />
    As Makefiles contain commands executed in a shell; it is possible to add shell scripts into the command lists, and have these executed when make-ing.
    <br><br>
    However, these may depend on the user running a given shell type -- instead, GNU Make provides its own
    <a href="http://www.gnu.org/software/make/manual/html_node/Functions.html#Functions" target="_blank">Makefile functions</a>, which can help add programming to a makefile. You can
    even define your own functions for use in a makefile. Consider the following file:

<pre class="codeBox">
loop_demo : bash_loop make_loop
bash_loop :
	@echo "Bash loop.."
	@for ((bA=0; bA<10; bA++)); \
		do echo -n "-$${bA}- "; \
	done; echo;

make_loop :
	@echo "Make loop.."
	@echo $(foreach mA, $(sort "1" "4" "2" "8" "5" "7" "9" "3" "6" "0"), "-$(mA)-")
</pre>

    Executing <tt>make</tt> with this at the top of a makefile will give:

    <pre class="codeBox">
Bash loop..
-0- -1- -2- -3- -4- -5- -6- -7- -8- -9-
Make loop..
-0- -1- -2- -3- -4- -5- -6- -7- -8- -9-
</pre>

    Have a read through the files listed at the link above -- the important thing to keep in your head when using them is that they are all string-based,
    and required to be within one set of brackets. It may require a bit of getting used to, but the functions are powerful enough for most purposes -- for example,
    here is a snippet that compiles all .cpp files in a set of directories to .o files in another location. While not necessarily the shortest way to do it, this demonstrates
    the use of a few functions (nested loops, wildcard expansion and pattern replacement):
    
    <pre class="codeBox">
target=$(patsubst $(source_direc)/%.cpp, $(obj_direc)/%.o,$(source))
...
    $(foreach source, \
        $(foreach dir, $(direc_list),$(wildcard $(source_direc)/$(dir)/*.cpp)), \
        echo "compiling" $(source) "to" $(target) "..."; \
        g++ $(source) -c -o $(target) $(LFLAGS); \
    )
    </pre>
    <br />

    <span class="bodySubtitle">Automatic variables</span><br />
    Another useful built-in ability of GNU Make allows you to use wildcards in the targets and dependancies,
    and then reference the files using tokens called '<a href="http://www.student.cs.uwaterloo.ca/~isg/res/unix/make/tutorial/ex_v3.html" target="_blank">automatic variables</a>', including: 
    <ul>
        <li>$* = part matching the wildcards</li>
        <li>$@ = target file name</li>
        <li>$&lt; = the first dependency only</li>
        <li>$^ = space-separated list of dependencies</li>
        <li>$? = space-separated list of dependencies <i>newer</i> than the target</li>
    </ul>
    For example, to compile any *.cpp file into an executable with the same name (as <tt>make</tt> does by default) you can have in your Makefile:
    
    <pre class="codeBox">
% : %.cpp
	g++ -o $* $&lt;
	</pre>
    
    Then running '<tt>make me</tt>' will search for me.cpp, replace the $* with the matching string ('me' in this case) and $&lt; with the dependancy (me.cpp)<br />
    <br />

    <span class="bodySubtitle">Common targets</span><br />
    Due to its frequent use in many distributed projects, there are a few popular <tt>make</tt> targets that can often be found within Makefiles. These include:
    <ul><li><tt>make all</tt> = compile the whole program, usually placed as the first target</li>
    <li><tt>make clean</tt> = remove the files created in this directory when building</li>
    <li><tt>make install</tt> = compile the application and copy files across to desired destintaion, checking for success</li>
    <li><tt>make uninstall</tt> = remove the files created by install</li>
    <li><tt>make dist</tt> = create tar file for distribution, using the program name and version</li>
    <li><tt>make check</tt> = run tests of the code and installation</li></ul>

    <span class="bodySubtitle">Miscellaneous - Make it so</span><br />
    <ol>
        <li>Typing simply 'make' will attempt to build the first target in the Makefile.</li>
        <li>Adding '@' to the start of a command stops <tt>make</tt> from echoing the command before it is run</li>
        <li>Adding '!' to the start of a command means <tt>make</tt> will ignore the return value, so it does not quit if the command fails.
        Otherwise, <tt>make</tt> will terminate on the first command which returns a non-zero value</li>
        <li>There are two '<a href="http://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors" target="_blank">flavors</a>' of make variables,
        which determine how strings are expanded. Most often the default flavor is fine, however you may find cases where using
        simply-expanded variables is required.</li>
        <li>If you ever get the message "*** missing separator.  Stop.", this almost always means a command line somewhere does not start with
        a tab character. Check the beginnings of the line that caused the error to make sure it starts with a tab (rather than, say, spaces). </li>
        <li>Some useful options for make include:<ul>
        <li><tt>-B</tt> to force everything to be rebuilt</li>
        <li><tt>-f FILE</tt> to use a specified Makefile</li>
        <li><tt>-k</tt> to not bail on the first error</li>
        <li><tt>-s</tt> to run in silent mode, not printing commands as they are executed.</li>
        </ul></li>
    </ol>
    <span class="bodySubtitle">Further Reading:</span>
    <ul>
    <li><a href="http://www.gnu.org/software/make/" target="_blank">GNU Make homepage</a></li>
    <li><a href="http://www.gnu.org/software/make/manual/" target="_blank">GNU Make manual</a></li>
    </ul>
<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
