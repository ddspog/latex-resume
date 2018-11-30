% !TEX program = lualatex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvplasmati}[2017/11/22 Plasmati CV Template]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
    family=cv,
    prefix=cv@,
}

\DeclareStringOption[EN,PT]{lang}
\ProcessKeyvalOptions*
 
% Default font size and paper size
\LoadClass[a4paper,10pt]{article}

% Font properties
\RequirePackage{fontspec} 
\defaultfontfeatures{Ligatures=TeX}
\setmainfont[Scale = .90]{[GillSans.otf]}

% Customize the \section command, use a bar with large title
\RequirePackage[noindentafter]{titlesec}
\titleformat{\section}{
    \raggedright\large
    }{}{0em}{}[\titlerule] % Text formatting of sections
    \titlespacing{\section}{0pt}{3pt}{5pt} % Spacing around sections
    
% Required for specifying custom colors
\RequirePackage[usenames,dvipsnames]{xcolor}
% Margin formatting of the A4 page, an alternative to layaureo can be \usepackage{fullpage}
\RequirePackage[big]{layaureo}

% Enable loading CV info from a json file
\RequirePackage{cvinfo}

\newcommand{\addInfo}[3]{%
    \begin{minipage}{0.3\textwidth}%
        \begin{flushleft}%
            #1%
        \end{flushleft}%
    \end{minipage}%
    \hspace*{\fill}%
    \begin{minipage}{0.35\textwidth}%
        \begin{center}%
            #2%
        \end{center}%
    \end{minipage}%
    \hspace*{\fill}%
    \begin{minipage}{0.3\textwidth}%
        \begin{flushright}%
            #3%
        \end{flushright}%
    \end{minipage}%
}

\newcommand{\addSites}[2]{%
    \begin{minipage}{0.4\textwidth}%
        \begin{center}%
            #1%
        \end{center}%
    \end{minipage}%
    \hspace*{\fill}%
    \begin{minipage}{0.4\textwidth}%
        \begin{center}%
            #2%
        \end{center}%
    \end{minipage}%
}

\newcommand{\addInfoBf}[3]{%
    \addInfo{%
        \textbf{#1}%
    }{%
        \textbf{#2}%
    }{%
        \textbf{#3}%
    }
}

\pagenumbering{gobble}

\newenvironment{cvdoc}[1]{
    \begin{loadinfo}{#1}
        \newenvironment{contact}{%
            \addInfo{
                \small{%
                    \ctcaddress{\cv@lang}\\
                    \ctccity,\ctcstate,\ctccountry{\cv@lang}\\%
                }
            }{
                \LARGE{\textbf{\ctcname{3}}}
            }{
                \small{%
                    \ctccellphone{}\\
                    \ctcemail%
                }
            }\\[5pt]
            \addSites{github.com/\ignorespaces\ctcgithub}{facebook.com/\ignorespaces\ctcgitlab}
        }{}
        \newenvironment{education}{%
            \section{\textbf{\kwdedutitle{\cv@lang}}}
            \addInfoBf{\edulocal{\cv@lang}}{\eduuniversity{\cv@lang}}{\eduperiod{\cv@lang}}
            \begin{itemize}
                \setlength\itemsep{-0.75em}
                \item \edumajor{\cv@lang}
                \item \edugrade{\cv@lang}
            \end{itemize}
        }{}
        \newenvironment{employment}{%
            \section{\textbf{\kwdwrktitle{\cv@lang}}}
            \newcommand{\showwrk}[1]{%
                \addInfoBf{\wrktype{\cv@lang}{####1}}{\wrkemployer{\cv@lang}{####1}}{\wrkperiod{\cv@lang}{####1}}
                \begin{itemize}
                    \setlength\itemsep{-0.25em}
                    \item \wrktitle{\cv@lang}{####1}
                    \item \wrkinfo{\cv@lang}{####1}
                \end{itemize}
            }
        }{}
        \newenvironment{skills}{
            \section{\textbf{\kwdskltitle{\cv@lang}}}
            \begin{itemize}
                \setlength\itemsep{-0.75em}
                \item \kwdsklstrong{\cv@lang}: \sklstrong{}
                \item \kwdsklknowledgeable{\cv@lang}: \sklknowledgeable{}
            \end{itemize}
        }{}
}{            
    \end{loadinfo}
}