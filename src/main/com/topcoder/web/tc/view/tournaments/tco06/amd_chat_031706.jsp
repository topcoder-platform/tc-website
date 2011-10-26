<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<STYLE TYPE="text/css">
.light
{
background-color: #143F7C;
color: #FFFFFF;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}

.dark
{
background-color: #032F6B;
color: #FFFFFF;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}
</STYLE>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="amd"/>
</jsp:include>


<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco06/amd_logo_grn.gif" alt="AMD" border="0" /></div>
<br><br>
<table class="bodyText" cellpadding="0" cellspacing="0" width="100%">
<tr><td class="header">Handle</td><td class="header" width="100%">Comment</td></tr>
<tr><td class="light"><b>nishantkumar</b></td><td class="light">early bird gets the first question</td></tr>
<tr><td class="dark"><b>nishantkumar</b></td><td class="dark">AMD_Mike: Do u have any multi cores for mobile platforms?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">you can bet they're coming soon</span></td></tr>
<tr><td class="dark"><b>nishantkumar</b></td><td class="dark">AMD_Mike: cool! Intel is pushing it's Yonah soon i guess!</td></tr>
<tr><td class="light"><b>nishantkumar</b></td><td class="light">AMD_Mike: So! What do u guys do?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">my job is helping developers get the best performance in their code</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">I work on AMD's Developer Program, developer.amd.com</span></td></tr>
<tr><td class="dark"><b>i_am_here</b></td><td class="dark">hi</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">hello</span></td></tr>
<tr><td class="dark"><b>rajeshaz09</b></td><td class="dark">hi</td></tr>
<tr><td class="light"><b>vulture</b></td><td class="light">it</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">it's pretty early!</td></tr>
<tr><td class="light"><b>lafernando</b></td><td class="light">hii</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">One of the things that AMD is known for is our performance in games</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">We thought it would be a good topic for today to talk about some ways to optimize your code for gaming</span></td></tr>
<tr><td class="dark"><b>nishantkumar</b></td><td class="dark">AMD_Mike: So these optimizations, Are they part of the game code OR the gaming engine?</td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">which one AMD prefer? DirectX or OpenGL?</td></tr>
<tr><td class="dark"><b>Paschalis</b></td><td class="dark">Has AMD been approached by any console manufacturer to make the CPU?</td></tr>
<tr><td class="light"><b>nishantkumar</b></td><td class="light">AMD_Mike: Yeah! Does any console ship with an AMD core?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">there are specific techniques for getting the best performance on PC games</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">multi-threading is a "biggie" right now</span></td></tr>
<tr><td class="dark"><b>Paschalis</b></td><td class="dark">Oh OK, my question was off-topic I guess</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">and SSE vectorization for FPU-intensive code</span></td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">hello ...</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">64-bit native code can also have perf advantages</span></td></tr>
<tr><td class="dark"><b>rajeshaz09</b></td><td class="dark">hi</td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">AMD_Mike: where the FPU-intensive code is popular?</td></tr>
<tr><td class="dark"><b>prunthaban</b></td><td class="dark">But... the programming API should also make use of this techniques right? Thats why I asked DirectX or OpenGL?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Things like physics, audio processing, and some character animation stuff all use floating point heavily</span></td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">hi AMD People ...</td></tr>
<tr><td class="light"><b>rajeshaz09</b></td><td class="light">hi jagan</td></tr>
<tr><td class="dark"><b>prunthaban</b></td><td class="dark">Floating poing is used everywhere in gaming!</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">Hi jagan</span></td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">yeah .. is directx or opengl aware of the AMD processors ..</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">prunthaban: yes, the easiest way to implement optimizations is to use optimized library code!</span></td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">I mean there're enhanced capabilities ..</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">MIcrosoft's D3DX math functions are optimized</span></td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">Could u please tell me which language is good in Optimizing the code.</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Virtually all game developers use Microsoft Visual Studio.  VS2005 rocks</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">VS2005 supports OpenMP for easy multi-threading</span></td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">what about MOBILE Games ???</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">does the AMD Core Math Lib have stuff for games too?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Also VS2005 has SSE compiler intrinsic functions, so you can write vectorized SSE that compiles for 32-bit and 64-bit... no more ASM needed</span></td></tr>
<tr><td class="dark"><b>Paschalis</b></td><td class="dark">thanks</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">A</td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">how's the multi core processors doing for games ?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">vulture: I haven't heard of anyone using ACML for games, but there may be some useful code in there.</span></td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">AMD_Mike: re FPU-intensive code, do you mean that general-purpose CPU are now assuming the role of supercomputers and specialized hardware?</td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">D3DX is a utility library based on software! For example D3DXMatrixMultiply is entirely implemented in software! But.. nowadays graphics cards are coming out with hardware support for performing matrix multiplication with single machine instructions</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">lafernando: dual-core is excellent for games</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">lafernando: developers are just getting started exploiting dual-core, and already some games are 20% or 30% faster</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">CodeAnalyst would be useful in analyzing performance.  It's a free profiling tool that we offer through AMD Developer Central.</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">lafernando: the graphic drivers are threaded too</span></td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">nice ..</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">prunthaban: A lot of processing is done on the GPU now, but there is always stuff that's better done on the CPU</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">AMD_Sharon: CodeAnalyst is really easy to use.  It integrates with the VS2005 IDE</span></td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">But... Matrix operations are the heart of gaming! also matrix operations have great scope for parallel operations. So it is one area where a GPU can perform better. Correct me if I am wrong</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">We'll be showing a demo of codeanaylst and how it works at the Game Developers Conference next week</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">If there is one thing to take away from this chat, it is "multi thread your code!".  And check out OpenMP, it makes data parallel threading really easy.</span></td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">Hi AMD_Mike how is Java rated in Optimization</td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">AMD_Mike: are there open source OpenMP implementations?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">prunthaban: The GPU is good for lots of 3D stuff.  But the CPU is ideal for other jobs.  One consideration: where is your data?  If it's in system RAM, the CPU has fast access... you don't need to copy it across into the GPU's memory.</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Faustus: OpenMP is supported in GCC and all over the place.  Check out www.openmp.org  it's all an open standard</span></td></tr>
<tr><td class="dark"><b>prunthaban</b></td><td class="dark">Is AMD working on cooling the GPU? (Because excessive heating is the only complaint i hear against -otherwise the best- AMD)</td></tr>
<tr><td class="light"><b>nimisis</b></td><td class="light">Who are AMD?</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">hope the slide of the stock stops today :O</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">prunthaban: I assume you mean cooling the CPU, not GPU?  The stock cooler that comes with Athlon 64 works fine.  Some after-market cheapies are marginal, but some are good.  I always read the reviews on the web.</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">Haha, me too</span></td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">AMD_Mike: nice to hear, although I see that GOMP is still not in GCC mainline from their site.</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">AMD_Mike: What Developers do at AMD</td></tr>
<tr><td class="light"><b>hanvin</b></td><td class="light">Can you give me more information about gaming optimization? Video?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: There are several software groups.  Library code, compiler optimization, ISV support... check AMD.com and look at the job listings, we're hiring  8-)</span></td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">Is it like AMD shifing its main focus from CPUs to GPUs?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">AMD_Mike: Do u need developers for writing Drivers for the Hardware</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">hanvin: There are presentations on AMD.com from previous Game Developer's Conferences, and lots of other optimization stuff.  Plus GDC2006 is next week, look for new material soon.</span></td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">AMD produces GPUs?</td></tr>
<tr><td class="light"><b>simplysuperb_kn</b></td><td class="light">Does AMD have its compiler too?AMD</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">Faustus: No, we don't make any graphics hardware.</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">prunthaban: AMD works closely with graphcis companies like Nvidia and ATI, but we don't produce our own GPU, only CPU</span></td></tr>
<tr><td class="dark"><b>hanvin</b></td><td class="dark">Where is AMD Developers center located? How many employers so far?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">AMD_Mike: ??</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">simplysuperb_kn: We recommend Visual Studio 2005 for games.  It's an excellent compiler.  32-bit and 64-bit code, stable, excellent performance.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">AMD_Mike: what about Microsoft XNA</td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">What about ICC? :)</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">hanvin: We have a developer center located in Sunnyvale, CA, US</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: check amd.com job listings</span></td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">R u planning for a CPU which is "game centric" (better performance on games)?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: it's all compatible with AMD</span></td></tr>
<tr><td class="light"><b>simplysuperb_kn</b></td><td class="light">What does compiler optimization group in AMD do then?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">AMD_Mike: yes</td></tr>
<tr><td class="light"><b>HybridBoy</b></td><td class="light">hey could any tell me about linux for amd64 processor</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">prunthaban: Our Athlon FX is for gamers :)</span></td></tr>
<tr><td class="light"><b>HybridBoy</b></td><td class="light">i have found out one naming ubuntu</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">AMD_Mike: is there any AMD R&D?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">prunthaban: Athlon 64 is already extremely "game friendly" with the integrated memory controller and HyperTransport interfaces</span></td></tr>
<tr><td class="dark"><b>gautam2roy</b></td><td class="dark">hi, what are the challenges faced in games wrt video processing speed, which codecs do u use</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">AMD_Sharon: whats AMD plan about $100 Laptop.....?</td></tr>
<tr><td class="dark"><b>prunthaban</b></td><td class="dark">you recommend Visual Studio 2005? You mean DirectX APIs specifically or in general?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">simplysuperb_kn: we work with compiler companies like Microsoft, gcc, PGI, etc.</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">prunthaban: Visual Studio 2005 compiler.  And of course the DirectX SDK.</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">gautam2roy: I am not a codec expert.  Lots of game devs use Bink.</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">jagan_net: AMD works with vendors and ODMs to make laptops at affordable prices... I'm not sure about $100 laptop, but we do offer a PIC, that is very inexpensive that can get people online</span></td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">Does VS2005 C++ compiler produce better code for AMD processors than the Intel Compiler Collection?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">is there any AMD R&D?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">HybridBoy: quite a few linuxes are AMD64 already</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: Yes, AMD definitely has R&D</span></td></tr>
<tr><td class="light"><b>gautam2roy</b></td><td class="light">AMD_Mike: ok</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">what kind of R&D is going on?</td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">I think HLSL is more important nowadays?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: AMD does loads of R&D for microprocessors</span></td></tr>
<tr><td class="light"><b>gautam2roy</b></td><td class="light">AMD_Mike: ok</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">any kind of optimization for games other than video?</td></tr>
<tr><td class="light"><b>HybridBoy</b></td><td class="light">could some one please name some of the available linux os</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">gr8</td></tr>
<tr><td class="light"><b>HybridBoy</b></td><td class="light">is there any fedora version of amd64 ?</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: I can't give too much away... but let's just say we are always working on making transistors smaller and the silicon running faster</span></td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">HB: yes, I've got it installed</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">prunthaban: silicon fab technology, CPU design, I/O, lots of others</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">Are you developing hardwares for Mobile Devices</td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Sharon: How are Java Games compard to VS2005</td></tr>
<tr><td class="light"><b>mpaulse</b></td><td class="light">HybridBoy: Most Linux distros supports AMD64</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">HybridBoy: SUSE, Red Hat, you can Google for others</span></td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">HB: yes, any in CPU optimizations planned for Java?</td></tr>
<tr><td class="dark"><b>prunthaban</b></td><td class="dark">HLSL support is available in Intel compilers too. So why can't AMD go for a compiler which can be incorporated into Visual Studio? (For example Intel's HLSL compiler can be incorporated with VC++)</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">jagan_net: I'll have to let mike answer that question, I'm not sure</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">HybridBoy: MSFT already supports HLSL, right?</span></td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">AMD_Mike: whether Java games hav the capability to Optimize the code of GAMES</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">cbmcvey: we're always looking at hardware acceleration of important functions</span></td></tr>
<tr><td class="light"><b>prunthaban</b></td><td class="light">jagan_net: Java games cannot even go closer to VC games! The simple reason is VC++ can reach upto the core hardware and optimize! But java cannot... its security prevents it!</td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: with Hardware</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">prunthaban: tks man</td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">jagan_net: can u guys give us a forecast on what to expect from AMD in the future .. technology wise ..</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">game developers use C/C++, compiled to native x86 or AMD64 code, for top performance</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">lafernando: that is top secret information, my friend</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">lafernando: expect dual-core everywhere, and quad-core next</span></td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">jagan_net: hehe .. ok ..</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">la</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">lafernando: expect higher clock speeds</span></td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">AMD_Mike: when you recommend VC++ for gaming, do you mean that you have evaluate it against other compilers, say, ICC, and find that it's better, or do you just "recommend it," as part of AMD company strategy?</td></tr>
<tr><td class="dark"><b>prunthaban</b></td><td class="dark">In past 5 years in my country(India) AMD has started dominating CPU market! Well done guys for giving cheap and best CPUs! As a true gamer... I look for more from you!</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">a little off game topic, but any plans to work with Apple to ship OSX Macs with AMD CPUs?</td></tr>
<tr><td class="dark"><b>lafernando</b></td><td class="dark">jagan_net: ooops .. sorry jagan .. not to u ..</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">lafernando: ok</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">Faustus: I have talked with many of the top PC game devs, and they all use Visual Studio.  They are all moving to VS2005 also.</span></td></tr>
<tr><td class="light"><b>vulture</b></td><td class="light">I dont know about newer versions of ICC, but I always found VC outperformed ICC</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">prunthaban: Thanks!  We are trying hard to please :)</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">cbmcvey: If Apple wants to upgrade to AMD processors, we will gladly supply them!</span></td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">everything from VC6sp4+ outperformed ICC5 (and ICC produced buggy code back then too!)</td></tr>
<tr><td class="light"><b>Paschalis</b></td><td class="light">I like the use of the word "upgrade" :-)</td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: I want to Say that .. India has wide POOL of People who go for Low Cost and High Performance CPU so here AMD dominates ... Congrats to AMD</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">prunthaban: The core team who designed the Athlon 64 are from India  8-)</span></td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">vulture: well, it would be interesting to compare VS2005 against ICC9, when both compilers are hopefully mature.</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Faustus: Google around, someone may already have benchmarks posted.</span></td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: But can can Double its Presence in India with good plan becoz everyone is moving towards it..</td></tr>
<tr><td class="light"><b>vulture</b></td><td class="light">jeez they're up to 9 now? gonna stick my money with microsoft still though!</td></tr>
<tr><td class="dark"><b>askumbhar</b></td><td class="dark">Does AMD develops some games ?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">askumbhar: no, we don't develop any complete games.  We work with developers, though.</span></td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">any thoughts to adding opcodes to the proc to help speed up AI within games?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">cbmcvey: hmm, any specific ideas?</span></td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">conditional branch hint predication? :)</td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">vulture: well, you're going to pony up to MSFT whether you are using ICC on top or not...</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">unless they added that I forget!</td></tr>
<tr><td class="light"><b>askumbhar</b></td><td class="light">how do you achieve , your CPU best for visual studio also and Linux also ?</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">well optimizations on state-based search somehow... calculation of heuristics...</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">vulture: we have a pretty smart branch predictor, but there's always room for improvement.  Interestingly, for some applications the branch mis-predict penalty is the most important thing...  data that is inherently unpredictable like compressed files.</span></td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">of course branch prediction, but looking for more in depth than that</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">seems like a good potential R&D candidate</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">I dunno I think AI has a lot of conditional branches, you have to check markov-chain-like structures and other similar algorithms</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Faustus: Microsoft has "Express" versions of VS2005 which you can download</span></td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">yes no doubt, but taking to the next level...</td></tr>
<tr><td class="light"><b>mpaulse</b></td><td class="light">Does AMD offer any TPM-enabled products at the moment?</td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">AMD_Mike: do you use evolutionary computation for developing heuristics such as branch prediction in CPU?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">mpaulse: TPM?</span></td></tr>
<tr><td class="dark"><b>mpaulse</b></td><td class="dark">Trusted Platform Modules (for trusted computing)</td></tr>
<tr><td class="light"><b>vulture</b></td><td class="light">any thoughts of a mini-FPGA on CPU by chance? I don't know the usefulness or feasibility of that really, just curious :)</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">Faustus: That is planned for Athlon 1024 in the year 2099</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">mpaulse: sorry, I don't know anything about that</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">vulture: we have new mobile packages coming</span></td></tr>
<tr><td class="light"><b>Faustus</b></td><td class="light">AMD_Mike: I was serious... I meant whether such techniques are used in R&D for developing microcode heuristics parameters.</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">mobile packages?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">Faustus: we have a huge library of code traces which are tested against various CPU designs... I don't know all the techniques that are used for creating the algorithms, though.</span></td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">any other tools recommended by AMD for game dev besides VS2005 compiler?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">vulture: I'm not sure about mini-FPGA, but our Alchemy processor line is for handheld devices and the like</span></td></tr>
<tr><td class="dark"><b>i_am_here</b></td><td class="dark">what is the future of multithreding</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">cbmcvey: Yes! AMD CodeAnalyst profiler.  It's free, and easy to use, and it does timer-based and event-based profiling.</span></td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">ok cool</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">i_am_here: Very strong future in multi-threading</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">cbmcvey: CodeAnalyst supports 32-bit and 64-bit code, also.</span></td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">i_am_here: multi-core will be everywhere, so multithreading will be highly relevant and mainstream</span></td></tr>
<tr><td class="dark"><b>i_am_here</b></td><td class="dark">what should be he currentcriteria for developing aplicatins rght now</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">AMD_Sharon: Multi-threading is the #1 most important thing to take away from this chat... thread your code for dual-core, quad-core, and whatever comes next!</span></td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">any plans for a native java chip?  perhaps in your mobile line?</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Sharon</span></td><td class="light"><span class="bigRed">cbmcvey: I cna safely say that we are sticking to x86-64 based chips</span></td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">AMD_Mike: do you think that libraries such as OpenMP are here to stay, or maybe we are to witness a programming paradigm shift as multicore systems become ubiquitous?</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">ok</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">How many of you are developing games?</span></td></tr>
<tr><td class="light"><b>mpaulse</b></td><td class="light">I'm having problems accessing the download page for CodeAnalyst. It says "Portlet is not available: null. Reason: null".</td></tr>
<tr><td class="dark"><b>tywok</b></td><td class="dark">AMD_Mike: seems not so many</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">me.  currently doing a java game</td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: I was developing mobile games but now iam developing Business Softwares</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">so interested in java optimizations in particular if any</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">I'm developing game engines</td></tr>
<tr><td class="light"><b>i_am_here</b></td><td class="light">amd uses a non bus technique to communicate two cores what is that</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">Faustus: Excellent question.  I would love to see compilers get smart enough to thread code automatically... maybe someday.  But OpenMP makes it _really_ easy to implement data-parallel threading.</span></td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">hopefully the JDK will be optimized to take advantage of your multithreading improvements</td></tr>
<tr><td class="dark"><b>kauppi</b></td><td class="dark">i'm developing some kind of games but mostly for symbian/j2me</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">AMD_Mike: i too look for Java Optimizations</td></tr>
<tr><td class="dark"><b>niko</b></td><td class="dark">I'm working on a physics engine, prob. be used in games mostly.</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">wonder how difficult it would be for you guys to piggy-back a native java chip on the side with your normal x86 chip</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">that would make apple do a double take since they are very java focused</td></tr>
<tr><td class="light"><b>biacos</b></td><td class="light">niko: really? i m'working with ODE</td></tr>
<tr><td class="dark"><b>tywok</b></td><td class="dark">how can you optimize a code for amd64 appart from compile flags?</td></tr>
<tr><td class="light"><b>vulture</b></td><td class="light">is there a 64-bit assembler for x86-64 ?</td></tr>
<tr><td class="dark"><b>niko</b></td><td class="dark">biacos: Cool, how's it going?</td></tr>
<tr><td class="light"><b>brtzsnr</b></td><td class="light">why is amd interested in topcoder? is the company looking for employees or interns?</td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">cbmcvey: c'mon... Java is so yesterday. Look at TC competitions - most top-rated competitors use C++.</td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">AMD_Mike: Actually i used to Optimize JAVA programs with Native Codes(JNI) but its like abiding Java rules</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">yeah but rankings here are flawed</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">they don't gauge reusability, maintainability of code</td></tr>
<tr><td class="dark"><b>mpaulse</b></td><td class="dark">Faustus: Well, look at the design and development competitions :)</td></tr>
<tr><td class="light"><b>biacos</b></td><td class="light">niko: first step are insidious... what about your engine? (any links?)</td></tr>
<tr><td class="dark"><b>connisseur</b></td><td class="dark">cbmcvey plz tell how the ratings are flawed</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">I just did</td></tr>
<tr><td class="dark"><b>Faustus</b></td><td class="dark">cbmcvey: that's what everyone says... but did you try the Intel competition, where you have two weeks to develop code? Surprisingly, it's not less hard. :)</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">tywok: excellent question.  My white paper describes several optimization techniques.  Our web site is having a bad hair day at the moment, but check this link later  http://developer.amd.designreactor.com/articles.psml?id=1&num=1</span></td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: ***One Question *** What do u look from a TopCoder</td></tr>
<tr><td class="light"><b>tywok</b></td><td class="light">how much would the perfomance boost'</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">jagan_net: uh, not sure exactly what you are asking...</span></td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">the site even admits it can't rank based on subjective things like maintainability, readability, etc</td></tr>
<tr><td class="dark"><b>niko</b></td><td class="dark">biacos: Nothing on the net yet.. I'll get there. Working on dynamics/rag doll stuff at the mo.</td></tr>
<tr><td class="light"><b>cbmcvey</b></td><td class="light">thanks for the chat Mike & Sharon.  You guys keep up the good work.</td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: r u planned to recurit GUYs for AMD and What kind of Skills u look from Topcoders</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">AMD_Mike: you can get 10%, 20% or more gain in certain 64-bit code because of all the extra registers.</span></td></tr>
<tr><td class="dark"><b>biacos</b></td><td class="dark">niko: interesting... we will talk after the match!</td></tr>
<tr><td class="light"><b>niko</b></td><td class="light">biacos: kk</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">jagan_net: I am not a hiring manager, but a solid track record and good communication skills are always a plus.</span></td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">AMD_Mike: Good Thankx</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Mike</span></td><td class="dark"><span class="bigRed">Good luck to all!</span></td></tr>
<tr><td class="light"><b>niko</b></td><td class="light">jagan_net: Cool, so there's emphasis on communication too, not just "geek" skills...</td></tr>
<tr><td class="dark"><b>cbmcvey</b></td><td class="dark">thx</td></tr>
<tr><td class="light"><b>tywok</b></td><td class="light">thanks!</td></tr>
<tr><td class="dark"><b>askumbhar</b></td><td class="dark">Thanks a lot for sharing nice , useful information</td></tr>
<tr><td class="light"><b>jmpld40</b></td><td class="light">thanks Sharon and mike</td></tr>
<tr><td class="dark"><b>jagan_net</b></td><td class="dark">AMD_Mike: yup good luck to all</td></tr>
<tr><td class="light"><b>niko</b></td><td class="light">Yeah, tnks. gl everyone.</td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">Thanks everyone! Good luck with the Competition!!!</span></td></tr>
<tr><td class="light"><b>jagan_net</b></td><td class="light">AMD_Mike: thankx to rep's from AMD</td></tr>
<tr><td class="dark"><b>vulture</b></td><td class="dark">thanks</td></tr>
<tr><td class="light"><b>nishantkumar</b></td><td class="light">AMD_Mike: Thanks guys!</td></tr>
<tr><td class="dark"><b>askumbhar</b></td><td class="dark">thanks...also best luck to All</td></tr>
<tr><td class="light"><span class="bigRed">AMD_Mike</span></td><td class="light"><span class="bigRed">jagan_net: yer welcome</span></td></tr>
<tr><td class="dark"><span class="bigRed">AMD_Sharon</span></td><td class="dark"><span class="bigRed">Maybe we'll see you in Las Vegas :)</span></td></tr>
</table>
<br><br>
        </div>
      </td>

<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="amd"/>
            </jsp:include>
         </td>

   </tr>

</table>




<jsp:include page="../../foot.jsp" />
</body>

</html>