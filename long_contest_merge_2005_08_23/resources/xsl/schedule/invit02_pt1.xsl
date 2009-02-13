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
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
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
                      <TD COLSPAN="4" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Online Round #1, Part 1 Seeding (Oct. 8th)</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/index?t=schedule&amp;c=invit02_pt2" CLASS="statTextBig">View Part 2 Seeding</A></TD>
                    </TR>
						<TR>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Round #1</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_rnd2" CLASS="statTextBig"></A>Round #2</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_rnd3" CLASS="statTextBig"></A>Round #3</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_rnd4" CLASS="statTextBig"></A>Round #4</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_semi" CLASS="statTextBig"></A>Semi</TD>	
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_champ" CLASS="statTextBig"></A>Champ</TD>												
						</TR>
                    </TABLE><BR/>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0" ALIGN="center">
						<TR>
							<TD ALIGN="left" VALIGN="top" CLASS="statText">
[ucf]entity<BR/>
[UoM]Icenine<BR/>
acebruin<BR/>
acs<BR/>
adamdonell<BR/>
adxm<BR/>
ahmedf<BR/>
ajuckel<BR/>
alanm<BR/>
AleaActaEst<BR/>
Alexandre<BR/>
alexis<BR/>
alkinoos<BR/>
Alonzo1980<BR/>
alroy<BR/>
alteco<BR/>
amatus<BR/>
ambrose<BR/>
amonroe<BR/>
amorosov<BR/>
anan<BR/>
Annie29<BR/>
anniehuang<BR/>
Antilochus<BR/>
apothas<BR/>
argolite<BR/>
Arremoon<BR/>
arul<BR/>
assembler<BR/>
Austinite<BR/>
axch<BR/>
axchma<BR/>
aycock<BR/>
b0b0b0b<BR/>
Baldrick<BR/>
BanjoBill<BR/>
Banzif<BR/>
barwin<BR/>
bcurren<BR/>
BDouglass<BR/>
Belzedar<BR/>
Bender<BR/>
benny<BR/>
Betelgeuse<BR/>
bfields<BR/>
bgalbs<BR/>
BigDaddy<BR/>
billyf19<BR/>
BitConductor<BR/>
bjeans<BR/>
bkus<BR/>
blowfish<BR/>
bmeruva<BR/>
bodrius<BR/>
bokbok<BR/>
bondjames_12<BR/>
boydp<BR/>
BPMan<BR/>
Braindead<BR/>
Brian<BR/>
buddhad<BR/>
C0d3phr3ak<BR/>
cad8<BR/>
Callamon<BR/>
Catalepsy<BR/>
cbthiess<BR/>
ccooper<BR/>
chandan<BR/>
ChickenHelper<BR/>
chinna<BR/>
chip33550336<BR/>
ChuBerto<BR/>
cintamani<BR/>
ck<BR/>
ckwood<BR/>
claw<BR/>
Cmav<BR/>
CodeWizard<BR/>
ConleyVI<BR/>
coolcoder<BR/>
Corrinado<BR/>
Cougar<BR/>
cperkins<BR/>
crackpot<BR/>
CrazyPenguin<BR/>
cristi<BR/>
cvip11<BR/>
Da Twink Daddy<BR/>
dacurran<BR/>
dan202<BR/>
dana<BR/>
dandarc<BR/>
danno<BR/>
danwyand<BR/>
darkmanjs<BR/>
darkphantom<BR/>
DarthParadox<BR/>
daveagp<BR/>
dcros<BR/>
ddwsdl<BR/>
debaser<BR/>
delman16<BR/>
dewmeht<BR/>
dgarthur<BR/>
DigitalQuark<BR/>
dislyxec<BR/>
DjinnKahn<BR/>
dleary<BR/>
dlenharth<BR/>
dmc<BR/>
dmwright<BR/>
doeth<BR/>
dpecora<BR/>
dpgdogg<BR/>
dpuza<BR/>
DreamShake<BR/>
DrewHudson<BR/>
dukeola<BR/>
eattrig<BR/>
Echo<BR/>
edragon<BR/>
emcee<BR/>
ender_wiggin<BR/>
enderx<BR/>
EnoOn<BR/>
Epitel0920<BR/>
EtherMage<BR/>
eventually<BR/>
Farlox<BR/>
FatAlbert<BR/>
fenrir28<BR/>
fenris<BR/>
ff<BR/>
Fingers<BR/>
fkim<BR/>
flip_da_bits<BR/>
flozell<BR/>
flyeagles<BR/>
foa<BR/>
FogleBird<BR/>
FooDaddy<BR/>
FrodoB<BR/>
FunOrPain<BR/>
Gaganc<BR/>
garner11<BR/>
Garzahd<BR/>
gaul<BR/>
georgewsu<BR/>
gettext<BR/>
gladius<BR/>
glenn374<BR/>
gmenhorn<BR/>
gmoney7<BR/>
GOD<BR/>							

							</TD>
							<TD ALIGN="left" VALIGN="top" CLASS="statText">
Gold Rider<BR/>
GooBeR<BR/>
Googly<BR/>
gorsuch<BR/>
gpn<BR/>
gray_nick<BR/>
greyhound<BR/>
guntoad<BR/>
HadesDev<BR/>
halflife<BR/>
Hao<BR/>
hcloud<BR/>
helloworldX<BR/>
henchq<BR/>
Hevelius<BR/>
hevilt<BR/>
hilfiger<BR/>
hilgart<BR/>
HNT<BR/>
HoldMeDown<BR/>
Holgrave<BR/>
honda89dude<BR/>
huazai<BR/>
hunsaker<BR/>
huntergt<BR/>
ifndef<BR/>
ilya<BR/>
imfurry<BR/>
indigo9<BR/>
InGoodTime<BR/>
irulet<BR/>
ivarneli<BR/>
ivern<BR/>
j-dub<BR/>
jaivasanth<BR/>
jap4524<BR/>
jayberkenbilt<BR/>
jcg3<BR/>
jdepree<BR/>
Jeffa<BR/>
jemann75<BR/>
jerahian<BR/>
jerm<BR/>
jerryc<BR/>
jerschneid<BR/>
jhedlund<BR/>
JHui<BR/>
jlrc<BR/>
jmarron<BR/>
Joe<BR/>
John Dethridge<BR/>
johngu<BR/>
johnm4<BR/>
jonboy<BR/>
josh<BR/>
jovian<BR/>
jshute<BR/>
JuanitoBandito<BR/>
Jumping John<BR/>
JustinJM<BR/>
jwaugh<BR/>
kasper<BR/>
kdale013<BR/>
keesoo<BR/>
Kelbesque<BR/>
Kniht<BR/>
Knite<BR/>
ko-alex<BR/>
koder<BR/>
koehrsen<BR/>
kolanovic<BR/>
kousen<BR/>
ksdaya<BR/>
kshumard<BR/>
KurtSteinkraus<BR/>
kyky<BR/>
kyotov<BR/>
lanenal<BR/>
Larry<BR/>
lars<BR/>
Lawrence444<BR/>
Laz<BR/>
LazerWonder<BR/>
leadhyena_inran<BR/>
leelin<BR/>
LeppyR64<BR/>
Levendis<BR/>
lightnin<BR/>
Liguo<BR/>
linuxsurfer<BR/>
lirik<BR/>
Logan<BR/>
lx<BR/>
Mackin<BR/>
madking<BR/>
magead7<BR/>
Malaika<BR/>
malpt<BR/>
mannix<BR/>
MapleLeaf<BR/>
marmaros<BR/>
Marvin<BR/>
MastaBryanChen<BR/>
mathgodleo<BR/>
matrix0040<BR/>
maumoondoggie<BR/>
Max Entropy<BR/>
maximuscranius<BR/>
maxjenius<BR/>
maxx<BR/>
mbarb<BR/>
mc^2<BR/>
MEEP!<BR/>
memetic<BR/>
merolish<BR/>
mickj<BR/>
mickle<BR/>
mike0625<BR/>
Min,lu<BR/>
mitalub<BR/>
mkoenn<BR/>
mlev<BR/>
Moab4x<BR/>
monteith<BR/>
Moose<BR/>
mortijingle<BR/>
moshecristel<BR/>
mozhiyan<BR/>
mpa<BR/>
mpb<BR/>
Mr. Sketch<BR/>
mr_calamari<BR/>
mrdad2u<BR/>
myiope<BR/>
Mysid<BR/>
nadler<BR/>
nate_d<BR/>
ned<BR/>
NeoTuri<BR/>
NeutralParity<BR/>
newlife(void)<BR/>
niceCode<BR/>
nick_19<BR/>
nigelhenry<BR/>
nikita<BR/>
Niller<BR/>
Nimdok<BR/>
Nok<BR/>
nonane<BR/>
nrogers<BR/>
nsmunshi<BR/>
ntrhieu<BR/>
objects<BR/>
olegh<BR/>							
							
							</TD>
							<TD ALIGN="left" VALIGN="top" CLASS="statText">
Olorin<BR/>
olted<BR/>
orb<BR/>
Orbus<BR/>
outing<BR/>
paisa<BR/>
palenica<BR/>
Pangaea<BR/>
papasan<BR/>
pearl<BR/>
pedda<BR/>
Penwiper<BR/>
Perlaze<BR/>
petch<BR/>
PhantomFive<BR/>
pistonmstr<BR/>
pl31415<BR/>
pmadden<BR/>
pngwen<BR/>
po<BR/>
pogsworth<BR/>
Pops<BR/>
pozdol<BR/>
ps31<BR/>
pushplay<BR/>
puzzlehacker<BR/>
qubits<BR/>
queuey<BR/>
qwj<BR/>
racobac<BR/>
radeye<BR/>
Radgast<BR/>
ragnabot<BR/>
RajAjmani<BR/>
raksu<BR/>
rashok<BR/>
rbnn<BR/>
reid<BR/>
reymano<BR/>
RobertLu<BR/>
RobertNix<BR/>
rockfreak<BR/>
rschutt<BR/>
rsrinivasan77<BR/>
rusi<BR/>
sancho<BR/>
sandeepgupta<BR/>
Saradin<BR/>
sathya<BR/>
SCcoder<BR/>
seacow<BR/>
sh_maestro<BR/>
shadamer<BR/>
Shakeemup1<BR/>
ShakeSpace<BR/>
shamsu_l<BR/>
Shaolinrabbit<BR/>
Sharakan<BR/>
shelby<BR/>
Sherlockk<BR/>
Shiro<BR/>
shuvovse<BR/>
silver_tpt<BR/>
SilverBoy33<BR/>
simplesure<BR/>
sjelkjd<BR/>
Slamin<BR/>
Sleeve<BR/>
slinky<BR/>
sliu<BR/>
slowjoe<BR/>
Smthng<BR/>
snapper<BR/>
snoopy<BR/>
solman<BR/>
somaniram<BR/>
sony<BR/>
sosonel<BR/>
soul_on_fire<BR/>
space<BR/>
Special-Ed<BR/>
Spiffage<BR/>
Spike<BR/>
sriram<BR/>
Ssmoimo<BR/>
stanf<BR/>
star long<BR/>
stimpil<BR/>
StinkyCheeseMan<BR/>
stoend<BR/>
StrIkeR_MaN<BR/>
stupefaction<BR/>
sundberg<BR/>
sunyuan<BR/>
Symme7ry<BR/>
Tadrow<BR/>
tangentz<BR/>
tavib<BR/>
Tavis Bennett<BR/>
taxi<BR/>
tbone343<BR/>
tdavis34<BR/>
telars<BR/>
theboredguy<BR/>
TheGreedyBuddha<BR/>
theoddone33<BR/>
TheSauce<BR/>
ThinMan<BR/>
Tig<BR/>
tiki<BR/>
timfoden<BR/>
TimStevens<BR/>
timurz<BR/>
tjq<BR/>
toast<BR/>
Tomlinson<BR/>
totalcoder<BR/>
tralfamadore_w<BR/>
trixter<BR/>
Trolley<BR/>
ttsuchi<BR/>
tuc77<BR/>
turian<BR/>
turuthok<BR/>
tweito<BR/>
tyrithe<BR/>
uglyfool<BR/>
uler3161<BR/>
unclejimbo<BR/>
ValD<BR/>
VelvetNight<BR/>
vesko8<BR/>
vigenere<BR/>
Virtual<BR/>
vulture<BR/>
vv<BR/>
w280sax<BR/>
watcard<BR/>
whorn<BR/>
Wombat80<BR/>
wstubbs<BR/>
wyatt<BR/>
xentar<BR/>
xxfobxx<BR/>
xzhangz<BR/>
y<BR/>
yangtianzhi<BR/>
Yi Zhang<BR/>
z-man<BR/>
Zaen<BR/>
zaphodb<BR/>
zimmy<BR/>
zoidal<BR/>
ZOOT<BR/>
zortanda<BR/>							
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
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#cccccc"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
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
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
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

