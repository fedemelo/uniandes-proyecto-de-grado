\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmb-thesis}[2024/08/25 LaTeX class for Federico Melo Barrero's capstone undergraduate project.]


% General options

% Any non-defined option will be passed to the book document class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} 
\ProcessOptions\relax
% Base class: book
\LoadClass[12pt,letterpaper,twoside]{book}


% Text format
\parindent 1.27cm
\parskip   6pt
%\renewcommand{\baselinestretch}{2}  % Interlineado.


% Font
\RequirePackage{times}

\renewcommand{\normalsize}{\@setfontsize\normalsize\@xiipt\@xivpt}
\newcommand{\XIIIPT}{\@setfontsize\xiiipt{14}{18}}
\newcommand{\XVIPT}{\@setfontsize\xvipt{18}{22}}


% Language: Spanish
\RequirePackage[spanish]{babel}
\RequirePackage{hyphenat}  % Manage hyphenation.
\newcommand{\say}[1]{\textquotedblleft#1\textquotedblright}  % Quotation marks.


% Customization of barriers for floats
\RequirePackage{placeins}  % Defines command \FloatBarrier so floats cannot bypass a certain point.
% Floats stay within the section they are placed.
\let\Oldsection\section
\renewcommand{\section}{\FloatBarrier\Oldsection}
% Floats stay within the subsection they are placed.
\let\Oldsubsection\subsection
\renewcommand{\subsection}{\FloatBarrier\Oldsubsection} 
% Floats stay within the subsubsection they are placed.
\let\Oldsubsubsection\subsubsection
\renewcommand{\subsubsection}{\FloatBarrier\Oldsubsubsection} 


% Customization of sections

\renewcommand\section{\@startsection{section}{1}{\z@}%
                       {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                       {0\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\XVIPT\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                       {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                       {0\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\XIIIPT\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                          {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                          {0\p@ \@plus 4\p@ \@minus 4\p@}%
                          {\normalfont\normalsize\bfseries\boldmath
                            \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\RequirePackage{titlesec}
\titlelabel{\thetitle.\hspace{1ex}}



\RequirePackage[table,xcdraw,dvipsnames]{xcolor} % Color management.

% Customization of tables

\definecolor{lightgreen}{RGB}{230, 255, 230}  % Light green color
\newcommand{\alternatecolors}{%
  \rowcolors{2}{white}{lightgreen} % Alternate rows between light green and white
}
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


% Epigraph
\RequirePackage{epigraph}
\setlength\epigraphwidth{.8\textwidth}
\setlength\epigraphrule{0pt}


% Code 
\RequirePackage{minted}

\definecolor{codecolor}{HTML}{FFC300}

\RequirePackage{tcolorbox}
\tcbuselibrary{most,listingsutf8,minted}

\tcbset{tcbox width=auto,left=1mm,top=1mm,bottom=1mm,
right=1mm,boxsep=1mm,middle=1pt}

\newtcblisting{myr}[1]{colback=codecolor!5,colframe=codecolor!80!black,listing only, 
minted options={numbers=left, style=tcblatex,fontsize=\tiny,breaklines,autogobble,linenos,numbersep=3mm},
left=5mm,enhanced,
title=#1, fonttitle=\bfseries,
listing engine=minted,minted language=r}


% Visible TODOs
\newcommand{\TODO}[1]{\textcolor{OliveGreen}{TODO: #1}}


% Use symbols instead of numbers for footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Get outlines right without rerunning 
\RequirePackage{bookmark}

% Glossary
\RequirePackage{glossaries}
\RequirePackage{thesis-glossary}

% Page format
\RequirePackage[a4paper,top=3.5cm,left=3cm,right=3cm,bottom=2.5cm]{geometry}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{} 
\fancyhead[OL]{\normalsize \textbf{\thepage} \quad \textcolor{green!50!black}{\(\bullet\)}  \quad \textsf{Propuesta de proyecto de grado} \hbox{  }}
\setlength{\headheight}{14.39998pt} % Avoids a warning about the headheight.
\fancyhead[OR]{}
\fancyhead[EL]{}
\fancyhead[ER]{\normalsize \textsf{Federico Melo Barrero} \quad \textcolor{green!50!black}{\(\bullet\)} \quad \textbf{\thepage}}

% My own, personalized boxes
\RequirePackage{boxes}