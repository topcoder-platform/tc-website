<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_invit02_links.xsl"/>  
  <xsl:import href="../includes/modules/invit02_rule_links.xsl"/> 
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="180" VALIGN="top">
              <!-- Left Column Include Begins -->  
              <!-- Global Seconday Nav Begins -->  
              <xsl:call-template name="global_left"/>
              <!-- Global Seconday Nav Ends -->      
              <!-- Left Column Include Ends -->          
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->    
    <xsl:call-template name="tournament_invit02_links"/>
    <BR/>      
        <xsl:call-template name="invit02_rule_links"/>
        
  <!-- Coder of the Week Pulldown Ends -->
  <BR/><BR/>
          <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                    <TR>
                      <TD COLSPAN="4" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Online Round #1, Part 2 Seeding (Oct. 10th)</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/index?t=tournaments&amp;c=invit02_pt1" CLASS="statTextBig">View Part 1 Seeding</A></TD>
                    </TR>
            <TR>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">Round #1</TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_rnd2" CLASS="statTextBig"></A>Round #2</TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_rnd3" CLASS="statTextBig"></A>Round #3</TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_rnd4" CLASS="statTextBig"></A>Round #4</TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_semi" CLASS="statTextBig"></A>Semi</TD>  
              <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_champ" CLASS="statTextBig"></A>Champ</TD>                        
            </TR>
                    </TABLE><BR/>
          <TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0" ALIGN="center">
            <TR>
              <TD ALIGN="left" VALIGN="top" CLASS="statText">
[guga]<BR/>
[UoM]!False<BR/>
abaptist<BR/>
Abednego<BR/>
ackbar<BR/>
AdamSelene<BR/>
adrian<BR/>
AI<BR/>
akardell<BR/>
akhil_bansal<BR/>
akhtar<BR/>
alanyu<BR/>
alexn<BR/>
along<BR/>
amadeus082<BR/>
amitc<BR/>
androm<BR/>
Ani<BR/>
anr<BR/>
ante<BR/>
arkin<BR/>
ashoooo<BR/>
ashot<BR/>
astramer<BR/>
atdiehm<BR/>
AuntyJack<BR/>
awana81<BR/>
axiom<BR/>
badass_hacker<BR/>
bah<BR/>
banizar<BR/>
batty<BR/>
bbyard<BR/>
BCSEiny<BR/>
benetin<BR/>
bengle<BR/>
bertjk<BR/>
BigBen79<BR/>
bigg_nate<BR/>
binaryni<BR/>
bingo<BR/>
bir<BR/>
BKewl<BR/>
blaster<BR/>
Blenderkitty<BR/>
bliant<BR/>
BlueTDimly<BR/>
bm999<BR/>
bml137<BR/>
bono<BR/>
bpapa<BR/>
Brainiac<BR/>
brett1479<BR/>
bstanescu<BR/>
bwmitche<BR/>
bwwei<BR/>
ByteMe95<BR/>
C8H10N4O2<BR/>
Cagey<BR/>
callajd<BR/>
CapnPron<BR/>
carambola5<BR/>
CaseWorker<BR/>
cd21<BR/>
cem1834<BR/>
centipede80<BR/>
cgb8176<BR/>
cgu<BR/>
ching<BR/>
chinna145<BR/>
chrisk<BR/>
climbbigrock<BR/>
Clinton<BR/>
coachbudka<BR/>
cocoapi<BR/>
coconut<BR/>
CodeMedic<BR/>
codemonkeyx<BR/>
codePony<BR/>
coderlemming<BR/>
ColinMacLeod<BR/>
coopex<BR/>
coquelicot<BR/>
coshx<BR/>
CowGame<BR/>
crippledhand<BR/>
Crono<BR/>
crypticgujju<BR/>
CSEGod<BR/>
D0SBoots<BR/>
dalzg<BR/>
dangelo<BR/>
darien<BR/>
darkzephyrin<BR/>
Darrell_L_77<BR/>
datakix<BR/>
Debug<BR/>
demodogger<BR/>
derelikt<BR/>
dgoodman<BR/>
diango<BR/>
digitalbeing<BR/>
dimer0<BR/>
dimitrik314159<BR/>
dimkadimon<BR/>
dltc<BR/>
dmh2000<BR/>
Doomhammer<BR/>
dr_matrix<BR/>
drcode<BR/>
dre2xl<BR/>
drsammyb<BR/>
dsp<BR/>
duhone<BR/>
durge<BR/>
dvickrey<BR/>
dzadza<BR/>
dziegler<BR/>
eaglej<BR/>
ecuador33<BR/>
edreisbach<BR/>
eduar09<BR/>
ekogan37<BR/>
Elernet<BR/>
emmpee<BR/>
empraptor<BR/>
Entropy<BR/>
ethaneade<BR/>
etolson<BR/>
eug<BR/>
evd<BR/>
falcon<BR/>
fattom<BR/>
fbplayr78<BR/>
fedevela<BR/>
Firewind<BR/>
FlySkippy1<BR/>
forgothowtocode<BR/>
fpmc<BR/>
frenetic<BR/>
Frostburn<BR/>
fuego<BR/>
Fuzzyb18<BR/>
fvolny4<BR/>
gaav<BR/>
garyk<BR/>
Geeko<BR/>
getzoyan<BR/>
gilbert<BR/>
girir<BR/>
Gladiator<BR/>
gllew<BR/>
gmud<BR/>
gnepp<BR/>              
              </TD>
              <TD ALIGN="left" VALIGN="top" CLASS="statText">
Gojira<BR/>
goongas<BR/>
gopras_ram<BR/>
Goron<BR/>
gorvad<BR/>
GotMilk<BR/>
green<BR/>
gupta35895<BR/>
guruthrill<BR/>
H2Odysee<BR/>
haha<BR/>
harrah<BR/>
harryliu<BR/>
harv<BR/>
hay4man<BR/>
heather<BR/>
helloall<BR/>
heyjude<BR/>
hightide<BR/>
hongping<BR/>
HulkAngry<BR/>
ilaci<BR/>
infrared<BR/>
InsaneProdigy<BR/>
insomnia<BR/>
ironstar<BR/>
Ishi<BR/>
ithil<BR/>
itsouk<BR/>
jasonw<BR/>
java_power<BR/>
jbrandon<BR/>
jburnim<BR/>
jdev<BR/>
jdm42<BR/>
jdwright<BR/>
jeconner<BR/>
jenaex<BR/>
jewphoria<BR/>
jfreyss<BR/>
Jharkeld<BR/>
jholman<BR/>
jignesh<BR/>
jimbo54<BR/>
jimmy<BR/>
jjmoon<BR/>
jlee<BR/>
Jlyer<BR/>
jmcpher<BR/>
jms137<BR/>
joexner<BR/>
johnnyoh<BR/>
jonderry<BR/>
jonmac<BR/>
joycem<BR/>
jrosenhaft<BR/>
jthomas<BR/>
JWizard<BR/>
KaiEl<BR/>
kalmes<BR/>
Karshikinpa<BR/>
kdby<BR/>
Ken Alverson<BR/>
kesteloot<BR/>
kev82<BR/>
kg1866<BR/>
khallas100<BR/>
kinnukpk<BR/>
kokon<BR/>
konsept<BR/>
Koroibos<BR/>
kpsmith<BR/>
krave<BR/>
ksh<BR/>
kv<BR/>
kvin<BR/>
Kwiz7<BR/>
legakis<BR/>
leibniz<BR/>
lgas<BR/>
Liam<BR/>
LinkII<BR/>
LiquidSquid96<BR/>
lkw<BR/>
ll0377<BR/>
Longshot<BR/>
loopy<BR/>
LordHamlet<BR/>
LordM2<BR/>
LunaticFringe<BR/>
Luthor<BR/>
Lynx<BR/>
m_chen<BR/>
Maalus<BR/>
maguar99<BR/>
maikuru<BR/>
Malkyne<BR/>
MaoToYin<BR/>
MarcShapiro<BR/>
markan<BR/>
MarsWarhammer<BR/>
MasterYoda<BR/>
matter<BR/>
mcarland<BR/>
mckavity<BR/>
mecraw<BR/>
Mega<BR/>
meragrin<BR/>
mercury<BR/>
mercury_m<BR/>
metal<BR/>
mezze<BR/>
mhewett<BR/>
milhouse<BR/>
mktong<BR/>
mmsa<BR/>
moira<BR/>
Moloch<BR/>
mongolianBeef<BR/>
MoonRainbow<BR/>
Mosher<BR/>
Mr.APeaEye<BR/>
msuchopper<BR/>
msuhocki<BR/>
mthreat<BR/>
mukund<BR/>
n0vice<BR/>
NDBronson<BR/>
negotiator<BR/>
nemo_d<BR/>
Neon Elephant<BR/>
NgocLan<BR/>
nhan<BR/>
nikesp23<BR/>
Ninjak<BR/>
niranjan<BR/>
O_O<BR/>
obfuscator<BR/>
Oblok<BR/>
om<BR/>
Ozymandias<BR/>
PadawanLearner<BR/>
Partorg<BR/>
pdennis<BR/>
Pegasus<BR/>
peregrine<BR/>
pewloo<BR/>
Phantom<BR/>
philomath<BR/>
pieffe<BR/>
pistol<BR/>
pkidman<BR/>
plit<BR/>
pochmann<BR/>              
              </TD>
              <TD ALIGN="left" VALIGN="top" CLASS="statText">
polgara<BR/>
PongsriBunny<BR/>
Porgery<BR/>
preetham<BR/>
prof<BR/>
PurpleBob<BR/>
pzhao<BR/>
qiui<BR/>
qiumann<BR/>
RachaelLCook<BR/>
rajman007<BR/>
Rakot<BR/>
rdragan<BR/>
redman<BR/>
reiners<BR/>
relnev<BR/>
Revoklaw<BR/>
rfu<BR/>
RocketTeam<BR/>
rogerci<BR/>
router<BR/>
rumbosoft<BR/>
rustyoldman<BR/>
Ryback<BR/>
SamBob<BR/>
sansri<BR/>
sapro<BR/>
satyaravindra<BR/>
Saxophonist<BR/>
scamp<BR/>
schveiguy<BR/>
scn<BR/>
Scorpion1976<BR/>
seaniswise<BR/>
seanmac02<BR/>
seashadow<BR/>
seeisaac<BR/>
Shadowfax<BR/>
shang<BR/>
shechter<BR/>
shengbo2k<BR/>
shrdlu<BR/>
sid6581<BR/>
Sigrid<BR/>
Sigs<BR/>
Sillyboy<BR/>
sillyg00se<BR/>
silvren<BR/>
SimSalaBimmer<BR/>
sinden<BR/>
Sir_haxalot<BR/>
sir_studly<BR/>
skywalker<BR/>
slavik<BR/>
smai<BR/>
smesh<BR/>
Smiley=)<BR/>
smoy<BR/>
smudge<BR/>
SnapDragon<BR/>
Snappleman<BR/>
Snoopbmw<BR/>
sns<BR/>
Soccer9889<BR/>
solaris_always<BR/>
Soli<BR/>
sophisticate<BR/>
Sord<BR/>
SourceCodeDude<BR/>
Spam_vt<BR/>
Sparrow<BR/>
sphere<BR/>
Splat<BR/>
spookynice<BR/>
spugbrap<BR/>
srowen<BR/>
sshakya<BR/>
Steven<BR/>
SteveStern<BR/>
stevietodd<BR/>
StevoD<BR/>
sticky<BR/>
stildripin<BR/>
stipe<BR/>
strider4<BR/>
Sulu<BR/>
sundae<BR/>
swif0ne<BR/>
swimfan<BR/>
Syper<BR/>
sysctrl<BR/>
Tazjam<BR/>
tbone<BR/>
tcdude<BR/>
tck<BR/>
teajay<BR/>
television1<BR/>
tenken<BR/>
thadogg<BR/>
the Speed Bump<BR/>
The Xung<BR/>
the_lark<BR/>
thefink<BR/>
thekcc<BR/>
TheWeb<BR/>
thumper<BR/>
tmarman<BR/>
tnt93<BR/>
TPCoder<BR/>
tperry<BR/>
tph<BR/>
TrekkyLeaper<BR/>
trieuvan<BR/>
tyf<BR/>
udcp<BR/>
UFP2161<BR/>
Ug<BR/>
unlord<BR/>
useless<BR/>
Vaduz<BR/>
valeriy<BR/>
valter_daw<BR/>
vectra14<BR/>
venco<BR/>
veredox<BR/>
VerTek<BR/>
viking<BR/>
volsung<BR/>
WallyWaffle<BR/>
Wasteland<BR/>
Wasyuu<BR/>
wcbarksdale<BR/>
weberchen<BR/>
wf<BR/>
white<BR/>
WhiteShadow<BR/>
wilsondmsft<BR/>
WishingBone<BR/>
WMSplat<BR/>
wolf7<BR/>
WolverineJon<BR/>
Wronkyn<BR/>
wyv<BR/>
Xalles<BR/>
Xcifer<BR/>
XS411<BR/>
Xu Chuan<BR/>
yeehaa99<BR/>
yejun<BR/>
yellow_gecko<BR/>
Z01<BR/>
zhaozhong<BR/>
zhliu<BR/>
zobo<BR/>
ZorbaTHut<BR/>
zorg<BR/>              
              </TD>
            </TR>
            </TABLE><BR/>
            <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                        <TR><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<A HREF="#top" CLASS="statText">Back to top</A></TD></TR>
                    </TABLE>
                    
          <P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
            <!-- Gutter -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
              <!-- Right Column Include Begins --> 
              <xsl:call-template name="public_right_col"/>       
              <!-- Right Column Include Ends -->        
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

