
# PhysicsAMC MC-Project

## table of contents
- [introduction](#introduction)
- [templates](#templates)
- [amc-mill](#amc-mill)

## introduction

You should be able to copy and past this directory directly into your MC-Project directory.

```bash
$ cd ~/MC-Project
$ git clone --single-branch --branch mc-project https://github.com/jphafner/physicsAMC.git

```

I have included one sample exam, sample-[exam|full|half].pdf, with each template.
Do not print or use the sample exam included,
    as you must compile it yourself for grading.

For a complete list of dependencies,
    please refer to sample-[exam|full|half].dep.
To help with installing all dependencies on Fedora, you can run the below command.

```bash
$ sudo dnf install $( cat sample-exam.dep | sed -n 's#[^\*]*\*{package}{\([a-zA-Z]*\)}.*#texlive-\1#p' )
```

## templates

- [kinematics exam](kinematics-exam), an example kinematics exam, utilizing my custom graph questions with NYSED and AAPT Physics Bowl questions.
    The exam includes a cover sheet with a response and reference sheet at the end.

- [kinematics full quiz](kinematics-full), an example full page kinematics exam utilizing my custom unit questions (requires lua!) with NYSED questions. 
    This exam does not include a cover sheet with instructions or a response and reference sheet at the end.

- [kinematics half quiz](kinematics-half), an example half page kinematics exam utilizing only NYSED questions.
    This exam is designed to be as space efficient as possible.
    For example, questions may be split on pages,
        whereas in kinematics-[exam|full], this is prohibited.


## amc-mill

If you are interested in automating exam creation using the command line, I would strongly recommend checking out amc-mill.
If interested,
    first read [Using AMC in command line only](http://project.auto-multiple-choice.net/projects/auto-multiple-choice/wiki/Using_AMC_in_command_line_only),
    then download [amc-mill](http://project.auto-multiple-choice.net/attachments/934/amc-mill.zip).

