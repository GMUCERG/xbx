%%  BASIC STYLE PAGE FOR CERG
%%
%%  Developed by:
%%      Panasayya Yalla 
%%      George Mason University
%%      (style adapted from GMU thesis latex style)
%%
%%
%%
%%
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cergdoc}[2018/03/20 v1.0 CERG Documentation class]
\LoadClass[letterpaper]{report}

\RequirePackage{graphicx} % needed for logo and pictures
\RequirePackage{color}

% Color Definitions
\definecolor{cergpurple}{RGB}{64,5,116}
\definecolor{cergpink}{RGB}{128,35,145}
\definecolor{cerglightblue}{RGB}{140,159,229}
\definecolor{cergblue}{RGB}{100,116,172}

% Title Page

%https://tex.stackexchange.com/questions/125383/default-values-in-newcommand-renewing-maketitle
\let\@subtitle\@empty
\newcommand{\subtitle}[1][Subtitle]{\gdef\@subtitle{#1}}

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

\renewcommand\maketitle{
  \begin{alwayssingle}
    \begin{center}
      ~
      \rule{\textwidth}{1pt}\par % Thick horizontal line
      {\Huge\bfseries\@title\par}
      \rule{\textwidth}{1pt}\par % Thick horizontal line

      {\ifx\@subtitle\@empty\else\large\vspace*{1ex}\par\@subtitle\par\fi}
      {{\Large \bf \@author} \par}

    \end{center}

  \end{alwayssingle}

}

%%%%%CHAPTER SETTINGS
\def\startofchapters{%
    \renewcommand{\thepage}{\arabic{page}}
    \setcounter{chapter}{0}
    %\ls{2}
    % replacing this with the \doublespacing command from setspace package, as
    % the \ls macro above makes text in figure captions and footnotes double
    % spaced, which is undesirable. setspace package avoid this. (Muhammad Abdulla)
    \doublespacing
    \setcounter{page}{0}
}
%--- chapters ---


\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \addcontentsline{toc}{chapter}{\protect
        %    \numberline{\thechapter} \bf #1}  %% USE FOR BOLD TOC!!!!!!
            \numberline{\thechapter} #1}
      \else
            \addcontentsline{toc}{chapter}{#1}
      \fi
   \chaptermark{#1}
%  \addtocontents{lof} {\protect\addvspace{10\p@}}
%  \addtocontents{lot} {\protect\addvspace{10\p@}}
   \if@twocolumn
           \@topnewpage[\@makechapterhead{#2}]%
     \else \@makechapterhead{#2}%
           \@afterheading
     \fi}

\def\@schapter#1{
        \refstepcounter{chapter}
        \typeout{\@chapapp\space\thechapter.}
        \addcontentsline{toc}{chapter}{\protect
        \numberline{}\hspace*{-0.25in}#1}
   \chaptermark{#1}
%  \addtocontents{lof}{\protect\addvspace{0pt}}
%  \addtocontents{lot}{\protect\addvspace{0pt}}
   \if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
        \else \@makeschapterhead{#1}
              \@afterheading\fi}


\def\l@chapter{\vskip 0.0em plus 1pt
        %\bf
        \@dottedtocline{0}{0.0em}{1.35em}
}

\def\@makechapterhead#1{
  { \parindent 0pt \raggedright
    \vspace*{0.27 in}%{0.75in}
%%%    \centerline{\Large \bf \@chapapp{} \thechapter
    \begin{center}
     {\Large \bf Chapter \thechapter
    \Large \bf
%%%   \space : #1} \par
    : #1} \par
\end{center}
    \nobreak
    \vskip 22 pt %40pt
  }

}

\def\@makeschapterhead#1{
  { \parindent 0pt \raggedright
    \vspace*{0.6 in}%{0.75in}
    \centerline{\Large \bf #1} \par
    \nobreak
    \vskip 40pt
  }
}
