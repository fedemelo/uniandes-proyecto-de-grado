\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmb-proposal}[2024/08/25 LaTeX class for Federico Melo Barrero's capstone undergraduate project proposal.]


% Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Any non-defined option will be passed to the article document class.
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,twoside]{article} % Base class: article.


\RequirePackage{xcolor} % Color management.


% Text format
\parindent 1.27cm
\parskip   6pt
%\renewcommand{\baselinestretch}{2} % Interlineado.


% Language
\RequirePackage[spanish]{babel}
\RequirePackage{hyphenat} % Manage hyphenation.


% Customization of barriers for floats
\RequirePackage{placeins} % Defines command \FloatBarrier so floats cannot bypass a certain point.
\RequirePackage{nicefrac} % Fractions with / format.
\let\Oldsection\section
\renewcommand{\section}{\FloatBarrier\Oldsection} % Floats stay within the section they are placed.
\let\Oldsubsection\subsection
\renewcommand{\subsection}{\FloatBarrier\Oldsubsection} % Floats stay within the subsection they are placed.
\let\Oldsubsubsection\subsubsection
\renewcommand{\subsubsection}{\FloatBarrier\Oldsubsubsection} % Floats stay within the subsubsection they are placed.


% Font
\RequirePackage{times}

\renewcommand{\normalsize}{\@setfontsize\normalsize\@xiipt\@xivpt}
\newcommand{\XIIIPT}{\@setfontsize\xiiipt{13}{17}}
\newcommand{\XVIPT}{\@setfontsize\xvipt{16}{20}}


% Tables
\RequirePackage{booktabs}
\renewcommand{\tablename}{Tabla}
\addto\captionsspanish{\renewcommand{\tablename}{Tabla}}  % Change "Cuadro" to "Tabla"
% Captions for floats
\RequirePackage{caption}
\captionsetup[table]{
	format=plain,
	labelsep=newline,  % Ensures the title is placed below "Tabla 1"
	labelfont={bf,sf},  % "Tabla 1" in bold sans-serif
	textfont={normalfont,it},  % Title in normal serif and italics
	justification=raggedright,  % Left-align the caption
	singlelinecheck=off  % Allow multiline captions without centering each line
}


% Customization of itemize environment
\RequirePackage{enumitem}
\renewcommand{\labelitemi}{\( \bullet \)} % Item level 1: Bullet.
\renewcommand{\labelitemii}{\( \circ \)} % Item level 2: Circunference.
\renewcommand{\labelitemiii}{\( \diamond \)}
\renewcommand{\labelitemiv}{\(\triangleright\)}


% Hyperlinks
\RequirePackage{hyperref} % Hyperlinks to refs.
\hypersetup{%
	colorlinks=false,
	linkbordercolor={cyan!40!black},% hyperlink borders
	linkcolor={cyan!40!black}, % Cyan for internal links.
	citecolor={blue!50!black}, % Blue for external hyperlinks.
	urlcolor={blue!80!black} % Dark blue for citations.
}


% Sections

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-6\p@ \@plus -4\p@ \@minus -4\p@}%
  {0\p@ \@plus 4\p@ \@minus 4\p@}%
  {\normalfont\XIIIPT\bfseries\boldmath
	  \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-6\p@ \@plus -4\p@ \@minus -4\p@}%
	{0\p@ \@plus 4\p@ \@minus 4\p@}%
	{\normalfont\normalsize\bfseries\boldmath
		\rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-6\p@ \@plus -4\p@ \@minus -4\p@}%
	{0\p@ \@plus 4\p@ \@minus 4\p@}%
	{\normalfont\normalsize\bfseries\boldmath
		\rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\RequirePackage{titlesec}
\titlelabel{\thetitle.\hspace{1ex}}



% First page

\newcounter{instn}
\setcounter{instn}{1}
\newcommand{\instnum}{\arabic{instn}}
\newcommand{\inst}[1]{\ensuremath{^{#1}}}
\newcommand{\nextinstitute}{\\\mbox{}\\[-6pt] \addtocounter{instn}{1}\inst{\instnum}}
\newcommand{\email}[1]{\\\mbox{}\\[-6pt]\footnotesize\href{mailto:#1}{\texttt{#1}}}
\renewcommand{\and}{, }

\newcommand{\authortag}[1]{$^{#1}$}

\def\address#1{\gdef\@address{#1}}

\def\@maketitle{\newpage
	\begin{center}
		\vspace*{-.7cm}
		{\XVIPT\bf\@title\par}
		\vglue 6pt plus 3pt minus 3pt
			{\normalsize
				\textbf{\begin{tabular}[t]{c}\@author\end{tabular}}\par}
		\vspace*{-.3cm}
		{\footnotesize\texttt{\begin{tabular}[t]{c}\@email\end{tabular}}\par}
		\vglue 6pt plus 3pt minus 3pt
			{\normalsize
				\begin{tabular}[t]{c}\inst{\instnum}\@address\end{tabular}\par}
		\vglue 6pt plus 3pt minus 3pt
	\end{center}\par
}

\def\email#1{\gdef\@email{#1}}

\let\maketitleOLD\maketitle
\renewcommand{\maketitle}{\maketitleOLD\thispagestyle{empty}}


% Page format
\RequirePackage[a4paper,top=3.5cm,left=3cm,right=3cm,bottom=2.5cm]{geometry}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[OL]{\normalsize \textbf{\thepage} \quad \textcolor{green!50!black}{\(\bullet\)}  \quad \textsf{Propuesta de proyecto de grado} \hbox{  }}
\fancyhead[OR]{}
\fancyhead[EL]{}
\fancyhead[ER]{\normalsize \textsf{Federico Melo Barrero} \quad \textcolor{green!50!black}{\(\bullet\)} \quad \textbf{\thepage}}

