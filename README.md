# kramdown math engine for conversion to MathML

This is a converter for [kramdown](https://kramdown.gettalong.org) that uses
[itex2mml](https://golem.ph.utexas.edu/~distler/blog/itex2MML.html) to convert
math formulas to MathML.

Note: Until kramdown version 2.0.0 this math engine was part of the kramdown
distribution.


## Installation

~~~ruby
gem install kramdown-math-itex2mml
~~~


## Usage

~~~ruby
require 'kramdown'
require 'kramdown-math-itex2mml'

Kramdown::Document.new(text, math_engine: :itex2mml).to_html
~~~


## Development

Clone the git repository and you are good to go. You probably want to install
`rake` so that you can use the provided rake tasks.


## License

MIT - see the **COPYING** file.
