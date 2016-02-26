defmodule HtmlSanitizeExTest do
  use ExUnit.Case

  test "strips all the tags" do
    input = "hello! <section><header><script>code!</script></header><p>hello <script>code!</script></p></section>"
    assert "hello! code!hello code!" == HtmlSanitizeEx.strip_tags(input)
  end

  test "It should conserve spaces between tags" do
    input ="<html>hello <b>world</b> <b>how</b> are you doing ?</html>"
    assert {"html", [], ["hello ", {"b", [], ["world"]}, " ", {"b", [], ["how"]}, " are you doing ?"]} = HtmlSanitizeEx.Parser.parse(input)
  end
end
