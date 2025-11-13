% 0907.cls - LaTeX Document Class
% A clean and modern class for LaTeX documents with syntax highlighting support
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{0907}

% =======================
% Class Options
% =======================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{report}

% =======================
% Core Packages
% =======================
\RequirePackage{ifxetex,ifluatex}
\RequirePackage[english]{babel}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{color}
\RequirePackage{framed}
\RequirePackage{fancyvrb}

% =======================
% Font and Encoding
% =======================
\RequirePackage{fvextra}
% Use fvextra for better line breaking in code blocks
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,fontsize=\small,commandchars=\\\{\}}

% =======================
% Pandoc Syntax Highlighting Macros
% =======================
\ifxetex\relax
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX}
\else\ifluatex\relax
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX}
\else
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
\fi\fi
\RequirePackage{microtype}

% =======================
% Layout and Formatting Packages
% =======================
\RequirePackage{float}
\RequirePackage{geometry}
\geometry{left=1cm,right=1cm,top=1.5cm,bottom=1.2cm}
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\usetikzlibrary{backgrounds}
\RequirePackage{tcolorbox}
\tcbuselibrary{listings,breakable,skins}
\RequirePackage[hidelinks]{hyperref}

% =======================
% Configuration Variables
% =======================
\newcommand{\logoFile}{cover.pdf}
\newcommand{\SetLogo}[1]{\renewcommand{\logoFile}{#1}}
\newlength{\headbarheight}
\setlength{\headbarheight}{2.0cm}
\newcommand{\SetHeadBarHeight}[1]{\setlength{\headbarheight}{#1}}

\newcommand{\docTitle}{}
\newcommand{\docAuthor}{}
\newcommand{\SetDocTitle}[1]{\renewcommand{\docTitle}{#1}}
\newcommand{\SetDocAuthor}[1]{\renewcommand{\docAuthor}{#1}}

% =======================
% Color Definitions
% =======================
\definecolor{headbar}{HTML}{000000}
\definecolor{codebg}{HTML}{FAFAFA}
\definecolor{codeframe}{HTML}{E0E0E0}
\definecolor{keywordcolor}{HTML}{0000CD}
\definecolor{commentcolor}{HTML}{008000}
\definecolor{stringcolor}{HTML}{B22222}
\definecolor{shadecolor}{RGB}{250,250,250}
% Severity colors for findings
\definecolor{highcolor}{HTML}{D32F2F}
\definecolor{mediumcolor}{HTML}{F57F17}
\definecolor{lowcolor}{HTML}{1565C0}
\definecolor{highbg}{HTML}{FFEBEE}
\definecolor{mediumbg}{HTML}{FFF3E0}
\definecolor{lowbg}{HTML}{E3F2FD}
% =======================
% Listing Style Configuration
% =======================
\lstdefinestyle{0907style}{
  basicstyle=\ttfamily\small,
  keywordstyle=\color{keywordcolor}\bfseries,
  commentstyle=\color{commentcolor}\itshape,
  stringstyle=\color{stringcolor},
  numbers=left,
  numberstyle=\tiny\color{gray},
  frame=leftline,
  framerule=1pt,
  rulecolor=\color{codeframe},
  backgroundcolor=\color{codebg},
  breaklines=true,
  breakatwhitespace=false,
  postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\hookrightarrow\space}},
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  xleftmargin=2mm,
  xrightmargin=2mm
}

% Apply the listings style globally so any \lstinline or listings use it by default
\lstset{style=0907style}

% =======================
% Code Block Environments
% =======================
\newtcblisting{CodeBlock}[2][]{%
  listing only,
  breakable,
  enhanced,
  left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm,
  colback=codebg,
  colframe=codeframe,
  boxsep=0pt,
  arc=0pt,
  outer arc=0pt,
  listing options={style=0907style,#1},
  title={#2},
  fonttitle=\normalsize\bfseries,
  coltitle=black
}

\newcommand{\includecode}[2][]{\lstinputlisting[style=0907style,#1]{#2}}

% Configure Pandoc Shaded environment with tcolorbox (breakable for line wrapping)
\makeatletter
\@ifundefined{Shaded}{
  \newenvironment{Shaded}{%
    \begin{tcolorbox}[
      breakable,
      enhanced,
      left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm,
      colback=codebg,
      colframe=codeframe,
      boxsep=0pt,
      arc=0pt,
      outer arc=0pt,
      borderline west={1pt}{0pt}{codeframe}
    ]
  }%
  {\end{tcolorbox}}
}{
  \renewenvironment{Shaded}{%
    \begin{tcolorbox}[
      breakable,
      enhanced,
      left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm,
      colback=codebg,
      colframe=codeframe,
      boxsep=0pt,
      arc=0pt,
      outer arc=0pt,
      borderline west={1pt}{0pt}{codeframe}
    ]
  }%
  {\end{tcolorbox}}
}
\makeatother

% =======================
% Page Header and Footer
% =======================
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{\headbarheight}
\setlength{\headsep}{1.2cm}

\fancyhead[L]{%
  \begin{tikzpicture}[remember picture,overlay,on background layer]
    \fill[headbar] (current page.north west) rectangle ([yshift=-\headbarheight]current page.north east);
    \node[anchor=west, inner sep=0] at ([xshift=1.2cm,yshift=-0.5\headbarheight]current page.north west) {\includegraphics[height=1.6cm]{\logoFile}};
  \end{tikzpicture}%
}

\fancyhead[R]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=east, text=white, font=\normalsize\bfseries] at ([xshift=-1.2cm,yshift=-0.5\headbarheight]current page.north east) {\thepage};
  \end{tikzpicture}%
}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[L]{%
    \begin{tikzpicture}[remember picture,overlay,on background layer]
      \fill[headbar] (current page.north west) rectangle ([yshift=-\headbarheight]current page.north east);
      \node[anchor=west, inner sep=0] at ([xshift=1.2cm,yshift=-0.5\headbarheight]current page.north west) {\includegraphics[height=1.6cm]{\logoFile}};
    \end{tikzpicture}%
  }%
  \fancyhead[R]{%
    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=east, text=white, font=\normalsize\bfseries] at ([xshift=-1.2cm,yshift=-0.5\headbarheight]current page.north east) {\thepage};
    \end{tikzpicture}%
  }%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% =======================
% Line Spacing Configuration
% =======================
\renewcommand{\baselinestretch}{1.0}
\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}

% =======================
% Hyperlink Configuration
% =======================
\hypersetup{
  pdftitle={},
  pdfauthor={},
  colorlinks=true,
  linkcolor=blue,
  urlcolor=blue,
  citecolor=blue,
  hidelinks=true
}

\AtBeginDocument{%
  \ifx\docTitle\@empty\else\hypersetup{pdftitle={\docTitle}}\fi
  \ifx\docAuthor\@empty\else\hypersetup{pdfauthor={\docAuthor}}\fi
}

% =======================
% Pandoc Compatibility Macros
% =======================
% Define \tightlist for compact lists (Pandoc requirement)
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% =======================
% Pandoc Compatibility Macros
% =======================
% Define \tightlist for compact lists (Pandoc requirement)
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% =======================
% Severity Level Macros and Styling
% =======================
% Create colored badges for severity levels
\newcommand{\HighSeverity}{\textcolor{white}{\colorbox{highcolor}{\textbf{\,High\,}}}}
\newcommand{\MediumSeverity}{\textcolor{white}{\colorbox{mediumcolor}{\textbf{\,Medium\,}}}}
\newcommand{\LowSeverity}{\textcolor{white}{\colorbox{lowcolor}{\textbf{\,Low\,}}}}

% Alternative inline versions without background
\newcommand{\HighText}{\textcolor{highcolor}{\textbf{High}}}
\newcommand{\MediumText}{\textcolor{mediumcolor}{\textbf{Medium}}}
\newcommand{\LowText}{\textcolor{lowcolor}{\textbf{Low}}}

% =======================
% Example Environments
% =======================
\newcommand{\ExampleCode}{%
  \begin{CodeBlock}[language=Java]{示例 — Java}
  public class HelloWorld {\newline
    public static void main(String[] args) {\newline
      System.out.println("Hello, world!");\newline
    }\newline
  }
  \end{CodeBlock}
}

% =======================
% Pandoc Support Configuration
% =======================
% Highlighting environment for code blocks
\makeatletter
\@ifundefined{Highlighting}{
  \newenvironment{Highlighting}{}{}
}{}
\makeatother

% Define Pandoc highlight macros if not already defined
\makeatletter
\@ifundefined{NormalTok}{\newcommand{\NormalTok}[1]{#1}}{}
\@ifundefined{KeywordTok}{\newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{#1}}}}{}
\@ifundefined{DataTypeTok}{\newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}}{}
\@ifundefined{DecValTok}{\newcommand{\DecValTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}}{}
\@ifundefined{BaseNTok}{\newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}}{}
\@ifundefined{FloatTok}{\newcommand{\FloatTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}}{}
\@ifundefined{CharTok}{\newcommand{\CharTok}[1]{\textcolor[rgb]{0.65,0.16,0.16}{#1}}}{}
\@ifundefined{StringTok}{\newcommand{\StringTok}[1]{\textcolor[rgb]{0.65,0.16,0.16}{#1}}}{}
\@ifundefined{CommentTok}{\newcommand{\CommentTok}[1]{\textcolor[rgb]{0.25,0.50,0.37}{\textit{#1}}}}{}
\@ifundefined{OtherTok}{\newcommand{\OtherTok}[1]{#1}}{}
\@ifundefined{AlertTok}{\newcommand{\AlertTok}[1]{\textcolor[rgb]{1.00,0.00,0.00}{#1}}}{}
\@ifundefined{FunctionTok}{\newcommand{\FunctionTok}[1]{\textcolor[rgb]{0.02,0.16,0.49}{#1}}}{}
\@ifundefined{RegionMarkerTok}{\newcommand{\RegionMarkerTok}[1]{#1}}{}
\@ifundefined{ErrorTok}{\newcommand{\ErrorTok}[1]{\textcolor[rgb]{1.00,0.00,0.00}{#1}}}{}
\@ifundefined{OperatorTok}{\newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}}{}
\@ifundefined{VariableTok}{\newcommand{\VariableTok}[1]{\textcolor[rgb]{0.10,0.09,0.49}{#1}}}{}
\@ifundefined{ControlFlowTok}{\newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{#1}}}}{}
\@ifundefined{BuiltInTok}{\newcommand{\BuiltInTok}[1]{#1}}{}
\@ifundefined{ExtensionTok}{\newcommand{\ExtensionTok}[1]{#1}}{}
\@ifundefined{PreprocessorTok}{\newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.00,0.44,0.13}{#1}}}{}
\@ifundefined{AttributeTok}{\newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.49,0.29,0.05}{#1}}}{}
\@ifundefined{ConstantTok}{\newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.02,0.16,0.49}{#1}}}{}
\@ifundefined{SpecialCharTok}{\newcommand{\SpecialCharTok}[1]{#1}}{}
\@ifundefined{VerbatimStringTok}{\newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.65,0.16,0.16}{#1}}}{}
\@ifundefined{SpecialStringTok}{\newcommand{\SpecialStringTok}[1]{#1}}{}
\@ifundefined{ImportTok}{\newcommand{\ImportTok}[1]{#1}}{}
\@ifundefined{DocumentationTok}{\newcommand{\DocumentationTok}[1]{#1}}{}
\@ifundefined{AnnotationTok}{\newcommand{\AnnotationTok}[1]{#1}}{}
\@ifundefined{CommentVarTok}{\newcommand{\CommentVarTok}[1]{#1}}{}
\@ifundefined{WarningTok}{\newcommand{\WarningTok}[1]{\textcolor[rgb]{1.00,0.00,0.00}{#1}}}{}
\@ifundefined{InformationTok}{\newcommand{\InformationTok}[1]{#1}}{}
\makeatother

% =======================
% End of Class File
% =======================
\endinput
