%   This is file `QHUthesis.cls',
%	@author WuZhiPeng
% 	@date 2022/4/19
%   This template for QingHai university undergraduate thesis

%---------- cls文件声明 ----------
\ProvidesClass{QHUthesis}[2022/4/19 v1.0.1]
\NeedsTeXFormat{LaTeX2e} %声明文档类需要依赖于Latex内核
\AtEndOfPackage{\input{QHU.cfg}} %配置封面相关的带@符号的一些自定义命令

% ---------- 调用其他文档类，ctexbook类 ----------
\LoadClass[a4paper,UTF8,openany,oneside]{ctexbook} %装载其他文档类文件，只允许加载一项

%=======论文页边距要求：每一页的左边距为 30 mm，上、下和右边距为 25 mm
\RequirePackage[top=3cm, bottom=2.5cm, outer=2.5cm, inner=2.5cm, headheight=1.5 cm, footskip=1.75cm, heightrounded]{geometry}
%======连续参考文献连接起来，排序文献序号（并压缩）
\RequirePackage[numbers,sort&compress]{natbib}
%========脚注，使用footmisc自定义脚注命令
\RequirePackage[perpage, bottom]{footmisc} %每页的脚注单独编号，强制将页脚放置在页面的底部

%========常用宏包========
%========双语标题设置
\RequirePackage{caption}
\RequirePackage{bicaption}

%========数学公式、数学字体，数学符号
\RequirePackage{amsmath,amsfonts,amssymb}
%========插图
\RequirePackage{graphicx}
\RequirePackage{subfigure} %子图
%\RequirePackage{float}
%========三线表
\RequirePackage{booktabs}
%========对表格列格式的扩展
\RequirePackage{array}

%\RequirePackage{ctex}
%========设置行距，提供\setstretch，\spacing命令
\RequirePackage{setspace}
%========代码高亮
\RequirePackage{listings}
%========颜色设置
\RequirePackage{xcolor}
%========合并多行单元格
\RequirePackage{multirow}
%========定义页眉页脚样式
\RequirePackage{fancyhdr}
%========%文档最后一页的页码，通常用于“第1页/共*也”
\RequirePackage{lastpage}
%========打补丁，目前还不清楚
\RequirePackage{etoolbox}
%========控制生成的表格和图片的目录格式
\RequirePackage[titles,subfigure]{tocloft}
%========修改章节标题格式
\RequirePackage{titlesec}
%========支持在单元格里排版多行内容（嵌套一个单列的小表格）
\RequirePackage{makecell}
%\RequirePackage{forloop}
\RequirePackage{xstring}
\RequirePackage{enumitem}
%========定理环境
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
%========algorithmic实现算法排序的宏包，如果要生成浮动体的话，需要搭配algorithm宏包使用
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{ifthen}
\RequirePackage[unicode,psdextra]{hyperref}
%cleveref必须在hyperref宏包加载之后
\RequirePackage[nameinlink]{cleveref}

%======是否需要插图和图表索引
\newboolean{PicAndTabIndex}
\newcommand\newblankpage{\pagestyle{empty}\cleardoublepage\mbox{}}
%自定义页眉页脚
\pagestyle{fancy}
\fancypagestyle{frontmatterstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot{} 
	\fancyfoot[C]{\thepage} %
	\renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
	%清空页眉页脚
	\fancyhf{}
	%设置页眉横线0.4pt
	\renewcommand{\headrulewidth}{0.4pt}
	%设置页眉（插入标题）
	\chead{\@title}
	%清空页脚
	\fancyfoot{} 
	%页脚插入页码
	\fancyfoot[C]{\thepage} %
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}%页面样式
\appto\mainmatter{\linespread{1.3889}\selectfont}%行距
   
\fancypagestyle{plain}{
	\thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}

%=======修改章节样式，章节编号后添加小数点
\newcommand\prechaptername{ }
\newcommand\postchaptername{.}

%=======通过tocloft宏包来修改目录样式=======
%%\CTEXsetup[name={第,章},number={\arabic{chapter}}]{chapter}%改变目录标题样式
%章节标题设置：  name：在章节前后插入文本；number：章节编号的数字样式
%\CTEXsetup[name={,.},number={\arabic{chapter}}]{chapter}%改变目录标题样式
%\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter}%改变目录标题样式
\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter}
\renewcommand\cftchapdotsep{2}%虚线间隔
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1.5}%设置点间距
\renewcommand{\cftchapafterpnum}{\vspace{2pt}}%设置chapter章节后间距
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}%设置章节标题与页码之间的导引符
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setlength{\cftbeforechapskip}{0pt}%一级标题章节间隔
\setlength{\cftbeforesecskip}{0pt}%二级标题章节间隔
\setlength{\cftbeforesubsecskip}{0pt}%三级标题间隔
%目录章标题字体样式
\renewcommand\cftchapfont{\songti\zihao{4}}
\renewcommand\cftsecfont{\songti\zihao{4}}
\renewcommand\cftsubsecfont{\songti\zihao{4}}
\renewcommand\cftchappagefont{\mdseries}
%设置目录深度
\setcounter{secnumdepth}{3}
\setlength{\parindent}{2em}
%%调整“目录”的段前段后间距
%\setlength\cftbeforetoctitleskip{0pt}
%\setlength\cftaftertoctitleskip{0pt}
%%%%%%%%%% 章节字体、字号和间距设置 %%%%%%%%%%%%%%%%%
%=======1级标题为三号，加粗，居中，段后1行,
%=======2级标题为四号，加粗；段前 0.5 行，段后 0.5 行
%=======3级标题小四号
%=======4级标题及以下同3级标题
\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}
\titleformat{\chapter}{\centering\bfseries\zihao{3}\songti}{\chaptername}{0.5em}{} %一级标题
\titlespacing{\chapter}{0pt}{0pt}{16pt}
\titleformat{\section}{\bfseries\zihao{4}\songti}{\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{7pt}{7pt}
\titleformat{\subsection}{\zihao{-4}\songti}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titleformat{\subsubsection}{\zihao{-4}\songti}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}

%%=======标题页信息
\newtoks\college%院系
\newtoks\serialnumber%学号
\newtoks\major%专业
\newtoks\advisor%指导老师
\newtoks\entitle%英文标题
\newtoks\cptdate%完成日期
\newtoks\stryear%年级

%%=======标题页
%需要添加循环函数，判定多于一行的情况
\def\QHU@underline[#1]#2{%
	\underline{\hbox to #1{\hfill#2\hfill}}}
\def\QHUunderline{\@ifnextchar[\QHU@underline\underline}
\renewcommand\maketitle{
	%封面样式
	\thispagestyle{empty}
	\begin{center}
%		\vspace{0.1cm}%设置垂直间距
		\includegraphics[width=7.43cm]{QHU.bmp}\\%插入青大图标logo
		\vspace{1.2cm}%设置垂直间距(本科生毕业设计上间距)
		{\songti\zihao{1}\QHU@label@thesis\\}%
		\vspace{2.5cm}
		\zihao{4}
		\vspace{0.25cm}%设置垂直间距(中文标题上间距)
		{\bf\songti\zihao{3}\@title} \\[0.40cm]
		{\fontspec{Times New Roman}\bf\zihao{3}\the\entitle} \\[0.40cm]
		\def\tabcolsep{6pt}
		\expandarg
		\newcounter{title_str_number}
		\vspace*{72pt}
		\begin{tabular}{rl}%标题右对齐，内容左对齐
			{\songti \QHU@label@college} & {\QHUunderline[258pt]{\songti\zihao{-3}\the\college}} \\[0.7cm]%院系
			{\songti \QHU@label@major} & {\QHUunderline[160pt]{\songti\zihao{-3}\the\major}}{\songti \QHU@label@stryear}{\QHUunderline[60pt]{\songti\zihao{-3}\the\stryear}}\\[0.7cm]%专业+年级
			{\songti \QHU@label@author} & {\QHUunderline[122pt]{\songti\zihao{-3}\@author}}{\songti \QHU@label@serialnumber}{\QHUunderline[100pt]{\fontspec{Times New Roman}\zihao{-3}\the\serialnumber}}\\[0.7cm]%姓名+学号
			{\songti \QHU@label@advisor} & {\QHUunderline[258pt]{\songti\zihao{-3}\the\advisor}} \\[0.7cm]%指导老师
			{\songti \QHU@label@cptdate} & {\QHUunderline[258pt]{\songti\zihao{-3}\the\cptdate}} \\[0.7cm]%完成日期
		\end{tabular}
		\par
		\vspace{70pt}
	\end{center}
	\clearpage
}

%=======中文摘要页
\newcommand{\ZhAbstract}[2]{
	%解决目录链接跳转页面错误问题
	\phantomsection
	\addcontentsline{toc}{chapter}{摘要}
	\thispagestyle{mainmatterstyle}
	\begin{center}%
		\begin{minipage}{\textwidth}
			\centering
			\heiti\zihao{3}\noindent{摘要}%中文摘要
		\end{minipage}
	\end{center}%
	\par \songti\zihao{-4}#1
	\vspace{10pt}
	\par \noindent\heiti\zihao{4}{关键词：}\songti\zihao{-4}#2
	\newpage
}

%=======英文摘要页
\newcommand{\EnAbstract}[2]{
	\phantomsection
	\addcontentsline{toc}{chapter}{Abstract}
	\thispagestyle{mainmatterstyle}
	\begin{center}%
		\begin{minipage}{\textwidth}
			\centering
			\fontspec{Times New Roman}\zihao{3}\noindent{Abstract}%英文标题
		\end{minipage}
	\end{center}%
	\par \fontspec{Times New Roman}\zihao{-4} #1
	\vspace{10pt}
	\par \noindent\fontspec{Times New Roman}\zihao{4}\text{Key words: } \fontspec{Times New Roman}\zihao{-4} #2
}


%=======附录页
\newcommand{\Appendix}{
	\setcounter{section}{0}
	\renewcommand{\thechapter}{A}
	%将附录添加到目录中
	\addcontentsline{toc}{chapter}{附录}
	\chapter*{附录}
	\zihao{4}\songti
}
%=======致谢页
\newcommand{\Thanks}{
	%将致谢添加到目录中
	\addcontentsline{toc}{chapter}{致谢}
	\chapter*{致谢}
	\zihao{4}\songti
}
%========超链接========
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}%自动写入pdf信息
\AtBeginDocument{
	\hypersetup{
		%生成PDF属性信息
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

%=====列表样式
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%======英文名称改为汉字
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
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
%=======程序伪代码实现
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
%=======改变图表的编号格式
\captionsetup[table]{labelsep=space}%{labelsep=quad}
\captionsetup[figure]{labelsep=space}
\renewcommand{\tablename}{表} %表题头
\renewcommand{\figurename}{图} %图题头
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} %使图编号为7.1的格式 %\protect{~}
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

%%=======参考文献
\newtoks\bibdatabase
\newcommand{\printbib}{
	\songti\zihao{4}
	\bibliographystyle{QHUbib}
	\addcontentsline{toc}{chapter}{参考文献}
	\bibliography{\the\bibdatabase}
}
\endinput

%% End of file `QHUthesis.cls'.
