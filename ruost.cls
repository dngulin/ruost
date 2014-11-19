%%%
%
% Copyright 2014 Danil Gulin
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Danil Gulin.
%
% This work consists of the files:
%    ruost.cls
%    latex.def
%    xelatex.def
%    ruost.tex
%
%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ruost}[2014/10/29 v1.3 Textual Documentation]

%%% Font size options
\newcommand{\OST@font}{12pt}
\DeclareOption{10pt}{\renewcommand{\OST@font}{10pt}}
\DeclareOption{12pt}{\renewcommand{\OST@font}{12pt}}
\DeclareOption{14pt}{\renewcommand{\OST@font}{14pt}}

%%% Figures marking scheme
\newif\ifOST@figuresection\OST@figuresectionfalse
\DeclareOption{figuresection}{\OST@figuresectiontrue}

%%% Tables marking scheme
\newif\ifOST@tablesection\OST@tablesectionfalse
\DeclareOption{tablesection}{\OST@tablesectiontrue}

%%% Equations marking scheme
\newif\ifOST@equationsection\OST@equationsectionfalse
\DeclareOption{equationsection}{\OST@equationsectiontrue}

%%% One or twoside variant
\newcommand{\OST@sides}{oneside}
\DeclareOption{twoside}{\renewcommand{\OST@sides}{twoside}}

%%% Final release
\newif\ifOST@final\OST@finalfalse
\DeclareOption{final}{\OST@finaltrue}

%%% Arabic numering for appendixes
\newif\ifOST@arabicappendixes\OST@arabicappendixesfalse
\DeclareOption{arabicappendixes}{\OST@arabicappendixestrue}

%%% Arabic numering for footnotes
\newif\ifOST@arabicfootnotes\OST@arabicfootnotesfalse
\DeclareOption{arabicfootnotes}{\OST@arabicfootnotestrue}


%%%
%%% Processing options
%%%
\ProcessOptions\relax
\LoadClass[a4paper, \OST@font, \OST@sides]{extarticle}
\RequirePackage{calc}

%%%
%%% Load cyrillic names
%%%
\RequirePackage{ifxetex}

\newcommand{\OST@CYR@DocumentClassI}{}
\newcommand{\OST@CYR@DocumentClassII}{}
\newcommand{\OST@CYR@ClassPrefix}{}
\newcommand{\OST@CYR@Approve}{}
\newcommand{\OST@CYR@DocumentStateI@draft}{}
\newcommand{\OST@CYR@DocumentStateII@draft}{}
\newcommand{\OST@CYR@DocumentState@final}{}
\newcommand{\OST@CYR@TableTitle}{}
\newcommand{\OST@CYR@FigureTitle}{}
\newcommand{\OST@CYR@NoteLabel}{}
\newcommand{\OST@CYR@NotesLabel}{}
\newcommand{\OST@CYR@ApplyDate}{}
\newcommand{\OST@CYR@Keywords}{}
\newcommand{\OST@CYR@AppendixName}{}
\newcommand{\OST@CYR@AppendixPrefix}{}
\newcommand{\OST@CYR@BibTitle}{}
\newcommand{\OST@CYR@M}{}
\newcommand{\OST@CYR@m}{}

%%% def files also contains cyrillic alpha-numeric commands
\ifxetex
	\input{xelatex.def}
\else
	\input{latex.def}
\fi


%%%
%%% Setup RuOST basic values
%%%
\newlength{\OSTSep}\setlength{\OSTSep}{1ex}
\newcommand{\OSTHspace}{\hspace{\OSTSep}}

\newcommand{\OSTFontHeader}{\Large\bfseries\MakeUppercase}
\newcommand{\OSTFontSubheader}{\Large\bfseries}
\newcommand{\OSTFontSection}{\large\bfseries}
\newcommand{\OSTFontSubsection}{\normalsize\bfseries}

\newcommand{\OSTHeader}{OSTHeader}
\newcommand{\OSTSubheader}{OSTSubheader}

\newcommand{\OSTDocumentClassI}{\OST@CYR@DocumentClassI}
\newcommand{\OSTDocumentClassII}{\OST@CYR@DocumentClassII}

\newcommand{\OSTOrganisation}{OSTOrganisation}

\newcommand{\OSTApproverState}{OSTApproverState}
\newcommand{\OSTApproverName}{OSTApproverName}

\newcommand{\OSTClassPrefix}{\OST@CYR@ClassPrefix}
\newcommand{\OSTNumber}{OSTNumber}
\newcommand{\OSTYear}{\the\year}
\newcommand{\OSTFullNumber}{\OSTClassPrefix\ \OSTNumber---\OSTYear}

\newcommand{\OSTCity}{OSTCity}

\newcommand{\OSTLastpageClassLeft}{OSTLastpageClassLeft}
\newcommand{\OSTLastpageClassCenter}{OSTLastpageClassCenter}
\newcommand{\OSTLastpageClassRight}{OSTLastpageClassRight}
\newcommand{\OSTLastpageKeywords}{OSTLastpageKeywords}

\newcommand{\OSTDocumentStateI}{OSTDocumentStateI}
\newcommand{\OSTDocumentStateII}{OSTDocumentStateII}

\newcommand{\OSTApplyDate}{OSTApplyDate}

\ifOST@final
	\renewcommand{\OSTDocumentStateI}{\OST@CYR@DocumentState@final}
	\renewcommand{\OSTDocumentStateII}{\OST@CYR@DocumentState@final}
\else
	\renewcommand{\OSTDocumentStateI}{\OST@CYR@DocumentStateI@draft}
	\renewcommand{\OSTDocumentStateII}{\OST@CYR@DocumentStateII@draft}
\fi


%%%
%%% Setup list geometry
%%%
\RequirePackage{geometry}
\geometry{
	includehead,
	includefoot,
	inner=20mm,
	outer=20mm,
	top=10mm,
	bottom=10mm
}


%%%
%%% Title fields
%%%
\newcommand{\OSTTitleOrganisation}{\bfseries\MakeUppercase{\OSTOrganisation}}
\newcommand{\OSTTitleLogo}{OSTTitleLogo}
\newcommand{\OSTTitleDocumentClass}{\bfseries{\OSTDocumentClassI}}
\newcommand{\OSTTitleDocumentNumber}{\large\bfseries\OSTClassPrefix\\\OSTNumber---\\\OSTYear}
\newcommand{\OSTTitleAgreement}{%
	\textbf{\OST@CYR@Approve}\\
	\OSTApproverState\\
	\rule{4em}{.5pt} \OSTApproverName\\
	<<\rule{2em}{.5pt}>> \rule{5em}{.5pt} \rule{4em}{.5pt}%
}
\newcommand{\OSTTitleDocumentName}{%
	{\OSTFontHeader{\OSTHeader}\\[1ex]\OSTFontSubheader{\OSTSubheader}}\\[4ex]
	{\OSTDocumentStateI}%
}
\newcommand{\OSTTitleFooter}{\OSTCity\\\OSTYear}


%%%
%%% Titlepage definition
%%%
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\newgeometry{
		inner=20mm,
		outer=20mm,
		top=10mm,
		bottom=10mm
	}
	\begin{center}
		
		\parbox{\linewidth}{\rule{\linewidth}{2pt}}\par
		\vspace{2mm}
		
		\parbox{\linewidth}{\centering\OSTTitleOrganisation}\par
		\vspace{2mm}
		
		\parbox{\linewidth}{\rule{\linewidth}{2pt}}\par
		\vspace{2mm}
		
		\parbox{0.33\linewidth}{\centering\OSTTitleLogo}\hfill
		\parbox{0.33\linewidth}{\centering\OSTTitleDocumentClass}\hfill
		\parbox{0.33\linewidth}{\OSTTitleDocumentNumber}\par
		\vspace{2mm}
		
		\parbox[с]{\linewidth}{\rule{\linewidth}{2pt}}
		
		\vfill
		\hfill\parbox{0.33\linewidth}{\OSTTitleAgreement}

		\vfill
		\OSTTitleDocumentName
		
		\vfill
		\vfill
		\vfill
		\vfill
		\OSTTitleFooter
	\end{center}
	\newpage
	\newgeometry{
		includehead,
		includefoot,
		inner=20mm,
		outer=20mm,
		top=10mm,
		bottom=10mm
	}}


%%%
%%% Basic Indentation
%%% NOTE: \OSTParindent also used in a lot of environments (stdquote, notes)
%%%
\RequirePackage{indentfirst}

\newlength{\OSTParindent}
\setlength{\OSTParindent}{5ex}
\parindent=\OSTParindent


%%%
%%% Colotitles definition
%%%
\newcommand{\OSTHeaderOdd}{\hfill\textbf{\upshape\OSTFullNumber}}
\newcommand{\OSTFooterOdd}{\hfill\upshape\mdseries\thepage}
\newcommand{\OSTHeaderEven}{\textbf{\upshape\OSTFullNumber}\hfill}
\newcommand{\OSTFooterEven}{\upshape\mdseries\thepage\hfill}

\renewcommand{\@oddhead}{\OSTHeaderOdd}
\renewcommand{\@oddfoot}{\OSTFooterOdd}
\renewcommand{\@evenhead}{\OSTHeaderEven}
\renewcommand{\@evenfoot}{\OSTFooterEven}


%%%
%%% Titles style
%%%
\newlength{\OSTBeforeSectionSkip}
\newlength{\OSTAfterSectionSkip}
\newlength{\OSTBeforeSubsectionSkip}
\newlength{\OSTAfterSubsectionSkip}

\setlength{\OSTBeforeSectionSkip}{1.5\baselineskip plus 1mm minus 1mm}
\setlength{\OSTAfterSectionSkip}{1.5\baselineskip plus 1mm minus 1mm}
\setlength{\OSTBeforeSubsectionSkip}{0.75\baselineskip plus 1mm minus 1mm}
\setlength{\OSTAfterSubsectionSkip}{0.75\baselineskip plus 1mm minus 1mm}

\RequirePackage{titlesec}

\titleformat{\section}{\OSTFontSection}{\thesection\OSTHspace}{\z@}{\OSTFontSection}
\titleformat{\subsection}{\OSTFontSubsection}{\thesubsection\OSTHspace}{\z@}{\OSTFontSubsection}

\titlespacing*{\section}{\parindent}{\OSTBeforeSectionSkip}{\OSTAfterSectionSkip}
\titlespacing*{\subsection}{\parindent}{\OSTBeforeSubsectionSkip}{\OSTAfterSubsectionSkip}


%%%
%%% Captions style
%%%
\setlength{\intextsep}{.5\baselineskip}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{dash}{ --- }
\captionsetup[table]{name=\OST@CYR@TableTitle,labelsep=dash,justification=raggedright,singlelinecheck=false, skip=1mm}
\captionsetup[figure]{name=\OST@CYR@FigureTitle,labelsep=dash,justification=centering,singlelinecheck=false, skip=1mm}


%%%
%%% List environments style
%%%
\newcommand{\OSTListDash}{\textbf{--}}
\newcommand{\OSTListLabelWidth}{1.2em}
\newcommand{\OSTListIndent}{2ex}

\RequirePackage{enumitem}

\AddEnumerateCounter{\OSTAsbuk}{\OST@Alph}{\OST@CYR@M}
\AddEnumerateCounter{\OSTasbuk}{\OST@alph}{\OST@CYR@m}

\setlist{topsep=\z@,partopsep=\z@,parsep=\parskip,itemsep=\parskip, align=left, labelindent=\OSTListIndent, listparindent=\parindent, labelsep=*}

\setlist[enumerate,1]{label=\OSTasbuk{enumi}), leftmargin=0pt, labelindent=\parindent, itemindent=\parindent+\OSTListLabelWidth}
\setlist[enumerate,2]{label=\arabic{enumii}), leftmargin=\parindent+\OSTListIndent+\OSTListLabelWidth, labelindent=\parindent+\OSTListIndent+\OSTListLabelWidth, itemindent=\OSTListLabelWidth}

\setlist[itemize,1]{leftmargin=0pt, labelindent=\parindent, itemindent=\parindent+\OSTListLabelWidth}
\setlist[itemize,2]{leftmargin=\parindent+\OSTListIndent+\OSTListLabelWidth, labelindent=\parindent+\OSTListIndent+\OSTListLabelWidth, itemindent=\OSTListLabelWidth}
\setlist[itemize]{label=\OSTListDash, leftmargin=\OSTListIndent+\OSTListLabelWidth, labelindent=\OSTListIndent+\OSTListLabelWidth, itemindent=\OSTListLabelWidth, listparindent=\parindent}


%%%
%%% Pre-sections definition
%%%
\newcommand{\OSTPresection}[1]{%
		{\centering
		\vspace{\OSTBeforeSectionSkip}
		{\OSTFontSection#1}
		\vspace{\OSTAfterSectionSkip}\par}}


%%%
%%% TOC style
%%%
\setcounter{tocdepth}{2}

\renewcommand\tableofcontents{%
	\OSTPresection{\contentsname}
	\@starttoc{toc}}

\renewcommand\@pnumwidth{1.5em}
\newcommand\OST@secwidth{3.5ex}
\newcommand\OST@subsecwidth{5.5ex}
\newcommand\OST@appwidth{14.5ex}

\newcommand{\OST@dotfill}{\leavevmode\xleaders\hbox to 2mm{\hfil.}\hfill}

\renewcommand*\l@section[2]{%
	\ifnum \c@tocdepth >\z@
		\setlength\@tempdima{\OST@secwidth}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak\OST@dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\endgroup
	\fi}

\renewcommand*\l@subsection[2]{%
	\ifnum \c@tocdepth>1
		\setlength\@tempdima{\OST@subsecwidth}%
		\setlength\@tempdimb{\OST@secwidth}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\advance\leftskip\@tempdimb
			\hskip -\leftskip
			\hskip \@tempdimb
			#1\nobreak\OST@dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\endgroup
	\fi}

\newcommand*\l@appendix[2]{%
	\ifnum \c@tocdepth >\z@
		\setlength\@tempdima{\OST@appwidth}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak\OST@dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\endgroup
	\fi}


%%%
%%% OST environment definition
%%%
\pagenumbering{Roman} % Roman numbering before begining OST environment

\newenvironment{OST}{
	\newpage
	\pagenumbering{arabic}
	\begin{center}
		\parbox{\linewidth}{\centering\bfseries\large{\OSTDocumentClassII}}\par
		\vspace{-0.4\baselineskip}
		\parbox{\linewidth}{\rule{\linewidth}{2pt}}\par
		\vspace{2mm}
		\parbox{\linewidth}{\centering\OSTFontHeader{\OSTHeader}\\\OSTFontSubheader\OSTSubheader}\par
		\vspace{2mm}
		\parbox{\linewidth}{\rule{\linewidth}{1pt}}\par
		\hfill\textbf{\OST@CYR@ApplyDate\ ---\ \OSTApplyDate}
	\end{center}
	\begin{table}[b]
		\noindent
		\parbox[с]{\linewidth}{\rule{\linewidth}{1pt}}
		\newline\small\textbf{\OSTDocumentStateII}
	\end{table}
	}{
	\newpage
	\begin{center}
		\parbox{\linewidth}{\rule{\linewidth}{1pt}}\par
		\parbox{\linewidth}{\OSTLastpageClassLeft\hfill\OSTLastpageClassCenter\hfill\OSTLastpageClassRight}\par
		\null\par
		\parbox{\linewidth}{\OST@CYR@Keywords\ \OSTLastpageKeywords}\par
		\parbox{\linewidth}{\rule{\linewidth}{1pt}}\par
		\vspace{.5cm}
	\end{center}}


%%%
%%% stdquote environment definition
%%%
\newsavebox{\stdquotebox}

\newenvironment{stdquote}{%
	\smallskip
	\par\noindent
	\hspace{-2\fboxsep}
	\hspace{-2\fboxrule}
	\begin{lrbox}{\stdquotebox}
		\begin{minipage}{\textwidth-2\fboxsep-2\fboxrule}
		\small
		\parindent=\OSTParindent%
		\smallskip
	
}{%
		\end{minipage}
	\end{lrbox}
	\fbox{\usebox{\stdquotebox}}
	\medskip
}


%%%
%%% Note command and notes environment definition
%%%
\newcommand*{\note}[1]{\par{\small\mbox{\OST@CYR@NoteLabel\ ---\ }#1}}

\newcounter{notecouner}
\newenvironment{notes}{%
	\par\small
	\mbox{\OST@CYR@NotesLabel}
	\begin{list}{\arabic{notecouner}\OSTHspace}{%
			\usecounter{notecouner}%
			\setlength{\parsep}{\parskip}%
			\setlength{\topsep}{0pt}%
			\setlength{\itemsep}{0pt}%
			\setlength{\labelsep}{0pt}%
			\setlength{\itemindent}{\parindent}%
			\setlength{\labelwidth}{0pt}%
			\setlength{\leftmargin}{0pt}}
	}{\end{list}\medskip}


%%%
%%% Footnotes style
%%%
\RequirePackage{perpage}
\MakePerPage{footnote} % Reset footnotes on each page

\renewcommand{\footnotesize}{\small}

\renewcommand\footnoterule{%
	\parindent=\OSTParindent%
	\noindent\rule{2\parindent}{.5pt}\smallskip}

\newcommand{\OSTStars}[1]{\expandafter\OST@Stars\csname c@#1\endcsname}
\newcommand{\OST@Stars}[1]{\ifcase#1%
	\or*%
	\or**%
	\or***%
	\else\ClassError{ruost}{Too many starred footnotes}%
	{GOST 1.5 forbid using more then 3 starred footnotes per page.
	Use a arabicfootnotes class argument.}\fi}

\ifOST@arabicfootnotes
	\renewcommand{\thefootnote}{\arabic{footnote})}
\else
	\renewcommand{\thefootnote}{\OSTStars{footnote}}
\fi

\renewcommand\@makefntext[1]{%
	\parindent=\OSTParindent%
	\noindent\hspace{\parindent}\hbox{\hss\@makefnmark}\OSTHspace#1}

%%%
%%% Appendixes style and command definition
%%%
\newcommand{\OSTAppendixNumericPrefix}{\OST@CYR@AppendixPrefix}

\newcounter{ostappendix}

\ifOST@arabicappendixes
	\renewcommand\OST@appwidth{16ex}
	\renewcommand{\theostappendix}{\OSTAppendixNumericPrefix\arabic{ostappendix}}
\else
	\renewcommand{\theostappendix}{\OSTAsbuk{ostappendix}}
\fi

\newcommand{\OSTAppendix}[2]{%
	\clearpage
	\refstepcounter{ostappendix}
	\addcontentsline{toc}{appendix}{\protect\numberline{\OST@CYR@AppendixName\ \theostappendix}#1\OSTHspace#2}
	\begin{center}
		{\OSTFontSection\OST@CYR@AppendixName\OSTHspace\theostappendix}\par
		#1\bigskip\par
		{\OSTFontSubsection#2}\par
	\end{center}}


%%%
%%%	Bibliography style
%%%
\newcommand{\OSTRefname}{\OST@CYR@BibTitle} % For remove conflicts with babel or polyglossia

\renewcommand{\thebibliography}[1]{%
	\OSTPresection{\OSTRefname}
	\addcontentsline{toc}{appendix}{\OSTRefname}
	\list{\@biblabel{\@arabic\c@enumiv}\hfill}{%
		\setlength{\topsep}{0pt}%
		\setlength{\itemsep}{0pt}%
		\setlength{\parsep}{\parskip}%
		\settowidth{\labelwidth}{\@biblabel{#1}}%
		\setlength{\labelsep}{1ex}%
		\setlength{\leftmargin}{\labelwidth+\labelsep}%
		\setlength{\itemindent}{0pt}%
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand{\theenumiv}{\@arabic\c@enumiv}}
		\sloppy
		\clubpenalty4000
		\@clubpenalty \clubpenalty
		\widowpenalty4000%
		\sfcode`\.\@m}

\renewcommand{\endthebibliography}{\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}\endlist}


%%%
%%% Sections marking scheme
%%% NOTE: sections can be in appendixes
%%%
\@addtoreset{section}{ostappendix}
\@addtoreset{subsection}{ostappendix}

\renewcommand{\thesection}{%
	\ifnum \c@ostappendix>\z@
		\theostappendix.\arabic{section}%
	\else
		\arabic{section}%
	\fi}


%%% Figures marking scheme
\@addtoreset{figure}{ostappendix}
\renewcommand{\thefigure}{%
	\ifnum \c@ostappendix>\z@
		\theostappendix.%
	\else
		\ifOST@figuresection
			\thesection.%
		\fi
	\fi
	\arabic{figure}}

%%% Tables marking scheme
\@addtoreset{table}{ostappendix}
\renewcommand{\thetable}{%
	\ifnum \c@ostappendix>\z@
		\theostappendix.%
	\else
		\ifOST@tablesection
			\thesection.%
		\fi
	\fi
	\arabic{table}}

%%% Equation marking scheme
\@addtoreset{equation}{ostappendix}
\renewcommand{\theequation}{%
	\ifnum \c@ostappendix>\z@
		\theostappendix.%
	\else
		\ifOST@equationsection
			\thesection.%
		\fi
	\fi
	\arabic{equation}}


%%% Points and subpoints
\newcounter{point}

\@addtoreset{point}{ostappendix}
\@addtoreset{point}{section}
\@addtoreset{point}{subsection}
\@addtoreset{point}{subsubsection}

\renewcommand{\thepoint}{%
	% Subsection level
	\ifnum\c@subsection>\z@
		\thesubsection.%
	\else
	% Section level
		\ifnum\c@section>\z@
			\thesection.%
		\else
			\ifnum\c@ostappendix>\z@
				\theostappendix.%
			\fi
		\fi
	\fi\arabic{point}}

\newcommand{\point}{\par\refstepcounter{point}\thepoint\OSTHspace}

\newcounter{subpoint}[point]
\renewcommand{\thesubpoint}{\thepoint.\arabic{subpoint}}
\newcommand{\subpoint}{\par\refstepcounter{subpoint}\thesubpoint\OSTHspace}
