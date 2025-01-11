\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmb-thesis}[2024/08/25 LaTeX class for Federico Melo Barrero's capstone undergraduate project.]

% General options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,twoside]{book}

% Language: Spanish
\RequirePackage[spanish]{babel}
\RequirePackage{hyphenat}
\newcommand{\say}[1]{\textquotedblleft#1\textquotedblright}  % Quotation marks.

% Load custom style files
\RequirePackage{formatting}
\RequirePackage{floats}
\RequirePackage{boxes}

% Glossary
\RequirePackage{glossaries}
\RequirePackage{glossary/glossary}

% Bibliography
\RequirePackage[backend=biber,style=numeric]{biblatex}