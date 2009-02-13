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
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="516594" message="Discuss this article" />
</div>

<span class="bigTitle">An Introduction to Version Control</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

        <span class="bodySubtitle">Introduction</span>
        <p>During my undergraduate courses there were a number of
        group projects. The students in a group would typically mail
        files back and forth, lose them, try to arrange who was going
        to work on which file, work on an old version and accidentally
        lose changes, and generally waste a lot of time and effort on
        managing their collaboration. This is because they didn't know
        about version control, also known as source code management
        (SCM).</p>

        <p>In this tutorial, I'll look at the concepts involved in
        version control, and illustrate them with two open-source
        systems: <a href="http://subversion.tigris.org/">Subversion</a>
        and <a href="http://git.or.cz/">git</a>.</p>

        <p>There are two primary goals of a version control system:</p>
        <ol>
            <li>The entire history of development should be preserved.
            At any time you can go back and find old versions of code,
            see what changed between versions and even who changed it.
            If you've ever ripped out some &ldquo;unneeded&rdquo;

            code, only to find you want it again later, you should
            immediately realize the benefit of this. A version control
            system can do this far better than just making hundreds of
            backup copies.</li>
            <li>It makes collaborative development possible and
            efficient. Changes are never lost just because somebody
            started working on the wrong version of a file, and it's
            possible for multiple people to work on the same codebase
            and have their changes merged together.</li>
        </ol>

        <p>Version control is vital to any large project, but even
        small, short-term projects can benefit. During the TopCoder
        Open, I used version control for marathon match submissions.
        This meant that every submission I made, plus other ideas that
        I tried and discarded, were always there if I needed them, and
        I could see exactly what changes I made between versions.
        Version control can also be used for more than just source
        code; it's just as good for documents, Web pages or anything
        else, although it works best when there are a lot of small,
        textual files rather than a big binary blob like a video.</p>

        <span class="bodySubtitle">Repositories and working copies</span>
        <p>Traditionally, the <em>repository</em> is a central store
        that holds all the files in a project, including every version
        ever committed and all the history. To avoid confusion,
        developers don't work directly on the central repository, but
        on a private copy called the <em>working directory</em>. This
        might just hold the latest copy of all the files, but in some
        cases it can be a complete copy of the entire repository with
        all the history. Developers will make changes in the working
        copy, hopefully test them, and then <em>commit</em> them to
        the repository. Once this set of changes (called a
        <em>revision</em> or a <em>changeset</em>) has been committed,
        other developers can update their working copies to receive
        those changes. What makes collaborative development possible
        is that the downloaded changes are merged with any changes
        that the developer has made (even within the same source file),
        instead of just overwriting them.</p>

        <span class="bodySubtitle">Getting started with Subversion</span>
        <p>Now that the introduction is done, let's get our hands
        dirty with Subversion. We need somewhere to put a repository.
        For distributed development this will need to be on a
        web-accessible server (for example, <a
            href="http://sourceforge.net/">Sourceforge</a> provides
        Subversion hosting for all its projects, but for now let's
        just put it somewhere local. I have a directory called
        <tt>~/svn</tt> in which I put my repositories. It's generally
        a good idea to use separate repositories for unrelated
        projects, so that they can be moved around, backed up, or even
        deleted independently. Let's create a new repository for a
        hello world project:</p>
        <pre class="code">hactar:~/svn$ svnadmin create hello
hactar:~/svn$ svn mkdir file://$HOME/svn/hello/{trunk,branches,tags} -m "Create conventional directories"

Committed revision 1.</pre>
        <p>The first line is straightforward. The next line introduces
        quite a few new things. Firstly, there is the file:// syntax.
        This specifies an URL to a repository, in this case the one we
        just created (Subversion also supports HTTP-based and
        SSH-tunnelled protocols). We have created three subdirectories
        inside the repository called <tt>trunk</tt>, <tt>branches</tt>

        and <tt>tags</tt>. This is a convention specific to
        Subversion, and the reason for it will become clear later. For
        now, we will just do everything inside the trunk subdirectory.
        Finally, there is the "-m" switch. This provides an
        informational message which is attached to the revision, to
        tell anyone browsing the repository what it was for.</p>

        <p>At this stage we don't have a working directory; the
        <tt>mkdir</tt> was run directly on the repository, which is
        why it immediately triggered a commit. Let's check out a
        working directory from the repository. Since we're going to do
        everything in trunk, we only need to check out that sub-tree:</p>
        <pre class="code">hactar:~$svn checkout file://$HOME/svn/hello/trunk hello
Checked out revision 1.</pre>
        <p>The second parameter is the directory name to use locally. We
        now have an empty directory, so let's write and compile
        hello.cpp. An important convention (across all SCM systems) is
        that source code is placed under control of the SCM, but
        object files and executables are <strong>not</strong>. This is
        because they can be regenerated at any time and would just
        waste space in the repository, as well as causing extra noise
        for anyone trying to follow what really changed over time. So
        we need to tell Subversion that we want it to manage
        <tt>hello.cpp</tt>. It will also keep reminding us about
        <tt>hello</tt> until we tell it not to:</p>

        <pre class="code">hactar:~/hello$ svn add hello.cpp
A         hello.cpp
hactar:~/hello$ svn propedit svn:ignore .
Set new value for property 'svn:ignore' on '.'</pre>
        <p>Different version control systems have different means of
        storing <dfn>metadata</dfn>: information that should be stored
        in the repository (in this case, a list of wildcards to
        ignore), but which aren't files. In Subversion the metadata
        takes the form of properties. When I issued the <kbd>svn
            propedit</kbd> command, Subversion opened an editor and I
        put <kbd>hello</kbd> in the temporary file it opened for me.
        The special <tt>svn:ignore</tt> property is now set on the
        directory itself. Let's see where that puts us:</p>

        <pre class="code">hactar:~/hello$ svn status
 M     .
A      hello.cpp</pre>
        <p>This is a handy way to see what you've changed, relative to
        what is saved in the repository. Subversion is telling us that
        we've made a property alteration on <tt>.</tt> and added a new
        file <tt>hello.cpp</tt>. If you had run this before setting
        the property, you would have seen another line</p>
        <pre class="code">?      hello</pre>
        <p>To warn you that you hadn't put <tt>hello</tt> under
        version control. That all looks good, so let's commit it to
        the repository:</p>

        <pre class="code">hactar:~/hello$ svn commit -m "First version of hello world"
Sending        .
Adding         hello.cpp
Transmitting file data .
Committed revision 2.</pre>
        <p>The file is now saved in the repository, and anyone else
        who checks out the repository will be able to see this
        version. Even if we overwrite it later, we can always retrieve
        this version. Now, let's edit the file and see what
        happens:</p>
        <pre class="code">hactar:~/hello$ svn status
M      hello.cpp
hactar:~/hello$ svn diff
Index: hello.cpp
===================================================================
--- hello.cpp   (revision 2)
+++ hello.cpp   (working copy)
@@ -1,5 +1,7 @@
 #include &lt;iostream&gt;
+using namespace std;
 int main()
 {
-    std::cout &lt;&lt; "Hello world\n";
+    cout &lt;&lt; "Hello world\n";
+    return 0;
 }
 </pre>
        <p>Here we've introduced a new sub-command: <tt>svn diff</tt>.
        By default this shows what you've changed relative to the
        <dfn>base</dfn> version, which is the version that you checked
        out of the repository (which may not be the same as the
        latest, or <dfn>head</dfn> version, if somebody has since made
        changes that you haven't downloaded). Many of the Subversion
        commands, including diff, can also take extra arguments to
        refer to specific versions in the repository, so that you can
        compare any two revisions.</p>

        <p>Now, what if somebody else was working on
        <tt>hello.cpp</tt> at the same time? Before we commit this
        change, I'm going to commit another change to this file from
        outside. In order to see this change here, we have to update
        our working copy from the repository. This is as simple as
        running</p>
        <pre class="code">hactar:~/hello$ svn update
G    hello.cpp
Updated to revision 3.</pre>
        <p>The G here is Subversion's way of telling us that it merged
        an external change with one of our own. As long as changes do
        not overlap, version control systems will automatically merge
        them together, and they will also assist in merging
        conflicting changes (but note that only changes that overlap
        are considered to be conflicting; high-level changes like
        changing the name of a variable might not conflict, but still
        lead to compilation failures).</p>

        <p>Working within files is relatively straightforward, but
        what about rearranging files, creating directories and so on?
        Subversion was created as a replacement for an older, messier
        system called CVS (Concurrent Version System) which did a very
        poor job of this; Subversion handles it quite well. You just
        have to tell Subversion to do things, rather than using the
        shell:</p>

        <pre class="code">hactar:~/hello$ svn mv hello.cpp helloworld.cpp
A         helloworld.cpp
D         hello.cpp</pre>
        <p>Subversion handles a move as a copy and a deletion. It also
        handles copies in a special way: internally a copy takes zero
        space, because it uses a pointer back to the original, and it
        also remembers that the file was copied and allows the version
        history to be traced back through the original file. For
        example:</p>
        <pre class="code">hactar:~/hello$ svn commit -m "Rename hello.cpp to helloworld.cpp"
Deleting       hello.cpp
Adding         helloworld.cpp

Committed revision 5.
hactar:~/hello$ svn log helloworld.cpp
------------------------------------------------------------------------
r5 | bruce | 2007-06-12 18:36:45 +0200 (Tue, 12 Jun 2007) | 1 line

Rename hello.cpp to helloworld.cpp
------------------------------------------------------------------------
r4 | bruce | 2007-06-12 18:34:02 +0200 (Tue, 12 Jun 2007) | 1 line

Use standard namespace
------------------------------------------------------------------------
r3 | bruce | 2007-06-12 18:26:21 +0200 (Tue, 12 Jun 2007) | 1 line

Add a comment
------------------------------------------------------------------------
r2 | bruce | 2007-06-12 18:17:27 +0200 (Tue, 12 Jun 2007) | 1 line

First version of hello world
------------------------------------------------------------------------
</pre>
        <p>The <tt>log</tt> sub-command browses the log messages that
        I've been attaching to each commit. As you can see here, it
        remembers the comments I made even when the file was called
        <tt>hello.cpp</tt>.

        <p><span class="bodySubtitle">Alternative interfaces</span></p>

        <p>I've been giving all the examples using the command line
        <tt>svn</tt> tool, because it's easy to copy-and-paste into
        this tutorial, and because I'm happiest on the command line
        and so this is how I usually interact with Subversion.
        However, there are third-party interfaces for those that
        think the shell belongs in the stone age. There are several
        standalone clients (for example, <a
            href="http://rapidsvn.tigris.org">RapidSVN</a>),
        a Windows shell extension, <a
            href="http://tortoisesvn.tigris.org">TortoiseSVN</a>, and
        extensions for some IDEs, such as <a
            href="http://subclipse.tigris.org/">Subclipse</a> for
        integration into Eclipse.</p>

        <span class="bodySubtitle">Advanced features</span>

        <p>Armed with only the information you've seen so far, plus a
        Subversion manual (there is a very good online <a
            href="http://svnbook.red-bean.com/">book (FIXME)</a>, you
        should already be able to improve your productivity in group
        projects, and give yourself piece of mind in personal projects
        that you can always go back and recover previous versions of
        code.</p>

        <p>However, for large-scale projects, there are even more
        things that a good version control system can do for you. For
        the basics, there isn't a lot of difference between the
        systems, but these advanced features are handled quite
        differently and these needs will often determine which system
        is right for your needs.</p>

        
        <p><b>Hooks</b><br />
        I've already mentioned that you need to specifically ask for
        changes to be sent to your working copy. That is generally a
        good thing, because it means that you can control when gobs of
        in-progress code will get dumped on your tree and force you to
        handle conflicts. However, you might want to be kept informed
        of changes that other people make, so that you know as soon as
        a change that you need has been committed. A
        <dfn>post-commit</dfn> hook is a script that is run on the
        server immediately after each commit; the most common use is
        to generate an automatic email to the developer mailing list
        with the commit message and a summary of the files that were
        changed. Other uses include kicking off automated test suites,
        taking backups, and extracting documentation for a
        website.</p>

        <p>Another type of hook is a pre-commit hook. This is run
        when someone attempts to commit, and is usually some form of
        verifier. It might provide fine-grained access control,
        validate checked-in web-pages, or ensure that the commit
        message contains a bug number.</p>

        <p>Subversion has a number of other types of hooks, and
        examples for all of them. The hooks live inside the directory
        structure of the repository. Let's add a simple hook that
        prevents code from being accidentally committed when it still
        has FIXME notes in it. Normally we would need some more
        powerful scripting to find all the source files, but to keep
        it simple we'll just hardcode it:</p>
        <pre class="code">hactar:~/hello$ cat ~/svn/hello/hooks/pre-commit
#!/bin/sh
if /usr/bin/svnlook cat -t "$2" "$1" "trunk/helloworld.cpp" | grep -q FIXME; then
  echo "FIXME's found in helloworld.cpp" 1&gt;&amp;2
  exit 1
fi
hactar:~/hello$ svn commit -m "Test the pre-commit hook" helloworld.cpp
Sending        helloworld.cpp
Transmitting file data .svn: Commit failed (details follow):
svn: 'pre-commit' hook failed with error output:
FIXME's found in helloworld.cpp</pre>


        <p><b>Tagging, branching and merging</b><br />
        Remember that we started by creating subdirectories called
        <kbd>trunk</kbd>, <kbd>branches</kbd> and <kbd>tags</kbd>? The
        time for the explanation has come. However, git handles these
        concepts in a more integrated fashion than Subversion, so at
        this point I'm going to switch to git for examples.</p>

        <p>git handles the basics along similar lines to other
        version control systems, but there is one fundamental
        difference in philosophy: there is no distinction between a
        repository and a working directory. When you check out a
        working directory from a public repository, you are in fact
        copying the entire repository. As a result, you have all the
        advantages of version control, even if you are offline, or
        have only read access to the original repository. This makes
        it attractive for highly decentralised projects, where
        a subgroup can collaborate in a satellite repository and only
        push changes back to the main repository when they have
        stabilised. git is best-known as the version control system
        used to develop Linux.</p>

        <p>This is all very interesting, but what are tagging,
        branching, and merging? Tagging is the simplest: it allows one
        to assign a human-readable name to a specific revision in a
        repository. You may have noticed that Subversion allocates
        sequential numbers to revisions, but it's hard to remember
        that version 0.9.3 of the software corresponds to revision
        number 1346, and it becomes even worse with git, which
        identifies revisions by long hex strings. For
        example, let's suppose that in the past we made a tag
        <kbd>v1.0.0</kbd> on the initial version. We've now made a lot
        of changes to the repository, and we're going to release
        1.0.1. Sometime in the future, we may wish to see what exactly
        changed between the releases, for example to isolate a bug
        that was introduced in v1.0.1:</p>
        <pre class="code">hactar:~/hello-git$ git tag -a -m "Tag the v1.0.1 public release" v1.0.1
<em>Now we make lots more changes</em>
hactar:~/hello-fit$ git diff v1.0.0..v1.0.1
diff --git a/helloworld.cpp b/helloworld.cpp
index 2b20ba6..3b18807 100644
--- a/helloworld.cpp
+++ b/helloworld.cpp
@@ -1,6 +1,7 @@
 /* This is a hello world program */
-/* FIXME: Fix  the whitespace */
+
 #include &lt;iostream&gt;

+
 using namespace std;
 int main()
 {</pre>

        <p>Tagging is fairly straightforward, although git has some
        extra features (like signing) that I won't elaborate on.
        Branching is more complex. Let's suppose that you've
        released version 1.0 of your software, and you're busy
        rewriting large pieces of it to get them ready for version
        2.0. However, you still need to fix bugs in 1.0, because 2.0
        isn't going to be ready for several years. At this point, your
        code development diverges, or <em>branches</em> in two
        separate directions: a 2.0 branch which is under
        heavy development, and a 1.0 maintainence branch which only
        receives bug-fixes. Or perhaps one module in the 2.0
        development is going to take a few weeks to write, during
        which time it will cause problems for other developers working
        on other pieces of 2.0. In this case, you might work on that
        module in a side branch until it is ready for inclusion in the
        main 2.0 branch. At that point you will need to <em>merge</em>
        those changes into the main branch. While developing the side
        branch, you may also need to incorporate changes from the main
        branch, or even bug-fixes being made in the 1.0 branch.</p>

        <p>That's a fairly extreme case. Let's try something simpler
        with our hello world program. We're going to use a side branch
        to convert it to use cstdio.</p>

        <pre class="code">hactar:~/hello-git$ git status
# On branch master
nothing to commit (working directory clean)
hactar:~/hello-git$ git branch cstdio
hactar:~/hello-git$ git checkout cstdio
Switched to branch "cstdio"
hactar:~/hello-git$ vi helloworld.cpp 
hactar:~/hello-git$ git commit -a -m "Converted to cstdio"
Created commit 3d6a30bc37c106d598e6e1fd8a049367b1dac231
 1 files changed, 2 insertions(+), 2 deletions(-)</pre>
        <p>Creating a branch is that simple. Let's go back to the main
        branch (which is called <kbd>master</kbd> and make a change
        there, then merge it over to the side branch:</p>
        <pre class="code">hactar:~/hello-git$ git checkout master
Switched to branch "master"
hactar:~/hello-git$ vi helloworld.cpp 
hactar:~/hello-git$ git commit -a -m "Update the comment"
Created commit 2c7afa153383d275f27ce3ac04375cc78789e3b0
 1 files changed, 1 insertions(+), 1 deletions(-)
hactar:~/hello-git$ git checkout cstdio
Switched to branch "cstdio"
hactar:~/hello-git$ git merge --no-commit master
 100% (5/5) done
Auto-merged helloworld.cpp
Automatic merge went well; stopped before committing as requested
bruce@hactar:~/hello-git$ git status
# On branch cstdio
# Changes to be committed:
#   (use "git reset HEAD &lt;file&gt;..." to unstage)
#
#       modified:   helloworld.cpp
#
hactar:~/hello-git$ git commit -a -m "Merge the comment change from master"
Created commit 74bd3f2107fec7ab0d12d640e29bc901d75f1888
hactar:~/hello-git$ git merge --no-commit master
Already up-to-date.</pre>
        <p>The last command indicates that git has remembered which
        changes on master have already been merged, and it doesn't try
        to merge them again. This is in contrast to Subversion, which
        requires the user to keep track of which merges have been
        applied. On the other hand, git appears to have some trouble
        with renaming: I initially tried to do this example by
        renaming the file to <tt>helloworld.c</tt> in the side branch,
        but then the merge failed because it tried to apply the change
        to the <tt>.cpp</tt> file, which had been deleted.</p>

        <p><span class="bodySubtitle">Conclusions</span></p>
        <p>If you've never used a version control system, go out and
        try one for your next project, or even your next marathon
        match. Once you're comfortable working with it, it will give
        you incredible piece of mind to know that you can rip out old
        code and not worry about losing it forever, and you will have
        learned a vital skill for the workplace.</p>
<br>

<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
