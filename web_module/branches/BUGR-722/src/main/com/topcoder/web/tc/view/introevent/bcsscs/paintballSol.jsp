<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
            
            <jsp:include page="/page_title.jsp" >
               <jsp:param name="image" value="algorithm"/>
               <jsp:param name="title" value="Introduction Event"/>
            </jsp:include>

            <div style="float:right; margin-top: 6px;"><A href="/tc?module=Static&d1=help&d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></A></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for Paintball</h2>

            <div>
            <strong>
            <A href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=paintball" class="bcLink">Problem Statement</A>
            | Solution
            </strong>
            </div>
<pre>
import java.util.*;
 
public class Paintball {
    class Team implements Comparable&lt;Team&gt; {
        String name;
        int score;
 
        ArrayList&lt;Player&gt; players;
 
        public Team(String name) {
            this.name = name;
            players = new ArrayList&lt;Player&gt;();
        }
 
        public int compareTo(Team o) {
            if (score != o.score) {
                return o.score - score;
            } else {
                return name.compareTo(o.name);
            }
        }
 
        void addScore(String name, int d) {
            score += d;
            for (Player p : players) {
                if (p.name.equals(name)) {
                    p.score += d;
                }
            }
        }
    }
 
    class Player implements Comparable&lt;Player&gt; {
        String name;
        int score;
 
 
        public Player(String name) {
            this.name = name;
        }
 
        public int compareTo(Player o) {
            if (score != o.score) {
                return o.score - score;
            } else {
                return name.compareTo(o.name);
            }
        }
    }
 
    public String[] getLeaderboard(String[] players, String[] messages) {
        Map&lt;String, Team&gt; pt = new HashMap&lt;String, Team&gt;();
        Map&lt;String, String&gt; team = new HashMap&lt;String, String&gt;();
        ArrayList&lt;Team&gt; teams = new ArrayList&lt;Team&gt;();
        for (String s : players) {
            StringTokenizer st = new StringTokenizer(s);
            String nm = st.nextToken();
            String tm = st.nextToken();
            team.put(nm, tm);
            if (!pt.containsKey(tm)) {
                pt.put(tm, new Team(tm));
                teams.add(pt.get(tm));
            }
            pt.get(tm).players.add(new Player(nm));
        }
 
        for (String s : messages) {
            StringTokenizer st = new StringTokenizer(s);
            String n1 = st.nextToken();
            st.nextToken();
            String n2 = st.nextToken();
 
            String t1 = team.get(n1);
            String t2 = team.get(n2);
 
            if (t1.equals(t2)) {
                pt.get(t1).addScore(n1, -1);
            } else {
                pt.get(t1).addScore(n1, 1);
                pt.get(t2).addScore(n2, -1);
            }
        }
 
        Collections.sort(teams);
        ArrayList&lt;String&gt; res = new ArrayList&lt;String&gt;();
        for (Team t : teams) {
            res.add(t.name + " " + t.score);
            Collections.sort(t.players);
            for (Player p : t.players) {
                res.add("  " + p.name + " " + p.score);
            }
        }
        return res.toArray(new String[res.size()]);
    }
 
 
}
</pre>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>