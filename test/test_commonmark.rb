# frozen_string_literal: true

require "test_helper"

class TestCommonmark < Minitest::Test
  HTML_COMMENT = /<!--.*?-->\s?/

  def setup
    @markdown = <<~MD
      Hi *there*!

      1. I am a numeric list.
      2. I continue the list.
      * Suddenly, an unordered list!
      * What fun!

      Okay, _enough_.

      | a   | b   |
      | --- | --- |
      | c   | d   |
    MD
  end

  def render_doc(doc)
    QiitaMarker.render_doc(doc, :DEFAULT, [:table])
  end

  def test_to_commonmark
    compare = render_doc(@markdown).to_commonmark

    assert_equal(
      render_doc(@markdown).to_html.squeeze(" ").gsub(HTML_COMMENT, ""),
      render_doc(compare).to_html.squeeze(" ").gsub(HTML_COMMENT, ""),
    )
  end
end
