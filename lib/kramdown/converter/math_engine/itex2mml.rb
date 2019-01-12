# -*- coding: utf-8; frozen_string_literal: true -*-
#
#--
# Copyright (C) 2019 Thomas Leitner <t_leitner@gmx.at>
#
# This file is part of kramdown-math-itex2mml which is licensed under the MIT.
#++
#

require 'kramdown/converter'
require 'itextomml'

module Kramdown::Converter #:nodoc:
  module MathEngine #:nodoc

    # Uses the Itex2MML library for converting math formulas to MathML.
    module Itex2MML

      VERSION = '1.0.0'

      def self.call(converter, el, opts)
        type = el.options[:category]
        parser = ::Itex2MML::Parser.new
        result = (type == :block ? parser.block_filter(el.value) : parser.inline_filter(el.value))

        attr = el.attr.dup
        attr.delete('xmlns')
        attr.delete('display')
        result.insert("<math".length, converter.html_attributes(attr))

        (type == :block ? "#{' ' * opts[:indent]}#{result}\n" : result)
      end

    end

  end

  add_math_engine(:itex2mml, MathEngine::Itex2MML)

end
