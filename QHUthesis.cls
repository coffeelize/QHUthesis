%   This is file `QHUthesis.cls',
%	@author WuZhiPeng
% 	@date 2022/4/19
%   This template for QingHai university undergraduate thesis

%---------- cls文件声明 ----------
\ProvidesClass{QHUthesis}[2023/5/19 v2.0]
\NeedsTeXFormat{LaTeX2e}

\newcommand{\class}{本科生毕业设计} %毕业论文
\renewcommand{\title}{A thesis class for Jinan University} %默认英文标题
\newcommand{\biaoti}{青海大学本科生论文模板} %默认中文标题
\newcommand{\xueyuan}{机械工程学院}
\newcommand{\zhuanye}{机械电子工程}
\newcommand{\daoshi}{Coffeelze}
\newcommand{\xingming}{coffeelize}
\newcommand{\xuehao}{YS210802020148}
\newcommand{\dateOfGrant}{2021年5月20日}
\newcommand{\grade}{2020}

\LoadClass[a4paper,UTF8,openany,oneside]{ctexbook}
\RequirePackage{ctex}
%\RequirePackage{xeCJK}
%\setCJKmainfont[AutoFakeBold=1.3, ItalicFont={KaiTi}]{FangSong} %仿宋伪粗体，并使用\fangsong命令
%\renewcommand{\fangsong}{\rmfamily}

%%%页边距
% 每一页的左边距为 30 mm，上、下和右边距为 25 mm
% 页眉高度1.5cm，页脚高度1.4cm
% headheight:设置页眉的高度
% headsep:设置页眉与正文之间的距离
% footskip:设置页脚的高度
%%% 页边距
\RequirePackage[top=2.5cm, bottom=2.5cm, left=3cm, right=2.5cm,headheight=1.5cm,footskip=1.4cm]{geometry}


%%%
%常用宏包
%%%

%========双语标题设置
\RequirePackage{caption}
\RequirePackage{bicaption}
\captionsetup[figure][bi-second]{name=Fig} %设置图的英文编号前缀
\captionsetup[table][bi-second]{name=Table} %设置表的英文编号前缀

%参考文献引用上标格式
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\RequirePackage{pifont} %带圈数字，各种符号

%%%
% \uline粗下划线
%\dotuline点下划线
%\dashuline虚线下划线
%% %
\RequirePackage{ulem} %加粗下划线
\renewcommand{\ULthickness}{1.2pt} % 设置下划线粗细

%========数学公式、数学字体，数学符号
\RequirePackage{amsmath,amsfonts,amssymb}

%========插图
\RequirePackage{graphicx}
\RequirePackage{subfigure} %子图
%========表格
\RequirePackage{booktabs}
\RequirePackage{array} %对表格列格式的扩展
\RequirePackage{multirow} %合并多行单元格
\RequirePackage{makecell} %支持在单元格里排版多行内容

\RequirePackage{setspace} %行距设置
\RequirePackage{listings} %代码高亮
\RequirePackage{xcolor} %颜色设置


%========工具箱
\RequirePackage{etoolbox}
\RequirePackage[unicode,psdextra]{hyperref}
%cleveref加载在hyperref之后
\RequirePackage[nameinlink]{cleveref}


%========修改章节标题格式
\RequirePackage{titlesec}
\RequirePackage{enumitem} %列表

%%%
%页眉页脚样式
%%%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancypagestyle{frontmatterstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot{} 
%	\fancyfoot[C]{\thepage}
%	\renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0.4pt}
	\chead{\biaoti}
	\fancyfoot{} 
	\fancyfoot[C]{\thepage} %
}
\appto\mainmatter{\pagestyle{mainmatterstyle}}%页面样式
\appto\mainmatter{\linespread{1.3889}\selectfont}%行距

\fancypagestyle{plain}{
	\thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}


%%%
% 章节样式，章节编号后添加小数点
%%%
\newcommand\prechaptername{ }
\newcommand\postchaptername{.}

%%%
%=======目录样式=======
%%%

% 设置目录深度
\setcounter{secnumdepth}{3}
\setlength{\parindent}{2em}

%name：在章节前后插入文本；number：章节编号的数字样式
\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter} 

%========控制生成的表格和图片的目录格式
\renewcommand{\contentsname}{\zihao{3} 目\quad 录} %设置目录两个字体字号
\RequirePackage[titles,subfigure]{tocloft}
%\renewcommand{\cftdot}{$\cdot$} %中间点
\renewcommand{\cftdotsep}{0.5} %设置点间距
\renewcommand{\cftchapafterpnum}{\vspace{2pt}} %设置chapter章节后间距
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}%设置章节标题与页码之间的导引符
\renewcommand{\cftsecleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep} 

\setlength{\cftbeforechapskip}{0pt} %一级标题章节间隔
\setlength{\cftbeforesecskip}{0pt} %二级标题章节间隔
\setlength{\cftbeforesubsecskip}{0pt} %三级标题间隔

%目录章标题字体样式
\renewcommand\cftchapfont{\songti\zihao{4}}
\renewcommand\cftsecfont{\songti\zihao{4}}
\renewcommand\cftsubsecfont{\songti\zihao{4}}
\renewcommand\cftchappagefont{\mdseries}

%%%
% 章节字体、字号和间距设置
%1级标题为三号，加粗，居中，段后1行,
%2级标题为四号，加粗；段前 0.5 行，段后 0.5 行
%3级标题小四号
%4级标题(1)，4级标题及以下字号同3级标题
%5级标题①，LaTeX中没有那么小的标题...
%%%


\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}
\titleformat{\chapter}{\centering\bfseries\zihao{3}\songti}{\chaptername}{0.5em}{} %章节标题
\titlespacing{\chapter}{0pt}{0pt}{16pt}
\titleformat{\section}{\bfseries\zihao{4}\songti}{\thesection}{0.5em}{} %一级标题
\titlespacing{\section}{0pt}{7pt}{7pt}
\titleformat{\subsection}{\zihao{-4}\songti}{\thesubsection}{0.5em}{} %二级标题
\titlespacing{\subsection}{0pt}{0pt}{0pt}
%%%
% 定制三级标题样式，标题格式为(1)、(2)...
%%%
\RequirePackage{regexpatch}
\newcommand{\subsubsectionnum}{\arabic{subsubsection}}
\xpatchcmd*{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}{(\arabic{subsubsection})}{}{}
\titleformat{\subsubsection}
{\zihao{-4}\songti}{(\subsubsectionnum)}{0.5em}{}

%%% 定义增强下划线
\def\QHU@underline[#1]#2{%
	\uline{\hbox to #1{\hfill#2\hfill}}}
\def\QHUunderline{\@ifnextchar[\QHU@underline\underline}

%%%
% 封面
%%%
\renewcommand{\titlepage}{
	%封面样式
	\thispagestyle{empty}
	\begin{center}
		\includegraphics[width=7.43cm]{QHU.bmp}\\
		\vspace{1.2cm}
		{\songti\zihao{1}\textbf{\class} \\}%
		\vspace{2.5cm}
		\zihao{4}
		\vspace{0.25cm}
		% 中英文标题
		{\bf\songti\zihao{3}\biaoti} \\[0.40cm]
		{\bf\zihao{3}\title} \\[0.40cm]
		\def\tabcolsep{6pt}
		\expandarg
		\newcounter{title_str_number}
		\vspace*{72pt}
		\begin{tabular}{rl}%标题右对齐，内容左对齐
			{\songti\zihao{-3} \textbf{院\quad \quad 系}} & {\QHUunderline[258pt]{\songti\zihao{-3} \textbf{\xueyuan}}} \\[0.7cm]%院系
			{\songti\zihao{-3} \textbf{专\quad \quad 业}} & {\QHUunderline[122pt]{\songti\zihao{-3}\textbf{\zhuanye}}}{\songti \textbf{年级}}{\QHUunderline[105pt]{\songti\zihao{-3}\textbf{\grade}}}\\[0.7cm]
			{\songti\zihao{-3} \textbf{学生姓名}} & {\QHUunderline[122pt]{\songti\zihao{-3}\textbf{\xingming}}}{\songti \textbf{学号}}{\QHUunderline[105pt]{\zihao{-3} \textbf{\xuehao}}}\\[0.7cm]%姓名+学号
			{\songti\zihao{-3} \textbf{指导老师}} & {\QHUunderline[258pt]{\songti\zihao{-3}\textbf{\daoshi}}} \\[0.7cm]%指导老师
			{\songti\zihao{-3} \textbf{完成日期}} & {\QHUunderline[258pt]{\songti\zihao{-3}\textbf{\dateOfGrant}}} \\[0.7cm]%完成日期
		\end{tabular}
		\par
		\vspace{70pt}
	\end{center}
	\clearpage
}

%%%
%
% 中文摘要
%
%%%

\newenvironment{zhAbsract}[1]{%
	\addcontentsline{toc}{chapter}{摘\quad 要}
	\def \zhKeyword{#1}
	\clearpage
	\begin{center}
		{\zihao{3} \textbf{摘 \quad 要}} 
	\end{center}
	\vspace*{1em}
	\songti\zihao{-4}\setlength{\parindent}{2em}
	
}
{ %结束部分定义
	\vspace*{0.5em}
	\par {\songti\zihao{-4}\textbf{关键词：}} \zhKeyword
}

%%%
%
% 英文摘要
%
%%%

\newenvironment{enAbsract}[1]{%
	\def \enKeyword{#1}
	\clearpage
	\fancyhf{}
	\addcontentsline{toc}{chapter}{ABSTRACT}
	\begin{center}
		{\zihao{3}\textbf{ABSTRACT}}
	\end{center}
	\vspace*{1em}
	\zihao{-4}\setlength{\parindent}{2em}
	
}
{ %结束部分定义
	\vspace*{0.5em}
	\par  {\zihao{-4}\textbf{Key words:}} \enKeyword
}

\newcommand{\statement}{%
	\begin{center}
		\songti\zihao{3}诚信责任书
	\end{center}
	\vspace{1.5cm}
	\begin{spacing}{1.885}
		\songti\zihao{4}本人郑重声明：本人所呈交的毕业论文（设计），是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等，均已明确注明出处。除文中已经注明引用的内容外，不包含任何其他个人或集体已经发表或在网上发表的论文。
		
		特此声明。
	\end{spacing}
	\vspace{3cm}
	\songti\zihao{4}论文作者签名：\QHUunderline[60pt]{} \hfill 日期：\QHUunderline[120pt]{}
}


%=======附录页
\newcommand{\Appendix}{
	\setcounter{section}{0}
	\renewcommand{\thechapter}{A}
	%将附录添加到目录中
	\addcontentsline{toc}{chapter}{附\quad 录}
	\chapter*{附\quad 录}
	\songti\zihao{-4}
}
%=======致谢
\newcommand{\Thanks}{
	%将致谢添加到目录中
	\addcontentsline{toc}{chapter}{致\quad 谢}
	\chapter*{致\quad 谢}
	\songti\zihao{-4}
}


%%%
%超链接
%%%
\RequirePackage[unicode,psdextra]{hyperref}
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}
%自动写入pdf信息
\AtBeginDocument{
	\hypersetup{
		pdftitle = {\@title},
		pdfauthor = {\@author},
		pdfsubject = {青海大学本科毕业论文}
	}
}


\crefformat{equation}{#2式(#1)#3}
\crefformat{figure}{#2图#1#3}
\crefformat{table}{#2表#1#3}
\crefformat{chapter}{#2第#1章#3}
\crefformat{section}{#2#1节#3}
\crefformat{subsection}{#2#1小节#3}
\crefformat{subsubsection}{#2#1小节#3}

%======英文名称改为汉字

%%%
% 交叉引用
%%%
\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}

%%%
% 图表编号
%%% 
\captionsetup[table]{labelsep=space}%{labelsep=quad}
\captionsetup[figure]{labelsep=space}
\renewcommand{\tablename}{表} %表题头
\renewcommand{\figurename}{图} %图题头
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} %使图编号为7.1的格式 
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}%使表编号为7.1的格式
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}%使公式编号为7.1的格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}%使子图编号为(a)的格式
\renewcommand{\thesubtable}{(\alph{subtable})} %使子表编号为(a)的格式
\newcommand{\makeappedixfigtabnum}{\setcounter{equation}{0}
	\renewcommand{\theequation}{\arabic{equation}}
	\setcounter{table}{0}   %从零开始编号
	\renewcommand{\thetable}{\arabic{table}\ }
	\setcounter{figure}{0}   %从零开始编号
	\renewcommand{\thefigure}{\arabic{figure}\ }
	\renewcommand{\figurename}{附图}
	\renewcommand{\tablename}{附表}}

%%%
%参考文献
%%%
\RequirePackage{natbib}
\setlength{\bibsep}{0pt} %参考文献间距
%\renewcommand{\bibfont}{\small} %参考文献字号


%% End of file `QHUthesis.cls'.
