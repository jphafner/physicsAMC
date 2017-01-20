
# physicsAMC

#table of contents
- [introduction](#introduction)
- [branches](#branches)
- [dependencies](#dependencies)
- [exam-files](#exam-files)
- [question-bank](#question-bank)
    - [master-branch](#master-branch)
    - [develop-branch](#develop-branch)
- [parse-qbank](#parse-qbank)
- [best-practices](#best-practices)
- [style-guide](#style-guide)


#introduction

This projects seeks to create an exam question repository for an introductory physics course.
If you are not convinced in the effectiveness of multiple choice,
    I would strongly recommend [Scott2006](http://dx.doi.org/10.1103/PhysRevSTPER.2.020102).

This project should be of interest to anyone who teaches a physics course,
    and especially to anyone whose students take the NYSED physics regents.
I am also aware that most online solutions are simply not an option for many high school teachers.

My main goals are to bring some basic ideas from computer science to teaching.
Grading should be fast, student feedback should be prompt and thorough.

This README is written with the hopes of being comprehensible to a computer literate physics teacher.
If you describe yourself as above, and find this incomprehensible, I consider that a bug.

#branches

-[mc-project](https://github.com/jphafner/physicsAMC/tree/mc-project), this is a self contained assessment ready for import into auto multiple choice (AMC).
    If you are new to using AMC, I would recommend that you start here.
    I have even included an rpm package of auto-multiple-choice for convenience.
    Once you get familiar, you can slowly import from the other branches to suite your needs.

-[master](https://github.com/jphafner/physicsAMC/tree/master), this is the stable branch.
    Everything should work here.
    This is somewhat implied in [question-bank](#question-bank).

-[develop](https://github.com/jphafner/physicsAMC/tree/develop), this is the development branch.
    Not everything here will work, though most should.
    If you want to contribute, or use things in development, I would recommend that you start here.

#dependencies

All except automultiplechoice are included by default in most package managers.
I use [Fedora's Package Manager](https://fedoraproject.org), but have heard good things about other projects:
    [HomeBrew](http://brew.sh/), [Debian](http://debian.org), [Arch Linux](https://archlinux.org), [Chocolatey](https://chocolatey.org/), [OneGet](https://github.com/OneGet/oneget), etc.
A good place to start is [The LaTeX Project](https://www.latex-project.org/get/) no matter what you are using.

- [automultiplechoice](http://home.gna.org/auto-qcm/), this should really be self explanatory, hence the AMC in the project name.
- [mhchem](http://ctan.org/pkg/mhche) is used for typesetting nuclear reactions.
- [pgfplots](http://ctan.org/pkg/pgfplots) is used extensively for all graphs.
- [circuitikz](http://ctan.org/pkg/circuitikz) is used for all circuit diagrams.
- [pgf/TikZ](http://ctan.org/pkg/pgf) is used extensively for all graphics.
- [lualatex](http://luatex.org/) is used for Unicode font support and for integrating lua scripts into documents.
- [lua](http://lua.org/) is used for scripting and some custom questions.
- [lpeg](http://www.inf.puc-rio.br/~roberto/lpeg/) is used for scripting, see the [scripts](./scripts) directory.
- [siunitx](http://ctan.org/pkg/siunitx) is used for typesetting all SI units and most other units and numbers.
- [amsmath](http://ctan.org/pkg/amsmath) is used for typesetting all equations.
- [booktabs](http://ctan.org/pkg/booktabs) is used for typesetting tables.
- [tabu](http://ctan.org/pkg/tabu) is used for creating column fitted tables.
- [physics](http://ctan.org/pkg/physics) is used for Dirac bracket notation,
    not used on any high school level question.
- [STIX Fonts](http://stixfonts.org) is the default font used.
    You can change it, but I strongly recommend it.

_Please Note:_ This is _not_ an exhaustive list.

#exam-files

-[source-exam](source-exam.tex), this is for beautifully formatted exams with separate cover sheet and answer/response sheet.
    I use this for unit assessments.
    As they are each unique, I allow for redos and only record the most recent attempt.
    This file depends on [AMCexam](AMCexam.sty).

-[source-full](source-full.tex), this is for space saving for when you do not want a separate cover sheet and answer sheet.
    I use this for one page weekly assessments.
    I use these typically to measure student progress,
        I grade them, but I do not record them.
    This file depends on [AMCfull](AMCfull.sty).

-[source-half](source-half.tex), this is for half letter page sized assessments.
    These are really nice when you only want one to five questions.
    I use this for entrance drills and exit tickets.
    I am a huge proponent of using entrance drills, they can be a godsend at times.
    There is an included script for printing these,
        the script assumes that all assessments fit onto one sheet half letter paper (both recto and verso).
    If the above assumption is false, then you should be using source-full.
    This file depends on [AMChalf](AMChalf.sty).

-[AMCcommon](AMCcommon.sty), this file provides common definitions that are necessary for compiling the exam files and the question bank files.
    Do _not_ edit this file unless you are looking to contribute.

-[myTikz](myTikz.sty), this file defines some fanciness for source-exam.
    Do _not_ edit this file unless you are looking to contribute.

-[email](email.txt), this file provides a template for formatting student emails.


#question-bank

Below is a list of contents with a description in the question bank.
Each has been edited by me to reflect my style and conventions.
For instance, units not formatted to the [NIST style guide](https://www.nist.gov/physical-measurement-laboratory/special-publication-811),
    use of British instead of American English,
    formatting preferences, physical errors,
    or because I found the question ambiguous.

Question group naming follows the directory where the question is located.
This is broken only when necessary.

Question naming follows closely as possible to the source material.
For instance, question 32 on the June 2012 regents exam is named _June2012-Q32_.

## master-branch

- [diagnostic](qbank/diagnostic/): A collection of diagnostic exams: [freeBodyDiagrams](http://dx.doi.org/10.1103/PhysRevSTPER.11.020137), [vectors](http://dx.doi.org/10.1103/PhysRevSTPER.11.020137), [ADTv2](http://solar.physics.montana.edu/aae/adt/)
- [hewitt](qbank/hewitt/): A rewrite of Hewitt's 60 questions that all physics students should answer.
- [kinematics](qbank/kinematics/): A collection of custom written graph questions.
- [lua](qbank/lua/): A collection of custom written questions that are randomized, requires [lua](http://www.lua.org)
- [nysed](qbank/nysed/): A comprehensive collection of NYSED physics regents exam questions, _over 2200 categorized questions!!_
- [survey](qbank/survey/): A collection of surveys that may be of interest:
    [CLASS](http://www.colorado.edu/sei/class/),
    [MPEX](http://serc.carleton.edu/NAGTWorkshops/assess/activities/MPEX.html),
    [Duckworth](https://sites.sas.upenn.edu/?q=duckworth/pages/educators-0),
    and Boredom Proneness Scale.

## develop-branch

- [aapt](qbank/aapt/): A rewrite of the [American Association of Physics Teachers](www.aapt.org) Physics Bowl and Olympiad Exam questions.
    Questions are categorized according to James Nelson's, _AAPT/NSTA high school physics examination_, The Physics Teacher, February 1983, p100--103.
    For instance, questions on one dimensional kinematics use the postfix of A1.
- [cap](qbank/cap/): A rewrite of the [Canadian Association of Physicists](www.cap.ca) challenge exam questions.
- [cpo](qbank/cpo/): A rewrite of the CPO exam bank questions.
    I am particularly proud of [ch21-q09](/qbank/cpo/ch21-mc.tex), check it out.
- [collegeBoard](qbank/collegeBoard/): Anything relating to College Board. 
    Of interest are the rewrites of all released [calculus AB](qbank/collegeBoard/calculusAB.tex) and [calculus BC](qbank/collegeBoard/calculusBC.tex) exam questions.
- [gre](qbank/gre/): A rewrite of all released physics GRE exams.
- [halliday](/qbank/halliday/): A rewrite of the exam bank questions to Halliday's _Fundamentals of Physics_.
- [holt](/qbank/holt/): A rewrite of the end of chapter assessments from Holt's _Physics_.
- [jpierce](/qbank/jpierce/): A rewrite of of [Dr. James Pierce's Physics 101 Sample Test Questions](http://mavdisk.mnsu.edu/jpierce/courses/p101/questions.html).
- [njctl](/qbank/njctl/): A rewrite of [The New Jersey Center for Teaching and Learning](https://njctl.org/courses/science/) physics problems, both calculus and algebra based.
- [project](/qbank/project/): A rewrite of [Harvard University's Project Physics](https://archive.org/details/projectphysicscollection) exam bank questions.
    This directory should be master branch ready.
- [serway](/qbank/serway/): A rewrite of the exam bank questions to Serway's _Physics for Scientists and Engineers_.

Please refer to the headings of each file for more information.

# parse-qbank

The purpose of parse-qbank is to allow fast and easy parsing from the question bank.
This project was first organized by files,
    this was acceptable when the project was only being used by the author.
A more powerful manner to organize this project is to tag each question and parse the file for the desired question attributes.
This allows a question to have multiple tags, as opposed to one directory,
    many questions do not fit neatly into a single category.

The author recommends building an exam by starting with the desired project in mc-project,
    and then parsing the question bank for the desired questions to include.

The script is very much beta, but it is currently producing usable output.
It depends additionally on [lpeg](http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html) and [argparse](https://github.com/mpeterv/argparse).
These can be installed either with luarocks,

```bash
$ luarocks install lpeg argparse
```

or with the fedora package manager,

```bash
$ sudo dnf install lua-argparse lua-lpeg
```

## example usage

Extract all questions from the June2012 or the June2013 regents.

```bash
$ parse-qbank -q June2012,June2013 qbank/nysed/NYSED-*tex
```

Extract all one-dimensional (A1) or two-dimensional (A2) kinematics questions.

```bash
$ parse-qbank -t A1,A2 qbank/AAPT/Bowl-*tex
```

# best-practices

- Do _not_ have any MC-Project directory depend on material from another directory.
    Projects are much less likely to break, and debugging is much simpler.
- _Always_ set all random number seeds to a fixed number.
    This allows for recompilation and will likely save you at least once.

# style-guide

I use NOTE, TODO and REF labels for easy access to information in files.

-[ ] [LuaStyleGuide](http://lua-users.org/wiki/LuaStyleGuide)
-[ ] [luadoc](https://keplerproject.github.io/luadoc/)
-[ ] lua in separate files
-[ ] import lua common from inside separate file
    -[ ] units.tex and units.lua instead of all in one
-[ ] functional programming style
-[ ] indenting C style


