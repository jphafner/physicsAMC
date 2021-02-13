
-[ ] \myJune... commands, change to \nysedJune...

## reoganize qbank/subject/...
-[ ] move all questions to source names, cap/2005.tex
-[ ] add tags to each question
-[ ] change element name on unfinished questions, \element{testing} or similar


## VIM modelines
-[ ] http://tedlogan.com/techblog3.html
-[ ] tabstop, expandtab, shiftwidth, softabstop
-[ ] -- lua is 2 --> vim: noai:ts=2:sw=2:et
-[ ] -- vim: ts=3 ss=3 sw=3 expandtab --> sputnik style

## To enforce style guides
/* vim: set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab autoindent : */

-[ ] create style guide with concern to multiple-choice questions
-[ ] http://www.thelearningmanager.com/pubdownloads/writing_effective_questions.pdf
-[ ] http://files.eric.ed.gov/fulltext/EJ985723.pdf

## start making branches for different tasks
-[ ] git checkout -b explain

## basic merging

```bash
$ git checkout master
Switched to branch 'master'
$ git merge hotfix
Merge made by the 'recursive' strategy.
index.html |    1 +
1 file changed, 1 insertion(+)
$ git branch -d hotfix
```

## add explanations
-[ ] add explanations to problems, this is a massive undertaking!!!

```latex
\begin{question}{explanation}
Which has the highest elevation among the following?
\begin{choices}
  \correctchoice{Sagarmatha}
    \wrongchoice{K2}
    \wrongchoice{Mont Blanc}
    \wrongchoice{Aconcagua}
\end{choices}
\explain{Sagarmatha which literally means `Head of sky' is the native name of Mount Everest,
    the highest mountain in the world.}
\end{question}
```

```latex
\begin{question}{open}
Define \emph{inflation}.
\AMCOpen{lines=5,answer=some text here}{
    \wrongchoice[W]{w}\scoring{0}\wrongchoice[P]{p}\scoring{1}\correctchoice[C]{c}\scoring{2}
}
\end{question}
```

## Git diff ideas, compare master to develop
-[ ] git diff --name-status master..develop | grep ^M
-[ ] git diff --stat --color master..develop
-[ ] git diff HEAD 
-[ ] git diff --cached

## projectile and 2Dkinematics have duplicates

## parse-qbank
-[ ] parse-qbank, use functional each to allow for multiple question/element/tags
-[ ] parse-qbank, use functional each to allow for multiple question/element/tags

## git workflow for merging a branch through an intermediary
git checkout ba
git checkout -b ba-merge
git merge master
.... review new code and fix conflicts....
git commit
git checkout ba
git merge ba-merge
git branch -d ba-merge
git merge master


## P1


-[ ] in scripts, finish TODO notes!!!

-[ ] cap-other, for ones that do not fit elsewhere

-[ ] update copyright year, 2014--2016

-[ ] write a script for compiling exams
    -[x] extract all June2001 exams from all NYSED files.
    -[ ] sort all June2001 exams in order from all NYSED files


-[ ] master files are considered to be antiquated once questions are categorized!
    -[ ] cap-mc is not to be touched when cap-A1 is updated
    -[ ] script from above will solve this problem, and ease maintenance in future

## notes on script
-[ ] copy paste entire \element{ } block.
-[ ] search in name, \begin{question}{ }, for match
-[ ] print matches to stdout

## links
-[ ] http://www.regular-expressions.info/recurse.html#balanced
-[ ] https://stackoverflow.com/questions/546433/regular-expression-to-match-outer-brackets/19863847#19863847
-[ ] https://stackoverflow.com/questions/26028091/regular-expression-to-extract-argument-in-a-latex-command


-[ ] This could be a _huge_ plus for the project, as I could then _tag_ the questions and extract them accordingly!!!
-[ ] AAPT: A1, A2,...   NYSED: assign to NY objectives, for tag ideas!!
-[ ] \newcommand\tag{tag1,tag2,tag3,tag4}

-[ ] lua-lpeg, functions: findElement, keepElement, modElement



## Pother

## Learning Objectives in Header of each file!!

## Add GREphysics, for advanced multiple choice questions!!
## this is more for personal pleasure
-[ ] [Physics GRE](http://www.physicsgre.com/)
-[ ] [GRE Phsyics](http://grephysics.net/ans/)
-[ ] [ ](https://web.stanford.edu/group/sps/PhysGRE.htm)

## AP
-[ ] Finish APC and APB exams in collegeBoard
-[ ] move other files in collegeBoard elsewhere??

## High school
-[ ] Start questionBank.ca questions

-[ ] gray choicelabels? \def\AMCchoiceLabelFormat#1{\textcolor{black!40}{#1}}
    This would make grading less ambiguous
-[ ] page limit in \onecopy{}: \loop\ifnum\thepage<5\clearpage ~\repeat
-[ ] indivanswers for solution creation
        indivanswers is for manual marking, use also nopage for no header markers
-[ ] add \explain{ } to gre, project, and others
-[ ] qbank/(element)/filename


## Important
-[ ] Use makebox to align options instead of tabular or tabu
-[ ] cap high school prize exam, multiple choice and long questions

-[ ] Randomly select one long open question for each exam, use cap and aapt olympiad questions


## Question Priority
-[ ] Astronomy questions, project physics
-[ ] finish Bowl and Olympiad 1994 - 2000


## Feynman Exercises, convert for advanced multiple choice questions!!
-[ ]http://www.feynmanlectures.info/exercises/atwood.html


## Add Project Physics Test Booklet
-[ ] [Test Booklet 5---Models of the Atom](testbooklet5mode00fjam.pdf)
-[ ] [Test Booklet 5---Models of the Atom](testbooklet5mode00fjam.pdf)


## Add numeric from Schaums Outline of Applied Physics 4e
-[ ] Schaums Outline of Applied Physics 4e - Beiser, Arthur.azw3/epub/pdf


## Canadian Physics Exam Material
-[ ] [Canadian Association of Physicists](http://cap.phas.ubc.ca/)
-[ ] [British Columbia Provincial Exams](http://questionbank.ca)


## Links
- http://physics101x.blogspot.com/2012/11/multiple-choice-physics-101-quiz.html
- http://dev.physicslab.org/Compilations/AAPT.aspx

### Survey
- http://ceep.indiana.edu/hssse/index.html

## Conceptual Question Bank
- http://www.rocklin.k12.ca.us/staff/pmorrison/ConPhys/ConPhysIndex.htm

### Question Bank
- http://physics.mines.edu/undergraduate/transfercredit/transfer5.php

### Warmups and Practice Questions
- http://wps.aw.com/aw_wilson_physics_7/109/28121/7199047.cw/index.html

### GRE questions
- http://www.phys.ksu.edu/personal/eschultz/GRE%20Home.htm
- http://grephysics.yosunism.com/8677.pdf
- https://sites.google.com/a/uw.edu/physicsgre/home/week-1-practice-test-gr8677
- http://grephysics.net

### Feynman Exercises
- http://www.feynmanlectures.info/exercises.html

### US Physics Olympia
- http://aapt.org/physicsteam/2015/exams.cfm

### AP exam questions
- http://www.learnerator.com/ap-physics-1-2
- http://www.mhpracticeplusap.com/ID7.html
- http://www.mhpracticeplusap.com/ID8.html

### Exam Bank
- http://www.collegephysics.com/

### Multiple Choice Information
- http://www.uleth.ca/edu/runte/tests/multiplechoicetests.html

## Reference for unicode-math-table problem
I beleive this has since been fixed
automultiplechoice is incompatible with unicodemath,
    search for file unicode-math-table.tex

Change line as shown.
\UnicodeMathSymbol{"0003F}{\question                 }{\mathord}{question mark}%

\UnicodeMathSymbol{"0003F}{\questionmark             }{\mathord}{question mark}%



