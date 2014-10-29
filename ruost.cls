%%% Organisation Standarts class (GOST R 1.4)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ruost}[2014/10/29 v1.0 Textual Documentation]

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


%%% Processing options
\ProcessOptions\relax
\LoadClass[a4paper, \OST@font, \OST@sides]{extarticle}


%%% ruost variables
\newlength{\OSTSep}\setlength{\OSTSep}{1ex}

\newcommand{\OSTHspace}{\hspace{\OSTSep}}

\newcommand{\OSTFontHeader}{\Large\bfseries\MakeUppercase}
\newcommand{\OSTFontSubheader}{\Large\bfseries}
\newcommand{\OSTFontSection}{\large\bfseries}
\newcommand{\OSTFontSubsection}{\normalsize\bfseries}

\newcommand{\OSTHeader}{OSTHeader}
\newcommand{\OSTSubheader}{OSTSubheader}

\newcommand{\OSTDocumentClassI}{%
	\makebox[0.5\linewidth][s]{С\hss Т\hss А\hss Н\hss Д\hss А\hss Р\hss Т}\\
	\makebox[0.7\linewidth][s]{О\hss Р\hss Г\hss А\hss Н\hss И\hss З\hss А\hss Ц\hss И\hss И}}
\newcommand{\OSTDocumentClassII}{\makebox[\linewidth][s]{С Т А Н Д А Р Т \  О Р Г А Н И З А Ц И И}}

\newcommand{\OSTOrganisation}{OSTOrganisation}

\newcommand{\OSTApproverState}{OSTApproverState}
\newcommand{\OSTApproverName}{OSTApproverName}

\newcommand{\OSTClassPrefix}{СТО}
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
	\renewcommand{\OSTDocumentStateI}{Издание официальное}
	\renewcommand{\OSTDocumentStateII}{Издание официальное}
\else
	\renewcommand{\OSTDocumentStateI}{Проект стандарта}
	\renewcommand{\OSTDocumentStateII}{Проект}
\fi


%%% Change list geometry
\RequirePackage{geometry}
\geometry{
	includehead,
	includefoot,
	inner=20mm,
	outer=20mm,
	top=10mm,
	bottom=10mm
}


%%% OST title fields
\newcommand{\OSTTitleOrganisation}{\bfseries\MakeUppercase{\OSTOrganisation}}
\newcommand{\OSTTitleLogo}{OSTTitleLogo}
\newcommand{\OSTTitleDocumentClass}{\bfseries{\OSTDocumentClassI}}
\newcommand{\OSTTitleDocumentNumber}{\large\bfseries\OSTClassPrefix\\\OSTNumber---\\\OSTYear}
\newcommand{\OSTTitleAgreement}{%
	\textbf{УТВЕРЖДАЮ}\\
	\OSTApproverState\\
	\rule{4em}{1pt} \OSTApproverName\\
	<<\rule{2em}{1pt}>> \rule{5em}{1pt} \rule{4em}{1pt}%
}
\newcommand{\OSTTitleDocumentName}{%
	{\OSTFontHeader{\OSTHeader}\\[1ex]\OSTFontSubheader{\OSTSubheader}}\\[4ex]
	{\OSTDocumentStateI}%
}
\newcommand{\OSTTitleFooter}{\OSTCity\\\OSTYear}

%%% Titlepage layout
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

%%% Indentation
\RequirePackage{indentfirst}
\newlength{\OSTParindent}
\setlength{\OSTParindent}{5ex}
\parindent=\OSTParindent

%%% Colotitles definition
\newcommand{\OSTHeaderOdd}{\hfill\textbf{\OSTFullNumber}}
\newcommand{\OSTFooterOdd}{\hfill\upshape\mdseries\thepage}
\newcommand{\OSTHeaderEven}{\textbf{\OSTFullNumber}\hfill}
\newcommand{\OSTFooterEven}{\upshape\mdseries\thepage\hfill}

\renewcommand{\@oddhead}{\OSTHeaderOdd}
\renewcommand{\@oddfoot}{\OSTFooterOdd}
\renewcommand{\@evenhead}{\OSTHeaderEven}
\renewcommand{\@evenfoot}{\OSTFooterEven}


%%% Titles definition
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

%%% Captions
\setlength{\intextsep}{.5\baselineskip}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{dash}{ --- }
\captionsetup[table]{name=Т\ а\ б\ л\ и\ ц\ а,labelsep=dash,justification=raggedright,singlelinecheck=false, skip=1mm}
\captionsetup[figure]{name=Рисунок,labelsep=dash,justification=centering,singlelinecheck=false, skip=1mm}

%%% List environments
\newcommand{\OSTListDash}{\textbf{--}}
\newcommand{\OSTListLabelWidth}{1.2em}
\newcommand{\OSTListIndent}{2ex}

\RequirePackage{calc}
\RequirePackage{enumitem}
\setlist{topsep=\z@,partopsep=\z@,parsep=\parskip,itemsep=\parskip, align=left, labelindent=\OSTListIndent, listparindent=\parindent, labelsep=*}

\setlist[enumerate,1]{label=\OSTasbuk{enumi}), leftmargin=0pt, labelindent=\parindent, itemindent=\parindent+\OSTListLabelWidth}
\setlist[enumerate,2]{label=\arabic{enumii}), leftmargin=\parindent+\OSTListIndent+\OSTListLabelWidth, labelindent=\parindent+\OSTListIndent+\OSTListLabelWidth, itemindent=\OSTListLabelWidth}

\setlist[itemize,1]{leftmargin=0pt, labelindent=\parindent, itemindent=\parindent+\OSTListLabelWidth}
\setlist[itemize,2]{leftmargin=\parindent+\OSTListIndent+\OSTListLabelWidth, labelindent=\parindent+\OSTListIndent+\OSTListLabelWidth, itemindent=\OSTListLabelWidth}
\setlist[itemize]{label=\OSTListDash, leftmargin=\OSTListIndent+\OSTListLabelWidth, labelindent=\OSTListIndent+\OSTListLabelWidth, itemindent=\OSTListLabelWidth, listparindent=\parindent}


%%% Pre-sections
\newcommand{\OSTPresection}[1]{%
	\vspace{\OSTBeforeSectionSkip}
	\begin{center}{\OSTFontSection#1}\end{center}
	\vspace{\OSTAfterSectionSkip}}

%%% TOC definition
\renewcommand\@dotsep{2}
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
			\parindent \@tempdima \rightskip \@pnumwidth
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
	\begingroup
		\parindent \z@ \rightskip \@pnumwidth
		\parfillskip -\@pnumwidth
		\leavevmode
		\advance\leftskip\OST@appwidth
		\hskip -\leftskip
		#1\nobreak\OST@dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	\endgroup
	\fi}


%%% OST environment
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
		\hfill\textbf{Дата введения --- \OSTApplyDate}
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
		\parbox{\linewidth}{Ключевые слова: \OSTLastpageKeywords}\par
		\parbox{\linewidth}{\rule{\linewidth}{1pt}}\par
		\vspace{.5cm}
	\end{center}}

	
%%% stdquote environment
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


%%% Note command
\newcommand*{\note}[1]{\par{\small\mbox{П р и м е ч а н и е --- }#1}}

\newcounter{notecouner}
\newenvironment{notes}{%
	\par\small
	\mbox{П р и м е ч а н и я}
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


%%% Footnotes 
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


%%% Cyrillic alpha-numeric with GOST limitations
\newcommand{\OSTAsbuk}[1]{\expandafter\OST@Alph\csname c@#1\endcsname}
\newcommand{\OST@Alph}[1]{\ifcase#1\or
	А\or Б\or В\or Г\or Д\or
	Е\or Ж\or И\or К\or Л\or
	М\or Н\or П\or Р\or	С\or
	Т\or У\or Ф\or Х\or Ц\or
	Ш\or Щ\or Э\or Ю\or Я\else
	\ClassError{ruost}{Too many items for Asbuk}%
	{You can't use Asbuk for more then 25 items.}\fi}

\AddEnumerateCounter{\OSTAsbuk}{\OST@Alph}{М}

\newcommand{\OSTasbuk}[1]{\expandafter\OST@alph\csname c@#1\endcsname}
\newcommand{\OST@alph}[1]{\ifcase#1\or
	а\or б\or в\or г\or д\or
	е\or ж\or и\or к\or л\or
	м\or н\or п\or р\or	с\or
	т\or у\or ф\or х\or ц\or
	ш\or щ\or э\or ю\or я\else
	\ClassError{ruost}{Too many items for asbuk}%
	{You can't use asbuk for more then 25 items.}\fi}

\AddEnumerateCounter{\OSTasbuk}{\OST@alph}{м}


%%% Appendixes
\newcommand{\OSTAppendixNumericPrefix}{П}

\newcounter{ostappendix}

\ifOST@arabicappendixes
	\renewcommand\OST@appwidth{16ex}
	\renewcommand{\theostappendix}{\OSTAppendixNumericPrefix\arabic{ostappendix}}
\else
	\renewcommand{\theostappendix}{\OSTAsbuk{ostappendix}}
\fi

\newcommand{\OSTAppendix}[2]{%
	\newpage
	\refstepcounter{ostappendix}
	\addcontentsline{toc}{appendix}{\parbox{\OST@appwidth}{Приложение \theostappendix}#1\OSTHspace#2}
	\begin{center}
		{\OSTFontSection Приложение\OSTHspace\theostappendix}\par
		#1\bigskip\par
		{\OSTFontSubsection#2}\par
	\end{center}}

	
%%%	Bibliography
\newcommand{\OSTRefname}{Библиография}

\renewcommand{\thebibliography}[1]{%
	\OSTPresection{\OSTRefname}
	\addcontentsline{toc}{section}{\OSTRefname}
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


%%% Sections marking scheme
% Sections can be in appendixes

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

%%% Tables marking scheme
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