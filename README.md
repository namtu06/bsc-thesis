# Tampere University theses using LaTeΧ

This repository contains a template for writing Bachelor's,
Master's, Licentiate's and Doctoral theses in Tampere
University, using the LaTeΧ system. The styles used try to
match the official Word template as closely as possible (or
is worth the while).

## A note on the University Typst template

Starting from the release of
[Typst version 0.14.0](https://github.com/typst/typst/releases/tag/v0.14.0),
it is now strongly recommended to use the Tampere
University
[Typst](https://typst.app/)
template
([GitLab](https://gitlab.com/tuni-official/thesis-templates/tau-typst-thesis-template),
[Typst Universe](https://typst.app/universe/package/scholarly-tauthesis))
instead of this LaTeX template. The PDF files produced by
Typst are more accessible than the ones produced by the
LaTeX template, and since
[accessibility](https://typst.app/docs/guides/accessibility/)
in now required by
[the Finnish law](https://www.finlex.fi/fi/lainsaadanto/2019/306?language=fin),
using Typst should be strongly preferred over LaTeX.

To learn the basics of Typst, refer the their tutorial at
<https://typst.app/docs/tutorial/>. You can either use the
web application or the CLI compiler to compile your Typst
code to a PDF file. There is also the VS Code add-on
[Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)
which can be used for writing, but note that as of
2025-10-30, Tinymist is still working on adding support
for the accessible version 0.14.0 of the Typst compiler,
required by the university Typst template.

## Too long, didn't read

1. Download the latest version of this project as a ZIP
   file from the [tags page][project-tags-page].
2. If you intend to use Overleaf for writing:
   1. Upload the ZIP to Overleaf as a new project.
   2. Change the compiler to LuaLaTeX in the project settings.
   3. Change the main file to `main.tex` in the project settings.
   4. Update the document metadata in the file `metadata.tex`.
   5. Open some other file than `metadata.tex` in the
      text editor. This is needed because Overleaf changes
      the main file in the background, if there is a
      `\documentclass` invocation in the open file.
   6. Compile the document.
3. If you intend to use the template locally:
   1. Install [TeX Live].
   2. Unpack the ZIP file to a folder.
   3. Use the below compilation sequence in a command line
      window to produce a PDF file.
4. Before submitting, check that your thesis is [accessible](https://staging.typst.app/docs/guides/accessibility/):
   1. Use [veraPDF](https://verapdf.org/home/),
      [showtags](https://texlive.net/cgi-bin/showtags) and
      [PAC](https://pac.pdf-accessibility.org/en) for this.
   2. If it is not, clean up your thesis source code into an accessible form
      (or write it neatly using LaTeX commands from the start).
      See the difference between `$f = ma$` and `$\force = \mass\acceleration$`.
5. Submit your thesis:
   1. If the thesis was accessible according to the accessibility checkers, you may submit only a PDF.
   2. If the thesis is not accessible, also submit the cleanly written thesis source code in a sensible reading order.

## Compilation

### On Overleaf

Make sure that the following is true to compile your project
on Overleaf:

1. The file `main.tex` is set up as the main file of the
   project in the Overleaf project settings,

2. The file `metadata.tex` should **not** be open  in the
   Overleaf text editor.

3. LuaLaTeX should be set as the Overleaf project compiler.

The template uses LuaLaTeX to change the fonts and allow
packages to more easily take advantage of accessibilty
features. As for point 2, Overleaf has a "feature" where
it changes the main file without telling a user, if the
currently open file contains a `\documentclass` command.
Since it is not possible to truly lock the main file on
Overleaf, one has to make sure that `metadata.tex` is not
open, since that is where the document class is set.

### Locally

This template makes use of both `biblatex` and `glossaries` packages, and therefore needs a non-standard compilation sequence. The following should do the trick, as long as your main project file is named `main.tex`:
```sh
lualatex main.tex &&
makeindex -s main.ist -t main.glg -o main.gls main.glo &&
biber main &&
lualatex main.tex &&
lualatex main.tex
```

**Note:** the compiler `lualatex` must be used, as the template fonts are loaded with `lualatex`-specific funtionality.

## Usage notes

### Installation

The easiest way to use this template is to download this repository as a ZIP file, and upload the ZIP to Overleaf as a new project, on the page that lists your Overleaf projects ([link][overleaf-projects]). The ZIP file can be downloaded by navigating to the [Tags-page][project-tags-page] of this repository, and choosing the ZIP option of the latest tag. Then on Overleaf, press <kbd>New Project</kbd> → <kbd>Upload Project</kbd> → <kbd>Select a .zip file</kbd>. This will generate a new Overleaf project for you.

[overleaf-projects]: https://www.overleaf.com/project
[project-tags-page]: https://gitlab.com/tuni-official/thesis-templates/masters-thesis/-/tags


If you wish to write your thesis locally instead, you should install the latest version of the [TeX Live] LaTeΧ distribution onto your computer. This will provide access to the necessary LaTeΧ compilers and libraries, and will allow you to run the command sequence listed in the above section. Any plaintext editor can be used to write LaTeΧ code, but a recommended choice is [VS Code], with the [LaTeΧ Workshop] add-on.

[TeX Live]: https://www.tug.org/texlive/
[VS Code]: https://code.visualstudio.com
[LaTeΧ Workshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop

Whichever approach you choose, local or online, go ahead and try to compile the template as-is, before starting to modify it. The resulting PDF file `main.pdf` contains some directions for using the template. More helpful instructions can be found in the `.tex` files as comments.

If you run into compilation errors, please check your LaTeΧ distribution version and install the newest versions of the following packages.

* `pdfx`, `ìnputenc`, `babel`, `csquotes`, `hyperref`
* `fontenc`, `helvet`
* `geometry`, `fancyhdr`, `setspace`, `parskip`, `xcolor`, `titlesec`, `titletoc`
* `enumitem`, `graphicx`, `caption`, `listings`, `pdfpages`, `datetime2`
* `biblatex`, `glossaries`
* `accsupp`, `axessibility`, `pdfcomment`

If you ran into a compilation error and installed newer versions of the needed packages, but the document still does not compile, you might also need to delete the auxiliary files generated by the compiler in the directory, where you attempted to compile the document:

	rm main.aux main.xmpdata main.blg main.bbl main.bcf

Otherwise the LaTeΧ compiler might try to use the metadata from the failed compilation sequence, and not generate new auxiliary files where they are needed. You will not need to do this on Overleaf, as the service deletes the files for you.

### Once the template project compiles successfully...

... the idea is that you write your contents into the files found in the folders `frontmatter/`, `mainmatter/`, `appendices/` and `publications/`. All of the folders contain a file `index.tex`, that the `main.tex` file imports. In these index files, you should input your contents, which will then get automatically input to the main file. For example:
```latex
% In mainmatter/index.tex.
% Invent your own chapter names and create files for them, as necessary.

\input{mainmatter/introduction.tex}
\input{mainmatter/background.tex}
\input{mainmatter/methods.tex}
...
\input{mainmatter/conclusion.tex}
````
Note that the path of the input files needs to be in relation to the `main.tex` file.

The point of this folder arrangement is that it should not be necessary to modify the files `tauthesis.cls` or `main.tex` at all. If you then need to update to a newer version of the main file, you can just copy the updated one on top of the old one without destroying your own work.

## Submitting a final version of your thesis

Once you are getting ready to submit your thesis,
check that it fulfills basic accessibility requirements
by running the thesis file through the program
[veraPDF](https://docs.verapdf.org/install/) with the
PDF/UA-1 profile. If the file is formatted correctly,
the profile selection should happen automatically. If the
veraPDF output claims that it is checking against another
standard than PDF/UA-1, see the below paragraph and the
note at the end of this section.

If the program complains that the thesis PDF file
`main.pdf` does not conform to the PDF/UA-1 standard or a
standard such as PDF/A-2b, the Muuntaja-service of Tampere
University could be used to do the final conversion to
a weaker PDF/A standard. See the related instructions
([link][pdfa-instructions]) for how to do it. Basically
it boils down to feeding your compiled PDF document to
the converter at <https://muuntaja.tuni.fi>. **Remember to
check that the output of the converter is not corrupted,
before submitting your thesis to the archives.** Also note
that the converter might strip existing tags from your
document, making in unaccessible.

In addition to using veraPDF to perform basic PDF/UA-1
conformance checks, you should also have a quick look at
the accessibility tags generated by Typst. This can be done
on the service [showtags](https://texlive.net/showtags)
provided by the helpful people of The LaTeX
Project. On Microsoft Windows®︎, the program
[PAC]("https://pac.pdf-accessibility.org") is also
available. You do not have to go through the entire tag
tree, as it is mainly meant for screen reader consumption,
but it is a good idea to look up alternative texts of
images and equations (`Formula` elements) and check that
they seem sensible.

Once the output of both veraPDF and showtags (or
PAC) seems acceptable, you may submit your thesis to
[Trepo](https://trepo.tuni.fi/).

**Note:** if you are unable to produce an accessible
version of your thesis according to these PDF
accessibility checkers, you should attach the
source code of the thesis in a sensible reading
order to the Trepo submission! A separate [ZIP
archive](https://en.wikipedia.org/wiki/ZIP_(file_format))
is the best format for the source code submission, as such
a file can be opened easily on any system.

## Bugs and improvements

Please use the [**Issues page**][gitlab-issues], if you have found something in the template that needs fixing, or if you have a suggestion for improvement. You might need to [create a GitLab account][gitlab-sign-up] to be able to post issues. All feedback (preferably in English, Finnish works too) is most welcome!

**Note:** Please keep each issue concise and to the point. If you have a list of suggestions, please create a separate issue for each individual suggestion. This makes the issues easier to keep track of.

[gitlab-issues]: https://gitlab.com/tuni-official/thesis-templates/masters-thesis/-/issues
[gitlab-sign-up]: https://gitlab.com/users/sign_up

## Version history

See the [`CHANGELOG`](./CHANGELOG.md) file for what has been changed in the
past. The first commit to this Git repository corresponds to the tag `v2.0`,
so versions before that are not accessible.

## Contributing

To contribute to the project, read the guidelines in the file
[`CONTRIBUTING.md`](./CONTRIBUTING.md).
