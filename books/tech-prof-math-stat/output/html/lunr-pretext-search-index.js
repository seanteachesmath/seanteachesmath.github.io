var ptx_lunr_search_style = "textbook";
var ptx_lunr_docs = [
{
  "id": "preface",
  "level": "1",
  "url": "preface.html",
  "type": "Preface",
  "number": "",
  "title": "Preface",
  "body": " Preface  I encourage you to use this class as an opportunity to treat computers as scientific tools. All computers are slightly different, so dont be afraid to look at the preferences of the program to add line numbers to code, enable syntax highlighting (so commands shine in bright colors), or to make fonts larger in your text editor , Stare at error messages and try to pick out key words, keep a close eye on the differences between { , [ , and ( and their partners, and the direction you make your slashes.  This version of the notes is written with PreTeXt, a latex -compatible, but accessibility-friendly, web-based platform.   Commonly encountered files.    .tex  main latex file    .pdf  desired output    .toc  contents information    .log  console report (errors, warnings)    .idx  related to index    .toc  contents information    .aux  used for contents     "
},
{
  "id": "file-table",
  "level": "2",
  "url": "preface.html#file-table",
  "type": "Table",
  "number": "0.0.1",
  "title": "Commonly encountered files.",
  "body": " Commonly encountered files.    .tex  main latex file    .pdf  desired output    .toc  contents information    .log  console report (errors, warnings)    .idx  related to index    .toc  contents information    .aux  used for contents    "
},
{
  "id": "preface-themes",
  "level": "1",
  "url": "preface-themes.html",
  "type": "Preface",
  "number": "",
  "title": "Themes",
  "body": " Themes  The themes of the course are typesetting, numerical calculations, and symbolic calculation. Towards the end of the semester, a goal of more open-ended problem solving should emerge. The hope is to use our tools to solve some of your more open-ended problems and learn how to diagnose and correct problems in coding.  "
},
{
  "id": "preface-workload",
  "level": "1",
  "url": "preface-workload.html",
  "type": "Preface",
  "number": "",
  "title": "Work",
  "body": " Work  Copies of your homework assignments will be collected here on separate pages. They will be listed in the order assigned, first latex , then R , then sage .  "
},
{
  "id": "introduction",
  "level": "1",
  "url": "introduction.html",
  "type": "Section",
  "number": "1.1",
  "title": "Introduction to <span class=\"latex-logo\">L<span class=\"A\">a<\/span>T<span class=\"E\">e<\/span>X<\/span>",
  "body": " Introduction to latex   Preview  Our plan is to introduce the main objectives of the class (i.e., syllabus and goals). We will test latex by opening a blank document and building up features based on classroom requests.    Review  We did some of our work using accounts on .  With software (in this case Overleaf) in hand, we opened a mostly blank document, set up the main structure of the document, and practiced typing text and compiling. In the main structure we set the document class, began the document, and added content to the preamble to generate title page information.  The following links will help you install the appropriate software for your computer. The interface TeXworks Software interface, TeXWorks on Windows OS (link)  OS , Windows computers additionally Windows users will need to install an engine either TeXLive (link)  Software engine , TexLive or MikTeX Software engine , MiKTeX (link) . You will want to plug your computer in, turn off any antivirus software (these are safe programs), and give yourself plenty of time for the downloads. Things are a bit easier on Mac OS, we use TeXshop Software interface , TeXshop that comes from the MacTeX Software engine , MacTeX installer on Mac OS (link)  OS , Mac .  There are plenty of other options, take some time to explore and find a configuration you enjoy using.  .    Student perspective  Anybody have any interesting observations to share? Going forward you will have an opportunity to share what you have taken away from a class day of your choosing.  You might highlight something interesting, surprising, confusing, annoying, or otherwise important.   "
}
]

var ptx_lunr_idx = lunr(function () {
  this.ref('id')
  this.field('title')
  this.field('body')

  ptx_lunr_docs.forEach(function (doc) {
    this.add(doc)
  }, this)
})
