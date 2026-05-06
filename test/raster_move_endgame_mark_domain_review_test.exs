defmodule RasterMoveEndgameMark.DomainReviewTest do
  use ExUnit.Case

  test "domain review lane" do
    item = %{signal: 65, slack: 54, drag: 19, confidence: 76}
    assert RasterMoveEndgameMark.DomainReview.score(item) == 203
    assert RasterMoveEndgameMark.DomainReview.lane(item) == "ship"
  end
end
